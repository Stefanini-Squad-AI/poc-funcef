unit FCancelaEvento;
//***************************************************************************************
//Nº SIG:             90992
//Data da Alteração:  30/08/2019
//Responsável:        Taffarel Sevaybriker
//Descrição:          Erro ao excluir BFCIARIOTITPLAN sem registro na BENEFBFCIARIO.
//***************************************************************************************
//Nº SIG:             83835
//Data da Alteração:  22/03/2019
//Responsável:        Darivaldo Alencar
//Descrição:          Correção de subquery retornando multiplas linhas
//***************************************************************************************
//Nº SIG:             82652
//Data da Alteração:  13/03/2019
//Responsável:        Taffarel Sevaybriker
//Descrição:          Verificar se há contribuição recebida antes de permitir a exclusão.
//***************************************************************************************
//Nº SIG:             78001
//Data da Alteração:  16/11/2018
//Responsável:        Taffarel Sevaybriker
//Descrição:          Excluir somente BFCIARIOTITPLAN atrelada a portabilidade cancelada.
//***************************************************************************************
//Nº SIG:             66641
//Data da Alteração:  24/05/2018
//Responsável:        Luiz Carlos
//Descrição:          Não desmarcar as contribuicoes extraordinarias
//***************************************************************************************
//Nº SIG:             68611
//Data da Alteração:  23/05/2018
//Responsável:        Denis Horongoso
//Descrição:          Excluir somente BFCIARIOTITPLAN atrelada a portabilidade cancelada
//***************************************************************************************
//Nº SIG:             24696
//Data da Alteração:  26/07/2016
//Responsável:        Andre Imakawa
//Descrição:          Sistema está alterando a MATRÍCULA na Elegpatro ao cancelar um
//                    eventos de inscrição.
//**************************************************************************************
//Nº SIG:             21733
//Data da Alteração:  09/06/2016
//Responsável:        Darivaldo Alencar
//Descrição:          Corrigido SQL retornando mais de um resultado na subquery impedindo
//                    exclusão de cancelamento de eventos registrados
//**************************************************************************************
//Nº SOL:             266932-18049
//Nº KINTANA:         1239691
//Data da Alteração:  18/02/2016
//Responsável:        André Imakawa
//Descrição:          Alterado regra que coloca o campo DATADEMISSAO = NULL
//**************************************************************************************
//------------------------------------------------------------------------------
//Pendência   : SOL:257191 PPM:985433
//Responsável : Wylliam Leite da Silva
//Data        : 22/07/2015
//Descrição   : Evento de Portabilidade - Origem EFPC gerando inconsistência na
//              tabela BFCIARIOTITPLAN.
//------------------------------------------------------------------------------
//Pendência   : SOL 260838 KINTANA 1060022
//Responsável : Fernando Xavier
//Data        : 09/09/2015
//Descrição   : Ao registrar evento o sistema altera data de morte indevidamente.
//------------------------------------------------------------------------------
//Pendência   : SOL 252324 KINTANA 784020
//Responsável : William Moreira da Silva
//Data        : 12/05/2015
//Descrição   : FLGDESATIVADO vontando para zero no cancelamento de situações de aposentadoria.
//------------------------------------------------------------------------------
//Pendência   : SOL 247414 KINTANA 657530
//Responsável : Marcio Sanches Spinosa SOL 247414 KINTANA 657530
//Data        : 03/02/2015
//Descrição   : Ajuste para eliminar as horas da data para inserção de dados.
//------------------------------------------------------------------------------
//Pendência   : SOL 221079/15817 KINTANA 2060966
//Responsável : Fernando Xavier
//Data        : 29/01/2012
//Descrição   : Na solicitação 221079 foi solicitado ajuste no cancelamento de
//              evento de Aposentadoria INSS, ocorre que o erro também está
//              ocorrendo ao cancelarmos o evento de Falecimento INSS.
//              Solicitamos a mesma correção para estes casos.
//------------------------------------------------------------------------------
//Pendência   : SOL 234666 PPM 435515
//Responsável : Fernando Xavier
//Data        : 01/07/2014
//Descrição   : Excluindo registro indevido no Modulo de Cadastro.
//------------------------------------------------------------------------------
//Pendência   : SOL 221079 KINTANA 2058169
//Responsável : Fernando Xavier
//Data        : 29/01/2012
//Descrição   : A rotina esta cancelando as contribuições do beneficio FUNCEF
//              ao cancelar um evento de Aposentadoria INSS.
//------------------------------------------------------------------------------
//Pendência   : SOL 211709/15287 KINTANA 2050393
//Responsável : Higor Nayde Ferreira
//Data        : 25/10/2013
//Descrição   : Atividade para liberação de versão 15188.
//              No módulo de BeneficiosPrev realizar apenas o cancelamento dos
//              eventos de IDEVENTOGERADOR = 129 e 130.
//------------------------------------------------------------------------------
//Pendência   : SOL 204820 KINTANA 1992519
//Responsável : Otacilio
//Data        : 30/04/2013
//Descrição   : Ao desfazer um evento de "Cancelamento por inadimplência" o
//              campo FLGDESATIVADO da tabela PARTPREVPLAN não retornava com
//              o valor Zero(0).
//------------------------------------------------------------------------------
//Pendência   : SOL 202320 KINTANA 1958012
//Responsável : Thiago Melo
//Data        : 12/03/2013
//Descrição   : Alteração de fonte de Labels.
//------------------------------------------------------------------------------
//Pendência   : SOL 198981 Kintana 1914169
//Responsável : Otacilio Aquino
//Data        : 17/01/2013
//Descrição   : Erro ao Cancelar Evento
//------------------------------------------------------------------------------
//Pendência   : SOL 191332 Kintana 1811580
//Responsável : William Moreira
//Data        : 27/09/2012
//Descrição   : ERRO DE "FALTA EXPRESSÃO" NO MOMENTO DE CANCELAR EVENTO REGISTRADO
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 181739 Kintana 1690396
//Responsável : Fanuel Marinho
//Data        : 12/06/2012
//Descrição   : Ao cancelar o evento, o sistema não está desfazendo todas as tabelas(BFCIARIOTITPLAN).
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 169506 KINTANA 1502140
//Responsável : Fanuel Junior
//Data        : 29/11/2011
//Descrição   : Erro ao cancelar para participantes em dois planos
//-------------------------------------------------------------------------------------------------
//Pendência   : SOL 178017 KINTANA 1634206
//Responsável : Vinicius Ferreira
//Data        : 12/04/2012
//Descrição   : Correção SOL 159477.
//-------------------------------------------------------------------------------------------------
//Pendência   : SOL 159477 KINTANA 1319244
//Responsável : Wylliam Leite da Silva
//Data        : 13/02/2012
//Descrição   : Foi criada uma query que fazer um update no campo FLGISENTOIRRF da tabela PESSOAFISICA
//              Com o valor do campo  FLGISENTOIRRFANT da tabela Benefbficiario onde foi armazenado
//              o valor anterior a concessão do beneficio.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 172388 KINTANA 1550574
//Responsável : Fernando Xavier
//Data        : 19/01/2012
//Descrição   : Inconsistência ao desfazer um registro de evento de resgate
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 166099 KINTANA 1444102
//Responsável : Fernando Xavier
//Data        : 05/10/2011
//Descrição   : Evento de Portabilidade gerando inconsistência na tabela BFCIARIOTITPLAN.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 164210 KINTANA 1408631
//Responsável : Fernando Xavier
//Data        : 21/07/2011
//Descrição   : erro na funcionalidade Desfazer eventos cadastrados.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 161839 KINTANA 1369298
//Responsável : Fernando Xavier
//Data        : 21/07/2011
//Descrição   : Verificado e corrigido erro no cancelamento de eventos.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 161500 KINTANA 1362243
//Responsável : BRUNO AZEVEDO
//Data        : 14/07/2011
//Descrição   : Ajuste no desfazer os eventos de benefícios.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 141727 KINTANTA 900601
//Responsável : BRUNO AZEVEDO
//Data        : 27/04/2011
//Descrição   : Ajuste no desfazer os eventos de benefícios.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Data        : 06/08/2010
// Pendência   : SOL 141131 Kintana 890567
// Descricao   : Erro ao excluir registro da CONTRIBPREVPARTP
//--------------------------------------------------------------------------------------------------
// Rotina      : Diversas
// Autor(a)    : Daniel Begnami
// Data        : 09/02/2009
// Pendência   : SOL: 107482
// Descricao   : Erro de constraints na exclusão do nucleo familiar.
//--------------------------------------------------------------------------------------------------
// Rotina      : Varias
// Autor(a)    : Claudio Faria
// Data        : 16/08/2007
// Pendência   : 19962
// Descricao   : Troca do DateToStr para FormatDateTime
//--------------------------------------------------------------------------------------------------
// Rotina      : MontaSelectPart
// Autor(a)    : Augusto
// Data        : 08/08/2007
// Pendência   : 25670
// Descricao   : Ao desfazer evento, zerar campos da PARTPREVPLAN 
//--------------------------------------------------------------------------------------------------
// Rotina      : MontaSelectPart
// Autor(a)    : Augusto
// Data        : 08/05/2007
// Pendência   : 25290
// Descricao   : Retirado filtro de plano desativado
//               ((PARTPREVPLAN.FLGDESATIVADO   = 0) OR (EVENTOGERADOR.FLGINTERNO IN ('CA','TP') ))
//--------------------------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : André Pontes
// Data        : 07/11/2006
// Pendência   : 18949
// Descricao   : Se o evento for de resgate, limpar o campo VALORCOTASIR
//--------------------------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : André Pontes
// Data        : 03/11/2006
// Pendência   : -
// Descricao   : Alterado o momento de início da transação
//               Da forma como estava, a quitação de um empréstimo poderia ser desfeita sem que o
//               evento de resgate o fosse.
//--------------------------------------------------------------------------------------------------
// Rotina      : MontaSelectPart
// Autor(a)    : Gleyber
// Data        : 27/09/2006
// Pendência   : 23400
// Descricao   : Ordenação e apresentação correta do MONTASELECT
//------------------------------------------------------------------------------
// Rotina      : bbtnProcurar
// Autor(a)    : Claudio Faria
// Data        : 11/08/2006
// Pendência   : 22955
// Descricao   : Inclui critica para o flag "flgCancelamento"
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Gleyber
// Data        : 01/08/2006
// Pendência   : 22955
// Descricao   : Acerto no MontaSelectPart
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : André Pontes
// Data        : 20/07/2006
// Pendência   : 22507
// Descricao   : Não permitir cancelar se participante já tiver contribuição recebida: alteração
//               da query para busca contribuição efetivamente recebida, e ligada a algum evento.
//------------------------------------------------------------------------------
// Rotina      : MontaSelect
// Autor(a)    : Gleyber
// Data        : 28/06/2006
// Pendência   : 21909
// Descricao   : Alteração de filtro no montaselect
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Augusto
// Data        : 05/06/2006
// Pendência   : 22507
// Descricao   : Não permitir cancelar se participante já tiver contribuição recebida.
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : leofuncef
// Data        : 31/01/2006
// Pendência   : 21410
// Descricao   : ao desfazer evento com benefícios relacionados, verificar se já houve pagamento
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Gleyber
// Data        : 23/12/2005
// Pendência   : 21089
// Descricao   : Retirado o comentário, da pendência abaixo, da rotina DesfazQuitacaoMutuario.
//               Alteração da query para pegar a data de quitação.
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick, FormCreate, FormClose
// Autor(a)    : Leo
// Data        : 10/10/2005 - 18/10/2005
// Pendência   : 19965
// Descricao   : [COMENTADO ESPERANDO MODifICAÇÃO NA BPL DO EMPRÉSTIMO]
//               alteração para desfazer a quitação de empréstimo caso está tenha sido gerada
//               pelo evento, por exemplo, um resgate proveniente de demissão.
//------------------------------------------------------------------------------
// Rotina      : CancelaOutrosEventos
// Autor(a)    : Augusto
// Data        : 03/02/2005
// Pendência   : 17459
// Descricao   : Retornar Matricula ao desfazer
//------------------------------------------------------------------------------
// Rotina      : ApagaSalarios
// Autor(a)    : Gleyber
// Data        : 01/12/2004
// Pendência   : 18182
// Descricao   : Acerto para apagar salário gerados para 13º.
//------------------------------------------------------------------------------
// Rotina      : Diversas
// Autor(a)    : Camille
// Data        : 08.10.2004
// Pendência   : 17551
// Descricao   : Substituicao das units do back pelas de 3 camadas :
//                        U D o c u m e n t o    -> U C t r l D o c u m e n t o
//                        U L a n c C o n t a b  -> U C t r l L a n c a m e nt o
//------------------------------------------------------------------------------
//  Autor      : Augusto
//  Rotina     : bbtnConfirmarClick
//  Data       : 13/09/2004
//  Descrição  : Verificar se o processo já foi efetivado (pago) caso sim. não permite
//               cancelar
//------------------------------------------------------------------------------
//  Autor      : Leo
//  Rotina     : VerificaEvolucaoPens
//  Data       : 30.08.2004
//  Descrição  : verifica se existem processos a serem desfeitos, caso não, sai
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : ------
//  Data       : 24.08.2004
//  Pendencia  : 17449
//  Descrição  : Acerto no desfazer retorno de mantido para ativo
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : ------
//  Data       : 19.08.2004
//  Pendencia  : ------
//  Descrição  : 1. Desfazer geração de nucleos familiares
//               2. Tratar contribuicoes descartadas na devolucao
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : CancelaOutrosEventos
//  Data       : 19.04.2004
//  Pendencia  : 16571
//  Descrição  : Exclusao/estorno de documentos de contribuicoes já enviadas
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : CancelaOutrosEventos
//  Data       : 13.04.2004
//  Pendencia  : 16409
//  Descrição  : Tratamento de acerto de contribuicoes já existentes no historico
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 24/12/2003
// Pendencia   : 15831
// Rotina      : qryUltEventoGerador
// Descrição   : Incluído um TO_CHAR no campo TRGDTINCLUSAO.
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 22.12.2003
// Pendencia   : 15518
// Rotina      : CancelaOutrosEventos
// Descrição   : Tratar limpeza do campo DATACANCELAMENTO
//------------------------------------------------------------------------------
// Autor(a)    : Carlos Guedes
// Data        : 30/09/2003
// Pendencia   : 15053
// Rotina      : CancelaOutrosEventos
// Descrição   : Caso o evento cancelado tenha inserido uma linha na HISTFUNCPREV,
//               o processo deve excluí-lo. (EVENTOGERADOR.FLGINCLUIHISTFUNC = 1)
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 17.09.2003
// Pendencia   : 15021
// Rotina      : CancelaOutrosEventos
// Descrição   : retirei o close da qryDesfazDocumentos e coloquei o cancelupdates
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 21.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina      : CancelaOutrosEventos
// Autor(a)    : Gleyber
// Data        : 30/05/2003
// Alteração   : Correção no IDPESSOA da query para desfazer reserva coletiva
//------------------------------------------------------------------------------
// Rotina      : CancelaOutrosEventos
// Autor(a)    : Gleyber
// Data        : 07/05/2003
// Alteração   : Implementação do desfazer contabilização de envio no desfazer evento
//------------------------------------------------------------------------------
// Rotina      : CancelaOutrosEventos
// Autor(a)    : Leo
// Data        : 02/05/2003
// Alteração   : acerto na rotina de atualização de reservas
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Augusto
// Data        : 07/04/2003
// Alteração   : Quando da confirmação de exclusao de Processos, o sistema não respeitava
//               a opção escolhida.
//------------------------------------------------------------------------------
// Rotina      : CancelaOutrosEventos
// Autor(a)    : Leo
// Data        : 24/03/2003
// Alteração   : modificação para apagar data de demissão caso desfazer de
//               eventos de demissão
//------------------------------------------------------------------------------
// Rotina      : qryProcessoBenef
// Autor(a)    : Camille
// Data        : 17.01.2003
// Alteração   : Exclusao da linha de join pelo IDPLANOORIGEM
//------------------------------------------------------------------------------
// Rotina      : bbtnProcurarClick
// Autor(a)    : Gleyber
// Data        : 20/12/2002
// Alteração   : Procura evento por data de registro
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Leo
// Data        : 13/11/2002
// Alteração   : exclusão das rubricas individuais
//------------------------------------------------------------------------------
// Função : CancelaEventoRetornoParaAtivo
// Autor  : Leo
// Data   : 22/10/2002
// Motivo : acerto geral da função
// -----------------------------------------------------------------------------
// Função : bbtnConfirmarClick
// Autor  : Leo
// Data   : 22/10/2002
// Motivo : verificação se o evento de inscrição foi precedido de um retorno de
//          mantido para ativo. Isso quer dizer que o evento retorno de mantio para
//          ativo deve ser desfeito.
// -----------------------------------------------------------------------------
// Função : bbtnConfirmarClick
// Autor  : Leo
// Data   : 22/10/2002
// Motivo : inclusão do IDPATRO na cláusula WHERE na verificação de contrato de empréstimo
// -----------------------------------------------------------------------------
// Função : bbtnProcurarClick
// Autor  : Carlos Guedes
// Data   : 21/10/2002
// Motivo : troquei de DATAREGISTRO para DATAEFETIVADO
// -----------------------------------------------------------------------------
// Função : CancelaEventoRetornoParaAtivo
// Autor  : Carlos Guedes
// Data   : 05/09/2002
// Motivo : Função específica para o evento de retorno para ativo.
// -----------------------------------------------------------------------------
// Autor  : Carlos Guedes
// Data   : 19/07/2002
// Motivo : Ao Desfazer um processo de um beneficio de pagto. único excluir
//          a evolução funcional dos penionistas do titular.
// -----------------------------------------------------------------------------
// Autor  : Leo
// Data   : 05/06/2002
// Motivo : Alteração da função ApagaSalarios, acrescentando o idmotivo para casos
//          de salário de manutanção
// -----------------------------------------------------------------------------
// Autor  : Carlos Eduardo Guedes
// Data   : 15/10/2001
// Motivo : Consulta retorna várias linhas de PARTPREVPLAN com situações diferentes
//          para o mesmo participante.
// -----------------------------------------------------------------------------
// Autor  : Carlos Eduardo Guedes
// Data   : 18/10/2001
// Motivo : Voltou a situação anterior.
// -----------------------------------------------------------------------------
// Autora      : Camille
// Data        : 05.04.2002
// Alteração   : Se o evento gerou um encerramento de benefício, desfazer o
//               encerramento
// -----------------------------------------------------------------------------
// Autora      : Camille
// Data        : 22.04.2002
// Alteração   : Acerto na rotina de cancelamento de evento do tipo Transferencia
//               de plano
// -----------------------------------------------------------------------------
// Autora      : Camille
// Data        : 23.04.2002
// Alteração   : Se for cancelamento de inscricao verificar se participante está
//               no assistencial ou no emprestimo no plano que está sendo cancelado.
//               Se tiver, não permitir cancelamento


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Mask, wwdbedit, ComCtrls, Buttons, UConsPart, StdCtrls,
  MontaSelect, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid,
  DBCtrls, Machklb, checklst, UCtrlDocumento, UCtrlLancamento;

type
  TfrmCancelaEvento = class(TfrmOkCancelar)
    qryContribAssociar: TwwQuery;
    qryUltEventoGerador: TwwQuery;
    dtsUltEventoGerador: TwwDataSource;
    qryGrava: TwwQuery;
    qryAux: TwwQuery;
    MontaSelectPart: TMontaSelect;
    lblValores: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    lblPatro: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    edNome: TEdit;
    edPatro: TEdit;
    edMatricula: TEdit;
    edPlano: TEdit;
    Panel5: TPanel;
    Label1: TLabel;
    lblSitPatro: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    edInscNumero: TEdit;
    edSitPatro: TEdit;
    edSitPlano: TEdit;
    edSitFundacao: TEdit;
    Panel3: TPanel;
    ConsPart1: TConsPart;
    bbtnProcurar: TBitBtn;
    bbtnOpcoes: TBitBtn;
    pnlInformacao: TPanel;
    Label10: TLabel;
    dbedtEvento: TwwDBEdit;
    DBText1: TDBText;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    dbedDataRegistro: TwwDBEdit;
    Label9: TLabel;
    dbedDataEfetivado: TwwDBEdit;
    qryProcessoBenef: TwwQuery;
    dbchkEfetivado: TDBCheckBox;
    chkAcoes: TCMchklistbox;
    qryContribEvento: TwwQuery;
    qryVerificaDataFinal: TwwQuery;
    qryLogOcorrencia: TwwQuery;
    qryEventoTransfPlano: TwwQuery;
    qryDesfazDocumentos: TwwQuery;
    updDesfazDocumentos: TUpdateSQL;
    qryAux2: TwwQuery;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    Procedure VerificaEvolucaoPens;
    Function VerificaEventoMigrado(pIdEventosPrev: String): Boolean;
    Function VerificaEventoINSS(pIdEventoGerador: String): Boolean;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MontaSelectPartBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
  private
    { Private declarations }
    CtrlDocumento           : TCtrlDocumento; 
    CtrlLancamento          : TCtrlLancamento;
    iIdEventoPrev: integer;


    sIdEventosPrev, sFlgMigrado,
    sIdPessoa, sIdPessJur, sIdPlanoPrev, sSeqProposta: String;
    sIdSitFunc, sIdSitPart, sIdSitPlanoPrev: String;
    sFlgSitFuncImed, sFlgSitPartImed, sFlgSitPlanoImed: String;
    sFlgEfetivado, sDataEfetivado: String;
    bAltera: boolean;
    sEstadoEvento: String;
    sResultadoRegra: String;
    rOpcao1,               rOpcao2,                  rOpcao3               : real;

    sNumerosProcesso : String;

    sTempoAfastado : String;
    iNumOpcoesPatro : word;
    bObrigaOpPatro1,
    bObrigaOpPatro2,
    bObrigaOpPatro3 : boolean;

    procedure LimpaCampos;
    procedure VerificaEstadoEvento;
    function  CancelaEventoTransferenciaPlano : boolean;
    function  CancelaOutrosEventos : boolean;
    function  PreencheAcoes : boolean;
    function  ApagaSalarios (piIdPessJur, piIdPessoa : longint;
                             psAnoInicio, psAnoFinal, sIdRubrica : String) :boolean;

    Function CancelaEventoRetornoParaAtivo ( sIdPatroAntiga, sIdPlanoPrevAntigo : String) : Boolean;

    // PermiteCancelamentoDoEvento: Evento Retorno de Mantido para Ativo.
    Function PermiteCancelamentoDoEvento: Boolean;

    
    Function BeneficioJaPago: Boolean;


  public
    { Public declarations }
  end;

var
  frmCancelaEvento: TfrmCancelaEvento;

implementation

uses
  UAdmPrev, UDataBase, UMensErro, FTelaAut, DBaseDados, FCadContribParticipante,
  UMovReserva, FMostraContribuicoes, UEventos, UParticipante, UContribuicaoPrev,
  FCadOpcoesElegivel, UBeneficio, USistema, DAPrev,  DDividaEP, UIntegraEP;

{$R *.DFM}

procedure TfrmCancelaEvento.LimpaCampos;
begin
  edNome.Text        := '';
  edMatricula.Text   := '';
  edPatro.Text       := '';
  edPlano.Text       := '';
  edSitPatro.Text    := '';
  edSitFundacao.Text := '';
  edSitPlano.Text    := '';
  edInscNumero.Text  := '';
  dbedtEvento.Text := '';
  chkAcoes.Items.Clear;

  bbtnProcurar.SetFocus;
  ConsPart1.Enabled := false;
  bbtnOpcoes.enabled := false;
end;

procedure TfrmCancelaEvento.VerificaEstadoEvento;
begin
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT EP.FLGEFETIVADO, EG.IDEVENTOGERADOR ' +
                 ' FROM EVENTOGERADOR EG, EVENTOSPREV EP ' +
                 ' WHERE EG.FLGINTERNO = ' + '''' + sFlgInterno + '''' + ' AND ' +
                 '       EG.IDEVENTOGERADOR = EP.IDEVENTOGERADOR AND ' +
                 '       EP.SEQPROPOSTA     = ' + sSeqProposta + ' AND ' +
                 '       EP.IDPESSJUR       = ' + sIdPessJur   + ' AND ' +
                 '       EP.IDPLANOPREV     = ' + sIdPlanoPrev + ' AND ' +
                 '       EP.IDPESSOA        = ' + sIdPessoa);
  try
     qryAux.Open;
  except
     on E:EDBEngineError do
       begin
            MostrarErro(E);
            Exit;
       end;
  end;

  if qryAux.IsEmpty then
     sEstadoEvento := 'NAO REGISTRADO' // Pode Inserir
  else
  if qryAux.FieldByName('FLGEFETIVADO').AsString = '0' then
     begin
          sEstadoEvento := 'REGISTRADO'; // Pode Alterar
          sIdEventoGerador := qryAux.FieldByName('IDEVENTOGERADOR').AsString;
     end
  else
     sEstadoEvento := 'EFETIVADO' // Não pode Alterar, nem inserir um novo
end;

function  TfrmCancelaEvento.PreencheAcoes : boolean;
begin
   Result := False;

   chkAcoes.Items.Clear;

   if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
   begin

     if qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'FL'
     then chkAcoes.Items.Add('Apagar data do falecimento. ');

     chkAcoes.Items.Add('Voltar Situação na Patrocinadora para : '+qryUltEventoGerador.FieldByName('DescSitFunc').AsString);

     chkAcoes.Items.Add('Voltar Situação no Plano para : '+qryUltEventoGerador.FieldByName('DescSitPlanoPrev').AsString);

     chkAcoes.Items.Add('Voltar Situação na Fundação para : '+qryUltEventoGerador.FieldByName('DescSitPart').AsString);

   end
   else
   begin
      chkAcoes.Items.Add('Cancelando o Evento '+qryUltEventoGerador.FieldByName('NOME').AsString);
   end;

   if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
   begin
       qryAux.Close;
       qryAux.SQL.Clear;
       qryAux.SQL.Add(' SELECT C.NOME FROM CONTRIBUICAO C, CONTRIBPREVPARTP CPP '+
                      ' WHERE CPP.IDPESSOA = '+sIdPessoa+
                      ' AND   CPP.IDPESSJUR = '+sIdPessJur+
                      ' AND   CPP.IDPLANOPREV = '+sIdPlanoPrev+
                      ' AND   CPP.FLGCOBRA = 1 '+
                      ' AND   CPP.IDCONTRIBUICAO = C.IDCONTRIBUICAO '+
                      //Luiz Carlos - SIG66641 - Inicio
                      ' AND C.IDTPCONTRIBUICAO NOT IN(1,2,4) '+
                      //Luiz Carlos - SIG66641 - Fim
                      ' ORDER BY C.NOME ');
       qryAux.Open;
       if not qryAux.IsEmpty
       then begin
          chkAcoes.Items.Add('Encerrar cobrança das seguintes contribuições : ');
          qryAux.First;
          while not qryAux.Eof do
          begin
             chkAcoes.Items.Add('          '+qryAux.FieldbyName('Nome').AsString);
             qryAux.Next;
          end; // while not qryAux.Eof
       end; // if not qryAux.IsEmpty
   end;
   qryAux.Close;

   if not qryContribAssociar.IsEmpty
   then begin
      chkAcoes.Items.Add('Iniciar cobrança das seguintes contribuições : ');
      qryContribAssociar.First;
      while not qryContribAssociar.Eof do
      begin
         chkAcoes.Items.Add('          '+qryContribAssociar.FieldbyName('Nome').AsString);
         qryContribAssociar.Next;
      end; // while not qryAux.Eof
   end;

   if not qryProcessoBenef.IsEmpty
   then begin
      chkAcoes.Items.Add('Cancelar requerimento dos seguintes processos  : ');
      qryProcessoBenef.First;
      while not qryProcessoBenef.Eof do
      begin
         chkAcoes.Items.Add('          '+'Processo No. '+qryProcessoBenef.FieldbyName('NumeroProcesso').AsString);
         qryProcessoBenef.Next;
      end; // while not qryAux.Eof
   end;
   Result := True;
end;
function  TfrmCancelaEvento.ApagaSalarios (piIdPessJur, piIdPessoa : longint;
                             psAnoInicio, psAnoFinal, sIdRubrica : String) :boolean;
Var
 sMes13 : String;
begin

  Result := False;


  if ( Trim(sIdRubrica) = '') or (Trim(psAnoInicio) = '') or (Trim(psAnoFinal) = '')
  then begin
     Result := True;
     Exit;
  end;

  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.Sql.Add(' DELETE FROM  HISTRUBSAL '+
                   ' WHERE IDPESSOA    = '+IntToStr(piIdPessoa)+
                   ' AND   IDPESSJUR   = '+IntToStr(piIdPessJur)+
                   ' AND   ((IDRUBRICA   = '+sIdRubrica+') '+
                   '       OR (IDMOTIVO = '''+IntToStr(prmIdMotivoSalManut)+'''))'+
                   ' AND   IDMODULO    = '+IntToStr(Sistema.IdModulo)+
                   ' AND   MES >= '''+psAnoInicio+ ''''+
                   ' AND   MES <= '''+psAnoFinal+ '''');
  try
     qryGrava.ExecSQL;
  except
     on E:EDBEngineError do
     begin
        dtmBaseDados.dbBaseDados.RollBack;
        MostrarErro(E);
        Exit;
     end;
  end;

  
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT MESREFERENCIA');
  qryAux.SQL.Add('FROM PARAMSAL13');
  qryAux.SQL.Add('WHERE IDPESSJUR      = '+ IntToStr(piIdPessJur));
  qryAux.SQL.Add('  AND EXERCICIO     >= '+ Copy(psAnoInicio,1,4));
  qryAux.SQL.Add('  AND EXERCICIO     <= '+ Copy(psAnoFinal,1,4));
  qryAux.SQL.Add('  AND MESREFERENCIA >= '+ QuotedStr(psAnoInicio));
  qryAux.SQL.Add('  AND MESREFERENCIA <= '+ QuotedStr(psAnoFinal));
  qryAux.Open;

  While Not qryAux.Eof do
   begin
    sMes13 := Copy(qryAux.FieldByName('MESREFERENCIA').AsString,1,5)+'13';

    qryGrava.Close;
    qryGrava.Sql.Clear;
    qryGrava.Sql.Add('DELETE FROM  HISTRUBSAL');
    qryGrava.Sql.Add('WHERE ( IDPESSOA    = '+IntToStr(piIdPessoa)+ ')');
    qryGrava.Sql.Add('  AND ( IDPESSJUR   = '+IntToStr(piIdPessJur)+ ')');
    qryGrava.Sql.Add('  AND ((IDRUBRICA   = '+sIdRubrica+')  OR ' );
    qryGrava.Sql.Add('       (IDMOTIVO    = ' + QuotedStr(IntToStr(prmIdMotivoSalManut))+') )');
    qryGrava.Sql.Add('  AND ( IDMODULO    = '+IntToStr(Sistema.IdModulo)+' )');
    qryGrava.Sql.Add('  AND ( MES         = '+ QuotedStr(sMes13)+ ' )');
    qryGrava.Sql.Add('  AND ( MESCOBRANCA = '+ QuotedStr(qryAux.FieldByName('MESREFERENCIA').AsString)+ ' )');

    Try
       qryGrava.ExecSQL;
    Except
       On E:EDBEngineError do
       begin
          dtmBaseDados.dbBaseDados.RollBack;
          MostrarErro(E);
          Exit;
       end;
    end;

    qryAux.Next;

   end;

  Result := True;
end; // ApagaSalarios

procedure TfrmCancelaEvento.bbtnProcurarClick(Sender: TObject);
begin
  inherited;

  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     sIdPessoa          := MontaSelectPart.ValoresChave[0];
     sIdPessJur         := MontaSelectPart.ValoresChave[1];
     sIdPlanoPrev       := MontaSelectPart.ValoresChave[2];
     sIdSitFunc         := MontaSelectPart.ValoresChave[16];
     sIdSitPart         := MontaSelectPart.ValoresChave[17];
     sIdSitPlanoPrev    := MontaSelectPart.ValoresChave[18];
     sSeqProposta       := MontaSelectPart.ValoresChave[19];
     edNome.Text        := MontaSelectPart.ValoresChave[3];
     edMatricula.Text   := MontaSelectPart.ValoresChave[4];
     edPatro.Text       := MontaSelectPart.ValoresChave[5];
     edPlano.Text       := MontaSelectPart.ValoresChave[6];
     edSitPatro.Text    := MontaSelectPart.ValoresChave[7];
     edSitFundacao.Text := MontaSelectPart.ValoresChave[8];
     edSitPlano.Text    := MontaSelectPart.ValoresChave[9];
     edInscNumero.Text  := MontaSelectPart.ValoresChave[12];


     if Trim(MontaSelectPart.ValoresChave[20]) = ''
     then iNumOpcoesPatro    := 0
     else iNumOpcoesPatro    := StrToInt(MontaSelectPart.ValoresChave[20]);
     bObrigaOpPatro1         := (Trim(MontaSelectPart.ValoresChave[21]) = '1');
     bObrigaOpPatro2         := (Trim(MontaSelectPart.ValoresChave[22]) = '1');
     bObrigaOpPatro3         := (Trim(MontaSelectPart.ValoresChave[23]) = '1');

     if Trim(MontaSelectPart.ValoresChave[24]) <> ''
     then rOpcao1 := StrToFloat(ClienteNumero(MontaSelectPart.ValoresChave[24]))
     else rOpcao1 := 0;

     if Trim(MontaSelectPart.ValoresChave[25]) <> ''
     then rOpcao2 := StrToFloat(ClienteNumero(MontaSelectPart.ValoresChave[25]))
     else rOpcao2 := 0;

     if Trim(MontaSelectPart.ValoresChave[26]) <> ''
     then rOpcao3 := StrToFloat(ClienteNumero(MontaSelectPart.ValoresChave[26]))
     else rOpcao3 := 0;

     sIdEventosPrev := MontaSelectPart.ValoresChave[29];
     sFlgMigrado    := MontaSelectPart.ValoresChave[30];

     pnlInformacao.Enabled := True;
     bbtnConfirmar.Enabled := True;
     bbtnCancelar.Enabled  := True;

     ConsPart1.sIdPessoa := sidpessoa;
     ConsPart1.sSeqProposta := sseqproposta;
     ConsPart1.sIdPlanoprev := sidplanoprev;
     ConsPart1.DataBaseName := 'BaseDados';
     ConsPart1.sIdPessjur := sidpessjur;
     ConsPart1.Enabled := true;
     bbtnOpcoes.enabled := true;

{     // Procurar o Ultimo Evento Gerador da pessoa
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT MAX(EP.IDEVENTOSPREV) AS IDEVENTOSPREV, MAX(EP.DATAEFETIVADO) AS DATAEFETIVADO '+
                    ' FROM   EVENTOSPREV EP                         '+
                    ' WHERE  EP.IDPLANOPREV    = '+sIdPlanoPrev+
                    ' AND    EP.IDPESSOA       = '+sIdPessoa+
                    ' AND    EP.IDPESSJUR      = '+sIdPessJur+
                    ' AND    EP.DATAREGISTRO IN ( SELECT MAX(DATAREGISTRO) FROM EVENTOSPREV '+
                    '                             WHERE  IDPLANOPREV    = '+sIdPlanoPrev+
                    '                             AND    IDPESSOA       = '+sIdPessoa+
                    '                             AND    IDPESSJUR      = '+sIdPessJur+') '+
                    ' GROUP BY DATAEFETIVADO, IDEVENTOSPREV'+
                    ' ORDER BY IDEVENTOSPREV DESC');
     qryAux.Open;


     if qryAux.RecordCount > 1
      then begin



      end;

     if (qryAux.IsEmpty) OR (qryAux.FieldByName('IdEventosPrev').AsString = '')
     then begin
        MsgDlg('Nenhum evento foi encontrado para este participante. Verifique. ','Informação',mtInformation,[mbOk],0);
        LimpaCampos;
        Exit;
     end;

     if VerificaEventoMigrado(qryAux.FieldByName('IdEventosPrev').AsString) then
     begin
        MsgDlg(' Este evento NÃO foi gerado pelo sistema.'+#13+
               ' Não poderá ser cancelado. ','Aviso',mtWarning,[mbOk],0);
        LimpaCampos;
        Exit;
     end;

     sIdEventosPrev := qryAux.FieldByName('IdEventosPrev').AsString;
     qryAux.Close;
 }


     if trim(sFlgMigrado) = '1' then
     begin
        MsgDlg(' Este evento NÃO foi gerado pelo sistema.'+#13+
               ' Não poderá ser cancelado. ','Aviso',mtWarning,[mbOk],0);
        LimpaCampos;
        Exit;
     end;

     // SELECIONA O ULTIMO EVENTO GERADOR E SUA SITUACÃO
     qryultEventoGerador.Close;
     qryultEventoGerador.ParamByName('IDEVENTOSPREV').AsInteger := strtoint(sIdEventosPrev);
     qryultEventoGerador.Open;
     if qryUltEventoGerador.IsEmpty
     then  begin
        MsgDlg('Nenhum evento foi encontrado para este participante. Verifique. ','Informação',mtInformation,[mbOk],0);
        LimpaCampos;
        Exit;
     end;


     if qryUltEventoGerador.FieldByName('FLGCANCELAMENTO').AsInteger = 0
     then begin
        MsgDlg('Esse evento não pode ser desfeito pelo sistema','Aviso',mtInformation,[mbOk],0);
        bbtnProcurar.SetFocus;
        Exit;
     end;
     

     bAltera := False;
     // Abrir query de contribuicoes a reassociar
     qryContribAssociar.Close;
     qryContribAssociar.ParamByName('IDEVENTOSPREV').AsInteger := qryultEventoGerador.FieldByName('IDEVENTOSPREV').AsInteger;
     qryContribAssociar.Open;

     qryVerificaDataFinal.Close;
     qryVerificaDataFinal.ParamByName('IDEVENTOSPREV').AsInteger := qryultEventoGerador.FieldByName('IDEVENTOSPREV').AsInteger;
     qryVerificaDataFinal.Open;

     // Abrir query de beneficios a encerrar
     qryProcessoBenef.Close;
     qryProcessoBenef.ParamByName('IdEventoGerador').AsInteger := qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsInteger;
     qryProcessoBenef.ParamByName('IdPessoa').AsInteger        := qryultEventoGerador.FieldByName('IdPessoa').AsInteger;
     qryProcessoBenef.ParamByName('IdPessJur').AsInteger       := qryultEventoGerador.FieldByName('IdPessJur').AsInteger;
     qryProcessoBenef.ParamByName('DataRegistro').AsString     := qryultEventoGerador.FieldByName('DataRegistro').AsString;
     qryProcessoBenef.ParamByName('IdPlanoPrev').AsInteger     := qryultEventoGerador.FieldByName('IdPlanoPrev').AsInteger;//Fanuel Junior SOL 169506 KINTANA 1502140
     qryProcessoBenef.Open;

     // Preencher acoes para o evento
     if not PreencheAcoes
     then begin
        LimpaCampos;
        Exit;
     end;
  end;

end;



procedure TfrmCancelaEvento.bbtnConfirmarClick(Sender: TObject);
var
  sSQL                : String;
  sIdPatroAntiga      : String;
  sIdPlanoPrevAntigo  : String;
  sPessoaFLGISENTOIRR : String;
  ExcluiTitPlan       : Boolean; //TAES - SIG90992
  BenefExclui         : String; //TAES - SIG90992
begin
  inherited;

  qryProcessoBenef.Close;
  qryProcessoBenef.ParamByName('IdEventoGerador').AsInteger := qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsInteger;
  qryProcessoBenef.ParamByName('IdPessoa').AsInteger        := qryultEventoGerador.FieldByName('IdPessoa').AsInteger;
  qryProcessoBenef.ParamByName('IdPessJur').AsInteger       := qryultEventoGerador.FieldByName('IdPessJur').AsInteger;
  qryProcessoBenef.ParamByName('DataRegistro').AsString     := qryultEventoGerador.FieldByName('DataRegistro').AsString;
  qryProcessoBenef.ParamByName('IdPlanoPrev').AsInteger     := qryultEventoGerador.FieldByName('IdPlanoPrev').AsInteger;//Fanuel Junior SOL 169506 KINTANA 1502140
  qryProcessoBenef.Open;
  sNumerosProcesso := '';
  while not qryProcessoBenef.Eof do
  begin
        sNumerosProcesso := sNumerosProcesso+','+qryProcessoBenef.FieldByName('NumeroProcesso').AsString;
        qryProcessoBenef.Next;
  end;

  sNumerosProcesso := Copy(sNumerosProcesso,2,length(sNumerosProcesso)-1);
  if trim(sNumerosProcesso) = '' then sNumerosProcesso := '0';  // SOL 234666 PPM 435515

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.text := '  SELECT 1 FROM BENEFBFCIARIO '+
                        '  WHERE NUMEROPROCESSO IN ('+sNumerosProcesso+') ';
  qryAux.open;

  if (not(qryAux.IsEmpty)) and (sistema.IdModulo = 454) then // SOL 234666 PPM 435515
  Begin
     MsgDlg('Existem Operações de Benefícios para o Número de Processo: '+sNumerosProcesso+'.'+#13+
            'A operação de Cancelamento não é permitida para esta situação.','Erro',mtError,[mbOk],0);
     bbtnProcurar.SetFocus;
     Exit;
  end;

  if Trim(edNome.Text) = '' then
  begin
      MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk],0);
      bbtnProcurar.SetFocus;
      Exit;
  end;


  if qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'TP'
  then begin
      MsgDlg('O evento de "Transferência de Plano" deve ser cancelado através do evento "Inscrição" no plano destino. '+#13+
             'Selecione o evento da categoria "Inscrição" no plano destino e cancele este evento. O evento de transferência '+
             'será cancelado automaticamente. ','Aviso',mtInformation,[mbOk],0);
      bbtnProcurar.SetFocus;
      Exit;
  end;

  //TAES - SIG90992 - início
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT BF.IDBENEFICIO  '+
             '         FROM   BENEFBFCIARIO BF JOIN BFCIARIOTITPLAN B' +
             '         ON     BF.IDTITULAR         = B.IDTITULAR  ' +
             '         AND    BF.IDBENEFICIO    = B.IDBENEFICIO' +
             '         WHERE  BF.IDPESSJUR         = ' +qryultEventoGerador.FieldByName('IDPESSJUR').AsString +
             '         AND    BF.NUMEROPROCESSO IN ('+sNumerosProcesso+') ' +
             '         AND    BF.IDPLANOPREV       = ' +qryultEventoGerador.FieldByName('IDPLANOPREV').AsString +
             '         AND    BF.IDTITULAR         = ' +qryultEventoGerador.FieldByName('IDPESSOA').AsString +
             '         AND    BF.SEQPROPOSTA       = ' +qryultEventoGerador.FieldByName('SEQPROPOSTA').AsString);
  qryAux.Open;

  ExcluiTitPlan := (qryAux.IsEmpty);
  BenefExclui   := qryAux.FieldByName('IDBENEFICIO').AsString;
  //TAES - SIG90992 - fim
  
  // Se for cancelamento de inscricao verificar se participante está no assistencial ou no
  // emprestimo no plano que está sendo cancelado. Se tiver, não permitir cancelamento
  if (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'IP') then
  begin

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT PL.NOME FROM PARTASS P, PLANASS PL '+
                     ' WHERE  P.IDPESSJUR   = '+qryUltEventoGerador.FieldByName('IDPESSJUR').AsString+
                     ' AND    P.IDPLANOPREV = '+qryUltEventoGerador.FieldByName('IDPLANOPREV').AsString+
                     ' AND    P.IDPESSOA    = '+qryUltEventoGerador.FieldByName('IDPESSOA').AsString+
                     ' AND    P.SEQPROPOSTA = '+qryUltEventoGerador.FieldByName('SEQPROPOSTA').AsString+
                     ' AND    PL.IDPLANASS  = P.IDPLANASS ');
      qryAux.Open;
      if not qryAux.IsEmpty
      then begin
         MsgDlg('Este participante está vinculado ao Plano Assistencial '+qryAux.FieldByName('NOME').AsString+'.'+
                'A operação de Cancelamento de Inscrição não é permitida para esta situação.','Aviso',mtInformation,[mbOk],0);
         bbtnProcurar.SetFocus;
         Exit;
      end;

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT IDCONTRATOEMPTMO FROM CONTRATOEMPTMO '+
                     ' WHERE  IDPLANOPREV = '+qryUltEventoGerador.FieldByName('IDPLANOPREV').AsString+
                     ' AND    IDPATRO     = '+qryUltEventoGerador.FieldByName('IDPESSJUR').AsString+' '+
                     ' AND    IDPESSOA    = '+qryUltEventoGerador.FieldByName('IDPESSOA').AsString);
      qryAux.Open;
      if not qryAux.IsEmpty
      then begin
         MsgDlg('Este participante possui um Contrato de Empréstimo, Contrato No. '+qryAux.FieldByName('IDCONTRATOEMPTMO').AsString+'.'+#13+
                'A operação de Cancelamento de Inscrição não é permitida para esta situação.','Aviso',mtInformation,[mbOk],0);
         bbtnProcurar.SetFocus;
         Exit;
      end;

      { Não permitir cancelar se participante já tiver }
      { contribuição recebida.                                                     }

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT 1 AS EXISTE FROM HSTCONTRIBPREV '                                       + #13 +
                     ' WHERE  IDPLANOPREV = '+qryUltEventoGerador.FieldByName('IDPLANOPREV').AsString + #13 +
                     ' AND    IDPESSJUR   = '+qryUltEventoGerador.FieldByName('IDPESSJUR').AsString   + #13 +
                     ' AND    IDPESSOA    = '+qryUltEventoGerador.FieldByName('IDPESSOA').AsString    + #13 +

                     ' AND    NVL(VALORRECEBIDO, 0) > 0 '                                             + #13 +
                     ' AND    SITRECEBIMENTO NOT IN (0,1)');


      qryAux.Open;
      if not qryAux.IsEmpty then begin
         MsgDlg('Este participante possui contribuições já recebidas.'+#13+
                'A operação de Cancelamento de Inscrição não é permitida para esta situação.','Aviso',mtInformation,[mbOk],0);
         bbtnProcurar.SetFocus;
         Exit;
      end;


  end;

  // -----------------------------------------------------------------------------------------------

  if not(qryProcessoBenef.IsEmpty) then
  begin
     sNumerosProcesso := '';
     qryProcessoBenef.First;

     while not qryProcessoBenef.Eof do
     begin
        sNumerosProcesso := sNumerosProcesso+','+qryProcessoBenef.FieldByName('NumeroProcesso').AsString;
        qryProcessoBenef.Next;
     end;

     sNumerosProcesso := Copy(sNumerosProcesso,2,length(sNumerosProcesso)-1);



     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.text := '  SELECT 1 FROM HSTBENEFBFCIARIO '+
                        '  WHERE IDPESSJUR = '+qryUltEventoGerador.FieldByName('IDPESSJUR').AsString+
                        '  AND NUMEROPROCESSO IN ('+sNumerosProcesso+') '+
                        '  AND NVL(VLBENEFPGTO,0) > 0 ';
     qryAux.open;

     if not(qryaux.isempty) then
     begin
        MsgDlg('O evento não pode ser desfeito pois já houve pagamento de benefícios para processos relacionados.','Erro',mtInformation,[mbOk],0);
        bbtnProcurar.SetFocus;
        Exit;
     end;

     if MsgDlg('Este evento gerou o(s) seguinte(s) Processo(s) de Benefício : '+#13+
               sNumerosProcesso+'.'+
               'Este(s) processo(s) será(ão) EXCLUÍDO(S). Confirma ? ','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then
     begin
        Repaint;
        Exit;
     end;

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('SELECT DATAPAGAMENTO AS DATAQUITA');
     qryAux.SQL.Add('FROM CTRLINTERFACE');
     //Darivaldo Alencar SIG.21733
     //qryAux.SQL.Add('WHERE IDLOTE = (SELECT DISTINCT IDLOTE');
     qryAux.SQL.Add('WHERE IDLOTE IN (SELECT DISTINCT IDLOTE');
     qryAux.SQL.Add('                FROM HSTBENEFBFCIARIO');
     qryAux.SQL.Add('                WHERE IDPESSJUR = '+qryUltEventoGerador.FieldByName('IDPESSJUR').AsString);
     qryAux.SQL.Add('                  AND NUMEROPROCESSO IN ('+sNumerosProcesso+') )');
     qryAux.open;

     dtmBaseDados.dbBaseDados.StartTransaction; 

     if not(qryaux.isempty) then
     begin
        if dtmDividaEP.DesfazQuitacaoMutuario(qryUltEventoGerador.FieldByName('IDPESSOA').AsInteger,
                                                  qryaux.fieldbyname('DATAQUITA').AsDateTime,
                                                  10) < -1 then
        begin
           MsgDlg('Não foi possível desfazer a quitação que foi efetuada neste evento.','Erro',mtInformation,[mbOk],0);
           dtmBaseDados.dbBaseDados.RollBack;  
           bbtnProcurar.SetFocus;
           Exit;
        end;
     end;

  end

  else
  begin
    dtmBaseDados.dbBaseDados.StartTransaction;
  end;

// Vinicius Ferreira SOL 178017 KINTANA 1634206
if not(qryProcessoBenef.IsEmpty) then
  begin
   {//Wylliam Leite da Silva SOL 159477 KINTANA 1319244 - Inicio
   with qryAux do
   begin
      Close;
      SQL.Clear;
      SQL.Add( '    SELECT FLGISENTOIRRF FROM PESSOAFISICA ');
      SQL.Add( '    WHERE IDPESSOA in(SELECT FLGISENTOIRRFANT From BENEFBFCIARIO WHERE idpessoa = '+sIdPessoa+')');
      Open;
   end;}

   qryAux.Close;
   qryAux.SQL.Clear;
   //qryAux.SQL.Add( '    SELECT FLGISENTOIRRF FROM PESSOAFISICA ');     // William - SOL 191332 Kintana 1811580
   qryAux.SQL.Add( '    SELECT NVL(FLGISENTOIRRF,0) AS FLGISENTOIRRF FROM PESSOAFISICA '); // William - SOL 191332 Kintana 1811580
   qryAux.SQL.Add( '    WHERE IDPESSOA  = '+sIdPessoa);
   qryAux.open;

   sPessoaFLGISENTOIRR := qryAux.FieldByName('FLGISENTOIRRF').AsString;
 
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add( '    SELECT FLGISENTOIRRFANT From BENEFBFCIARIO ');
   qryAux.SQL.Add( '    WHERE IDPESSOA  = '+sIdPessoa);
   qryAux.SQL.Add( '    AND FLGISENTOIRRFANT  = '+sPessoaFLGISENTOIRR);
   qryAux.SQL.Add( '    And IDPLANOPREV = ' +sIdPlanoPrev);
   qryAux.SQL.Add( '    AND NUMEROPROCESSO IN ('+sNumerosProcesso+')');
   qryAux.open;

   if not(qryaux.isempty) then begin // Vinicius Ferreira SOL 178017 KINTANA 1634206
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add( '    UPDATE PESSOAFISICA SET FLGISENTOIRRF =');
        SQL.Add( '    (SELECT FLGISENTOIRRFANT From BENEFBFCIARIO WHERE idpessoa =' +sIdPessoa);
        SQL.Add( '    And IDPLANOPREV = ' +sIdPlanoPrev);
        SQL.Add( '    AND NUMEROPROCESSO IN ('+sNumerosProcesso+') )');
        SQL.Add( '    WHERE  IDPESSOA = ' +sIdPessoa);
        execSql;
     end;
   end;
end;
//Wylliam Leite da Silva SOL 159477 KINTANA 1319244 - Fim

  // -----------------------------------------------------------------------------------------------
  // Alterado o momento de início da transação
  // Da forma como estava, a quitação de um empréstimo poderia ser desfeita sem que o
  // evento de resgate o fosse.

  // Chamar o cancelamento de evento de qualquer maneira
  //  dtmBaseDados.dbBaseDados.StartTransaction;

  // -----------------------------------------------------------------------------------------------

  //como o evento de retorno de mantido para ativo
  //pode ser para outra patrocinacora
  //o evento mais novo foi de inscrição.
  //procuro o anterior
  qryaux.close;
  qryaux.Sql.Clear;
  qryaux.Sql.Add(' SELECT FLGINTERNO '+
                 ' FROM EVENTOGERADOR '+
                 ' WHERE IDEVENTOGERADOR = '+
                 ' (SELECT IDEVENTOGERADOR '+
                 ' FROM EVENTOSPREV '+
                 ' WHERE IDPESSOA = '+qryultEventoGerador.FieldByName('IDPESSOA').AsString+' AND '+
                 ' IDEVENTOSPREV = (SELECT MAX(IDEVENTOSPREV) '+
                 '                  FROM EVENTOSPREV WHERE '+
                 '                  IDPESSOA = '+qryultEventoGerador.FieldByName('IDPESSOA').AsString+' AND '+
                 '                  IDEVENTOSPREV < '+qryultEventoGerador.FieldByName('IDEVENTOSPREV').AsString+' )) ');
  qryaux.Open;


  if (qryUltEventoGerador.FieldByName('FLGINTERNO').AsString = 'RA') or
     ( (not qryaux.isempty) and (qryaux.fieldbyname('FLGINTERNO').AsString = 'RA') ) then
  begin
    // Verificar se o evento trocou o participante de patrocinadora
    //Busca a última empresa do participante.
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' SELECT EV.IDPESSJUR, EV.IDSITFUNCATUAL, EV.IDSITPARTATUAL, '+
                   '        EV.IDSITPLANOATUAL, EV.IDPLANOPREV                  '+
                   ' FROM   EVENTOSPREV EV,                                     '+
                   '        (SELECT MAX(DATAEVENTO) DATAEVENTO FROM EVENTOSPREV   '+
                   '         WHERE IDPESSOA = '+qryultEventoGerador.FieldByName('IDPESSOA').AsString  +
                   '         AND   DATAEVENTO < ( SELECT MAX(DATAEVENTO)                             '+
                   '                              FROM EVENTOSPREV                                   '+
                   '                              WHERE IDPESSOA = '+qryultEventoGerador.FieldByName('IDPESSOA').AsString +')) EV2 '+
                   ' WHERE  EV.IDPESSOA = '+qryultEventoGerador.FieldByName('IDPESSOA').AsString                          +
                   ' AND    EV.DATAEVENTO = EV2.DATAEVENTO                                                                ');
    qryAux.Open;
    if not(qryAux.IsEmpty) then
    begin
      sIdPatroAntiga      := qryAux.FieldByNAme('IDPESSJUR').AsString;
      sIdPlanoPrevAntigo  := qryAux.FieldByNAme('IDPLANOPREV').AsString;
    end
    else
    begin
      sIdPatroAntiga      := qryultEventoGerador.FieldByNAme('IDPESSJUR').AsString;
      sIdPlanoPrevAntigo  := qryultEventoGerador.FieldByNAme('IDPLANOPREV').AsString;
    end;

    if sIdPatroAntiga <> qryultEventoGerador.FieldByNAme('IDPESSJUR').AsString then
    begin
       if not(CancelaEventoRetornoParaAtivo(sIdPatroAntiga, sIdPlanoPrevAntigo)) then
       begin
         dtmBaseDados.dbBaseDados.RollBack;
         MsgDlg('Erro no Cancelamento de Evento.','Erro',mtError,[mbOk,mbHelp],0);
         Exit;
       end
    end
    else
    begin
       if not(CancelaOutrosEventos) then
       begin
         dtmBaseDados.dbBaseDados.RollBack;
         MsgDlg('Erro no Cancelamento de Evento.','Erro',mtError,[mbOk,mbHelp],0);
         Exit;
       end;
    end;

  end
  else
  begin

     if not(CancelaOutrosEventos) then
     begin
       dtmBaseDados.dbBaseDados.RollBack;
       MsgDlg('Erro no Cancelamento de Evento.','Erro',mtError,[mbOk,mbHelp],0);
       Exit;
     end;

  end;

  VerificaEvolucaoPens;

  // Se o evento que acabou de ser cancelado for uma INSCRICAO
  // Entao verificar se o evento anterior era uma transferencia de plano
  if qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'IP' then
  begin
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT   EP.IDEVENTOSPREV,   EP.IDEVENTOGERADOR, EP.IDPESSOA,           '+
                '          EP.IDPESSJUR,       EP.IDPLANOPREV,     EP.IDSITPLANOATUAL,    '+
                '          EP.IDSITPARTATUAL,  EP.IDSITFUNCATUAL,  EP.IDSITPLANONOVO,     '+
                '          EP.IDSITPARTNOVO,   EP.IDSITFUNCNOVO,   EP.DATAREGISTRO,       '+
                '          EP.DATAEFETIVADO,   EP.DATAEVENTO,      EP.FLGEFETIVADO,       '+
                '          EP.SEQPROPOSTA,     EG.NOME,            EG.FLGINTERNO,         '+
                '          EG.FLGENCERRABENEFI                                            '+
                ' FROM     EVENTOSPREV EP,  EVENTOGERADOR EG                              '+
                ' WHERE    EP.IDEVENTOSPREV   <> '+OraNumero(qryUltEventoGerador.FieldByName('IDEVENTOSPREV').AsString)+
                ' AND      EP.IDPESSJUR       = '+sIdPessJur+
                ' AND      EP.IDPESSOA        = '+sIdPessoa+
                ' AND      TO_CHAR(EP.DATAREGISTRO,''DD/MM/YYYY'') = '''+qryUltEventoGerador.FieldByName('DATAREGISTRO').AsString+''''+
                ' AND      EG.FLGINTERNO                           = ''TP''               '+
                ' AND      EP.IDEVENTOGERADOR = EG.IDEVENTOGERADOR                        '+
                ' ORDER BY EP.DATAREGISTRO ');
        Open;
     end;

     if not(qryAux.IsEmpty) then // A inscrição está associada a um evento de
     begin
       if not(CancelaEventoTransferenciaPlano) then
       begin
         dtmBaseDados.dbBaseDados.RollBack;
         MsgDlg('Erro no Cancelamento de Evento.','Erro',mtError,[mbOk],0);
         Exit;
       end;
     end;
  end;


  //desfazer rubricas individuais inseridas no evento
  qryaux.close;
  qryaux.sql.Text := ' DELETE RUBRICAINDIV '+
                     ' WHERE IDPESSOA = '+sIdPessoa+' AND '+
                     ' IDFAVORECIDO = '+sIdPessJur+' AND '+
                     ' EXISTS (SELECT 1 FROM RUBRICAINDIVEVENTO '+
                     '         WHERE IDEVENTOGERADOR = '''+sIdEventoGerador+''' AND '+
                     '         IDPLANOPREV = '''+sIdPlanoPrev+''' )';
  try
     qryaux.execsql;
  except
  //Brunno Mattos - KTN 767861 - SOL 132659 Inicio
  on e:Exception do
  begin
    TratarErro(e.Message);
     dtmBaseDados.dbBaseDados.RollBack;
     MsgDlg('Erro na exclusão das rubricas individuais.','Erro',mtError,[mbOk],0);
     Exit;
  end;
  //Brunno Mattos - KTN 767861 - SOL 132659 Fim
     
  end;



  // Se o evento for de resgate, limpar o campo VALORCOTASIR da HstMovReserva
  if (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DC') or   // Demissão com Cancelamento
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DS') or   // Demissão com Manutenção de Saldo de Conta
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DP') or   // Demissão da Patrocinadora
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'CP') or   // Cancelamento por Iniciativa do Participante
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'CI') or   // Cancelamento por Inadimplência
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'CD') then // Cancelamento por Descumprimento de Prazo
  begin
    sSQL :=
    'UPDATE '                                                                                         + #13 +
    '  HISTMOVRESERVA '                                                                               + #13 +
    'SET '                                                                                            + #13 +
    '  VLRCOTASIR = NULL '                                                                            + #13 +
    'WHERE '                                                                                          + #13 +
    '      IDPESSOA    = ' + FormatFloat('#0', qryUltEventoGerador.FieldByName('IDPESSOA').AsInteger) + #13 +
    '  AND IDPLANOPREV = ' + FormatFloat('#0', qryUltEventoGerador.FieldByName('IDPLANOPREV').AsInteger);

    qryAux.Close;
    qryAux.SQL.Clear;
    qryAux.SQL.Text := sSQL;

    try
      qryAux.ExecSQL;
    except
      dtmBaseDados.dbBaseDados.RollBack;
      MsgDlg('Erro ao excluir valor do resgate em cotas, para efeito de IR Regressivo!', 'AdmPrev', mtError, [mbOk], 0);
      Repaint;
      Exit;
    end;
    // SOL 166099 KINTANA 1444102
    IF ((qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsInteger = 334) and (sNumerosProcesso <> '') and (sNumerosProcesso <> '0')) or // PORTABILIDADE //Denis Horongoso - SIG68611
    //Wylliam Leite da Silva - SOL:257191 - PPM:985433
    (((qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsInteger = 369) OR (qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsInteger = 15)) and (Sistema.IdModulo = 452)
       and (sNumerosProcesso <> '') and (sNumerosProcesso <> '0'))THEN // PORTABILIDADE Origem EFPC (resgate saldo de conta) //Taffarel - SIG78001
    begin
      //TAES - SIG90992 - início
      if not(ExcluiTitPlan) then
        begin
           sSQL := ' DELETE FROM BFCIARIOTITPLAN B '+
                   ' WHERE  B.IDPESSJUR     = '+ qryultEventoGerador.FieldByName('IDPESSJUR').AsString +
                   ' AND    B.IDPLANOORIGEM = '+ qryultEventoGerador.FieldByName('IDPLANOPREV').AsString +
                   ' AND    B.IDTITULAR     = '+ qryultEventoGerador.FieldByName('IDPESSOA').AsString +
                   ' AND    B.SEQPROPOSTA   = '+ qryultEventoGerador.FieldByName('SEQPROPOSTA').AsString +
                   ' AND    B.IDPLANOPREV   = '+ qryultEventoGerador.FieldByName('IDPLANOPREV').AsString +
                   ' AND    B.IDBENEFICIO   = '+ BenefExclui;
                   //TAES - SIG90992 - início
                   //Fanuel Marinho SOL 181739 Kintana 1690396 ////Taffarel - SIG78001 - início
                   //' AND EXISTS ( SELECT 1  '+
                   //'              FROM   BENEFBFCIARIO BF  '+
                   //'              WHERE  BF.IDPESSJUR         = B.IDPESSJUR  '+
                   //'              AND    BF.NUMEROPROCESSO IN ('+sNumerosProcesso+') '+
                   //'              AND    BF.IDPLANOPREV       = B.IDPLANOPREV   '+
                   //'              AND    BF.IDTITULAR         = B.IDTITULAR     '+
                   //'              AND    BF.IDPESSOA          = B.IDPESSOA      '+
                   //'              AND    BF.SEQPROPOSTA       = B.SEQPROPOSTA   '+
                   //'              AND    BF.IDBENEFICIO       = B.IDBENEFICIO )  ';
                   //TAES SIG90992 - fim

           //Denis Horongoso - SIG68611 - Início
           {if (qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsInteger = 334) then
              sSQL := sSQL +
                   ' AND EXISTS ( SELECT 1  '+
                   '            FROM   BENEFBFCIARIO BF  '+
                   '            WHERE  BF.IDPESSJUR         = B.IDPESSJUR  '+
                   '            AND    BF.NUMEROPROCESSO IN ('+sNumerosProcesso+') '+
                   '            AND    BF.IDPLANOPREV       = B.IDPLANOPREV   '+
                   '            AND    BF.IDTITULAR         = B.IDTITULAR     '+
                   '            AND    BF.IDPESSOA          = B.IDPESSOA      '+
                   '            AND    BF.SEQPROPOSTA       = B.SEQPROPOSTA   '+
                   '            AND    BF.IDBENEFICIO       = B.IDBENEFICIO )  ';}
           //Denis Horongoso - SIG68611 - Fim
           //Taffarel - SIG78001 - fim

           qryAux.Close;
           qryAux.SQL.Clear;
           qryAux.SQL.Text := sSQL;

           try
              qryAux.ExecSQL;
           except
             dtmBaseDados.dbBaseDados.RollBack;
             MsgDlg('Erro ao excluir Registro.', 'AdmPrev', mtError, [mbOk], 0);
             Exit;
           end;
        end;
        //SOL 166099 KINTANA 1444102
        //TAES - SIG90992 - fim
    end;
  end;

  // Adicionando Log Padrao
  try
    if not(Sistema.GravaLogOperacoes('Cancelamento de Evento Registrado')) then
      raise exception.Create('Erro ao gravar Log.')
  except
  end;

  if MsgDlg('Confirma cancelamento do evento ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    dtmBaseDados.dbBaseDados.Commit;
    MsgDlg('Cancelamento de Evento efetuado com sucesso.','Informação',mtInformation,[mbOk],0);
    LimpaCampos;
  end
  else
  begin
    dtmBaseDados.dbBaseDados.Rollback;
    MsgDlg('Operação Cancelada!!','Informação',mtInformation,[mbOk],0);
    LimpaCampos;
  end;
end;



procedure TfrmCancelaEvento.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  if MsgDlg('Todas as operações executadas serão canceladas. Confirma ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
        LimpaCampos;
     end;

end;

function TfrmCancelaEvento.CancelaEventoTransferenciaPlano : boolean;
begin
  Result := False;
  // Evento de Transferencia de Plano
  //           PLANO ORIGEM  --->>>  PLANO DESTINO
  // Desfazer Evento Transferencia de Plano
  //           PLANO DESTINO --->>>  PLANO ORIGEM
  // Neste ponto a inscricao no plano destino já foi desfeita
  // Basta retornas situacoes no plano origem e o flg desativado

  // Procurar o Ultimo Evento Gerador da pessoa, que será o evento de transferência
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT MAX(EP.IDEVENTOSPREV) AS IDEVENTOSPREV '+
                 ' FROM   EVENTOSPREV EP, EVENTOGERADOR EG       '+
                 ' WHERE  EP.IDPLANOPREV    <> '+sIdPlanoPrev+
                 ' AND    EP.IDPESSOA       = '+sIdPessoa+
                 ' AND    EP.IDPESSJUR      = '+sIdPessJur+
                 ' AND    EG.IDEVENTOGERADOR = EP.IDEVENTOGERADOR '+
                 ' AND    EG.FLGINTERNO      = ''TP'' '+
                 ' AND    EP.DATAREGISTRO IN ( SELECT MAX(EP.DATAREGISTRO) FROM EVENTOSPREV EP, EVENTOGERADOR EG  '+
                 '                             WHERE  EP.IDPLANOPREV    <> '+sIdPlanoPrev+
                 '                             AND    EP.IDPESSOA       = '+sIdPessoa+
                 '                             AND    EP.IDPESSJUR      = '+sIdPessJur+
                 '                             AND    EP.IDEVENTOGERADOR = EG.IDEVENTOGERADOR '+
                 '                             AND    EG.FLGINTERNO      = ''TP'' ) ');
  qryAux.Open;
  if (qryAux.IsEmpty) OR (qryAux.FieldByName('IdEventosPrev').AsString = '')
  then begin // o participante não veio de um evento de transferencia de plano
     Result := True;
     Exit;
  end;

  sIdEventosPrev := qryAux.FieldByName('IdEventosPrev').AsString;
  qryAux.Close;

  // SELECIONA O ULTIMO EVENTO GERADOR E SUA SITUACÃO
  qryEventoTransfPlano.Close;
  qryEventoTransfPlano.ParamByName('IDEVENTOSPREV').AsInteger := strtoint(sIdEventosPrev);
  qryEventoTransfPlano.Open;
  if qryEventoTransfPlano.IsEmpty
  then  begin
     Result := True;
     Exit;
  end;

  // Nesta linha da eventosprev os campos "...ATUAL" estarão com a situação que
  // tem que ser colocada na partprevplan no plano origem
  if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
  begin

    with qryGrava do
    begin
       Close;
       SQL.Clear;
       SQL.Add(' UPDATE PARTPREVPLAN SET FLGDESATIVADO  = 0,  '+
               '                         IDSITPART      = '+OraNumero(qryEventoTransfPlano.FieldByName('IDSITPARTATUAL').AsString)+','+
               '                         IDSITPLANOPREV = '+OraNumero(qryEventoTransfPlano.FieldByName('IDSITPLANOATUAL').AsString)+
               ' WHERE  IDPESSJUR   = '+qryEventoTransfPlano.FieldByName('IDPESSJUR').AsString+
               ' AND    IDPLANOPREV = '+qryEventoTransfPlano.FieldByName('IDPLANOPREV').AsString+
               ' AND    IDPESSOA    = '+qryEventoTransfPlano.FieldByName('IDPESSOA').AsString+
               ' AND    SEQPROPOSTA = '+qryEventoTransfPlano.FieldByName('SEQPROPOSTA').AsString);
       try
          ExecSQL;
       except
          on E:EDBEngineError do
          begin
             MostrarErro(E);
             Exit;
          end;
       end;
    end;
  end;
  // REATIVAR COBRANÇA DAS CONTRIBUICOES NO PLANO ORIGEM
  if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // SOL 221079 KINTANA 2058169
  begin
    with qryGrava do
    begin
       Close;
       SQL.Clear;
       SQL.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 1,    '+
               '                             DATAFINAL = NULL '+
               ' WHERE  IDPESSJUR   = '+qryEventoTransfPlano.FieldByName('IDPESSJUR').AsString+
               ' AND    IDPLANOPREV = '+qryEventoTransfPlano.FieldByName('IDPLANOPREV').AsString+
               ' AND    IDPESSOA    = '+qryEventoTransfPlano.FieldByName('IDPESSOA').AsString+
               ' AND    SEQPROPOSTA = '+qryEventoTransfPlano.FieldByName('SEQPROPOSTA').AsString+
               ' AND    DATAFINAL   >= TO_DATE('''+qryEventoTransfPlano.FieldByName('DATAEVENTO').AsString+''',''DD/MM/YYYY'')');
       try
          ExecSQL;
       except
          on E:EDBEngineError do
          begin
             MostrarErro(E);
             Exit;
          end;
       end;
    end;
  end;
  // DELETAR OS REGISTROS DO HISTCONTEVENTOSPREV DE ACORDO IDEVENTOSPREV DA TABELA EVENTOSPREV
  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.Sql.Add(' DELETE FROM HSTCONTEVENTOSPR '+
                   ' WHERE IDEVENTOSPREV = '+inttostr(qryEventoTransfPlano.FieldByName('IDEVENTOSPREV').AsInteger));
  try
     qryGrava.ExecSQL;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;

  // DELETAR OS REGISTROS COM IDEVENTOSPREV DO EVENTOSPREV
  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.Sql.Add(' DELETE FROM EVENTOSPREV '+
                   ' WHERE IDEVENTOSPREV = '+inttostr(qryEventoTransfPlano.FieldByName('IDEVENTOSPREV').AsInteger));
  try
     qryGrava.ExecSQL;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;


  Result := True;
end;

function TfrmCancelaEvento.CancelaOutrosEventos : boolean;
var  sUltMesPreparo,
     sUltAno13,
     sIdRubSalAuxDoenca,
     sIdRubSalManut,
     sIdRubSalManutParc,
     sIdRubSalParticip,

     sDataFinalEvento,
     sAnoMesInicio,
     sAnoMesFinal,
     sProcessosAux,
     sSQLAux   : String;
     QryAuxCalc        : TQuery;
     iNumeroProcesso   : longint;
     bApaga13          : boolean;

     sIDHISTRESERVA : String;

     dSaldoAtu ,  dSaldoRealAtu : Double;

     bDesfaznoEnvio : Boolean;
     sMsgErro       : String; 
     dValorIndice   : Double; 
     sNucleosFam    : String;
begin
  Result := False;
  bDesfaznoEnvio := False;
  sAnoMesInicio := Copy(qryUltEventoGerador.FieldByName('DataEvento').AsString,7,4)+'/'+
                   Copy(qryUltEventoGerador.FieldByName('DataEvento').AsString,4,2);

  sAnoMesFinal  := Copy(FormatDateTime('dd/mm/yyyy', Date),7,4)+'/'+
                   Copy(FormatDateTime('dd/mm/yyyy', Date),4,2);

  if not (1=1)
                                   
  then begin
     MsgDlg('Erro na Geração do Log.','Erro',mtError,[mbOk],0);
     Exit;
  end;


  //if qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'FL'
  if qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsInteger = 4  // SOL 260838 KINTANA 1060022 limpa a data somente se estiver desfazendo o evento de falecimento
  then begin
     qryGrava.Close;
     qryGrava.Sql.Clear;
     qryGrava.Sql.Add(' UPDATE PESSOAFISICA SET DATAMORTE = NULL ' +
                      ' WHERE IDPESSOA = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger));
     try
        qryGrava.ExecSQL;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;
  end;

  // Se o evento que está sendo desfeito, grava a data de demissao, /
  // E o evento anterior não é também de demissão
  // Entao, apagar esta data da ELEGPATRO
  sSQLAux := ' ';


  if qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DM'
   then begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add('SELECT NVL( FLGCONTABMANTIDO,0) FLGCONTABMANTIDO '+
                    'FROM PLANPREV '+
                    'WHERE IDPLANOPREV = '+sIdPlanoPrev);
     qryAux.Open;
     bDesfaznoEnvio := (qryAux.FieldByName('FLGCONTABMANTIDO').AsInteger = 0);
   end;
  // André Imakawa SOL 266932-18049 PPM 1239691 - Inicio
  if (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DP') then  // 'Participante no prazo de opção dos Institutos'
  begin
      sSQLAux := ' , DATADEMISSAO = NULL ';
  end;
  {
  if (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DC') or //  'Demissão com Cancelamento'
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DM') or //   'Demissão com Manutenção de Contribuição'     *
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DS') or //   'Demissão com Manutenção de Saldo de Conta'
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DP') or //   'Demissão da Patrocinadora
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DA') or //   'Demissão para Aposentadoria'
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'TS') or //   'Tempo de Serviço'
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'ID')    //   'Idade'
  then begin
      // Procurar o Ultimo Evento Gerador da pessoa
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT EP.IDEVENTOGERADOR, EG.FLGINTERNO  '+
                     ' FROM   EVENTOSPREV EP, EVENTOGERADOR EG '+
                     ' WHERE  EP.IDPLANOPREV = '+sIdPlanoPrev+
                     ' AND    EP.IDPESSOA       = '+sIdPessoa+
                     ' AND    EP.IDPESSJUR      = '+sIdPessJur+
                     ' AND    EP.IDEVENTOSPREV  < '+sIdEventosPrev+
                     ' AND    EP.IDEVENTOGERADOR = EG.IDEVENTOGERADOR '+
                     ' ORDER BY EP.DATAEVENTO DESC ');
      qryAux.Open;
      qryAux.First;

      if ((not qryAux.IsEmpty) and
         (not ( (qryAux.FieldByName('FlgInterno').AsString = 'DC') or //  'Demissão com Cancelamento'
                (qryAux.FieldByName('FlgInterno').AsString = 'DM') or //   'Demissão com Manutenção de Contribuição'     *
                (qryAux.FieldByName('FlgInterno').AsString = 'DS') or //   'Demissão com Manutenção de Saldo de Conta'
                (qryAux.FieldByName('FlgInterno').AsString = 'DP') or //   'Demissão da Patrocinadora
                (qryAux.FieldByName('FlgInterno').AsString = 'DA') or //   'Demissão para Aposentadoria'
                (qryAux.FieldByName('FlgInterno').AsString = 'TS') or //   'Tempo de Serviço'
                (qryAux.FieldByName('FlgInterno').AsString = 'ID')    //   'Idade'
               ))
          ) or (qryaux.isempty)
      then


      //CASO SEJA UM EVENTO DE DEMISSÃO, ANULAR O CAMPO NO CANCELAMENTO
      if (( (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DC') or     // 'Demissão com Cancelamento'
          (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DM') or       // 'Demissão com Manutenção de Contribuição'     *
           (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DS') or      // 'Demissão com Manutenção de Saldo de Conta'
           (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DP') or      // 'Demissão da Patrocinadora
           (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DA') ) )then // 'Demissão para Aposentadoria'
          sSQLAux := ' , DATADEMISSAO = NULL ';
  end;
  }
  // André Imakawa SOL 266932-18049 PPM 1239691 - Fim

  // Andre Imakawa - SIG24696 - Inicio
  {
  if Trim(QryultEventoGerador.FieldByName('MATRICULA').AsString) <> ''  then begin
    sSQLAux := sSQLAux + ', MATRICULA = '+QuotedStr(QryUltEventoGerador.FieldByName('MATRICULA').AsString);
  end;
  }
  // Andre Imakawa - SIG24696 - Fim

  // ALTERAR O IDSITFUNC DO ELEGPATRO DE ACORDO COM DBEDTSITFUNC
  if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
  begin

    qryGrava.Close;
    qryGrava.Sql.Clear;
    qryGrava.Sql.Add(' UPDATE ELEGPATRO SET IDSITFUNC = '+inttostr(qryultEventoGerador.FieldByName('IDSITFUNCATUAL').AsInteger)+
                       sSQLAux+
                     ' WHERE IDPESSJUR = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                     ' AND   IDPESSOA = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger));
    try
       qryGrava.ExecSQL;
    except
       on E:EDBEngineError do
       begin
          MostrarErro(E);
          Exit;
       end;
    end;
  end;
    sSQLAux := '';

  if (not ( (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DC') or //  'Demissão com Cancelamento'
            (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DM') or //   'Demissão com Manutenção de Contribuição'     *
            (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DS') or //   'Demissão com Manutenção de Saldo de Conta'
            (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DP') or //   'Demissão da Patrocinadora
            (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DA') ) )then //   'Demissão para Aposentadoria'
    if Trim(sSQLAux) <> '' then
    begin
      // Atualizar HISTFUNCPREV com DATADEMISSAO
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(' UPDATE HISTFUNCPREV SET DATAFINAL = NULL '+
                     ' WHERE  IDPESSJUR = ' + sIdPessJur +
                     ' AND    IDPESSOA  = ' + sIdPessoa +
                     ' AND    DATAFINAL IS NOT NULL '+
                     ' AND    SEQHISTFUNC IN ( SELECT MAX(SEQHISTFUNC) '+
                     '                         FROM HISTFUNCPREV '+
                     '                         WHERE  IDPESSJUR = ' + sIdPessJur +
                     '                         AND    IDPESSOA  = ' + sIdPessoa  +
                     '                         AND    DATAFINAL IS NOT NULL ) ');

      Try
         qryAux.ExecSQL;
      Except
         on E:EDBEngineError do
         begin
            MostrarErro(E);
            Exit;
         end;
      end;
    end;

  // Verifica se o evento inseriu alguma linha na HISTFUNCPREV, caso positivo apagar.
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT FLGINCLUIHISTFUNC FROM EVENTOGERADOR '+
                 ' WHERE IDEVENTOGERADOR = ' + qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString);
  qryAux.Open;

  if qryAux.FieldByName('FLGINCLUIHISTFUNC').AsInteger = 1 then
  begin
    qryAux.Close;
    qryAux.Sql.Clear;
    qryAux.Sql.Add(' DELETE FROM HISTFUNCPREV  '+
                   ' WHERE  IDPESSJUR = ' + sIdPessJur +
                   ' AND    IDPESSOA  = ' + sIdPessoa +
                   ' AND    SEQHISTFUNC IN ( SELECT MAX(SEQHISTFUNC) '+
                   '                         FROM HISTFUNCPREV '+
                   '                         WHERE  IDPESSJUR = ' + sIdPessJur +
                   '                         AND    IDPESSOA  = ' + sIdPessoa  + ')');
    Try
       qryAux.ExecSQL;
    Except
       on E:EDBEngineError do
       begin
          MostrarErro(E);
          Exit;
       end;
    end;
  end;

  if qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'RM'
  then sSQLAux := ', INSCRICAODATA = DTINICIOINSC '
  Else if (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DM') or
          (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DS') or
          (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'AF')
       then sSQLAux := ', DATAINICIOMANUT = NULL, SALMANTIDO = NULL ';

  if (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DC') or
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DA') or
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'CP') or
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'CD') or
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'CI') or
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'TP')
  then sSQLAux := sSQLAux + ', DATACANCELAMENTO  = NULL  ';

  // ALTERAR O IDSITPLANOPREV, IDSITPART DO PARTPREVPLAN DE ACORDO COM DBEDTSITPLANOPREV,DBEDTSITPART
  if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
  begin
  //William Moreira da Silva - SOL 252324 - PPM 784020
                     if qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString = '13' then
                     begin
                         qryGrava.Close;
                         qryGrava.Sql.Clear;       // OK
                         qryGrava.Sql.Add(' UPDATE PARTPREVPLAN SET IDSITPLANOPREV = '+inttostr(qryultEventoGerador.FieldByName('IDSITPLANOATUAL').AsInteger)+', '+
                         '                         IDSITPART      = '+inttostr(qryultEventoGerador.FieldByName('IDSITPARTATUAL').AsInteger) +', '+
                         // 204820 KTN 1992519 Otacilio ** Inicio **
                         '                         FLGDESATIVADO  = 0, ' +
                         // 204820 KTN 1992519 Otacilio ** Fim **
                         '                         SALAUXDOENCA   = NULL, '+
                         '                         MESULTREAJSAL  = NULL  '+
                         sSQLAux+
                         ' WHERE IDPESSJUR = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                         ' AND   IDPLANOPREV = '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                         ' AND   IDPESSOA = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                         ' AND   SEQPROPOSTA = ' +inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger));
                     end
                     else
                     begin
                         qryGrava.Close;
                         qryGrava.Sql.Clear;
                         qryGrava.Sql.Add(' UPDATE PARTPREVPLAN SET IDSITPLANOPREV = '+inttostr(qryultEventoGerador.FieldByName('IDSITPLANOATUAL').AsInteger)+', '+
                         '                         IDSITPART      = '+inttostr(qryultEventoGerador.FieldByName('IDSITPARTATUAL').AsInteger) +', '+
                         '                         SALAUXDOENCA   = NULL, '+
                         '                         MESULTREAJSAL  = NULL  '+
                         sSQLAux+
                         ' WHERE IDPESSJUR = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                         ' AND   IDPLANOPREV = '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                         ' AND   IDPESSOA = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                         ' AND   SEQPROPOSTA = ' +inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger));
                     end;
    //William Moreira da Silva - SOL 252324 - PPM 784020
    try
       qryGrava.ExecSQL;
    except
       on E:EDBEngineError do
       begin
          MostrarErro(E);
          Exit;
       end;
    end;
  end;
  if qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'AR'
  then begin
     sTempoAfastado := MontaSelectPart.ValoresChave[27];
     if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
     begin

       qryGrava.Close;
       qryGrava.Sql.Clear;       // OK
       qryGrava.Sql.Add(' UPDATE ELEGPATRO  SET TEMPONAOCREDITADO = TEMPONAOCREDITADO - '+OraNumero(sTempoAfastado)+
                        ' WHERE IDPESSJUR = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                        ' AND   IDPESSOA = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger));

       try
          qryGrava.ExecSQL;
       except
          on E:EDBEngineError do
          begin
             MostrarErro(E);
             Exit;
          end;
       end;
     end;
  end;

  if qryUltEventoGerador.FieldByName('FlgInterno').AsString <> 'RA' then
  begin
    // DESATIVAR O FLGCOBRA PARA ZERO DOS IDPESSOA E SEQPROPOSTA DA TABELA
    // CONTRIBPREVPARTPLAN
    if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
    begin
        qryGrava.Close;
        qryGrava.Sql.Clear;
        qryGrava.Sql.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 0 '+
                         ' WHERE  IDPLANOPREV = '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                         ' AND    IDPESSJUR = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                         ' AND    IDPESSOA = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                         //Luiz Carlos - SIG44661 - Inicio
                         ' AND    SEQPROPOSTA = ' +inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                         ' AND IDCONTRIBUICAO NOT IN (SELECT IDCONTRIBUICAO FROM CONTRIBUICAO WHERE IDTPCONTRIBUICAO IN (1,2,4))');
                         //Luiz Carlos - SIG44661 - Fim
        try
           qryGrava.ExecSQL;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              Exit;
           end;
        end;
    end;
    // ATUALIZA O FLGCOBRA = 1 DO CONTRIBPARTPLAN DE ACORDO COM IDEVENTOSPREV DO EVENTOSPREV E HISTCONTEVENTOSPREV
    qryContribAssociar.First;
    while not qryContribAssociar.eof do
    begin
       if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
       begin
         qryGrava.Close;
         qryGrava.Sql.Clear;
         qryGrava.Sql.Add(' UPDATE CONTRIBPREVPARTP SET FLGCOBRA = 1, DATAFINAL = NULL '+
                          ' WHERE  IDPESSJUR      = '+inttostr(qryContribAssociar.FieldByName('IDPESSJUR').AsInteger)+
                          ' AND    IDPLANOPREV    = '+inttostr(qryContribAssociar.FieldByName('IDPLANOPREV').AsInteger)+
                          ' AND    IDPESSOA       = '+inttostr(qryContribAssociar.FieldByName('IDPESSOA').AsInteger)+
                          ' AND    SEQPROPOSTA    = ' +inttostr(qryContribAssociar.FieldByName('SEQPROPOSTA').AsInteger)+
                          ' AND    IDCONTRIBUICAO = '+inttostr(qryContribAssociar.FieldByName('IDCONTRIBUICAOF').AsInteger));

         try
            qryGrava.ExecSQL;
         except
            on E:EDBEngineError do
            begin
               MostrarErro(E);
               Exit;
            end;
         end;
       end;
       // APAGAR ULTIMA CONTRIBUICAO QUE TENHA SIDO GERADA PARA COBRANCA PELO EVENTO QUE
       // ESTÁ SENDO CANCELADO NO MOMENTO
       if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
       begin
          qryGrava.Close;
          qryGrava.Sql.Clear;                  // ok
          qryGrava.Sql.Add(' DELETE FROM HSTATRASOCONTRIB '+
                           ' WHERE NUMRECEBIMENTO IN      '+
                           ' (SELECT HC.NUMRECEBIMENTO    '+
                           '  FROM   HSTCONTRIBPREV HC    '+
                           '  WHERE  HC.IDPESSJUR      =  '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                           '  AND    HC.IDPLANOPREV    =  '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                           '  AND    HC.IDPESSOA       =  '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                           '  AND    HC.SEQPROPOSTA    =  '+inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                           '  AND    HC.FLGEVENTO      = 1 '+
                           '  AND    HC.FLGINTEVENTO   = '''+qryUltEventoGerador.FieldByName('FlgInterno').AsString+''''+
                           '  AND    HC.IDCONTRIBUICAO = '+IntToStr(qryContribAssociar.FieldByName('IDCONTRIBUICAOF').AsInteger)+
                           '  AND    ((HC.MESREFERENCIA  = '''+sAnoMesInicio+''') OR (HC.MESREFERENCIA = '''+Copy(sAnoMesInicio,1,4)+'/13'')))');
          try
             qryGrava.ExecSQL;
          except
             on E:EDBEngineError do
             begin
                MostrarErro(E);
                Exit;
             end;
          end;
       end;
       // TESTAR GERAÇÃO DE DOCUMENTOS INDEPENDENTE DO FLGINTERNO DO EVENTO
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(' SELECT CODDOCUMENTOPREV, MESREFERENCIA '+
                         ' FROM HSTCONTRIBPREV '+
                         ' WHERE  IDPESSJUR      = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                         ' AND    IDPLANOPREV    = '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                         ' AND    IDPESSOA       = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                         ' AND    SEQPROPOSTA    = '+inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                         ' AND    FLGEVENTO      = 1 '+
                         ' AND    NVL(CODDOCUMENTOPREV,0) > 0 '+
                         ' AND    FLGINTEVENTO   = '''+qryUltEventoGerador.FieldByName('FlgInterno').AsString+''''+
                         ' AND    IDCONTRIBUICAO = '+IntToStr(qryContribAssociar.FieldByName('IDCONTRIBUICAOF').AsInteger)+
                         ' AND    ((MESREFERENCIA  = '''+sAnoMesInicio+''') OR (MESREFERENCIA = '''+Copy(sAnoMesInicio,1,4)+'/13''))');
          qryAux.Open;

          if qryDesfazDocumentos.Active and qryDesfazDocumentos.UpdatesPending
          then qryDesfazDocumentos.CancelUpdates;

          qryDesfazDocumentos.Close;
          qryDesfazDocumentos.Open;
          While not qryDesfazDocumentos.Eof do
               qryDesfazDocumentos.Delete;

          While not qryAux.Eof do
          begin
             qryDesfazDocumentos.Insert;
             qryDesfazDocumentos.FieldByName('CODDOCUMENTO').AsInteger := qryAux.FieldByName('CODDOCUMENTOPREV').AsInteger;
             qryDesfazDocumentos.FieldByName('MESREFERENCIA').AsString := qryAux.FieldByName('MESREFERENCIA').AsString;
             qryDesfazDocumentos.Post;
             qryAux.Next;
           end;

          qryDesfazDocumentos.First;
          While not qryDesfazDocumentos.Eof do
          begin

             if not EstornaContribuicaoBANCO (CtrlDocumento,
                                              CtrlLancamento,
                                              qryDesfazDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                              qryAux2, dtmAPrev.qryAux,
                                              qryDesfazDocumentos.FieldByName('MESREFERENCIA').AsString,
                                              sMsgErro)
             then begin
                if MsgDlg('Erro no estorno ['+sMsgErro+']'+#13+#10+
                          'Deseja continuar com o cancelamento do evento ?','Erro',
                          mtConfirmation, [mbYes, mbNo],0) = mrNo
                  then Exit;

                qryAux.Next;
                continue;
             end;

             qryDesfazDocumentos.Next;
          end;
       if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
       begin

          qryGrava.Close;
          qryGrava.Sql.Clear;
          qryGrava.Sql.Add(' DELETE FROM HSTCONTRIBPREV  '+
                           ' WHERE  IDPESSJUR      = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                           ' AND    IDPLANOPREV    = '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                           ' AND    IDPESSOA       = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                           ' AND    SEQPROPOSTA    = ' +inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                           ' AND    FLGEVENTO      = 1 '+
                           ' AND    FLGINTEVENTO   = '''+qryUltEventoGerador.FieldByName('FlgInterno').AsString+''''+
                           ' AND    IDCONTRIBUICAO = '+IntToStr(qryContribAssociar.FieldByName('IDCONTRIBUICAOF').AsInteger)+
                           ' AND    ((MESREFERENCIA  = '''+sAnoMesInicio+''') OR (MESREFERENCIA = '''+Copy(sAnoMesInicio,1,4)+'/13''))');
          try
             qryGrava.ExecSQL;
          except
             on E:EDBEngineError do
             begin
                MostrarErro(E);
                Exit;
             end;
          end;
       end;
       qryContribAssociar.Next;
    end; // end do while not qryContribAssociar.eof do

    // ABRIR QUERY COM CONTRIBUICOES QUE O EVENTO TINHA ASSOCIADO
    qryContribEvento.Close;
    qryContribEvento.ParamByName('IdEventoGerador').AsInteger := qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsInteger;
    qryContribEvento.Open;
    while not qryContribEvento.Eof do
    begin
        // DELETAR OS REGISTROS DO HSTATRASOCONTRIB E HSTCONTRIBPREV
       if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
       begin

          qryGrava.Close;
          qryGrava.Sql.Clear;
          qryGrava.Sql.Add(' DELETE FROM HSTATRASOCONTRIB '+
                           ' WHERE NUMRECEBIMENTO IN      '+
                           ' (SELECT HC.NUMRECEBIMENTO    '+
                           '  FROM   HSTCONTRIBPREV HC    '+
                           '  WHERE  HC.IDPESSJUR      =  '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                           '  AND    HC.IDPLANOPREV    =  '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                           '  AND    HC.IDPESSOA       =  '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                           '  AND    HC.SEQPROPOSTA    =  '+inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                           '  AND    HC.FLGEVENTO      = 1 '+
                           '  AND    HC.IDCONTRIBUICAO = '+IntToStr(qryContribEvento.FieldByName('IdContribuicao').AsInteger)+
                           '  AND    HC.MESREFERENCIA  >= '''+sAnoMesInicio+''')');
          try
             qryGrava.ExecSQL;
          except
             on E:EDBEngineError do
             begin
                MostrarErro(E);
                Exit;
             end;
          end;
       end;

        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' SELECT CODDOCUMENTOPREV, MESREFERENCIA '+
                       ' FROM HSTCONTRIBPREV '+
                       ' WHERE  IDPESSJUR      = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                       ' AND    IDPLANOPREV    = '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                       ' AND    IDPESSOA       = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                       ' AND    SEQPROPOSTA    = ' +inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                       ' AND    FLGEVENTO      = 1 '+
                       ' AND    IDCONTRIBUICAO = '+IntToStr(qryContribEvento.FieldByName('IdContribuicao').AsInteger)+
                     //' AND    MESREFERENCIA  >= '''+sAnoMesInicio+''''); //Taffarel - SIG82652
                       ' AND    MESREFERENCIA  >= '''+sAnoMesInicio+''''+
                       ' AND    NVL(VALORRECEBIDO, 0) > 0 '); //Taffarel - SIG82652
        qryAux.Open;

        
        if qryDesfazDocumentos.Active and qryDesfazDocumentos.UpdatesPending
        then qryDesfazDocumentos.CancelUpdates;

        qryDesfazDocumentos.Close;
        qryDesfazDocumentos.Open;
        While not qryDesfazDocumentos.Eof do
             qryDesfazDocumentos.Delete;
        

        While not qryAux.Eof do
        begin
           qryDesfazDocumentos.Insert;
           qryDesfazDocumentos.FieldByName('CODDOCUMENTO').AsInteger := qryAux.FieldByName('CODDOCUMENTOPREV').AsInteger;
           qryDesfazDocumentos.FieldByName('MESREFERENCIA').AsString := qryAux.FieldByName('MESREFERENCIA').AsString;
           qryDesfazDocumentos.Post;
           qryAux.Next; 
         end;

        qryDesfazDocumentos.First;
        While not qryDesfazDocumentos.Eof do
        begin
           if not EstornaContribuicaoBANCO (CtrlDocumento,
                                            CtrlLancamento, 
                                            qryDesfazDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                            qryAux2, dtmAPrev.qryAux,
                                            qryDesfazDocumentos.FieldByName('MESREFERENCIA').AsString,
                                            sMsgErro)
           then begin
              if MsgDlg('Erro no estorno ['+sMsgErro+']'+#13+#10+
                          'Deseja continuar com o cancelamento do evento ?','Erro',
                        mtConfirmation, [mbYes, mbNo],0) = mrNo
                then Exit;

              qryAux.Next;
              continue;
           end;

           qryDesfazDocumentos.Next;
        end;

        if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
        begin

           qryGrava.Close;
           qryGrava.Sql.Clear;
           qryGrava.Sql.Add(' DELETE FROM HSTCONTRIBPREV  '+
                            ' WHERE  IDPESSJUR      = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                            ' AND    IDPLANOPREV    = '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                            ' AND    IDPESSOA       = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                            ' AND    SEQPROPOSTA    = ' +inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                            ' AND    FLGEVENTO      = 1 '+
                            ' AND    IDCONTRIBUICAO = '+IntToStr(qryContribEvento.FieldByName('IdContribuicao').AsInteger)+
                            //' AND    MESREFERENCIA  >= '''+sAnoMesInicio+''''); //Taffarel - SIG82652
                            ' AND    MESREFERENCIA  >= '''+sAnoMesInicio+''''+ //Taffarel - SIG82652
                            ' AND    NVL(VALORRECEBIDO, 0) = 0 '+ //Taffarel - SIG82652
                            ' AND    SITRECEBIMENTO IN (0,1)'); //Taffarel - SIG82652
           try
              qryGrava.ExecSQL;
           except
              on E:EDBEngineError do
              begin
                 MostrarErro(E);
                 Exit;
              end;
           end;

        end;

        //Renato Visoni SOL 141131 Kintana 890567
        if qryContribEvento.FieldByName('IdContribuicao').AsInteger in [1,21] then begin
           if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
           begin

              qryGrava.Close;
              qryGrava.Sql.Clear;
              qryGrava.SQL.Add(' DELETE FROM HSTPERCONTRIBPREV');
              qryGrava.SQL.Add(' WHERE IDPESSJUR    ='+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger));
              qryGrava.SQL.Add(' AND IDPESSOA       ='+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger));
              qryGrava.SQL.Add(' AND IDPLANOPREV    ='+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger));
              qryGrava.SQL.Add(' AND IDCONTRIBUICAO IN(' );
              qryGrava.SQL.Add('                       SELECT IDCONTRIBUICAO FROM CONTRIBPREVPARTP '+
                                                         ' WHERE  IDPESSJUR      = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                                                         ' AND    IDPLANOPREV    = '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                                                         ' AND    IDPESSOA       = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                                                         ' AND    SEQPROPOSTA    = '+inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                                                         ' AND    IDCONTRIBUICAO IN (1,21) '+
                                                         ' AND    IDCONTRIBUICAO NOT IN ( SELECT DISTINCT IDCONTRIBUICAO ' +
                                                         '                                FROM   HSTCONTRIBPREV '+
                                                         '                                WHERE  IDPESSOA    = ' +inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                                                         '                                AND    IDPESSJUR   = ' +inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                                                         '                                AND    IDPLANOPREV = ' +inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                                                         '                                AND    SEQPROPOSTA = ' +inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger) +')');
              qryGrava.SQL.Add('                       )');
              qryGrava.ExecSQL;
           end;
        end;
        //Renato Visoni SOL 141131 Kintana 890567


        // APAGAR OS REGISTROS DA CONTRIBPREVPARTP QUE NAO ESTIVEREM NO HISTORICO
        if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
        begin

           qryGrava.Close;
           qryGrava.Sql.Clear;
           qryGrava.Sql.Add(' DELETE FROM CONTRIBPREVPARTP '+
                            ' WHERE  IDPESSJUR      = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                            ' AND    IDPLANOPREV    = '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                            ' AND    IDPESSOA       = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                            ' AND    SEQPROPOSTA    = '+inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                            ' AND    IDCONTRIBUICAO = '+IntToStr(qryContribEvento.FieldByName('IdContribuicao').AsInteger)+
                            ' AND    IDCONTRIBUICAO NOT IN ( SELECT DISTINCT IDCONTRIBUICAO ' +
                            '                                FROM   HSTCONTRIBPREV '+
                            '                                WHERE  IDPESSOA    = ' +inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                            '                                AND    IDPESSJUR   = ' +inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                            '                                AND    IDPLANOPREV = ' +inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                            '                                AND    SEQPROPOSTA = ' +inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger) +')');


           try
              qryGrava.ExecSQL;
           except
              on E:EDBEngineError do
              begin
                 MostrarErro(E);
                 Exit;
              end;
           end;
        end;

        qryContribEvento.Next;
    end;
  end;  // if flgintegrno <> RA



  // DELETAR OS REGISTROS DO HISTCONTEVENTOSPREV DE ACORDO ideventosprev da tabela EVENTOSPREV

  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.Sql.Add(' DELETE FROM HSTCONTEVENTOSPR '+
                   ' WHERE IDEVENTOSPREV = '+inttostr(qryultEventoGerador.FieldByName('IDEVENTOSPREV').AsInteger));
  try
     qryGrava.ExecSQL;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;


  // DESFAZER DEVOLUCOES
  // DELETAR OS REGISTROS DO HSTATRASOCONTRIB E HSTCONTRIBPREV
  if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
  begin

      qryGrava.Close;
      qryGrava.Sql.Clear;
      qryGrava.Sql.Add(' DELETE FROM HSTATRASOCONTRIB '+
                       ' WHERE NUMRECEBIMENTO IN      '+
                       ' (SELECT NUMRECEBIMENTO FROM HSTCONTRIBPREV  '+
                       ' WHERE  IDPESSJUR      = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                       ' AND    IDPLANOPREV    = '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                       ' AND    IDPESSOA       = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                       ' AND    SEQPROPOSTA    = ' +inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                       ' AND    FLGEVENTO      = 1 '+
                       ' AND    FLGDEVOLUCAO   = 1 '+
                       ' AND    FLGINTEVENTO   = '''+qryUltEventoGerador.FieldByName('FlgInterno').AsString+''''+
                       ' AND    MESREFERENCIA  >= '''+Copy(qryUltEventoGerador.FieldByName('DataEvento').AsString,7,4)+'/'+Copy(qryUltEventoGerador.FieldByName('DataEvento').AsString,4,2)+''')');
      try
         qryGrava.ExecSQL;
      except
         on E:EDBEngineError do
         begin
            MostrarErro(E);
            Exit;
         end;
      end;
  end;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT CODDOCUMENTOPREV, MESREFERENCIA '+
                 ' FROM HSTCONTRIBPREV '+
                 ' WHERE  IDPESSJUR      = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                 ' AND    IDPLANOPREV    = '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                 ' AND    IDPESSOA       = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                 ' AND    SEQPROPOSTA    = ' +inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                 ' AND    FLGEVENTO      = 1 '+
                 ' AND    FLGDEVOLUCAO   = 1 '+
                 ' AND    FLGINTEVENTO   = '''+qryUltEventoGerador.FieldByName('FlgInterno').AsString+''''+
                 ' AND    MESREFERENCIA  >= '''+Copy(qryUltEventoGerador.FieldByName('DataEvento').AsString,7,4)+'/'+Copy(qryUltEventoGerador.FieldByName('DataEvento').AsString,4,2)+'''');
  qryAux.Open;

  
  if qryDesfazDocumentos.Active and qryDesfazDocumentos.UpdatesPending
  then qryDesfazDocumentos.CancelUpdates;

  qryDesfazDocumentos.Close;
  qryDesfazDocumentos.Open;
  While not qryDesfazDocumentos.Eof do
       qryDesfazDocumentos.Delete;
  

  While not qryAux.Eof do
  begin
     qryDesfazDocumentos.Insert;
     qryDesfazDocumentos.FieldByName('CODDOCUMENTO').AsInteger := qryAux.FieldByName('CODDOCUMENTOPREV').AsInteger;
     qryDesfazDocumentos.FieldByName('MESREFERENCIA').AsString := qryAux.FieldByName('MESREFERENCIA').AsString;
     qryDesfazDocumentos.Post;
     qryAux.Next; 
   end;

  qryDesfazDocumentos.First;
  While not qryDesfazDocumentos.Eof do
  begin
     if not EstornaContribuicaoBANCO (CtrlDocumento,
                                      CtrlLancamento,
                                      qryDesfazDocumentos.FieldByName('CODDOCUMENTO').AsInteger,
                                      qryAux2, dtmAPrev.qryAux,
                                      qryDesfazDocumentos.FieldByName('MESREFERENCIA').AsString,
                                      sMsgErro)
     then begin
        if MsgDlg('Erro no estorno ['+sMsgErro+']'+#13+#10+
                  'Deseja continuar com o cancelamento do evento ?','Erro',
                  mtConfirmation, [mbYes, mbNo],0) = mrNo
          then Exit;

        qryAux.Next;
        continue;
     end;

     qryDesfazDocumentos.Next;
  end;

  // Apagar DEVOLUCOES DE CONTRIBUICAO geradas por este evento
  if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
  begin

      qryGrava.Close;
      qryGrava.Sql.Clear;
      qryGrava.Sql.Add(' DELETE FROM HSTCONTRIBPREV  '+
                       ' WHERE  IDPESSJUR      = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                       ' AND    IDPLANOPREV    = '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                       ' AND    IDPESSOA       = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                       ' AND    SEQPROPOSTA    = ' +inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                       ' AND    FLGEVENTO      = 1 '+
                       ' AND    FLGDEVOLUCAO   = 1 '+
                       ' AND    FLGINTEVENTO   = '''+qryUltEventoGerador.FieldByName('FlgInterno').AsString+''''+
                       ' AND    MESREFERENCIA  >= '''+Copy(qryUltEventoGerador.FieldByName('DataEvento').AsString,7,4)+'/'+Copy(qryUltEventoGerador.FieldByName('DataEvento').AsString,4,2)+'''');
      try


         qryGrava.ExecSQL;
      except
         on E:EDBEngineError do
         begin
            MostrarErro(E);
            Exit;
         end;
      end;
  end;
  // ATUALIZAR CAMPO OPTRATDIVERG
  if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
  begin

      qryGrava.Close;
      qryGrava.Sql.Clear;
      qryGrava.Sql.Add(' UPDATE HSTCONTRIBPREV SET OPTRATDIVERG = NULL '+
                       ' WHERE  IDPESSJUR      = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                       ' AND    IDPLANOPREV    = '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                       ' AND    IDPESSOA       = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                       ' AND    SEQPROPOSTA    = ' +inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                       ' AND    OPTRATDIVERG IN (4,5,6,8,9) '+
                       ' AND    MESREFERENCIA  >= '''+Copy(qryUltEventoGerador.FieldByName('DataEvento').AsString,7,4)+'/'+Copy(qryUltEventoGerador.FieldByName('DataEvento').AsString,4,2)+'''');
      try
         qryGrava.ExecSQL;
      except
         on E:EDBEngineError do
         begin
            MostrarErro(E);
            Exit;
         end;
      end;
  end;
  // APAGAR CONTRIBUICOES GERADAS PELO EVENTO
  if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // SOL 221079/15817 KINTANA 2060966
  begin

    qryGrava.Close;
    qryGrava.Sql.Clear;
    qryGrava.Sql.Add(' DELETE FROM HSTATRASOCONTRIB '+
                     ' WHERE NUMRECEBIMENTO IN      '+
                     ' (SELECT NUMRECEBIMENTO FROM HSTCONTRIBPREV  '+
                     ' WHERE  IDPESSJUR      = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                     ' AND    IDPLANOPREV    = '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                     ' AND    IDPESSOA       = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                     ' AND    SEQPROPOSTA    = ' +inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                     ' AND    FLGEVENTO      = 1 '+
                     ' AND    FLGINTEVENTO   = '''+qryUltEventoGerador.FieldByName('FlgInterno').AsString+''''+
                     ' AND    MESREFERENCIA  >= '''+Copy(qryUltEventoGerador.FieldByName('DataEvento').AsString,7,4)+'/'+Copy(qryUltEventoGerador.FieldByName('DataEvento').AsString,4,2)+''')');
    try
       qryGrava.ExecSQL;
    except
       on E:EDBEngineError do
       begin
          MostrarErro(E);
          Exit;
       end;
    end;
  end;
  // Apagar CONTRIBUICOES GERADAS POR ESTE EVENTO
  if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // SOL 221079/15817 KINTANA 2060966
  begin

    qryGrava.Close;
    qryGrava.Sql.Clear;
    qryGrava.Sql.Add(' DELETE FROM HSTCONTRIBPREV  '+
                     ' WHERE  IDPESSJUR      = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                     ' AND    IDPLANOPREV    = '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                     ' AND    IDPESSOA       = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                     ' AND    SEQPROPOSTA    = ' +inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                     ' AND    FLGEVENTO      = 1 '+
                     ' AND    FLGINTEVENTO   = '''+qryUltEventoGerador.FieldByName('FlgInterno').AsString+''''+
                   //' AND    MESREFERENCIA  >= '''+Copy(qryUltEventoGerador.FieldByName('DataEvento').AsString,7,4)+'/'+Copy(qryUltEventoGerador.FieldByName('DataEvento').AsString,4,2)+''''); //Taffarel - SIG82652
                     ' AND    MESREFERENCIA  >= '''+Copy(qryUltEventoGerador.FieldByName('DataEvento').AsString,7,4)+'/'+Copy(qryUltEventoGerador.FieldByName('DataEvento').AsString,4,2)+''''+ //Taffarel - SIG82652
                     ' AND    NVL(VALORRECEBIDO, 0) = 0 '+ //Taffarel - SIG82652
                     ' AND    SITRECEBIMENTO IN (0,1)'); //Taffarel - SIG82652
    try


       qryGrava.ExecSQL;
    except
       on E:EDBEngineError do
       begin
          MostrarErro(E);
          Exit;
       end;
    end;
  end;
  with qryGrava do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT IDCONTRIBUICAO FROM CONTRIBPREVPARTP '+
             ' WHERE  IDPESSOA = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
             ' AND    IDPESSJUR = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
             ' AND    IDPLANOPREV = '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
             ' AND    SEQPROPOSTA = ' +inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
             ' AND    FLGCOBRA    = 1 ');
     Open;

     while not Eof do
     begin
        // ATUALIZAR ULTMESPREPARO NA CONTRIBPREVPARTP
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' SELECT MAX(MESREFERENCIA) AS MESREFERENCIA FROM HSTCONTRIBPREV '+
                       ' WHERE  IDPESSOA       = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                       ' AND    IDPESSJUR      = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                       ' AND    IDPLANOPREV    = '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                       ' AND    SEQPROPOSTA    = ' +inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                       ' AND    IDCONTRIBUICAO = '+FieldbyName('IDCONTRIBUICAO').AsString+
                       ' AND    FLGDEVOLUCAO   = 0 '+
                       ' AND    SUBSTR(MESREFERENCIA,6,2) <> ''13''');
        qryAux.Open;

        if (qryAux.IsEmpty) or (Trim(qryAux.FieldByName('MESREFERENCIA').AsString) = '')
        then sUltMesPreparo := '0000/00'
        else sUltMesPreparo := qryAux.FieldByName('MESREFERENCIA').AsString;

        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' SELECT MAX(MESREFERENCIA) AS MESREFERENCIA FROM HSTCONTRIBPREV '+
                       ' WHERE  IDPESSOA       = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                       ' AND    IDPESSJUR      = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                       ' AND    IDPLANOPREV    = '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                       ' AND    SEQPROPOSTA    = ' +inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                       ' AND    IDCONTRIBUICAO = '+FieldbyName('IDCONTRIBUICAO').AsString+
                       ' AND    FLGDEVOLUCAO   = 0 '+
                       ' AND    SUBSTR(MESREFERENCIA,6,2) = ''13'' ');
        qryAux.Open;

        if (qryAux.IsEmpty) or (Trim(qryAux.FieldByName('MESREFERENCIA').AsString) = '')
        then sUltAno13 := '0'
        else sUltAno13 := Copy(qryAux.FieldByName('MESREFERENCIA').AsString,1,4);

        qryAux.Close;
        qryAux.Sql.Clear;            
        qryAux.Sql.Add(' UPDATE CONTRIBPREVPARTP SET ULTMESPREPARO = '''+sUltMesPreparo+''', ULTANO13 = '+sUltAno13+
                       ' WHERE  IDPESSJUR      = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                       ' AND    IDPLANOPREV    = '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                       ' AND    IDPESSOA       = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                       ' AND    SEQPROPOSTA    = ' +inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                       ' AND    IDCONTRIBUICAO = '+FieldbyName('IDCONTRIBUICAO').AsString+
                       ' AND    FLGCOBRA       = 1 ');

        try
           qryAux.ExecSQL;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              Exit;
           end;
        end;
        Next;
     end;
  end;

  // Voltar o valor esperado e apagar a data de cancelamento e motivo de cancelamento
  // das contribuicoes zeradas pela rotina suspende contribuicoes
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE HSTCONTRIBPREV SET VALORESPERADO    = VALORCALCULADO,       '+
                 '                           DATACANCELAMENTO = NULL,                 '+
                 '                           MOTIVOCANCEL     = NULL                  '+
                 ' WHERE  IDPESSJUR      = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                 ' AND    IDPLANOPREV    = '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                 ' AND    IDPESSOA       = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                 ' AND    SEQPROPOSTA    = ' +inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                 ' AND    MESREFERENCIA  > '''+Copy(qryUltEventoGerador.FieldByName('DataEvento').AsString,7,4)+'/'+Copy(qryUltEventoGerador.FieldByName('DataEvento').AsString,4,2)+''''+
                 ' AND    (SUBSTR(MESREFERENCIA,6,2) <> ''13'' )                                                                                                                        '+
                 ' AND    FLGINTEVENTO   <> '''+qryUltEventoGerador.FieldByName('FLGINTERNO').AsString+'''                                                                              '+
                 ' AND    VALORESPERADO <= 0                                                                                                                                            '+
                 ' AND    VALORCALCULADO > 0                                                                                                                                            '+
                 ' AND    TO_CHAR(DATACANCELAMENTO,''DD/MM/YYYY'') = '''+qryUltEventoGerador.FieldByName('DataEvento').AsString+'''                                                     ');
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;
                                                                           
  // Se for evento para beneficiario, desassociar a cobranca de contribuicoes para o nucleo familiar
  if (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'FL')  and (sNumerosProcesso <> '')
  then begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' DELETE CONTRIBPREVNUCLEO '+
                    ' WHERE  IDNUCLEOFAMILIAR IN ( '+
                    '        SELECT DISTINCT B.IDNUCLEOFAMILIAR '+
                    '        FROM   BFCIARIOTITPLAN B, BENEFBFCIARIO BF '+
                    '        WHERE  BF.NUMEROPROCESSO IN ('+sNumerosProcesso+') '+
                    '        AND    BF.IDPESSJUR = B.IDPESSJUR       '+
//                    ' --       AND    BF.IDPLANOPREV = B.IDPLANOPREV   '+    SOL:107482 Daniel Begnami
//                    ' --       AND    BF.IDPLANOORIGEM = B.IDPLANOORIGEM '+  SOL:107482
                    '        AND    BF.IDTITULAR   = B.IDTITULAR     '+
                    '        AND    BF.IDPESSOA    = B.IDPESSOA      '+
                    '        AND    BF.SEQPROPOSTA = B.SEQPROPOSTA )');
//                    ' --       AND    BF.IDBENEFICIO = B.IDBENEFICIO )'+     SOL:107482

     try
        qryAux.ExecSQL;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;

     sNucleosFam := '';
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT DISTINCT B.IDNUCLEOFAMILIAR                     '+
                    ' FROM   BFCIARIOTITPLAN B, BENEFBFCIARIO BF             '+
                    ' WHERE  BF.NUMEROPROCESSO IN ('+sNumerosProcesso+')     '+
                    ' AND    BF.IDPESSJUR         = B.IDPESSJUR              '+
//                    ' --AND    BF.IDPLANOPREV       = B.IDPLANOPREV            '+ SOL:107482 Daniel Begnami
//                    ' --AND    BF.IDPLANOORIGEM     = B.IDPLANOORIGEM          '+ SOL:107482
                    ' AND    BF.IDTITULAR         = B.IDTITULAR              '+
                    ' AND    BF.IDPESSOA          = B.IDPESSOA               '+
                    ' AND    BF.SEQPROPOSTA       = B.SEQPROPOSTA ');
//                    ' --AND    BF.IDBENEFICIO       = B.IDBENEFICIO          '+  SOL:107482
     qryAux.Open;
     while not qryAux.Eof do
     begin
        if sNucleosFam = '' then
          sNucleosFam := qryAux.FieldByName('IDNUCLEOFAMILIAR').AsString
        else
          sNucleosFam := sNucleosFam +','+ qryAux.FieldByName('IDNUCLEOFAMILIAR').AsString;

        qryAux.Next;
     end;

     // SOL 198981 KTN 1914169 Otacilio ** Inicio **
     if Pos(',', sNucleosFam) > 0 then
       sNucleosFam := Copy(sNucleosFam, 0 , Length(sNucleosFam) - 1);
     // SOL 198981 KTN 1914169 Otacilio ** Fim **

     if Trim(sNucleosFam) <> ''
     then begin
        // APAGAR NUCLEO FAMILIAR
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' UPDATE BFCIARIOTITPLAN B SET IDNUCLEOFAMILIAR = NULL          '+
                       ' WHERE  EXISTS (                                               '+
                       '        SELECT 1                                               '+
                       '        FROM   BENEFBFCIARIO BF                                '+
                       '        WHERE  BF.NUMEROPROCESSO IN ('+sNumerosProcesso+')     '+
                       '        AND    BF.IDPESSJUR         = B.IDPESSJUR              '+
//                       '   --     AND    BF.IDPLANOPREV       = B.IDPLANOPREV          '+ SOL:107482 Daniel Begnami
//                       '   --     AND    BF.IDPLANOORIGEM     = B.IDPLANOORIGEM        '+ SOL:107482
                       '        AND    BF.IDTITULAR         = B.IDTITULAR              '+
                       '        AND    BF.IDPESSOA          = B.IDPESSOA               '+
                       '        AND    BF.SEQPROPOSTA       = B.SEQPROPOSTA )');
//                       '   --   AND    BF.IDBENEFICIO       = B.IDBENEFICIO            '+ SOL:107482
        try
           qryAux.ExecSQL;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              Exit;
           end;
        end;

        // SOL 198981 KTN 1914169 Otacilio ** Inicio **
        // Ao executar o delete ocorria o erro na variavel sNucleosFam com uma virgula a mais
        qryAux.Close;
        qryAux.SQL.Clear;
        qryAux.SQL.Add(' DELETE NUCLEOFAMILIAR NF                                      '+
                       ' WHERE  IDNUCLEOFAMILIAR IN ('+sNucleosFam+')                  ');
        try
           qryAux.ExecSQL;
        except
          on E: Exception do
          begin
            MessageBox(handle,PChar('Ocorreu o seguinte erro:'#13#13+E.Message+#13#13'Anote o erro e entre em contato com o Suporte.'),'Atenção',MB_OK+MB_ICONERROR);
            exit;
          end;
        {
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              Exit;
           end;

        }
        end;
     end; // if Trim(sNucleosFam) <> ''
  end;

  if (qryUltEventoGerador.FieldByName('FlgInterno').AsString        = 'FL') or
     (qryUltEventoGerador.FieldByName('FLGENCERRABENEFI').AsInteger = 1)
  then begin
     // Verificar se a pessoa teve benefício encerrado por causa do falecimento
     with qryAux do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT DISTINCT NUMEROPROCESSO FROM MOVBENEF '+
                ' WHERE  IDPESSJUR      = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                ' AND    IDPLANOPREV    = '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                ' AND    IDTITULAR      = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                ' AND    IDPESSOA       = '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                ' AND    SEQPROPOSTA    = ' +inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                ' AND    TIPOMOV        = 4 '+
                //Marcio Sanches Spinosa SOL 247414 KINTANA 657530 - Inicio
//                ' AND    DATAMOV        = TO_DATE('''+qryUltEventoGerador.FieldByName('DATAREGISTRO').AsString+''',''DD/MM/YYYY'') ');
                ' AND    DATAMOV        = TO_DATE(SUBSTR('''+qryUltEventoGerador.FieldByName('DATAREGISTRO').AsString+''',0,10),''DD/MM/YYYY'') ');
                //Marcio Sanches Spinosa SOL 247414 KINTANA 657530 - Fim
        Open;

        while not Eof do
        begin
           if not DesfazRetencaoEncerramentoNOVA(qryGrava,qryLogOcorrencia,FieldByName('NUMEROPROCESSO').AsInteger)
           then begin
              MsgDlg('Ocorreram erros ao desfazer o Encerramento de Benefício. Verifique. ','Informação',mtInformation,[mbOk],0);
              Exit;
           end;

           Next;
        end; // while
     end; // with
  end; // if evento = falecimento

  // VERifICAR QUE RUBRICAS O EVENTO GERA PARA APAGÁ-LAS
  // Abrir query com rubricas de salarios
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT IDRUBSALAUXDOENCA, IDRUBSALMANUT, IDRUBSALMANUTPARC, IDRUBSALPARTICIP '+
                 ' FROM   PATRO '+
                 ' WHERE  IDPESSOA = '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger));
  qryAux.Open;

  sIdRubSalAuxDoenca  := OraNumero(qryAux.FieldByName('IdRubSalAuxDoenca').AsString);
  sIdRubSalManut      := OraNumero(qryAux.FieldByName('IdRubSalManut').AsString);
  sIdRubSalManutParc  := OraNumero(qryAux.FieldByName('IdRubSalManutParc').AsString);
  sIdRubSalParticip   := OraNumero(qryAux.FieldByName('IdRubSalParticip').AsString);

  // APAGAR SALARIOS GERADOS PELO EVENTO
  sAnoMesInicio := Copy(qryUltEventoGerador.FieldByName('DataEvento').AsString,7,4)+'/'+
                   Copy(qryUltEventoGerador.FieldByName('DataEvento').AsString,4,2);

  if (not qryVerificaDataFinal.IsEmpty) and (qryVerificaDataFinal.FieldByName('DataFinal').AsString <> '') Then
  begin
     sAnoMesFinal  := Copy(qryVerificaDataFinal.FieldByName('DataFinal').AsString,7,4)+'/'+Copy(qryVerificaDataFinal.FieldByName('DataFinal').AsString,4,2);

     if qryVerificaDataFinal.FieldByName('DataFinal').AsDateTime <= date
     then bApaga13 := True
     else bApaga13 := False;
  end
  else
  Begin
     sAnoMesFinal  := Copy(FormatDateTime('dd/mm/yyyy', Date),7,4) + '/' +
                      Copy(FormatDateTime('dd/mm/yyyy', Date),4,2);
     bApaga13      := False;
  end;

  if (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DM') or
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DS') or
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'AF') or
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'PD')
  then begin
     if not ApagaSalarios (qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger,
                           qryultEventoGerador.FieldByName('IDPESSOA').AsInteger,
                           sAnoMesInicio,
                           sAnoMesFinal,
                           sIdRubSalManut)
     then Exit;

     if (bApaga13) and (not ApagaSalarios (qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger,
                                           qryultEventoGerador.FieldByName('IDPESSOA').AsInteger,
                                           Copy(sAnoMesFinal,1,4)+'/13',
                                           Copy(sAnoMesFinal,1,4)+'/13',
                                           sIdRubSalManut) )
     then Exit;

  end;
  if (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'DO') or
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'AC') or
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'OE')
  then begin
     if not ApagaSalarios (qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger,
                           qryultEventoGerador.FieldByName('IDPESSOA').AsInteger,
                           sAnoMesInicio,
                           sAnoMesFinal,
                           sIdRubSalAuxDoenca)
     then Exit;
     if (bApaga13) and (not ApagaSalarios (qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger,
                                           qryultEventoGerador.FieldByName('IDPESSOA').AsInteger,
                                           Copy(sAnoMesFinal,1,4)+'/13',
                                           Copy(sAnoMesFinal,1,4)+'/13',
                                           sIdRubSalAuxDoenca) )
     then Exit;
  end;

  if (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'RA') or
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'IP') or
     (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'RM')
  then begin
     if not ApagaSalarios (qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger,
                           qryultEventoGerador.FieldByName('IDPESSOA').AsInteger,
                           sAnoMesInicio,
                           sAnoMesFinal,
                           sIdRubSalParticip)
     then Exit;

     if (bApaga13) and (not ApagaSalarios (qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger,
                                           qryultEventoGerador.FieldByName('IDPESSOA').AsInteger,
                                           Copy(sAnoMesFinal,1,4)+'/13',
                                           Copy(sAnoMesFinal,1,4)+'/13',
                                           sIdRubSalParticip) )
     then Exit;
  end;

  if (qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'MP')
  then begin // apagar rubrica de salario de manut. parcial e de particip. ativo
     if not ApagaSalarios (qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger,
                           qryultEventoGerador.FieldByName('IDPESSOA').AsInteger,
                           sAnoMesInicio,
                           sAnoMesFinal,
                           sIdRubSalManutParc)
     then Exit;

     if (bApaga13) and (not ApagaSalarios (qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger,
                                           qryultEventoGerador.FieldByName('IDPESSOA').AsInteger,
                                           Copy(sAnoMesFinal,1,4)+'/13',
                                           Copy(sAnoMesFinal,1,4)+'/13',
                                           sIdRubSalManutParc) )
     then Exit;

     if not ApagaSalarios (qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger,
                           qryultEventoGerador.FieldByName('IDPESSOA').AsInteger,
                           sAnoMesInicio,
                           sAnoMesFinal,
                           sIdRubSalParticip)
     then Exit;

     if (bApaga13) and (not ApagaSalarios (qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger,
                                           qryultEventoGerador.FieldByName('IDPESSOA').AsInteger,
                                           Copy(sAnoMesFinal,1,4)+'/13',
                                           Copy(sAnoMesFinal,1,4)+'/13',
                                           sIdRubSalParticip) )
     then Exit;
  end;

  { Novo tratamento para a exclusão da DETCALCULO }

  ExcluiDetCalculo( qryultEventoGerador.FieldByName('IDCALCULO').AsInteger );

  // DELETAR OS REGISTROS COM IDEVENTOSPREV DO EVENTOSPREV
  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.Sql.Add(' DELETE FROM EVENTOSPREV '+
                   ' WHERE IDEVENTOSPREV = '+inttostr(qryultEventoGerador.FieldByName('IDEVENTOSPREV').AsInteger));
  try
     qryGrava.ExecSQL;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;

  //BRUNO AZEVEDO SOL 141727 KINTANTA 900601
  // Operação a realizar na reserva (abatida ou acrescida) para cada item da HISTMOVRESERVA:
  // 1º - Se for entrada(FLGENTRADA=1), fazer (na RESERVAPART) VALORESERVA=VALORRESERVA-VLRCOTAS(HISTMOVRESERVA)
  // 2º - Se for saída(FLGENTRADA=0), fazer (na RESERVAPART) VALORESERVA=VALORRESERVA+VLRCOTAS(HISTMOVRESERVA)
  // 3º - Após esta operação excluir linhas da HISTMOVRESERVA.

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT * '+
          ' FROM HISTMOVRESERVA HM '+
          ' WHERE   IDPESSJUR      =  '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
          ' AND     IDPLANOPREV    =  '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
          ' AND     IDPARTICIPANTE =  '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
          ' AND     SEQPROPOSTA    =  '+inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
          ' AND     IDEVENTOGERADOR = '+inttostr(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsInteger)+
          //BRUNO AZEVEDO SOL 161500 KINTANA 1362243
          ' AND TO_CHAR(TRGDTINCLUSAO, ''DD/MM/YYYY'') = (SELECT DATACONCESSAO FROM BENEFBFCIARIO BFC '+
          '                                                WHERE BFC.IDPESSOA = HM.IDPESSOA '+
          '                                                AND BFC.IDPLANOPREV = HM.IDPLANOPREV '+ //SOL 172388 KINTANA 1550574
          '                                                AND BFC.IDBENEFICIO = HM.IDBENEFICIO '+
          '                                                AND BFC.NUMEROPROCESSO = ' + sNumerosProcesso + ')'  //SIG83835
          );
  try
     qryAux.Open;     // Xavier

  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;

  //só atualiza a reservapart se o evento movimentou reservas
  //atualiza com o valor do saldo da última movimentação feita antes do
  //evento
  while not qryaux.eof do
  begin

     qrygrava.Close;
     qrygrava.SQL.Clear;
     qrygrava.SQL.Add(' SELECT RP.VALORRESERVA, RX.INDICEREAJUSTE  '+
                      ' FROM RESERVAPART RP , RESERVAXPLANO RX '+
                      ' WHERE   RP.IDPESSJUR      =  '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                      ' AND     RP.IDPLANOPREV    =  '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                      ' AND     RP.IDPESSOA       =  '+inttostr(qryAux.FieldByName('IDPESSOA').AsInteger)+
                      ' AND     RP.SEQPROPOSTA    =  '+inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                      ' AND     RP.IDTIPORESERVA  = '+inttostr(qryaux.FieldByName('IDTIPORESERVA').AsInteger)+
                      ' AND     RX.IDPLANOPREV    = RP.IDPLANOPREV '+
                      ' AND     RX.IDTIPORESERVA  = RP.IDTIPORESERVA ');
     qrygrava.Open;



     dSaldoAtu := 0;
     dSaldoRealAtu := 0;

     dSaldoAtu := qrygrava.fieldbyname('VALORRESERVA').AsFloat;

     if qryaux.fieldbyname('FLGENTRADA').AsInteger = 0
      then dSaldoAtu := dSaldoAtu + qryaux.fieldbyname('VLRCOTAS').AsFloat
      Else dSaldoAtu := dSaldoAtu - qryaux.fieldbyname('VLRCOTAS').AsFloat;


        qrygrava.close;
        qrygrava.sql.text := ' UPDATE RESERVAPART SET VALORRESERVA = '+oranumero(FloatToStr(dSaldoAtu))+' '+
                             ' WHERE   IDPESSJUR    =  '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                             ' AND     IDPLANOPREV  =  '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                             ' AND     IDPESSOA     =  '+inttostr(qryAux.FieldByName('IDPESSOA').AsInteger)+
                             ' AND     SEQPROPOSTA  =  '+inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                             ' AND    IDTIPORESERVA = '+qryaux.fieldbyname('IDTIPORESERVA').AsString+' ';
        qrygrava.execsql;

     qryaux.next;
  end;//while

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE FROM HISTMOVRESERVA HM '+
                 ' WHERE   IDPESSJUR      =  '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                 ' AND     IDPLANOPREV    =  '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                 ' AND     IDPARTICIPANTE =  '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                 ' AND     SEQPROPOSTA    =  '+inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                 ' AND     IDEVENTOGERADOR = '+inttostr(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsInteger)+

                 ' AND TO_CHAR(TRGDTINCLUSAO, ''DD/MM/YYYY'') = (SELECT DATACONCESSAO FROM BENEFBFCIARIO BFC '+
                 '                                                WHERE BFC.IDPESSOA = HM.IDPESSOA '+
                 '                                                AND BFC.IDPLANOPREV = HM.IDPLANOPREV '+ //SOL 172388 KINTANA 1550574
                 '                                                AND BFC.IDBENEFICIO = HM.IDBENEFICIO '+
                 '                                                AND BFC.NUMEROPROCESSO = ' + sNumerosProcesso +')');////SIG83835
// SOL 172388 KINTANA 1550574 COMENTADO O TRECHO ABAIXO E ADD O TRECHO ACIMA

//                 ' AND TO_CHAR(TRGDTINCLUSAO, ''DD/MM/YYYY'') = (SELECT DATACONCESSAO FROM BENEFBFCIARIO BFC '+
//                 '                                                WHERE BFC.IDPESSOA    = HM.IDPESSOA AND BFC.NUMEROPROCESSO = DECODE(BFC.NUMEROPROCESSO,NULL,0,BFC.NUMEROPROCESSO) '+ // SOL 161839 KINTANA 1369298 adicionado
//                '                                                AND   BFC.IDBENEFICIO = HM.IDBENEFICIO )'); // SOL 164210 KINTANA 1408631
//                 //                 '                                                WHERE BFC.IDPESSOA = HM.IDPESSOA AND BFC.NUMEROPROCESSO = '+sNumerosProcesso+') ');   // SOL 161839 KINTANA 1369298 comentado
  try
     qryAux.ExecSQL



  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;
  //BRUNO AZEVEDO SOL 141727 KINTANTA 900601

  if not qryProcessoBenef.IsEmpty
  then begin

     QryAuxCalc := Tquery.Create(Self);
     QryAuxCalc.databasename := 'BASEDADOS';
     QryAuxCalc.SQL.Add('SELECT IDCALCULO FROM RELBENEFPART WHERE NUMEROPROCESSO IN ('+sNumerosProcesso+')');
     QryAuxCalc.Open;

     While not QryAuxCalc.eof do
     begin

        ExcluiDetCalculo( QryAuxCalc.fieldbyname('IDCALCULO').AsInteger );

        QryAuxCalc.next;
     end;
     QryAuxCalc.Free;

     if not DesfazRequerimentos(qryAux,sNumerosProcesso)
     then begin
        MsgDlg('Ocorreram erros ao desfazer o Requerimento de Benefício. Verifique. ','Informação',mtInformation,[mbOk],0);
        Exit;
     end;
  end;

  if qryUltEventoGerador.FieldByName('FlgInterno').AsString = 'IP'
  then begin
     qryGrava.Close;
     qryGrava.Sql.Clear;
     qryGrava.Sql.Add(' DELETE FROM BENEFPLANOPART '+
                      ' WHERE  IDPESSJUR   = '+qryultEventoGerador.FieldByName('IDPESSJUR').AsString+
                      ' AND    IDPLANOPREV = '+qryultEventoGerador.FieldByName('IDPLANOPREV').AsString +
                      ' AND    IDPESSOA    = '+qryultEventoGerador.FieldByName('IDPESSOA').AsString+
                      ' AND    SEQPROPOSTA = '+qryultEventoGerador.FieldByName('SEQPROPOSTA').AsString);

     try
        qryGrava.ExecSQL;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;

     qryGrava.Close;
     qryGrava.Sql.Clear;

     qryGrava.Sql.Add(' DELETE FROM BFCIARIOTITPLAN  '+
                      ' WHERE  IDPESSJUR   = '+qryultEventoGerador.FieldByName('IDPESSJUR').AsString+
                      ' AND    IDPLANOORIGEM = '+qryultEventoGerador.FieldByName('IDPLANOPREV').AsString +
                      ' AND    IDTITULAR   = '+qryultEventoGerador.FieldByName('IDPESSOA').AsString+
                      ' AND    SEQPROPOSTA = '+qryultEventoGerador.FieldByName('SEQPROPOSTA').AsString);

     try
        qryGrava.ExecSQL;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;

     if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // SOL 221079/15817 KINTANA 2060966
     begin

       qryGrava.Close;
       qryGrava.Sql.Clear;
       qryGrava.Sql.Add(' DELETE FROM HSTCONTRIBPREV  '+
                        ' WHERE  IDPESSJUR   = '+qryultEventoGerador.FieldByName('IDPESSJUR').AsString+
                        ' AND    IDPLANOPREV = '+qryultEventoGerador.FieldByName('IDPLANOPREV').AsString +
                        ' AND    IDPESSOA    = '+qryultEventoGerador.FieldByName('IDPESSOA').AsString+
                        ' AND    SEQPROPOSTA = '+qryultEventoGerador.FieldByName('SEQPROPOSTA').AsString);

       try
          qryGrava.ExecSQL;
       except
          on E:EDBEngineError do
          begin
             MostrarErro(E);
             Exit;
          end;
       end;

       //Renato Visoni SOL 141131 Kintana 890567
       qryGrava.Close;
       qryGrava.Sql.Clear;
       qryGrava.Sql.Add('DELETE FROM HSTPERCONTRIBPREV');
       qryGrava.Sql.Add(' WHERE  IDPESSJUR   = '+qryultEventoGerador.FieldByName('IDPESSJUR').AsString);
       qryGrava.Sql.Add(' AND    IDPLANOPREV = '+qryultEventoGerador.FieldByName('IDPLANOPREV').AsString);
       qryGrava.Sql.Add(' AND    IDPESSOA    = '+qryultEventoGerador.FieldByName('IDPESSOA').AsString);
       qryGrava.ExecSQL;
       //Renato Visoni SOL 141131 Kintana 890567

       qryGrava.Close;
       qryGrava.Sql.Clear;
       qryGrava.Sql.Add(' DELETE FROM CONTRIBPREVPARTP '+
                        ' WHERE  IDPESSJUR   = '+qryultEventoGerador.FieldByName('IDPESSJUR').AsString+
                        ' AND    IDPLANOPREV = '+qryultEventoGerador.FieldByName('IDPLANOPREV').AsString +
                        ' AND    IDPESSOA    = '+qryultEventoGerador.FieldByName('IDPESSOA').AsString+
                        ' AND    SEQPROPOSTA = '+qryultEventoGerador.FieldByName('SEQPROPOSTA').AsString);

       try
          qryGrava.ExecSQL;
       except
          on E:EDBEngineError do
          begin
             MostrarErro(E);
             Exit;
          end;
       end;
     end;
     qryGrava.Close;
     qryGrava.Sql.Clear;
     qryGrava.Sql.Add(' DELETE FROM PARTPREVPLAN '+
                      ' WHERE  IDPESSJUR   = '+qryultEventoGerador.FieldByName('IDPESSJUR').AsString+
                      ' AND    IDPLANOPREV = '+qryultEventoGerador.FieldByName('IDPLANOPREV').AsString +
                      ' AND    IDPESSOA    = '+qryultEventoGerador.FieldByName('IDPESSOA').AsString+
                      ' AND    SEQPROPOSTA = '+qryultEventoGerador.FieldByName('SEQPROPOSTA').AsString);
     try
        qryGrava.ExecSQL;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;


     // Se o participante so participou de um plano, apagar a tabela de dados na fundacao
     qryGrava.Close;
     qryGrava.Sql.Clear;
     qryGrava.Sql.Add(' SELECT COUNT(*) AS TOTAL FROM PARTPREVPLAN '+
                      ' WHERE  IDPESSOA    = '+qryultEventoGerador.FieldByName('IDPESSOA').AsString);
     qryGrava.Open;

     if (qryGrava.IsEmpty) or (qryGrava.FieldByName('TOTAL').AsInteger <= 0)
     then begin
        qryGrava.Close;
        qryGrava.Sql.Clear;
        qryGrava.Sql.Add(' DELETE FROM PESSOAXFUND '+
                         ' WHERE  IDFUNDACAO  = '+IntToStr(iIdFundacao)+
                         ' AND    IDPESSOA    = '+qryultEventoGerador.FieldByName('IDPESSOA').AsString);

        try
           qryGrava.ExecSQL;
        except
           on E:EDBEngineError do
           begin
              MostrarErro(E);
              Exit;
           end;
        end;
     end;
  end; // se for inscricao


  //BRUNO AZEVEDO SOL 141727 KINTANTA 900601 - COMENTADO
  {// Operação a realizar na reserva (abatida ou acrescida) para cada item da HISTMOVRESERVA:
  // 1º - Se for entrada(FLGENTRADA=1), fazer (na RESERVAPART) VALORESERVA=VALORRESERVA-VLRCOTAS(HISTMOVRESERVA)
  // 2º - Se for saída(FLGENTRADA=0), fazer (na RESERVAPART) VALORESERVA=VALORRESERVA+VLRCOTAS(HISTMOVRESERVA)
  // 3º - Após esta operação excluir linhas da HISTMOVRESERVA.

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT * '+
          ' FROM HISTMOVRESERVA HM '+
          ' WHERE   IDPESSJUR      =  '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
          ' AND     IDPLANOPREV    =  '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
          ' AND     IDPARTICIPANTE =  '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
          ' AND     SEQPROPOSTA    =  '+inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
          ' AND     IDEVENTOGERADOR = '+inttostr(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsInteger)+
          //BRUNO AZEVEDO SOL KINTANA
          ' AND TO_CHAR(TRGDTINCLUSAO, ''DD/MM/YYYY'') = (SELECT DATACONCESSAO FROM BENEFBFCIARIO BFC '+
          '                                                WHERE BFC.IDPESSOA = HM.IDPESSOA) '); 
  try
     qryAux.Open;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;


  //só atualiza a reservapart se o evento movimentou reservas
  //atualiza com o valor do saldo da última movimentação feita antes do
  //evento
  while not qryaux.eof do
  begin

     qrygrava.Close;
     qrygrava.SQL.Clear;
     qrygrava.SQL.Add(' SELECT RP.VALORRESERVA, RX.INDICEREAJUSTE  '+
                      ' FROM RESERVAPART RP , RESERVAXPLANO RX '+
                      ' WHERE   RP.IDPESSJUR      =  '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                      ' AND     RP.IDPLANOPREV    =  '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                      ' AND     RP.IDPESSOA       =  '+inttostr(qryAux.FieldByName('IDPESSOA').AsInteger)+ 
                      ' AND     RP.SEQPROPOSTA    =  '+inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                      ' AND     RP.IDTIPORESERVA  = '+inttostr(qryaux.FieldByName('IDTIPORESERVA').AsInteger)+
                      ' AND     RX.IDPLANOPREV    = RP.IDPLANOPREV '+
                      ' AND     RX.IDTIPORESERVA  = RP.IDTIPORESERVA ');
     qrygrava.Open;



     dSaldoAtu := 0;
     dSaldoRealAtu := 0;

     dSaldoAtu := qrygrava.fieldbyname('VALORRESERVA').AsFloat;

     if qryaux.fieldbyname('FLGENTRADA').AsInteger = 0
      then dSaldoAtu := dSaldoAtu + qryaux.fieldbyname('VLRCOTAS').AsFloat
      Else dSaldoAtu := dSaldoAtu - qryaux.fieldbyname('VLRCOTAS').AsFloat;


        qrygrava.close;
        qrygrava.sql.text := ' UPDATE RESERVAPART SET VALORRESERVA = '+oranumero(FloatToStr(dSaldoAtu))+' '+
                             ' WHERE   IDPESSJUR    =  '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                             ' AND     IDPLANOPREV  =  '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                             ' AND     IDPESSOA     =  '+inttostr(qryAux.FieldByName('IDPESSOA').AsInteger)+ 
                             ' AND     SEQPROPOSTA  =  '+inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                             ' AND    IDTIPORESERVA = '+qryaux.fieldbyname('IDTIPORESERVA').AsString+' ';
        qrygrava.execsql;

     qryaux.next;
  end;//while

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' DELETE FROM HISTMOVRESERVA HM '+
                 ' WHERE   IDPESSJUR      =  '+inttostr(qryultEventoGerador.FieldByName('IDPESSJUR').AsInteger)+
                 ' AND     IDPLANOPREV    =  '+inttostr(qryultEventoGerador.FieldByName('IDPLANOPREV').AsInteger)+
                 ' AND     IDPARTICIPANTE =  '+inttostr(qryultEventoGerador.FieldByName('IDPESSOA').AsInteger)+
                 ' AND     SEQPROPOSTA    =  '+inttostr(qryultEventoGerador.FieldByName('SEQPROPOSTA').AsInteger)+
                 ' AND     IDEVENTOGERADOR = '+inttostr(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsInteger)+
                 ' AND TO_CHAR(TRGDTINCLUSAO, ''DD/MM/YYYY'') = (SELECT DATACONCESSAO FROM BENEFBFCIARIO BFC '+
                 '                                                WHERE BFC.IDPESSOA = HM.IDPESSOA) ');
  try
     qryAux.ExecSQL
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;   }
  //BRUNO AZEVEDO SOL 141727 KINTANTA 900601 - COMENTADO
  
  Result := True;
end;

procedure TfrmCancelaEvento.VerificaEvolucaoPens;
  {-->}
  Function HePagtoUnico(QryAux: TwwQuery; pIdTpPagto: String): Boolean;
  begin
    With qryAux do
    begin
      Sql.Clear;
      Sql.Add( ' SELECT FLGFREQUENCIA FROM TPPAGTOBENEFICIO ' +
               ' WHERE IDTPPAGTOBENEFIC = '+pIdTpPagto);
      Open;
      if (IsEmpty) Or (FieldByname('FLGFREQUENCIA').AsString = 'U') then
        Result := True
      Else Result := False;
    end;
  end;

begin
   if trim(sNumerosProcesso) = '' then exit; 


   // Fazendo um loop em todos os processos na PROCESSOBENEF abertos, garanto que,
   // se houver um beneficio de pagto. único, deleto os pensionistas da EVOLFUNCPREV
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add('SELECT P.NUMEROPROCESSO, BF.IDBENEFICIO, B.NOME, BF.IDTPPAGTOBENEFIC '+
                  ' FROM   PROCESSOBENEF P, BENEFBFCIARIO BF, BENEFICIO B               '+
                  ' WHERE  P.NUMEROPROCESSO  IN ('+sNumerosProcesso+')               '+
                  ' AND    BF.NUMEROPROCESSO = P.NUMEROPROCESSO                         ');
   qryAux.Open;

   qryAux.First;
   while not qryAux.Eof do
   begin
     // verifica que o beneficio é pagto único.
     if HePagtoUnico(qryAux2,qryAux.FieldByName('IDTPPAGTOBENEFIC').AsString)
     then begin
       qryAux.Next;
       Continue;
     end;

     // se for pagto. único possivelmente há pensionistas na evolfuncprev.
     qryAux2.Close;
     qryAux2.Sql.Clear;
     qryAux2.Sql.Add( ' DELETE FROM EVOLFUNCPREV                            '+
                      ' WHERE IDPESSOA IN ( SELECT IDPESSOA FROM DEPENTIT   '+
                      '                     WHERE  IDTITULAR = '+ sIdPessoa  +
                      '                     AND    IDPESSOA  <> IDTITULAR)  ');
     qryAux2.ExecSQL;
     Break;
   end;
end;

function TfrmCancelaEvento.VerificaEventoMigrado(
  pIdEventosPrev: String): Boolean;
Var
  _qry: TwwQuery;
begin
  try
    _qry := TwwQuery.Create(Application);
    With _qry Do
    begin
      DatabaseName :=  'BaseDados';
      sql.Add(' SELECT NVL(FLGMIGRADO,0) FLGMIGRADO '+
              ' FROM EVENTOSPREV WHERE IDEVENTOSPREV = '+ pIdEventosPrev);
      Open;
      if Not IsEmpty then
        Result := FieldByName('FLGMIGRADO').AsInteger > 0
      Else Result := False;
      Close;
    end;
  Finally
    _qry.Free;
  end;

end;


function TfrmCancelaEvento.VerificaEventoINSS(
  pIdEventoGerador: String): Boolean;
Var
  _qry: TwwQuery;
begin
  try
    _qry := TwwQuery.Create(Application);
    With _qry Do
    begin
      DatabaseName :=  'BaseDados';
      sql.Add(' SELECT 1 QTDE '+
              ' FROM EVENTOGERADOR WHERE ((IDEVENTOGERADOR in (129,130)) OR (UPPER(NOME) LIKE ''%INSS%'')) AND IDEVENTOGERADOR = '+ pIdEventoGerador);
      Open;
      if Not IsEmpty then
        Result := FieldByName('QTDE').AsInteger > 0
      Else Result := False;
      Close;
    end;
  Finally
    _qry.Free;
  end;

end;



function TfrmCancelaEvento.CancelaEventoRetornoParaAtivo ( sIdPatroAntiga, sIdPlanoPrevAntigo : String) : Boolean;

  {Como o tratamento do cancelamento do evento de retorno de mantido para ativo é muito diferente
  dos demais, foi criada esta função com toda a funcionalidade necessária para execução da mesma.}

begin
  // Verifica situações que possam impossibilitar cancelamento
  if Not PermiteCancelamentoDoEvento then
  begin
    Result := False;
    Exit;
  end;


  // INICIO - ACERTO NAS RESERVAS ANTIGAS
  qryGrava.Sql.Clear;
  qryGrava.Sql.Add(' UPDATE RESERVAPART RP                                    '+
                   '  SET RP.VALORRESERVA = (SELECT RP2.VALORRESERVA          '+
                   '          FROM RESERVAPART RP2                            '+
                   '          WHERE RP2.IDPESSOA = RP.IDPESSOA                '+
                   '            AND RP2.IDPESSJUR = ' + sIdPessJur             +
                   '              AND RP2.IDTIPORESERVA = RP.IDTIPORESERVA)   '+
                   '  WHERE RP.IDPESSOA  = ' + qryultEventoGerador.FieldByName('IDPESSOA').AsString +
                   '    AND RP.IDPESSJUR = ' + sIdPatroAntiga                  );
  try
     qryGrava.ExecSQL;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Result := False;
        Exit;
     end;
  end;
  // FIM - ACERTO NAS RESERVAS ANTIGAS


  // INICIO - ZERAR RESERVAS NOVAS
  qryGrava.Sql.Clear;
  qryGrava.Sql.Add(' UPDATE RESERVAPART RP                    '+
                   '  SET RP.VALORRESERVA = NULL              '+
                   '  WHERE RP.IDPESSOA = ' + qryultEventoGerador.FieldByName('IDPESSOA').AsString +
                   '    AND RP.IDPESSJUR = ' + sIdPessjur     );
  try
     qryGrava.ExecSQL;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Result := False;
        Exit;
     end;
  end;
  // FIM - ZERAR RESERVAS NOVAS



  try

     if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
     begin

       qryGrava.Sql.Clear;;
       qryGrava.SQL.Add(' UPDATE PARTPREVPLAN SET FLGDESATIVADO  = 0,  '+
               '                         IDSITPART      = '+OraNumero(qryultEventoGerador.FieldByName('IDSITPARTATUAL').AsString)+','+
               '                         IDSITPLANOPREV = '+OraNumero(qryultEventoGerador.FieldByName('IDSITPLANOATUAL').AsString)+
               ' WHERE  IDPESSJUR   <> '+qryultEventoGerador.FieldByName('IDPESSJUR').AsString+
               ' AND    IDPLANOPREV = '+qryultEventoGerador.FieldByName('IDPLANOPREV').AsString+
               ' AND    IDPESSOA    = '+qryultEventoGerador.FieldByName('IDPESSOA').AsString+
               ' AND    SEQPROPOSTA = '+qryultEventoGerador.FieldByName('SEQPROPOSTA').AsString);
       qryGrava.ExecSQL;
     end;

     qryGrava.Sql.Clear;
     qryGrava.Sql.Add(' DELETE EVENTOSPREV    ' +
                      ' WHERE IDEVENTOSPREV = ( SELECT MAX(IDEVENTOSPREV) FROM EVENTOSPREV WHERE IDPESSJUR        =   ' + sIdPessJur +
                      ' AND   IDPESSOA         =   ' + qryultEventoGerador.FieldByName('IDPESSOA').AsString +
                      ' AND   SEQPROPOSTA      = 1) ' );
     qryGrava.ExecSQL;


     qryGrava.Sql.Clear;
     qryGrava.Sql.Add(' DELETE EVENTOSPREV    ' +
                      ' WHERE IDEVENTOSPREV = ( SELECT MAX(IDEVENTOSPREV) '+
                      ' FROM EVENTOSPREV WHERE  IDPESSOA         =   ' + qryultEventoGerador.FieldByName('IDPESSOA').AsString +
                      ' AND   SEQPROPOSTA      = 1    '+
                      ' AND   IDEVENTOGERADOR IN (SELECT IDEVENTOGERADOR FROM EVENTOGERADOR WHERE FLGINTERNO = ''RA'')) ' );
     qryGrava.ExecSQL;



     qryGrava.Sql.Clear;
     qryGrava.Sql.Add(' DELETE RESERVAPART       '+
                   '  WHERE IDPESSOA = ' + qryultEventoGerador.FieldByName('IDPESSOA').AsString +
                   '    AND IDPESSJUR = ' + sIdPessjur     );
     qryGrava.ExecSQL;


     //tenta deleter as oinclusões feitas pelo evento
     qryGrava.Sql.Clear;
     qryGrava.Sql.Add(' DELETE CONTRIBPREVPARTP    ' +
                      ' WHERE IDPESSJUR        =   ' + sIdPessJur +
                      ' AND   IDPESSOA         =   ' + qryultEventoGerador.FieldByName('IDPESSOA').AsString +
                      ' AND   SEQPROPOSTA      = 1 ' );
     qryGrava.ExecSQL;


     // Cancela situação na PARTPREVPLAN Na Patro ATUAL.
     qryGrava.Sql.Clear;
     qryGrava.Sql.Add(' DELETE PARTPREVPLAN '+
                      ' WHERE IDPESSJUR     =  ' + sIdPessJur +
                      ' AND   IDPESSOA      =  ' + qryultEventoGerador.FieldByName('IDPESSOA').AsString  );
     qryGrava.ExecSQL;



     // Volta situação na ELEGPATRO Na Patro ATUAL.
     if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
     begin
       qryGrava.Sql.Clear;
       qryGrava.Sql.Add(' DELETE ELEGPATRO  '+
                        ' WHERE IDPESSJUR = ' + sIdPessJur +
                        ' AND   IDPESSOA = ' + qryultEventoGerador.FieldByName('IDPESSOA').AsString);
       qryGrava.ExecSQL;
     end;

  except
    //caso dê errado
    //quer dizer que gerou-se "filhos", como histórico de contribuições
    //benefícios, e neste caso os registros devem permanecer
  end;

  // Volta situação na ELEGPATRO Na Patro ANTIGA.
  if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
  begin

    qryGrava.Sql.Clear;
    qryGrava.Sql.Add(' UPDATE ELEGPATRO SET IDSITFUNC = '+qryAux.FieldByName('IDSITFUNCATUAL').AsString+
                     ' WHERE IDPESSJUR = ' + sIdPatroAntiga +
                     ' AND   IDPESSOA  = ' + qryultEventoGerador.FieldByName('IDPESSOA').AsString);
    try
       qryGrava.ExecSQL;
    except
       on E:EDBEngineError do
       begin
          MostrarErro(E);
          Result := False;
          Exit;
       end;
    end;
  end;

  // Volta situação na ELEGPATRO Na Patro ATUAL.
  if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
  begin

    qryGrava.Sql.Clear;
    qryGrava.Sql.Add(' UPDATE ELEGPATRO SET IDSITFUNC = '+ qryUltEventoGerador.FieldByName('IDSITFUNCATUAL').AsString+
                     ' WHERE IDPESSJUR = ' + sIdPessJur +
                     ' AND   IDPESSOA = ' + qryultEventoGerador.FieldByName('IDPESSOA').AsString);
    try
       qryGrava.ExecSQL;
    except
       on E:EDBEngineError do
       begin
          MostrarErro(E);
          Result := False;
          Exit;
       end;
    end;
  end;


  // Cancela situação na PARTPREVPLAN Na Patro ATUAL.
  if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
  begin

    qryGrava.Sql.Clear;
    qryGrava.Sql.Add(' UPDATE PARTPREVPLAN SET IDSITPART = '+ qryUltEventoGerador.FieldByName('IDSITPARTATUAL').AsString +
                     ' , IDSITPLANOPREV    =  ' + qryUltEventoGerador.FieldByName('IDSITPLANOATUAL').AsString +
                     ' , FLGDESATIVADO     = 1' +
                     ' WHERE IDPESSJUR     =  ' + sIdPessJur +
                     ' AND   IDPESSOA      =  ' + qryultEventoGerador.FieldByName('IDPESSOA').AsString +
                     ' AND   IDPLANOPREV   =  ' + sIdPlanoPrev );
    try
       qryGrava.ExecSQL;
    except
       on E:EDBEngineError do
       begin
          MostrarErro(E);
          Result := False;
          Exit;
       end;
    end;
  end;

  // INICIO - LOOP NAS CONTRIBUICOES ANTIGAS
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT CP.IDPESSJUR, EV.IDPESSOA, HST.IDCONTRIBUICAOF, HST.IDPLANOPREVF, HST.FLGASSOCIADA ' +
                 ' FROM HSTCONTEVENTOSPR HST, EVENTOSPREV EV, CONTRIBPREVPARTP CP ' +
                 ' WHERE HST.IDEVENTOSPREV = ' + qryultEventoGerador.FieldByName('IDEVENTOSPREV').AsString +
                 '   AND CP.IDPESSJUR      = ' + sIdPatroAntiga       +
                 '   AND CP.IDPLANOPREV    = ' + sIdPlanoPrevAntigo   +
                 '   AND EV.IDEVENTOSPREV  = HST.IDEVENTOSPREV   '    +
                 '   AND CP.IDPESSOA 	     = EV.IDPESSOA         '    +
                 '   AND CP.IDCONTRIBUICAO = HST.IDCONTRIBUICAOF '    +
                 '   AND CP.FLGCOBRA 	     = HST.FLGASSOCIADA    '    );

  qryAux.Open;
  qryAux.First;
  While Not qryAux.Eof Do
  begin
    // Volta situação na CONTRIBPARTPREVP
    // 1º Associo as Contribuições Antigas
    if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
    begin
      qryGrava.Sql.Clear;
      qryGrava.Sql.Add(' UPDATE CONTRIBPREVPARTP    ' +
                       ' SET FLGCOBRA           = 1 ' +
                       ' WHERE IDPESSJUR        =   ' + sIdPatroAntiga +
                       ' AND   IDPESSOA         =   ' + qryultEventoGerador.FieldByName('IDPESSOA').AsString +
                       ' AND   IDPLANOPREV      =   ' + sIdPlanoPrevAntigo +
                       ' AND   IDCONTRIBUICAO   =   ' + qryAux.FieldByName('IDCONTRIBUICAOF').AsString +
                       ' AND   SEQPROPOSTA      = 1 ' );
      try
         qryGrava.ExecSQL;
      except
         on E:EDBEngineError do
         begin
            MostrarErro(E);
            Result := False;
            Exit;
         end;
      end;
    end;
    qryAux.Next;
  end; // While
  // FIM - LOOP NAS CONTRIBUICOES ANTIGAS

  // INICIO - LOOP NAS CONTRIBUICOES NOVAS
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT CP.IDPESSJUR, EV.IDPESSOA, HST.IDCONTRIBUICAOF, HST.IDPLANOPREVF, HST.FLGASSOCIADA ' +
                 ' FROM HSTCONTEVENTOSPR HST, EVENTOSPREV EV, CONTRIBPREVPARTP CP ' +
                 ' WHERE HST.IDEVENTOSPREV = ' + qryultEventoGerador.FieldByName('IDEVENTOSPREV').AsString +
                 '   AND CP.IDPESSJUR      = ' + sIdPessJur           +
                 '   AND CP.IDPLANOPREV    = ' + sIdPlanoPrev         +
                 '   AND EV.IDEVENTOSPREV  = HST.IDEVENTOSPREV   '    +
                 '   AND CP.IDPESSOA 	   = EV.IDPESSOA         '    +
                 '   AND CP.IDCONTRIBUICAO = HST.IDCONTRIBUICAOF '    +
                 '   AND CP.FLGCOBRA 	   = HST.FLGASSOCIADA    '    );

  qryAux.Open;
  qryAux.First;
  While Not qryAux.Eof Do
  begin
    // Volta situação na CONTRIBPARTPREVP
    // 1º Associo as Contribuições Antigas
    if not(VerificaEventoINSS(qryultEventoGerador.FieldByName('IDEVENTOGERADOR').AsString)) then // // SOL 221079 KINTANA 2058169
    begin
      qryGrava.Sql.Clear;
      qryGrava.Sql.Add(' UPDATE CONTRIBPREVPARTP    ' +
                       ' SET FLGCOBRA           = 0 ' +
                       ' WHERE IDPESSJUR        =   ' + sIdPessJur +
                       ' AND   IDPESSOA         =   ' + qryultEventoGerador.FieldByName('IDPESSOA').AsString +
                       ' AND   IDPLANOPREV      =   ' + qryAux.FieldByName('IDPLANOPREVF').AsString +
                       ' AND   IDCONTRIBUICAO   =   ' + qryAux.FieldByName('IDCONTRIBUICAOF').AsString +
                       ' AND   SEQPROPOSTA      = 1 ' );
      try
         qryGrava.ExecSQL;
      except
         on E:EDBEngineError do
         begin
            MostrarErro(E);
            Result := False;
            Exit;
         end;
      end;
    end;
    qryAux.Next;
  end; // While
  // FIM - LOOP NAS CONTRIBUICOES NOVAS





  Result := True;
end;

function TfrmCancelaEvento.PermiteCancelamentoDoEvento: Boolean;
begin
  // Verifica se o evento pode ser desfeito.
  Result := True;
end;

procedure TfrmCancelaEvento.FormShow(Sender: TObject);
begin
  inherited;
  if (sistema.idmodulo = 454) then   // Higor Nayde Ferreira SOL  211709/15287 KINTANA 2050393
    MontaSelectPart.Filtro.Add(' EVENTOGERADOR.IDEVENTOGERADOR IN (129,130) ');// Higor Nayde Ferreira SOL  211709/15287 KINTANA 2050393

  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
end;

{ Verifica se um beneficio já foi pago }
function TfrmCancelaEvento.BeneficioJaPago: Boolean;
begin
  Result := False;

  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT HST.IDBENEFICIO FROM HSTBENEFBFCIARIO HST '+
                 ' WHERE  HST.NUMEROPROCESSO = '+
                 QuotedStr(qryProcessoBenef.FieldByName('NumeroProcesso').AsString)+ ' AND ' +
                 ' VLBENEFPGTO <> 0 ');
  qryAux.Open;

  if not qryAux.IsEmpty then begin
     Result := True
  end;
end; { BeneficioJaPago }

procedure TfrmCancelaEvento.FormCreate(Sender: TObject);
begin
  inherited;
  
   try
      CtrlDocumento := TCtrlDocumento.Create;
      CtrlDocumento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );
   except
      MsgDlg('Erro ao criar Controle de Documentos.','Erro',mtError,[mbOK],0);
      Abort;
   end;
   

   
   try
      CtrlLancamento := TCtrlLancamento.Create;
      CtrlLancamento.Initialize( dtmBaseDados.dbBaseDados,
                                True,
                                Sistema.ConnectionType,
                                Sistema.ConnectionSide,
                                Sistema.AppRemoteServer,
                                True
                               );
   except
      MsgDlg('Erro ao criar Controle de Lançamento Contábil.','Erro',mtError,[mbOK],0);
      Abort;
   end;
   


   InicializaEP;
   
end;

procedure TfrmCancelaEvento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil( CtrlDocumento );  
  FreeAndNil( CtrlLancamento ); 

  inherited;
end;


procedure TfrmCancelaEvento.MontaSelectPartBeforeOpenCds(
  var sqlText: String; strListParams: TStringList);
begin
  inherited;
  sqlText := Copy(sqlText, 1, Pos('ORDER BY', sqlText)-1);
  sqlText := sqlText + ' ORDER BY C3 DESC';
end;



end.



