{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
//****************************************************************************//
// SISTEMA : REGRA                                                            //
// Alterações                                                                 //
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//  Rotina    : fcOutlookList5Items19Click
//  Autor     : Edilaine
//  Pendencia : WO24119
//  Descrição : Criar Formula PAGAPECULIOSALDADO e ajustar NOVOCALCPENSAOSALDADA
//  Data      : 04/08/2025
//------------------------------------------------------------------------------
//  Rotina    : fcOutlookList5Items17Click
//  Autor     : Edilaine
//  Pendencia : WO18367
//  Descrição : Criar Formula NOVOCALCPENSAOSALDADA
//  Data      : 28/02/2025
//------------------------------------------------------------------------------
//  Rotina    : fcOutlookBar1OutlookList10Items2Click
//  Autor     : Edilaine
//  Pendencia : SIG131430
//  Descrição : Formula Correcao com arredondamento casas decimais
//  Data      : 10/05/2023
//------------------------------------------------------------------------------
//  Autor     : Ediaine
//  Pendencia : SIG115844-115954
//  Descrição : Criar Formula MOLESTIAGRAVE
//  Data      : 18/05/2021
//------------------------------------------------------------------------------
//  Autor     : Ediaine
//  Pendencia : SIG 114117-114326
//  Descrição : Criar Formula EXISTERESERVA
//  Data      : 15/04/2021
//------------------------------------------------------------------------------
//  Autor     : Andre Imakawa
//  Pendencia : SIG 103583
//  Descrição : Criar Formula PARAMPESSOADTFIM
//  Data      : 28/10/2020
//------------------------------------------------------------------------------
//  Autor     : Andre Imakawa
//  Pendencia : SIG 99564
//  Descrição : Alteração do nome da Formula e criação do novo parametro.
//  Data      : 22/04/2020
//------------------------------------------------------------------------------
//  Autor     : Ewerton Beltramini
//  Pendencia : SIG99274
//  Descrição : Criação da formula MESANTECIPAABONO
//  Data      : 24/03/2020
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//  Autor     : Fábio Sampaio
//  Pendencia : SIG85462
//  Descrição : Criação da formula BUSCAMINFREQCAIXA
//  Data      : 02/05/2019
//------------------------------------------------------------------------------
//  Autor     : William Moreira da Silva
//  Pendencia : SOL 42298
//  Descrição : Criação da formula VALORRUBTMPDESC
//  Data      : 21/03/2017
//------------------------------------------------------------------------------
//  Autor     : William Moreira da Silva
//  Pendencia : SOL 40538
//  Descrição : Criação de formulas VALORBENEFICIOINICIAL e VALORBENEFICIOSALDADO
//  Data      : 03/03/2017
//------------------------------------------------------------------------------
//  Autor     : Peterson Victor
//  Pendencia : SOL 262534 PPM 1089618
//  Descrição : Criação da formula VWFORMRUBJUD
//  Data      : 31/10/2012
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia : SOL 193327 Kintana  1839657
//  Descrição : Criação da formula VWFORMRUBJUD
//  Data      : 31/10/2012
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia : SOL 136384/10362 Kintana 1712325
//  Descrição : Criação da formula VALORSRBNP
//  Data      : 09/07/2012
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia : SOL 136384/11583 Kintana 1797827
//  Descrição : ajuste na Formula BUSCADETCALCULO.
//  Data      : 19/09/2012
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia :  SOL 136384/11302 Kintana 1786550
//  Descrição : Criação da formula VALORBENEFICIOINSS
//  Data      : 05/09/2012
//------------------------------------------------------------------------------
//  Autor     : Otacilio Aquino
//  Pendencia : SOL 184600 Kintana 1729037
//  Descrição : Ajuste no evento "bbtnConfirmarClick"
//  Data      : 16/07/2012
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia : SOL 136384/10342 Kintana 1712175
//  Descrição : Criação da formula EXCLUIDETCALCULO
//  Data      : 03/07/2012
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia : SOL 136384/10262 Kintana 1688458
//  Descrição : Alteração da fórmula ADICIONALPERC
//  Data      : 25/06/2012
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia : SOL 136384/10042 Kintana 1688458
//  Descrição : Criação da formula MAIORCFCOD
//  Data      : 18/06/2012
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Rotina    : FUNCAOCONFIANCA
//  Pendencia : SOL 136384/10002 Kintana 1685939
//  Descrição : Criação da fórmula FUNCAOCONFIANCA
//  Data      : 18/06/2012
//------------------------------------------------------------------------------
//  Autor     : André Oliveira
//  Pendencia : SOL 136384/9641 Kintana 1664442
//  Descrição : Criação da formula DUPLICADETCALCULOTITULAR
//  Data      : 18/06/2012
//------------------------------------------------------------------------------
//  Autor     : Vinicius Ferreira
//  Pendencia : SOL 153972 KINTANA 1169147
//  Descrição : Criação da fórmula QTDDIASCFPESSOA
//  Data      : 05/04/2012
//------------------------------------------------------------------------------
//  Autor     : Eraldo Luis da Silva
//  Pendencia : SOL 159196 KINTANA 1302968 INICI
//  Descrição : Criação da fórmula ADICIONALPERC
//  Data      : 29/01/2012
//------------------------------------------------------------------------------
//  Autor     : Fernando Xavier
//  Rotina    : VALORPECULIO
//  Pendencia : SOL 136385/7221 Kintana 1512983
//  Descrição : Criação da fórmula VALORPECULIO
//  Autor     : Fanuel Junior
//  Rotina    : VALORESBENEFICIO
//  Pendencia : SOL 136385.7221 Kintana 1250247
//  Descrição : Criação da fórmula VALORESBENEFICIO
//------------------------------------------------------------------------------
//  Autor     : BRUNO AZEVEDO
//  Pendencia : SOL 147630-6881 KINTANA 1466979
//  Descrição : Criação da fórmula RUBRINDIV13.
//  Data      : 26/10/2011
//------------------------------------------------------------------------------
//  Autor     : Fanuel Junior
//  Rotina    : COMPARAVALBENEF
//  Pendencia : SOL 157238 Kintana 1250247
//  Descrição : Criação da fórmula COMPARAVALBENEF
//******************************************************************************
//  Rotina    : VALORBENEFICIO
//  Pendencia : SOL 126535 kintana 671960
//  Descrição : A fórmula VALORBENEFICIO está buscando o valor do campo VALORTOTAL
//  na BENEFBFCIARIO, entretanto este não é o campo que reflete o valor do benefício
//  do associado. Alterar a regra para que seja buscado o valor do campo VALORATUAL.
//------------------------------------------------------------------------------
//  Autor     : Renato Visoni
//  Rotina    : BUSCAOPCAOBENEF
//  Pendencia : SOL 122084 KINTANA 595029
//  Descrição : Criação da formula BUSCAOPCAOBENEF
//------------------------------------------------------------------------------
//  Autor     : Renato Visoni
//  Rotina    : VALORBENEFICIO
//  Pendencia : SOL 114098 KINTANA 531664
//  Descrição : Criação da formula VALORBENEFICIO
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : VLRBENEFICIO
//  Data       : 03/01/2008
//  Descrição  : 27173 - Novo parametro opcional para indicar o IDPESSOA da
//                       consulta interna
//------------------------------------------------------------------------------
//  Autor      : Paulo Ramos
//  Rotina     : DIFMESES
//  Data       : 28/11/2007
//  Descrição  : 26958 - altera texto descritivo da fórmula de "anos" para "meses"
//------------------------------------------------------------------------------
//  Autor      : Paulo Ramos
//  Rotina     : ADICIONALDIA, ADICIONALMES, NUMDIASADICIONAL, NUMDIASPERCADICIONAL
//  Data       : 03/08/2007
//  Descrição  : 25796 - Incluir opção de adicional compensatório no parâmetro
//               TIPOADICIONAL das fórmulas. Equalizei outros parâmetros que
//               eventualmente não estavam contemplados.
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : INDICE
//  Data       : 17/07/2007
//  Descrição  : 25782 - Novo parametro para retornar a DATA da cotação
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : SOMACONTRIB
//  Data       : 27/03/2007
//  Descrição  : 24913 - Novo parametro MESCOBRANCA
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : VLRBENEFICIO
//  Data       : 21/02/2007
//  Descrição  : 24203 - Opção para escolher MES a pesquisar (COBRANÇA ou REFERENCIA)
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : POSSUIMIGRACAO
//  Data       : 26/10/2007
//  Descrição  : 24040 - Opção para Pesquisar na EVENTOSPREV
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 11/10/2006
//  Rotina     : VERCONCEDIDO
//  Descrição  : Novo parametro VERCONCEDIDO
//  Data       : 09/09/2006
//  Rotina     : VLRBENEFICIO
//  Descrição  : Novo parametro SOMENTEVALORESAPAGAR
//  Rotina     : RUBRINDIV
//  Data       : 05/10/2006
//  Descrição  : Novos parametros para a fórmula RUBRINDIV  - Pendência 23460
//------------------------------------------------------------------------------
//  Autor      : Claudio Faria
//  Rotina     : CTVA
//  Data       : 05/10/2006
//  Descrição  : Inclusão da fórmula CTVA - Pendência 23055
//------------------------------------------------------------------------------
//  Autor      : Claudio Faria
//  Rotina     : VALORCF e VLRCF
//  Data       : 03/10/2006
//  Descrição  : Alteração no Select da fórmulas e inclusão de novos parametros - Pendência 23054
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : VLRBENEFICIO
//  Data       : 03/09/2006
//  Descrição  : Novo parametro IDPLANOPREV, FONTEPAGADORA
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : CFPESSOA
//  Data       : 23/08/2006
//  Descrição  : Novo parametro indicando se trará somente CF ativos (DATAFINAL nula) 
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 27/06/2006
//  Descrição  : Inclusão das fórmulas GRAVAMEMATUARIAL, TABSERV, TABPENSAO
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 10/05/2006
//  Descrição  : Inclusão da fórmula RUBREEMBINSS
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 27/01/2006
//  Descrição  : Acerto no help da formula TEMPOPATRO
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 23/01/2006
//  Descrição  : Alteração na formula VALORRESERVA, possibilidade de passar uma lista de reservas.
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 19/12/2005
//  Descrição  : Nova formula para somar conjuntos de rubrica SOMACONJUNTORUBRICA
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 07/12/2005
//  Descrição  : Alteração na formula VLRBENEFICIO, novo parametro.
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 05/12/2005
//  Descrição  : Alteração na formula VALORRESERVA, novo parametro.
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 13/09/2005
//  Descrição  : Nova formula para buscar a Data do Evento na EVENTOSPREV 
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 02/08/2005
//  Descrição  : Barrar atualizações em formulas que estão publicadas 
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 12/07/2005
//  Descrição  : Acertos visuais
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 06/2005
//  Descrição  : Nova formula ULTDATACONTRIB
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 05/04/2005
//  Descrição  : Novo parametro na formula PARAMPESSOA
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 07/01/2005
//  Descrição  : Novo parametro na formula VLRREFRUBMES 
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Data       : 26/11/2004
//  Descrição  : Reformulação geral na disposição das formulas
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : SOMAHSTBENEF
//  Data       : 23/11/2004
//  Descrição  : Nova FORMULA para Somar a HSTBENEFBFCIARIO
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : SOMABENEFICIOS
//  Data       : 22/11/2004
//  Descrição  : Novo parametro para pesquisar na HISTRUBSAL ou HSTBENEFBFCIARIO 
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : SOMACONTRIB
//  Data       : 19/11/2004
//  Descrição  : Novo parametro para utilizar ou não filtro por PLANOPATRO
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : CFPESSOA - SOMACONTRIB
//  Data       : 26/08/2004
//  Descrição  : Acertos no help
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Pendência  : 17335
//  Rotina     : CmeCadastroConfirma
//  Data       : 09.08.2004
//  Descricao  : atualizar dados apos a confirmacao 
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Pendência  : ----
//  Rotina     : FORMULA NOVA -> IMOBILIARIO -> TOTALIZAINDICADOR
//  Data       : 05.08.2004
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Pendência  : 17222
//  Rotina     : PR2
//  Data       : 05.08.2004
//  Descrição  : Acerto no help da formula
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : POSSUIMIGRACAO
//  Data       : 21/07/2004
//  Descrição  : Criação da Formula
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//  Autor      : David
//  Pendência  : 16740
//  Rotina     : MED
//  Data       : 16/07/2004
//  Descrição  : Acerto no help da formula
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : QTDMINUTOS
//  Data       : 10/02/2004
//  Descrição  : Acerto no help da formula
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : VALORCF
//  Data       : 14.01.2003
//  Descrição  : Criação do parâmetro modofunção
//  Pendencia  : -
//------------------------------------------------------------------------------
//  Autor      : David
//  Rotina     : Help da OPPATRO
//  Data       : 11.12.2003
//  Descrição  : Alterado help da fórmula OPPATRO para contemplar a inclusão dos
//               campos VALORBASE4, VALORBASE5 e VALORBASE6.
//  Pendencia  : 15598
//------------------------------------------------------------------------------


Unit FCadFormulaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  wwdblook, Mask, wwdbedit, uCtrlFormula, uCtrlGrpFormula, Provider,
  DBTables, fcOutlookList, fcButton, fcImgBtn, fcShapeBtn, fcClearPanel,
  fcButtonGroup, fcOutlookBar, uCtrlPadroes, 
  uBiblioteca, uCmTypes;

type
  TFrmCadFormulaMT = class(TFrmCadastroMT)
    CdsIDFORMULA: TFloatField;
    CdsCODGRUPOFORMULA: TStringField;
    CdsEXPRESSAOFORMULA: TStringField;
    CdsDESCRICAOFORMULA: TStringField;
    CdsEXPRESSAOREAL: TStringField;
    DsGrpFormula: TwwDataSource;
    CdsGrpFormula: TCMClientDataSet;
    Label1: TLabel;
    CdsGrpFormulaCODGRUPOFORMULA: TStringField;
    CdsGrpFormulaDESCGRUPOFORMULA: TStringField;
    Panel4: TPanel;
    Panel3: TPanel;
    PnlFundoB: TPanel;
    memDesc: TMemo;
    Toolbar972: TToolbar97;
    sbtnCopiar: TToolbarButton97;

    BtApagar: TSpeedButton;
    BtApagarUltimo: TSpeedButton;
    BtPar1: TSpeedButton;
    BtPar2: TSpeedButton;
    BtSomar: TSpeedButton;
    BtDiminuir: TSpeedButton;
    BtMultiplicar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    BtElevar: TSpeedButton;
    BtRaiz: TSpeedButton;
    fcOutlookBar1: TfcOutlookBar;
    fcShapeBtn1: TfcShapeBtn;
    fcOutlookBar1fcShapeBtn6: TfcShapeBtn;
    fcShapeBtn3: TfcShapeBtn;
    fcShapeBtn4: TfcShapeBtn;
    fcOutlookBar1fcShapeBtn5: TfcShapeBtn;
    fcOutlookBar1fcShapeBtn2: TfcShapeBtn;
    fcShapeBtn2: TfcShapeBtn;
    fcShapeBtn5: TfcShapeBtn;
    fcOutlookBar1fcShapeBtn4: TfcShapeBtn;
    fcOutlookBar1fcShapeBtn3: TfcShapeBtn;
    fcShapeBtn6: TfcShapeBtn;
    fcShapeBtn7: TfcShapeBtn;
    fcShapeBtn8: TfcShapeBtn;
    fcShapeBtn10: TfcShapeBtn;
    fcShapeBtn11: TfcShapeBtn;
    fcShapeBtn12: TfcShapeBtn;
    fcOutlookBar1fcShapeBtn1: TfcShapeBtn;
    fcOutlookList1: TfcOutlookList;
    fcOutlookBar1OutlookList12: TfcOutlookList;
    fcOutlookList3: TfcOutlookList;
    fcOutlookList4: TfcOutlookList;
    fcOutlookBar1OutlookList11: TfcOutlookList;
    fcOutlookBar1OutlookList8: TfcOutlookList;
    fcOutlookList2: TfcOutlookList;
    fcOutlookList5: TfcOutlookList;
    fcOutlookBar1OutlookList10: TfcOutlookList;
    fcOutlookBar1OutlookList9: TfcOutlookList;
    fcOutlookList6: TfcOutlookList;
    fcOutlookList7: TfcOutlookList;
    fcOutlookList8: TfcOutlookList;
    fcOutlookList10: TfcOutlookList;
    fcOutlookList11: TfcOutlookList;
    fcOutlookList12: TfcOutlookList;
    ATUARL: TfcOutlookList;
    Panel2: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    EdDescricao: TwwDBEdit;
    DbLkcGrpFormula: TwwDBLookupCombo;
    dedMemo: TwwDBEdit;
    DBEdtIDFormula: TwwDBEdit;
    BtBuscaVariavel: TBitBtn;
    BtFormulario: TBitBtn;
    Label5: TLabel;
    BtArroba: TSpeedButton;
    BtTralha: TSpeedButton;
    CdsAux: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure BtBuscaVariavelClick(Sender: TObject);
    procedure fcLstNumerosItems7Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcLstNumerosItems8Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure BtApagarClick(Sender: TObject);
    procedure btApagarUltimoClick(Sender: TObject);
    procedure fcOutlookBar1OutlookList2Items14Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure BtFormularioClick(Sender: TObject);
    procedure fcOpcoesChange(ButtonGroup: TfcCustomButtonGroup;
      OldSelected, Selected: TfcButtonGroupItem);
    procedure fcOutlookBar1OutlookList2ItemClick(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure fcOutlookBar1OutlookList3Items7Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList2Items11Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList1Items9Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList1Items10Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList1Items11Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOpcoesOutlookList3Items4Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure sbtnCopiarClick(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtPar1Click(Sender: TObject);
    procedure BtPar2Click(Sender: TObject);
    procedure BtSomarClick(Sender: TObject);
    procedure BtDiminuirClick(Sender: TObject);
    procedure BtMultiplicarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BtElevarClick(Sender: TObject);
    procedure BtRaizClick(Sender: TObject);
    procedure fcOutlookBar1OutlookList12Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList12Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList12Items2Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList12Items3Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList11Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList11Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList8Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList8Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList8Items2Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList8Items3Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList8Items4Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookList2Items14Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList2Items15Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList2Items16Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList2Items0Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList2Items1Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList2Items2Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList2Items3Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList2Items6Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList2Items7Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList2Items8Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList2Items9Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList2Items10Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList2Items11Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList2Items12Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList5Items0Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList5Items1Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList5Items2Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList5Items3Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList5Items4Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList5Items5Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList5Items6Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList5Items7Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList5Items8Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList5Items9Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList5Items10Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList10Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList10Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList10Items2Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList9Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList9Items1Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList9Items2Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList9Items3Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList9Items4Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList9Items5Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList9Items6Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookList6Items0Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList6Items1Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList6Items2Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList6Items3Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList6Items4Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList6Items5Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList6Items6Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList6Items7Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList6Items8Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList6Items9Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList6Items10Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList6Items11Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList6Items12Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList6Items13Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList6Items14Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items21Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items1Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items2Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items3Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items4Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items5Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items6Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items7Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items8Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items9Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items10Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items11Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items12Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items13Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items14Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items15Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items16Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items17Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items18Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items19Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList10Items0Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList10Items1Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList10Items2Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList10Items3Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList10Items4Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList11Items0Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList12Items0Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList1Items0Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList1Items1Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList1Items2Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList1Items3Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList1Items4Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList1Items5Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList1Items6Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList3Items0Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList3Items1Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList3Items2Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList3Items3Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList3Items4Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList4Items0Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList4Items1Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList4Items2Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList4Items3Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList4Items4Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList4Items6Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList4Items5Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList4Items7Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList4Items8Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList4Items9Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList4Items10Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList4Items11Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList4Items12Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList4Items13Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList4Items14Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList4Items15Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList4Items16Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList4Items17Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList4Items18Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList4Items19Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList4Items20Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList2Items13Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items0Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure ATUARLItems0Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure ATUARLItems1Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList1Items7Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList1Items8Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList7Items0Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList7Items1Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items20Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList9Items7Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure BtArrobaClick(Sender: TObject);
    procedure BtTralhaClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure fcOutlookList10Items5Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList11Items1Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList11Items2Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList6Items15Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList6Items16Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure ATUARLItems2Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure ATUARLItems3Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure ATUARLItems4Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items22Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList2Items5Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList5Items11Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList5Items12Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
   procedure fcOutlookList10Items6Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList5Items13Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList6Items17Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList2Items17Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList5Items14Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList5Items15Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items23Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items24Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items25Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items26Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items27Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items28Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items29Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList8Items30Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList5Items16Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList9Items8Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookList6Items18Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookBar1OutlookList9Items9Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
    procedure fcOutlookList6Items19Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList2Items18Click(OutlookList: TfcCustomOutlookList; // Andre Imakawa - SIG 103583
      Item: TfcOutlookListItem);
    procedure fcOutlookList2Items19Click(OutlookList: TfcCustomOutlookList;  //edilaine SIG114117-114326
      Item: TfcOutlookListItem);
    procedure fcOutlookList2Items20Click(OutlookList: TfcCustomOutlookList;  //edilaine SIG115844-115954
      Item: TfcOutlookListItem);
    procedure fcOutlookList5Items17Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList5Items18Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
    procedure fcOutlookList5Items19Click(OutlookList: TfcCustomOutlookList;
      Item: TfcOutlookListItem);
  private
    { Private declarations }
    UltCar : Char;
    ContParent   : Integer;
    bTrunc, bRound, bDifMes, bDifAno, bDifDia : Boolean;

    CtrlFormula : TCtrlFormula;
    CtrlGrpFormula : TCtrlGrpFormula;

    Function PosCharEsp(Dado : String) : LongInt;
    Function TiraTodosBrancos(Value: String): String;

    Function Publicada : Boolean;


  public
    { Public declarations }
    sIdFormula : String;
  end;

var
  FrmCadFormulaMT: TFrmCadFormulaMT;

implementation

Uses uSistema, dBaseDados, fConsulta, UCriaEstrutura, uMensErro, fAguarde;

{$R *.DFM}

procedure TFrmCadFormulaMT.FormCreate(Sender: TObject);
begin
  inherited;
  { Cria DataSet Local }
  CtrlFormula:= TCtrlFormula.Create;
  CtrlFormula.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                         Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                         Nil );
  Cds.CreateDataSet;
  { Cria DataSet do grupo de Regras }
  CtrlGrpFormula := TCtrlGrpFormula.Create;
  CtrlGrpFormula.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                            Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                            Nil );
  CdsGrpFormula.Data := CtrlGrpFormula.ListaGrpFormula;

end;

procedure TFrmCadFormulaMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
    Cds.Data := CtrlFormula.SelecionaFormula( StrToInt(MontaSelect.ValoresChave[0]) );
end;

procedure TFrmCadFormulaMT.CmeCadastroConfirma(Sender: TObject);
Var
  bGravouLog : Boolean;
  sTextoLog : String;
begin
  inherited;

  {-----------------------}
  { Gravar log de operação}
  If cmecadastro.Operacao = OpInserir then
    sTextoLog := 'Inclusão de Fórmula '+DBEdtIDFormula.Text
  Else If cmecadastro.Operacao = OpAlterar then
    sTextoLog := 'Manutenção da Fórmula '+DBEdtIDFormula.Text
  Else If cmecadastro.Operacao = OpApagar then
    sTextoLog := 'Exclusão da Fórmula '+sIdFormula;

  If Not GravaLogOperacao(sTextoLog) Then Begin
    Raise Exception.Create( 'Erro ao gravar o log da Operação ' );
    Exit;
  End;
  {-----------------------------------}

  { Transfere dados do Forumlário para o Control e confirma }
  CtrlFormula.CdsFormula.Data := Cds.Data;
  CtrlFormula.GravaFormula;

 { Refaz pesquisa com novos Dados }
  if MontaSelect.RetornouValor then
    Cds.Data := CtrlFormula.SelecionaFormula( StrToInt(MontaSelect.ValoresChave[0]) );

end;

procedure TFrmCadFormulaMT.BtBuscaVariavelClick(Sender: TObject);
begin
  inherited;
  xTipoTela := 4;
  frmConsulta.Showmodal;
  if xTipo = 'V' then
     xId := '@'+ xId;
  dedMemo.Text := dedMemo.Text + xId;
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  dedMemo.SetFocus;
  dedMemo.SelStart := Length(dedMemo.Text);
end;

procedure TFrmCadFormulaMT.BtApagarClick(Sender: TObject);
begin
  inherited;
  memDesc.Lines.Clear;
  ContParent := 0 ;
  bDifDia := False;
  bDifMes := False;
  bDifAno := False;
  bRound := False;
  bTrunc := False;
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := '';
end;

procedure TFrmCadFormulaMT.bbtnConfirmarClick(Sender: TObject);
var
  sPalavra, sFormulaP, sFormula     : String;
  Letra : string[1];
  vAux : LongInt;
begin
  If (Trim(EdDESCRICAO.Text) = '') Or  (DbLkcGrpFormula.Text = '') Then Begin
    MsgDlg('Faltam Informações!','Erro',mterror, [mbok],0);
    Exit;
  End;

  frmAguarde.Mostra('Tratando dados ...');
  frmAguarde.Refresh;

  If (Pos('BUSCADETCALCULO',Cds.FieldbyName('EXPRESSAOFORMULA').AsString) > 0) or // SOL 136384/9641 Kintana 1664442
     (Pos('DUPLICADETCALCULOTITULAR',Cds.FieldbyName('EXPRESSAOFORMULA').AsString) > 0) or // SOL 136384/9641 Kintana 1664442
     (Pos('EXCLUIDETCALCULO',Cds.FieldbyName('EXPRESSAOFORMULA').AsString) > 0) or // SOL 136384/10342 Kintana 1712175
     (Pos('FUNCAOCONFIANCA',Cds.FieldbyName('EXPRESSAOFORMULA').AsString) > 0) Then // SOL 136384/9641 Kintana 1664442
  //If Pos('BUSCADETCALCULO',Cds.FieldbyName('EXPRESSAOFORMULA').AsString) = 0 Then
    sformula := Trim(Cds.FieldbyName('EXPRESSAOFORMULA').AsString)
  Else
    sFormula := Trim(TiraTodosBrancos(Cds.FieldbyName('EXPRESSAOFORMULA').AsString)); // SOL 184600 Kintana 1729037 - Otacilio

  sPalavra:='';

  Cds.FieldByName('EXPRESSAOREAL').AsString := sFormula;

  frmAguarde.Mostra('Gravando fórmula ...');
  frmAguarde.Refresh;

  FrmAguarde.Apaga;

  Inherited;
end;

procedure TFrmCadFormulaMT.btApagarUltimoClick(Sender: TObject);
var
   i, Tam : LongInt;
begin
  inherited;
  memDesc.Lines.Clear;
  Tam := Length(Cds.fieldbyname('EXPRESSAOFORMULA').AsString);
  i := PosCharEsp(Cds.fieldbyname('EXPRESSAOFORMULA').AsString);
  if i = Tam then
     Cds.fieldbyname('EXPRESSAOFORMULA').AsString := Copy(Cds.fieldbyname('EXPRESSAOFORMULA').AsString,1,Tam-1)
  else
      if i = 0 then
         Cds.fieldbyname('EXPRESSAOFORMULA').AsString := ''
      else
          Cds.fieldbyname('EXPRESSAOFORMULA').AsString := Copy(Cds.fieldbyname('EXPRESSAOFORMULA').AsString,1,i);
end;

function TFrmCadFormulaMT.PosCharEsp(Dado: String): LongInt;
Var
  I, Tam : LongInt;
begin
  Result := 0;
  Tam := Length(Dado);
  for i := Tam downto 1 do begin
    if (Copy(Dado,i,1) = ',') or (Copy(Dado,i,1) = ')') or (Copy(Dado,i,1) = '(') or
       (Copy(Dado,i,1) = '[') or (Copy(Dado,i,1) = ']') or (Copy(Dado,i,1) = '}') or
       (Copy(Dado,i,1) = '/') or (Copy(Dado,i,1) = '*') or (Copy(Dado,i,1) = '+') or
       (Copy(Dado,i,1) = '-') or (Copy(Dado,i,1) = '{') or (Copy(Dado,i,1) = '"')
    then begin
      Result := I;
      Break
    end;
  end;

end;

procedure TFrmCadFormulaMT.BtFormularioClick(Sender: TObject);
begin
  inherited;
  application.createform(TfrmCriaEstrutura,frmCriaEstrutura);
  FrmCriaEstrutura.ShowModal;
end;

function TFrmCadFormulaMT.TiraTodosBrancos(Value: String): String;
Var
  I : Integer;
begin
  I := Pos(' ',Value);
  While I <> 0 Do Begin
    Delete(Value,I,1);
    I := Pos(' ',Value);
  end;
  Result := Value;
end;

{ Copia de Fórmula }
procedure TFrmCadFormulaMT.sbtnCopiarClick(Sender: TObject);
begin
  inherited;
  if (Cds.IsEmpty) then begin
     MsgDlg('Não existe Fórmula para ser copiada.','Erro',mtConfirmation,[mbOk,mbHelp],0);
     sbtnCopiar.Down := False;
     Exit;
  end;
  if (Cds.State in [dsEdit, dsInsert]) then begin
     MsgDlg('Para copiar esta Fórmula confirme ou cancele a operação.','Erro',mtConfirmation,[mbOk,mbHelp],0);
     sbtnCopiar.Down := False;
     Exit;
  end;
  if MsgDlg('Deseja copiar esta Fórmula?','ATENÇÃO',mtConfirmation,[mbyes,mbno],0)=mrNo then
     Exit;

  CtrlFormula.CdsFormula.Data := Cds.Data;
  CtrlFormula.CopiaFormula(Cds.FieldByName('IDFORMULA').AsInteger);

  msgdlg('Cópia OK','Mensagem',mtInformation,[mbok],0);
  sbtnCopiar.Down := False;

end; { Copia de Fórmula }

{==============================================================================}
{ Fórmulas                                                                     }

procedure TFrmCadFormulaMT.fcOpcoesChange(
  ButtonGroup: TfcCustomButtonGroup; OldSelected,
  Selected: TfcButtonGroupItem);
begin
  inherited;
  BtFormulario.Visible := False;
end;

procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList2ItemClick(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  BtFormulario.Visible := False;
end;



{ ( }
procedure TFrmCadFormulaMT.fcLstNumerosItems7Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
end;

{ ) }
procedure TFrmCadFormulaMT.fcLstNumerosItems8Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  Dec(ContParent);
  dedMemo.Text := dedMemo.Text + ')';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Inclui parênteses ")".                                                          ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  )                                                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  )                                                                               ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

{ TRUNC }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList2Items14Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
end;

{ DIAFINAL }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList3Items7Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'DIAFINAL(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);

  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
     Add('OBJETIVO:');
     Add('  Retornar a data progredida para o ultimo dia do mês da data.                  ');
     Add('                                                                                ');
     Add('--------------------------------------------------------------------------------');
     Add('EXEMPLO:                                                                        ');
     Add('  DIAFINAL(DATA, TIPODATA)                                                      ');
     Add('                                                                                ');
     Add('  DIAFINAL(20/07/2000, 0) RETORNA - 31/07/2000                                  ');
     Add('                                                                                ');
     Add('--------------------------------------------------------------------------------');
     Add('DESCRIÇÃO DOS PARAMETROS:                                                       ');
     Add('  - DATA                                                                        ');
     Add('    Data a ser processada, no formato DD/MM/YYYY.                               ');
     Add('                                                                                ');
     Add('  - TIPODATA                                                                    ');
     Add('    Tipo de processamento a ser feito.                                          ');
     Add('      Caso 0/Nulo - Mês corrido.                                                ');
     Add('           1      - Mês Comercial (30 dias)                                     ');
   End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;




{ ROUND }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList2Items11Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
end;


{ PERCENTUALFUNCAO }
procedure TFrmCadFormulaMT.fcOpcoesOutlookList1Items9Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'PERCENTUALFUNCAO('; 
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retornar o percentual de função que o participante possuia em uma determinada   ');
    Add('  data.                                                                           ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  PERCENTUALFUNCAO(01/02/2002, 01002, F)                                          ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  PERCENTUALFUNCAO(DATAREF, COD_FUNCAO, TIPO)                                     ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add(' - DATAREF                                                                        ');
    Add('   Data na qual se deseja verificar o percentual.                                 ');
    Add(' - COD_FUNCAO                                                                     ');
    Add('   Código da função desejada.                                                     ');
    Add(' - TIPO                                                                           ');
    Add('   F - Função (default)                                                           ');
    Add('   A - Adicional Compensatório                                                    ');
  end;

end;

{ TOTALCFMES }
procedure TFrmCadFormulaMT.fcOpcoesOutlookList1Items10Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
// Inclui Formula nos Campos
  dEdMemo.Text := dEdMemo.Text + 'TOTALCFMES(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dEdMemo.Text;
  Inc(ContParent);
// Mostra DESCRIÇÃO da Formula
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
     Add('OBJETIVO:                                                                        ');
     Add('  Retornar a soma dos valores de todos os CARGOS/FUNCAO em um determinado mês.   ');
     Add('---------------------------------------------------------------------------------');
     Add('SINTAXE:                                                                         ');
     Add('  TOTALCFMES(TIPO,DATAREF)                                                       ');
     Add('---------------------------------------------------------------------------------');
     Add('EXEMPLO:                                                                         ');
     Add('  TOTALCFMES(C,12/01/2000)                                                       ');
     Add('    TIPO: CARGO, DATA DE referência: 12/01/2000                                  ');
     Add('---------------------------------------------------------------------------------');
     Add('DESCRIÇÃO DOS PARAMETROS:                                                        ');
     Add('  - TIPO (C OU F)                                                                ');
     Add('    Indica se a Fórmula processará CARGOS (C) ou FUNÇÕES (F).                    ');
     Add('  - DATAREF                                                                      ');
     Add('    Data de referência, formato DD/MM/YYYY.                                      ');
     Add('      Obs.: Fórmula utilizará o ano/mês desta data.                              ');
     Add('---------------------------------------------------------------------------------');
     Add('OBSERVAÇÃO:                                                                      ');
     Add('  O valor do CARGO/FUNÇÃO nesta fórmula é buscado da tabela de CARGOS/FUNÇÃO     ');
     Add('  e NÃO do HISTÓRICO FUNCIONAL.                                                  ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end;

procedure TFrmCadFormulaMT.sbtnApagarClick(Sender: TObject);
begin
  If Publicada Then Begin
    sbtnApagar.Down := False;
    Exit;
  End;

  sIdFormula := DBEdtIDFormula.Text;
  inherited;
end;

procedure TFrmCadFormulaMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  EdDescricao.SetFocus;
end;

procedure TFrmCadFormulaMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  EdDescricao.SetFocus;
end;

procedure TFrmCadFormulaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(CtrlFormula);
  inherited;
end;

procedure TFrmCadFormulaMT.BtPar1Click(Sender: TObject);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + '(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  dedMemo.SelStart := Length(dedMemo.Text);
end;

procedure TFrmCadFormulaMT.BtPar2Click(Sender: TObject);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + ')';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  dedMemo.SelStart := Length(dedMemo.Text);
end;

procedure TFrmCadFormulaMT.BtSomarClick(Sender: TObject);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + '+';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  dedMemo.SelStart := Length(dedMemo.Text);
end;

procedure TFrmCadFormulaMT.BtDiminuirClick(Sender: TObject);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + '-';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  dedMemo.SelStart := Length(dedMemo.Text);
end;

procedure TFrmCadFormulaMT.BtMultiplicarClick(Sender: TObject);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + '*';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  dedMemo.SelStart := Length(dedMemo.Text);
end;

procedure TFrmCadFormulaMT.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + '/';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  dedMemo.SelStart := Length(dedMemo.Text);
end;

procedure TFrmCadFormulaMT.BtElevarClick(Sender: TObject);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + '^';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  dedMemo.SelStart := Length(dedMemo.Text);
end;

procedure TFrmCadFormulaMT.BtRaizClick(Sender: TObject);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'SQRT(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  dedMemo.SelStart := Length(dedMemo.Text);
end;

{==============================================================================}

{ ALINHA }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList12Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'ALINHA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Alinhar textos.                                                                 ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  ALINHA(TEXTO,TAMANHO,POSIÇÃO)                                                   ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  ALINHA(''TEXTO'',10,D) = ''     TEXTO''                                         ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - TEXTO                                                                         ');
    Add('    Texto a ser alinhado.                                                         ');
    Add('  - TAMANHO                                                                       ');
    Add('    Tamanho do texto resultante.                                                  ');
    Add('  - POSIÇÃO                                                                       ');
    Add('    Posição d texto a ser alinhado no texto resultante.                           ');
    Add('      E - Esquerda                                                                ');
    Add('      C - Centro                                                                  ');
    Add('      D - Direita                                                                 ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { ALINHA }

{ CONCAT }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList12Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'CONCAT(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Concatena textos.                                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  CONCAT(TEXTO1, TEXT2)                                                           ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  CONCAT(PRIMEIRA, PALAVRA) = PRIMEIRAPALAVRA                                     ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - TEXTOn                                                                        ');
    Add('    Textos a concatenar.                                                          ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { CONCAT }

{ EXTRAIR }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList12Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'EXTRAIR(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  ContParent := 0;
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna Trecho do texto informado.                                              ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  EXTRAIR(TEXTO,INICIO,FIM)                                                       ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  EXTRAIR(TEXTO,1,3) = TEX                                                        ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - TEXTO                                                                         ');
    Add('    Texto de onde será extraido o trecho.                                         ');
    Add('  - INICIO                                                                        ');
    Add('    Posição de inicio para extrair o text.                                        ');
    Add('  - FIM                                                                           ');
    Add('    Posição de Fim para extrair o text.                                           ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { EXTRAIR }

{ FORMATAR }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList12Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'FORMATAR(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Formata um valor e arredonda com as casas decimais.                             ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  FORMATAR(VALOR,NUMERO DE CASAS)                                                 ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  FORMATAR(123.4567,3) = 123.46                                                   ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - VALOR                                                                         ');
    Add('    Valor a ser formatado.                                                        ');
    Add('  - NUMERO DE CASAS                                                               ');
    Add('    Numero de casas decimais no valor resultante.                                 ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { FORMATAR }

{ MINIMO }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList11Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'MINIMO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o menor valor de uma lista.                                             ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  MINIMO(VAL1,VAL2,VAL3)                                                          ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  MINIMO(12,25,01,11,124,211) = 01                                                ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - VALn                                                                          ');
    Add('    Valores a serem comparados.                                                   ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  Compara até 100 valores.                                                        ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { MINIMO }

{ MAXIMO }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList11Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'MAXIMO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o maior valor de uma lista de valores inteiros ou reais.                ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  MAXIMO(VAL1,VAL2,VAL3)                                                          ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  MAXIMO(12,25,01,11,124,211) = 211                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add(' - VALn                                                                           ');
    Add('   Valores a serem comparados.                                                    ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('   Compara até 100 valores.                                                       ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end; { MAXIMO }

{ BUSCAX }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList8Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'BUSCAX(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor da coluna na tabela desejada correspondente ao valor            ');
    Add('  informado.                                                                      ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  BUSCAVALOR(TABELA, COLUNA, VALOR)                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  BUSCAVALOR(TABBIO10, QX, @VAL)                                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - TABELA                                                                        ');
    Add('    Tabela biométrica a pesquisar.                                                ');
    Add('  - COLUNA                                                                        ');
    Add('    Coluna a pesquisar.                                                           ');
    Add('  - VALOR                                                                         ');
    Add('    Valor a pesquisar na Coluna.                                                  ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { BUSCAX }

{ CAMPOSDESC }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList8Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  BtFormulario.Visible := True;
  Inc(ContParent);
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Cria estrutura para ser utilizada na Regra. Utilize o botão a esquerda para     ');
    Add('  criar sua estrutura.                                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  CAMPOSDESC(NOME DO CAMPO/VARIAVEL,TIPO,TAMANHO,DECIMAIS;                        ');
    Add('             NOME DO CAMPO/VARIAVEL,TIPO,TAMANHO,DECIMAIS.)                       ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  CAMPOSDESC(MATRIC,C,6;IDADE,N,4,0;SALARIO,N,10,2;DATA,D,10.)                    ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - NOME DO CAMPO/VARIAVEL                                                        ');
    Add('    Nome do Campo ou variável a ser criado.                                       ');
    Add('  - TIPO                                                                          ');
    Add('    Tipo do Campo.                                                                ');
    Add('      C - Caracter                                                                ');
    Add('      N - Número (com casas decimais)                                             ');
    Add('      D - Data                                                                    ');
    Add('  - TAMANHO                                                                       ');
    Add('    Tamanho do campo.                                                             ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  Cada descrição de Campo termina com ";".                                        ');
    Add('  A última termina com ".".                                                       ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { CAMPOSDESC }

{ EXISTECAMPO }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList8Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'EXISTECAMPO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna True se o campo existir na consulta de entrada e FALSE senão.           ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  EXISTECAMPO(NOME DO CAMPO)                                                      ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  EXISTECAMPO(IDPESSOA)                                                           ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - NOME DO CAMPO                                                                 ');
    Add('    Nome do Campo a verificar na consulta de entrada, deve ser uma Constante.     ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  Campos com valores nulos passados pelos sistemas de origens não aparecem na     ');
    Add('  consulta de entrada ('' as IDPESSOA não é valido).                              ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end;

{ REGATU }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList8Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := 'REGATU()';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  ContParent := 0;
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o número do registro atual selecionado na aplicação.                    ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  REGATU()                                                                        ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  REGATU()                                                                        ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

{ TOTREGS }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList8Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'TOTREGS()';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  ContParent := 0;
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna a quantidade de registros sendo usados na Regra.                        ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  TOTREGS()                                                                       ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  TOTREGS()                                                                       ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { TOTREGS }

{ OPPATRO }
procedure TFrmCadFormulaMT.fcOutlookList2Items14Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  inherited;
  dedMemo.Text := dedMemo.Text + 'OPPATRO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna os seis valores das opções da Patrocinadora, nas variáveis de retorno.  ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  OPPATRO(@RETORNO1,@RETORNO2,@RETORNO3,@RETORNO4,@RETORNO5,@RETORNO6))           ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  OPPATRO(@A1,@A2,@A3,@A4,@A5,@A6)                                                ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARÂMETROS:                                                         ');
    Add('  - RETORNOn                                                                      ');
    Add('    Variáveis nas quais serão retornados os valores.                              ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end; { OPPATRO }


{ SOMARESERVA }
procedure TFrmCadFormulaMT.fcOutlookList2Items15Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'SOMACOTASRESERVA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o somatório dos valores das movimentações em cotas de um determinado    ');
    Add('  grupo de reservas em um período indicado.                                       ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  SOMACOTASRESERVA([LISTA_RESERVA],DATAINICIO,DATAFINAL)                          ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  VALORRESERVA([010,100,121,20],01/01/2002,01/11/2003)                            ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - LISTA_RESERVA                                                                 ');
    Add('    Lista de valores a serem pesquisados na coluna IDTIPORESERVA das tabelas do   ');
    Add('    Banco de Dados.                                                               ');
    Add('  - DATAINICIO                                                                    ');
    Add('    Data de inicio do somatório, no formato DD/MM/YYYY.                           ');
    Add('  - DATAFIM                                                                       ');
    Add('    Data de fim para o somatório, no formato DD/MM/YYYY.                          ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  1) Caso não seja informada uma lista de reservas ([],)                          ');
    Add('     o sistema somará todas as reservas                                           ');
    Add('  2) Caso valores não sejam encontrados no banco de dados,                        ');
    Add('     a fórmula retorna 0 (zero)                                                   ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { SOMARESERVA }

//Ádler
procedure TFrmCadFormulaMT.fcOutlookList2Items16Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'BUSCAPLANO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;

  With MemDesc.lines Do Begin
    Add('OBJETIVO:                                                                                           ');
    Add(' Retorna Verdadeiro se o plano possuir vínculo com a pessoa e Falso caso não possua vínculo.        ');
    Add('----------------------------------------------------------------------------------                  ');
    Add('SINTAXE:                                                                                            ');
    Add('  BUSCAPLANO (IDPESSOA,IDPLANOPREV,IDPESSJUR,FLGATIVO)                                              ');
    Add('                                                                                                    ');
    Add('----------------------------------------------------------------------------------                  ');
    Add('EXEMPLO:                                                                                            ');
    Add('  BUSCAPLANO (@IDPESSOA,@IDPLANOPREV,@IDPESSJUR,1)                                                  ');
    Add('                                                                                                    ');
    Add('----------------------------------------------------------------------------------                  ');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                                           ');
    Add('  - @IDPESSOA                                                                                       ');
    Add('    identificador numérico para busca da pessoa;                                                    ');
    Add('  - @IDPLANOPREV                                                                                    ');
    Add('    identificador numérico para busca do plano previdenciario;.                                     ');
    Add('  - @IDPESSJUR                                                                                      ');
    Add('    identificador numérico para busca da patrocinadora;.                                            ');
    Add('   - FLGATIVO                                                                                       ');
    Add('    Indica se a busca deve considerar a situação de vinculação ao plano ativo ou                    ');
    Add('    desconsiderar essa marcação.                                                                    ');
    Add('                                                                                                    ');
    Add('----------------------------------------------------------------------------------                  ');
    Add('OBSERVAÇÃO:                                                                                         ');
    Add('  Para o modelo implementado no sistema o campo FLGDESATIVADO será passado como critério            ');
    Add('  da consulta quando o parâmetro FLGATIVO for igual a 1. O campo FLGDESATIVADO, recebe o            ');
    Add('  valor 0 indicando que além de verificar se existe vinculação entre o plano e o participante,      ');
    Add('  a vinculação deve estar ativa. Somente nessa condição a fórmula retornará verdadeiro.             ');
    Add('                                                                                                    ');
    Add('  Caso não seja passado valor nenhum para o parâmetro FLGATIVO, ou seja, passado o                   ');
    Add('  valor 0, a fórmula não lava em consideração a situação do vinculo. Nessa condição                  ');
    Add('  retornará verdadeiro se existir registro na estrutura de vinculação entre o participante           ');
    Add('  e o plano previdenciário para os critérios passados na chamada da fórmula (IDPESSOA e IDPLANOPREV).');
  end;

  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;
//Ádler

{ SITPESSOA }
procedure TFrmCadFormulaMT.fcOutlookList2Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  Inc(ContParent);
  dedMemo.Text := dedMemo.Text + 'SITPESSOA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna a situação da pessoa de acordo com o parametro informado.               ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  SITPESSOA(TIPO DE SITUAÇÃO)                                                     ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  SITPESSOA(1)                                                                    ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - TIPO DE SITUAÇÃO                                                              ');
    Add('    Tipo de situação a pesquisar.                                                 ');
    Add('      1 ou Nulo - Situação na patrocinadora                                       ');
    Add('      2 - Situação na Fundação                                                    ');
    Add('      3 - Situação no Plano                                                       ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { SITPESSOA }


{ VERCONCEDIDO }
procedure TFrmCadFormulaMT.fcOutlookList2Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VERCONCEDIDO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna                                                                         ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  VERCONCEDIDO(NÚMERO DO BENEFICIO, RETORNO DATA, RETORNO VALOR, IDPESSOAPESQUISA)');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  VERCONCEDIDO(120,@VARRETDATA,@VARRETVALOR)                                   ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - NÚMERO DO BENEFICIO                                                           ');
    Add('    Numero do Beneficio a Pesquisar.                                              ');
    Add('  - RETORNO DATA                                                                  ');
    Add('    Variável de retorno para Data.                                                ');
    Add('  - NÚMERO DO BENEFICIO                                                           ');
    Add('    Variável de retonro para o Valor.                                             ');
    Add('  - IDPESSOAPESQUISA (opcional)                                                  ');
    Add('    Identificador da pessoa a ser pesquisada, caso seja diferente da informada na');
    Add('    Consulta de entrada (IDPESSOA)                                               ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { VERCONCEDIDO }


{ SITINTERNA }
procedure TFrmCadFormulaMT.fcOutlookList2Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'SITINTERNA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna a situação da pessoa de acordo com o parametro informado.               ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  SITINTERNA(TIPO DE SITUAÇÃO, SAÍDA)                                             ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  SITINTERNA(1,0)                                                                 ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - TIPO DE SITUAÇÃO                                                              ');
    Add('    Tipo de situação a pesquisar.                                                 ');
    Add('      0 ou Nulo - Situação na patrocinadora (ELEGPATRO)                           ');
    Add('      1 - Situação do Plano (PARTPREVPLAN)                                        ');
    Add('      2 - Situação do Participante (PARTPREVPLAN)                                 ');
    Add('  - SAÍDA                                                                         ');
    Add('    Tipo de Saída (valor que será retornado).                                     ');
    Add('      0 ou Nulo - Retorna "TIPOSIT"                                               ');
    Add('      1 e TIPO DE SITUAÇÃO for 0 - Retona "TIPOSIT" Concatenado com "FLGINTERNO"  ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  Quando usando tabelas auxiliares (Views) a formúla busca os dados nestas        ');
    Add('  tabelas.                                                                        ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { SITINTERNA }

{ SITBENEFICIO }
procedure TFrmCadFormulaMT.fcOutlookList2Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'SITBENEFICIO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna a situação do beneficio informado.                                      ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  SITBENEFICIO(NUMERO DO BENEFICIO)                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  SITBENEFICIO(10100020)                                                          ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - NUMERO DO BENEFICIO                                                           ');
    Add('    Numero do Beneficio a pesquisar.                                              ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { SITBENEFICIO }

{ VALORRESERVA }
procedure TFrmCadFormulaMT.fcOutlookList2Items6Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  INHERITED;
  dedMemo.Text := dedMemo.Text + 'VALORRESERVA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor de uma reserva especifica para determinado paticipante.         ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  VALORRESERVA([LISTA_VALOR_PESQUISA_RESERVA],DATAREF,TIPO DE RESULTADO,          ');
    Add('               FLG_CAMPO_PESQUISA_PESSOA, FLG_CAMPO_PESQUISA_RESERVA)             ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  VALORRESERVA([010,100,121,20],01/01/2002,1,0,1)                                 ');
    Add('  VALORRESERVA([121],01/01/2004,1,0,1)                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - LISTA_VALOR_PESQUISA_RESERVA                                                  ');
    Add('    Lista de valores a serem pesquisados nas tabelas do Banco de Dados.           ');
    Add('        Obs: O campo do banco de dados em que serão pesquisados esses valores     ');
    Add('             será definido pelo parametro FLG_CAMPO_PESQUISA_RESERVA.             ');
    Add('  - DATAREF                                                                       ');
    Add('    Data de referência,(DD/MM/YYYY).                                              ');
    Add('  - TIPO DE RESULTADO                                                             ');
    Add('    Define o tipo de Resultado.                                                   ');
    Add('      0 - Resultado em Cotas.                                                     ');
    Add('      1 - Resultado em Real.                                                      ');
    Add('        Obs: Caso seja informado uma lista de valores, o sistema irá retornar     ');
    Add('             sempre o valor em real. Utilizando o indice respectivo da reserva    ');
    Add('             no cadastro de reservas por plano.                                   ');
    Add(' - FLG_CAMPO_PESQUISA_PESSOA (opcional)                                           ');
    Add('   Define campo que será utilizado na pesquisa à pessoa.                          ');
    Add('     0 - IDPESSOA (default)                                                       ');
    Add('     1 - IDTITULAR                                                                ');
    Add(' - FLG_CAMPO_PESQUISA_RESERVA (opcional)                                          ');
    Add('   Define campo que será utilizado na pesquisa à reserva.                         ');
    Add('     0 - CODHIERARQUIA (default)                                                  ');
    Add('     1 - IDTIPORESERVA                                                            ');
    Add('----------------------------------------------------------------------------------');
     Add('OBSERVAÇÃO:                                                                      ');
    Add('  Caso valores não sejam encontrados no banco de dados,                           ');
    Add('  a fórmula retorna 0 (zero)                                                      ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { BUSCAMATRICULA }


{ PARAMPESSOA }
procedure TFrmCadFormulaMT.fcOutlookList2Items7Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  { Inlcui dados da Formula nos campos }
  dedMemo.Text := dedMemo.Text + 'PARAMPESSOA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  { Mostra Descricao da Formula }
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO                                                                         ');
    Add('  Retorna valor da tabela de Parametros para Pessoa (PESSOAPARAM).               ');
    Add('---------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                         ');
    Add('  PARAMPESSOA(IDPARAMETRO, DATAREF, IDPESSOAPESQUISA)                            ');
    Add('---------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                         ');
    Add('  PARAMPESSOA(1, 01/05/2001)                                                     ');
    Add('---------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                        ');
    Add('  - IDPARAMETRO                                                                  ');
    Add('    Identificador do Parametro a Retornar.                                       ');
    Add('  - DATAREF (opcional)                                                           ');
    Add('    Data de referência para fórmula, formato DD/MM/YYYY.                         ');
    Add('  - IDPESSOAPESQUISA (opcional)                                                  ');
    Add('    Identificador da pessoa a ser pesquisada, caso seja diferente da informada na');
    Add('    Consulta de entrada (IDPESSOA)                                               ');
    Add('---------------------------------------------------------------------------------');
     Add('OBSERVAÇÃO:                                                                      ');
    Add('  Pessoa pesquisada é a informada na Consulta de entrada (campo IDPESSOA), a não ');
    Add('  ser que outra seja informada no parametro (IDPESSOAPESQUISA).                  ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { PARAMPESSOA }



{ PLANOANTERIOR }
procedure TFrmCadFormulaMT.fcOutlookList2Items8Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'PLANOANTERIOR(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o Plano e a Data de Incrição anterior ao plano atual de um participante.');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  PLANOANTERIOR(@VARPLANO, @VARDATAINSCRICAO)                                     ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  PLANOANTERIOR(@PLANOANT, @DATAINSCANT)                                          ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRICAO DOS PARAMETROS:                                                         ');
    Add('  - VARPLANOANT                                                                   ');
    Add('    Variavél que irá receber o Identificador do plano anterior.                   ');
    Add('  - VARDATAINSCRICAO                                                              ');
    Add('    Variavél que irá receber a Data de Incrição do plano anterior.                ');
  end;
  MemDesc. Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;{ PLANOANTERIOR }


{ RMTRANSFERENCIA}
procedure TFrmCadFormulaMT.fcOutlookList2Items9Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'RMTRANSFERENCIA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Permite buscar um valor de reserva diretamente da tabela Historico de Reservas, ');
    Add('  a partir do seu identificador e do mês  de referência.                          ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  RMTRANSFERENCIA(TIPORESERVA,ANOMESREFERENCIA,FLGVALORDESEJADO)                  ');
    Add('EXEMPLO:                                                                          ');
    Add('  RMTRANSFERENCIA(2021,2001/02,1)                                                 ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - TIPORESERVA                                                                   ');
    Add('    Identificado do Tipo de Reserva a pesquisar.                                  ');
    Add('  - ANOMESREFERENCIA                                                              ');
    Add('    Ano/Mes para pesquisa.                                                        ');
    Add('      Obs.: Utilizado para filtro a coluna DATAALIMENTACAO.                       ');
    Add('  - FLGVALORDESEJADO                                                              ');
    Add('    Indica o campo que irá retornar as informações pesquisadas.                   ');
    Add('    1 - Valor do campo VALORREAL                                                           ');
    Add('    2 - Valor do campo SALDOCOTAS                                                          ');
    Add('    3 - Valor do campo SALDOCORRIGIDO                                                      ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { RMTRANSFERENCIA }

{ RESERVAORIGINAL }
procedure TFrmCadFormulaMT.fcOutlookList2Items10Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'RESERVAORIGINAL(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Permite buscar o valor original de reserva indicada.                            ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  RESERVAORIGINAL(TIPORESERVA,BENEFICIO)                                          ');
    Add('EXEMPLO:                                                                          ');
    Add('  RESERVAORIGINAL(3201,41)                                                        ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - TIPORESERVA                                                                   ');
    Add('    Identificado do Tipo de Reserva a pesquisar.                                  ');
    Add('  - BENEFICIO                                                                     ');
    Add('    Identificado do Beneficio a pesquisar.                                        ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { RESERVAORIGINAL }

{ POSSUIMIGRACAO }
procedure TFrmCadFormulaMT.fcOutlookList2Items11Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'POSSUIMIGRACAO';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna "True" se o associado possuir migração de plano ou "False" caso não     ');
    Add('  possua.                                                                         ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  POSSUIMIGRACAO(FLGVERIFICAEVENTO)                                               ');
    Add('EXEMPLO:                                                                          ');
    Add('  POSSUIMIGRACAO                                                                  ');
    Add('  POSSUIMIGRACAO(N)                                                               ');
    Add('  POSSUIMIGRACAO(S)                                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - POSSUIMIGRACAO                                                                ');
    Add('    Indica se a formula irá verificar se existe um evento e migração para o       ');
    Add('    associado além de comparar se possui outro plano que não o ativo.             ');
    Add('      S - Verifica eventos                                                        ');
    Add('      N - Não verifica eventos (default)                                          ');

  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { POSSUIMIGRACAO }


{ OPBENEF }
procedure TFrmCadFormulaMT.fcOutlookList2Items12Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'OPBENEF(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna os três valores das opções de um beneficio, nas variáveis de retorno.   ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  OPBENEF(IDBENEFICIO,DATAREF,@RETORNO1,@RETORNO2,@RETORNO3))                     ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  OPBENEF(22,,@A1,@A2,@A3)           - PESQUISA DADOS ATUAIS                      ');
    Add('  OPBENEF(22,04/10/1999,@A1,@A2,@A3) - PESQUISA DADOS NO HISTORICO                ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - IDBENEFICIO                                                                   ');
    Add('    Identificador do Benefício.                                                   ');
    Add('  - DATAREF                                                                       ');
    Add('    Data de referência do processo, formato DD/MM/YYYY.                           ');
    Add('  - RETORNOn                                                                      ');
    Add('    Variáveis nas quais serão retornados os valores.                              ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                         ');
    Add('  Caso seja informado o parâmetro DATAREF será feita a pesquisa pelo HISTÓRICO,   ');
    Add('  e caso não seja utilizado o parâmetro DATAREF será feita a pesquisa ATUAL.         ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { OPBENEF }

{ VLRBENEFICIO }
procedure TFrmCadFormulaMT.fcOutlookList5Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VLRBENEFICIO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor integral do beneficio em um determinado MES/ANO.                ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  VLRBENEFICIO(MESANO,[IDBENEFICIO1,IDBENEFICIO2....], MESIGUALREFERENCIA,        ');
    Add('               IDPLANOPREV, FONTEPAGADORA, SOMENTEVALORESAPAGAR, FLGMESFILTRO,    ');
    Add('               IDPESSOAPESQUISA)                                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  VLRBENEFICIO(10/1994,[4,64],0,,1)                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - MESANO                                                                        ');
    Add('    Mês/Ano de referência. Formato MM/AAAA                                        ');
    Add('  - IDBENEFICIOn                                                                  ');
    Add('    Identificadores dos beneficios da pesquisa (IDBENEFICIO).                     ');
    Add('      Obs.: Máximo de 50 beneficios.                                              ');
    Add('  - MESIGUALREFERENCIA (opcional)                                                 ');
    Add('    Indica se o Mês da consula deve ser igual ao Mês de Referencia.               ');
    Add('      0 - Não iguala os meses (defaut)                                            ');
    Add('      1 - Iguala meses                                                            ');
    Add('  - IDPLANOPREV (opcional)                                                        ');
    Add('    Identificador do plano previdenciário para utilizar como filtro na consulta.  ');
    Add('    Vazio para plano atual do associado.                                          ');
    Add('  - FONTEPAGADORA (opcional)                                                      ');
    Add('    Indica a fonte pagadora do beneficio para usar como filtro na consulta.       ');
    Add('      1 - Fundação                                                                ');
    Add('      2 - INSS                                                                    ');
    Add('  - SOMENTEVALORESAPAGAR (opcional)                                               ');
    Add('    Indica se pesquisa irá retornar somente valores a pagar.                      ');
    Add('      S - Somente valores a pagar (VLRBENEFPGTO = NULO ou 0)                      ');
    Add('      N - Todos os valores (default)                                              ');
    Add('  - FLGMESFILTRO (opcional)                                                       ');
    Add('    Indica a coluna para pesquisar o mês informado.                               ');
    Add('      0 - Pesquisa na coluna mês de Referência MESREFERENCIA (default)            ');
    Add('      1 - Pesquisa na coluna mês de Cobrança MES                                  ');
    Add('  - IDPESSOAPESQUISA (opcional)                                                   ');
    Add('    Indica o IDPESSOA que será utilizado na consulta interna da fórmula.          ');
    Add('      O IDPESSOA da consulta de entrada é o default                               ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  Caso o parametro IDBENEFICIOn esteja vazio, a formula retorná a soma de todos   ');
    Add('  os beneficios no mês.                                                           ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { VLRBENEFICIO }

{ VLRBENEFICIOTOTAL }
procedure TFrmCadFormulaMT.fcOutlookList5Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VLRBENEFICIOTOTAL('; 
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor total do beneficio em um determinado MES/ANO, buscando pela     ');
    Add('  última data de inclusão.                                                        ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  VLRBENEFICIOTOTAL(MESANO,BENEFICIO, MESIGUALREFERENCIA)                         ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  VLRBENEFICIOTOTAL(10/1994,4,0)                                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - MESANO                                                                        ');
    Add('    Mês/Ano de referência. Formato MM/AAAA                                        ');
    Add('  - BENEFICIO (opcional)                                                          ');
    Add('    Numero do Beneficio a pesquisar (IDBENEFICIO).                                ');
    Add('  - MESIGUALREFERENCIA (opcional)                                                 ');
    Add('    Indica se o Mês da consula deve ser igual ao Mês de Referencia.               ');
    Add('      0 - Não iguala os meses (defaut)                                            ');
    Add('      1 - Iguala meses                                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  Caso o parametro BENEFICIO esteja vazio, a formula retorná a soma dos beneficios');
    Add('  no mês.                                                                         ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { VLRBENEFICIOTOTAL }


{ SOMABENEFICIOS }
procedure TFrmCadFormulaMT.fcOutlookList5Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  { Inlcui dados da Formula nos campos }
  dedMemo.Text := dedMemo.Text + 'SOMABENEFICIOS(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  { Mostra Descricao da Formula }
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO                                                                         ');
    Add('  Somar os benefícios no período.                                                ');
    Add('---------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                         ');
    Add('  SOMABENEFICIOS([IDBENEFICIO1,IDBENEFICIO2....]ANOMESINICIAL,ANOMESFINAL,       ');
    Add('                 QTDMESESBENEFICIO, FLGTIPOPESQUISA)                             ');
    Add('-------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                                                         ');
    Add('  SOMABENEFICIOS([1001,1202],2001/01,2002/12, @VARQTDMESESBENEFICIO, R)          ');
    Add('-------------------------------------------------------------------------------- ');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                        ');
    Add('  - IDBENEFICIOn                                                                 ');
    Add('    Identificadores dos beneficios da pesquisa.                                  ');
    Add('      Obs.: Máximo de 50 beneficios.                                             ');
    Add('  - ANOMESINICIAL                                                                ');
    Add('    Data de inicio do processo.                                                  ');
    Add('  - ANOMESFINAL                                                                  ');
    Add('    Data de fim do processo.                                                     ');
    Add('  - QTDMESESBENEFICIO                                                            ');
    Add('    Variavel que irá retornar a quantidade de meses em beneficios utilizados no  ');
    Add('    cálculo.                                                                     ');
    Add('  - FLGTIPOPESQUISA                                                              ');
    Add('    R - Pesquisa rubricas na HISTRUBSAL (default).                               ');
    Add('    B - Pesquisa por BENEFICIOS na HSTBENEFBFCIARIO.                             ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { SOMABENEFICIOS }

{ SOMAHSTBENEF }
procedure TFrmCadFormulaMT.fcOutlookList5Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  { Inlcui dados da Formula nos campos }
  dedMemo.Text := dedMemo.Text + 'SOMAHSTBENEF(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  { Mostra Descricao da Formula }
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO                                                                         ');
    Add('  Somar os benefícios no período.                                                ');
    Add('---------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                         ');
    Add('  SOMAHSTBENEF([IDBENEFICIO1,IDBENEFICIO2....]ANOMESINICIAL,ANOMESFINAL,         ');
    Add('               QTDMESESBENEFICIO, FLGCAMPOPESQUISA)                              ');
    Add('-------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                                                         ');
    Add('  SOMAHSTBENEF([1001,1202],2001/01,2002/12, @VARQTDMESESBENEFICIO, VT)           ');
    Add('-------------------------------------------------------------------------------- ');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                        ');
    Add('  - IDBENEFICIOn                                                                 ');
    Add('    Identificadores dos beneficios da pesquisa.                                  ');
    Add('      Obs.: Máximo de 50 beneficios.                                             ');
    Add('  - ANOMESINICIAL                                                                ');
    Add('    Data de inicio do processo.                                                  ');
    Add('  - ANOMESFINAL                                                                  ');
    Add('    Data de fim do processo.                                                     ');
    Add('  - QTDMESESBENEFICIO                                                            ');
    Add('    Variavel que irá retornar a quantidade de meses em beneficios utilizados no  ');
    Add('    cálculo.                                                                     ');
    Add('  - FLGCAMPOPESQUISA                                                             ');
    Add('    VP - Soma o campo VALORPREV     (Valor previsto para pagamento)              ');
    Add('    VI - Soma o campo VALORINTEGRAL (Valor do beneficio rateado)                 ');
    Add('    VT - Soma o campo VALORTOTAL    (Valor total do beneficio)                   ');
    Add('    VB - Soma o campo VLRBENEFPGTO  (Valor efetivamente pago)                    ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { SOMAHSTBENEF }

{ MEDIAINSS }
procedure TFrmCadFormulaMT.fcOutlookList5Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'MEDIAINSS(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Soma os valores de um vetor passado pelo SBINSS e faz a media a partir do       ');
    Add('  parâmetro nímero para média.                                                    ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  MEDIAINSS(VETOR,NUMERO PARA MEDIA,TIPO DE RESULTADO)                            ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  MEDIAINSS(VETOR,NUMEROPARAMEDIA,FORMARESULTADO)                                 ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - VETOR                                                                         ');
    Add('                                                                                  ');
    Add('  - NUMERO PARA MÉDIA                                                             ');
    Add('                                                                                  ');
    Add('  - TIPO DE RESULTADO                                                             ');
    Add('      0 ou Nulo - Resultado sem formatação                                        ');
    Add('      1 - Resultado arredondado                                                   ');
    Add('      2 - Resultado truncado                                                      ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

{ NUMINSS }
procedure TFrmCadFormulaMT.fcOutlookList5Items5Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'NUMINSS(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Conta o número de incidencias de valores diferente de zero no resultado         ');
    Add('  de SORTINSS.                                                                    ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  NUMINSS(VETOR)                                                                  ');
    Add('                                                                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  NUMINSS(VETOR)                                                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - VETOR                                                                         ');
    Add('    Váriavel usada como resultado da Fórmula SORTINSS                             ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { NUMINSS }


{ SBINSS }
procedure TFrmCadFormulaMT.fcOutlookList5Items6Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'SBINSS(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO');
    Add('  Retornar uma Tabela com os salários do participante da data de inicio até a    ');
    Add(' data final, reajustados por um ou mais indices e limitados a um Teto .          ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  SBINSS(TETO,DATAINICIAL,DATAFINAL,TIPOINDICE,[INDICE,DATA...],TIPOFILTRO,      ');
    Add('         "FLGSRB", [CORREÇÃO, MESDATABASE,FLGTIPOCALC...],DATAFIMCORR,           ');
    Add('         FLGDEGRAVACAO, FLGTIPOGRAVA, NUMERODECIMAISINDICE)                      ');
    Add('-------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                                                         ');
    Add('  SBINSS(#TETOINSS,01/01/2001,01/12/2001,[#INPC,01/01/2001],F,"1,3")             ');
    Add('-------------------------------------------------------------------------------- ');
    Add('DESCRICAO DOS PARAMETROS:                                                        ');
    Add(' - TETO                                                                          ');
    Add('    Sigla da Moeda usada como teto do provento.                                  ');
    Add(' - DATAINICIAL                                                                   ');
    Add('    Data Inicial do Processo                                                     ');
    Add('      Obs.: Ano com 4 digitos.                                                   ');
    Add(' - DATAFINAL                                                                     ');
    Add('    Data Final do Processo                                                       ');
    Add('      Obs.: Ano com 4 digitos.                                                   ');
    Add(' - TIPOINDICE                                                                    ');
    Add('    Indica o Tipo de Indice a ser utilizado                                      ');
    Add('      0 ou NULO - Utilizará valores menores que zero inclusive.                  ');
    Add('      1         - Utilizará valores menores que zero, como sendo zero            ');
    Add(' - INDICE / DATA                                                                 ');
    Add('   - INDICE                                                                      ');
    Add('                                                                                 ');
    Add('   - DATA                                                                        ');
    Add('                                                                                 ');
    Add('   Obs.:                                                                         ');
    Add('        Passados entre Colchetes Ex.: [1,12/01/2000]                             ');
    Add('        Anos das datas com 4 digitos.                                            ');
    Add('                                                                                 ');
    Add(' - TIPOFILTRO                                                                    ');
    Add('    Tipo de Filtro utilizado na pesquisa das Rubricas.                           ');
    Add('      F - Flags SRB                                                              ');
    Add('      G - Grupo de Rubricas                                                      ');
    Add(' - FILTRO                                                                        ');
    Add('    FLGSRB ou Grupo de Rubrica.                                                  ');
    Add('      Obs.:                                                                      ');
    Add('           Passado entre Aspas e separado por virgulas. Ex.: "1,2,3,4".          ');
    Add('           Caso não seja passado serão utilizados todos existentes.              ');
    Add('           Se houver "FLGSRB" declarado, o tipo 4 eliminará os tipo 2 e 3.       ');
    Add('           Se não houver declarado não terá eliminação alguma.                   ');
    Add(' - CORRECAO                                                                      ');
    Add('    Fator de Correção de reajuste de salário.                                    ');
    Add(' - MESDATABASE                                                                   ');
    Add('    Mes para base de calculo para o reajuste de salário.                         ');
    Add(' - FLGTIPOCALC                                                                   ');
    Add('    Indica o Tipo de cálculo a ser utilizado                                     ');
    Add('      0 ou NULO - Utilizará valores menores que zero inclusive.                  ');
    Add('      1         - Utilizará valores menores que zero, como sendo zero            ');
    Add(' - DATAFIMCORR                                                                   ');
    Add('    Data Final de Correção                                                       ');
    Add('      Obs.: Ano com 4 digitos.                                                   ');
    Add('            Caso este parametro não esteja preenchido,                           ');
    Add('            a DATAFINAL será a data final de correção.                           ');
    Add(' - FLGDEGRAVACAO                                                                 ');
    Add('    Indica se deseja gravar na memória de cálculo.                               ');
    Add('      0 - Não grava.                                                             ');
    Add('      1 - Grava.                                                                 ');
    Add(' - FLGTIPOGRAVA                                                                  ');
    Add('    Valor que será gravado na memória de cálculo para diferenciar                ');
    Add('    valores gravados por diferentes formulas chamadas pela mesma Regra.          ');
    Add('      Obs.: Este valor será gravado sem criticas.                                ');
    Add(' - NUMERODECIMAISINDICE                                                          ');
    Add('    Numero de casa que se deseja arrendondar o Indice do INSS                    ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { SBINSS }

{ SORTINSS }
procedure TFrmCadFormulaMT.fcOutlookList5Items7Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'SORTINSS(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Organiza o vetor (Resultado) de SBINSS.                                         ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  SORTINSS(VETOR, OPÇÃO 1, OPÇÃO 2)                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  NUMINSS(VETOR)                                                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - VETOR                                                                         ');
    Add('    Váriavel usada como resultado da Fórmula SBINSS                               ');
    Add('  - OPÇÃO 1                                                                       ');
    Add('    Coluna a ordenar.                                                             ');
    Add('      0 - Data                                                                    ');
    Add('      1 - Valor                                                                   ');
    Add('  - OPÇÃO 2                                                                       ');
    Add('    Ordem                                                                         ');
    Add('      0 - Descendente                                                             ');
    Add('      1 - Ascendente                                                              ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { SORTINSS }

{ REAJUSTEINSS }
procedure TFrmCadFormulaMT.fcOutlookList5Items8Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'REAJUSTAINSS(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  memDesc.Lines.Add('OBJETIVO:                                                                       ');
  memDesc.Lines.Add('  Reajustar um valor informado de acordo com as regras do INSS.                 ');
  memDesc.Lines.Add('--------------------------------------------------------------------------------');
  memDesc.Lines.Add('EXEMPLO:                                                                        ');
  memDesc.Lines.Add('  REAJUSTAINSS( VALOR, SIGLAINDICE, DATAINICIO, DATAFINAL)                      ');
  memDesc.Lines.Add('--------------------------------------------------------------------------------');
  memDesc.Lines.Add('DESCRIÇÃO DOS PARAMETROS:                                                       ');
  memDesc.Lines.Add('  - VALOR                                                                       ');
  memDesc.Lines.Add('    Valor a ser reajustado.                                                     ');
  memDesc.Lines.Add('  - SIGLAINDICE                                                                 ');
  memDesc.Lines.Add('    Sigla do indice a ser utilizado para o reajuste                             ');
  memDesc.Lines.Add('  - DATAINICIO                                                                  ');
  memDesc.Lines.Add('    Data para inicio do reajuste.                                               ');
  memDesc.Lines.Add('  - DATAFINAL                                                                   ');
  memDesc.Lines.Add('    Data final para o reajuste.                                                 ');
  memDesc.Lines.Add('--------------------------------------------------------------------------------');
  memDesc.Lines.Add('OBSERVACAO:                                                                     ');
  memDesc.Lines.Add('  Esta formula processa o reajuste da seguinte forma :                          ');
  memDesc.Lines.Add('   . no 1o. mês, utiliza o indice com Mes de Referência igual                   ');
  memDesc.Lines.Add('     ao mês da data de início;                                                  ');
  memDesc.Lines.Add('   . do 2o. mês até o mês da data final, utiliza o índice da                    ');
  memDesc.Lines.Add('     data da cotação do mês anterior.                                           ');
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { REAJUSTEINSS }

{ FILTRAINSS }
procedure TFrmCadFormulaMT.fcOutlookList5Items9Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  inherited;
  dedMemo.Text := dedMemo.Text + 'FILTRAINSS(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  FILTRAINSS                                                                      ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  FILTRAINSS(VETOR,QTD. FILTRAGEM)                                                ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  FILTRAINSS(VETOR,QTD)                                                           ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - VETOR                                                                         ');
    Add('                                                                                  ');
    Add('  - QTD. FILTRAGEM                                                                ');
    Add('                                                                                  ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { FILTRAINSS }

{ VALORSRB }
procedure TFrmCadFormulaMT.fcOutlookList5Items10Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VALORSRB(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor do SRB em um determinado ANO/MES.                               ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  VALORSRB(ANOMES,BENEFICIO)                                                      ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  VALORSRB(1994/10,4)                                                         ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - ANOMES                                                                        ');
    Add('    AnoMes de referência. Formato AAAA/MM                                         ');
    Add('  - BENEFICIO                                                                     ');
    Add('    Numero do Beneficio a pesquisar.                                              ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { VALORSRB }

{ IRRF }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList10Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'IRRF(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Calcular o Imposto de Renda.                                                    ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  IRRF(NUMERO DE DEPENDENTES,DATA DE NASCIMENTO,VALORBASE,DATA DE REFERENCIA,     ');
    Add('       TIPO DE RESULTADO)                                                         ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  IRRF(2,04/04/1951,2000,14/04/2000,0) - Retornará o Imposto Devido.              ');
    Add('  IRRF(2,04/04/1951,2000,14/04/2000,1) - Retornará a Aliquota IRRF.               ');
    Add('  IRRF(2,04/04/1951,2000,14/04/2000,2) - Retornará o Valor a Deduzir.             ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - NUMERO DE DEPENDENTES                                                         ');
    Add('    Número de dependentes para cálculo.                                           ');
    Add('  - DATA DE NASCIMENTO                                                            ');
    Add('    Data de nascimento utilizada no cálculo.                                      ');
    Add('  - VALORBASE                                                                     ');
    Add('    Valor de base apra cálculo.                                                   ');
    Add('  - DATA DE REFERENCIA                                                            ');
    Add('    Data de referencia para cálculo, usado no calculo da idade e na busca da      ');
    Add('    aliquota de IR.                                                               ');
    Add('  - TIPO DE RESULTADO                                                             ');
    Add('      0 ou Nulo - Imposto Devido                                                  ');
    Add('      1 - Alíquota do IRRF                                                        ');
    Add('      2 - valor a Deduzir                                                         ');
    Add('      3 - Idade de Idoso                                                          ');
    Add('      4 - Valor a deduzir da base de cálculo para idoso.                          ');
    Add('      5 - Valor a deduzir da base de cálculo por dependente.                      ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { IRRF }

{ INDICE }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList10Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'INDICE(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna a data ou o valor de um índice em uma data especificada ou aproximda.   ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  INDICE(INDICE,DATAREF,TIPO DE PESQUISA, TIPO DE RETORNO)                        ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  INDICE(UPC,09/01/1998,1)                                                        ');
    Add('  Irá retornar o valor da UPC em 09 de janeiro de 1998 ou antes.                  ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - ÍNDICE                                                                        ');
    Add('    Índice de referência do processo.                                             ');
    Add('  - DATAREF                                                                       ');
    Add('    Data de refêrencia do processo, formato DD/MM/YYYY.                           ');
    Add('  - TIPO DE PESQUISA (opcional)                                                   ');
    Add('    Tipo de pesquisa.                                                             ');
    Add('      0 ou Nulo - Retorna quando existe valor na data.                            ');
    Add('      1 - Retorna o ultimo valor cadastrado.                                      ');
    Add('  - TIPO DE RETORNO  (opcional)                                                   ');
    Add('    Tipo de retorno quando não encontrar indice.                                  ');
    Add('      0 ou Nulo - Retorna 0 quando não existe valor na data.                      ');
    Add('      1 - Retorna <NULO> quando não existe valor na data.                         ');
    Add('      2 - Retorna a Data encontrada.                                              ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { INDICE }

{ CORRECAO }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList10Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'CORRECAO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Corrige um valor em um período, utilizando um índice informado.                 ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  CORRECAO(DATA DE INICIO,DATA FINAL,ÍNDICE,VALOR, ARRED CASAS)                   ');   //edilaine SIG131430
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  CORRECAO(01/01/2001,01/12/2002,INPC,1000)                                       ');
    Add('  CORRECAO(01/01/2022,01/12/2022,INPC,1000, 4)                                    ');   //edilaine SIG131430
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATA DA INICIO                                                                ');
    Add('    Data de inicio do processo.                                                   ');
    Add('  - DATA FINAL                                                                    ');
    Add('    Data final do processo.                                                       ');
    Add('  - ÍNDICE                                                                        ');
    Add('    Índice de referência do processo.                                             ');
    Add('  - VALOR                                                                         ');
    Add('    Valor a processar.                                                            ');
    Add('  - ARRED CASAS (opcional)                                                        ');   //edilaine SIG131430
    Add('    Número de casas decimais para arredondamento                                  ');   //edilaine SIG131430
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { CORRECAO }

{ CP }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList9Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'CP(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('                                                                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  CP([ÍNDICE,DATA]DATAREF,NUMCONTRIB,TIPOCALCULO,"CONTRIBUICÃO(ÕES)")             ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add(' CP([INPC,01/02/2002]01/01/2002,10,0,"CONTRIBUICAO")                              ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - ÍNDICE                                                                        ');
    Add('    Índice (SIGLA) a ser utilizado na correção.                                   ');
    Add('  - DATA                                                                          ');
    Add('    Data do índice.                                                               ');
    Add('  - DATAREF                                                                       ');
    Add('    Data de inicio do cálculo, formato DD/MM/YYYY.                                ');
    Add('  - NUMCONTRIB                                                                    ');
    Add('    Numero de contribuições a processar.                                          ');
    Add('      Obs.: Pode ser usado mais de uma contribuição separadas por virgula.        ');
    Add('            Ex.: "40,38,39"                                                       ');
    Add('  - TIPOCALCULO                                                                   ');
    Add('    Tipo de Cálculo.                                                              ');
    Add('      0 - Utiliza o parametro NUMCONTRIB                                          ');
    Add('      1 - Utiliza a Quantidade de registros selecionados.                         ');
    Add('  - CONTRIBUICAO                                                                  ');
    Add('    Numero(s) da(s) contribuição(ões) a serem processadas.                        ');
    Add('      0 ou Nulo - Tabela Genérica Longa                                           ');
    Add('      1 - Tabela Geneérica                                                        ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  Utiliza como base a Data de Inscrição e o Identificador da Pessoa, passados na  ');
    Add('  consulta de entrada.                                                            ');

  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { CP }

{ NUMCONTRIB }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList9Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'NUMCONTRIB(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o numero de ocorrencias de uma contribuição em um período.              ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  NUMCONTRIB(DATA INICIAL,DATA FINAL,IDCONTRIBUICAO,TIPOPESQUISA,PATROCINADORA)   ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  NUMCONTRIB(01/01/1999,31/12/1999,2) ou NUMCONTRIB(01/01/1999,31/12/1999) ou     ');
    Add('  NUMCONTRIB(01/01/1999,31/12/1999,2,0,2) ou NUMCONTRIB(01/01/1999,31/12/1999,1)  ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATA INICIAL                                                                  ');
    Add('    Data de inicio da contagem.                                                   ');
    Add('  - DATA FINAL                                                                    ');
    Add('    Data de fim da contagem.                                                      ');
    Add('  - IDCONTRIBUICAO                                                                ');
    Add('    Identificador da contribuição. Caso não sefa informado, a fórmula utilizará   ');
    Add('    todoas as contribuições para pesquisa.                                        ');
    Add('  - TIPOPESQUISA                                                                  ');
    Add('    Tipo de Pesquisa a executar.                                                  ');
    Add('      0 ou Nulo - Pesquisará valores maiores ou iguais a 0 (zero).                ');
    Add('      1 - Pesquisará valores maiores que 0 (zero).                                ');
    Add('  - PATROCINADORA                                                                 ');
    Add('    Sendo informado, será feita a pesquisa nesta patrocinadora, caso contrário    ');
    Add('    à pesquisa utilizará todas as patrocinadoras oara a pessoa processada.        ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { NUMCONTRIB }

{ NUMOCORCONTRIB }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList9Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'NUMOCORCONTRIB(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o numero de contribuições recolhidas em um período.                     ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  NUMOCORCONTRIB([IDCONTR1,IDCONTR2,IDCONTR3...],DATA INICIAL,DATA FINAL,         ');
    Add('  TIPOPESQUISA)                                                                   ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  NUMOCORCONTRIB([0001,0020],01/01/2002,30/05/2002,0)                             ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - IDCONTRn                                                                       ');
    Add('    Identificadores das Contribuições processadas.                                 ');
    Add('  - DATA INICIAL                                                                   ');
    Add('    Data de inicio da contagem.                                                    ');
    Add('  - DATA FINAL                                                                     ');
    Add('    Data de fim da contagem.                                                       ');
    Add('  - TIPOPESQUISA                                                                   ');
    Add('    Tipo de Pesquisa a executar.                                                   ');
    Add('      0 - Selecionará inclusive os valores zerados.                                ');
    Add('      1 - Não selecionará os valores zerados.                                      ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { NUMOCORCONTRIB }

{ VEROPCONTRIB }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList9Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VEROPCONTRIB(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Verifica as opções de contribuição a partir de um periodo de datas.             ');
    Add('  Retorna True ou False.                                                          ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  VEROPCONTRIB(IDCONTRIBUICAO,DATAINICIAL,DATAFINAL,OPCAO)                        ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  VEROPCONTRIB(2610,01/01/2002,01/06/2002,1)                                      ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - IDRUBRICA                                                                     ');
    Add('    Identificador da Rubrica.                                                     ');
    Add('  - OPCAO (opcional)                                                              ');
    Add('    Tipos opção a pesquisar.                                                      ');
    Add('      1 - Verifica "VALOROP1"                                                     ');
    Add('      2 - Verifica "VALOROP2"                                                     ');
    Add('      3 - Verifica "VALOROP3"                                                     ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  Caso seja feita a pesquisa ATUAL, os valores retornados serão;                  ');
    Add('  NÃO   - Caso encontre algo e "FLGCOBRA" for igual a 0                             ');
    Add('  True  - Caso encontre algo e "FLGCOBRA" for igual a 1                             ');
    Add('  False - Caso não encontre.                                                        ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { VEROPCONTRIB }

{ CPASSIST }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList9Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'CPASSIST(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:');
    Add('  Retornar o valor de uma ou mais contribuições de ASSISTIDO para uma data e      ');
    Add('  processo indicados.                                                             ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  CPASSIST("CONTRIBUICOES", CHAVEPESQUISA, ANOMESREFERENCIA, CAMPOCHAVEPESQUISA)  ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - CONTRIBUICOES                                                                 ');
    Add('    Código das contribuições que se deseja buscar. O valor retornado será a soma  ');
    Add('    das contribuições indicadas neste campo.                                      ');
    Add('    separadas por virgula. Ex.: "40,38,39"                                        ');
    Add('  - CHAVEPESQUISA                                                                 ');
    Add('    Chave de pesquisa a qual estão associadas as contribuições que se deseja buscar.');
    ADD('  - ANOMESREFERENCIA                                                              ');
    Add('    Ano/Mês na qual se deseja buscar as contribuições.                            ');
    Add('  - CAMPOCHAVEPESQUISA                                                            ');
    Add('    Texto contendo o campo de pesquisa para consulta.                             ');
    Add('    NUMEROPROCESSO (default)                                                      ');
    Add('    IDBENEFICIO                                                                   ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

{ DATACONTRIB }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList9Items5Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'DATACONTRIB(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna a Data de Inicio e Fim de uma contribuição.                             ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  DATACONTRIB(IDCONTRIBUICAO,DATAREF,@RETORNO1,@RETORNO2)                         ');
    Add('EXEMPLO:                                                                          ');
    Add('  DATACONTRIB(212,,@A1,@A2)           - PESQUISA DADOS ATUAIS                     ');
    Add('  DATACONTRIB(212,04/10/1999,@A1,@A2) - PESQUISA DADOS NO HISTORICO               ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - IDCONTRIBUICAO                                                                ');
    Add('    Identificador da Contribuição                                                 ');
    Add('  - DATAREF                                                                       ');
    Add('    Data de referência do processo, formato DD/MM/YYYY.                           ');
    Add('  - RETORNOn                                                                      ');
    Add('    Variáveis nas quais serão retornadas as datas.                                ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  Caso seja informado o parâmetro DATAREF será feita a pesquisa pelo HISTÓRICO,   ');
    Add('  e caso não seja utilizado o parâmetro DATAREF será feita a pesquisa ATUAL.         ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { DATACONTRIB }


{ SOMACONTRIB }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList9Items6Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'SOMACONTRIB(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO                                                                         ');
    Add('  Retornar a soma dos valores recebidos, de uma determinada contribuição gravada ');
    Add('  na HSTCONTRIBPREV, em determinado mês.                                         ');
    Add('---------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                         ');
    Add('  SOMACONTRIB([MOTIVO1, MOTIVO2,..] ANOMESREFERENCIA, [IDCONTR1,IDCONTR2..]      ');
    Add('              FLGFILTRAPESSOA, FLGRETORNO, IDLOTE, FLGFILTRAPLANOPATRO,          ');
    Add('              ANOMESCOBRANCA)                                                    ');
    Add('-------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                                                         ');
    Add('  SOMACONTRIB ([3003] 2002/10, 1, R)                                             ');
    Add('  De acordo com este exemplo a fórmula irá retornar a SOMA das contribuições re- ');
    Add('  cebidas com identificador 1, referentes ao mês de referencia 2002/10.          ');
    Add('-------------------------------------------------------------------------------- ');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                        ');
    ADD('  - MOTIVO                                                                       ');
    Add('    Código do motivo a ser considerado na soma dos valores.                      ');
    ADD('  - ANOMESREFERENCIA                                                             ');
    Add('    O mês de referencia das contribuições a serem agrupadas, no formato AAAA/MM. ');
    ADD('  - [IDCONTR1,IDCONTR2..]                                                        ');
    Add('    O identificador das contribuições, identificável através da tela Cadastro /  ');
    Add('    Contribuição ou Cadastro / Plano Previdenciário / Cadastro.                  ');
    Add('  - FLGFILTRAPESSOA (opcional)                                                   ');
    Add('    0 - Não filtra por pessoa, retornará a soma de todas as contribuições dos    ');
    Add('        Plano / Patrocinadora.                                                   ');
    Add('    1 - Filtra por pessoa, retornando somente a soma das contribuições da pessoa ');
    Add('        (IDPESSOA) utilizada na regra.                                           ');
    Add('  - FLGRETORNO (opcional)                                                        ');
    Add('    R - Retorna a soma dos valores recebidos (campo VALORRECEBIDO)               ');
    Add('    E - Retorna a soma dos valores esperados (campo VALORESPERADO)               ');
    Add('  - IDLOTE (opcional)                                                            ');
    Add('    Número do LOTE para pesquisar as contribuições.                              ');
    Add('  - FLGFILTRAPLANOPATRO (opcional)                                               ');
    Add('    S - Utilizar filtro por PLANO - PATROCINADORA (default)                      ');
    Add('    N - Não utilizar filtro por PLANO - PATROCINADORA                            ');
    Add('  - ANOMESCOBRANCA (opcional)                                                    ');
    Add('    O mês de cobrança para filtrar as contribuições, no formato AAAA/MM.         ');
 End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { SOMACONTRIB }

{ MED }
procedure TFrmCadFormulaMT.fcOutlookList6Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'MED(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('                                                                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  MED(NUMPROVENTOS, OPÇÃO, GRAVA CÁLCULO)                                         ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  MED(12,1,0)                                                                     ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - NUMPROVENTOS                                                                  ');
    Add('    Número de proventos que deseja calcular a mádia.                              ');
    Add('                                                                                  ');
    Add('  - OPÇÃO DE CÁLCULO                                                              ');
    Add('    Indica quais proventos serão considerados e como será calculada a média.      ');
    Add('      0 - A média será feita com base na quantidade de proventos estipulada em    ');
    Add('          NUMPROVENTOS. Proventos zerados serão considerados.                     ');
    Add('      1 - A média será feita com base apenas nos proventos maiores que 0.         ');
    Add('      2 - A média será feita com base em tantos proventos maiores que 0 quantos   ');
    Add('          forem necessários até se atingir um máximo de NUMPROVENTOS.             ');
    Add('                                                                                  ');
    Add('  - OPÇÃO DE INÍCIO                                                               ');
    Add('    Indica a partir de qual provento serão feitos os cálculos.                    ');
    Add('      0 - O cálculo iniciará no primeiro item da lista.                           ');
    Add('      1 - Idem ao 0.                                                              ');
    Add('      2 - O cálculo iniciará no primeiro item da lista contiver valor.            ');
    Add('                                                                                  ');
    Add('  Exemplos: Dada a lista de proventos...                                          ');
    Add('            0, 0, 1000, 2000, 0, 4000, 0, 6000, 0, 7000, 8000, 0                  ');
    Add('                                                                                  ');
    Add('  Com NUMPROVENTOS = 5, e OPÇÃO DE INÍCIO = 1 ou 0...                             ');
    Add('  ...com CÁLCULO 0 será:    0 +    0 + 1000 + 2000 +    0 =  3000 / 5 =  600      ');
    Add('  ...com CÁLCULO 1 será:               1000 + 2000        =  3000 / 3 = 1000      ');
    Add('  ...com CÁLCULO 2 será: 1000 + 2000 + 4000 + 6000 + 7000 = 20000 / 5 = 4000      ');
    Add('                                                                                  ');
    Add('  Com NUMPROVENTOS = 5, e OPÇÃO DE INÍCIO = 2...                                  ');
    Add('  ...com CÁLCULO 0 será: 1000 + 2000 +    0 + 4000 +    0 =  7000 / 5 = 1400      ');
    Add('  ...com CÁLCULO 1 será: 1000 + 2000 +        4000        =  7000 / 3 = 2333.33   ');
    Add('  ...com CÁLCULO 2 será: 1000 + 2000 + 4000 + 6000 + 7000 = 20000 / 5 = 4000      ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { MED }

{ NP }
procedure TFrmCadFormulaMT.fcOutlookList6Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'NP(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna a quantidade de rubricas diferentes de zero dentro do período de 36     ');
    Add('  meses somados mês a mês.                                                        ');
    Add('  O número máximo de meses solicitaado não deve ultrapassar 48.                   ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  NP([RUBRICA1,RUBRICA2,...]NUMMESES,GRAVA CÁLCULO)                               ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  NP([0001,0012,...]36,0)                                                         ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - RUBRICAn                                                                      ');
    Add('    Código do Provento que será processado.                                       ');
    Add('      Obs.: Coluna CODPROVDESC.                                                   ');
    Add('            No máximo 20 proventos.                                               ');
    Add('  - NUMMESES                                                                      ');
    Add('    Número de meses a processar.                                                  ');
    Add('  - GRAVA CÁLCULO                                                                 ');
    Add('    Define se os valores serão gravados na memória de cálculo.                    ');
    Add('      0 - Não grava proventos.                                                    ');
    Add('      1 - Grava proventos.                                                        ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { NP }


{ NUMSALARIOS }
procedure TFrmCadFormulaMT.fcOutlookList6Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'NUMSALARIOS(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('                                                                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  NUMSALARIOS(ANO/MES, NUMMESES)                                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  NUMSALARIOS(1999/10, 12)                                                        ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - ANO/MES                                                                       ');
    Add('    Ano/Mes de pesquisa, Formato YYYY/MM.                                         ');
    Add('  - NUMMESES                                                                      ');
    Add('    Número de meses a processar.                                                  ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { NUMSALARIOS }


{ PR2 }
procedure TFrmCadFormulaMT.fcOutlookList6Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'PR2(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna                                                                         ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  PR2([ÍNDICE,DATA]DATAREF,TETO,NUMSAL,TIPOMEDIA,TIPO,GRAVA CÁLCULO,              ');
    Add('       FORMARESULTADO, TIPOINDICE,{FLGSRB},[CORREÇÃO,MESDATABASE,TIPOCALC],       '); 
    Add('       NUMCASASFATOR)                                                             '); 
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('                                                                                  ');
    Add('                                                                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - ÍNDICE                                                                        ');
    Add('    Sigla do Indexador utilizado.                                                 ');
    Add('  - DATA                                                                          ');
    Add('    Data do Indexador utilizado.                                                  ');
    Add('  - DATAREF                                                                       ');
    Add('    Data em que se deseja calcular a média, formato DD/MM/YYYY.                   ');
    Add('  - TETO                                                                          ');
    Add('    Sigla da moeda utilizada como provento.                                       ');
    Add('  - NUMSAL                                                                        ');
    Add('    Número de salários para fazer a média.                                        ');
    Add('  - TIPOMEDIA                                                                     ');
    Add('    Tipo de média a executar.                                                     ');
    Add('      0 - Soma os salários e divide por NUMSAL                                    ');
    Add('      1 - Divide pelo nº de salários <> 0 (zero)                                  ');
    Add('      2 - Média Retroativa                                                        ');
    Add('  - TIPO                                                                          ');
    Add('    Tipo de Cálculo que será feito com a PR2.                                     ');
    Add('  - FORMARESULTADO                                                                ');
    Add('    Define se os valores serão gravados na memória de cálculo.                    ');
    Add('      0 ou Nulo - O valor retornado será sem formatação                           ');
    Add('      1 - O valor retornado será arredondado                                      ');
    Add('      2 - O valor retornado será truncado                                                               ');
    Add('  - TIPOINDICE                                                                    ');
    Add('    Tipo de indice utilizado.                                                     ');
    Add('      0 -                                                                         ');
    Add('      1 -                                                                         ');
    Add('  - GRAVA CÁLCULO                                                                 ');
    Add('    Define se os valores serão gravados na memória de cálculo.                    ');
    Add('      0 - Não grava valores.                                                      ');
    Add('      1 - Grava proventos.                                                        ');
    Add('  - FLGSRB                                                                        ');
    Add('    Tipos de sálarios processados.                                                ');
    Add('      1 - Salário de ativo e mantido                                              ');
    Add('      2 - Benefício pago pela folha de beneficios                                 ');
    Add('      3 - Benefício pago pelo INSS                                                ');
    Add('      4 - Salário Virtual                                                         ');
    Add('      5 - Salário de mantido parcial                                              ');
    Add('      0 - Outro tipo de salário                                                   ');
    Add('      Obs.: Não declarando nada em FLGSRB, serão utilizados todos os tipos acima  ');
    Add('            Com a seguinte ressalva:                                              ');
    Add('              - Se num mês o tipo for 4, serão desconsiderados os tipos 2 e 3.    ');
    Add('                Ex.: {1,2,3} ou {1} ou {1,2,3,4}                                  ');
    Add('  - CORREÇÃO                                                                      ');
    Add('    Percentual para correção após data base.                                      ');
    Add('  - MESDATABASE                                                                   ');
    Add('    Mês da data base da patrocinadora.                                            ');
    Add('  - TIPOCALC                                                                      ');
    Add('    Tipo de Cálculo.                                                              ');
    Add('      0 ou Nulo - Forma de cálculo Normal                                         ');
    Add('      1 - Utiliza descontos                                                       ');
    Add('    Obs.: Estes parâmetros têm que ser passados entre colchetes.                  ');
    Add('          [1,12,0] ou [@XPTO,@YZFS,@TIPOCALC]                                     ');
    Add('  - NUMCASASFATOR                                                                 '); 
    Add('    Numero de casas a arredondar o fator acumulado. Se este parâmetro não for     '); 
    Add('    serão utilizadas todas as casas decimais, sem arredondamento.                 '); 
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { PR2 }


{ PRO }
procedure TFrmCadFormulaMT.fcOutlookList6Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'PRO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);

  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o número de Proventos que encontrou no periodo de 48 meses anteriores   ');
    Add('  a DATADECALCULO.                                                                ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  PRO(RUBRICA[INDICE1,DATA...]CORREÇÃO,MESDATABASE,TETO,DATADECALCULO,            ');
    Add('      FLGDEGRAVACAO,FLGTIPODECORRECAO)                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - RUBRICA                                                                       ');
    Add('    Código do Provento que será processado.                                       ');
    Add('      Obs.: Coluna CODPROVDESC.                                                   ');
    Add('            No máximo 20 proventos.                                               ');
    Add('  - INDICE / DATA                                                                 ');
    Add('   - INDICE                                                                       ');
    Add('                                                                                  ');
    Add('   - DATA                                                                         ');
    Add('                                                                                  ');
    Add('   Obs.: Passados entre Colchetes Ex.: [1,12]                                     ');
    Add('         Anos das datas com 4 digitos.                                            ');
    Add('  - CORRECAO                                                                      ');
    Add('    Percentual para correção após a data base.                                    ');
    Add('  - MESDATABASE                                                                   ');
    Add('    Mes para base de calculo para o reajuste de salário.                          ');
    Add('  - TETO                                                                          ');
    Add('    Sigla da Moeda usada como teto do provento.                                   ');
    Add('  - DATADECALCULO                                                                 ');
    Add('    Data apartir do qual serão calculados os proventos.                           ');
    Add('      Obs.: Ano com 4 digitos.                                                    ');
    Add('  - FLGDEGRAVACAO                                                                 ');
    Add('    Indica se deseja gravar na memória de cálculo.                                ');
    Add('      0 - Não grava.                                                              ');
    Add('      1 - Grava.                                                                  ');
    Add('  - FLGTIPODECORRECAO                                                             ');
    Add('    Indica o Tipo de Correção utilizado.                                          ');
    Add('      0 ou Nulo - Caclula Normalmente.                                            ');
    Add('      1 - Calcula com Descontos.                                                  ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { PRO }


{ SALCONTRIB }
procedure TFrmCadFormulaMT.fcOutlookList6Items5Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'SALCONTRIB(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o Salário de Contribuição em uma determinada data.                      ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  SALCONTRIB(DATAREF,{FLGSRB})                                                    ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  SALCONTRIB(06/06/2002)           - PESQUISA TODOS OS OS TIPOS                   ');
    Add('  SALCONTRIB(06/06/2002, {1,2,5})  - PESQUISA SOMENTE OS TIPOS 1,2,5              ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATAREF                                                                       ');
    Add('    Data de referência, formato DD/MM/YYYY.                                       ');
    Add('  - FLGSRB                                                                        ');
    Add('    Tipos de sálarios processados.                                                ');
    Add('      1 - Salário de ativo e mantido                                              ');
    Add('      2 - Benefício pago pela folha de beneficios                                 ');
    Add('      3 - Benefício pago pelo INSS                                                ');
    Add('      4 - Salário Virtual                                                         ');
    Add('      5 - Salário de mantido parcial                                              ');
    Add('      0 - Outro tipo de salário                                                   ');
    Add('      Obs.: Não declarando nada em FLGSRB, serão utilizados todos os tipos acima  ');
    Add('            Com a seguinte ressalva:                                              ');
    Add('              - Se num mês o tipo for 4, serão desconsiderados os tipos 2 e 3.    ');
    Add('                Ex.: {1,2,3} ou {1} ou {1,2,3,4}                                  ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { SALCONTRIB }


{ RUBRINDIV }
procedure TFrmCadFormulaMT.fcOutlookList6Items6Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'RUBRINDIV(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor de uma rubrica individual, executando ou não sua regra de calculo.');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  RUBRINDIV(IDRUBRICA, EXECUTACALCULO, FLGATIVA)                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  RUBRINDIV(01021,N)                                                              ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - IDRUBRICA                                                                     ');
    Add('    Identificador da Rubrica.                                                     ');
    Add('  - EXECUTACALCULO                                                                ');
    Add('    Indica se deve ser executada a Regra de Calculo da Rubrica (S/N).             ');
    Add('    Obs.: Caso não deseje executar a Regra, o valor do campo VALORRUBRICA         ');
    Add('          será retornado.                                                         ');
    Add('  - FLGATIVA (opcional)                                                           ');
    Add('    Indica se pesquisará somente rubricas ativas. Que estão sendo pagas (S/N).    ');
    Add('    Default S.                                                                    ');
    Add('  - FLGDATAINICIO(opcional)                                                       ');//SOL121261 - Ádler Souza
    Add('    Considera data inicial da rubrica (S/N).                                      ');//SOL121261 - Ádler Souza
    Add('                                                                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  Na utilização desta fórmula em ambiente multi-camadas a Regra da rubrica        ');
    Add('  não poderá conter mensagens.                                                    ');

  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { RUBRINDIV }


{ FREQSALARIO }
procedure TFrmCadFormulaMT.fcOutlookList6Items7Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dEdMemo.Text := dEdMemo.Text + 'FREQSALARIO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dEdMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retornar a soma de salários que atendam a uma determinada condição,             ');
    Add('  e a frequência com que esta condição é atendida, em um determinado mês.         ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  FREQSALARIO([RUBRICAS_A_CONSIDERAR], ANO/MES INICIO, ANO/MES FINAL,             ');
    Add('              OPERADOR_CONDICAO, VALOR_CONDICAO, VAR_RETORNO_SOMA,                ');
    Add('              VAR_RETORNO_FREQ,FLGPESQUISATITULAR)                                ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO :                                                                         ');
    Add('  FREQSALARIO([''5001'',''5002'',''5003''],2000/01,2000/05,<=,1000,@SOMA,@FREQ)   ');
    Add('   De acordo com este exemplo a fórmula irá retornar a SOMA e a FREQUENCIA de     ');
    Add('   todas as rubricas 5001, 5002 e 5003 entre o mês de janeiro e maio de 2000, que ');
    Add('   tenham sido menores ou iguais a R$ 1.000,00.                                   ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - RUBRICAS_A_CONSIDERAR                                                         ');
    Add('    Código das rubricas que devem ser consideradas.                               ');
    Add('    FORMATO : O grupo de códigos deve estar entre colchetes, com cada código entre ''');
    Add('    Obs.: Máximo de 50 rubricas.                                                  '); 
    Add('              e separado por vírgula.                                             ');
    Add('  - ANO/MES INICIO                                                                ');
    Add('    Ano/Mês de referência do inicio do periodo a processar.                       ');
    Add('    FORMATO : AAAA/MM                                                             ');
    Add('  - ANO/MES FINAL                                                                 ');
    Add('    Ano/Mês de referência do final do periodo a processar.                        ');
    Add('    FORMATO : AAAA/MM                                                             ');
    Add('  - OPERADOR_CONDICAO                                                             ');
    Add('    Operador de condição para ser considerada na busca.                           ');
    Add('    Os operadores válidos são : >, >=, <, <=, =, <>.                              ');
    Add('  - VALOR_CONDICAO                                                                ');
    Add('    Valor a ser considerado na condição da busca em conjunto com o operador.      ');
    Add('    Deve ser um valor numérico.                                                   ');
    Add('  - VAR_RETORNO_SOMA                                                              ');
    Add('    Variável na qual será retornada a soma das rubricas encontradas na busca.     ');
    Add('  - VAR_RETORNO_FREQ                                                              ');
    Add('    Variável na qual será retornada a frequência das rubricas encontradas na busca.');
    Add('  - FLGPESQUISATITULAR (opcional)                                                  ');
    Add('    Indica se deseja incluir titular na colsulta.                                  ');
    Add('    0 - Não inclui Titular na consulta (default)                                   ');
    Add('    1 - Inclui Titular na consulta.                                                ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { FREQSALARIO }


{ SOMARUBRICA }
procedure TFrmCadFormulaMT.fcOutlookList6Items8Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'SOMARUBRICA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retornar a soma de rubricas, que pertençam a um mesmo grupo, e  que atendam     ');
    Add('  a uma determinada condição,   e a frequência com que esta condição é            ');
    Add('  atendida, em um determinado mês.                                                ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  SOMARUBRICA([CÓDIGO_DO_GRUPO,INDICE,...], DATA DE INICIO, NUMMESESPESQUISA,     ');
    Add('              FLGGRAVACAO, INDICETETO, PESQUISACONTINUA, LIMITEPESQUISA,          ');
    Add('              TIPOCALCULO,FILTRAPATRO)                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  SOMARUBRICA([1,@INPC],01/01/2001,12,1,@INPC,0,0)                                   ');
    Add('  De acordo com este exemplo a fórmula irá retornar a SOMA das rubricas que       ');
    Add('  estejam contidas em um mesmo grupo apartir do mês de janeiro de 2001.           ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - CODIGO_DO_GRUPO                                                               ');
    Add('    Código do grupo das rubricas que devem ser consideradas.                      ');
    Add('      FORMATO : O grupo de códigos deve estar entre colchetes, com cada código    ');
    Add('                entre '''' (plics) e separado por vírgula.                        ');
    Add('  - INDICE                                                                        ');
    Add('    Indica o Indice, previamente cadastrado como Moeda que irá indexar estas      ');
    Add('    rubricas.                                                                     ');
    Add('  - DATA DE INICIO                                                                ');
    Add('    Data de referência do inicio do periodo a processar.                          ');
    Add('    Formato : DD/MM/AAAA                                                          ');
    Add('  - NUMMESESPESQUISA                                                              ');
    Add('    Número de meses para pesquisa.                                                ');
    Add('  - FLGGRAVACAO  (Caso SRB)                                                       ');
    Add('    0 - Não Grava variaveis de retorno na Memória de Cálculo.                     ');
    Add('    1 - Grava variaveis de retorno na Memória de Cálculo.                         ');
    Add('  - INDICETETO (opcional)                                                         ');
    Add('    Sigla da Moeda usada como teto das rubricas.                                  ');
    Add('    Busca indice no mesmo periodo indicado para calculo.                          ');
    Add('  - PESQUISACONTINUA  (Caso SRB)                                                  ');
    Add('    Indica se a pesquisa continuará caso os NUMMESESPESQUISA não tenham sido pree-');
    Add('    chidos no perido pesquisado inicalmente.                                      ');
    Add('    0 - Pesquisa apenas em NUMMESESPESQUISA.                                      ');
    Add('    1 - Continua retroagindo até preencher os NUMMESESPESQUISA.                   ');
    Add('  - LIMITEPESQUISA (Caso SRB)                                                     ');
    Add('    Indica o número limite de meses a retroagir a pesquisa.                       ');
    Add('  - TIPOCALCULO (opcional) (Caso SRB)                                             ');
    Add('    Indica o tipo de correção desejado                                            ');
    Add('    1 - Utilizar índice de tabela de moeda (default)                              ');
    Add('    2 - Utilizar índice de reajuste da patrocinadora                              ');
    Add('  - FILTRAPATRO (opcional)                                                        ');
    Add('    Indica se irá filtrar consulta por patrocinadora                              ');
    Add('    S - Utilizar filtro com o IDPESSJUR da consulta de entrada.                   ');
    Add('    N - Não utilizar filtro (default).                                            ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { SOMARUBRICA }


{ MEDIARUBRICA }
procedure TFrmCadFormulaMT.fcOutlookList6Items9Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'MEDIARUBRICA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;

  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retornar a Medias das Rubricas do(s) grupos(s) desejados.                       ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  MEDIARUBRICA([CÓDIGO_DO_GRUPO,INDICEGRUPO,....], DATA DE INICIO,                ');
    Add('               NUMMESESPESQUISA, NUMMESESMEDIA, FLGGRAVACAO, INDICETETO,          ');
    Add('               TIPOCALCULO)                                                       ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  MEDIARUBRICA( [''1'',@INPC],01/06/2001,12,60,0 )                                ');
    Add('  De acordo com este exemplo a fórmula irá retornar a SOMA das rubricas que       ');
    Add('  estejam contidas em um mesmo grupo entre o mês de janeiro e maio de 2000.       ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add(' - CODIGO_DO_GRUPO                                                                ');
    Add('   Código do grupo das rubricas que devem ser consideradas.                       ');
    Add('     FORMATO : O grupo de códigos deve estar entre colchetes, com cada código     ');
    Add('               entre '''' (pilcs) e separado por vírgula.                         ');
    Add(' - INDICE                                                                         ');
    Add('   Indica o Indice, previamente cadastrado como Moeda que irá indexar estas       ');
    Add(' - DATA DE INICIO                                                                 ');
    Add('   Data de referência do inicio do periodo a processar.                           ');
    Add('   FORMATO : DD/MM/AAAA                                                           ');
    Add(' - NUMMESESPESQUISA                                                               ');
    Add('   Numero de meses para pesquisar a existencia da rubrica.                        ');
    Add(' - NUMMESESMEDIA                                                                  ');
    Add('   Numero de meses para processo da Média.                                        ');
    Add(' - FLGGRAVACAO                                                                    ');
    Add('   0 - Não Grava variaveis de retorno na Memória de Cálculo.                      ');
    Add('   1 - Grava variaveis de retorno na Memória de Cálculo.                          ');
    Add(' - INDICETETO (opcional)                                                          ');
    Add('   Sigla da Moeda usada como teto das rubricas.                                   ');
    Add('   Busca indice no mesmo periodo indicado para calculo.                           ');
    Add('  - TIPOCALCULO (opcional)                                                        ');
    Add('    Indica o tipo de correção desejado                                            ');
    Add('    1 - Utilizar índice de tabela de moeda                                        ');
    Add('    2 - Utilizar índice de reajuste da patrocinadora                              ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { MEDIARUBRICA }


{ BUSCAPERCENTUAL }
procedure TFrmCadFormulaMT.fcOutlookList6Items10Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'BUSCAPERCENTUAL(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Permite buscar o percentual de reajuste da patrocinadora em uma data.           ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  BUSCAPERCENTUAL(DATAREF)                                                        ');
    Add('EXEMPLO:                                                                          ');
    Add('  BUSCAPERCENTUAL(05/06/2002)                                                     ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATAREF                                                                       ');
    Add('    Data de referência, formato DD/MM/YYYY.                                       ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end; { BUSCAPERCENTUAL }


{ MEDPERCRUB }
procedure TFrmCadFormulaMT.fcOutlookList6Items11Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'MEDPERCRUB(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna a média dos percentuais das rubricas encontradas no periodo informado   ');
    Add('  (QTDEMESES) a partir de uma determinada data (DATAREF).                         ');
    Add('-------------------------------------------------------------------------------   ');
    Add('SINTAXE:                                                                          ');
    Add('  MEDPERCRUB([RUBRICA1, RUBRICA2,...]DATAREF,QTDMESES)                            ');
    Add('EXEMPLO:                                                                          ');
    Add('  MEDPERCRUB([001021, 03011,...]01/02/2002,10)                                    ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - RUBRICAn                                                                      ');
    Add('    Identificador das Rubricas processadas.                                       ');
    Add('  - DATAREF                                                                       ');
    Add('    Data de referência do processo, formato DD/MM/YYYY.                           ');
    Add('  - QTDMESES                                                                      ');
    Add('    Quantidade de meses a processar.                                              ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { MEDPERCRUB }


{ NUMOCORRUB }
procedure TFrmCadFormulaMT.fcOutlookList6Items12Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'NUMOCORRUB(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o número de vezes que a(s) rubrica(s) ocorreram no prazo informado.     ');
    Add('  Pode se passa os grupos em que elas estão contidas.                             ');
    Add('-------------------------------------------------------------------------------   ');
    Add('SINTAXE:                                                                          ');
    Add('  NUMOCORRUB([RUBRICA1,RUBRICA2,RUBRICA3...]DATAREF,QTDEMESES, TIPOPESQUISA)      ');
    Add('EXEMPLO:                                                                          ');
    Add('  NUMOCORRUB([001021, 03011,...]01/02/2002,10, R)                                    ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - RUBRICAn                                                                      ');
    Add('    Identificador das Rubricas processadas.                                       ');
    Add('  - DATAREF                                                                       ');
    Add('    Data de referência do processo, formato DD/MM/YYYY.                           ');
    Add('  - QTDMESES                                                                      ');
    Add('    Quantidade de meses a processar.                                              ');
    Add('  - TIPOPESQUISA (opcional)                                                       ');
    Add('    Tipo de Pesquisa a executar.                                                  ');
    Add('      R - Selecionará utilizando os códigos das Rubricas (default)                ');
    Add('      G - Selecionará utilizando os Grupos das Rubricas                           ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { NUMOCORRUB }


{ VLRRUBMES}
procedure TFrmCadFormulaMT.fcOutlookList6Items13Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VLRRUBMES(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor da Rubrica para o  Ano/Mês da data de refêrencia.               ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  VLRRUBMES(RUBRICA,DATA)                                                         ');
    Add('EXEMPLO:                                                                          ');
    Add('  VLRRUBMES(020100,01/02/2002)                                                    ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - RUBRICA                                                                       ');
    Add('    Código da Rubrica, pesquisado no campo CODPROVDESC.                           ');
    Add('  - DATAREF (opcional)                                                            ');
    Add('    Data de referência do processo, formato DD/MM/YYYY.                           ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  Caso não seja informado o parâmetro DATAREF será feita a pesquisa com o último  ');
    Add('  mês encontrado.                                                                    ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { VLRRUBMES}


{ VLRREFRUBMES }
procedure TFrmCadFormulaMT.fcOutlookList6Items14Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VLRREFRUBMES(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor da Referência da rubrica para o  Ano/Mês da data de refêrencia. ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  VLRREFRUBMES(RUBRICA,DATA,FLGTIPORETORNO)                                       ');
    Add('EXEMPLO:                                                                          ');
    Add('  VLRREFRUBMES(020100,01/02/2002,0)                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - RUBRICA                                                                       ');
    Add('    Código da Rubrica, pesquisado no campo CODPROVDESC.                           ');
    Add('  - DATAREF                                                                       ');
    Add('    Data de referência do processo, formato DD/MM/YYYY.                           ');
    Add('  - FLGTIPORETORNO                                                                ');
    Add('     0 - Retorna primeiro valor encontrado (default)                              ');
    Add('     1 - Retorna maior valor encontrado (comparação no formato CARACTER)          ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { VLRREFRUBMES }



{ VLRFAIXA }
procedure TFrmCadFormulaMT.fcOutlookList8Items21Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VLRFAIXA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor da faixa na data de referência, independente do Grupo/Nivel     ');
    Add('  estar vigente na Função/Cargo da pessoa ou não.                                 ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  VLRFAIXA(CODGRUPONIVEL,TIPO,NUMFAIXA,DATAREF)                                   ');
    Add('EXEMPLO:                                                                          ');
    Add('  VLRFAIXA(01102,C,10,01/02/2002)                                                 ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - CODGRUPONIVEL                                                                 ');
    Add('    Código do Grupo/Nível.                                                        ');
    Add('  - TIPO                                                                          ');
    Add('    Tipo a processar.                                                             ');
    Add('      C - Cargo.                                                                  ');
    Add('      N - Função.                                                                 ');
    Add('  - NUMFAIXA                                                                      ');
    Add('    Número da Faixa.                                                              ');
    Add('  - DATAREF                                                                       ');
    Add('    Data de referência do processo, formato DD/MM/YYYY.                           ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { VLRFAIXA }


{ ADICIONALDIA }
procedure TFrmCadFormulaMT.fcOutlookList8Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'ADICIONALDIA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);

  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retornar o percentual do Adicional (T.Serviço, Periculosidade, Insalubridade,   ');
    Add('                                      Compensatório, Noturno ou Incorporação)     ');
    Add('  de um participante no dia do parâmetro DATAREF.                                 ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  ADICIONALDIA(DATAREF, TIPOADICIONAL, CONSIDERA DATA FINAL )                     ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add(' - DATAREF                                                                        ');
    Add('    Data na qual se deseja verificar o adicional.                                 ');
    Add(' - TIPOADICIONAL                                                                  ');
    Add('    T  - ATS                                                                      ');
    Add('    P  - Periculosidade                                                           ');
    Add('    I  - Insalubridade                                                            ');
    Add('    C  - Adicional Compensatório (Primeiro Percentual)                            ');
    Add('    N  - Adicional Noturno                                                        ');
    Add('    C2 - Adicional Compensatório (Primeiro e Segundo Percentual)                  ');
    Add('    A  - Adicional de Incorporação                                                ');
    Add(' - CONSIDERA DATA FINAL                                                           ');
    Add('    Indica se a formula irá considerar a data final do registro na consulta.      ');
    Add('      0 ou Nulo - Considera data final                                            ');
    Add('      1 - Não cosidera data final (retorna registro mais recente)                 ');
    Add('----------------------------------------------------------------------------------');
     Add('OBSERVAÇÃO:                                                                      ');
    Add(' Caso a fórmula não encontre nenhum adicional será retornado valor ZERO.          ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { ADICIONALDIA }


{ ADICIONALMES }
procedure TFrmCadFormulaMT.fcOutlookList8Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'ADICIONALMES(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Clear;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retornar o percentual do Adicional (T.Serviço, Periculosidade, Insalubridade,   ');
    Add('                                      Compensatório, Noturno ou Incorporação)     ');
    Add('  de um participante em um determinado mês.                                       ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  ADICIONALMES(ANOMESREFERENCIA,TIPO_ADICIONAL,SEQUENCIA,VARIAVELNUMDIAS,         ');
    Add('               VARIAVELPERCADIC)                                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add(' - ANOMESREFERENCIA                                                               ');
    Add('    Ano/Mês no qual se deseja verificar o adicional.                              ');
    Add(' - TIPO_ADICIONAL                                                                 ');
    Add('    T  - ATS                                                                      ');
    Add('    P  - Periculosidade                                                           ');
    Add('    I  - Insalubridade                                                            ');
    Add('    C  - Adicional Compensatório (Primeiro Percentual)                            ');
    Add('    N  - Adicional Noturno                                                        ');
    Add('    C2 - Adicional Compensatório (Primeiro e Segundo Percentual)                  ');
    Add('    A  - Adicional de Incorporação                                                ');
    Add(' - SEQUENCIA                                                                      ');
    Add('    Indica se o adicional desejado é o primeiro ( 1 ), segundo ( 2 ), terceiro ( 3 ), etc. ');
    Add(' - VARIAVELNUMDIAS                                                                ');
    Add('    Variável na qual será retornado o número de dias em que o participante ficou  ');
    Add('    na sequência indicada.                                                        ');
    Add(' - VARIAVELPERCADIC                                                               ');
    Add('    Variável na qual será retornado o percentual/valor do adicional que o         ');
    Add('    participante possuia na sequência indicada.                                   ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { ADICIONALMES }



{ BUSCAPCS }
procedure TFrmCadFormulaMT.fcOutlookList8Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'BUSCAPCS(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retornar o Plano de Cargos e Salários que pertence um cargo, ou um participante.');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    ADD('  BUSCAPCS(TIPODEBUSCA, CODIGOCARGO)                                              ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - TIPO                                                                          ');
    Add('    Indica o tipo de busca a ser executada.                                       ');
    Add('    C : busca por cargo                                                           ');
    Add('    P : busca por participante                                                    ');
    Add('  - CODIGOCARGO (opcional)                                                        ');
    Add('    Código do cargo desejado. Preencher apenas para o caso de busca tipo C.       ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { BUSCAPCS }


{ CFPESSOA }
procedure TFrmCadFormulaMT.fcOutlookList8Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'CFPESSOA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:');
    Add('  Retornar o Código de um Cargo, Função ou Função do Adicional Compensatório            ');
    Add('  (VARIAVELRETORNO1) e o número de dias que o mesmo ocorreu no mês da data de           ');
    Add('  referência para um determinada pessoa (VARIAVELRETORNO2),se existir no mês algum      ');
    Add('  cargo/função com a sequência indicada e o modo do cargo/função (VARIAVELRETORNO3).    ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                                ');
    Add(' CFPESSOA(DATAREF,TIPO,SEQUENCIA,VARIAVELRETORNO1,VARIAVELRETORNO2,VARIAVELDERETORNO3,  ');
    Add('          [MODODEFUNCAO1,MODODEFUNCAO2,MODODEFUNCAO3],SOMENTE_CF_ATIVO)                   ');
    Add('----------------------------------------------------------------------------------      ');
    Add('EXEMPLO:                                                                                ');
    Add(' CFPESSOA(01/02/2002,C,1,@VARRETORNO1,@VARRETORNO2,@VARRETORNO3,[AS,EF],N)              ');
    Add('----------------------------------------------------------------------------------      ');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                               ');
    Add('- DATAREF                                                                               ');
    Add('  Indica a data de referência que se deseja verificar.                                  ');
    Add('- TIPO                                                                                  ');
    Add('  Indica o tipo de item de cálculo do PCS que se está calculando.                       ');
    Add('  (C - Cargo, F - Função, AC - Adicional Compensatório  (Primeiro Percentual))          ');
    Add('- SEQUENCIA                                                                             ');
    Add('  Indica a sequencia que se deseja verificar, ou seja, se é o primeiro cargo do mês     ');
    Add('  (1) se é o segundo cargo do mês (2).                                                  ');
    Add('- VARIAVELRETORNO1                                                                      ');
    Add('  Variavel que retornará o cargo/nivel ou o grupo/função encontrado.                    ');
    Add('- VARIAVELRETORNO2                                                                      ');
    Add('  Variavel que retornará o número de ocorrências encontrado.                            ');
    Add('- VARIAVELRETORNO3 (opcional)                                                           ');
    Add('  Variavel que retornará o modo do cargo/função.                                        ');
    Add('- MODODEFUNCAO(opcional)                                                                ');
    Add('  Indica o Modo da Função desejado na pesquisa.                                         ');
    Add('- SOMENTE_CF_ATIVO(opcional)                                                            ');
    Add('    Indicada se somente pesquisará CARGO/FUNÇÃO ativos.                                 ');
    Add('    S - Sim, somente pesquisa ativos (com Data Final em branco)                         ');
    Add('    N - Não, pode ou não estar ativo (com Data Final preenchida ou em branco)           ');

  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { CFPESSOA }


{ GRUPOPESSOA }
procedure TFrmCadFormulaMT.fcOutlookList8Items5Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'GRUPOPESSOA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:');
    Add('  Retorna o código do grupo de função no qual se encontra ou encontrava uma       ');
    Add('  pessoa em uma determinada data.                                                 ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  GRUPOPESSOA(DATAREF)                                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  GRUPOPESSOA(01/06/2001)                                                         ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATAREF                                                                       ');
    Add('    Data de referência, formato DD/MM/YYYY.                                       ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { GRUPOPESSOA }

{ MAIORCF }
procedure TFrmCadFormulaMT.fcOutlookList8Items6Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'MAIORCF(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retornar o valor do MAIOR CARGO/FUNCAO na tabela de CARGOS e FUNÇÕES            ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  MAIORCF(TIPO, DATAREF, INDICADOR_PCC )                                          ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add(' - TIPO                                                                           ');
    Add('    Indica se deseja buscar o valor do CARGO(C) ou FUNCAO(F)                      ');
    Add(' - DATAREF                                                                        ');
    Add('    Data na qual se deseja buscar o valor do CARGO/FUNCAO                         ');
    Add(' - INDICADOR_PCC                                                                  ');
    Add('    Indicador de se o cargo/função deve pertencer ao PCC ou não.                  ');
    Add('    S - Sim, cargo/função deve pertencer ao PCC                                   ');
    Add('    N - Não, cargo/função não deve pertencer ao PCC                               ');
    Add('    I - Fazer a busca INDEPENDENTE de perterncer ou não ao PCC                    ');
    Add('                                                                                  ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { MAIORCF }


{ NIVELPESSOA }
procedure TFrmCadFormulaMT.fcOutlookList8Items7Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'NIVELPESSOA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o código do código do nível de cargo no qual se encontra ou encontrava  ');
    Add('  uma pessoa em uma determinada data.                                             ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  NIVELPESSOA(DATAREF)                                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  NIVELPESSOA(01/06/2001)                                                         ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARÂMETROS:                                                         ');
    Add('  - DATAREF                                                                       ');
    Add('    Data de referência, formato DD/MM/YYYY.                                       ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { NIVELPESSOA }


{ NUMDIASADICIONAL }
procedure TFrmCadFormulaMT.fcOutlookList8Items8Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'NUMDIASADICIONAL('; 
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retornar o número de dias no mês indicado que o participante teve um            ');
    Add('  determinado adicional.                                                          ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  NUMDIASADICIONAL(ANOMESREFERENCIA,TIPO_ADICIONAL)                               ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  NUMDIASADICIONAL(1999/02, T)                                                    ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add(' - ANOMESREFERENCIA                                                               ');
    Add('    Ano/Mês no qual se deseja calcular o número de dias do adicional.             ');
    Add(' - TIPO_ADICIONAL                                                                 ');
    Add('    T  - ATS                                                                      ');
    Add('    P  - Periculosidade                                                           ');
    Add('    I  - Insalubridade                                                            ');
    Add('    C  - Adicional Compensatório (Primeiro Percentual)                            ');
    Add('    N  - Adicional Noturno                                                        ');
    Add('    C2 - Adicional Compensatório (Primeiro e Segundo Percentual)                  ');
    Add('    A  - Adicional de Incorporação                                                ');
    Add('----------------------------------------------------------------------------------');
     Add('OBSERVAÇÃO:                                                                      ');
    Add('  Caso a fórmula não encontre nenhum adicional ela retornará o valor ZERO.        ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { NUMDIASADICIONAL }


{ NUMDIASPERCADICIONAL }
procedure TFrmCadFormulaMT.fcOutlookList8Items9Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'NUMDIASPERCADICIONAL(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retornar o número de dias no mês indicado que o participante teve um            ');
    Add('  determinado adicional, com o percentual indicado.                               ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  NUMDIASPERCADICIONAL(ANOMESREF, TIPO_ADICIONAL, PERCENTUAL)                     ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add(' - ANOMESREFERENCIA                                                               ');
    Add('    Ano/Mês no qual se deseja calcular o número de dias do adicional.             ');
    Add(' - TIPO_ADICIONAL                                                                 ');
    Add('    T  - ATS                                                                      ');
    Add('    P  - Periculosidade                                                           ');
    Add('    I  - Insalubridade                                                            ');
    Add('    C  - Adicional Compensatório (Primeiro Percentual)                            ');
    Add('    N  - Adicional Noturno                                                        ');
    Add('    C2 - Adicional Compensatório (Primeiro e Segundo Percentual)                  ');
    Add('    A  - Adicional de Incorporação                                                ');
    Add(' - PERCENTUAL                                                                     ');
    Add('    Percentual que se deseja procurar para calcular o número de dias do adicional.');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  1. Caso a fórmula não encontre nenhum adicional ela retornará o valor ZERO.     ');
    Add('  2. A diferença desta fórmula para a NUMDIASADICIONAL é que nesta deve ser       ');
    Add('     informado também o percentual a ser procurado.                               ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { NUMDIASPERCADICIONAL }


{ PERCENTUALFUNCAO }
procedure TFrmCadFormulaMT.fcOutlookList8Items10Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'PERCENTUALFUNCAO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);

  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retornar o percentual de função que o participante possuia em uma determinada   ');
    Add('  data.                                                                           ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  PERCENTUALFUNCAO(01/02/2002, 01002, F)                                          ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  PERCENTUALFUNCAO(DATAREF, COD_FUNCAO, TIPO)                                     ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add(' - DATAREF                                                                        ');
    Add('   Data na qual se deseja verificar o percentual.                                 ');
    Add(' - COD_FUNCAO                                                                     ');
    Add('   Código da função desejada.                                                     ');
    Add(' - TIPO                                                                           ');
    Add('   F - Função (default)                                                           ');
    Add('   A - Adicional Compensatório                                                    ');
  end;

end; { PERCENTUALFUNCAO }


{ TOTALCFMES }
procedure TFrmCadFormulaMT.fcOutlookList8Items11Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dEdMemo.Text := dEdMemo.Text + 'TOTALCFMES(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dEdMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
     Add('OBJETIVO:                                                                        ');
     Add('  Retornar a soma dos valores de todos os CARGOS/FUNCAO em um determinado mês.   ');
     Add('---------------------------------------------------------------------------------');
     Add('SINTAXE:                                                                         ');
     Add('  TOTALCFMES(TIPO,DATAREF)                                                       ');
     Add('---------------------------------------------------------------------------------');
     Add('EXEMPLO:                                                                         ');
     Add('  TOTALCFMES(C,12/01/2000)                                                       ');
     Add('    TIPO: CARGO, DATA DE referência: 12/01/2000                                  ');
     Add('---------------------------------------------------------------------------------');
     Add('DESCRIÇÃO DOS PARAMETROS:                                                        ');
     Add('  - TIPO (C OU F)                                                                ');
     Add('    Indica se a Fórmula processará CARGOS (C) ou FUNÇÕES (F).                    ');
     Add('  - DATAREF                                                                      ');
     Add('    Data de referência, formato DD/MM/YYYY.                                      ');
     Add('      Obs.: Fórmula utilizará o ano/mês desta data.                              ');
     Add('---------------------------------------------------------------------------------');
     Add('OBSERVAÇÃO:                                                                      ');
     Add('  O valor do CARGO/FUNÇÃO nesta fórmula é buscado da tabela de CARGOS/FUNÇÃO     ');
     Add('  e NÃO do HISTÓRICO FUNCIONAL.                                                  ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { TOTALCFMES }

{ VALORCF }
procedure TFrmCadFormulaMT.fcOpcoesOutlookList1Items11Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  
  dedMemo.Text := dedMemo.Text + 'VALORCF(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retornar o valor de um CARGO/FUNCAO de um participante em uma determinada data. ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  VALORCF(TIPO,DATAREF,CODIGO,MODOFUNÇÃO, @PISOMERCADO, @PISOMERCADOLIC)          '); 
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  VALORCF(C,01/02/2001,421, EF)                                                   ');
    Add('  VALORCF(C,01/02/2001,421, EF, @PISOMERCADO, @PISOMERCADOLIC)                    ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add(' - TIPO                                                                           ');
    Add('    Indica se deseja buscar o valor do CARGO(C) ou FUNCAO(F)                      ');
    Add('  - DATAREF                                                                       ');
    Add('    Data de referência, formato DD/MM/YYYY.                                       ');
    Add('  - CODIGO (opcional)                                                             ');
    Add('    Codigo de pesquisa.                                                           ');
    Add('  - MODOFUNÇÃO (opcional)                                                         '); 
    Add('    Este parâmetro só é considerado para o tipo F (função) e indica o modo da     '); 
    Add('    função que deseja se buscar. Os valores considerados são :                    '); 
    Add('    EF - EFETIVA                                                                  '); 
    Add('    AS - ASSEGURADA                                                               '); 
    Add('    ES - EVENTUAL/SUBSTITUIÇÃO                                                    '); 
    Add('    DP - DESIGNAÇÃO POR PRAZO                                                     '); 
    Add('    FA - FACULTATIVA                                                              '); 
    Add('    BF - BOLSA DE FUNÇÃO                                                          '); 
    Add('    ET - ESTRATÉGICA                                                              '); 
    Add('    ATENÇÃO : Este parâmetro não pode conter uma variável.                        '); 
    Add('  - PISOMERCADO (opcional)                                                        '); 
    Add('    Variável de retorno do valor de mercado                                       '); 
    Add('    ATENÇÃO : Este parâmetro só podera ser utilizado quanto o TIPO for FUNCAO(F)  '); 
    Add('  - PISOMERCADOLIC (opcional)                                                     '); 
    Add('    Variável de retorno do valor de mercado dos Licenciados                       '); 
    Add('    ATENÇÃO : Este parâmetro só podera ser utilizado quanto o TIPO for FUNCAO(F)  '); 
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  1. Esta fórmula busca o CARGO/FUNCAO que o participante ocupava na data indicada');
    Add('     e, com este CARGO/FUNCAO, busca o seu valor na tabela de CARGOS/FUNÇÕES.     ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

{ VALORCF }
procedure TFrmCadFormulaMT.fcOutlookList8Items12Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VALORCF(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retornar o valor de um CARGO/FUNCAO de um participante em uma determinada data. ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  VALORCF(TIPO,DATAREF,CODIGO,MODOFUNÇÃO, @PISOMERCADO, @PISOMERCADOLIC)          '); 
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  VALORCF(C,01/02/2001,421, EF)                                                   ');
    Add('  VALORCF(C,01/02/2001,421, EF, @PISOMERCADO, @PISOMERCADOLIC)                    ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add(' - TIPO                                                                           ');
    Add('    Indica se deseja buscar o valor do CARGO(C) ou FUNCAO(F)                      ');
    Add('  - DATAREF                                                                       ');
    Add('    Data de referência, formato DD/MM/YYYY.                                       ');
    Add('  - CODIGO (opcional)                                                             ');
    Add('    Codigo de pesquisa.                                                           ');
    Add('  - MODOFUNÇÃO (opcional)                                                         '); 
    Add('    Este parâmetro só é considerado para o tipo F (função) e indica o modo da     '); 
    Add('    função que deseja se buscar. Os valores considerados são :                    '); 
    Add('    EF - EFETIVA                                                                  '); 
    Add('    AS - ASSEGURADA                                                               '); 
    Add('    ES - EVENTUAL/SUBSTITUIÇÃO                                                    '); 
    Add('    DP - DESIGNAÇÃO POR PRAZO                                                     '); 
    Add('    FA - FACULTATIVA                                                              '); 
    Add('    BF - BOLSA DE FUNÇÃO                                                          '); 
    Add('    ET - ESTRATÉGICA                                                              '); 
    Add('    ATENÇÃO : Este parâmetro não pode conter uma variável.                        '); 
    Add('  - PISOMERCADO (opcional)                                                        '); 
    Add('    Variável de retorno do valor de mercado                                       '); 
    Add('    ATENÇÃO : Este parâmetro só podera ser utilizado quanto o TIPO for FUNCAO(F)  '); 
    Add('  - PISOMERCADOLIC (opcional)                                                     '); 
    Add('    Variável de retorno do valor de mercado dos Licenciados                       '); 
    Add('    ATENÇÃO : Este parâmetro só podera ser utilizado quanto o TIPO for FUNCAO(F)  '); 
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  1. Esta fórmula busca o CARGO/FUNCAO que o participante ocupava na data indicada');
    Add('     e, com este CARGO/FUNCAO, busca o seu valor na tabela de CARGOS/FUNÇÕES.     ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { VALORCF }


{ VERFUNCAOPCC }
procedure TFrmCadFormulaMT.fcOutlookList8Items13Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VERFUNCAOPCC(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retornar se uma determinada FUNCAO percetence a um PCC.                         ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add(' VERFUNCAOPCC(CODIGOFUNCAO)                                                       ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  VERFUNCAOPCC(0120001)                                                           ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - CODIGOFUNCAO                                                                  ');
    Add('    Indica o codigo da função que se deseja verificar.                            ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  Para buscar o código da FUNCAO que o participante ocupou em uma determinada     ');
    Add('  data utilize a fórmula CFMES                                                    ');
  end;
end; { VERFUNCAOPCC }


{ BUSCAFUNCAOADICCOMP }
procedure TFrmCadFormulaMT.fcOutlookList8Items14Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'BUSCAFUNCAOADICCOMP(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Buscar a função correspondente a um Adicional Compensatório em uma              ');
    Add('  determinada data                                                                ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add(' BUSCAFUNCAOADICCOMP(DATAREF)                                                     ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  BUSCAFUNCAOADICCOMP(DATAREF)                                                    ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add(' - DATAREF                                                                        ');
    Add('    Indica a data na qual se deseja verificar o Adicional Compensatório           ');
    Add('    e buscar sua função correspondente.                                           ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { BUSCAFUNCAOADICCOMP }


{ QTDMINUTOS }
procedure TFrmCadFormulaMT.fcOutlookList8Items15Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'QTDMINUTOS(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:');
    Add('  Buscar a quantidade de minutos para o Adicional Noturno ocorridos entre duas    ');
    Add('  datas.                                                                          ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  QTDMINUTOS(DATAMAIOR, DATAMENOR)                                                ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  QTDMINUTOS(01/12/2002, 02/02/2002)                                              '); 
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add(' - DATAMAIOR                                                                      ');
    Add('    Indica a data de inicio da pesquisa.                                          ');
    Add(' - DATAMENOR                                                                      ');
    Add('    Indica a data de fim da pesquisa.                                             ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { QTDMINUTOS }


{ CFPBC }
procedure TFrmCadFormulaMT.fcOutlookList8Items16Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'CFPBC(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retornar o valor médio do Cargo/Função apurado em um prazo determinado.         ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  CFPBC(DATAREF, PRAZO, TIPO, FLGGRAVACAO, [ANOMESRETORNO1, VALORRETORNO1,        ');
    Add('                                            ANOMESRETORNO2, VALORRETORNO2,...])   ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  CFPBC(DATA,12,C,0, [@ANOMES1, @VAL1, @ANOMES2, @VAL2, @ANOMES3, @VAL3,          ');
    Add('                      @ANOMES4, @VAL4, @ANOMES5, @VAL5, @ANOMES6, @VAL6,          ');
    Add('                      @ANOMES7, @VAL7, @ANOMES8, @VAL8, @ANOMES9, @VAL9,          ');
    Add('                      @ANOMES10,@VAL10,@ANOMES11,@VAL11,@ANOMES12,@VAL12])        ');
    Add('  De acordo com este exemplo a fórmula irá retornar a composição para 12 meses,   ');
    Add(' retornando todas as variáveis do prazo                                           ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATAREF                                                                       ');
    Add('    Indica inicio do periodo a processar, formato DD/MM/YYYY.                     ');
    Add('  - PRAZO                                                                         ');
    Add('    Prazo em meses a processar.                                                   ');
    Add('  - TIPO                                                                          ');
    Add('    C - Cargo                                                                     ');
    Add('    F - Função                                                                    ');
    Add('    A - Adicional Compensatório                                                   ');
    Add('  - FLGGRAVACAO                                                                   ');
    Add('    0 - Não Grava variaveis de retorno na Memória de Cálculo.                     ');
    Add('    1 - Grava variaveis de retorno na Memória de Cálculo.                         ');
    Add('  - VARIAEVIS DE RETORNO (opcional)                                               ');
    Add('    Grupos de ANOMES, VALOR                                                       ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { CFPBC }


{ FUNDATAFINAL }
procedure TFrmCadFormulaMT.fcOutlookList8Items17Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'FUNDATAFINAL(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna a DATA FINAL do Cargo, Função ou Adicional Compensatório.               ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  FUNDATAFINAL(CODIGO, TIPO)                                                      ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  FUNDATAFINAL(1000, F)                                                           ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add(' - CODIGO                                                                         ');
    Add('   Código a Pesquisar                                                             ');
    Add(' - TIPO                                                                           ');
    Add('   C - Cargo                                                                      ');
    Add('   F - Função                                                                     ');
    Add('   A - Adicional Compensatório                                                    ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { FUNDATAFINAL }


{ PERCFUNPBC }
procedure TFrmCadFormulaMT.fcOutlookList8Items18Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'PERCFUNPBC(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna os percentuais, códigos e modos para cada função (inclusive AC)         ');
    Add('  encontrada no periodo do cálculo do PBC.                                        ');
    Add('  Nas 3 variaveis de Retorno, preenche os 3 primeiros grupos de dados.            ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  PERCFUNPBC(DATA, PERIODO, TIPO, VARGRUPO1, VARGRUPO2, VARGRUPO3)                ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  PERCFUNPBC(01/10/2001,365,F,@GRUPO1,@GRUPO2,@GRUPO3)                            ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add(' - DATA                                                                           ');
    Add('   Data de referência                                                             ');
    Add(' - PERIODO                                                                        ');
    Add('   Periodo a Processar                                                            ');
    Add(' - TIPO                                                                           ');
    Add('   C  - Cargo                                                                     ');
    Add('   F  - Função                                                                    ');
    Add('   A  - Adicional Compensatório                                                   ');
    Add('   A2 - Adicional Compensatório (Primeiro e Segundo Percentual)                   ');
    Add(' - VARGRUPOn                                                                      ');
    Add('   Variaveis de Retorno dos 3 primeiros grupos.                                   ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { PERCFUNPBC }

{ VLRCF }
procedure TFrmCadFormulaMT.fcOpcoesOutlookList3Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VLRCF(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor do Cargo/Função passando-se o Código do mesmo.                  ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  VLRCF(CODIGO, TIPO, @PISOMERCADO, @PISOMERCADOLIC)                              ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  VLRCF(@CODIGO, F)                                                               ');
    Add('  VLRCF(@CODIGO, F, @PISOMERCADO, @PISOMERCADOLIC)                                ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add(' - CODIGO                                                                         ');
    Add('   Código do Cargo/Função a pesquisar.                                            ');
    Add(' - TIPO                                                                           ');
    Add('   C - Cargo.                                                                     ');
    Add('   F - Função.                                                                    ');
    Add('  - PISOMERCADO (opcional)                                                        ');
    Add('    Variável de retorno do valor de mercado                                       ');
    Add('    ATENÇÃO : Este parâmetro só podera ser utilizado quanto o TIPO for FUNCAO(F)  ');
    Add('  - PISOMERCADOLIC (opcional)                                                     ');
    Add('    Variável de retorno do valor de mercado dos Licenciados                       ');
    Add('    ATENÇÃO : Este parâmetro só podera ser utilizado quanto o TIPO for FUNCAO(F)  ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

{ VLRCF }
procedure TFrmCadFormulaMT.fcOutlookList8Items19Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VLRCF(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor do Cargo/Função passando-se o Código do mesmo.                  ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  VLRCF(CODIGO, TIPO, @PISOMERCADO, @PISOMERCADOLIC)                              ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  VLRCF(@CODIGO, F)                                                               ');
    Add('  VLRCF(@CODIGO, F, @PISOMERCADO, @PISOMERCADOLIC)                                ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add(' - CODIGO                                                                         ');
    Add('   Código do Cargo/Função a pesquisar.                                            ');
    Add(' - TIPO                                                                           ');
    Add('   C - Cargo.                                                                     ');
    Add('   F - Função.                                                                    ');
    Add('  - PISOMERCADO (opcional)                                                        '); 
    Add('    Variável de retorno do valor de mercado                                       '); 
    Add('    ATENÇÃO : Este parâmetro só podera ser utilizado quanto o TIPO for FUNCAO(F)  '); 
    Add('  - PISOMERCADOLIC (opcional)                                                     '); 
    Add('    Variável de retorno do valor de mercado dos Licenciados                       '); 
    Add('    ATENÇÃO : Este parâmetro só podera ser utilizado quanto o TIPO for FUNCAO(F)  '); 
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { VLRCF }

{ TEMPOPATRO }
procedure TFrmCadFormulaMT.fcOutlookList10Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'TEMPOPATRO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o tempo de um participante na patrocinadora informada.                  ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  TEMPOPATRO(IDPATRO,TIPO,TIPOCALCULO,FORMARESULTADO)                             ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  TEMPOPATRO(03,A,0,M)                                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - IDPATRO                                                                       ');
    Add('    Identificador da Patrocinadora.                                               ');
    Add('        Obs: Informe 0 (zero) ou Vazio para processar todas as patrocinadoras.    ');
    Add('  - TIPO                                                                          ');
    Add('    Tipo de processo.                                                             ');
    Add('      A - Acumulado (Padrão)                                                      ');
    Add('      C - Corrente  (Primeiro registro somente)                                   ');
    Add('  - TIPOCALCULO                                                                   ');
    Add('    Tipo de Cálculo.                                                              ');
    Add('      0 - Dias Comerciais (Padrão)                                                ');
    Add('      1 - Dias Corridos                                                           ');
    Add('  - FORMARESULTADO                                                                ');
    Add('    Forma de Resultado.                                                           ');
    Add('      D - Dias                                                                    ');
    Add('      M - Meses (Padrão)                                                          ');
    Add('      A - Anos                                                                    ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { TEMPOPATRO }

{ TEMPOPLANO }
procedure TFrmCadFormulaMT.fcOutlookList10Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'TEMPOPLANO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o tempo de um participante no Plano atual.                              ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  TEMPOPLANO(FORMARESULTADO,COMAFASTAMENTO)                                       ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  TEMPOPLANO(D,0)                                                                 ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - FORMARESULTADO                                                                ');
    Add('    Forma de Resultado.                                                           ');
    Add('      D - Dias                                                                    ');
    Add('      M - Meses (Padrão)                                                          ');
    Add('      A - Anos                                                                    ');
    Add('  - COMAFASTAMENTO                                                                ');
    Add('    Diminui ou não tempo de afastamento.                                          ');
    Add('      0 ou Nulo - Não diminuirá                                                   ');
    Add('      1 - Diminuirá                                                               ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { TEMPOPLANO }


{ TEMPOAFAST }
procedure TFrmCadFormulaMT.fcOutlookList10Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'TEMPOAFAST(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o tempo afastado de um participante na patrocinadora informada.         ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  TEMPOAFAST(IDPATRO,TIPO,FORMARESULTADO)                                         ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  TEMPOPATRO(03,A,M)                                                              ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - IDPATRO                                                                       ');
    Add('    Identificador da Patrocinadora.                                               ');
    Add('  - TIPO                                                                          ');
    Add('    Tipo de processo.                                                             ');
    Add('      A - Acumulado (Padrão)                                                      ');
    Add('      C - Corrente  (Primeiro registro somente)                                   ');
    Add('  - FORMARESULTADO                                                                ');
    Add('    Forma de Resultado.                                                           ');
    Add('      D - Dias                                                                    ');
    Add('      M - Meses (Padrão)                                                          ');
    Add('      A - Anos                                                                    ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { TEMPOAFAST }


{ TEMPOFUNDACAO }
procedure TFrmCadFormulaMT.fcOutlookList10Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'TEMPOFUNDACAO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                      ');
    Add('  Retorna o que o participante possui na Fundação.                             ');
    Add('-------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                       ');
    Add('  TEMPOFUNDACAO(DATAREF,FLGPLANO,FLGCANCELAMENTO)                              ');
    Add('-------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                       ');
    Add('  TEMPOFUNDACAO(01/10/2001,S,N)                                                ');
    Add('-------------------------------------------------------------------------------');
    Add('DESCRICAO DOS PARAMETROS:                                                      ');
    Add(' - DATAREF                                                                     ');
    Add('   Data de Referencia do Processo (DD/MM/YYYY)                                 ');
    Add(' - FLGPLANO                                                                    ');
    Add('   S - Considera todos os Planos.                                              ');
    Add('   N - Considera apenas o último plano.                                        ');
    Add(' - FLGCANCELAMENTO                                                             ');
    Add('   S - Considera os cancelamentos.                                             ');
    Add('   N - Não considera os cancelamentos.                                         ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { TEMPOFUNDACAO }


{ SOMADIASBENEF }
procedure TFrmCadFormulaMT.fcOutlookList10Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'SOMADIASBENEF(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO                                                                         ');
    Add('  Somar o número de dias que uma pessoa esteve em benefício dentro de um         ');
    Add('  determinado período.                                                           ');
    Add('---------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                         ');
    Add('  SOMADIASBENEF([IDBENEFICIO1,IDBENEFICIO2....]DATAINICIAL, DATAFINAL)           ');
    Add('-------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                                                         ');
    Add('  SOMADIASBENEF([33,125]01/01/2001,31/12/2001)                                   ');
    Add('-------------------------------------------------------------------------------- ');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                        ');
    Add('  - IDBENEFICIOn                                                                 ');
    Add('    Identificadores dos beneficios da pesquisa.                                  ');
    Add('      Obs.: Máximo de 50 beneficios.                                             ');
    Add('  - DATAINICIAL                                                                  ');
    Add('    Data de inicio do processo.                                                  ');
    Add('  - DATAFINAL                                                                    ');
    Add('    Data de fim do processo.                                                     ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { SOMADIASBENEF }


{ COTACAORENFIX }
procedure TFrmCadFormulaMT.fcOutlookList11Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'COTACAORENFIX(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna a cotação de um investimento de Renda Fixa que vence em uma determinada ');
    Add('  data de referencia.                                                             ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  COTACAORENFIX(DATAREFERECIA, DATAVENCIMENTO, INVESTIMENTO)                      ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  COTACAORENFIX(02/01/2002, 28/02/2002, 9324)                                     ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATAREFERENCIA                                                                ');
    Add('    Data de refência do processo, formato DD/MM/YYYY.                             ');
    Add('  - DATAVENCIMENTO                                                                ');
    Add('    Data de vencimento do investimento, formato DD/MM/YYYY.                       ');
    Add('  - INVESTIMENTO                                                                  ');
    Add('    Investimento de referência do processo.                                       ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { COTACAORENFIX }


{ TOTALIZAINDICADOR }
procedure TFrmCadFormulaMT.fcOutlookList12Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'TOTALIZAINDICADOR(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Apurar o valor total de um indicador gerencial.                                 ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  TOTALIZAINDICADOR(CODIGO_INDICADOR,MES_COMPETENCIA,ANO_COMPETENCIA,DATA_INICIO, '); 
    Add('                    DATA_FIM, TIPO_LANCAMENTO, CODIGO_IMOVEL, CODIGO_CONTRATO,    ');
    Add('                    CODIGO_GRUPO_APURACAO, CODIGO_SUBGRUPO_APURACAO)              ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - CODIGO_INDICADOR                                                              ');
    Add('    Código interno do indicador                                                   ');
    Add('  - MES_COMPETENCIA                                                               ');
    Add('    Mês de competência                                                            ');
    Add('  - ANO_COMPETENCIA                                                               ');
    Add('    Ano de competência                                                            ');
    Add('  - DATA_INICIO                                                                   ');
    Add('    Data de início do período de apuração                                         ');
    Add('  - DATA_FIM                                                                      ');
    Add('    Data de término do período de apuração                                        ');
    Add('  - TIPO_LANCAMENTO                                                               ');
    Add('    Tipo de Lançamento :                                                          ');
    Add('         P = Previsto                                                             ');
    Add('         R = Realizado                                                            ');
    Add('  - CODIGO_IMOVEL                                                                 ');
    Add('    Código interno do imóvel/empreendimento                                       ');
    Add('  - CODIGO_CONTRATO                                                               ');
    Add('    Código interno do contrato                                                    ');
    Add('  - CODIGO_GRUPO_APURACAO                                                         ');
    Add('    Código interno do grupo de apuração                                           ');
    Add('  - CODIGO_SUBGRUPO_APURACAO                                                      ');
    Add('    Código interno do sub-grupo de apuração                                       ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { TOTALIZAINDICADOR }


{ ARITM }
procedure TFrmCadFormulaMT.fcOutlookList1Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'ARITM(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Efetuar Cálculos.                                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  ARITM(@VAR1+@VAR2+@VAR3/@VAR4-10)                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  ARITM(10+5) = 15                                                                ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { ARITM }


{ ELEVACAO ^ }
procedure TFrmCadFormulaMT.fcOutlookList1Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + '^';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Eleva.                                                                          ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  ^                                                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  10^01                                                                           ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { ELEVACAO ^ }

  
{ RAIZ SQRT }
procedure TFrmCadFormulaMT.fcOutlookList1Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'SQRT(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Raiz Quadrada.                                                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  SQRT(VALOR)                                                                     ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  SQRT(10)                                                                        ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { RAIZ SQRT }


{ MULTIPLICACAO * }
procedure TFrmCadFormulaMT.fcOutlookList1Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + ' * ';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  memDesc.Lines.Clear;
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Multiplica.                                                                     ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  *                                                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  10*02                                                                           ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { MULTIPLICACAO * }


{ SOMAR + }
procedure TFrmCadFormulaMT.fcOutlookList1Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + ' + ';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Soma.                                                                           ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  ^                                                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  10+05                                                                           ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { SOMAR + }


{ SUBTRACAO - }
procedure TFrmCadFormulaMT.fcOutlookList1Items5Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + ' - ';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Diminui.                                                                        ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  -                                                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  10-8                                                                            ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { SUBTRACAO - }


{ DIVISAO / }
procedure TFrmCadFormulaMT.fcOutlookList1Items6Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + ' / ';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Divide.                                                                         ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  /                                                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  10/02                                                                           ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { DIVISAO / }


{ FV }
procedure TFrmCadFormulaMT.fcOutlookList3Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  Inc(ContParent);
  dedMemo.Text := dedMemo.Text + 'FV(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Você poderá informar o falor presente(PV) ou a prestação(PMT)                   ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  FV(TAXA,N,PMT,PV,TIPO)                                                          ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  FV()                                                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - TAXA                                                                          ');
    Add('    Taxa de juros por período.                                                    ');
    Add('  - N                                                                             ');
    Add('    Número total de pagamentos.                                                   ');
    Add('  - PMT                                                                           ');
    Add('    Pagamento feito a cada período.                                               ');
    Add('  - PV                                                                            ');
    Add('    Valor presente.                                                               ');
    Add('  - T (opcional)                                                                  ');
    Add('    Tipo de pagamento.                                                            ');
    Add('      0 - Final do periodo                                                        ');
    Add('      1 - Inicio do periodo                                                       ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { FV }


{ NPMT }
procedure TFrmCadFormulaMT.fcOutlookList3Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  Inc(ContParent);
  dedMemo.Text := dedMemo.Text + 'NPMT(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  NPMT                                                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  NPMT(FV,PV,I)                                                                   ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  NPMT(FV,PV,I)                                                                   ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - FV                                                                            ');
    Add('                                                                                  ');
    Add('  - PV                                                                            ');
    Add('                                                                                  ');
    Add('  - I                                                                             ');
    Add('                                                                                  ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { NPMT }


{ PMT }
procedure TFrmCadFormulaMT.fcOutlookList3Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  Inc(ContParent);
  dedMemo.Text := dedMemo.Text + 'PMT(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  memDesc.Lines.Clear;
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  PMT                                                                             ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  PMT(TAXA,N,VP,VF,T)                                                             ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  PMT(TAXA,N,VP,VF,T)                                                             ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - TAXA                                                                          ');
    Add('                                                                                  ');
    Add('  - N                                                                             ');
    Add('                                                                                  ');
    Add('  - VP                                                                            ');
    Add('                                                                                  ');
    Add('  - VF                                                                            ');
    Add('                                                                                  ');
    Add('  - T                                                                             ');
    Add('                                                                                  ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { PMT }


{ PV }
procedure TFrmCadFormulaMT.fcOutlookList3Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  Inc(ContParent);
  dedMemo.Text := dedMemo.Text + 'PV(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Você poderá informar a prestação(PMT) ou o falor futuro(FV).                    ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  PV(TAXA,N,PMT,FV,TIPO)                                                          ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  PV()                                                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - TAXA                                                                          ');
    Add('    Taxa de juros por período.                                                    ');
    Add('  - N                                                                             ');
    Add('    Número total de pagamentos.                                                   ');
    Add('  - PMT                                                                           ');
    Add('    Pagamento feito a cada período.                                               ');
    Add('  - FV                                                                            ');
    Add('    Valor futuro.                                                                 ');
    Add('  - TIPO (opcional)                                                               ');
    Add('    Tipo de pagamento                                                             ');
    Add('      0 - Final do periodo                                                        ');
    Add('      1 - Inicio do periodo                                                       ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { PV }


{ RATE }
procedure TFrmCadFormulaMT.fcOutlookList3Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'RATE(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  memDesc.Lines.Add('Formato: RATE(FV,PV,N)');
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  RATE                                                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  RATE(FV,PV,N)                                                                   ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  RATE(FV,PV,N)                                                                   ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - FV                                                                            ');
    Add('                                                                                  ');
    Add('  - PV                                                                            ');
    Add('                                                                                  ');
    Add('  - N                                                                             ');
    Add('                                                                                  ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { RATE }


{ ANO }
procedure TFrmCadFormulaMT.fcOutlookList4Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'ANO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o ano de uma data.                                                      ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  ANO(DATA)                                                                       ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  ANO(15/06/1998) = 1998                                                          ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATA                                                                          ');
    Add('    Data de referência, formato DD/MM/YYYY.                                       ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;


{ CONVERTEDATA }
procedure TFrmCadFormulaMT.fcOutlookList4Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'CONVERTEDATA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:');
    Add('  Converter uma data para um formato indicado como parâmetro                     ');
    Add('-------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                                                         ');
    Add('  CONVERTEDATA(DATA, FORMATO)                                                    ');
    Add('-------------------------------------------------------------------------------- ');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                        ');
    Add('  - DATA                                                                         ');
    Add('    Indica a dataa a ser convertida                                              ');
    Add('  - FORMATO                                                                      ');
    Add('    Formato no qual se deseja converter a data. Os formatos permitidos são.      ');
    Add('     AAAA/MM                                                                     ');
    Add('     MM/AAAA                                                                     ');
    Add('     MM/DD/AAAA                                                                  ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { CONVERTEDATA }


{ DATAREF }
procedure TFrmCadFormulaMT.fcOutlookList4Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'DATAREF';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('                                                                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  DATAREF                                                                         ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  DATAREF                                                                         ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { DATAREF }


{ DIA }
procedure TFrmCadFormulaMT.fcOutlookList4Items3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'DIA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o dia de uma data.                                                      ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  DIA(DATA)                                                                       ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  DIA(15/06/1998) = 15                                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATA                                                                          ');
    Add('    Data de referência, formato DD/MM/YYYY.                                       ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;


{ DIASDOMES }
procedure TFrmCadFormulaMT.fcOutlookList4Items4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'DIASDOMES(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna a quantidade de dias mo mês.                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  DIASDOMES(DATA)                                                                 ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  DIASDIMES(01/10/1999) = 31                                                      ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATA                                                                          ');
    Add('    Data de referência, formato DD/MM/YYYY.                                       ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { DIASDOMES }


{ DIASINICIAIS }
procedure TFrmCadFormulaMT.fcOutlookList4Items6Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'DIASINICIAIS(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
     Add('OBJETIVO:');
     Add('  Retornar o numero de dias entre a data parametro e o fim do mês da            ');
     Add('  data de parametro.                                                            ');
     Add('--------------------------------------------------------------------------------');
     Add('SINTAXE:                                                                        ');
     Add('  DIASINICIAIS(DATAREF, FLGTIPOMES)                                             ');
     Add('--------------------------------------------------------------------------------');
     Add('EXEMPLO:                                                                        ');
     Add('  DIASINICIAIS(05/04/2001, 0) RETORNA - 25                                      ');
     Add('--------------------------------------------------------------------------------');
     Add('DESCRIÇÃO DOS PARAMETROS:                                                       ');
     Add('  - DATAREF                                                                     ');
     Add('    Data de referência para fórmula, formato DD/MM/YYYY.                        ');
     Add('  - FLGTIPOMES                                                                  ');
     Add('    Tipo de Mes do processo.                                                    ');
     Add('       0 - Mês corrido.                                                         ');
     Add('       1 - Mês comercial.                                                       ');
     Add('--------------------------------------------------------------------------------');
     Add('OBSERVAÇÃO:                                                                     ');
     Add('  Anos das datas com 4 digitos.                                                 ');
     Add('  Default 0 (zero) para FLGTIPOMES.                                             ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { DIASINICIAIS }


{ DIASFINAIS }
procedure TFrmCadFormulaMT.fcOutlookList4Items5Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'DIASFINAIS(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
     Add('OBJETIVO:');
     Add('  Retornar o numero de dias entre o inicio do mes da data parametro e o         ');
     Add('  dia da data de parametro                                                      ');
     Add('--------------------------------------------------------------------------------');
     Add('SINTAXE:                                                                        ');
     Add('  DIASFINAIS(DATAREF, FLGTIPOMES)                                               ');
     Add('--------------------------------------------------------------------------------');
     Add('EXEMPLO:                                                                        ');
     Add('  DIASFINAIS(05/04/2001, 0) RETORNA - 5                                         ');
     Add('--------------------------------------------------------------------------------');
     Add('DESCRIÇÃO DOS PARAMETROS:                                                       ');
     Add('  - DATAREF                                                                     ');
     Add('    Data de referência para fórmula, formato DD/MM/YYYY.                        ');
     Add('  - FLGTIPOMES                                                                  ');
     Add('    Tipo de Mes do processo.                                                    ');
     Add('       0 - Mês corrido.                                                         ');
     Add('       1 - Mês comercial.                                                       ');
     Add('--------------------------------------------------------------------------------');
     Add('OBSERVAÇÃO:                                                                     ');
     Add('  Anos das datas com 4 digitos.                                                 ');
     Add('  Default 0 (zero) para FLGTIPOMES.                                             ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { DIASFINAIS }


{ DIAFINAL }
procedure TFrmCadFormulaMT.fcOutlookList4Items7Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'DIAFINAL(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);

  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
     Add('OBJETIVO:');
     Add('  Retornar a data progredida para o ultimo dia do mês da data.                  ');
     Add('                                                                                ');
     Add('--------------------------------------------------------------------------------');
     Add('EXEMPLO:                                                                        ');
     Add('  DIAFINAL(DATA, TIPODATA)                                                      ');
     Add('                                                                                ');
     Add('  DIAFINAL(20/07/2000, 0) RETORNA - 31/07/2000                                  ');
     Add('                                                                                ');
     Add('--------------------------------------------------------------------------------');
     Add('DESCRIÇÃO DOS PARAMETROS:                                                       ');
     Add('  - DATA                                                                        ');
     Add('    Data a ser processada, no formato DD/MM/YYYY.                               ');
     Add('                                                                                ');
     Add('  - TIPODATA                                                                    ');
     Add('    Tipo de processamento a ser feito.                                          ');
     Add('      Caso 0/Nulo - Mês corrido.                                                ');
     Add('           1      - Mês Comercial (30 dias)                                     ');
   End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;


{ DIAINICIAL }
procedure TFrmCadFormulaMT.fcOutlookList4Items8Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'DIAINICIAL(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
     Add('OBJETIVO:');
     Add('  Retornar a data regredida para o 1º dia do mês da data.                        ');
     Add('---------------------------------------------------------------------------------');
     Add('EXEMPLO:                                                                         ');
     Add('  DIAINICIAL(DATA, TIPODATA)                                                     ');
     Add('                                                                                 ');
     Add('  DIAINICIAL(20/07/2000, 0) RETORNA - 01/07/2000                                 ');
     Add('---------------------------------------------------------------------------------');
     Add('DESCRIÇÃO DOS PARAMETROS:                                                        ');
     Add('  - DATA                                                                         ');
     Add('    Data a ser processada, no formato DD/MM/YYYY.                                ');
     Add('  - TIPODATA                                                                     ');
     Add('    Tipo de processamento a ser feito.                                           ');
     Add('      Caso 0/Nulo - Mês corrido                                                  ');
     Add('           1      - Mês Comercial                                                ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;


{ DIFANOS }
procedure TFrmCadFormulaMT.fcOutlookList4Items9Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  bDifAno := True;
  dedMemo.Text := dedMemo.Text + 'DIFANOS(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna a diferença em anos entre duas datas.                                   ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  DIFANOS(DATA MENOR,DATA MAIOR,TIPO DE RETORNO,MÉTODO)                           ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  DIFANOS(01/02/1998,01/05/2001,0,0)                                              ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATA MENOR                                                                    ');
    Add('    Data menor do período.                                                        ');
    Add('  - DATA MAIOR                                                                    ');
    Add('    Data maior do período.                                                        ');
    Add('  - TIPO DE RETORNO                                                               ');
    Add('    Tipo de cálculo para o valor retornado.                                       ');
    Add('      0 ou Nulo - Valor Inteiro                                                   ');
    Add('      1 - Valor frácionario                                                       ');
    Add('      2 - Valor arredondado                                                       ');
    Add('  - MÉTODO                                                                        ');
    Add('    Método utilizado para cálculo.                                                ');
    Add('      0 - Calcula a diferença entre anos comerciais pelo método Americano         ');
    Add('      1 ou Nulo, Calcula a diferença entre anos comerciais pelo metodo Europeu    ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('   Atenção a data maior deve vir depois da menor.                                 ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { DIFANOS }


{ DIFDIAS }
procedure TFrmCadFormulaMT.fcOutlookList4Items10Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  bDifDia := True;
  dedMemo.Text := dedMemo.Text + 'DIFDIAS(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  With MemDesc.Lines Do Begin
    BeginUpdate;
    Clear;
    Add('OBJETIVO:');
    Add('  Retornar o numero de dias entre duas datas.                                     ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  DIFDIAS(DATAMAIOR, DATAMENOR, TIPOCALCULO, TIPOINVESTIMENTO)                    ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATAMAIOR                                                                     ');
    Add('    Data maior da expressão.                                                      ');
    Add('  - DATAMENOR                                                                     ');
    Add('    Data Menor da expressão.                                                      ');
    Add('  - TIPOCALCULO                                                                   ');
    Add('    Indica o tipo de calculo a ser utilizado.                                     ');
    Add('      0 ou Nulo - Numero de dias corridos entre as datas.                         ');
    Add('      1         - Dias comerciais no método Americano.                            ');
    Add('      2         - Dias comerciais no método Europeu.                              ');
    Add('      3         - Dias úteis (Calendário CM). Leia Obs..                          ');
    Add('      4         - Dias úteis (Calendário CM Invest). Leia Obs..                   ');
    Add('  - TIPOINVESTIMENTO (opcional)                                                   ');
    Add('    Indica o tipo de Investimento a ser utilizado.                                ');
    Add('      1         - Renda Fixa                                                      ');
    Add('      2         - Renda Variável                                                  ');
    Add('      5         - Fundo de Renda Fixa                                             ');
    Add('      6         - Fundo de Renda Variável                                         ');
    Add('      7         - Fundo Imobiliário                                               ');
    Add('      8         - BM&F                                                            ');
    Add('----------------------------------------------------------------------------------');
     Add('OBSERVAÇÃO:                                                                      ');
    Add('  Anos das datas com 4 digitos.                                                   ');
    Add('  Os campos IDPAIS, IDCIDADES e CODESTADO devem estar na consulta de entrada.     ');
    Add('  No caso de TIPOCALCULO 4 a pesquisa será feita nas tabelas do Investimento.     ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { DIFDIAS }


{ DIFMESES }
procedure TFrmCadFormulaMT.fcOutlookList4Items11Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  bDifMes := True;
  dedMemo.Text := dedMemo.Text + 'DIFMESES(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna a diferença em meses entre duas datas.                                   ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  DIFMESES(DATA MENOR,DATA MAIOR,TIPO DE RETORNO,MÉTODO)                          ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  DIFMESES(01/02/1998,01/05/2001,0,0)                                             ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATA MENOR                                                                    ');
    Add('    Data menor do período.                                                        ');
    Add('  - DATA MAIOR                                                                    ');
    Add('    Data maior do período.                                                        ');
    Add('  - TIPO DE RETORNO                                                               ');
    Add('    Tipo de cálculo para o valor retornado.                                       ');
    Add('      0 ou Nulo - Valor Inteiro                                                   ');
    Add('      1 - Valor frácionario                                                       ');
    Add('      2 - Valor arredondado                                                       ');
    Add('  - MÉTODO                                                                        ');
    Add('    Método utilizado para cálculo.                                                ');
    Add('      0 - Calcula a diferença entre anos comerciais pelo método Americano         ');
    Add('      1 ou Nulo, Calcula a diferença entre anos comerciais pelo metodo Europeu    ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  Atenção a data maior deve vir depois da menor.                                  ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;


{ EANO }
procedure TFrmCadFormulaMT.fcOutlookList4Items12Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'EANO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Evolui ou regride uma data em anos.                                             ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  EANO(DATA, EVOLUÇÃO)                                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  EANO(01/01/1990,5) = 01/01/1995                                                 ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATA                                                                          ');
    Add('    Data de referência, formato DD/MM/YYYY.                                       ');
    Add('  - EVOLUÇÃO                                                                      ');
    Add('    Quantidade de anos a evoluir, caso positivo,  ou regredir , caso negativo.    ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { EANO }


{ EDIA }
procedure TFrmCadFormulaMT.fcOutlookList4Items13Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'EDIA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Evolui ou regride uma data em dias.                                             ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add(' EDIA(DATA, EVOLUÇÃO, TIPOCALCULO, TIPOINVESTIMENTO)                              ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  EDIA(01/01/1990,5,0) = 05/01/1990                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATA                                                                          ');
    Add('    Data de referência, formato DD/MM/YYYY.                                       ');
    Add('  - EVOLUÇÃO                                                                      ');
    Add('    Quantidade de dias a evoluir, caso positivo,  ou regredir , caso negativo.    ');
    Add('  - TIPOCALCULO (opcional)                                                        ');
    Add('    Indica o tipo de calculo a ser utilizado.                                     ');
    Add('      0 ou Nulo - Numero de dias corridos entre as datas.                         ');
    Add('      1         - Dias comerciais no método Americano.                            ');
    Add('      2         - Dias úteis (Calendário CM). Leia Obs..                          ');
    Add('      3         - Dias úteis (Calendário CM Invest). Leia Obs..                   ');
    Add('  - TIPOINVESTIMENTO (opcional)                                                   ');
    Add('    Indica o tipo de Investimento a ser utilizado.                                ');
    Add('      1         - Renda Fixa                                                      ');
    Add('      2         - Renda Variável                                                  ');
    Add('      5         - Fundo de Renda Fixa                                             ');
    Add('      6         - Fundo de Renda Variável                                         ');
    Add('      7         - Fundo Imobiliário                                               ');
    Add('      8         - BM&F                                                            ');
    Add('----------------------------------------------------------------------------------');
     Add('OBSERVAÇÃO:                                                                      ');
    Add('  Anos das datas com 4 digitos.                                                   ');
    Add('  Os campos IDPAIS, IDCIDADES e CODESTADO devem estar na consulta de entrada.     ');
    Add('  No caso de TIPOCALCULO 3 a pesquisa será feita nas tabelas do Investimento.     ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { EDIA }


{ EMES }
procedure TFrmCadFormulaMT.fcOutlookList4Items14Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'EMES(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);

  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Evolui ou regride uma data em mês.                                              ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  EMES(DATA, EVOLUÇÃO)                                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  EMES(01/01/1990,5) = 01/05/1990                                                 ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATA                                                                          ');
    Add('    Data de referência, formato DD/MM/YYYY.                                       ');
    Add('  - EVOLUÇÃO                                                                      ');
    Add('    Quantidade de meses a evoluir, caso positivo,  ou regredir , caso negativo.   ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { EMES }


{ HOJE }
procedure TFrmCadFormulaMT.fcOutlookList4Items15Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  if Cds.FieldbyName('EXPRESSAOFORMULA').AsString <> '' then
    UltCar := Cds.FieldbyName('EXPRESSAOFORMULA').AsString[length(Cds.FieldbyName('EXPRESSAOFORMULA').AsString)]
  else
    UltCar := #00;
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := Cds.FieldbyName('EXPRESSAOFORMULA').AsString + 'HOJE';
  if bDifDia or bDifMes or bDifAno then begin
    if (UltCar = '(') then
      Cds.FieldbyName('EXPRESSAOFORMULA').AsString := Cds.FieldbyName('EXPRESSAOFORMULA').AsString + ','
    else begin
      Dec(ContParent);
      Cds.FieldbyName('EXPRESSAOFORMULA').AsString := Cds.FieldbyName('EXPRESSAOFORMULA').AsString + ')';
    end;
  end;
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('                                                                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  HOJE                                                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  HOJE                                                                            ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { HOJE }


{ MES }
procedure TFrmCadFormulaMT.fcOutlookList4Items16Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'MES(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  memDesc.Lines.Add('Exemplo.:  MES(01/01/1998). Retorna 01');
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o mês de uma data.                                                      ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add(' MES(DATA)                                                                        ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  MES(01/01/1990,5) = 01                                                          ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATA                                                                          ');
    Add('    Data de referência, formato DD/MM/YYYY.                                       ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { MES }


{ PARADATA }
procedure TFrmCadFormulaMT.fcOutlookList4Items17Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'PARADATA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  ContParent := 0;
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
     Add('OBJETIVO:');
     Add('  Retornar Datas alteradas de acordo com o parametro TIPODATARETORNO.            ');
     Add('---------------------------------------------------------------------------------');
     Add('EXEMPLO:                                                                         ');
     Add('                                                                                 ');
     Add('  PARADATA(2001/04,D)    RETORNA: 01/04/2001                                     ');
     Add('  PARADATA(01/04/2001,M) RETORNA: 2001/04                                        ');
     Add('                                                                                 ');
     Add('---------------------------------------------------------------------------------');
     Add('DESCRIÇÃO DOS PARAMETROS:                                                        ');
     Add('                                                                                 ');
     Add(' - DATA                                                                          ');
     Add('    Data a ser processada, em dois formatos;                                     ');
     Add('      ANO/MES     (TIPODATARETORNO = D)                                          ');
     Add('      DD/MM/YYYY  (TIPODATARETORNO = M)                                          ');
     Add('                                                                                 ');
     Add(' - TIPODATARETORNO                                                               ');
     Add('    Tipo de retorno da Fórmula:                                                  ');
     Add('      Caso. D - Recebe YYYY/MM e tranforma em DD/MM/YYYY,                        ');
     Add('                com DD = 01.                                                     ');
     Add('            M - Recebe DD/MM/YYYY e tranforma em YYYY/MM.                        ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { PARADATA }


{ SEMANA }
procedure TFrmCadFormulaMT.fcOutlookList4Items18Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'SEMANA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retornar o dia da semana correspondente a esta data. O resulta do pode          ');
    Add('  variar de 1 (Domingo) a 7 (Sábado).                                             ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  SEMANA(01/01/1990,5) =  01                                                      ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATA                                                                          ');
    Add('    Data de referência, formato DD/MM/YYYY.                                       ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;


{ FERIADO }
procedure TFrmCadFormulaMT.fcOutlookList4Items19Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'FERIADO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna True se a Data de referência for ferado ou False caso contrário.        ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  FERIADO(DATAREF,TIPOFERIADO)                                                    ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  FERIADO(01/05/2001,0);                                                          ');
    Add('  De acordo com este exemplo a fórmula irá retornar True se for feriado ou FALSE  ');
    Add('  caso não seja.                                                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATAREF                                                                       ');
    Add('    Data de referência do processo, formato DD/MM/YYYY.                           ');
    Add('  - TIPOFERIADO (OPCIONAL) leia observação.                                       ');
    Add('    Indica o tipo de calculo a ser utilizado.                                     ');
    Add('      0 - Feriados Calendario CM (default).                                       ');
    Add('      1 - Feriados Calendario CM Invest.                                          ');
    Add('  - TIPOINVESTIMENTO (opcional)                                                   ');
    Add('    Indica o tipo de Investimento a ser utilizado.                                ');
    Add('      1         - Renda Fixa                                                      ');
    Add('      2         - Renda Variável                                                  ');
    Add('      5         - Fundo de Renda Fixa                                             ');
    Add('      6         - Fundo de Renda Variável                                         ');
    Add('      7         - Fundo Imobiliário                                               ');
    Add('      8         - BM&F                                                            ');
    Add('----------------------------------------------------------------------------------');
     Add('OBSERVAÇÃO:                                                                      ');
    Add('  Anos das datas com 4 digitos.                                                   ');
    Add('  Os campos IDPAIS, IDCIDADES e CODESTADO devem estar na consulta de entrada.     ');
    Add('  No caso de TIPOCALCULO 1 a pesquisa será feita nas tabelas do Investimento.     ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;


{ ENTREDATAS }
procedure TFrmCadFormulaMT.fcOutlookList4Items20Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  bDifDia := True;
  dedMemo.Text := dedMemo.Text + 'ENTREDATAS(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  With MemDesc.Lines Do Begin
    BeginUpdate;
    Clear;
    Add('OBJETIVO:');
    Add('  Verifica se uma data consta entre duas datas, retorna VERDADEIRO ou FALSO.      ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  ENTREDATAS(DATAINICIO, DATAFIM, DATAREFERENCIA, TIPOVERIFICACAO)                ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - DATAINICIO                                                                    ');
    Add('    Data de inicio.                                                               ');
    Add('  - DATAFIM                                                                       ');
    Add('    Data de fim.                                                                  ');
    Add('  - DATAREFERENCIA                                                                ');
    Add('    Data que será testada.                                                        ');
    Add('    Obs.: A verificação exclui os limites das datas.                              ');
    Add('  - TIPOVERIFICACAO                                                               ');
    Add('    Tipo de Verificação a executar.                                               ');
    Add('      0 - Inclui limites                                                          ');
    Add('      1 - Não inclui limites                                                      ');
    Add('----------------------------------------------------------------------------------');
     Add('OBSERVAÇÃO:                                                                      ');
    Add('  Anos das datas com 4 digitos.                                                   ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { ENTREDATAS }


{ OPCONTRIB }
procedure TFrmCadFormulaMT.fcOutlookList2Items13Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'OPCONTRIB(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna três valores das opções de uma contribuição em três variáveis.          ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  OPCONTRIB(IDCONTRIBUICAO,DATAREF,@RETORNO1,@RETORNO2,@RETORNO3))                ');
    Add('EXEMPLO:                                                                          ');
    Add('  OPCONTRIB(212,,@A1,@A2,@A3)           - PESQUISA DADOS ATUAIS                   ');
    Add('  OPCONTRIB(212,04/10/1999,@A1,@A2,@A3) - PESQUISA DADOS NO HISTORICO             ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - IDCONTRIBUICAO                                                                ');
    Add('    Identificador do Benefício.                                                   ');
    Add('  - DATAREF                                                                       ');
    Add('    Data de referência do processo, formato DD/MM/YYYY.                           ');
    Add('  - RETORNOn                                                                      ');
    Add('    Variáveis nas quais serão retornados os valores.                              ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  Caso seja informado o parâmetro DATAREF será feita a pesquisa pelo HISTÓRICO,   ');
    Add('  e caso não seja utilizado o parâmetro DATAREF será feita a pesquisa ATUAL.         ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end; { OPCONTRIB }

{ NIVEL }
procedure TFrmCadFormulaMT.fcOutlookList8Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'NIVEL(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o Nivel.                                                                ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  NIVEL(NIVEL, STEP, DATAREF)                                                     ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  NIVEL(..)                                                                       ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - NIVEL                                                                         ');
    Add('    Nivel.                                                                        ');
    Add('  - STEP                                                                          ');
    Add('    Step.                                                                         ');
    Add('  - DATAREF                                                                       ');
    Add('    Data de referência, formato DD/MM/YYYY.                                       ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  Compara até 100 valores.                                                        ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { NIVEL }


{ ATUARIAL }
procedure TFrmCadFormulaMT.ATUARLItems0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'ATUARIAL(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Efetuar Cálculos.                                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  ATUARIAL(@VAR1+@VAR2+@VAR3/@VAR4-10)                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  ATUARIAL(10+5) = 15                                                             ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { ATUARIAL }


{ TABBIO }
procedure TFrmCadFormulaMT.ATUARLItems1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'TABBIO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna a probabilidade de morte(QX) para um valor.                             ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  TABBIO(TABELA,VALOR)                                                            ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  TABBIO(QX,IDADE)                                                                ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - TABELA                                                                        ');
    Add('    Tabela a pesquisar.                                                           ');
    Add('  - VALOR                                                                         ');
    Add('    Valor a pesquisar.                                                            ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { TABBIO }


procedure TFrmCadFormulaMT.fcOutlookList1Items7Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'ROUND(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor arredondado com as casas decimais.                              ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  ROUND(VALOR,NUMERO DE CASAS,TIPO DE ARREDONDAMENTO)                             ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  ROUND(123.4567,3) = 123.46                                                      ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add(' - VALOR                                                                          ');
    Add('   Valor a ser formatado.                                                         ');
    Add(' - NUMERO DE CASAS                                                                ');
    Add('   Numero de casas decimais no valor resultante.                                  ');
    Add(' - TIPO DE ARREDONDAMENTO (opcional)                                              ');
    Add('   Tipo de arredondamento utilizado.                                              ');
    Add('     0 - Arredondamento Normal (default)                                          ');
    Add('     1 - Arredondamento do Investimento (sempre arredonda para cima)              ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TFrmCadFormulaMT.fcOutlookList1Items8Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  bTrunc := True;
  dedMemo.Text := dedMemo.Text + 'TRUNC(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor Truncado nas casas decimais.                                    ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  TRUNC(VALOR,NUMERO DE CASAS)                                                    ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  TRUNC(123.4567,3) = 123.45                                                      ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - VALOR                                                                         ');
    Add('    Valor a ser formatado.                                                        ');
    Add('  - NUMERO DE CASAS                                                               ');
    Add('    Numero de casas decimais no valor resultante.                                 ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end;

{ TABGENERICA }
procedure TFrmCadFormulaMT.fcOutlookList7Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'TABGENERICA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retornar valor das tabelas genéricas.                                           ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  TABGENERICA(NOME DA TABELA,VALOR PROCURADO,COLUNA DE PESQUISA,                  ');
    Add('              COLUNA DE RETORNO,TIPO DE PESQUISA)                                 ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  TABGENERICA(TABTESTE,45,IDADE,REDUTOR,2)                                        ');
    Add('    Retorna o REDUTOR contido na tabela genérica TABTESTE para IDADE igual a 45.  ');
    Add('    O último parâmetro determina que será utilizada a primeira idade acima de 45  ');
    Add('    caso esta não exista na tabela.                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - NOME DA TABELA                                                                 ');
    Add('    Nome da tabela a pesquisar.                                                    ');
    Add('  - VALOR PROCURADO                                                                ');
    Add('    Valor a pesquisar na tabela.                                                   ');
    Add('  - COLUNA DE PESQUISA                                                             ');
    Add('    Coluna a pesquisar o valor informado.                                          ');
    Add('  - COLUNA DE RETORNO                                                              ');
    Add('    Coluna a qual o valor será retornado.                                          ');
    Add('  - TIPO DE PESQUISA                                                               ');
    Add('    Tipo de Pesquisa a executar.                                                   ');
    Add('      0 - Valor na Coluna de Pesquisa igual ao Valor Procurado                     ');
    Add('      1 - Valor na Coluna de Pesquisa igual ou menor ao Valor Procurado            ');
    Add('      2 - Valor na Coluna de Pesquisa igual ou maior ao Valor Procurado            ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

{ CONSULTA }
procedure TFrmCadFormulaMT.fcOutlookList7Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'CONSULTA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retornar valor das tabelas genéricas inclusive as "Longas".                     ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  CONSULTA([COLUNA1=VALOR1,COLUNA2=VALOR2]NOME DA TABELA,COLUNA DE RETORNO,       ');
    Add('           TIPO DE PESQUISA)                                                      ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add(' CONSULTA([IDADE=45,SEXO=M]DADOSPART,SALARIO,0)                                   ');
    Add('    Retorna o SALARIO contido na tabela genérica DADOSPART para IDADE igual a 45, ');
    Add('    sexo igual a M.                                                               ');
    Add('    O último parâmetro determina que será utilizada a tabela "Longa".             ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - COLUNAn                                                                       ');
    Add('    Colunas a pesquisar o valor informado.                                        ');
    Add('  - VALORn                                                                        ');
    Add('    Valores a pesquisar na tabela.                                                ');
    Add('  - NOME DA TABELA                                                                ');
    Add('    Nome da tabela a pesquisar.                                                   ');
    Add('  - COLUNA DE RETORNO                                                             ');
    Add('    Coluna a qual o valor será retornado.                                         ');
    Add('  - TIPO DE PESQUISA                                                              ');
    Add('    Tipo de Pesquisa a executar.                                                  ');
    Add('      0 ou Nulo - Tabela Genérica Longa                                           ');
    Add('      1 - Tabela Geneérica                                                        ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

{ BUSCADETCALCULO }
procedure TFrmCadFormulaMT.fcOutlookList8Items20Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'BUSCADETCALCULO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Busca dados na tabela de Detalhes de Cálculo das Regras, para a pessoa          ');
    Add('  sendo processada.                                                               ');
    Add('-----------------------------------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  BUSCADETCALCULO(VALOR A PESQUISAR, TIPOPESQUISA, TRATACAIXA, IDPESSOAPESQUISA)  ');
    Add('-----------------------------------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  BUSCADETCALCULO(#AD. INSALUBRIDADE MÉDIO, C, S, @ID_PESSOA)                     ');
    Add('-----------------------------------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - VALOR A PESQUISAR                                                             ');
    Add('    Indica o valor que será pesquisado na tabela.                                 ');
    Add('    Obs.: Este valor será pesquisado no campo DESCRICAO da tabela de detalhes.    ');
    Add('  - TIPOPESQUISA                                                                  ');
    Add('    Tipo de Pesquisa a executar.                                                  ');
    Add('      C - Por Cálculo (IDCALCULO) default                                         ');
    Add('      D - Por Data (Data de Inclusão)                                             ');
    Add('  - TRATACAIXA                                                                    ');
    Add('    Informa se o Regra irá fazer distinção entre Maiúsculas e Minúsculas.         ');
    Add('      S - Faz distinção entre Maiúsculas e Minúsculas (default)                   ');
    Add('      N - Não faz distinção entre Maiúsculas e Minúsculas (default)               ');
    Add('  - IDPESSOAPESQUISA (opcional) Indica o IDPESSOA que será utilizado na consulta interna da fórmula.');
    Add('      O IDPESSOA da consulta de entrada é o default.                              ');

  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { BUSCADETCALCULO }

{ ULTDATACONTRIB }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList9Items7Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'ULTDATACONTRIB(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna a última data de recebimento da contribuições informada.                ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  ULTDATACONTRIB(IDCONTRIBUICAO)                                                  ');
    Add('EXEMPLO:                                                                          ');
    Add('  ULTDATACONTRIB(212)                                                             ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - IDCONTRIBUICAO                                                                ');
    Add('    Identificador da Contribuição.                                                ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { ULTDATACONTRIB }



procedure TFrmCadFormulaMT.BtArrobaClick(Sender: TObject);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + '@';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  dedMemo.SelStart := Length(dedMemo.Text);
end;

procedure TFrmCadFormulaMT.BtTralhaClick(Sender: TObject);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + '#';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  dedMemo.SelStart := Length(dedMemo.Text);
end;

function TFrmCadFormulaMT.Publicada: Boolean;
begin
  Result := False;

  CdsAux.Data := CtrlFormula.Publicada(Cds.FieldByName('IDFORMULA').AsInteger);

  If Not CdsAux.IsEmpty Then Begin
    MsgDlg('Esta fórmula esta sendo utilizada em uma Regra publicada.',
           'Erro',mterror, [mbok],0);
    Result := True;
    Exit;
  End;

end;

procedure TFrmCadFormulaMT.sbtnAlterarClick(Sender: TObject);
begin
  If Publicada Then Begin
    sbtnAlterar.Down := False;
    Exit;
  End;

  inherited;
end;

{ ULTDATAEVENTO }
procedure TFrmCadFormulaMT.fcOutlookList10Items5Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'ULTDATAEVENTO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna a última data registrada do evento informado.                           ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  ULTDATAEVENTO(IDEVENTOGERADOR)                                                  ');
    Add('EXEMPLO:                                                                          ');
    Add('  ULTDATAEVENTO(14)                                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - IDEVENTOGERADOR                                                               ');
    Add('    Identificador do evento gerador.                                              ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { ULTDATAEVENTO }

{ PARCANTEP }
procedure TFrmCadFormulaMT.fcOutlookList11Items1Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'PARCANTEP(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:');
    Add('  Buscar o valor original da parcela imediatamente anterior à de referência.      ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  PARCANTEP                                                                       ');
    Add('                                                                                  ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { PARCANTEP }

{ TOTALIZAITENSEP }
procedure TFrmCadFormulaMT.fcOutlookList11Items2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'TOTALIZAITENSEP(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:');
    Add('  Totalizar o valor de uma lista de itens durante um periodo.                     ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  TOTALIZAITENSEP(NUMERO DO CONTRATO, [ITEM1,ITEM2,ITEM3....], DATAINICIO, DATAFIM)');
    Add('EXEMPLO:                                                                          ');
    Add('  TOTALIZAITENSEP(010134523,[1,28,29,67], 01/10/2005, 30/10/2005)                  ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - NUMERO DO CONTRATO                                                            ');
    Add('    Identificador do contrato.                                                    ');
    Add('  - ITEMn                                                                         ');
    Add('    Identificadores dos itens de empréstimo.                                      ');
    Add('      Obs.: Máximo de 50 itens.                                                   ');
    Add('  - DATAINICIO                                                                    ');
    Add('    Data de inicio da pesquisa.                                                   ');
    Add('  - DATAFIM                                                                       ');
    Add('    Data de fim da pesquisa.                                                      ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  Anos das datas com 4 digitos.                                                   ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { TOTALIZAITENSEP }

{ SOMACONJUNTORUBRICA }
procedure TFrmCadFormulaMT.fcOutlookList6Items15Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;

  dedMemo.Text := dedMemo.Text + 'SOMACONJUNTORUBRICA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:');
    Add('  Somar o valor das rubricas associadas a uma lista de Conjunto de Rubricas.      ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  SOMACONJUNTORUBRICA([CONJUNTO1,CONJUNTO2,CONJUNTO3....], ANOMESREFERENCIA)      ');
    Add('EXEMPLO:                                                                          ');
    Add('  SOMACONJUNTORUBRICA([CJ_RUBSAL,CJ_RUBEMP], ANOMESREFERENCIA)                    ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - CONJUNTOn                                                                     ');
    Add('    Códigos resumidos dos Conjuntos de Rubricas.                                  ');
    Add('      Obs.: Máximo de 50 itens.                                                   ');
    Add('  - ANOMESREFERENCIA                                                              ');
    Add('    ANO/MES de referência para a consulta.                                        ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  CONJUNTOn são codigos resumidos informados no cadastro de Conjunto de Rubricas. ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { SOMACONJUNTORUBRICA }

{ RUBREEMBINSS }
procedure TFrmCadFormulaMT.fcOutlookList6Items16Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  { Inlcui dados da Formula nos campos }
  dedMemo.Text := dedMemo.Text + 'RUBREEMBINSS(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  { Mostra Descricao da Formula }
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO                                                                          ');
    Add('  Retornar o valor da rubrica no Reembolso INSS.                                  ');
    Add('--------------------------------------------------------------------------------- ');
    Add('SINTAXE:                                                                          ');
    Add('  RUBREEMBINSS(IDRUBRICA, ANOMESCOBRANCA)                                         ');
    Add('--------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                                                          ');
    Add('  RUBREEMBINSS(102, 2006/01)                                                      ');
    Add('--------------------------------------------------------------------------------- ');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - IDRUBRICA                                                                     ');
    Add('    Identificador da Rubrica.                                                     ');
    Add('      Obs.: Pesquisado na coluna RUBRICAINSS da tabela DETCONCINSS.               ');
    Add('  - ANOMESCOBRANCA (opcional)                                                     ');
    Add('    Ano/mês cobrança da pesquisa.                                                 ');
    Add('      Obs.: Caso não seja informado a pesquisa será no último mês cadastrado.     ');
    Add('--------------------------------------------------------------------------------- ');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  O identificador da pessoa pesquisada estará no campo IDPESSOA do SQL de entrada.');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end; { RUBREEMBINSS }

{ TABSERV }
procedure TFrmCadFormulaMT.ATUARLItems2Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'TABSERV(';
  dedMemo.CharCase := ecNormal;
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor de uma variável da Tábua de serviço.                            ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  TABSERV(IDADE, VARIÁVEL, SEXO, GRAVAR)                                          ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  TABBIO(49, C_x, M, N)                                                           ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - IDADE                                                                         ');
    Add('    Idade correspondente a variavel escolhida.                                    ');
    Add('  - VARIAVEL                                                                      ');
    Add('    Variavel da tábua de serviço.                                                 ');
    Add('  - SEXO                                                                          ');
    Add('    Determina a tábua que será pesquisado o valor (m - masculino ou f - feminio). ');
    Add('  - GRAVAR                                                                        ');
    Add('    Determina se esta variável será gravada na memória de cálculo atuarial.       ');
    add('    (s) para gravar ou (n) para não gravar                                        ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end; { TABSERV }

{ TABPENSAO }
procedure TFrmCadFormulaMT.ATUARLItems3Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'TABPENSAO(';
  dedMemo.CharCase := ecNormal;
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor de uma variável da Tábua de Pensao.                             ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  TABPENSAO(IDADE, PENSAO, VARIÁVEL, GRAVAR)                                      ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  TABBIO(49, 15, D_jxx, S)                                                        ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - IDADE                                                                         ');
    Add('    Idade do participante.                                                        ');
    Add('  - PENSAO                                                                        ');
    Add('    Idade do pensionista.                                                         ');
    Add('  - VARIAVEL                                                                      ');
    Add('    Variavel da tábua de serviço.                                                 ');
    Add('  - GRAVAR                                                                        ');
    Add('    Determina se esta variável será gravada na memória de cálculo atuarial.       ');
    Add('    (s) para gravar e (n) para não gravar                                         ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end;{ TABPENSAO }

{ GRAVAMEMATUARIAL }
procedure TFrmCadFormulaMT.ATUARLItems4Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'GRAVAMEMATUARIAL(';
  dedMemo.CharCase := ecNormal;
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Grava as variáveis e valores na Memoria do Cálculo Atuarial                     ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  GRAVAMEMATUARIAL(Variaveis, ....)                                               ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  GRAVAMEMATUARIAL(Idade, Idade_Pensionista, Matricula, etc...)                   ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - Variaveis                                                                     ');
    Add('    Variaveis que serão gravadas na memoria de cálculo.                           ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO :                                                                      ');
    Add('    Sem Limite de Variaveis sempre separadas por virgula (,)                      ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end; { GRAVAMEMATUARIAL }

{CTVA}
procedure TFrmCadFormulaMT.fcOutlookList8Items22Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'CTVA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna a diferença entre o valor de função e o valor de piso de mercado        ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  CTVA(CODIGO, DATAEFETIVACAO)                                                    ');
    Add('EXEMPLO:                                                                          ');
    Add('  CTVA(8, @HOJE)                                                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - CODIGO                                                                        ');
    Add('    Código da Função a pesquisar.                                                 ');
    Add('  - DATAEFETIVACAO                                                                '); //CPrev - 26850
    Add('    Data da Efetivação da função.                                                 '); //CPrev - 26850
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;{CTVA}

{ BUSCAMATRICULA }
procedure TFrmCadFormulaMT.fcOutlookList2Items5Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'BUSCAMATRICULA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna a Matricula de uma pessoa.                                              ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  BUSCAMATRICULA                                                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  BUSCAMATRICULA                                                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  Pessoa a pesquisar será definida pelo campo IDPESSOA da consulta de entrada da  ');
    Add('  Regra ou pelos Dados Auxiliares da Regra (Views).                               ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end; { BUSCAMATRICULA }

//RENATO VISONI SOL 114098 KINTANA 531664
procedure TFrmCadFormulaMT.fcOutlookList5Items11Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;

  dedMemo.Text := dedMemo.Text + 'VALORBENEFICIO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Add('  OBJETIVO:                                                                        ');
    Add('  Retorna o valor integral do beneficio em um determinado MES/ANO.                 ');
    Add('---------------------------------------------------------------------------------- ');
    Add('SINTAXE:                                                                           ');
    Add('  VALORBENEFICIO(SITUACAO,[IDBENEFICIO1,IDBENEFICIO2....],                         ');
    Add('                 IDPLANOPREV, FONTEPAGADORA, SOMENTEVALORESAPAGAR,                 ');
    Add('                 IDPESSOAPESQUISA,MESREFERENCIA,DESCONMESCOBRANCA)                 '); // RENATO VISONI SOL 126535 kintana 671960
    Add('---------------------------------------------------------------------------------- ');
    Add('EXEMPLO:                                                                           ');
    Add('  VALORBENEFICIO(1,[4,64],2,1,N,,2009/11,S)                                        '); // RENATO VISONI SOL 126535 kintana 671960
    Add('---------------------------------------------------------------------------------- ');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                          ');
    Add('  - SITUACAO                                                                       ');
    Add('    Situação do Benefício                                                          ');
    Add('	1-Ativo;                                                                    ');
    Add('	2-Inativo;                                                                  ');
    Add('  - IDBENEFICIO                                                                    ');
    Add('    Identificadores dos benefícios da pesquisa (IDBENEFICIO).                      ');
    Add('      Obs.: Máximo de 50 benefícios.                                               ');
    Add('   - IDPLANOPREV (opcional)                                                        ');
    Add('    Identificador do plano previdenciário para utilizar como filtro na consulta.   ');
    Add('    Vazio para plano atual do associado.                                           ');
    Add('    Zero para todos os planos do associado.                                        ');
    Add('  - FONTEPAGADORA (opcional)                                                       ');
    Add('    Indica a fonte pagadora do beneficio para usar como filtro na consulta.        ');
    Add('      1 - Fundação                                                                 ');
    Add('      2 - INSS                                                                     ');
    Add('  - SOMENTEVALORESAPAGAR (opcional)                                                ');
    Add('    Indica se pesquisa irá retornar somente valores a pagar.                       ');
    Add('      S - Somente valores a pagar (VLRBENEFPGTO = NULO ou 0)                       ');
    Add('      N - Todos os valores (default)                                               ');
    Add('  - IDPESSOAPESQUISA (opcional)                                                    ');
    Add('    Indica o IDPESSOA que será utilizado na consulta interna da fórmula.           ');
    Add('      O IDPESSOA da consulta de entrada é o default                                ');
    Add('  - MESANO                                                                         ');//RENATO VISONI SOL 126535 kintana 671960
    Add('    Mês/Ano de referência. Formato  AAAA/MM                                        ');//RENATO VISONI SOL 126535 kintana 671960
    Add('  - DESCONMESCOBRANCA                                                              ');//Peterson Victor SOL 262534 PPM 1089618
    Add('    Desconsidera o mês de cobrança                                                 ');//Peterson Victor SOL 262534 PPM 1089618
    Add('---------------------------------------------------------------------------------- ');
    Add('OBSERVAÇÃO:                                                                        ');
    Add('  Caso o parâmetro IDBENEFICIO esteja vazio, a formula retorna a soma de todos     ');
    Add('  os benefícios no mês.                                                            ');
  end;

  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end;
//RENATO VISONI SOL 114098 KINTANA 531664


//Renato Visoni SOL 122084 KINTANA 595029
procedure TFrmCadFormulaMT.fcOutlookList5Items12Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'BUSCAOPCAOBENEF(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;

  With MemDesc.lines Do Begin
    Add('OBJETIVO:');
    Add('Retornar os valores dos campos VALORBASE1, VALORBASE2, VALORBASE3 das Opções do Benefício (IDBENEFICIO) de determinada Pessoa (IDPESSOA)');
    Add('para um plano previdenciário, informando o Código do Benefício (IDPLANOPREV).');
    Add('----------------------------------------------------------------------------------         ');
    Add('SINTAXE:                                                                                   ');
    Add('BUSCAOPCAOBENEF (CODBENEFICIO, CODPLANOPREV, CODPESSOA, VALORBASE1, VALORBASE2, VALORBASE3)');
    Add('                                                                                           ');
    Add('----------------------------------------------------------------------------------         ');
    Add('EXEMPLO:                                                                                   ');
    Add('BUSCAOPCAOBENEF (159,2,443995,@VARRETORNO1, @VARRETORNO2, @VARRETORNO3)                    ');
    Add('----------------------------------------------------------------------------------         ');
    Add('                                                                                           ');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                                  ');
    Add('- CODBENEFICIO                                                                             ');
    Add('Informar o Código do Benefício para pesquisa.                                              ');
    Add('                                                                                           ');
    Add('- CODPLANOPREV                                                                             ');
    Add('Informar o Código do Plano Previdenciário para pesquisa.                                   ');
    Add('                                                                                           ');
    Add('- CODPESSOA                                                                                ');
    Add('Informar o Código da Pessoa para pesquisa.                                                 ');
    Add('                                                                                           ');
    Add('- VARIAVELRETORNO1                                                                         ');
    Add('  Variável que retornará o valor do campo VALORBASE1.                                      ');
    Add('                                                                                           ');
    Add('- VARIAVELRETORNO2                                                                         ');
    Add('  Variável que retornará o valor do campo VALORBASE2.                                      ');
    Add('                                                                                           ');
    Add('- VARIAVELRETORNO3                                                                         ');
    Add('Variável que retornará o valor do campo VALORBASE3.                                        ');
    Add('                                                                                           ');
    Add('OBS: Descrição e funcionamento baseado na Fórmula CFPESSOA                                 ');
  end;

  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end;
//Renato Visoni SOL 122084 KINTANA 595029

//Fanuel Junior SOL157238 Kintana1250247
procedure TFrmCadFormulaMT.fcOutlookList5Items13Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'COMPARAVALBENEF(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;

  With MemDesc.lines Do Begin
    Add('OBJETIVO:');
    Add('Comparar valores de benefício');
    Add('                                                                                           ');
    Add('----------------------------------------------------------------------------------         ');
    Add('                                                                                           ');
    Add('SINTAXE:                                                                                   ');
    Add('COMPARAVALBENEF(FLGMAIORMENOR, FLGEXIBEMSG, VALOR1, VALOR2, VALOR3)                        ');
    Add('                                                                                           ');
    Add('----------------------------------------------------------------------------------         ');
    Add('EXEMPLO:                                                                                   ');
    Add('COMPARAVALBENEF(FLGMAIORMENOR, FLGEXIBEMSG, VALOR1, VALOR2, VALOR3)                        ');
    Add('                                                                                           ');
    Add('----------------------------------------------------------------------------------         ');
    Add('                                                                                           ');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                                  ');
    Add('- FLGMAIORMENOR                                                                            ');
    Add('       Flag identificador do valor maior ou menor.                                         ');
    Add('                                                                                           ');
    Add('- FLGEXIBEMSG                                                                              ');
    Add('       Flag identificador se a mensagem será apresentada ou não                            ');
    Add('                                                                                           ');
    Add('- VALOR1                                                                                   ');
    Add('       Valor Benefício                                                                     ');
    Add('                                                                                           ');
    Add('- VALOR2                                                                                   ');
    Add('       Valor Benefício                                                                     ');
    Add('                                                                                           ');
    Add('- VALOR3                                                                                   ');
    Add('       Valor Benefício                                                                     ');
  end;

  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;
//Fanuel Junior SOL157238 Kintana1250247

{ RUBRINDIV13 }
//BRUNO AZEVEDO SOL 147630-6881 KINTANA 1466979
procedure TFrmCadFormulaMT.fcOutlookList6Items17Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'RUBRINDIV13(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor de uma rubrica individual, que incide 13º, executando ou não sua regra de calculo.');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  RUBRINDIV13(IDRUBRICA, EXECUTACALCULO, FLGATIVA)                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  RUBRINDIV13(01021,N)                                                              ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - IDRUBRICA                                                                     ');
    Add('    Identificador da Rubrica.                                                     ');
    Add('  - EXECUTACALCULO                                                                ');
    Add('    Indica se deve ser executada a Regra de Calculo da Rubrica (S/N).             ');
    Add('    Obs.: Caso não deseje executar a Regra, o valor do campo VALORRUBRICA         ');
    Add('          será retornado.                                                         ');
    Add('  - FLGATIVA (opcional)                                                           ');
    Add('    Indica se pesquisará somente rubricas ativas. Que estão sendo pagas (S/N).    ');
    Add('    Default S.                                                                    ');
    Add('  - FLGDATAINICIO(opcional)                                                       ');//SOL121261 - Ádler Souza
    Add('    Considera data inicial da rubrica (S/N).                                      ');//SOL121261 - Ádler Souza
    Add('                                                                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add('  Na utilização desta fórmula em ambiente multi-camadas a Regra da rubrica        ');
    Add('  não poderá conter mensagens.                                                    ');

  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;
{ RUBRINDIV13 }
//BRUNO AZEVEDO SOL 147630-6881 KINTANA 1466979

// SOL 136385/7221 Kintana 1512983
procedure TFrmCadFormulaMT.fcOutlookList2Items17Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;

end;
// SOL 136385/7221 Kintana 1512983
procedure TFrmCadFormulaMT.fcOutlookList5Items14Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VALORPECULIO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;

  With MemDesc.lines Do Begin
    Add('OBJETIVO:');
    Add('Retorna o valor a ser pago de PECÚLIO ou AUXÍLIO FUNERAL a um determinado participante.');
    Add('                                                                                           ');
    Add('----------------------------------------------------------------------------------         ');
    Add('                                                                                           ');
    Add('SINTAXE:                                                                                   ');
    Add('VALORPECULIO(IDBENEFICIO,DATAPECULIO,IDPESSOAPESQUISA,IDTITULARPESQUISA,VALORINSS)         ');
    Add('                                                                                           ');
    Add('----------------------------------------------------------------------------------         ');
    Add('EXEMPLO:                                                                                   ');
    Add('VALORPECULIO(IDBENEFICIO,DATAPECULIO,IDPESSOAPESQUISA,IDTITULARPESQUISA,VALORINSS)         ');
    Add('                                                                                           ');
    Add('----------------------------------------------------------------------------------         ');
    Add('                                                                                           ');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                                  ');
    Add('- IDBENEFICIO                                                                              ');
    Add('       Identificador do benefício de pecúlio ou auxílio funeral da pesquisa (IDBENEFICIO). ');
    Add('                                                                                           ');
    Add('- DATAPECULIO                                                                              ');
    Add('       Data em que estamos pagando o benefício de pecúlio ou auxílio funeral.              ');
    Add('                                                                                           ');
    Add('- IDPESSOAPESQUISA                                                                         ');
    Add('       Indica o IDPESSOA que será utilizado na consulta interna da fórmula.                ');
    Add('                                                                                           ');
    Add('- IDTITULARPESQUISA                                                                        ');
    Add('       Indica o IDTITULAR que será utilizado na consulta interna da fórmula.               ');
    Add('                                                                                           ');
    Add('- VALORINSS (Opcional)                                                                     ');
    Add('  No caso de vir com valor diferente de NULO as consultas que buscam valor de INSS devem   ');
    Add('  considerar este valor ao invés do buscado na consulta.                                   ');
  end;

  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;
// SOL 136385/7221 Kintana 1512983
//Fanuel Junior SOL136385.7221 Kintana1250247
procedure TFrmCadFormulaMT.fcOutlookList5Items15Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VALORESBENEFICIO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;

  With MemDesc.lines Do Begin
    Add('OBJETIVO:');
    Add('Retorna algum dos valores do Benefício de um particpante (VALORSRB, VALORTOTAL, VALORATUAL).');
    Add('                                                                                           ');
    Add('----------------------------------------------------------------------------------         ');
    Add('                                                                                           ');
    Add('SINTAXE:                                                                                   ');
    Add('VALORESBENEFICIO(IDBENEFICIO,FLGVALOR,IDPLANOPREV,FONTEPAGADORA,SITUACAOBENEFICIO,IDPESSOAPESQUISA,IDTITULARPESQUISA)   ');
    Add('                                                                                           ');
    Add('----------------------------------------------------------------------------------         ');
    Add('EXEMPLO:                                                                                   ');
    Add('VALORESBENEFICIO(256,0,2,1,1,,)                  					    ');
    Add('                                                                                           ');
    Add('----------------------------------------------------------------------------------         ');
    Add('                                                                                           ');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                                  ');
    Add('- IDBENEFICIO                                                                              ');
    Add('        Identificador do beneficio da pesquisa (IDBENEFICIO).                              ');
    Add('                                                                                           ');
    Add('- FLGVALOR                                                                                 ');
    Add('        Indica o tipo do valor a ser pesquisado                                            ');
    Add('        0 - VALORSRB tabela BENEFBFCIAIRO                                                  ');
    Add('             1 - VALORTOTAL da tabela BENEFBFCIAIRO                                        ');
    Add('             2 - VALORATUAL da tabela BENEFBFCIAIRO                                        ');
    Add('                                                                                           ');
    Add('- IDPLANOPREV(opcional)                                                                    ');
    Add('        Identificador do plano previdenciário para utilizar como filtro na consulta.       ');
    Add('        Vazio para plano atual do associado.                                               ');
    Add('                                                                                           ');
    Add('- FONTEPAGADORA (opcional)								    ');
    Add('        Indica a fonte pagadora do beneficio para usar como filtro na consulta.	    ');
    Add('             1 - Fundação								    ');
    Add('             2 - INSS									    ');
    Add('								 			    ');
    Add('- SITUACAOBENEFICIO (opcional)								    ');
    Add('             Indica a situação atual do benefício (campo IDSITBENEFICIO da tabela          ');
    Add('             BENEFBFCIARIO)								    ');
    Add('											    ');
    Add('- IDPESSOAPESQUISA (opcional)								    ');
    Add('             Indica o IDPESSOA que será utilizado na consulta interna da fórmula.	    ');
    Add('             O IDPESSOA da consulta de entrada é o default  				    ');
    Add('											    ');
    Add('- IDTITULARPESQUISA (opcional) 							    ');
    Add('             Indica o IDTITULAR que será utilizado na consulta interna da fórmula.	    ');
    Add('             O IDPESSOA da consulta de entrada é o default				    ');
  end;

  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end;
//Fanuel Junior SOL136385.7221 Kintana1250247

//ELS SOL 159196 KINTANA 1302968 Inicio
procedure TFrmCadFormulaMT.fcOutlookList8Items23Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'ADICIONALPERC(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.Clear;      //SOL 136384/10262 Kintana 1688458
  MemDesc.Lines.BeginUpdate;

 // inicio SOL 136384/10262 Kintana 1688458
  With MemDesc.lines Do Begin
    Add('OBJETIVO:');
    Add('Retornar o percentual do Adicional de um participante calculando a média do percentual nos últimos 12 meses multiplicado pelo número de ocorrências');
    Add(' nos últimos 36 meses tendo como base a data de referência.                                ');
    Add('----------------------------------------------------------------------------------         ');
    Add('SINTAXE:                                                                                   ');
    Add('ADICIONALPERC(DATAREF,TIPO_ADICIONAL)                                                       ');
    Add('----------------------------------------------------------------------------------         ');
    Add('EXEMPLO:                                                                                   ');
    Add('ADICIONALPERC(01/12/2011, P)                                                                ');
    Add('----------------------------------------------------------------------------------         ');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                                  ');
    Add('      - DATAREF:Data de referência                                                         ');
    Add('      - TIPO_ADICIONAL:                                                                    ');
    Add('             P  - Periculosidade                                                           ');
    Add('             I  - Insalubridade                                                            ');
    end;
  // fim SOL 136384/10262 Kintana 1688458
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
//ELS SOL 159196 KINTANA 1302968 Fim

end;

//Vinicius Ferreira SOL 153972 KINTANA 1169147
procedure TFrmCadFormulaMT.fcOutlookList10Items6Click(OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'QTDDIASCFPESSOA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Add('OBJETIVO:');
    Add('Retornar o número de dias no mês indicado que o participante exerceu uma determinada Função ou Cargo.  ');
    Add('------------------------------------------------------------------------------------------------       ');
    Add(' EXEMPLO: QTDDIASCFPESSOA(CODIGO,TIPO,ANOMESREF)                                                       ');
    Add(' ------------------------------------------------------------------------------------------------      ');
    Add(' DESCRIÇÃO DOS PARAMETROS:                                                                             ');
    Add(' - CODIGO Código do Cargo/Função a pesquisar.                                                          ');
    Add(' - TIPO Indica o tipo de item de cálculo do PCS que se está calculando. (C - Cargo, F - Função)        ');
    Add(' - ANOMESREFERENCIA Ano/Mês no qual se deseja calcular o número de dias do adicional.                  ');
    Add('------------------------------------------------------------------------------------------------       ');
    Add(' OBSERVAÇÃO: 1. Caso a fórmula não encontre nenhum cargo ou função ela retornará o valor ZERO.         ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;
//inicio - André Oliveira SOL 136384/9641 Kintana 1664442
procedure TFrmCadFormulaMT.fcOutlookList8Items24Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'DUPLICADETCALCULOTITULAR(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.lines.Clear;
  MemDesc.Lines.BeginUpdate;

  With MemDesc.lines Do Begin
    Add('OBJETIVO:');
    Add('Duplicar dados na tabela do Cálculo de Beneficio, para os dependentes do titular que estão sendo processados.');
    Add('----------------------------------------------------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                                   ');
    Add('DUPLICADETCALCULOTITULAR(IDPESSOA,IDTITULAR,DESCRICAO)                                     ');
    Add('----------------------------------------------------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                                   ');
    Add('DUPLICADETCALCULOTITULAR(1,10,DESCRICAO)                                               ');
    Add('-----------------------------------------------------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARÂMETROS:                                                                  ');
    Add('      IDENTIFICADOR DO TITULAR: Identificador do títular no plano previdenciário.          ');
    Add('      IDENTIFICADOR PESSOA: Identificador do cadastro de pessoa.			    ');
    Add('      Observação: Essa fórmula deverá seguir os mesmos critérios queo tipo de passo de regra de gravar no demonstrativo de cálculo ou seja, quando a regra');
    Add('      estiver sendo executada pela interface de execução de regras do módulo de regras, os registros inseridos na DETCALCULO não devem ser mantidos.');
    end;

  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end;
//fim - André Oliveira SOL 136384/9641 Kintana 1664442
//Inicio -  SOL 136384/10002 Kintana 1685939
procedure TFrmCadFormulaMT.fcOutlookList8Items25Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
   dedMemo.Text := dedMemo.Text + 'FUNCAOCONFIANCA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.lines.Clear;
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Add('OBJETIVO:');
    Add('   Busca os valores das funções de confiança, adicional compensatório e adicional de incorporação exercidas dentro do PBC referente a DIB informada');
    Add('   Compara os três valores e retorna para a variavel o melhor valor');
    Add('   Essa formula também insere na DETCALCULO o código e o percentual das funções de confiança, do adicional compensatório ou do adicional de incorporação(o que tiver o maior valor) da seguinte forma:');
    Add('   Função:');
    Add('     Descrição: ''CODFUNC/%/MODO_n:'' (onde n é o número do registro retornado na consulta);');
    Add('     Valor:     ''0031/100.000/EF''');
    Add('   Adicional compensatório:');
    Add('     Descrição: ''CODACPF/%/MODO_n:''');
    Add('     Valor: ''0396/100.000/100.000''');
    Add('   Adicional de Incorporação:');
    Add('     Descrição: ''CODADINC/%/MODO_n:''');
    Add('     Valor: ''0396/100.000/100.000''');
    Add('   Observação: Caso a soma dos percenutais da função de confiança (regra não é valida para adicional compensatório ou de incorporação) seja superior a 100% devera exibir mensagem informando a');
    Add('                inconsistência e retorna o valor 0.');
    Add('                                                                                             ');
    Add('---------------------------------------------------------------------------------------------');
    Add('                                                                                             ');
    Add('SINTAXE:                                                                                     ');
    Add('     FUNCAOCONFIANCA(DIB,PERIODO,FLGINVALIDEZ,VARRETORNO)                                    ');
    Add('                                                                                             ');
    Add('---------------------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                                     ');
    Add('     FUNCAOCONFIANCA(01/10/2001,365,0,@RETORNO)                                                ');
    Add('                                                                                             ');
    Add('---------------------------------------------------------------------------------------------');
    Add('                                                                                             ');
    Add('DESCRIÇÃO DOS PARÂMETROS:                                                                    ');
    Add('     DIB: Data de refêrencia.                                                                ');
    Add('     PERÍODO: Período a Processar. É o PBC, ou seja, a quantidade de dias considerados para o PBC.                                    ');
    Add('     FLGINVALIDEZ: Flag para indentificar se a consulta seguirá os críterios de invalidez(ou pensão por morte de ativo) ou não.');
    Add('     Onde, 1 - Segue criterios de invalidez e 0 - Não segue críterios de invalidez(ou pensão por morte de ativo) ou não.');
    Add('     VARRETORNO:Varíavel de retorno se foi considerado a função (Retorna FUNC) ou o adicional compensatório (Retorna ADCOMP) ou o adicional de incorporação (Retorna ADINC).');
    end;

  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;

end;
//fim - SOL 136384/10002 Kintana 1685939
//inicio - André Oliveira SOL 136384/10042 Kintana 1688458
procedure TFrmCadFormulaMT.fcOutlookList8Items26Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
   dedMemo.Text := dedMemo.Text + 'MAIORCFCOD(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.lines.Clear;
  MemDesc.Lines.BeginUpdate;

  With MemDesc.lines Do Begin
    Add('OBJETIVO:');
    Add('Retornar o código do MAIOR CARGO/FUNCAO na tabela de CARGOS e FUNÇÕES.               ');
    Add('-------------------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                                   ');
    Add('MAIORCFCOD(TIPO, DATAREF, INDICADOR_PCC)                                             ');
    Add('-------------------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                                   ');
    Add('MAIORCFCOD(C, 01/01/2012, S)                                             ');
    Add('-------------------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARÂMETROS:                                                                  ');
    Add('      TIPO: Indica se deseja buscar o valor do CARGO(C) OU FUNCAO(F)                       ');
    Add('      DATAREF: Data na qual se deseja buscar o valor do cargo do CARGO/FUNCAO.             ');
    Add('      INDICADOR_PCC: Indicar de se o cargo/função deve pertencer ao PCC ou não.            ');
    Add('             S  - Sim, cargo/função deve pertencer ao PCC.                                 ');
    Add('             N  - Não, cargo/função não deve pertencer ao PCC.                             ');
    Add('             I  - Faz a busca independentemente de pertencer ao PCC                        ');
    Add('      Fazer a busca INDEPENDENTE de pertencer ou não ao PCC.                               ');
    Add('Observação: Para caso de encontrar mais de um cargo ou função COM o maior valor, a fórmula deverá considerar a primera que a consulta retornar.');
  end;

  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;
//fim - André Oliveira SOL 136384/10042 Kintana 1688458
//inicio - André Oliveira SOL 136384/10342 Kintana 1712175
procedure TFrmCadFormulaMT.fcOutlookList8Items27Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
   dedMemo.Text := dedMemo.Text + 'EXCLUIDETCALCULO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.lines.Clear;
  MemDesc.Lines.BeginUpdate;

  With MemDesc.lines Do Begin
    Add('OBJETIVO:');
    Add('Excluir dados na tabela do Cálculo de Beneficio, para as pessoas que estão sendo processadas.');
    Add('----------------------------------------------------------------------------------------------------------------');
    Add('SINTAXE:');
    Add('EXCLUIDETCALCULO(IDPESSOA,DESCRICAO)');
    Add('----------------------------------------------------------------------------------------------------------------');
    Add('EXEMPLO:');
    Add('EXCLUIDETCALCULO(1,TESTE)');
    Add('----------------------------------------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARÂMETROS:');
    Add('	IDPESSOA: Identificador do cadastro de pessoa.');
    Add('	DESCRIÇÃO: Valor contido no campo DESCRICAO da estrutura DETCALCULO.');
    Add('Observação: Essa fórmula só deverá excluir os registros na DETCALCULO quando estiver sendo executada pelo módulo de origem.');
    Add('Quando executada pelo módulo de regras de negócios, na interface de execução de regras, o sistema não deverá excluir o registro.');
  end;

  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;
//fim - André Oliveira SOL 136384/10342 Kintana 1712175
//inicio - André Oliveira SOL 136384/11302 Kintana 1786550
procedure TFrmCadFormulaMT.fcOutlookList8Items28Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
   dedMemo.Text := dedMemo.Text + 'VALORBENEFICIOINSS(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.lines.Clear;
  MemDesc.Lines.BeginUpdate;

  With MemDesc.lines Do Begin
    Add('OBJETIVO:');
    Add('Retorna O valor do Benefício de um particpante em determinado mês referência para o cálculo do valor do SRB.');
    Add('------------------------------------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                                   ');
    Add('VALORBENEFICIOINSS(IDPESSOAPESQUISA,IDTITULARPESQUISA,MESANO)                              ');
    Add('------------------------------------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                                   ');
    Add('VALORESBENEFICIO(@IDPESSOA,@IDTITULAR,@MESREFERENCIA)                  		    ');
    Add('------------------------------------------------------------------------------------------------------------');
    Add('                                                                                           ');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                                  ');
    Add('- IDPESSOAPESQUISA								    ');
    Add('        Indica o IDPESSOA que será utilizado na consulta interna da fórmula.	            ');
    Add('        O IDPESSOA da consulta de entrada é o default  				    ');
    Add('											    ');
    Add('- IDTITULARPESQUISA 							    ');
    Add('         Indica o IDTITULAR que será utilizado na consulta interna da fórmula.             ');
    Add('         O IDPESSOA da consulta de entrada é o default                                     ');
    Add('- MESANO                                                                                 ');
    Add('         Mês/Ano de referência. Formato AAAA/MM                                            ');
  end;

  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;
//fim - André Oliveira SOL 136384/11302 Kintana 1786550
//André - Oliveira SOL 136384/10362 Kintana 1712325
procedure TFrmCadFormulaMT.fcOutlookList8Items29Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
dedMemo.Text := dedMemo.Text + 'VALORSRBNP(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.lines.Clear;
  MemDesc.Lines.BeginUpdate;

  With MemDesc.lines Do Begin
    Add('OBJETIVO:');
    Add('     Buscar o valor do SRB de acordo com as regras do NOVO PLANO.');
    Add('----------------------------------------------------------------------------------------------------------------');
    Add('SINTAXE:');
    Add('     VALORSRBNP(DATASRB,IDPESSOAPESQUISA,IDTITULARPESQUISA).');
    Add('----------------------------------------------------------------------------------------------------------------');
    Add('EXEMPLO:');
    Add('     VALORSRBNP(01/01/2012,10,15).');
    Add('----------------------------------------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARÂMETROS:');
    Add('     - DATASRB: Data para considerar o calculo do SRB');
    Add('     - IDPESSOAPESQUISA: Indica o IDPESSOA que será utilizado na consulta interna da fórmula.');
    Add('     - IDTITULARPESQUISA: Indica o IDTITULAR que será utilizado na consulta interna da fórmula');
  end;

  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;
//fim - SOL 136384/10362 Kintana 1712325
//André - Oliveira SOL 136384/10362 Kintana 1712325
procedure TFrmCadFormulaMT.fcOutlookList8Items30Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'VWFORMRUBJUD(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.lines.Clear;
  MemDesc.Lines.BeginUpdate;

  With MemDesc.lines Do Begin
    Add('OBJETIVO:');
    Add('     Retorna o valor ou valortotal da VIEW VW_FORMRUBJUD conforme parâmetros na fórmula.');
    Add('------------------------------------------------------------------------------------------------------------------------------------------------');
    Add('SINTAXE:');
    Add('     VWFORMRUBJUD(TIPOVALOR,CODPROVDESC,IDPLANOPREV,MESREFERENCIA,MESCOBRANCA,IDPESSOA,IDTITULAR)');
    Add('------------------------------------------------------------------------------------------------------------------------------------------------');
    Add('EXEMPLO:');
    Add('     VWFORMRUBJUD (1,211204,2,2012/10,2012/08,458406,458406)');
    Add('------------------------------------------------------------------------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARÂMETROS:');
    Add('     - TIPOVALOR Indica qual o valor da consulta ele deverá retornar.');
    Add('              	0 = VALOR                                             ');
    Add('              	1 = VALORTOTAL                                        ');
    Add('     - CODPROVDESC : Indica qual o valor a ser utilizado como filtro para o campo CODPROVDESC da consulta.');
    Add('     - IDPLANOPREV (opcional): Identificador do plano previdenciário para utilizar como filtro na consulta.');
    Add('                               Vazio para plano não passar este campo como filtro na consulta.');
    Add('     - MESREFERENCIA (opcional): Ano/Mes de referência. Formato AAAA/MM Vazio para plano não passar este campo como filtro na consulta.');
    Add('     - MESCOBRANCA (opcional) : Ano/Mes de cobrança. Formato AAAA/MM Vazio para plano não passar este campo como filtro na consulta.');
    Add('     - IDPESSOA (opcional): Indica o IDPESSOA que será utilizado na consulta interna da fórmula. O IDPESSOA da consulta de entrada é o default');
    Add('     - IDTITULAR (opcional) Indica o IDTITULAR que será utilizado na consulta interna da fórmula. O IDTITULAR da consulta de entrada é o default');
  end;

  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

//William Moreira da Silva - SIG 40538
{ VALORBENEFICIOINICIAL }
procedure TFrmCadFormulaMT.fcOutlookList5Items16Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  inherited;
  dedMemo.Text := dedMemo.Text + 'VALORBENEFICIOINICIAL(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o percentual do BUA quano utilizado parametro de beneficio ÚNICO e valor do BS e do FAB TOTAL.  ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  VALORBENEFICIOINICIAL (VALORBASE1, VLRBSTOTAL, VLRFABTOTAL, PLANO, TIPO DE PAGAMENTO, FONTEPAGADORA) ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('  VALORBENEFICIOINICIAL (@VALORBASE1, @VLRBSTOTAL, @VLRFABTOTAL, 2, 2, 1)         ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add(' Variáveis de Retorno                                                             ');
    Add(' - VALORBASE1                                                                     ');
    Add(' Variável que irá retornar o fator atuarial do Reg/repla, ou o percentual do BUA. ');
    Add(' - VLRBSTOTAL                                                                     ');
    Add(' Variável que irá retornar o valordo BS TOTAL gravado na Benefbfciario            ');
    Add(' - VLRFABTOTAL                                                                    ');
    Add(' Variável que irá retornar o valordo FAB TOTAL gravado na Benefbfciario           ');
    Add('                                                                                  ');
    Add(' Identificadores de Pesquisa                                                      ');
    Add(' - IDPESSOA                                                                       ');
    Add(' Identificador de pesquisa do participante                                        ');
    Add('- IDPESSJUR                                                                       ');
    Add(' Identificador de pesquisa de patrocinadora                                       ');
    Add(' - PLANO                                                                          ');
    Add(' 2  - REG/REPLAM                                                                  ');
    Add(' 66 - REB                                                                         ');
    Add(' 74 - NOVO PLANO                                                                  ');
    Add(' - TIPO DE PAGAMENTO                                                              ');
    Add(' 1  - VITALÍCIO                                                                   ');
    Add(' 2  - ÚNICO                                                                       ');
    Add(' - FONTEPAGADORA                                                                  ');
    Add(' 1  - FUNCEF                                                                      ');
    Add(' 2  - INSS                                                                        ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;
{ VALORBENEFICIOINICIAL }

{ VALORBENEFICIOSALDADO }
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList9Items8Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  inherited;
  dedMemo.Text := dedMemo.Text + 'VALORBENEFICIOSALDADO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor do benefício saldado na DIB.                                    ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  VALORBENEFICIOSALDADO(BENEFSALDADO, SALDOFAB, parametro)                        ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('   VALORBENEFICIOSALDADO(@BENEFSALDADO, @SALDOFAB, @ID_TITULAR)                   ');
    Add('----------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                       ');
    Add(' Pessoa a pesquisar será definida pelo campo IDPESSOA da consulta de              ');
    Add(' entrada da  Regra ou pelos Dados Auxiliares da Regra (Views).                    ');
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;
{ VALORBENEFICIOSALDADO }
//William Moreira da Silva - SIG 40538

//William Moreira da Silva - SIG 42298
procedure TFrmCadFormulaMT.fcOutlookList6Items18Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
    inherited;
  inherited;
  dedMemo.Text := dedMemo.Text + 'VALORRUBTMPDESC(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Retorna o valor da rubrica da estrutura de dados temporária: TMPDESC.           ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  VALORRUBTMPDESC (CODPROVDESC, MESREFERENCIA, MESCOBRANCA, IDPLANOPREV (opcional)) ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('     VALORRUBTMPDESC (218504, ''2017/03'', ''2017/03'')                           ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - CODPROVDESC                                                                   ');
    Add('       Código da Rubrica, pesquisado no campo CODPROVDESC.                        ');
    Add('  - IDPESSJUR                                                                     ');
    Add('       Identificado da pessoa jurídica (patrocinadora) a ser pesquisada           ');
    Add('  - IDPESSOA                                                                      ');
    Add('       Identificado da pessoa a ser pesquisada                                    ');
    Add('  - IDTITULAR                                                                     ');
    Add('       Identificado do titular da pessoa a ser pesquisada                         ');
    Add('  - IDPLANOPREV (OPCIONAL)                                                        ');
    Add('       Identificado do plano previdenciário da pessoa a ser pesquisada            ');
    Add('               2  - REG/REPLAN                                                    ');
    Add('               66 - REB                                                           ');
    Add('               74 - NOVO PLANO                                                    ');
    Add('  - MESCOBRANCA                                                                   ');
    Add('       Ano/Mês de processamento da cobrança da rubrica                            ');
    Add('  - MESREFERENCIA                                                                 ');
    Add('       Ano/Mês de referência do processamento da cobrança da rubrica              ');

  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;
//William Moreira da Silva - SIG 42298

// Alterado por FHBS - 01/05/2019 - SIG85462
{BUSCAMINFREQCAIXA}
procedure TFrmCadFormulaMT.fcOutlookBar1OutlookList9Items9Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  dedMemo.Text := dedMemo.Text + 'BUSCAMINFREQCAIXA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Buscar o somatório de minutos agrupado por pessoa, mês e tipo da ocorrência.    ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  BUSCAMINFREQCAIXA(NUMOCOR, MES, IDPESSOA)                                       ');
    Add('----------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                          ');
    Add('   BUSCAMINFREQCAIXA (13, @MES, @IDPESSOA) ou                                    ');
    Add('   BUSCAMINFREQCAIXA (@NUMOCOR, @MES, @IDPESSOA)                                  ');
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - NUMOCOR                                                                       ');
    Add('    Indica o código que será pesquisado na tabela.                                ');
    Add('  - MES                                                                           ');
    Add('    Indica o campo datainicio em (YYYY/MM).                                       ');
    Add('  - IDPESSOA                                                                      ');
    Add('    Indica o IDPESSOA que será utilizado na consulta interna da fórmula.          ');

  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;
{BUSCAMINFREQCAIXA}
// Fim - Alterado por FHBS - 01/05/2019 - SIG85462

//Ewerton Beltramini - SIG99274 - Inicio...
procedure TFrmCadFormulaMT.fcOutlookList6Items19Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  //dedMemo.Text := dedMemo.Text + 'ANTECIPAMESABONO(';    //Andre Imakawa - SIG 99564
  dedMemo.Text := dedMemo.Text + 'ABONOMES(';              //Andre Imakawa - SIG 99564
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO:                                                                         ');
    Add('  Permite buscar o mês de abono normal/antecipação da FUNCEF/INSS.                ');
    Add('----------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                          ');
    Add('  ABONOMES(@TIPO, @FONTEPAGADORA)                                                 ');  //Andre Imakawa - SIG 99564
    Add('EXEMPLO:                                                                          ');
    Add('  ABONOMES(1, 2)                                                                  ');  //Andre Imakawa - SIG 99564
    Add('----------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                         ');
    Add('  - TIPO                                                                          ');  //Andre Imakawa - SIG 99564
    Add('    VALOR NUMERICO PARA REPRESENTAR O TIPO DA BUSCA NORMAL(1) OU ANTECIPAÇÃO(2).  ');  //Andre Imakawa - SIG 99564
    Add('  - FONTEPAGADORA                                                                  '); //Andre Imakawa - SIG 99564
    Add('    VALOR NUMERICO PARA REPRESENTAR A BUSCA DA FONTE PAGADORA FUNCEF(1) OU INSS(2).'); //Andre Imakawa - SIG 99564
  end;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;  {ABONOMES}
//Ewerton Beltramini - SIG99274 - Fim

// Andre Imakawa - SIG 103583 - Inicio
{PARAMPESSOADTFIM}
procedure TFrmCadFormulaMT.fcOutlookList2Items18Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  { Inlcui dados da Formula nos campos }
  dedMemo.Text := dedMemo.Text + 'PARAMPESSOADTFIM(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  { Mostra Descricao da Formula }
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO                                                                         ');
    Add('  Retorna valor da tabela de Parametros para Pessoa (PESSOAPARAM).               ');
    Add('---------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                         ');
    Add('  PARAMPESSOADTFIM(IDPARAMETRO, IDPESSOAPESQUISA)                            ');
    Add('---------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                         ');
    Add('  PARAMPESSOADTFIM(272)                                                     ');
    Add('---------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                        ');
    Add('  - IDPARAMETRO                                                                  ');
    Add('    Identificador do Parametro a Retornar.                                       ');
    Add('  - IDPESSOAPESQUISA (opcional)                                                  ');
    Add('    Identificador da pessoa a ser pesquisada, caso seja diferente da informada na');
    Add('    Consulta de entrada (IDPESSOA)                                               ');
    Add('---------------------------------------------------------------------------------');
     Add('OBSERVAÇÃO:                                                                      ');
    Add('  Pessoa pesquisada é a informada na Consulta de entrada (campo IDPESSOA), a não ');
    Add('  ser que outra seja informada no parametro (IDPESSOAPESQUISA).                  ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;    {PARAMPESSOADTFIM}
// Andre Imakawa - SIG 103583 - Fim


//edilaine SIG114117-114326 : inicio
procedure TFrmCadFormulaMT.fcOutlookList2Items19Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  { Inlcui dados da Formula nos campos }
  dedMemo.Text := dedMemo.Text + 'EXISTERESERVA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  { Mostra Descricao da Formula }
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO                                                                         ');
    Add('  Retorna se a pessoa possui determinada reserva ou não.                         ');
    Add('---------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                         ');
    Add('  EXISTERESERVA([LISTA_RESERVA],IDPESSOA, IDPLANOPREV)                           ');
    Add('---------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                         ');
    Add('  EXISTERESERVA([168],91008,74)                                                  ');
    Add('---------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                        ');
    Add('  - LISTA_RESERVA                                                                ');
    Add('    Lista de valores a serem pesquisados na coluna IDTIPORESERVA das tabelas do  ');
    Add('    Banco de Dados                                                               ');
    Add('  - IDPESSOA  (opcional)                                                         ');
    Add('    Identificador do participante a ser pesquisada                               ');
    Add('  - IDPLANOPREV  (opcional)                                                      ');
    Add('       Identificado do plano previdenciário da pessoa a ser pesquisada           ');
    Add('               2  - REG/REPLAN                                                   ');
    Add('               66 - REB                                                          ');
    Add('               74 - NOVO PLANO                                                   ');
    Add('---------------------------------------------------------------------------------');
     Add('OBSERVAÇÃO:                                                                     ');
    Add('   ');
    Add('   ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;
//edilaine SIG114117-114326 : fim


//edilaine SIG115844-115954 : inicio
procedure TFrmCadFormulaMT.fcOutlookList2Items20Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  { Inlcui dados da Formula nos campos }
  dedMemo.Text := dedMemo.Text + 'MOLESTIAGRAVE(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  { Mostra Descricao da Formula }
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO                                                                         ');
    Add('  Retorna se a pessoa possui moléstia grave e/ou isenção de IR.                  ');
    Add('---------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                         ');
    Add('  MOLESTIAGRAVE(IDPESSOAPESQ)                                                    ');
    Add('---------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                         ');
    Add('  MOLESTIAGRAVE(91008)                                                           ');
    Add('---------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                        ');
    Add('  - IDPESSOAPESQ  (opcional)                                                     ');
    Add('    Identificador da pessoa a ser pesquisada, caso seja diferente da informada na');
    Add('    Consulta de entrada (IDPESSOA)                                               ');
    Add('---------------------------------------------------------------------------------');
     Add('OBSERVAÇÃO:                                                                     ');
     Add('  Pessoa pesquisada é a informada na Consulta de entrada (campo IDPESSOA), a não');
     Add('  ser que outra seja informada no parametro (IDPESSOAPESQ).                     ');
     Add(' ');
     Add('  - TIPOS DE RESULTADO                                                          ');
     Add('      1 - Apenas Moléstia Grave                                                 ');
     Add('      2 - Apenas Isenção de IR                                                  ');
     Add('      3 - Moléstia Grave e Isenção de IR                                        ');
     Add('      4 - Nenhuma das duas                                                      ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;
//edilaine SIG115844-115954 : fim


//edilaine WO18367 : inicio
procedure TFrmCadFormulaMT.fcOutlookList5Items17Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  { Inlcui dados da Formula nos campos }
  dedMemo.Text := dedMemo.Text + 'NOVOCALCPENSAOSALDADA(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  { Mostra Descricao da Formula }
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO                                                                         ');
    Add('  Retorna se o cálculo da pensão deverá considerar o novo percentual de 50%+10%  ');
    Add('  por dependente, limitado a 80%                                                 ');
    Add('  Irá comparar se a DATAMORTE do Titular é anterior a data parametrizada no campo');
    Add('  DTNOVOCALCPENSASALDADA da tabela PARAMAPREV                                    ');
    Add('---------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                         ');
    Add('  NOVOCALCPENSAOSALDADA(IDTITULARPESQ)                                           ');
    Add('---------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                         ');
    Add('  NOVOCALCPENSAOSALDADA(123456)                                                  ');
    Add('---------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                        ');
    Add('  - IDTITULARPESQ                                                                ');
    Add('    Identificador do titular a ser pesquisado, caso seja diferente do informado  ');
    Add('    na Consulta de entrada (IDTITULAR)                                           ');
    Add('---------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                     ');
    Add('  Titular pesquisado é o informado na Consulta de entrada (campo IDTITULAR), a  ');
    Add('  não ser que outro seja informado no parametro (IDTITULARPESQ).                ');
    Add(' ');
    Add('  - TIPOS DE RESULTADO                                                          ');
    Add('      SIM  - Usa percentual 50% + 10% por dependente                            ');
    Add('      NAO  - Usa percentual fixo de 80%                                         ');
    Add('      ERRO - Nenhuma das duas                                                   ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;

procedure TFrmCadFormulaMT.fcOutlookList5Items18Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  inherited;
  { Inlcui dados da Formula nos campos }
  dedMemo.Text := dedMemo.Text + 'TEMPORALIDADE(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  { Mostra Descricao da Formula }
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO                                                                         ');
    Add('  Retorna o prazo pelo qual a pensão saldada será paga, sendo que o retorno sem  ');
    Add('  valor equivale ao Vitalício                                                    ');
    Add('  Irá buscar na tabela TEMPORALIDADE o prazo cuja faixa de idade e vigência se   ');
    Add('  relacionem com os valores informados                                           ');
    Add('---------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                         ');
    Add('  TEMPORALIDADE(IDADE, DATAPESQ)                                                 ');
    Add('---------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                         ');
    Add('  TEMPORALIDADE(24, 25/03/2025)                                                  ');
    Add('---------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                        ');
    Add('  - IDADE (obrigatorio)                                                          ');
    Add('    Número inteiro que corresponda a idade do dependente                         ');
    Add('  - DATAPESQ (opcional)                                                          ');
    Add('    Se não for informado um valor para Data de pesquisa, será usada a data da DIB');
    Add('    informada na Consulta de entrada (DATAINICIO)                                ');
    Add('---------------------------------------------------------------------------------');
     Add('OBSERVAÇÃO:                                                                     ');
     Add('  A Data pesquisada é a informada na Consulta de entrada (campo DATAINICIO)     ');
     Add('  a não ser que outro valor seja informado no parametro (DATAPESQ).             ');
     Add(' ');
     Add('  - TIPOS DE RESULTADO                                                          ');
     Add('      Qtd anos - quantidade de anos que o dependente receberá a pensão          ');
     Add('      Nada     - não há limitação de anos para pensão                           ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;
//edilaine WO18367 : fim


//edilaine WO24119 : inicio
procedure TFrmCadFormulaMT.fcOutlookList5Items19Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  { Inlcui dados da Formula nos campos }
  dedMemo.Text := dedMemo.Text + 'PAGAPECULIOSALDADO(';
  Cds.FieldbyName('EXPRESSAOFORMULA').AsString := dedMemo.Text;
  Inc(ContParent);
  MemDesc.Lines.BeginUpdate;
  { Mostra Descricao da Formula }
  With MemDesc.lines Do Begin
    Clear;
    Add('OBJETIVO                                                                         ');
    Add('  Verifica se pensionista/herdeiro tem direito ao recebimento de pecúlio no      ');
    Add('  plano Saldado e se aplica as novas regras de mínimo e máximo                   ');
    Add('---------------------------------------------------------------------------------');
    Add('SINTAXE:                                                                         ');
    Add('  PAGAPECULIOSALDADO(IDTITULARPESQ)                                              ');
    Add('---------------------------------------------------------------------------------');
    Add('EXEMPLO:                                                                         ');
    Add('  PAGAPECULIOSALDADO(123456)                                                     ');
    Add('---------------------------------------------------------------------------------');
    Add('DESCRIÇÃO DOS PARAMETROS:                                                        ');
    Add('  - IDTITULARPESQ                                                                ');
    Add('    Identificador do titular a ser pesquisado, caso seja diferente do informado  ');
    Add('    na Consulta de entrada (IDTITULAR)                                           ');
    Add('---------------------------------------------------------------------------------');
    Add('OBSERVAÇÃO:                                                                      ');
    Add('  Titular pesquisado é o informado na Consulta de entrada (campo IDTITULAR), a   ');
    Add('  não ser que outro seja informado no parametro (IDTITULARPESQ).                 ');
    Add(' ');
    Add('  - TIPOS DE RESULTADO                                                           ');
    Add('      0  - Não paga peculio                                                      ');
    Add('      1  - Paga peculio no plano saldado                                         ');
    Add('      ERRO - Nenhuma das opções                                                  ');
  End;
  MemDesc.Lines[0]:=MemDesc.Lines[0]+'';
  MemDesc.Lines.EndUpdate;
end;
//edilaine WO24119 : fim


end.

