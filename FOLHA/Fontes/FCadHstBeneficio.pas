
(*
FAZER PENDENCIAS E ACERTOS
 PENDENCIA PARA COLOCAR NOME DO USUARIO NO GRID - 19003
 FAZER NA INCLUSÃO DE REGISTRO A ATUALIZAÇÃO DO USUÁRIO NO GRID.

 INCREMENTAR SEQBENEFICIO
 GRAVAR IDSEQINTERNOFB ==> GRAVAR TB NA FLANCAMENTORUBRICAINDIV 21559
 EXIBIR FLGMANUAL - 22067
 FLGTIPOREGISTRO - 22325 - permitir alterar esta informação (?)
 ADAPTAR MULTIFUNDACAO - 14674
*)
// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// *****************************************************************************
//------------------------------------------------------------------------------
//Alteração  : MostraValoresFabBs, MostraValoresFabBsGbValores,
//             OcultaValoresFabBsGbValores
//Nº SIG.....: WO22572
//Data.......: 11/06/2025
//Responsável: luis ferrari
//Descrição..: redimensionar a tela corretamente
//------------------------------------------------------------------------------
//Alteração  : (dfm gpInfoTitular, gbValores) CmeCadastroFind, MostraValoresFabBs,
//             MostraValoresFabBsGbValores, OcultaValoresFabBsGbValores
//Nº SIG.....: WO18367
//Data.......: 03/02/2025
//Responsável: Edilaine
//Descrição..: Alterar o percentual aplicado para concessão de Pensão Reg/Replan
//             (atualmente o beneficio calcula 80% do valor cheio antes de ratear
//             pelo grupo familiar. A nova regra estipula 50%+10% por dependente,
//             limitado a 80%. Para 2 dependentes, o beneficio será 70% do cheio)
//------------------------------------------------------------------------------
//Alteração  : bbtnOkDetClick
//Nº SIG.....: 127721
//Data.......: 04/08/2022
//Responsável: Andre Imakawa
//Descrição..: Validar o campo edAnoComp apenas para Fonte INSS
//------------------------------------------------------------------------------
//Alteração  : ApagaPrevia_Procedure e CmeCadastroConfirma
//Nº SIG.....: 99346
//Data.......: 03/04/2020
//Responsável: Andre Imakawa
//Descrição..: Apagar dados da Previa utilizando a procedure.
//------------------------------------------------------------------------------
//Alteração  : ApagaPrevia
//Nº SIG.....: 97671
//Data.......: 13/02/2020
//Responsável: Andre Imakawa
//Descrição..: Apagar apenas registros com lote não efetivados
//------------------------------------------------------------------------------
//Alteração  : ApagaPrevia
//Nº SIG.....: 92075
//Data.......: 25/09/2019
//Responsável: Rafael Vasconcelos
//Descrição..: Considerar o lote para apagar a Base de Pagamento.
//------------------------------------------------------------------------------
//Alteração  : ApagaPrevia
//Nº SIG.....: 84221
//Data.......: 30/05/2019
//Responsável: Andre Imakawa
//Descrição..: Alterar o FLGPROCESSADO = 1 na tabela HSTPRAZOACUMULACAOFOLHA
//------------------------------------------------------------------------------
//Nº SIG.....: 27748
//Data.......: 18/05/2018
//Responsável: Denis Horongoso
//Descrição..: Implementar regra para deleção de registros já processados
//------------------------------------------------------------------------------
//Alteração  : ApagaPrevia
//Nº SIG.....: 65680
//Data.......: 03/04/2018
//Responsável: Andre Imakawa
//Descrição..: Deletar tabela LOG_ALT_BASEPGTO
//--------------------------------------------------------------------------------
//Pendência   : SIG53469
//Data        : 28/08/2017
//Responsável : Fernando Xavier
//Alteração   : Validação do campo mês reembolso para não inserir quando se tratar
//              de um beneficio Funcef.
//--------------------------------------------------------------------------------
//Pendência   : SIG51403
//Data        : 31/07/2017
//Responsável : Fernando Xavier
//Alteração   : Validação dos campos ano e mes cobrança, referencia e reembolso.
//--------------------------------------------------------------------------------
//Pendência   : SIG49444
//Data        : 29/06/2017
//Responsável : Fábio Sampaio
//Alteração   : Disponibilização do fonte SOL 207789/16579.
//--------------------------------------------------------------------------------
//Pendência   : SOL 207789/16579 PPM 543916
//Data        : 05/07/2015
//Responsável : Fernando Xavier
//Alteração   : Criação de Nova Funcionalidade para Batimento de Retorno das Informações da
//              Fita de Crédito
//------------------------------------------------------------------------------
//Alteração  : verificar se campo é diferente de 0
//Nº SIG.....: 31884
//Data.......: 19/10/2016
//Responsável: Andre Imakawa
//Descrição..:  Erro de constraint R_1922 - HSTBENEFBFCIARIO
//------------------------------------------------------------------------------
//Alteração  : inclusão do campo portadorforma para retornar na qry principal
//DFM        : Alteração da SQL do objeto Qry
//Nº SIG.....: 29359
//Data.......: 04/10/2016
//Responsável: Andre Imakawa
//Descrição..:  Sistema não realiza o correto lançamento do portador forma no
//              processamento da prévia em virtude de falha no cadastro do manual
//              histórico de benefícios.
//------------------------------------------------------------------------------
//Pendência   : SOL 271052 PPM 1351891
//Responsável : André Imakawa/Marcelo Cardoso
//Data        : 11/04/2016
//Descrição   : DELEÇÃO INDEVIDA IN 1343** Identificamos que quando da tentativa
//de alteração do registro no histórico de benefícios, está impactanto e
//deletando a hstbitributação indevidamente.
//------------------------------------------------------------------------------
//Pendência   : SOL 269070 PPM 1285933
//Responsável : Douglas Siqueira
//Data        : 15/02/2016
//Descrição   : Sistema apresenta mensagem de erro "Falta Expressão" ao excluir
//ou alterar registro no manual do histórico de benefícios
//------------------------------------------------------------------------------
//Pendência   : SOL 265023 PPM 1162062
//Responsável : Helio Lima Custódio
//Data        : 16/11/2015
//Descrição   : Não exibir mensage de data cobrança diferente do data do lote
//              quando não tiver nenhum lote selecionaodo.
//------------------------------------------------------------------------------
//Pendência   : SOL 253577/17584 PPM 994289
//Responsável : Helio Lima Custódio
//Data        : 19/08/2015
//DFM         : Mudança no MontaSelect, a coluna SB.DESCRICAO passou a ser combo
//              Restruturacao dos campos dentro do TGroupBox gbValores,
//              Modificacao do sql do TWWQuery chamado qry
//Descrição   : Mudança para incluir as regras do equacionamento.
//------------------------------------------------------------------------------
//Pendência   : SOL 259738 PPM 1020288
//Responsável : Petri Nocentini
//Data        : 18/08/2015
//Descrição   : Valor estado diverge entre a grid e o detalhe
//------------------------------------------------------------------------------
//Pendência   : SOL 256592 PPM 968566
//Responsável : Petri Nocentini
//Data        : 14/07/2015
//Descrição   : Erro ao carregar um novo assistido quando se está vendo detalhe
//              de um assistido.
//------------------------------------------------------------------------------
//Pendência   : SOL 235491 KTN 450100
//Responsável : Fernando Xavier
//Data        : 17/07/2014
//Descrição   : **ALTERAÇÃO MANUAL NÃO GRAVA MOVBENEF** .
//------------------------------------------------------------------------------
//Pendência   : SOL 200665/13992 KTN 1940550
//Responsável : Felipe A. Santos
//Data        : 05/08/2013
//Descrição   : todas as alterações do SRB, valor atual e valor total. Agora,
//              o valor antigo dos mesmos são gravados na tabela MOVBENEF para
//              serem apresentados na consulta geral de pessoa.
//------------------------------------------------------------------------------
//Pendência   : SOL 222644 Kintana 2055776
//Responsável : Thiago Melo
//Data        : 19/11/2013
//Descrição   : Erro ao alterar o valor no manual histórico de benefícios.
//--------------------------------------------------------------------------------
//Pendência   : SOL 205224/15237 KTN 2048156
//Responsável : Douglas de Siqueira
//Data        : 04/11/2013
//Descrição   : Atividade aberta para recebimento do produto do ajuste do 13º dos idosos e do manual de histórico de benefícios - atividade 15007.
//--------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//Pendência   : SOL 198386 KTN 1908656
//Responsável : Felipe Azevedo dos Santos
//Data        : 25/07/2013
//Descrição   : inclusão do campo Situação do benefício no montaselect.
//--------------------------------------------------------------------------------
//Pendência   : SOL 200697 KINTANA 1939140
//Responsável : Otacilio Aquino
//Data        : 15/02/2012
//Descrição   : Implementado o campo IDPESSOA na consulta dos alteradores, na
//              tela Cadastro Manual do Histórico de Benefícios.
//--------------------------------------------------------------------------------
//Pendência   : SOL 189693 KINTANA 1790570
//Responsável : Fernando Xavier
//Data        : 06/09/2012
//Descrição   : alteração no histórico de beneficios, pois está pedindo inclusão do
//              mes competencia INSS, sendo que o beneficio é FUNCEF.
//              O sol que gerou este erro foi o 189615
//------------------------------------------------------------------------------
//Pendência   : SOL 189615 KINTANA 1789821
//Responsável : BRUNO AZEVEDO
//Data        : 05/09/2012
//Descrição   : Ajuste na alteração dos alteradores.
//--------------------------------------------------------------------------------
//Pendência   : SOL 166441 Kintana 1448712
//Responsável : Fanuel Junior
//Descrição   : Erro na regra para permissão de exclusão
//--------------------------------------------------------------------------------
//Pendência   : SOL 162416 KINTANA 1381848
//Responsável : Aline Freire
//Data        : 08/08/2011
//Descrição   : Mudança de Layout
//              Alterado os Captions do Campo Tipo da Aba Alteradores.
//              Atraso = Crédito / Devolução = Débito
//--------------------------------------------------------------------------------
//Pendência   : SOL 162416/6201 Kintana 1399043
//Responsável : Fanuel Junior
//Descrição   : Ajuste no Cadastro Manual do Histórico de Benefícios
//--------------------------------------------------------------------------------
//Pendência   : SOL 163551 Kintana 1398227
//Responsável : Otacilio Aquino
//Descrição   : Ajustar reincindência do SOL 161976 pois o problema voltou a ocorrer.
// -----------------------------------------------------------------------------
//Pendência   : SOL 140042 Kintana 900220
//Responsável : Fernando Xavier
//Descrição   : Ajuste ma tela. erro de merge.
// -----------------------------------------------------------------------------
//Pendência   : SOL 140042 Kintana 900220
//Responsável : Fernando Xavier
//Descrição   : Reembolso INSS .
// -----------------------------------------------------------------------------
//Pendência   : SOL 161976 KINTANA 1373225
//Responsável : Fanuel Junior
//Data        : 28/07/2011
//Descrição   : Corrigido erro na alteração de registros
//--------------------------------------------------------------------------------
//Pendência   : SOL 156096 KINTANA 1222682
//Responsável : BRUNO AZEVEDO
//Data        : 08/04/2011
//Descrição   : Ajuste no controle dos botoes de inserir e alterar.
//--------------------------------------------------------------------------------
//Pendência   : SOL 154245 Kintana 1171177
//Responsável : Renato Visoni
//Descrição   : Não pode deixar "alterar\excluir" quando registros já processados.
//--------------------------------------------------------------------------------
//Pendência   : SOL 149295 KINTANA 1113571
//Responsável : BRUNO AZEVEDO
//Data        : 25/01/2011
//Descrição   : Adicionado o campo "IDPLANOORIGEM" nas querys de seleção.
//--------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Rotina      : Manual de Historico de beneficio
// Pendência   : SOL 146550 Kintana 999173
// Descricao   : Dar rollBack ao sair da tela quando existir uma transação aberta.
//------------------------------------------------------------------------------
// Autor(a)    : Ádler Souza
// Data        : 25/03/2010
// Rotina      : Manual de Historico de beneficio
// Pendência   : SOL 132937 Kintana 770225
// Descricao   : Alteração para que o campo VALOR aceite registro com casas decimais.
//------------------------------------------------------------------------------
// Autor(a)    : Jéssica Lana
// Data        : 11/02/2010
// Rotina      : Manual de Historico de beneficio
// Pendência   : SOL 130913 Kintana 738518
// Descricao   : Correção no Processo que habilita os botões de inserção alteração
// e exclusão dos registros a consulta é feita pela qryAlter.
//------------------------------------------------------------------------------
// Autor(a)    : Ádler Souza
// Data        : 26/11/2009
// Rotina      : Seleção dos Alteradores.
// Pendência   : SOL 123571 Kintana 668389
// Descricao   : Correção no Select que alimenta a Combo dos alteradores para
//               buscar só alteradores de benefício.
//------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 08/09/2009
// Rotina      : Criação de tela para cadastro de alteradores.
// Pendência   : SOL 124103 Kintana 626877
// Descricao   : Após deletar os registros da Previa, o sistema não estava
//               dando COMMIT.
//------------------------------------------------------------------------------
// Autor(a)    : Henrique Massão
// Data        : 23/03/2009
// Rotina      : Criação de tela para cadastro de alteradores.
// Pendência   : Sol: 106984 / Kintana: 479809
// Descricao   : Criação de tela para cadastro de alteradores.
//------------------------------------------------------------------------------

// Autor(a)    : Claudio Faria
// Data        : 02/08/2007
// Rotina      : -
// Pendência   : 25937
// Descricao   : Controle de Acesso para o "Valores vinculados ao Benefício"
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 07/02/2007
// Rotina      : CmeDetalheConfirma
// Pendência   : 21559
// Descricao   : Ajuste para fazer gravação do campo IdSeqInternoFB na
//   HSTBENEFBFCIARIO apenas quando na operação de Inserir.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 10/11/2006 a 13/11/2006
// Rotina      : Várias
// Pendência   : 19003
// Descricao   : Colocar o nome do usuário de inclusão do registro no grid.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 10/11/2006 a 13/11/2006
// Rotina      : Várias
// Pendência   : 21559
// Descricao   : Gravar o campo IdSeqInternoFB na inclusão de registros na HSTBENEFBFCIARIO.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 10/11/2006 a 13/11/2006
// Rotina      : Várias
// Pendência   : 22067
// Descricao   : Exibir o Flgmanual no grid.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 10/11/2006 a 13/11/2006
// Rotina      : Várias
// Pendência   : 22325
// Descricao   : Exibir o flgtiporegistro no grid e permitir a alteração em tela.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 10/11/2006 a 13/11/2006
// Rotina      : Várias
// Pendência   : 14674
// Descricao   : Adaptar para multifundação.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 21/02/2006
// Rotina      : Gravação do Histórico de Benefícios
// Pendência   : 19772
// Descricao   : Gravar no histórico de benefícios o percentual do cota do
//               pensionista no grupo familiar.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 07/02/2006
// Rotina      : Seleção do Estado do Registro
// Pendência   : 19741
// Descricao   : Permitir gravar valor do FLGENVIADO = 8 referente a
//               individualização do convênio de INSS.
//------------------------------------------------------------------------------
unit FCadHstBeneficio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls,
  Mask, wwdbedit, wwdblook, Wwdotdot, Wwdbcomb, wwdbdatetimepicker,
  CMDateTimePicker, CmEventosCadastro, ImgList, uSistema, uCMTypes, uconstfolha,
  DBGrids, TEdNum,wwstorep;

type
   TOperacao  = (Alterar, Nada, Excluir); //Fanuel Junior SOL 161976 KINTANA 1373225
  TfrmCadHstBeneficio = class(TfrmCadMestreDetalheCS)


    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    dbeMatricula: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText9: TDBText;
    grpMesAnoRef: TGroupBox;
    Label10: TLabel;
    edAnoRef: TEdit;
    edMesRef: TEdit;
    GroupBox1: TGroupBox;
    Label11: TLabel;
    edAnoCob: TEdit;
    edMesCob: TEdit;
    Label12: TLabel;
    dbedValorEsperado: TwwDBEdit;
    Label13: TLabel;
    dbedRecebido: TwwDBEdit;
    dbdtPrevisao: TCMDateTimePicker;
    dbdtRecebimento: TCMDateTimePicker;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    DBText10: TDBText;
    dbrgrpForma: TDBRadioGroup;
    Label17: TLabel;
    dblkpcmbLote: TwwDBLookupCombo;
    qryLote: TwwQuery;
    LabelBloq: TLabel;
    dbrgrpEstado: TDBRadioGroup;
    qryMotivo: TwwQuery;
    cmbMotivo: TwwDBLookupCombo;
    Label20: TLabel;
    Label21: TLabel;
    DBText5: TDBText;
    LblValorOp1: TLabel;
    dbedValorOp1: TwwDBEdit;
    LblValorOp2: TLabel;
    dbedValorOp2: TwwDBEdit;
    LblValorOp3: TLabel;
    dbedValorOp3: TwwDBEdit;
    lblValorSRBDet: TLabel;
    dbedValorSRBDet: TwwDBEdit;
    LblValorIntegral: TLabel;
    dbedValorIntegral: TwwDBEdit;
    LblValorTotal: TLabel;
    dbedValorTotal: TwwDBEdit;
    gbValores: TGroupBox;
    LblVlrInfInss: TLabel;
    dbedVlrInfInss: TwwDBEdit;
    LblValorSRB: TLabel;
    dbedValorSRB: TwwDBEdit;
    lblValorTotalVincBenef: TLabel;
    dbeValorAtual: TwwDBEdit;
    lblValorAtual: TLabel;
    dbeValorTotal: TwwDBEdit;
    dbBenefMinimo: TDBCheckBox;
    qryAux: TwwQuery;
    lblPercentual: TLabel;
    dbePercentual: TwwDBEdit;
    lblPercentualBF: TLabel;
    dbtPercentual: TDBText;
    lblTipoRegistro: TLabel;
    dbcboTipoRegistro: TwwDBComboBox;
    tbsAlteradores: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    dbgrdalt: TwwDBGrid;
    Panel1: TPanel;
    updAlt: TUpdateSQL;
    QryAlter: TwwQuery;
    dsAlter: TwwDataSource;
    edValorAlterador: TEditNum;
    rgrpTipoAlterador: TRadioGroup;
    Label23: TLabel;
    Label24: TLabel;
    qryTipoAlterador: TwwQuery;
    dscampo: TwwDataSource;
    qrycampo: TwwQuery;
    GroupBox2: TGroupBox;  // SOL 140042 Kintana 900220
    Label22: TLabel;       // SOL 140042 Kintana 900220
    edAnoComp: TEdit;      // SOL 140042 Kintana 900220
    edMesComp: TEdit;
    updAlterBenef: TUpdateSQL;
    qryAlterBenef: TwwQuery;
    wwDataSource1: TwwDataSource;
    qryAlterBenefDESCRICAO: TStringField;
    qryAlterBenefIDPLANOPREV: TFloatField;
    qryAlterBenefIDBENEFICIO: TFloatField;
    qryAlterBenefCODALTERADOR: TFloatField;
    qryAlterBenefFLGATRASO: TFloatField;
    qryAlterBenefFLGDEVOL: TFloatField;
    qryAlterBenefTRGDTINCLUSAO: TDateTimeField;
    QryAlterDESCRICAO: TStringField;
    QryAlterIDPESSJUR: TFloatField;
    QryAlterIDTITULAR: TFloatField;
    QryAlterIDPLANOPREV: TFloatField;
    QryAlterMES: TStringField;
    QryAlterIDMOTIVO: TFloatField;
    QryAlterNUMEROPROCESSO: TFloatField;
    QryAlterIDBENEFICIO: TFloatField;
    QryAlterIDPESSOA: TFloatField;
    QryAlterMESREFERENCIA: TStringField;
    QryAlterSEQPROPOSTA: TFloatField;
    QryAlterSEQBENEFICIO: TFloatField;
    QryAlterCODALTERADOR: TFloatField;
    QryAlterVALOR: TFloatField;
    QryAlterFLGTIPO: TStringField;
    QryAlterFLGRETROATIVO: TFloatField;
    QryAlterTRGDTINCLUSAO: TDateTimeField;
    QryAlterTRGUSERINCLUSAO: TStringField;
    edAlterador: TEditNum; // SOL 140042 Kintana 900220
    qryMovBenef: TwwQuery;
    updMovBenef: TUpdateSQL;
    lblValorAtualBS: TLabel;
    lblValorTotalBS: TLabel;
    dbedValorAtualBS: TwwDBEdit;
    dbedValorTotalBS: TwwDBEdit;
    lblValorAtualFab: TLabel;
    dbedValorAtualFab: TwwDBEdit;
    lblValorTotalFab: TLabel;
    dbedValorTotalFab: TwwDBEdit;
    lblBaseCalcDef: TLabel;
    dbedBaseCalcDef: TwwDBEdit;
    lblValorBS: TLabel;
    dbedValorBS: TwwDBEdit;
    dbedValorFab: TwwDBEdit;
    lblValorFab: TLabel;
    dbedBaseCalcD: TwwDBEdit;
    lblBaseCalcD: TLabel;
    qryDetVALORBS: TFloatField;
    qryDetVALORFAB: TFloatField;
    qryDetVLRBASEDEFICIT: TFloatField;
    qryNOME: TStringField;
    qryNOMEPATRO: TStringField;
    qryNOMEPLANO: TStringField;
    qryNOMEBENEFICIO: TStringField;
    qryMATRICULA: TStringField;
    qryINSCRICAONUMERO: TFloatField;
    qryIDPESSJUR: TFloatField;
    qryIDPLANOPREV: TFloatField;
    qryIDTITULAR: TFloatField;
    qryIDPESSOA: TFloatField;
    qrySEQPROPOSTA: TFloatField;
    qryIDBENEFICIO: TFloatField;
    qryDATAINICIO: TDateTimeField;
    qryDATAFINAL: TDateTimeField;
    qryULTMESPREPARO: TStringField;
    qryFLGINTERNO: TStringField;
    qryNUMEROPROCESSO: TFloatField;
    qryVALORATUAL: TFloatField;
    qryVALORTOTAL: TFloatField;
    qryIDPLANOORIGEM: TFloatField;
    qryINSCRICAODATA: TDateTimeField;
    qryIDSITPART: TFloatField;
    qryDATANASC: TDateTimeField;
    qryVALORCALCULADO: TFloatField;
    qryFLGFORMAPAGTO: TStringField;
    qryFONTEPAGADORA: TFloatField;
    qryVLRINFINSS: TFloatField;
    qryVLRCALCINSS: TFloatField;
    qryVALORSRB: TFloatField;
    qryFLGBENEFMIN: TFloatField;
    qryFLGPAGAINSSBENEF: TFloatField;
    qryFLGPAGAINSS: TFloatField;
    qryFLGREFERENCIA: TFloatField;
    qryPERCENTUAL: TFloatField;
    qrySITUACAOBENEF: TStringField;
    qryVLRBSATUAL: TFloatField;
    qryVLRBSTOTAL: TFloatField;
    qryVLRFABATUAL: TFloatField;
    qryVLRFABTOTAL: TFloatField;
    qryVLRBASEDEFICIT: TFloatField;
    qryFLGAPRESENTABSFAB: TFloatField;
    qryFLGAPRESENTADEFICIT: TFloatField;
    qryFABTITULAR: TFloatField;
    qryBSTITULAR: TFloatField;
    qryVLRTOTALTITULAR: TFloatField;
    qryPERCPENSAO: TFloatField;
    qryDetIDTITULAR: TFloatField;
    qryDetIDPESSJUR: TFloatField;
    qryDetIDPLANOPREV: TFloatField;
    qryDetIDBENEFICIO: TFloatField;
    qryDetIDMOTIVO: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetNUMEROPROCESSO: TFloatField;
    qryDetMES: TStringField;
    qryDetSEQBENEFICIO: TFloatField;
    qryDetSEQPROPOSTA: TFloatField;
    qryDetIDLOTE: TFloatField;
    qryDetVLBENEFPGTO: TFloatField;
    qryDetDATAPAGAMENTO: TDateTimeField;
    qryDetCODPORTFORMA: TFloatField;
    qryDetVALORPREV: TFloatField;
    qryDetFLGACERTODESFEITO: TFloatField;
    qryDetCODREFERENCIA: TStringField;
    qryDetFLGENVIADO: TFloatField;
    qryDetMESREFERENCIA: TStringField;
    qryDetFLGCONCESSAO: TFloatField;
    qryDetFLGDEVOLUCAO: TFloatField;
    qryDetFLGFORMAPAGTO: TStringField;
    qryDetVALORTOTAL: TFloatField;
    qryDetFONTEPAGADORA: TFloatField;
    qryDetVALORINTEGRAL: TFloatField;
    qryDetDTEFETPGTO: TDateTimeField;
    qryDetDESCRICAO: TStringField;
    qryDetVALORCALCULADO: TFloatField;
    qryDetESTADO: TStringField;
    qryDetFLGMANUAL: TFloatField;
    qryDetIDPLANOORIGEM: TFloatField;
    qryDetVALOROP1: TFloatField;
    qryDetVALOROP2: TFloatField;
    qryDetVALOROP3: TFloatField;
    qryDetVALORPREVMIN: TFloatField;
    qryDetVALORSRB: TFloatField;
    qryDetPERCENTUAL: TFloatField;
    qryDetIDSEQINTERNOFB: TFloatField;
    qryDetTRGDTINCLUSAO: TDateTimeField;
    qryDetTRGUSERINCLUSAO: TStringField;
    qryDetNOMEUSU: TStringField;
    qryDetTIPOMANUAL: TStringField;
    qryDetFLGTIPOREGISTRO: TFloatField;
    qryDetTIPOREGISTRO: TStringField;
    qryDetALIMRESERVA: TStringField;
    qryDetMESCOMPREEM: TStringField;
    qryDetBSTITULAR: TFloatField;
    qryDetFABTITULAR: TFloatField;
    qryDetPERC_PENSAO: TFloatField;
    qryCODPORTFORMA: TFloatField;
    qryJustificativaExclusao: TwwQuery;
    updJustificativaExclusao: TUpdateSQL;
    qryJustificativaExclusaoIDPESSJUR: TFloatField;
    qryJustificativaExclusaoIDPLANOPREV: TFloatField;
    qryJustificativaExclusaoIDPLANOORIGEM: TFloatField;
    qryJustificativaExclusaoIDTITULAR: TFloatField;
    qryJustificativaExclusaoIDPESSOA: TFloatField;
    qryJustificativaExclusaoSEQPROPOSTA: TFloatField;
    qryJustificativaExclusaoIDBENEFICIO: TFloatField;
    qryJustificativaExclusaoNUMEROPROCESSO: TFloatField;
    qryJustificativaExclusaoMES: TStringField;
    qryJustificativaExclusaoIDMOTIVO: TFloatField;
    qryJustificativaExclusaoSEQBENEFICIO: TFloatField;
    qryJustificativaExclusaoMESREFERENCIA: TStringField;
    qryJustificativaExclusaoJUSTIFICATIVAEXCLUSAO: TMemoField;
    sbtnExcluiDetEnv: TToolbarButton97;
    gpInfoTitular: TGroupBox;
    lblVlrTitFab: TLabel;
    dbedlVlrTitFab: TwwDBEdit;
    lblVlrTitBs: TLabel;
    dbedlVlrTitBs: TwwDBEdit;
    lblVlrTitTotal: TLabel;
    dbedlVlrTitTotal: TwwDBEdit;
    lblPercPensao: TLabel;
    dbedPercPensao: TwwDBEdit;
    function PodeAlterar : Boolean;  //Fanuel Junior SOL 161976 KINTANA 1373225
    function PermiteAlterar():boolean; //Fanuel Junior SOL 161976 KINTANA 1373225
    procedure qryDetBeforePost(DataSet: TDataSet);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure bbtnCancelarDetClick(Sender: TObject);
    procedure bbtnVoltarDetClick(Sender: TObject);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure qryDetAfterInsert(DataSet: TDataSet);
    procedure edMesRefExit(Sender: TObject);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);                                                
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CampoAlterado(Sender: TObject);
    procedure CmeDetalheInsert(Sender: TObject);
    procedure CmeDetalheDelete(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbcDetalheChange(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure QryAlterBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qryAfterScroll(DataSet: TDataSet);  // SOL 140042 Kintana 900220
    procedure FormDestroy(Sender: TObject);     // SOL 140042 Kintana 900220
    procedure dbgrdDetDblClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure rgrpTipoAlteradorClick(Sender: TObject);
    procedure pgctrlDetalheChange(Sender: TObject);
    procedure MontaSelectBeforeOpenCds(var sqlText: String;
      strListParams: TStringList); // SOL 163551 Kintana 1398227
    procedure RemoveDuplicates(var stringList : TStringList) ;
    procedure qryDetBeforeDelete(DataSet: TDataSet);
    procedure dblkpcmbLoteCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure edAnoRefExit(Sender: TObject);
    procedure edMesCobExit(Sender: TObject);
    procedure edMesCompExit(Sender: TObject);
    procedure edAnoRefKeyPress(Sender: TObject; var Key: Char);
    procedure edMesRefKeyPress(Sender: TObject; var Key: Char);
    procedure edAnoCobKeyPress(Sender: TObject; var Key: Char);
    procedure edMesCobKeyPress(Sender: TObject; var Key: Char);
    procedure edAnoCompKeyPress(Sender: TObject; var Key: Char);
    procedure edMesCompKeyPress(Sender: TObject; var Key: Char);

   // procedure pgctrlDetalheChange(Sender: TObject);
  private
    { Private declarations }
    sldbgrdDet: TStringList; // SOL 140042 Kintana 900220
    bPensao   : boolean;     //edilaine WO18367

    procedure BuscaData;
    Procedure EnabButtons(St:Boolean);
    Procedure AtribEdits(St:Boolean);
    procedure ApagaPrevia;
    procedure IdentificaValoresEstado;
    procedure AplicarCorrecaoDeDatas; // Thiago Melo SOL 222644 Ktn 2055776
    function AlteroValor : boolean; // Felipe A. Santos SOL 200665/13992 KTN 1940550

    //Inicio - Helio - SOL Nº 253577/17584 PPM Nº 994289
    procedure ReorganizaGbValores;
    procedure MostraValoresFabBsGbValores;
    procedure MostraValoresFabBs;
    procedure MostraValoresDeficit;
    procedure OcultaValoresFabBsGbValores;
    function VerificaPreenchimentoCadastro:Boolean;
    procedure GravaJustificativaExclusao(sObservacao: string); //Denis Horongoso - SIG 27748
    
    //Fim - Helio - SOL Nº 253577/17584 PPM Nº 994289

    procedure ApagaPrevia_Procedure; // Andre Imakawa - SIG 99346
  public
    { Public declarations }
    lsmeses: string;
    lslotes: string;
    lsidpessoa: string;
    lslotesB: string;
    Fidpessoa: TStringList;
    Fidlote: TStringList;
    FidlotexPessoaNaoPago: TStringList; //SOL 271052 PPM 1351891
    lsmesini, lsloteini: string;
    lbalteroucampo: boolean;
    cOperacaoAlterador   : char;
    bPodeAlterar : boolean; //Fanuel Junior SOL 161976 KINTANA 1373225
    bJustificaExclusao: Boolean; //Denis Horongoso - SIG 27748
  end;

var
  frmCadHstBeneficio: TfrmCadHstBeneficio;
  Operacao : TOperacao; //Fanuel Junior SOL 161976 KINTANA 1373225

implementation

uses uAdmPrevFB, UMensErro, UDataBase, DAPrev, UContribuicaoPrevFB, DBaseDados,
     UModulo, UFuncoesFolha,
     fObservacao, //Denis Horongoso - SIG 27748
     uVerificaPreenchimento; //Helio - SOL Nº 253577/17584 PPM Nº 994289

{$R *.DFM}

Procedure TfrmCadHstBeneficio.EnabButtons(St:Boolean);
begin
  BbtnCancelar.Enabled:=St;
  BbtnSair.Enabled:=St;
  BbtnConfirmar.Enabled:=St;
  sbtnInsDet.enabled:=st;
  sbtnAltDet.enabled:=st;
  sbtnExcluiDet.enabled:=st;

  dbgrdDet.Enabled := St;
end;

Procedure TfrmCadHstBeneficio.AtribEdits(St:Boolean);
begin
  DbEdRecebido.ReadOnlY      :=St;
  EdAnoRef.ReadOnly          :=St;
  EdMesRef.ReadOnly          :=St;
  EdAnoCob.ReadOnlY          :=St;
  EdMesCob.ReadOnlY          :=St;
  edAnoComp.ReadOnlY         :=St; //SOL 140042 Kintana 900220
  edAnoComp.ReadOnlY         :=St; //SOL 140042 Kintana 900220
  DbrGrpForma.ReadOnlY       :=St;
  DbrGrpEstado.ReadOnlY      :=St;
  dbedValorEsperado.ReadOnlY :=St;
  DbLkPcmbLote.ReadOnlY      :=St;
  DbLkPcmbLote.Enabled       :=Not(St); //BRUNO AZEVEDO SOL 156096 KINTANA 1222682
  cmbMotivo.Enabled          :=Not(St); //BRUNO AZEVEDO SOL 156096 KINTANA 1222682
  DbDtPrevisao.ReadOnlY      :=St;
  cmbMotivo.ReadOnlY         :=St;
  DbDtRecebimento.ReadOnlY   :=St;
  dbedValorOp1.ReadOnlY      :=St;
  dbedValorOp2.ReadOnly      :=St; 
  dbedValorOp3.ReadOnly      :=St; 
  //PERMITE ALTERAR VALORSRB DA BENEFBFCIARIO
  dbedValorSRBDet.ReadOnlY   :=St;
  dbedValorIntegral.ReadOnlY :=St;
  dbedValorTotal.ReadOnlY    :=St;
  LabelBloq.Visible          :=St;
  //SÓ HABILITA SE ESTIVER EM MODO DE ALTERAÇÃO
  //NAO PERMITIR EXCLUSAO DE BENEFICIOS PAGOS
  //sbtnExcluiDet.enabled:=(qry.state = dsEdit) and not st;
  dbcboTipoRegistro.ReadOnlY := St;
  dbePercentual.ReadOnlY     := St;

  if QryDet.Active then begin
    //BRUNO AZEVEDO SOL 156096 KINTANA 1222682
    //Renato Visoni SOL 154245 Kintana 1171177
    //sbtnAltDet.Enabled    := not ((pgctrlDetalhe.ActivePage = tbsDet) and (QryDet.FieldbyName('FLGENVIADO').AsInteger = 1));
    if (CmeCadastro.Operacao in [opInserir,opAlterar]) then begin
      sbtnExcluiDet.Enabled := not ((pgctrlDetalhe.ActivePage = tbsDet) and (QryDet.FieldbyName('FLGENVIADO').AsInteger = 1));
    end else begin
      sbtnExcluiDet.Enabled := False;
    end;
    //Renato Visoni SOL 154245 Kintana 1171177
  end;
  
end;

procedure TfrmCadHstBeneficio.CmeCadastroFind(Sender: TObject);
Var
  sUserInclusao : String;
  iUserInclusao : Integer;
begin
  if (MontaSelect.ValoresChave.Count > 0) and
     (MontaSelect.ValoresChave[0] <> '') then
  begin

  //Petri SOL 256592 PPM 968566
  //código equivalente a clicar no botão Cancelar a direita
  CmeDetalhe.Cancel(Self);
  EnabButtons(True);
  AtribEdits(DbEdRecebido.Text<>'');
 if  (((qryDet.FieldByName('Estado').AsString =  'Processado')  or  (qryDet.FieldByName('Estado').AsString =  'A Processar')) and ((Operacao = Alterar) or (Operacao = Excluir)))  then  begin
     bPodeAlterar := PermiteAlterar();
     bJustificaExclusao := (not bPodeAlterar) and sbtnExcluiDetEnv.Enabled; //Denis Horongoso - SIG 27748
     sbtnExcluiDet.Enabled := bPodeAlterar or sbtnExcluiDetEnv.Enabled;     //Denis Horongoso - SIG 27748
     sbtnAltDet.Enabled    := bPodeAlterar;
  end;
  //Petri SOL 256592 PPM 968566 fim

    qry.Close;
    qry.ParamByName('IdPessJur').Value     := StrToInt(MontaSelect.ValoresChave[0]);
    qry.ParamByName('IdPlanoPrev').Value   := StrToInt(MontaSelect.ValoresChave[1]);
    qry.ParamByName('IdTitular').Value     := StrToInt(MontaSelect.ValoresChave[2]);
    qry.ParamByName('IdPessoa').Value      := StrToInt(MontaSelect.ValoresChave[3]);
    qry.ParamByName('SeqProposta').Value   := StrToInt(MontaSelect.ValoresChave[4]);
    qry.ParamByName('IdBeneficio').Value   := StrToInt(MontaSelect.ValoresChave[5]);
    qry.ParamByName('NumeroProcesso').Value:= StrToInt(MontaSelect.ValoresChave[6]);
    qry.ParamByName('IdPlanoOrigem').Value := StrToInt(MontaSelect.ValoresChave[7]); //BRUNO AZEVEDO SOL 149295 KINTANA 1113571
    qry.Open;

    qryDet.Close;
    qryDet.ParamByName('IdPessJur').Value     := StrToInt(MontaSelect.ValoresChave[0]);
    qryDet.ParamByName('IdPlanoPrev').Value   := StrToInt(MontaSelect.ValoresChave[1]);
    qryDet.ParamByName('IdTitular').Value     := StrToInt(MontaSelect.ValoresChave[2]);
    qryDet.ParamByName('IdPessoa').Value      := StrToInt(MontaSelect.ValoresChave[3]);
    qryDet.ParamByName('SeqProposta').Value   := StrToInt(MontaSelect.ValoresChave[4]);
    qryDet.ParamByName('IdBeneficio').Value   := StrToInt(MontaSelect.ValoresChave[5]);
    qryDet.ParamByName('NumeroProcesso').Value:= StrToInt(MontaSelect.ValoresChave[6]);
    qryDet.ParamByName('IdPlanoOrigem').Value := StrToInt(MontaSelect.ValoresChave[7]); //BRUNO AZEVEDO SOL 149295 KINTANA 1113571
    qryDet.Open;

    //Denis Horongoso - SIG 27748 - Inicio
    qryJustificativaExclusao.Close;
    qryJustificativaExclusao.ParamByName('IdPessJur').AsInteger      := StrToInt(MontaSelect.ValoresChave[0]);
    qryJustificativaExclusao.ParamByName('IdPlanoPrev').AsInteger    := StrToInt(MontaSelect.ValoresChave[1]);
    qryJustificativaExclusao.ParamByName('IdTitular').AsInteger      := StrToInt(MontaSelect.ValoresChave[2]);
    qryJustificativaExclusao.ParamByName('IdPessoa').AsInteger       := StrToInt(MontaSelect.ValoresChave[3]);
    qryJustificativaExclusao.ParamByName('SeqProposta').AsInteger    := StrToInt(MontaSelect.ValoresChave[4]);
    qryJustificativaExclusao.ParamByName('IdBeneficio').AsInteger    := StrToInt(MontaSelect.ValoresChave[5]);
    qryJustificativaExclusao.ParamByName('NumeroProcesso').AsInteger := StrToInt(MontaSelect.ValoresChave[6]);
    qryJustificativaExclusao.ParamByName('IdPlanoOrigem').AsInteger  := StrToInt(MontaSelect.ValoresChave[7]);
    qryJustificativaExclusao.Open;
    //Denis Horongoso - SIG 27748 - Fim

    with qryAlter do begin
      close;
      paramByname('IDPESSJUR').asstring := qryDet.fieldbyname('IDPESSJUR').asstring ;
      paramByname('IDTITULAR').asstring := qryDet.fieldbyname('IDTITULAR').asstring ;
      // SOL 200697 KTN 1939140 Otacilio
      ParamByName('IDPESSOA').Asstring  := qryDet.fieldbyname('IDPESSOA').asstring ;
      open;
    end;

    // Felipe A. Santos SOL 200665/13992 KTN 1940550

    qryMovBenef.Close;
    qryMovBenef.Open;

    // Felipe A. Santos SOL 200665/13992 KTN 1940550 - fim


    qryDet.DisableControls;
    While Not qryDet.Eof Do
    Begin
      sUserInclusao := copy(qrydet.FieldByName('TRGUSERINCLUSAO').AsString, 3, Length(qrydet.FieldByName('TRGUSERINCLUSAO').AsString));
      iUserInclusao := StrToIntDef(sUserInclusao, 0);
      If iUserInclusao = 0 Then
      Begin
        qryDet.Edit;
        qryDet.FieldByName('NOMEUSU').AsString := qrydet.FieldByName('TRGUSERINCLUSAO').AsString;
        qryDet.Post;
      End
      Else
      Begin
        qryAux.Close;
        qryAux.Sql.Clear;
        qryAux.Sql.Add('SELECT NOME FROM PESSOA WHERE IDPESSOA = '+IntToStr(iUserInclusao));
        qryAux.Open;

        qryDet.Edit;
        qryDet.FieldByName('NOMEUSU').AsString := qryAux.FieldByName('NOME').AsString;
        qryDet.Post;
      End;
      qryDet.Next;
    End;
    qryDet.EnableControls;
    qryDet.first;

    //EXIBIR PERCENTUAL NO HISTORICO
    lblPercentualBF.visible:=
      qry.fieldbyname('IdTitular').asfloat <>
      qry.fieldbyname('IdPessoa').asfloat;
    dbtPercentual.visible:=
      qry.fieldbyname('IdTitular').asfloat <>
      qry.fieldbyname('IdPessoa').asfloat;
    lblPercentual.visible:=
      qryDet.fieldbyname('IdTitular').asfloat <>
      qryDet.fieldbyname('IdPessoa').asfloat;
    dbePercentual.visible:=
      qryDet.fieldbyname('IdTitular').asfloat <>
      qryDet.fieldbyname('IdPessoa').asfloat;
    qryDet.fieldbyname('PERCENTUAL').visible:=
      qryDet.fieldbyname('IdTitular').asfloat <>
      qryDet.fieldbyname('IdPessoa').asfloat;

    //edilaine WO18367 : inicio
    bPensao := (qry.FieldByName('PERCPENSAO').AsInteger <> 0) and (qry.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1);
    qryDet.fieldbyname('BSTITULAR').visible   := bPensao;
    qryDet.fieldbyname('FABTITULAR').visible  := bPensao;
    qryDet.fieldbyname('PERC_PENSAO').visible := bPensao;
    //edilaine WO18367 : fim

    ReorganizaGbValores;//Helio - SOL Nº 253577/17584 PPM Nº 994289

  end;
end;

procedure TfrmCadHstBeneficio.CmeDetalheEdit(Sender: TObject);
begin
  inherited;
  edAnoRef.Text := Copy(qryDet.FieldByName('MesReferencia').AsString,1,4);
  edMesRef.Text := Copy(qryDet.FieldByName('MesReferencia').AsString,6,2);
  edAnoCob.Text := Copy(qryDet.FieldByName('Mes').AsString,1,4);
  edMesCob.Text := Copy(qryDet.FieldByName('Mes').AsString,6,2);
  edAnoComp.Text := Copy(qryDet.FieldByName('MESCOMPREEM').AsString,1,4);
  edMesComp.Text := Copy(qryDet.FieldByName('MESCOMPREEM').AsString,6,2);

  edAlterador.ReadOnly := false; // xavier
  edAlterador.Text     := qrytipoalterador.fieldbyname('DESCRICAO').asString;
  edAlterador.ReadOnly := true; // xavier
  edValorAlterador.text:= qryalter.fieldbyname('VALOR').asString;
  if qryalter.fieldbyname('FLGTIPO').Asstring = 'A' then
  rgrpTipoAlterador.itemindex:= 0 else
  rgrpTipoAlterador.itemindex:= 1;


  lsmesini:=qryDet.FieldByName('Mes').AsString;
  if not qryDet.FieldByName('idlote').isnull then
    lsloteini:=qryDet.FieldByName('idlote').AsString
  else
    lsloteini:='';
  lbalteroucampo:=false;

  IdentificaValoresEstado;

  if not qryDet.FieldByName('idpessoa').isnull then
       begin
//       lsidpessoa:= lsidpessoa + qryDet.FieldByName('idpessoa').AsString+',';
       Fidpessoa.Add(qryDet.FieldByName('idpessoa').AsString);
       Fidlote.Add( qryDet.FieldByName('idlote').AsString);
       if not(DbEdRecebido.Text<>'') then //SOL 271052 PPM 1351891
          FidlotexPessoaNaoPago.Add( qryDet.FieldByName('idlote').AsString);
       end; //SOL 271052 PPM 1351891

 // if qrydet.state in [dsinsert, dsedit] then
  //  qrydet.post;

 // if qryAlter.state in [dsinsert, dsedit] then
  //  qryAlter.post;


end; // CmeDetalhe.Edit(Self)

procedure TfrmCadHstBeneficio.CmeCadastroConfirma(Sender: TObject);
var
   RecordAfterFilter : integer;
   dt : TDateTime;
begin
   if qry.State = dsEdit then
   begin
     Modulo.GravaLogTOTALPREV('Alt.Manual Benef.-'+
       ' VAtual:'+formatfloat('#0.00', qry.fieldbyname('VALORATUAL').asfloat)+'|'+
       ' VTotal:'+formatfloat('#0.00', qry.fieldbyname('VALORTOTAL').asfloat)+'|'+
       ' Inscr:'+qry.FieldByName('INSCRICAONUMERO').AsString+'|'+
       ' NPROC:'+qry.fieldbyname('NUMEROPROCESSO').asstring+'|'+
       ' PLANO:'+qry.fieldbyname('IDPLANOPREV').asstring+'|'+
       ' IDBEN:'+qry.fieldbyname('IDBENEFICIO').asstring+'|'+
       ' IDTIT:'+qry.fieldbyname('IDTITULAR').asstring+'|'+
       ' IDPES:'+qry.fieldbyname('IDPESSOA').asstring);

       // Felipe A. Santos SOL 200665/13992 KTN 1940550
       if (AlteroValor) then
       begin
            qryMovBenef.Insert;
            qryMovBenef.FieldByName('IDTITULAR').AsInteger := qry.FieldByName('IDTITULAR').AsInteger;
            qryMovBenef.FieldByName('IDPESSOA').AsInteger := qry.FieldByName('IDPESSOA').AsInteger;
            qryMovBenef.FieldByName('IDPESSJUR').AsInteger := qry.FieldByName('IDPESSJUR').AsInteger;
            qryMovBenef.FieldByName('IDPLANOPREV').AsInteger := qry.FieldByName('IDPLANOPREV').AsInteger;
            qryMovBenef.FieldByName('IDBENEFICIO').AsInteger := qry.FieldByName('IDBENEFICIO').AsInteger;
            qryMovBenef.FieldByName('IDPLANOORIGEM').AsInteger := qry.FieldByName('IDPLANOORIGEM').AsInteger;
            qryMovBenef.FieldByName('NUMEROPROCESSO').AsInteger := qry.FieldByName('NUMEROPROCESSO').AsInteger;
            qryMovBenef.FieldByName('SEQPROPOSTA').AsInteger := qry.FieldByName('SEQPROPOSTA').AsInteger;
            qryMovBenef.FieldByName('DATAMOV').AsString := FormatDateTime('dd/mm/yyyy', Date);
            qryMovBenef.FieldByName('TIPOMOV').AsInteger := 17;

            if (qry.FieldByName('VALORSRB').OldValue = null) then
                qryMovBenef.FieldByName('VALORSRBANT').AsFloat := 0
            else
                qryMovBenef.FieldByName('VALORSRBANT').AsFloat := qry.FieldByName('VALORSRB').OldValue;
            if (qry.FieldByName('VALORATUAL').OldValue = null) then
                qryMovBenef.FieldByName('VALORATUALANT').AsFloat := 0
            else
                qryMovBenef.FieldByName('VALORATUALANT').AsFloat := qry.FieldByName('VALORATUAL').OldValue;
            if (qry.FieldByName('VALORTOTAL').OldValue = null) then
                qryMovBenef.FieldByName('VALORTOTALANT').AsFloat := 0
            else
                qryMovBenef.FieldByName('VALORTOTALANT').AsFloat := qry.FieldByName('VALORTOTAL').OldValue;

            //Início - William Santana - SOL 200665/13992  KTN 1940550
            qryMovBenef.FieldByName('VALORTOTAL').AsFloat := qry.FieldByName('VALORTOTAL').AsFloat;
            qryMovBenef.FieldByName('VALORATUAL').AsFloat := qry.FieldByName('VALORATUAL').AsFloat;
            qryMovBenef.FieldByName('VALORSRB').AsFloat   := qry.FieldByName('VALORSRB').AsFloat;
            //Término - William Santana - SOL 200665/13992  KTN 1940550

            //Inicio - Helio - SOL Nº 253577/17584 PPM Nº 994289
            if qry.FieldByName('VLRBSATUAL').OldValue <> null then
                qryMovBenef.FieldByName('VLRBSATUALANT').AsFloat := qry.FieldByName('VLRBSATUAL').OldValue;

            if qry.FieldByName('VLRBSTOTAL').OldValue <> null then
                qryMovBenef.FieldByName('VLRBSTOTALANT').AsFloat := qry.FieldByName('VLRBSTOTAL').OldValue;

            if qry.FieldByName('VLRFABATUAL').OldValue <> null then
                qryMovBenef.FieldByName('VLRFABATUALANT').AsFloat := qry.FieldByName('VLRFABATUAL').OldValue;

            if qry.FieldByName('VLRFABTOTAL').OldValue <> null then
                qryMovBenef.FieldByName('VLRFABTOTALANT').Value := qry.FieldByName('VLRFABTOTAL').OldValue;

            qryMovBenef.FieldByName('VLRBSATUALNOVO').AsFloat  := qry.FieldByName('VLRBSATUAL').AsFloat;
            qryMovBenef.FieldByName('VLRBSTOTALNOVO').AsFloat  := qry.FieldByName('VLRBSTOTAL').AsFloat;
            qryMovBenef.FieldByName('VLRFABATUALNOVO').AsFloat := qry.FieldByName('VLRFABATUAL').AsFloat;
            qryMovBenef.FieldByName('VLRFABTOTALNOVO').AsFloat := qry.FieldByName('VLRFABTOTAL').AsFloat;
            //Fim - Helio - SOL Nº 253577/17584 PPM Nº 994289

            qryMovBenef.ApplyUpdates;
       end;
       // Felipe A. Santos SOL 200665/13992 KTN 1940550 - fim

   end;
   inherited;
   try

     qryJustificativaExclusao.Filter   := '';    //Denis Horongoso - SIG 27748
     qryJustificativaExclusao.Filtered := False; //Denis Horongoso - SIG 27748

     QryAlter.Filter   := '';
     QryAlter.Filtered := False;

     //Fanuel Junior SOL162416/6201 Kintana 1399043
     AplicaAlteracoes([qryJustificativaExclusao,qryDet,qryAlter]); //Denis Horongoso - SIG 27748
     //AplicaAlteracoes([qryAlterBenef]);

     AplicarCorrecaoDeDatas; // Thiago Melo SOL 222644 Ktn 2055776

      With qryAlter do
        begin
           Filter :=    ' ( IDPLANOPREV='+ quotedstr(IntToStr(QryDet.FieldbyName('IDPLANOPREV').AsInteger))+
                        ' AND '+
                        ' MES='+ quotedstr(QryDet.FieldbyName('MES').AsString)+
                        ' AND '+
                        ' IDMOTIVO='+ quotedstr(IntToStr(QryDet.FieldbyName('IDMOTIVO').AsInteger))+
                        ' AND '+
                        ' NUMEROPROCESSO=' +quotedstr(IntToStr(QryDet.FieldbyName('NUMEROPROCESSO').AsInteger))+
                        ' AND' +
                        ' IDBENEFICIO=' +quotedstr(IntToStr(QryDet.FieldbyName('IDBENEFICIO').AsInteger))+
                        ' AND' +
                        ' MESREFERENCIA=' +quotedstr(QryDet.FieldbyName('MESREFERENCIA').AsString)+
                        ' AND' +
                        ' SEQPROPOSTA=' +quotedstr(IntToStr(QryDet.FieldbyName('SEQPROPOSTA').AsInteger))+
                        ' AND' +
                        ' SEQBENEFICIO=' +quotedstr(IntToStr(QryDet.FieldbyName('SEQBENEFICIO').AsInteger))+
                        ' ) ';

          Qryalter.Filtered := True;
        end;
     if (lsmeses <> '') or (lslotes <> '') then
       //ApagaPrevia;         // Andre Imakawa - SIG 99346
       ApagaPrevia_Procedure; // Andre Imakawa - SIG 99346
   except
     raise;
   end;

   //Renato Visoni SOL 124103 Kintana 626877
   if not dtmBaseDados.dbBaseDados.InTransaction then  dtmBaseDados.dbBaseDados.StartTransaction;
     dtmBaseDados.dbBaseDados.Commit;
   //Renato Visoni SOL 124103 Kintana 626877
   Operacao := Nada;
end; // CmeCadastro.Confirma(Self)

procedure TfrmCadHstBeneficio.CmeDetalheConfirma(Sender: TObject);
var
  sTipo, sMsgErro : string;
  iPlnCodigo : LongInt;
  RecordAfterFilter : Integer;
  //Fanuel Junior SOL162416/6201 Kintana 1399043
  sFlgDevol,sFlgAtraso,
  sIdBeneficio, sCodAlterador,
  sIdPlanoPrev : String;
begin
  if pgctrlDetalhe.activepage = tbsdet then begin
    if dbdtPrevisao.Text = '' then
    begin
      dbdtPrevisao.setfocus;
      MsgDlg('Data prevista deve ser preenchida.', 'Informação', mtInformation, [mbOK], 0);
      Exit;
    end;

    {
    if qryDet.Fieldbyname('IDMOTIVO').isnull then
    begin
      cmbMotivo.setfocus;
      MsgDlg('Motivo deve ser preenchido.', 'Informação', mtInformation, [mbOK], 0);
      Exit;
    end;
    }

    if qryDet.State = dsInsert then
    begin
      Modulo.GravaLogTOTALPREV('Incl.Manual Hist.Benef-'+
        ' MRef:'+qryDet.fieldbyname('MESREFERENCIA').asstring+'|'+
        ' MPag:'+qryDet.fieldbyname('MES').asstring+'|'+
        ' Mot:'+qryDet.fieldbyname('IDMOTIVO').asstring+'|'+
        ' Val:'+formatfloat('#0.00', qryDet.fieldbyname('VALORPREV').asfloat)+'|'+
        ' Forma:'+qryDet.fieldbyname('FLGDEVOLUCAO').asstring+'|'+
        ' Est.:'+qryDet.fieldbyname('FLGENVIADO').asstring+'|'+
        ' Inscr:'+qry.FieldByName('INSCRICAONUMERO').AsString+'|'+
        ' NPROC:'+qryDet.fieldbyname('NUMEROPROCESSO').asstring+'|'+
        ' PLANO:'+qryDet.fieldbyname('IDPLANOPREV').asstring+'|'+
        ' IDBEN:'+qryDet.fieldbyname('IDBENEFICIO').asstring+'|'+
        ' IDTIT:'+qryDet.fieldbyname('IDTITULAR').asstring+'|'+
        ' IDPES:'+qryDet.fieldbyname('IDPESSOA').asstring);
    end;
    if qryDet.State = dsEdit then
    begin
      Modulo.GravaLogTOTALPREV('Alt.Manual Hist.Benef-'+
        ' MRef:'+qryDet.fieldbyname('MESREFERENCIA').asstring+'|'+
        ' MPag:'+qryDet.fieldbyname('MES').asstring+'|'+
        ' Mot:'+qryDet.fieldbyname('IDMOTIVO').asstring+'|'+
        ' Val:'+formatfloat('#0.00', qryDet.fieldbyname('VALORPREV').asfloat)+'|'+
        ' Forma:'+qryDet.fieldbyname('FLGDEVOLUCAO').asstring+'|'+
        ' Est.:'+qryDet.fieldbyname('FLGENVIADO').asstring+'|'+
        ' Inscr:'+qry.FieldByName('INSCRICAONUMERO').AsString+'|'+
        ' NPROC:'+qryDet.fieldbyname('NUMEROPROCESSO').asstring+'|'+
        ' PLANO:'+qryDet.fieldbyname('IDPLANOPREV').asstring+'|'+
        ' IDBEN:'+qryDet.fieldbyname('IDBENEFICIO').asstring+'|'+
        ' IDTIT:'+qryDet.fieldbyname('IDTITULAR').asstring+'|'+
        ' IDPES:'+qryDet.fieldbyname('IDPESSOA').asstring);
    end;


    if lbalteroucampo then
    begin
      if (CmeDetalhe.Operacao in [opInserir,opAlterar]) then
      begin
        if lsmesini <> '' then
          lsmeses:=lsmeses+quotedstr(lsmesini)+',';
        if lsloteini <> '' then
          lslotes:=lslotes+lsloteini+',';
        if (lsmesini <> qryDet.FieldByName('Mes').AsString) and
           (qryDet.FieldByName('Mes').AsString <> '') then
          lsmeses:=lsmeses+quotedstr(qryDet.FieldByName('Mes').AsString)+',';
        if lsloteini <> qryDet.FieldByName('idlote').AsString then
          if not qryDet.FieldByName('idlote').isnull then
            lslotes:=lslotes+qryDet.FieldByName('idlote').AsString+',';
        lsmesini:='';
        lsloteini:='';
        lbalteroucampo:=false;
      end;
    end;

    if (CmeDetalhe.Operacao = opInserir) then
      if qryDet.FieldByName('IDSEQINTERNOFB').isnull then
      begin
        qryDet.FieldByName('IDSEQINTERNOFB').asinteger := LeUltRegistro(nil, 'SEQINTERNOFB');
      end;
  end else if pgctrlDetalhe.activepage = tbsAlteradores then begin
    if (CmeDetalhe.Operacao = opInserir) or (CmeDetalhe.Operacao = opAlterar) then begin
      if Trim(edAlterador.Text) = ''then
        begin
          MsgDlg('Tipo de alterador não Preenchido.','Erro',mtError,[mbOk, mbHelp],0);
          Exit;
      end;

      if Trim(edValorAlterador.Text) = ''
      then begin
         MsgDlg('Preencha o valor do alterador.','Erro',mtError,[mbOk, mbHelp],0);
         edValorAlterador.setfocus;
         Exit;
      end;
      if (CmeDetalhe.Operacao = opInserir) and (QryAlter.State <> dsInsert) then QryAlter.Insert;
      if (CmeDetalhe.Operacao = opAlterar) and (QryAlter.State <> dsEdit)   then QryAlter.Edit ;


    end;
  end;

  inherited;

    //Fanuel Junior SOL162416/6201 Kintana 1399043 - Inicio
    sIdBeneficio  := qryAlter.fieldbyname('IDBENEFICIO').AsString;
    sCodAlterador := qryAlter.FieldByname('CodAlterador').AsString;
    sIdPlanoPrev  := qryAlter.fieldbyname('IDPLANOPREV').AsString;

    if rgrpTipoAlterador.ItemIndex = 0 then begin
       sFlgDevol  := '0';
       sFlgAtraso := '1';
    end
    else
    begin
       sFlgDevol  := '1';                                       
       sFlgAtraso := '0';
    end;

    if pgctrlDetalhe.ActivePage = tbsAlteradores then begin

       //if qryAlter.State = dsInsert then begin
          qryAlterBenef.Close;
          qryAlterBenef.ParamByName('IDPLANOPREV').AsString  := sIdPlanoPrev;
          qryAlterBenef.ParamByName('CodAlterador').AsString := sCodAlterador;
          qryAlterBenef.ParamByName('IDBENEFICIO').AsString  := sIdBeneficio;
          qryAlterBenef.Open;
      // end;
          qryAlterBenef.First;
          qryAlterBenef.Edit;
          qryAlterBenef.FieldByName('FLGDEVOL').AsString  := sFlgDevol;
          qryAlterBenef.FieldByName('FLGATRASO').AsString := sFlgAtraso;
          qryAlterBenef.Post;
          //qryAlterBenef.ApplyUpdates;
   end;
    //Fanuel Junior SOL162416/6201 Kintana 1399043 - Fim


  EnabButtons(True);
{  if pgctrlDetalhe.activepage = tbsAlteradores then
      qryalter.filtered:=true;
      RecordAfterFilter := Qryalter.RecordCount;
      if RecordAfterFilter >=1 then begin
      sbtnExcluiDet.enabled:=true;
      end; }
      bbtnVoltarDet.click;
end;

procedure TfrmCadHstBeneficio.qryDetBeforePost(DataSet: TDataSet);
 var sAnoAux, sMesAux, sDataFolha : string;
begin
  inherited;
  //SÓ EXECUTAR ROTINA SE OBJETO ESTIVER EM MODO DE EDIÇÃO OU INSERÇÃO
  if pgctrlDetalhe.ActivePage=tbsdet then begin
  if (CmeDetalhe.Operacao in [opInserir,opAlterar]) then
  begin
    sAnoAux     := edAnoRef.Text;
    sMesAux     := edMesRef.Text;
    qryDet.FieldByName('MesReferencia').AsString   := Trim(edAnoRef.Text)+'/'+Trim(edMesRef.Text);
    qryDet.FieldByName('Mes').AsString             := Trim(edAnoCob.Text)+'/'+Trim(edMesCob.Text);
    if qry.Fieldbyname('FONTEPAGADORA').asInteger = 2 then  //SIG53469
    begin
       qryDet.FieldByName('MESCOMPREEM').AsString     := Trim(edAnoComp.Text)+'/'+Trim(edMesComp.Text); //SOL 140042 Kintana 900220 //SIG53469
    end  //SIG53469
    else  //SIG53469
    begin
       qryDet.FieldByName('MESCOMPREEM').AsString     := '';
    end;  //SIG53469
    if qryDet.State = dsInsert then
    begin
      qryDet.FieldByName('IDTITULAR').AsInteger      := qry.FieldByName('IDTITULAR').AsInteger;
      qryDet.FieldByName('IdPessJur').AsInteger      := qry.FieldByName('IdPessJur').AsInteger;
      qryDet.FieldByName('IdPlanoPrev').AsInteger    := qry.FieldByName('IdPlanoPrev').AsInteger;
      qryDet.FieldByName('IdPessoa').AsInteger       := qry.FieldByName('IdPessoa').AsInteger;
      qryDet.FieldByName('IdBeneficio').AsInteger    := qry.FieldByName('IdBeneficio').AsInteger;
      qryDet.FieldByName('SeqProposta').AsInteger    := qry.FieldByName('SeqProposta').AsInteger;
      qryDet.FieldByName('NUMEROPROCESSO').AsInteger := qry.FieldByName('NUMEROPROCESSO').AsInteger;
      //INCREMENTAR O SEQBENEFICIO A PARTIR DO BANCO
      try
        qryAux.close;
        qryAux.sql.Clear;
        qryAux.sql.Add(
          'SELECT NVL(MAX(SEQBENEFICIO),0)+1 AS IDSEQ '+
          'FROM HSTBENEFBFCIARIO '+
          'WHERE IDPLANOPREV  = '+inttostr(qry.FieldByName('IDPLANOPREV').AsInteger)+' '+
          'AND IDPLANOORIGEM  = '+inttostr(qry.FieldByName('IDPLANOORIGEM').AsInteger)+' '+
          'AND IDPESSJUR      = '+inttostr(qry.FieldByName('IDPESSJUR').AsInteger)+' '+
          'AND IDBENEFICIO    = '+inttostr(qry.FieldByName('IDBENEFICIO').AsInteger)+' '+
          'AND NUMEROPROCESSO = '+inttostr(qry.FieldByName('NUMEROPROCESSO').AsInteger)+' '+
          'AND MES            = '+quotedstr(qryDet.FieldByName('Mes').AsString)+' '+
          'AND MESREFERENCIA  = '+quotedstr(qryDet.FieldByName('MesReferencia').AsString)+' '+
          'AND IDMOTIVO       = '+inttostr(qryDet.FieldByName('IDMOTIVO').AsInteger)+' '+
          'AND IDTITULAR      = '+inttostr(qry.FieldByName('IDTITULAR').AsInteger)+' '+
          'AND IDPESSOA       = '+inttostr(qry.FieldByName('IDPESSOA').AsInteger)+' '+
          'AND SEQPROPOSTA    = '+inttostr(qry.FieldByName('SEQPROPOSTA').AsInteger)+' '
          );
        qryAux.open;
        qryDet.FieldByName('SEQBENEFICIO').AsInteger := qryAux.fieldbyname('IDSEQ').asinteger;
      except
        qryDet.FieldByName('SEQBENEFICIO').AsInteger := 1;
      end;

      qryDet.FieldByName('FLGACERTODESFEITO').AsInteger := 0;

      qryDet.FieldByName('FLGCONCESSAO').AsInteger := 0;
      qryDet.FieldByName('FLGMANUAL').AsInteger := 1;
      qryDet.FieldByName('TIPOMANUAL').asstring := 'Inclusão Manual';
      //PEGA IDPLANOORIGEM DA BENEFBFCIARIO
      qryDet.FieldByName('IDPLANOORIGEM').AsInteger := qry.FieldByName('IDPLANOORIGEM').AsInteger;
    end
    else
      //DEIXAR FLGMANUAL = 1 NA ALTERAÇÃO DE UM REGISTRO JÁ INSERIDO MANUALMENTE
      if qryDet.FieldByName('FLGMANUAL').AsInteger = 0 then
      begin
        qryDet.FieldByName('FLGMANUAL').AsInteger := 2;
        qryDet.FieldByName('TIPOMANUAL').asstring := 'Alteração Manual';
      end;
    qryDet.FieldByname('DATAPAGAMENTO').asDateTime := dbdtPrevisao.DateTime;
    qryDet.Fieldbyname('VALORCALCULADO').asFloat   := qry.Fieldbyname('VALORCALCULADO').asFloat;
    qryDet.Fieldbyname('FLGFORMAPAGTO').asstring   := qry.Fieldbyname('FLGFORMAPAGTO').asstring;
    qryDet.Fieldbyname('FONTEPAGADORA').asInteger  := qry.Fieldbyname('FONTEPAGADORA').asInteger;
    //PERMITIR A ALTERAÇÃO DO VALORTOTAL
    if qryDet.Fieldbyname('VALORTOTAL').isnull then
      qryDet.Fieldbyname('VALORTOTAL').asFloat:=qry.Fieldbyname('VALORTOTAL').asFloat;
    //PERMITIR A ALTERAÇÃO DO VALORINTEGRAL
    if qryDet.Fieldbyname('VALORINTEGRAL').isnull then
      qryDet.Fieldbyname('VALORINTEGRAL').asFloat:=qry.Fieldbyname('VALORTOTAL').asFloat;
    if qryDet.Fieldbyname('VALORSRB').isnull then
      qryDet.Fieldbyname('VALORSRB').asFloat:=qry.Fieldbyname('VALORSRB').asFloat;
    qryDet.Fieldbyname('DESCRICAO').asstring       := cmbMotivo.text;
    qryDet.Fieldbyname('ESTADO').asstring          := dbrgrpEstado.items[dbrgrpEstado.itemindex];
    if (qryDet.Fieldbyname('FLGTIPOREGISTRO').asinteger = 0) then
      qryDet.Fieldbyname('TIPOREGISTRO').asstring := 'Normal';
    if (qryDet.Fieldbyname('FLGTIPOREGISTRO').asinteger = 1) then
      qryDet.Fieldbyname('TIPOREGISTRO').asstring := 'Abono';
    if (qryDet.Fieldbyname('FLGTIPOREGISTRO').asinteger = 2) then
      qryDet.Fieldbyname('TIPOREGISTRO').asstring := 'Antecipação de abono';
    if (qryDet.Fieldbyname('FLGTIPOREGISTRO').asinteger = 3) then
      qryDet.Fieldbyname('TIPOREGISTRO').asstring := 'Revisão Normal';
    if (qryDet.Fieldbyname('FLGTIPOREGISTRO').asinteger = 4) then
      qryDet.Fieldbyname('TIPOREGISTRO').asstring := 'Abono revisão';
    if (qryDet.Fieldbyname('FLGTIPOREGISTRO').asinteger = 5) then
      qryDet.Fieldbyname('TIPOREGISTRO').asstring := 'Antecipação de abono revisão';
    end;
  end;
end;

procedure TfrmCadHstBeneficio.FormShow(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.ParamByName('IdPessJur').Value     := 0;
  qry.ParamByName('IdPlanoPrev').Value   := 0;
  qry.ParamByName('IdTitular').Value     := 0;
  qry.ParamByName('IdPessoa').Value      := 0;
  qry.ParamByName('SeqProposta').Value   := 0;
  qry.ParamByName('IdBeneficio').Value   := 0;
  qry.ParamByName('NumeroProcesso').Value:= 0;
  qry.Open;

  qryDet.Close;
  qryDet.ParamByName('IdPessJur').Value     := 0;
  qryDet.ParamByName('IdPlanoPrev').Value   := 0;
  qryDet.ParamByName('IdTitular').Value     := 0;
  qryDet.ParamByName('IdPessoa').Value      := 0;
  qryDet.ParamByName('SeqProposta').Value   := 0;
  qryDet.ParamByName('IdBeneficio').Value   := 0;
  qryDet.ParamByName('NumeroProcesso').Value:= 0;
  qryDet.Open;

  //Denis Horongoso - SIG 27748 - Inicio
  qryJustificativaExclusao.Close;
  qryJustificativaExclusao.ParamByName('IdPessJur').AsInteger      := 0;
  qryJustificativaExclusao.ParamByName('IdPlanoPrev').AsInteger    := 0;
  qryJustificativaExclusao.ParamByName('IdTitular').AsInteger      := 0;
  qryJustificativaExclusao.ParamByName('IdPessoa').AsInteger       := 0;
  qryJustificativaExclusao.ParamByName('SeqProposta').AsInteger    := 0;
  qryJustificativaExclusao.ParamByName('IdBeneficio').AsInteger    := 0;
  qryJustificativaExclusao.ParamByName('NumeroProcesso').AsInteger := 0;
  qryJustificativaExclusao.Open;
  //Denis Horongoso - SIG 27748 - Fim

  qryLote.Close;
  qryLote.Open;

  qryMotivo.close;
  qryMotivo.sql.clear;
  qryMotivo.sql.Add('SELECT IDMOTIVO, DESCRICAO FROM MOTIVO ORDER BY UPPER(DESCRICAO)');
  qryMotivo.open;

  OcultaValoresFabBsGbValores; //Helio - SOL Nº 253577/17584 PPM Nº 994289
end;

procedure TfrmCadHstBeneficio.qryDetAfterScroll(DataSet: TDataSet);
begin

  inherited;
  AtribEdits(DbEdRecebido.Text<>'');
  //Fanuel Junior SOL 161976 KINTANA 1373225
  if  (((qryDet.FieldByName('Estado').AsString =  'Processado')  or  (qryDet.FieldByName('Estado').AsString =  'A Processar')) and ((Operacao = Alterar) or (Operacao = Excluir)))  then  begin
     bPodeAlterar := PermiteAlterar();
     bJustificaExclusao := (not bPodeAlterar) and sbtnExcluiDetEnv.Enabled; //Denis Horongoso - SIG 27748
     sbtnExcluiDet.Enabled := bPodeAlterar or sbtnExcluiDetEnv.Enabled;     //Denis Horongoso - SIG 27748
     sbtnAltDet.Enabled    := bPodeAlterar;
  end;

  Qryalter.Filtered := False;
  With qryAlter do
  begin
     Filter :=    ' ( IDPLANOPREV='+ quotedstr(IntToStr(QryDet.FieldbyName('IDPLANOPREV').AsInteger))+
                  ' AND '+
                  ' MES='+ quotedstr(QryDet.FieldbyName('MES').AsString)+
                  ' AND '+
                  ' IDMOTIVO='+ quotedstr(IntToStr(QryDet.FieldbyName('IDMOTIVO').AsInteger))+
                  ' AND '+
                  ' NUMEROPROCESSO=' +quotedstr(IntToStr(QryDet.FieldbyName('NUMEROPROCESSO').AsInteger))+
                  ' AND' +
                  ' IDBENEFICIO=' +quotedstr(IntToStr(QryDet.FieldbyName('IDBENEFICIO').AsInteger))+
                  ' AND' +
                  ' MESREFERENCIA=' +quotedstr(QryDet.FieldbyName('MESREFERENCIA').AsString)+
                  ' AND' +
                  ' SEQPROPOSTA=' +quotedstr(IntToStr(QryDet.FieldbyName('SEQPROPOSTA').AsInteger))+
                  ' AND' +
                  ' SEQBENEFICIO=' +quotedstr(IntToStr(QryDet.FieldbyName('SEQBENEFICIO').AsInteger))+
                  ' ) ';

    Qryalter.Filtered := True;
  end;


end;

procedure TfrmCadHstBeneficio.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  AtribEdits(False);
  EnabButtons(False);
  edAlterador.ReadOnly := false; // xavier
  edAlterador.text:='';
  edAlterador.ReadOnly := true; // xavier
  edValorAlterador.text:='';
  //dblkpcmbTipoAlterador.DataSource := dsTipo;
  rgrpTipoAlterador.onClick(Sender);
end;

procedure TfrmCadHstBeneficio.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  AtribEdits(False);
  EnabButtons(False);

 If not(bPodeAlterar) then
    If DbEdRecebido.Text<>'' then AtribEdits(True);

  //Fanuel Junior SOL162416/6201 Kintana 1399043
  edAlterador.ReadOnly := false; // xavier
  edAlterador.text :=  qryAlter.FieldByName('DESCRICAO').AsString;
  edAlterador.ReadOnly := true; // xavier

end;


//Fanuel Junior SOL161976 Kintana1373225
function TfrmCadHstBeneficio.PermiteAlterar(): boolean;
var
qryLoteAberto : TwwQuery;
begin

   Result := false;

   if qryDet.FieldByName('ESTADO').AsString = 'A Processar' then
      begin
         AtribEdits(False);
         Result := true;
      end
   else
      AtribEdits(True);


if trim(qryDet.FieldByName('IDLOTE').AsString) = '' then ///DODS - SOL 269070 PPM 1285933
      begin
      AtribEdits(False);
      Result := true;
      end
else
   if (qryDet.FieldByName('ESTADO').AsString = 'Processado') then    ///DODS - SOL 269070 PPM 1285933
      begin

         qryLoteAberto := TwwQuery.Create(nil);
         qryLoteAberto.DataBaseName := 'BaseDados';
         qryLoteAberto.Close;
         qryLoteAberto.SQL.Clear;
         qryLoteAberto.SQL.Add(' SELECT IDLOTE, FLGIDATMP, DATAIDATMP, DESCRICAO, FLGCONCESSAO  '+#13+
                               ' FROM CTRLINTERFACE WHERE IDLOTE = '+qryDet.FieldByName('IDLOTE').AsString);
         qryLoteAberto.Open;

         if qryLoteAberto.FieldByName('FLGIDATMP').AsInteger <> 1 then
            begin
               AtribEdits(False);
               Result := true;
            end
         else
               AtribEdits(True);
         FreeAndNil(qryLoteAberto);

      end;

end;
//Fanuel Junior SOL161976 Kintana1373225



procedure TfrmCadHstBeneficio.sbtnAlterarClick(Sender: TObject);
begin
  inherited;
  //Fanuel Junior SOL 161976 KINTANA 1373225
  Operacao := Alterar;
  AtribEdits(DbEdRecebido.Text<>'');
  if  (((qryDet.FieldByName('Estado').AsString =  'Processado')  or  (qryDet.FieldByName('Estado').AsString =  'A Processar')) and ((Operacao = Alterar) or (Operacao = Excluir)))  then  begin
     bPodeAlterar := PermiteAlterar();
     bJustificaExclusao := (not bPodeAlterar) and sbtnExcluiDetEnv.Enabled; //Denis Horongoso - SIG 27748
     sbtnExcluiDet.Enabled := bPodeAlterar or sbtnExcluiDetEnv.Enabled;     //Denis Horongoso - SIG 27748
     sbtnAltDet.Enabled    := bPodeAlterar;
  end;

end;

procedure TfrmCadHstBeneficio.bbtnCancelarDetClick(Sender: TObject);
begin
  inherited;
  EnabButtons(True);
  AtribEdits(DbEdRecebido.Text<>'');
  //Fanuel Junior SOL 161976 KINTANA 1373225
 if  (((qryDet.FieldByName('Estado').AsString =  'Processado')  or  (qryDet.FieldByName('Estado').AsString =  'A Processar')) and ((Operacao = Alterar) or (Operacao = Excluir)))  then  begin
     bPodeAlterar := PermiteAlterar();
     bJustificaExclusao := (not bPodeAlterar) and sbtnExcluiDetEnv.Enabled; //Denis Horongoso - SIG 27748
     sbtnExcluiDet.Enabled := bPodeAlterar or sbtnExcluiDetEnv.Enabled;     //Denis Horongoso - SIG 27748
     sbtnAltDet.Enabled    := bPodeAlterar;
  end;
end;

procedure TfrmCadHstBeneficio.bbtnVoltarDetClick(Sender: TObject);
begin
   With qryAlter do
        begin
           Filter :=    ' ( IDPLANOPREV='+ quotedstr(IntToStr(QryDet.FieldbyName('IDPLANOPREV').AsInteger))+
                        ' AND '+
                        ' MES='+ quotedstr(QryDet.FieldbyName('MES').AsString)+
                        ' AND '+
                        ' IDMOTIVO='+ quotedstr(IntToStr(QryDet.FieldbyName('IDMOTIVO').AsInteger))+
                        ' AND '+
                        ' NUMEROPROCESSO=' +quotedstr(IntToStr(QryDet.FieldbyName('NUMEROPROCESSO').AsInteger))+
                        ' AND' +
                        ' IDBENEFICIO=' +quotedstr(IntToStr(QryDet.FieldbyName('IDBENEFICIO').AsInteger))+
                        ' AND' +
                        ' MESREFERENCIA=' +quotedstr(QryDet.FieldbyName('MESREFERENCIA').AsString)+
                        ' AND' +
                        ' SEQPROPOSTA=' +quotedstr(IntToStr(QryDet.FieldbyName('SEQPROPOSTA').AsInteger))+
                        ' AND' +
                        ' SEQBENEFICIO=' +quotedstr(IntToStr(QryDet.FieldbyName('SEQBENEFICIO').AsInteger))+
                        ' ) ';

          Qryalter.Filtered := True;




        end;

inherited;

  //Jéssica Lana SOL 130913 11/02/2010
  //If QryAlter.RecordCount=0 then begin
    //sbtnAltDet.enabled:=false;
    //sbtnExcluiDet.enabled:=false;
  //end else begin
    EnabButtons(True);
  //end;

    //Fanuel Junior SOL 161976 KINTANA 1373225
    AtribEdits(DbEdRecebido.Text<>'');
     if  (((qryDet.FieldByName('Estado').AsString =  'Processado')  or  (qryDet.FieldByName('Estado').AsString =  'A Processar')) and ((Operacao = Alterar) or (Operacao = Excluir)))  then  begin
        bPodeAlterar := PermiteAlterar();
        bJustificaExclusao := (not bPodeAlterar) and sbtnExcluiDetEnv.Enabled; //Denis Horongoso - SIG 27748
        sbtnExcluiDet.Enabled := bPodeAlterar or sbtnExcluiDetEnv.Enabled;     //Denis Horongoso - SIG 27748
        sbtnAltDet.Enabled    := bPodeAlterar;
     end;

end;

procedure TfrmCadHstBeneficio.bbtnOkDetClick(Sender: TObject);
var
  sTipo, sMsgErro : string;
  iPlnCodigo : LongInt;
  //Inicio - Helio - SOL Nº 253577/17584 PPM Nº 994289
  obrigaBSFab : Boolean;
  obrigaDeficit : Boolean;
  //Fim - Helio - SOL Nº 253577/17584 PPM Nº 994289
begin

  //SIG51403 Inicio
  // Validação do campo ano mes referencia, onde o mes deve estar entre 1 e 13
  // e o ano deve ser um ano valido de 4 digitos maior que 1900.

  if trim(edAnoRef.Text) <> '' then
  begin
     try
        StrToIntDef(edAnoRef.Text,0);
     except
        Showmessage ('Ano referência invalido.');
        exit;
     end;

     if (StrToIntDef(edAnoRef.Text,0) < 1900) then
     begin
        Showmessage ('Ano referência invalido, o valor deve ser superior a 1900.');
        exit;
     end;

  end
  else
  begin
     Showmessage ('O ano referência é obrigatório.');
     exit;
  end;

  if trim(edMesRef.Text) <> '' then
  begin

     try
        StrToIntDef(edMesRef.Text,0);
     except
        Showmessage ('Mês referência invalido.');
        exit;
     end;

     if not((StrToIntDef(edMesRef.Text,0) >= 1) and (StrToIntDef(edMesRef.Text,0) <= 13)) then
     begin
        Showmessage ('Mês referência invalido, o valor deve estar entre 1 e 13.');
        exit;
     end;
  end
  else
  begin
     Showmessage ('O mês referência é obrigatório.');
     exit;
  end;

  // Validação do campo ano mes cobrança, onde o mes deve estar entre 1 e 12
  // e o ano deve ser um ano valido de 4 digitos maior que 1900.
  if trim(edAnoCob.Text) <> '' then
  begin
     try
        StrToIntDef(edAnoCob.Text,0);
     except
        Showmessage ('Ano cobrança invalido.');
        exit;
     end;

     if (StrToIntDef(edAnoCob.Text,0) < 1900) then
     begin
        Showmessage ('Ano cobrança invalido, o valor deve ser superior a 1900.');
        exit;
     end;
  end
  else
  begin
     Showmessage ('O ano cobrança é obrigatório.');
     exit;
  end;

  if trim(edMesCob.Text) <> '' then
  begin
     try
        StrToIntDef(edMesCob.Text,0);
     except
        Showmessage ('Mês cobrança invalido.');
        exit;
     end;

     if not((StrToIntDef(edMesCob.Text,0) >= 1) and (StrToIntDef(edMesCob.Text,0) <= 12)) then
     begin
        Showmessage ('Mês cobrança invalido, o valor deve estar entre 1 e 12.');
        exit;
     end;

  end
  else
  begin
     Showmessage ('O mês cobrança é obrigatório.');
     exit;
  end;


  // Validação do campo ano mes Reembolso, onde o mes deve estar entre 1 e 12
  // e o ano deve ser um ano valido de 4 digitos maior que 1900.

  if qry.Fieldbyname('FONTEPAGADORA').asInteger = 2 then // Andre Imakawa - SIG 127721
    if trim(edAnoComp.Text) <> '' then
    begin

        try
           StrToIntDef(edAnoComp.Text,0);
        except
           Showmessage ('Ano reembolso invalido.');
           exit;
        end;

        if (StrToIntDef(edAnoComp.Text,0) < 1900) then
        begin
           Showmessage ('Ano reembolso invalido, o valor deve ser superior a 1900.');
           exit;
        end;

    end;

  if qry.Fieldbyname('FONTEPAGADORA').asInteger = 2 then // Andre Imakawa - SIG 127721
    if trim(edAnoComp.Text) <> '' then
    begin
       try
          StrToIntDef(edMesComp.Text,0);
       except
          Showmessage ('Mês reembolso invalido.');
          exit;
       end;

       if not((StrToIntDef(edMesComp.Text,0) >= 1) and (StrToIntDef(edMesComp.Text,0) <= 12)) then
       begin
          Showmessage ('Mês reembolso invalido, o valor deve estar entre 1 e 12.');
          exit;
       end;
    end;

  if trim(cmbMotivo.Text) = '' then
  begin
     Showmessage ('O Motivo é obrigatório.');
     exit;
     
  end;
  //SIG51403 Fim



  //BRUNO AZEVEDO SOL 189615 KINTANA 1789821
  if (pgctrlDetalhe.ActivePage = tbsDet) then
  if GroupBox2.Visible then  // SOL 189693 KINTANA 1790570
  begin //BRUNO AZEVEDO SOL 189615 KINTANA 1789821
    if (Trim(edAnoComp.Text) = emptystr) or (Trim(edMesComp.Text) = emptystr ) then
    begin
       if qry.Fieldbyname('FONTEPAGADORA').asInteger = 2 then  //SIG53469
       begin
          Showmessage ('Mês e Ano de Competência de Reembolso do INSS deve ser preenchido.');
          qryDet.FieldByName('MESCOMPREEM').AsString     := '';
          exit;
       end; //SIG53469
    end;
  end;

  //SIG51403 inicio
  if trim(cmbMotivo.Text) = '' then
  begin
     Showmessage ('O Motivo é obrigatório.');
     exit;
     
  end;
  //SIG51403 Fim

  //Inicio - Helio - SOL Nº 253577/17584 PPM Nº 994289 - RN008

  obrigaBSFab   := (qry.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1);
  obrigaDeficit := (qry.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 1);

  
  if (dbedValorBS.Visible) and
     (obrigaBSFab) then
  if (Trim(qryDetVALORBS.AsString) = '') or
     (qryDetVALORBS.AsFloat = 0) then
  begin
       Showmessage ('É necessário informar o Valor do BS.');
       dbedValorBS.SetFocus;
       exit;
  end;

  if (dbedValorFab.Visible) and
     (obrigaBSFab) then
  if (Trim(qryDetVALORFAB.AsString) = '') then
  begin
       Showmessage ('É necessário informar o Valor do FAB.');
       dbedValorFab.SetFocus;
       exit;
  end;

  if (dbedBaseCalcD.Visible) and
     (obrigaDeficit) then
  if (Trim(qryDetVLRBASEDEFICIT.AsString) = '') or
     (qryDetVLRBASEDEFICIT.AsFloat = 0) then
  begin
       Showmessage ('É necessário informar o Valor da Base de Cálculo do Déficit.');
       dbedBaseCalcD.SetFocus;
       exit;
  end;
  //Fim - Helio - SOL Nº 253577/17584 PPM Nº 994289
  
  inherited;
  AtribEdits(DbEdRecebido.Text<>'');
  //PodeAlterar;
  //Fanuel Junior SOL 161976 KINTANA 1373225
   if  (((qryDet.FieldByName('Estado').AsString =  'Processado')  or  (qryDet.FieldByName('Estado').AsString =  'A Processar')) and ((Operacao = Alterar) or (Operacao = Excluir)))  then  begin
     bPodeAlterar := PermiteAlterar();
     bJustificaExclusao := (not bPodeAlterar) and sbtnExcluiDetEnv.Enabled; //Denis Horongoso - SIG 27748
     sbtnExcluiDet.Enabled := bPodeAlterar or sbtnExcluiDetEnv.Enabled;     //Denis Horongoso - SIG 27748
     sbtnAltDet.Enabled    := bPodeAlterar;
  end;

  if not qryDet.FieldByName('idlote').isnull then
     lslotesB:=lslotesB+qryDet.FieldByName('idlote').AsString+',';


  if not qryDet.FieldByName('idpessoa').isnull then
       begin
       Fidpessoa.Add(qryDet.FieldByName('idpessoa').AsString);
       Fidlote.Add( qryDet.FieldByName('idlote').AsString);
       if not(DbEdRecebido.Text<>'') then //SOL 271052 PPM 1351891
          FidlotexPessoaNaoPago.Add( qryDet.FieldByName('idlote').AsString);

       end; //SOL 271052 PPM 1351891


end;

procedure TfrmCadHstBeneficio.qryDetAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qryDet.fieldbyname('FLGDEVOLUCAO').asinteger:=0;
  qryDet.fieldbyname('FLGENVIADO').asinteger:=0;
  if qry.fieldbyname('CODPORTFORMA').asinteger <> 0 then // Andre Imakawa - SIG 31884
    qryDet.fieldbyname('CODPORTFORMA').asinteger:= qry.fieldbyname('CODPORTFORMA').asinteger; //SIG29359
  BuscaData;
end;

procedure TfrmCadHstBeneficio.edMesRefExit(Sender: TObject);
begin
  if trim(edMesRef.Text) <> '' then
  begin

     try
        StrToIntDef(edMesRef.Text,0);
     except
        Showmessage ('Mês referência invalido.');
        exit;
     end;

     if not((StrToIntDef(edMesRef.Text,0) >= 1) and (StrToIntDef(edMesRef.Text,0) <= 13)) then
     begin
        Showmessage ('Mês referência invalido, o valor deve estar entre 1 e 13.');
        exit;
     end;

     edMesRef.Text := LeftPadCh(edMesRef.Text,'0',2);
  end;
  inherited;
  BuscaData;
end;

procedure TfrmCadHstBeneficio.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
  var
  query2:TwwQuery;
  SP1:TwwStoredProc;
  i:Integer;
  bExibeMsgPrevia: Boolean; //Denis Horongoso - SIG 27748
begin
  //Denis Horongoso - SIG 27748 - Inicio
  bExibeMsgPrevia := True;

  if sbtnExcluiDetEnv.Enabled and (Fidpessoa.Count = 0) then
     bExibeMsgPrevia := False;

//  if  (VerificaPreenchimentoCadastro) And //Helio - SOL Nº 253577/17584 PPM Nº 994289
//      (MessageDlg('Foram realizadas alterações em registros de histórico de benefício. '+#13#10+
//       'A Prévia existente para os meses e lotes relacionados serão eliminadas e '+#13#10+
//       'devem ser reprocessadas individualmente para estas pessoas. '+#13#10+'Confirma ?',
//       mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  if VerificaPreenchimentoCadastro then
     if bExibeMsgPrevia then
        if MessageDlg('Foram realizadas alterações em registros de histórico de benefício. '+#13#10+
           'A Prévia existente para os meses e lotes relacionados serão eliminadas e '+#13#10+
           'devem ser reprocessadas individualmente para estas pessoas. '+#13#10+'Confirma ?',
           mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
           if not dtmBaseDados.dbBaseDados.InTransaction then
              dtmBaseDados.dbBaseDados.StartTransaction;

           if Fidpessoa.Count > 0 then
           begin // Thiago Melo SOL 222644 Ktn 2055776
              RemoveDuplicates(Fidpessoa);
              RemoveDuplicates(Fidlote);
              RemoveDuplicates(FidlotexPessoaNaoPago); //SOL 271052 PPM 1351891

          //    lslotesB:= lslotes;
              query2:=TwwQuery.Create(Application);
              query2.DataBaseName := 'BaseDados';


              delete(lslotesB,length(lslotesB),1);
              {query2.Close;
              query2.SQL.Clear;

              // Marcelo Cardoso - INICIO - SOL271052 PPM1351891
              query2.SQL.Add('DELETE ');
              query2.SQL.Add('  FROM HSTBITRIBUTACAO');
              query2.SQL.Add(' WHERE IDPESSOA IN( '+Fidpessoa.CommaText+' )');
          //  query2.SQL.Add(' WHERE IDPESSOA IN( '+qryDet.FieldByName('idpessoa').AsString+' )');
              query2.SQL.Add('    AND OPERACAO =''S''');
              query2.SQL.Add('   AND IDLOTE IN ( '+Fidlote.CommaText+' ) ');}

              if trim(FidlotexPessoaNaoPago.CommaText) <> '' then //SOL 271052 PPM 1351891
              begin
                 query2.Close;
                 query2.SQL.Clear;
                 query2.SQL.Add('DELETE' );
                 query2.SQL.Add('  FROM HSTBITRIBUTACAO HST' );
                 query2.SQL.Add(' WHERE HST.IDPESSOA IN ( '+Fidpessoa.CommaText+' )' );
                 query2.SQL.Add('   AND HST.OPERACAO = ''S''');
                 query2.SQL.Add('   AND HST.IDLOTE IN ( '+FidlotexPessoaNaoPago.CommaText+' )');
                 query2.SQL.Add('   AND NOT EXISTS (SELECT 1' );  //André Imakawa - SOL 271052 - PPM 1351891
                 query2.SQL.Add('          FROM LOTEXHSTFOLHABENEF LH' );
                 query2.SQL.Add('         INNER JOIN HSTFOLHABENEF H' );
                 query2.SQL.Add('            ON (H.IDHSTFOLHABENEF = LH.IDHSTFOLHABENEF)' );
                 query2.SQL.Add('         WHERE LH.IDLOTE = HST.IDLOTE' );
                 query2.SQL.Add('           AND H.FLGESTADO = 1)');

                 // Marcelo Cardoso - FIM - SOL271052 PPM1351891

                 try
                   query2.ExecSQL;
                 except
                 end;
                 query2.Close;

                 query2.Close;
                 query2.SQL.Clear;
                 query2.SQL.Add('DELETE ');
                 query2.SQL.Add('  FROM HSTDEDIDADEBITRIB');
                 query2.SQL.Add(' WHERE IDPESSOA IN( '+Fidpessoa.CommaText+' )');
             //    query2.SQL.Add(' WHERE IDPESSOA IN( '+qryDet.FieldByName('idpessoa').AsString+' )');
                 query2.SQL.Add('   AND IDLOTE IN ( '+FidlotexPessoaNaoPago.CommaText+' ) ');
                 try
             //                                   CMDebugToFile('FolhaNormalPrevia ExecSQL no DELETE HSTBITRIBUTACAO  ','C:\Planus\Temp\Travamento.txt') ;
                   query2.ExecSQL;
                 except
             //                                         CMDebugToFile('FolhaNormalPrevia Erro no DELETE HSTBITRIBUTACAO  ','C:\Planus\Temp\Travamento.txt') ;
                 end;



                 for i := 0 to Fidpessoa.Count-1 do
                 begin
                   SP1 := TwwStoredProc.Create(Application);
                   SP1.DataBaseName := 'BaseDados';
                   SP1.StoredProcName:='CM.SP_FB_ATUALIZAHSTBI';
                   SP1.Params.CreateParam(ftFloat,    'VIDPESSOA',           ptInput);
                   SP1.ParamByName('VIDPESSOA').asfloat := strtofloat(Fidpessoa[i]);
             //        SP1.ParamByName('VIDPESSOA').asfloat := strtofloat(qryDet.FieldByName('idpessoa').AsString);
                   try
                   SP1.Prepare;
                   SP1.ExecProc;
                   except
                   end;
                 end;
                 SP1.close;
                 SP1.Destroy;
             end; //SOL 271052 PPM 1351891
             query2.Close;
             query2.Destroy;
           end; // Thiago Melo SOL 222644 Ktn 2055776
///
           if not Sistema.GravaLogOperacoes('Cadastro Manual de Benefícios.') then
              Raise Exception.Create('Não foi possível gravar o log.')
           else
              dtmBaseDados.dbBaseDados.Commit;
        accept:=true;
        end
        else
           Accept := False
     else
        Accept := True
  //Denis Horongoso - SIG 27748 - Fim
  else
    accept:=false;
  lslotesB:='';
  Inherited;
end;

procedure TfrmCadHstBeneficio.ApagaPrevia;
var ssql: string;
begin
  if (lsmeses <> '') or (lslotes <> '') then
  begin
    try
      if lsmeses <> '' then
        delete(lsmeses,length(lsmeses),1);
      if lslotes <> '' then
        delete(lslotes,length(lslotes),1);

      // Andre Imakawa - SIG 84221 - Inicio
      if lslotes <> '' then
      begin
          sSQL := ' UPDATE CM.HSTPRAZOACUMULACAOFOLHA HST                                 ' +_clinefeed
                + ' SET FLGPROCESSADO = 1                                                 ' +_clinefeed
                + ' WHERE FLGPROCESSADO = 2                                               ' +_clinefeed
                + ' AND IDHSTFOLHABENEF IS NULL                                           ' +_clinefeed
                + ' AND IDTITULAR = ' +inttostr(qry.fieldbyname('IDTITULAR').asinteger)     +_clinefeed
                + ' AND EXISTS (SELECT 1                                                  ' +_clinefeed
                + '         FROM PREVIA P                                                 ' +_clinefeed
                + '        WHERE P.IDPESSOA = HST.IDPESSOA                                ' +_clinefeed
                + '          AND P.IDTITULAR = HST.IDTITULAR                              ' +_clinefeed
                + '          AND P.IDPLANOPREV = HST.IDPLANOPREV                          ' +_clinefeed
                + '          AND P.IDLOTE IN (' + lslotes + ')                            ' +_clinefeed
                + '          AND EXISTS(  SELECT 1                                        ' +_clinefeed
                + '                 FROM PARTPREVPLAN PART                                ' +_clinefeed
                + '                WHERE PART.IDPESSOA    = P.IDTITULAR                   ' +_clinefeed
                + '                  AND PART.IDPESSJUR   = P.IDPATRO                     ' +_clinefeed
                + '                  AND PART.IDPLANOPREV = P.IDPLANOPREV                 ' +_clinefeed
                + '                  AND PART.TIPOOPCAOIR = 2)                            ' +_clinefeed
                + '          AND EXISTS(  SELECT 1                                        ' +_clinefeed
                + '                 FROM CM.CTRLINTERFACE C                               ' +_clinefeed
                + '                WHERE C.IDLOTE = P.IDLOTE                              ' +_clinefeed
                + '                  AND (NVL(C.FLGRESGATE, 0) = 1) OR                    ' +_clinefeed
                + '                      (NVL(C.FLGRESGATEPARCELADO,0) = 1 )))            ' +_clinefeed ;

        qryAux.close;
        qryAux.sql.Clear;
        qryAux.sql.Add(ssql);
        qryAux.execSql;


      // Andre Imakawa - SIG 84221 - Inicio

      // Andre Imakawa - SIG 65680 - Inicio
      ssql:=
        ' DELETE FROM CM.LOG_EXCLUSAO_PREVIA B' +_clinefeed+
        '         WHERE B.IDTITULAR = ' +inttostr(qry.fieldbyname('IDTITULAR').asinteger)+' '+_clinefeed+
        '           AND B.IDLOTE in (' + lslotes  +')' +_clinefeed+    //RAFAEL SIG 92075          
        '           AND B.MESCOBRANCA IN ('+lsmeses+') '+_clinefeed+
        // Andre Imakawa - SIG 97671 - Inicio
        '           AND EXISTS (SELECT 1 '+_clinefeed+
        '            FROM CTRLINTERFACE C '+_clinefeed+
        '            WHERE C.IDLOTE = B.IDLOTE '+_clinefeed+
        '            AND C.FLGVOLTATMP = 0) '+_clinefeed;
        // Andre Imakawa - SIG 97671 - Fim
        qryAux.close;
        qryAux.sql.Clear;
        qryAux.sql.Add(ssql);
        qryAux.execSql;

      ssql:=
        ' DELETE FROM CM.LOG_ALT_PREVIA B' +_clinefeed+
        '         WHERE B.IDTITULAR = ' +inttostr(qry.fieldbyname('IDTITULAR').asinteger)+' '+_clinefeed+
        '           AND B.IDLOTE in (' + lslotes  +')' +_clinefeed+    //RAFAEL SIG 92075          
        '           AND B.MESCOBRANCA IN ('+lsmeses+') '+_clinefeed+
        // Andre Imakawa - SIG 97671 - Inicio
        '           AND EXISTS (SELECT 1 '+_clinefeed+
        '            FROM CTRLINTERFACE C '+_clinefeed+
        '            WHERE C.IDLOTE = B.IDLOTE '+_clinefeed+
        '            AND C.FLGVOLTATMP = 0) '+_clinefeed;
        // Andre Imakawa - SIG 97671 - Fim

        qryAux.close;
        qryAux.sql.Clear;
        qryAux.sql.Add(ssql);
        qryAux.execSql;

      ssql:='DELETE FROM CM.OBS_PREVIA_BASEPGTO OBA '+_clinefeed+
            ' WHERE EXISTS (SELECT 1 FROM CM.LOG_ALT_BASEPGTO BA '+_clinefeed+
            ' WHERE BA.IDOBS = OBA.IDOBS                         '+_clinefeed+
            ' AND EXISTS (SELECT 1 FROM BASEDEPAGAMENTO B '+_clinefeed+
            '              WHERE B.IDBASEPGTO = BA.IDBASEPGTO '+_clinefeed+
            '                AND B.IDTITULAR = ' +inttostr(qry.fieldbyname('IDTITULAR').asinteger)+' '+_clinefeed+
            '                AND B.MESCOBRANCA IN ('+lsmeses+')  '+_clinefeed+
            // Andre Imakawa - SIG 97671 - Inicio
            '           AND EXISTS (SELECT 1 '+_clinefeed+
            '            FROM CTRLINTERFACE C '+_clinefeed+
            '            WHERE C.IDLOTE = B.IDLOTE '+_clinefeed+
            '            AND C.FLGVOLTATMP = 0))) '+_clinefeed;
            // Andre Imakawa - SIG 97671 - Fim
        qryAux.close;
        qryAux.sql.Clear;
        qryAux.sql.Add(ssql);
        qryAux.execSql;

      ssql:='DELETE FROM CM.LOG_ALT_BASEPGTO BA '+_clinefeed+
            ' WHERE EXISTS (SELECT 1 FROM BASEDEPAGAMENTO B '+_clinefeed+
            '              WHERE B.IDBASEPGTO = BA.IDBASEPGTO '+_clinefeed+
            '                AND B.IDTITULAR = ' +inttostr(qry.fieldbyname('IDTITULAR').asinteger)+' '+_clinefeed+
            '                AND B.MESCOBRANCA IN ('+lsmeses+')  '+_clinefeed+
            // Andre Imakawa - SIG 97671 - Inicio
            '           AND EXISTS (SELECT 1 '+_clinefeed+
            '            FROM CTRLINTERFACE C '+_clinefeed+
            '            WHERE C.IDLOTE = B.IDLOTE '+_clinefeed+
            '            AND C.FLGVOLTATMP = 0)) '+_clinefeed;
            // Andre Imakawa - SIG 97671 - Fim
        qryAux.close;
        qryAux.sql.Clear;
        qryAux.sql.Add(ssql);
        qryAux.execSql;
      // Andre Imakawa - SIG 65680 - Fim

      //SOL 207789/16579 PPM 543916
      ssql:=
        ' DELETE FROM CM.BASEDEPAGAMENTOAPOIO BA' +_clinefeed+
        ' WHERE EXISTS (SELECT 1' +_clinefeed+
        '          FROM BASEDEPAGAMENTO B' +_clinefeed+
        '         WHERE B.IDBASEPGTO = BA.IDBASEPGTO' +_clinefeed+
        '           AND B.IDLOTE in (' + lslotes  +')' +_clinefeed+    //RAFAEL SIG 92075
        '           AND B.IDTITULAR = ' +inttostr(qry.fieldbyname('IDTITULAR').asinteger)+' '+_clinefeed+
        '           AND B.MESCOBRANCA IN ('+lsmeses+')  '+_clinefeed+
        // Andre Imakawa - SIG 97671 - Inicio
        '           AND EXISTS (SELECT 1 '+_clinefeed+
        '            FROM CTRLINTERFACE C '+_clinefeed+
        '            WHERE C.IDLOTE = B.IDLOTE '+_clinefeed+
        '            AND C.FLGVOLTATMP = 0)) '+_clinefeed;
        // Andre Imakawa - SIG 97671 - Fim

        qryAux.close;
        qryAux.sql.Clear;
        qryAux.sql.Add(ssql);
        qryAux.execSql;


      ssql:=
        ' DELETE FROM BASEDEPAGAMENTO B' +_clinefeed+
        '         WHERE B.IDTITULAR = ' +inttostr(qry.fieldbyname('IDTITULAR').asinteger)+' '+_clinefeed+
        '           AND B.IDLOTE in (' + lslotes  +')' +_clinefeed+    //RAFAEL SIG 92075
        '           AND B.MESCOBRANCA IN ('+lsmeses+') '+_clinefeed+
        // Andre Imakawa - SIG 97671 - Inicio
        '           AND EXISTS (SELECT 1 '+_clinefeed+
        '            FROM CTRLINTERFACE C '+_clinefeed+
        '            WHERE C.IDLOTE = B.IDLOTE '+_clinefeed+
        '            AND C.FLGVOLTATMP = 0) '+_clinefeed;
        // Andre Imakawa - SIG 97671 - Fim        

        qryAux.close;
        qryAux.sql.Clear;
        qryAux.sql.Add(ssql);
        qryAux.execSql;

        // Andre Imakawa - SIG 99346 - Inicio
      ssql:=
        'UPDATE TMPDESC TD ' +_clinefeed+
        '   SET TD.DATARECEBIMENTO = NULL, TD.LOTEPREVIA = NULL ' +_clinefeed+
        ' WHERE TD.FLGDESCFOLHA = ''B'' ' +_clinefeed+
        '   AND NVL(TD.FLGNAOPROCESSA, 0) = 0  ' +_clinefeed+
        '   AND TD.IDTITULAR = ' +inttostr(qry.fieldbyname('IDTITULAR').asinteger)+' '+_clinefeed+
        '   AND TD.MESCOBRANCA IN ('+lsmeses+') '+_clinefeed+
        '   AND TD.LOTEPREVIA IN ( ' + lslotes  +' )';

        qryAux.close;
        qryAux.sql.Clear;
        qryAux.sql.Add(ssql);
        qryAux.execSql;
        // Andre Imakawa - SIG 99346 - Fim
     end;
      //SOL 207789/16579 PPM 543916

      ssql:=
        'DELETE /*+INDEX (PREVIA XIE6PREVIA) */ FROM PREVIA P '+_clinefeed+
        'WHERE P.IDTITULAR = '+
          inttostr(qry.fieldbyname('IDTITULAR').asinteger)+' '+_clinefeed+
        'AND EXISTS (SELECT 1 '+_clinefeed+
        '            FROM CTRLINTERFACE C '+_clinefeed+
        '            WHERE C.IDLOTE = P.IDLOTE '+_clinefeed+
        '            AND C.FLGVOLTATMP = 0) '+_clinefeed;
      if lsmeses <> '' then
        ssql:=ssql+
          'AND P.MESCOBRANCA IN ('+lsmeses+') '+_clinefeed;
      if lslotes <> '' then
        ssql:=ssql+
          'AND P.IDLOTE IN ('+lslotes+') '+_clinefeed;

      qryAux.close;
      qryAux.sql.Clear;
      qryAux.sql.Add(ssql);
      qryAux.execSql;
      lsmeses:='';
      lslotes:='';
      lsmesini:='';
      lsloteini:='';
      lbalteroucampo:=false;
    except
    end;
  end;
end;

procedure TfrmCadHstBeneficio.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  lslotes:='';
  lsmeses:='';
end;

procedure TfrmCadHstBeneficio.CampoAlterado(Sender: TObject);
begin
  inherited;
  
  lbalteroucampo:=true;
end;

procedure TfrmCadHstBeneficio.CmeDetalheInsert(Sender: TObject);
begin
  inherited;
  lsmesini:='';
  lsloteini:='';
  lbalteroucampo:=true;
  BuscaData;
  IdentificaValoresEstado;
  try
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add('SELECT NOME FROM PESSOA WHERE IDPESSOA = '+
      IntToStr(Sistema.IdUsuario));
    qryAux.Open;

    if qryalter.state <> dsinsert then
      qryalter.insert;

    qryDet.FieldByName('NOMEUSU').AsString := qryAux.FieldByName('NOME').AsString;
  except
  end;

  if not qryDet.FieldByName('idpessoa').isnull then
       begin
//       lsidpessoa:= lsidpessoa + qryDet.FieldByName('idpessoa').AsString+',';
       Fidpessoa.Add(qryDet.FieldByName('idpessoa').AsString);
       Fidlote.Add( qryDet.FieldByName('idlote').AsString);
       if not(DbEdRecebido.Text<>'') then  //SOL 271052 PPM 1351891
          FidlotexPessoaNaoPago.Add( qryDet.FieldByName('idlote').AsString);


       end; //SOL 271052 PPM 1351891   
end;

procedure TfrmCadHstBeneficio.CmeDetalheDelete(Sender: TObject);
begin
  if bPodeAlterar then //Denis Horongoso - SIG 27748
     lsmeses:=lsmeses+quotedstr(qryDet.FieldByName('Mes').AsString)+',';

  if not qryDet.FieldByName('idlote').isnull and bPodeAlterar then //Denis Horongoso - SIG 27748
    lslotes:=lslotes+qryDet.FieldByName('idlote').AsString+',';

    if not qryDet.FieldByName('idpessoa').isnull and bPodeAlterar then //Denis Horongoso - SIG 27748
       begin
    //   lsidpessoa:= lsidpessoa + qryDet.FieldByName('idpessoa').AsString+',';
       Fidpessoa.Add(qryDet.FieldByName('idpessoa').AsString);
       Fidlote.Add( qryDet.FieldByName('idlote').AsString);
       if not(DbEdRecebido.Text<>'') then  //SOL 271052 PPM 1351891
          FidlotexPessoaNaoPago.Add( qryDet.FieldByName('idlote').AsString);


       end; //SOL 271052 PPM 1351891
 


  lbalteroucampo:=true;

  //Henrique Massão
  if pgctrlDetalhe.ActivePage = tbsDet then
  begin

    if qryalter.Locate('IDPLANOPREV;MES;IDMOTIVO;NUMEROPROCESSO;IDBENEFICIO;MESREFERENCIA;SEQPROPOSTA;SEQBENEFICIO',VarArrayOf([QryDet.FieldByname('IDPLANOPREV').asstring,QryDet.FieldByname('MES').asstring,QryDet.FieldByname('IDMOTIVO').asstring,QryDet.FieldByname('NUMEROPROCESSO').asstring,QryDet.FieldByname('IDBENEFICIO').asstring,QryDet.FieldByname('MESREFERENCIA').asstring,QryDet.FieldByname('SEQPROPOSTA').asstring,QryDet.FieldByname('SEQBENEFICIO').asstring]),[]) then begin
      Showmessage ('Não é possível excluir registros com alteradores cadastrados');
      exit;
    end;

  end;

  inherited;
end;

procedure TfrmCadHstBeneficio.BuscaData;
var
  sAnoAux,
  sMesAux,
  sDataFolha : string;
  dtData     : TDatetime;

begin
  sAnoAux     := edAnoRef.Text;
  sMesAux     := edMesRef.Text;
  sDataFolha  := AtualizaDataFolha(sMesAux,sAnoAux);

  If Length(sDataFolha) = 10 Then
  Begin
    if sDataFolha <> '' then
    begin
      dtData            := StrToDate(sDataFolha);
      if qryAlter.State <> dsinsert then
         qryAlter.Insert;

      if qryDet.State <> dsEdit then
         qryDet.Edit;


      qryDet.fieldbyname('DATAPAGAMENTO').asDateTime := dtData;
    end
    else
    begin
      MsgDlg('Erro na Data de Pagamento da Folha de Benefícios. Consulte o Cadastro de Fundação','Erro',mtError,[mbOk,mbHelp],0);
      edanoref.setfocus;
    end;
  End;
end;

procedure TfrmCadHstBeneficio.IdentificaValoresEstado;
var indexdepara : Integer;//Petri SOL 259738
begin
  dbrgrpEstado.items.clear;
  dbrgrpEstado.values.clear;
  dbrgrpEstado.items.add('A Processar');
  dbrgrpEstado.items.add('Processado');
  dbrgrpEstado.items.add('Retido');
  dbrgrpEstado.values.add('0');
  dbrgrpEstado.values.add('1');
  dbrgrpEstado.values.add('9');

  if (qry.fieldbyname('flgreferencia').asinteger = 1) and
     (qry.fieldbyname('flgpagainss').asinteger = 1) then
  begin
    dbrgrpEstado.items.add('Fora Convênio');
    dbrgrpEstado.values.add('8');
  end;
  //Petri SOL 259738 inicio
  indexdepara := qryDet.fieldbyname('FLGENVIADO').asinteger;
  case indexdepara of
       9: begin
          indexdepara := 2;
          end;
       8: begin
          indexdepara := 3;
          end;
  end;
  dbrgrpEstado.itemindex:=indexdepara;
  ////Petri SOL 259738 fim
end;

procedure TfrmCadHstBeneficio.FormCreate(Sender: TObject);
var
  sAcresDecres: String; //BRUNO AZEVEDO SOL 189615 KINTANA 1789821
begin
  inherited;

  MontaSelect.Filtro.Add('PAT.IDFUNDACAO = '+inttostr(iIdFundacao));
  //Fanuel Junior SOL 161976 KINTANA 1373225
  Operacao := Nada;

  //BRUNO AZEVEDO SOL 189615 KINTANA 1789821
  if  rgrpTipoAlterador.ItemIndex = 0  then  begin
    sAcresDecres  := 'C'
  end else begin
    sAcresDecres  := 'D';
  end;
  
  qryTipoAlterador.Close;
  qryTipoAlterador.Parambyname('ACRESDECRES').asstring := sAcresDecres;
  qryTipoAlterador.Open;
  //BRUNO AZEVEDO SOL 189615 KINTANA 1789821

  sldbgrdDet := TStringList.Create; // SOL 140042 Kintana 900220

  Fidpessoa := TStringList.Create;
  Fidpessoa.Clear;


  Fidlote := TStringList.Create;
  Fidlote.Clear;
  FidlotexPessoaNaoPago := TStringList.Create; //SOL 271052 PPM 1351891
  FidlotexPessoaNaoPago.Clear; //SOL 271052 PPM 1351891


end;

procedure TfrmCadHstBeneficio.FormDestroy(Sender: TObject);  // SOL 140042 Kintana 900220
begin
  inherited;
  FreeAndNil(sldbgrdDet);
  FreeAndNil(Fidpessoa);
  FreeAndNil(Fidlote);
  FreeAndNil(FidlotexPessoaNaoPago); //SOL 271052 PPM 1351891


end;

procedure TfrmCadHstBeneficio.tbcDetalheChange(Sender: TObject);
var RecordAfterFilter : integer;
begin
  inherited;
  if qryDet.isEmpty then begin
    pgctrlDetalhe.ActivePage := tbsDet;
    tbcDetalhe.TabIndex      := 0;
  end;
  AtribEdits(DbEdRecebido.Text<>'');

  if  (((qryDet.FieldByName('Estado').AsString =  'Processado')  or  (qryDet.FieldByName('Estado').AsString =  'A Processar')) and ((Operacao = Alterar) or (Operacao = Excluir)))  then  begin
     bPodeAlterar := PermiteAlterar();
     bJustificaExclusao := (not bPodeAlterar) and sbtnExcluiDetEnv.Enabled; //Denis Horongoso - SIG 27748
     sbtnExcluiDet.Enabled := bPodeAlterar or sbtnExcluiDetEnv.Enabled;     //Denis Horongoso - SIG 27748
     sbtnAltDet.Enabled    := bPodeAlterar;
  end;

  //SOL 163551 Kintana 1398227
  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
    AtribEdits(DbEdRecebido.Text<>'');
    //Fanuel Junior SOL 161976 KINTANA 1373225
    if  (((qryDet.FieldByName('Estado').AsString =  'Processado')  or  (qryDet.FieldByName('Estado').AsString =  'A Processar')) and ((Operacao = Alterar) or (Operacao = Excluir)))  then  begin
       bPodeAlterar := PermiteAlterar();
       bJustificaExclusao := (not bPodeAlterar) and sbtnExcluiDetEnv.Enabled; //Denis Horongoso - SIG 27748
       sbtnExcluiDet.Enabled := bPodeAlterar or sbtnExcluiDetEnv.Enabled;     //Denis Horongoso - SIG 27748
       sbtnAltDet.Enabled    := bPodeAlterar;
    end;
  end;
end;


procedure TfrmCadHstBeneficio.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  //Fanuel Junior SOL 161976 KINTANA 1373225
  Operacao := Nada;
     if sbtnAlterar.down = false then begin
       pgctrlDetalhe.ActivePage := tbsDet;
       tbcDetalhe.TabIndex      := 0;
  end;
 end;
procedure TfrmCadHstBeneficio.QryAlterBeforePost(DataSet: TDataSet);
var sTipo : String;
begin
  inherited;

  if QryAlter.State in [dsedit,dsInsert] then begin
    QryAlter.FieldByName ('IDPESSJUR').asinteger      := qrydet.fieldbyname('IDPESSJUR').asInteger;
    QryAlter.FieldByName ('IDTITULAR').asinteger      := qrydet.fieldbyname('IDTITULAR').asInteger;
    QryAlter.FieldByName ('IDPLANOPREV').asinteger    := qrydet.fieldbyname('IDPLANOPREV').asInteger;
    QryAlter.FieldByName ('MES').asString             := qrydet.fieldbyname('MES').asString;
    QryAlter.FieldByName ('IDMOTIVO').asinteger       := qrydet.fieldbyname('IDMOTIVO').asInteger;
    QryAlter.FieldByName ('NUMEROPROCESSO').asinteger := qrydet.fieldbyname('NUMEROPROCESSO').asInteger;
    QryAlter.FieldByName ('IDBENEFICIO').asinteger    := qrydet.fieldbyname('IDBENEFICIO').asInteger;
    QryAlter.FieldByName ('IDPESSOA').asinteger       := qrydet.fieldbyname('IDPESSOA').asInteger;
    QryAlter.FieldByName ('MESREFERENCIA').asString   := qrydet.fieldbyname('MESREFERENCIA').asString;
    QryAlter.FieldByName ('SEQPROPOSTA').asinteger    := qrydet.fieldbyname('SEQPROPOSTA').asInteger;

     //SEQUENCIAL - DEFINIR COM GUSTAVO.....
    QryAlter.FieldByName ('SEQBENEFICIO').asinteger   := qrydet.fieldbyname('SEQBENEFICIO').asInteger;
    //SEQUENCIAL - DEFINIR COM GUSTAVO.....

    if rgrpTipoAlterador.ItemIndex = 0 then
    sTipo := 'A' else
    sTipo := 'D';


    //VEM DA TELA
    QryAlter.FieldByName ('CODALTERADOR').asInteger   :=  qryTipoAlterador.FieldByname('CodAlterador').asInteger;
//    QryAlter.FieldByName ('VALOR').asFloat            :=  strTofloat(OraNumero(Trim(edValorAlterador.Text)));
    QryAlter.FieldByName ('VALOR').asFloat            :=  strTofloat(edValorAlterador.Text); //Ádler Souza - SOL 132937 KINTANA 770225
    QryAlter.FieldByName ('FLGTIPO').asString         :=  sTipo;
    QryAlter.FieldByname ('DESCRICAO').AsString       :=  edAlterador.Text;
    //VEM DA TELA

    //Fanuel Junior - Inicio
   { sIdBeneficio  := qrydet.fieldbyname('IDBENEFICIO').AsString;
    sCodAlterador := qryTipoAlterador.FieldByname('CodAlterador').AsString;
    sIdPlanoPrev  := qrydet.fieldbyname('IDPLANOPREV').AsString;

    if rgrpTipoAlterador.ItemIndex = 0 then begin
       sFlgDevol  := '0';
       sFlgAtraso := '1';
    end
    else
    begin
       sFlgDevol  := '1';
       sFlgAtraso := '0';
    end;

    if QryAlter.State in [dsInsert] then begin
       qryAlterBenef := TwwQuery.Create(nil);
       qryAlterBenef.DataBaseName := 'BASEDADOS';
       qryAlterBenef.Close;
       qryAlterBenef.SQL.Clear;
       qryAlterBenef.SQL.Add(' INSERT INTO ALTERADORXBENEF (IDPLANOPREV, IDBENEFICIO, CODALTERADOR, FLGDEVOL, FLGATRASO) '+
                             ' VALUES ( '+sIdPlanoPrev+','+sIdBeneficio+','+sCodAlterador+','+sFlgDevol+','+sFlgAtraso+ ' )');
       qryAlterBenef.ExecSQL;

    end;
    //Fanuel Junior - Fim  }

    //gustavo---Renato falar com Gustavo sobre esse campo.
    //QryAlter.FieldByName ('FLGRETROATIVO').asinteger  := qrydet.fieldbyname('FLGRETROATIVO').asInteger;
    /////////
  end;

 // if qrydet.state in [dsedit] then qrydet.Append;


 end;



procedure TfrmCadHstBeneficio.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  // Renato Visoni SOL 146550 Kintana 999173
  if not dtmBaseDados.dbBaseDados.InTransaction then  dtmBaseDados.dbBaseDados.StartTransaction;
     dtmBaseDados.dbBaseDados.Rollback;
  // Renato Visoni SOL 146550 Kintana 999173



end;

//Fanuel Junior SOL 161976 KINTANA 1373225
function TfrmCadHstBeneficio.PodeAlterar : Boolean;
begin
  If bPodeAlterar then begin
     sbtnInsDet.enabled:=false;
     sbtnAltDet.enabled:=false;
     sbtnExcluiDet.enabled:=false;
  end;
  Result := bPodeAlterar;
end;

procedure TfrmCadHstBeneficio.dbgrdDetDblClick(Sender: TObject);
begin
  inherited;
  //dbgrdDet.SendToBack;
end;

procedure TfrmCadHstBeneficio.sbtnExcluiDetClick(Sender: TObject);
var
   sObservacao: string;       //Denis Horongoso - SIG 27748
   mModalObs  : TModalResult; //Denis Horongoso - SIG 27748
begin
   if trim(qryDet.FieldByName('IDLOTE').AsString) = '' then ///DODS - SOL 269070 PPM 1285933
      begin
      Showmessage ('Não é possível excluir registros com lote em branco');
      exit;
      end
  else
     begin

      //Denis Horongoso - SIG 27748 - Inicio
      if bJustificaExclusao then
      begin
         repeat
            sObservacao := InsereObservacao(mModalObs, '', 'Observação', 400);

            if (sObservacao = '') and (mModalObs = mrOk) then
               MsgDlg('É preciso informar o motivo da exclusão. Verifique.','Erro',mtError,[mbOk,mbHelp],0)
            else
              if mModalObs = mrCancel then
                 exit;
         until (sObservacao <> '');

         GravaJustificativaExclusao(sObservacao);
      end;
      //Denis Horongoso - SIG 27748 - Fim

      inherited;
      Operacao := Excluir; // Fanuel Junior SOL166441 Kintana1448712
      AtribEdits(False);
      end;


end;

procedure TfrmCadHstBeneficio.qryAfterScroll(DataSet: TDataSet);
var iIndice : integer;
begin
  inherited;
  // SOL 140042 Kintana 900220
  edAnoComp.Visible           := (qry.Fieldbyname('FONTEPAGADORA').asInteger = 2);
  edMesComp.Visible           := (qry.Fieldbyname('FONTEPAGADORA').asInteger = 2);
  GroupBox2.Visible           := (qry.Fieldbyname('FONTEPAGADORA').asInteger = 2);

  if sldbgrdDet.Text = '' then
    sldbgrdDet.Assign(dbgrdDet.Selected);

  dbgrdDet.Selected.Assign(sldbgrdDet);

  //Inicio - Helio - SOL Nº 253577/17584 PPM Nº 994289
  if (qry.Fieldbyname('FONTEPAGADORA').asInteger <> 1) then
  begin
        dbgrdDet.Selected.Delete(9);
        dbgrdDet.Selected.Delete(8);
        dbgrdDet.Selected.Delete(7);

        lblValorBS.Visible    := False;
        lblValorFab.Visible   := False;
        lblBaseCalcD.Visible  := False;
        dbedValorBS.Visible   := False;
        dbedValorFab.Visible  := False;
        dbedBaseCalcD.Visible := False;
  end else
  begin
        lblValorBS.Visible    := True;
        lblValorFab.Visible   := True;
        lblBaseCalcD.Visible  := True;
        dbedValorBS.Visible   := True;
        dbedValorFab.Visible  := True;
        dbedBaseCalcD.Visible := True;
  end;
  //Fim - Helio - SOL Nº 253577/17584 PPM Nº 994289

  IF (qry.Fieldbyname('FONTEPAGADORA').asInteger <> 2) THEN begin
    //iIndice := dbgrdDet.Selected. IndexOf('MESCOMPREEM');
    dbgrdDet.Selected.Delete(2);
  end;
  // SOL 140042 Kintana 900220
end;

procedure TfrmCadHstBeneficio.rgrpTipoAlteradorClick(Sender: TObject);
var sAcresDecres  : string;
begin
  inherited;
  if  rgrpTipoAlterador.ItemIndex = 0  then
     sAcresDecres  := 'C'
  else
     sAcresDecres  := 'D';

  qryTipoAlterador.Close;
  qryTipoAlterador.Parambyname('ACRESDECRES').asstring := sAcresDecres;
  qryTipoAlterador.Open;
  edAlterador.ReadOnly := false; // xavier
  edAlterador.Text := qryTipoAlterador.Fieldbyname('DESCRICAO').asstring;
  edAlterador.ReadOnly := true; // xavier
end;

// SOL 163551 Kintana 1398227
procedure TfrmCadHstBeneficio.pgctrlDetalheChange(Sender: TObject);

begin
  inherited;
  if pgctrlDetalhe.ActivePage = tbsDet then
  begin
    AtribEdits(DbEdRecebido.Text<>'');
    //Fanuel Junior SOL 161976 KINTANA 1373225
    if  (((qryDet.FieldByName('Estado').AsString =  'Processado')  or  (qryDet.FieldByName('Estado').AsString =  'A Processar')) and ((Operacao = Alterar) or (Operacao = Excluir)))  then  begin
       bPodeAlterar := PermiteAlterar();
       bJustificaExclusao := (not bPodeAlterar) and sbtnExcluiDetEnv.Enabled; //Denis Horongoso - SIG 27748
       sbtnExcluiDet.Enabled := bPodeAlterar or sbtnExcluiDetEnv.Enabled;     //Denis Horongoso - SIG 27748
       sbtnAltDet.Enabled    := bPodeAlterar;
    end;
  end;
end;

procedure TfrmCadHstBeneficio.MontaSelectBeforeOpenCds(var sqlText: String;
  strListParams: TStringList);
begin
  inherited;
  sqlText := StringReplace(sqlText,'ORDER BY C0 ASC','ORDER BY C19 ASC', [rfReplaceAll]);
end;

procedure TfrmCadHstBeneficio.RemoveDuplicates(
  var stringList: TStringList);
var  
  buffer: TStringList;  
  cnt: Integer;  
begin
  stringList.Sort;
  buffer := TStringList.Create;
  try
    buffer.Sorted := True;
    buffer.Duplicates := dupIgnore;  
    buffer.BeginUpdate;  
    for cnt := 0 to stringList.Count - 1 do  
      buffer.Add(stringList[cnt]) ;
    buffer.EndUpdate;  
    stringList.Assign(buffer) ;  
  finally  
    FreeandNil(buffer) ;  
  end;
end;
procedure TfrmCadHstBeneficio.qryDetBeforeDelete(DataSet: TDataSet);
begin
  inherited;

  if not qryDet.FieldByName('idlote').isnull then
     lslotesB:=lslotesB+qryDet.FieldByName('idlote').AsString+',';
end;

// Thiago Melo SOL 222644 Ktn 2055776
procedure TfrmCadHstBeneficio.AplicarCorrecaoDeDatas;
var
  qry : TwwQuery;
begin
  qry := TwwQuery.Create(Self);
  dtmBaseDados.dbBaseDados.StartTransaction;

  try
    qry.DataBaseName := 'BaseDados';

    qry.Close;
    qry.Sql.Clear;
    qry.Sql.Add('UPDATE HSTBENEFBFCIARIO H SET H.DTEFETPGTO = NULL');
    qry.Sql.Add(' WHERE (H.IDPESSJUR = :IDPESSJUR)');
    qry.Sql.Add('   AND (H.IDPLANOPREV = :IDPLANOPREV)');
    qry.Sql.Add('   AND (H.IDPLANOORIGEM = :IDPLANOORIGEM)');
    qry.Sql.Add('   AND (H.IDTITULAR = :IDTITULAR)');
    qry.Sql.Add('   AND (H.IDPESSOA = :IDPESSOA)');
    qry.Sql.Add('   AND (H.SEQPROPOSTA = :SEQPROPOSTA)');
    qry.Sql.Add('   AND (H.IDBENEFICIO = :IDBENEFICIO)');
    qry.Sql.Add('   AND (H.NUMEROPROCESSO = :NUMEROPROCESSO)');
    qry.Sql.Add('   AND (H.DTEFETPGTO <= TO_DATE(' + QuotedStr('1800-01-01') + ', ' + QuotedStr('YYYY-MM-DD') + '))');

    qry.Params.Clear;

    qry.Params.CreateParam(ftInteger, 'IDPESSJUR', ptInput);
    qry.ParamByName('IDPESSJUR').AsInteger := StrToInt(MontaSelect.ValoresChave[0]);

    qry.Params.CreateParam(ftInteger, 'IDPLANOPREV', ptInput);
    qry.ParamByName('IDPLANOPREV').AsInteger :=  StrToInt(MontaSelect.ValoresChave[1]);

    qry.Params.CreateParam(ftInteger, 'IDPLANOORIGEM', ptInput);
    qry.ParamByName('IDPLANOORIGEM').AsInteger := StrToInt(MontaSelect.ValoresChave[7]);

    qry.Params.CreateParam(ftInteger, 'IDTITULAR', ptInput);
    qry.ParamByName('IDTITULAR').AsInteger := StrToInt(MontaSelect.ValoresChave[2]);

    qry.Params.CreateParam(ftInteger, 'IDPESSOA', ptInput);
    qry.ParamByName('IDPESSOA').AsInteger := StrToInt(MontaSelect.ValoresChave[3]);

    qry.Params.CreateParam(ftInteger, 'SEQPROPOSTA', ptInput);
    qry.ParamByName('SEQPROPOSTA').AsInteger := StrToInt(MontaSelect.ValoresChave[4]);

    qry.Params.CreateParam(ftInteger, 'IDBENEFICIO', ptInput);
    qry.ParamByName('IDBENEFICIO').AsInteger := StrToInt(MontaSelect.ValoresChave[5]);

    qry.Params.CreateParam(ftInteger, 'NUMEROPROCESSO', ptInput);
    qry.ParamByName('NUMEROPROCESSO').AsInteger := StrToInt(MontaSelect.ValoresChave[6]);
    try
      qry.Prepare;
      qry.ExecSQL;
    except
      dtmBaseDados.dbBaseDados.Rollback;
      FreeAndNil(qry);
      Exit;
    end;
    dtmBaseDados.dbBaseDados.Commit;
  finally
    qry.Close;
    FreeAndNil(qry);
  end;
end;
// Thiago Melo SOL 222644 Ktn 2055776

// Felipe A. Santos SOL 200665/13992 KTN 1940550
function TfrmCadHstBeneficio.AlteroValor: boolean;
begin

    Result := False;

    if (qry.FieldByName('VALORSRB').NewValue <>
        qry.FieldByName('VALORSRB').OldValue) then
    begin
         Result := True;
         Exit;
    end
    else if (qry.FieldByName('VALORATUAL').NewValue <>
             qry.FieldByName('VALORATUAL').OldValue) then
    begin
         Result := True;
         Exit;
    end
    else if (qry.FieldByName('VALORTOTAL').NewValue <>
             qry.FieldByName('VALORTOTAL').OldValue) then
    begin
         Result := True;
         Exit;
    //Inicio - Helio - SOL Nº 253577/17584 PPM Nº 994289
    end
    else if (qry.FieldByName('VLRBSATUAL').NewValue <>
             qry.FieldByName('VLRBSATUAL').OldValue) then
    begin
         Result := True;
         Exit;
    end
    else if (qry.FieldByName('VLRBSTOTAL').NewValue <>
             qry.FieldByName('VLRBSTOTAL').OldValue) then
    begin
         Result := True;
         Exit;
    end
    else if (qry.FieldByName('VLRFABATUAL').NewValue <>
             qry.FieldByName('VLRFABATUAL').OldValue) then
    begin
         Result := True;
         Exit;
    end
    else if (qry.FieldByName('VLRFABTOTAL').NewValue <>
             qry.FieldByName('VLRFABTOTAL').OldValue) then
    begin
         Result := True;
         Exit;
    end
    else if (qry.FieldByName('VLRBASEDEFICIT').NewValue <>
             qry.FieldByName('VLRBASEDEFICIT').OldValue) then
    begin
         Result := True;
         Exit;
    end;
    //Fim - Helio - SOL Nº 253577/17584 PPM Nº 994289
end;
// Felipe A. Santos SOL 200665/13992 KTN 1940550 - fim


//Helio - SOL Nº 253577/17584 PPM Nº 994289
procedure TfrmCadHstBeneficio.ReorganizaGbValores;
begin
  OcultaValoresFabBsGbValores;     //luis WO22572
  
       if (qry.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1) And
          (qry.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 1) then
              MostraValoresFabBsGbValores
       else
       begin
              if qry.FieldByName('FLGAPRESENTABSFAB').AsInteger = 1 then
                    MostraValoresFabBs
              else
                  if qry.FieldByName('FLGAPRESENTADEFICIT').AsInteger = 1 then
                      MostraValoresDeficit
                  else
                      OcultaValoresFabBsGbValores;
       end;

end;

//Helio - SOL Nº 253577/17584 PPM Nº 994289
procedure TfrmCadHstBeneficio.MostraValoresFabBsGbValores;
begin
       dbedValorAtualBS.Visible  := True;
       dbedValorTotalBS.Visible  := True;
       dbedValorAtualFab.Visible := True;
       dbedValorTotalFab.Visible := True;
       dbedBaseCalcDef.Visible   := True;
       lblValorAtualBS.Visible   := True;
       lblValorTotalBS.Visible   := True;
       lblValorAtualFab.Visible  := True;
       lblValorTotalFab.Visible  := True;
       lblBaseCalcDef.Visible    := True;

       //edilaine WO18367 : inicio
       lblPercPensao.visible     := bPensao;
       dbedPercPensao.visible    := bPensao;
       gpInfoTitular.visible     := bPensao;
       dbedlVlrTitTotal.visible  := (qry.FieldByName('VLRTOTALTITULAR').AsFloat > 0);
       lblVlrTitTotal.visible    := dbedlVlrTitTotal.visible;

       //lblBaseCalcDef.Top   := 91;
       //lblBaseCalcDef.Left  := 356;
       //dbedBaseCalcDef.Top  := 87;
       //dbedBaseCalcDef.Left := 463;

       if bPensao then
         gbValores.Top    := gpInfoTitular.Top + 49      //64;
       else
         gbValores.Top    := gpInfoTitular.Top;          //64;
       gbValores.Height := 113;
       //edilaine WO18367 : fim

       dbBenefMinimo.Left := 416;
       dbBenefMinimo.Top  := 12;

       //edilaine WO18367 : inicio
       dbeValorAtual.Top := dbedValorAtualBS.top;   //39;
       dbeValorTotal.Top := dbedValorTotalBS.top;   //64;
       lblValorAtual.Top := lblValorAtualBS.top;    //38;
       lblValorTotalVincBenef.Top := lblValorTotalBS.top;   //63;

       dbedBaseCalcDef.Top  := dbeValorTotal.top + dbeValorTotal.Height + 4;
       dbedBaseCalcDef.Left := dbeValorTotal.left;
       lblBaseCalcDef.Top   := lblValorTotalVincBenef.Top + 24;
       lblBaseCalcDef.Left  := dbedBaseCalcDef.left - lblBaseCalcDef.width - 5;

       //pnlMestre.height := pnlMestre.height + 90;               //luis WO22572
       pnlMestre.height := gbValores.Height + gbValores.Top;      //luis WO22572
       //edilaine WO18367 : fim

end;

//Helio - SOL Nº 253577/17584 PPM Nº 994289
procedure TfrmCadHstBeneficio.MostraValoresFabBs;
begin
       dbedValorAtualBS.Visible  := True;
       dbedValorTotalBS.Visible  := True;
       dbedValorAtualFab.Visible := True;
       dbedValorTotalFab.Visible := True;
       lblValorAtualBS.Visible   := True;
       lblValorTotalBS.Visible   := True;
       lblValorAtualFab.Visible  := True;
       lblValorTotalFab.Visible  := True;
       lblBaseCalcDef.Visible    := False;
       dbedBaseCalcDef.Visible   := False;

       //edilaine WO18367 : inicio
       lblPercPensao.visible     := bPensao;
       dbedPercPensao.visible    := bPensao;
       gpInfoTitular.visible     := bPensao;
       dbedlVlrTitTotal.visible  := (qry.FieldByName('VLRTOTALTITULAR').AsFloat > 0);
       lblVlrTitTotal.visible    := dbedlVlrTitTotal.visible;

       //lblBaseCalcDef.Top   := 91;
       //lblBaseCalcDef.Left  := 356;
       //dbedBaseCalcDef.Top  := 87;
       //dbedBaseCalcDef.Left := 463;

       if bPensao then
       begin
         gbValores.Top    := gpInfoTitular.top + 49;   //64;
         gbValores.Height := 113;                      //94;
       end
       else
       begin
         gbValores.Top    := gpInfoTitular.top;      //64;
         gbValores.Height := 94;
       end;
       //edilaine WO18367 : fim

       dbBenefMinimo.Left := 416;
       dbBenefMinimo.Top  := 12;

       //edilaine WO18367 : inicio
       dbeValorAtual.Top := dbedValorAtualBS.top;   //39;
       dbeValorTotal.Top := dbedValorTotalBS.top;   //64;
       lblValorAtual.Top := lblValorAtualBS.top;    //38;
       lblValorTotalVincBenef.Top := lblValorTotalBS.top;   //63;

       dbedBaseCalcDef.Top  := dbeValorTotal.top + dbeValorTotal.Height + 4;
       dbedBaseCalcDef.Left := dbeValorTotal.left;
       lblBaseCalcDef.Top   := lblValorTotalVincBenef.Top + 24;
       lblBaseCalcDef.Left  := dbedBaseCalcDef.left - lblBaseCalcDef.width - 5;

       //pnlMestre.height := pnlMestre.height + 90                //luis WO22572
       pnlMestre.height := gbValores.Height + gbValores.Top;      //luis WO22572
       //edilaine WO18367 : fim

end;

//Helio - SOL Nº 253577/17584 PPM Nº 994289
procedure TfrmCadHstBeneficio.MostraValoresDeficit;
begin
       OcultaValoresFabBsGbValores;
       
       lblBaseCalcDef.Visible    := True;
       dbedBaseCalcDef.Visible   := True;

       //edilaine WO18367 : inicio
       dbedBaseCalcDef.Top  := dbeValorTotal.top;              //36;
       dbedBaseCalcDef.Left := lblValorTotalVincBenef.left - dbedBaseCalcDef.width - 12;    //281;
       lblBaseCalcDef.Top   := lblValorTotalVincBenef.Top;     //38;
       lblBaseCalcDef.Left  := dbedBaseCalcDef.left - lblBaseCalcDef.width - 5;   //170;
       //edilaine WO18367 : fim

end;

//Helio - SOL Nº 253577/17584 PPM Nº 994289
procedure TfrmCadHstBeneficio.OcultaValoresFabBsGbValores;
begin
       dbedValorAtualBS.Visible  := False;
       dbedValorTotalBS.Visible  := False;
       dbedValorAtualFab.Visible := False;
       dbedValorTotalFab.Visible := False;
       dbedBaseCalcDef.Visible   := False;
       lblValorAtualBS.Visible   := False;
       lblValorTotalBS.Visible   := False;
       lblValorAtualFab.Visible  := False;
       lblValorTotalFab.Visible  := False;
       lblBaseCalcDef.Visible    := False;

       //edilaine WO18367 : inicio
       lblPercPensao.visible     := false;
       dbedPercPensao.visible    := false;
       gpInfoTitular.visible     := false;
       //edilaine WO18367 : fim

       gbValores.Top    := gpInfoTitular.top;   // 80;      //edilaine WO18367
       gbValores.Height := 65;

       dbBenefMinimo.Left := 7;
       dbBenefMinimo.Top  := 41;

       //edilaine WO18367 : inicio
       dbeValorAtual.Top := dbedValorSRB.Top;    //11;
       dbeValorTotal.Top := dbeValorAtual.Top + dbeValorAtual.Height + 4;  // 36;
       lblValorAtual.Top := LblValorSRB.Top;    //11;
       lblValorTotalVincBenef.Top := lblValorAtual.Top + 24;  // 36;

       //luis WO22572 : inicio
       //if pnlMestre.height > 200 then
       //   pnlMestre.height := pnlMestre.height - 90;
       pnlMestre.height := gbValores.Height + gbValores.Top + 10;
       //luis WO22572 : fim
       //edilaine WO18367 : fim
end;

//Helio - SOL Nº 253577/17584 PPM Nº 994289
function TfrmCadHstBeneficio.VerificaPreenchimentoCadastro:Boolean;
begin
     Result := False;

     try
        if dbedValorAtualBS.Visible then
        if (Trim(qryVLRBSATUAL.AsString) = '') or
           (qryVLRBSATUAL.AsFloat = 0) then
           raise EValidacao.CreateVal('É necessário informar o Valor do BS Atual e BS Total.', dbedValorAtualBS);
           
        if dbedValorTotalBS.Visible then
        if (Trim(qryVLRBSTOTAL.AsString) = '') or
           (qryVLRBSTOTAL.AsFloat = 0) then
           raise EValidacao.CreateVal('É necessário informar o Valor do BS Atual e BS Total.', dbedValorTotalBS);

        if dbedValorAtualFab.Visible then
        if (Trim(qryVLRFABATUAL.AsString) = '') then
           raise EValidacao.CreateVal('É necessário informar o Valor do FAB Atual e FAB Total.', dbedValorAtualFab);

        if dbedValorTotalFab.Visible then
        if (Trim(qryVLRFABTOTAL.AsString) = '') then
           raise EValidacao.CreateVal('É necessário informar o Valor do FAB Atual e FAB Total.', dbedValorTotalFab);

        if dbedBaseCalcDef.Visible then
        if (Trim(qryVLRBASEDEFICIT.AsString) = '') or
           (qryVLRBASEDEFICIT.AsFloat = 0) then
           raise EValidacao.CreateVal('É necessário informar o Valor da Base de Cálculo do Déficit.', dbedBaseCalcDef);


     except
        on ev : EValidacao do
        begin
           Screen.Cursor := crDefault;
           if ev.Show then MsgDlg(ev.message, Sistema.NomeModulo, mtWarning, [mbOk], 0);
           Repaint;
           if ev.Control.CanFocus then ev.Control.SetFocus;
           Exit;
        end;
     end;

     Result := True;

end;
// SOL 265023 PPM 1162062  INICIO dblkpcmbLoteCloseUp
procedure TfrmCadHstBeneficio.dblkpcmbLoteCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;

  IF trim(dblkpcmbLote.text) <> '' then
  begin
     if (qryLote.FieldByName('MESREFERENCIA').AsString <>
         Trim(edAnoCob.Text)+'/'+Trim(edMesCob.Text)) then
     begin
          Showmessage ('O mês de cobrança informado é diferente do mês de cobrança do lote. Para continuar a operação é necessário realizar a alteração do mês de cobrança.');
          dblkpcmbLote.text := '';
          exit;
     end;
  end;

end;
// SOL 265023 PPM 1162062  FIM dblkpcmbLoteCloseUp

procedure TfrmCadHstBeneficio.edAnoRefExit(Sender: TObject);
begin
  inherited;
  //SIG51403 inicio
  if trim(edAnoRef.Text) <> '' then
  begin
     try
        StrToIntDef(edAnoRef.Text,0);
     except
        Showmessage ('Ano referência invalido.');
        exit;
     end;

     if (StrToIntDef(edAnoRef.Text,0) < 1900) then
     begin
        Showmessage ('Ano referência invalido, o valor deve ser superior a 1900.');
        exit;
     end;

  end;
  //SIG51403 Final
end;


procedure TfrmCadHstBeneficio.edMesCobExit(Sender: TObject);
begin
  inherited;
  //SIG51403 inicio
  if trim(edMesCob.Text) <> '' then
  begin

     try
        StrToIntDef(edMesCob.Text,0);
     except
        Showmessage ('Mês referência invalido.');
        exit;
     end;

     if not((StrToIntDef(edMesCob.Text,0) >= 1) and (StrToIntDef(edMesCob.Text,0) <= 13)) then
     begin
        Showmessage ('Mês referência invalido, o valor deve estar entre 1 e 13.');
        exit;
     end;

     edMesCob.Text := LeftPadCh(edMesCob.Text,'0',2);
  end;
  //SIG51403 Final
end;

procedure TfrmCadHstBeneficio.edMesCompExit(Sender: TObject);
begin
  inherited;
  //SIG51403 inicio
  if trim(edMesComp.Text) <> '' then
  begin

     try
        StrToIntDef(edMesComp.Text,0);
     except
        Showmessage ('Mês referência invalido.');
        exit;
     end;

     if not((StrToIntDef(edMesComp.Text,0) >= 1) and (StrToIntDef(edMesComp.Text,0) <= 13)) then
     begin
        Showmessage ('Mês referência invalido, o valor deve estar entre 1 e 13.');
        exit;
     end;

     edMesComp.Text := LeftPadCh(edMesComp.Text,'0',2);
  end;
  //SIG51403 Final
end;

procedure TfrmCadHstBeneficio.edAnoRefKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //SIG51403 inicio
  If not( key in['0'..'9',#08] ) then 
  key:=#0;
  //SIG51403 Final
end;

procedure TfrmCadHstBeneficio.edMesRefKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //SIG51403 inicio
  If not( key in['0'..'9',#08] ) then
  key:=#0;
  //SIG51403 Final
end;

procedure TfrmCadHstBeneficio.edAnoCobKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //SIG51403 inicio
  If not( key in['0'..'9',#08] ) then
  key:=#0;
  //SIG51403 Final
end;

procedure TfrmCadHstBeneficio.edMesCobKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //SIG51403 inicio
  If not( key in['0'..'9',#08] ) then
  key:=#0;
  //SIG51403 Final
end;

procedure TfrmCadHstBeneficio.edAnoCompKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //SIG51403 inicio
  If not( key in['0'..'9',#08] ) then
  key:=#0;
  //SIG51403 Final
end;

procedure TfrmCadHstBeneficio.edMesCompKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //SIG51403 inicio
  If not( key in['0'..'9',#08] ) then
  key:=#0;
  //SIG51403 Final
end;

//Denis Horongoso - SIG 27748 - Inicio
procedure TfrmCadHstBeneficio.GravaJustificativaExclusao(sObservacao: string);
begin
  with qryJustificativaExclusao do
  begin
    Filtered := False;
    Filter := '( IDPESSJUR = '+inttostr(qrydet.fieldbyname('IDPESSJUR').asInteger)+
           ' AND IDPLANOPREV = '+inttostr(qrydet.fieldbyname('IDPLANOPREV').asInteger)+
           ' AND IDPLANOORIGEM = '+inttostr(qrydet.fieldbyname('IDPLANOORIGEM').asInteger)+
           ' AND IDTITULAR = '+inttostr(qrydet.fieldbyname('IDTITULAR').asInteger)+
           ' AND IDPESSOA = '+inttostr(qrydet.fieldbyname('IDPESSOA').asInteger)+
           ' AND SEQPROPOSTA = '+inttostr(qrydet.fieldbyname('SEQPROPOSTA').asInteger)+
           ' AND IDBENEFICIO = '+inttostr(qrydet.fieldbyname('IDBENEFICIO').asInteger)+
           ' AND NUMEROPROCESSO = '+inttostr(qrydet.fieldbyname('NUMEROPROCESSO').asInteger)+
           ' AND MES = '''+qrydet.fieldbyname('MES').asString+''''+
           ' AND IDMOTIVO = '+inttostr(qrydet.fieldbyname('IDMOTIVO').asInteger)+
           ' AND SEQBENEFICIO = '+inttostr(qrydet.fieldbyname('SEQBENEFICIO').asInteger)+
           ' AND MESREFERENCIA = '''+qrydet.fieldbyname('MESREFERENCIA').asString+''')';
    Filtered := True;

    Edit;
    FieldByName('JUSTIFICATIVAEXCLUSAO').AsString := sObservacao;
    Post;
  end;
end;
//Denis Horongoso - SIG 27748 - Fim

// Andre Imakawa - SIG 99346 - Inicio
procedure TfrmCadHstBeneficio.ApagaPrevia_Procedure;
var
  sListaLote: TStringList;
  lii: Integer;
begin
  try
    try
      sListaLote := TStringList.Create;
      if lslotes <> '' then
      begin
        //SplitString(',', lslotes, sListaLote);
        ExtractStrings([','], [], pchar(lslotes), sListaLote);
        for lii:=0 to sListaLote.count-1 do
        begin
          if not(ApagaPreviaEfetivacaoPessoa(StrToInt(sListaLote[lii]), qry.fieldbyname('IDTITULAR').asinteger, qry.fieldbyname('IDPESSOA').asinteger )) then
          begin
            MsgDlg('Erro na SP_APAGAPREVIA ao tentar apagar a Prévia. Lote: ' + sListaLote[lii],'Erro',mtError,[mbOk, mbHelp],0);
            break;
          end;
        end;
      end;
    Except
      MsgDlg('Erro ao tentar apagar a Prévia.','Erro',mtError,[mbOk, mbHelp],0);
    end;
  finally
    FreeAndNil(sListaLote);
  end;

end;
// Andre Imakawa - SIG 99346 - Fim
end.
{==============================================================================|
| UNIT: FCADHSTBENEFICIO                                                       |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   TELA DE CONSULTA DE INFORMAÇÕES RELATIVAS A VERSÕES DE PAGAMENTO DA FOLHA  |
| DE BENEFÍCIOS.                                                               |
|                                                                              |
===============================================================================|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 28/02/2002 A 28/02/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12e                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
| - Alteração para gravar na HSTBENEFBFCIARIO, apartir da BENEFBFCIARIO        |
|    os seguintes valores :DATAPAGAMENTO, VALORCALCULADO, VALORTOTAL,          |
|    FLGFORMAPAGTO, FONTEPAGADORA e VALORINTEGRAL                              |
|                                                                              |
|  - Preenchimento automatico da Data Prevista, apartir do Ano e Mes de        |
|    referencia.                                                               |
|                                                                              |
|  - Inclusão de filtro para o Motivo, para não disponibilizar os motivo de    |
|    Pagamento de Beneficios e Pagamento de Abono Anual.                       |                                                      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 09/04/2002 A 09/04/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12i                                              |
| CLIENTE: (CBS)                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUIR MANUTENÇÃO DA HSTBENEFBFCIARIO E BENEFBFCIARIO NO LOGTOTALPREV     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/05/2002 A 22/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12t                                              |
| CLIENTE: ()                                                                  |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Alteração na procedure qryDetBeforePost, para incluir o campo FLGMANUAL.   |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/07/2002 A 19/07/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.13g                                              |
| CLIENTE: ()                                                                  |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Alteração na procedure qryDetBeforePost, para incluir o campo IDPLANOORIGEM|
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/07/2002 A 26/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|  - Foram colocados seis campos, incluindo-os no UpDateSql, no Grid.          |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 29/07/2002 A 29/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - Alteração de layout de componentes e descrição de labels.                  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 09/08/2002 A 09/08/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ACERTO GRAVAÇÃO DOS CAMPOS VALORINTEGRAL E VALORTOTAL DA HSTBENEFBFCIARIO  |
| INCLUSÃO DO CAMPO VALORSRB DA HSTBENEFBFCIARIO PARA MANUTENÇÃO.              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE 21/08/2002 A 21/08/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ACERTO GRAVAÇÃO DOS CAMPOS VALORTOTAL E VALORATUAL DA BENEFBFCIARIO.       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/10/2003 A 11/10/2003                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO DO MONTA SELECT E DA QUERY DE INFORMAÇÕES DO BENEFICIARIO PARA   |
| INCLUIR IDPLANOORIGEM NO JOIN COM A PARTPREVPLAN.                            |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 03.09.2004 A 03.09.2004                         |
| PENDÊNCIA: 16713                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.13d                                              |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - PERMITIR ALTERAR O FLGBENEFMIN DA BENEFBFCIARIO.                           |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 08.09.2004 A 08.09.2004                         |
| PENDÊNCIA: 17319                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.13d                                              |
| CLIENTE: (BRTPREV)                                                           |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - NOS CASOS QUE A PESSOA É APOSENTADO E PENSIONISTA TRATAR MONTA SELECT PARA |
| TRAZER APENAS OS REGISTROS NA BENEFBFCIARIO PARA O TITULAR SELECIONADO.      |
| INCLUI NO FILTRO DO MONTASELECT A CLAUSULA "V.IDTITULAR = BF.IDTITULAR".     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 08.09.2004 A 08.09.2004                         |
| PENDÊNCIA: 17293                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.13d                                              |
| CLIENTE: (BRTPREV)                                                           |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ABREVIAÇÃO DE NOMENCLATURA DAS DESCRIÇÕES DOS CAMPOS DO MONTA SELECT.      |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 08.09.2004 A 08.09.2004                         |
| PENDÊNCIA: 11845                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.13d                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ELIMINAR A PRÉVIA CASO OCORRA ALGUMA ALTERAÇÃO NO HISTÓRICO DE BENEFÍCIO,  |
| DE FORMA A OBRIGA A REEXECUÇÃO DA PRÉVIA.                                    |
| CONTROLE DA HABILITAÇÃO DO BOTÃO DE EXCLUIR DETALHE.                         |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19.10.2004 A 19.10.2004                         |
| PENDÊNCIA: 17946                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - AJUSTE NO MONTASELECT PARA RETIRAR O JOIN COM A PARTPREVPLAN.              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 24.11.2004 A 24.11.2004                         |
| PENDÊNCIA: 18160                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: REFER                                                               |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - RETIRAR JOIN BF.IDPESSOA = V.IDTITULAR DO MONTASELECT.                     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================}


