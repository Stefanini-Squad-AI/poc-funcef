// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// *****************************************************************************
{-------------------------------------------------------------------------------
 Nº SIG.....: 81616
 Data.......: 27/02/2019
 Responsável: Darivaldo Alencar
 Descrição..: Registrar evento de aposentadoria para quem possui uma
              aposentadoria que foi cancelada.
--------------------------------------------------------------------------------
 Nº SIG.....: SIG TIBERO
 Data.......: 02/03/2018
 Responsável: Everson Luiz Pereira da Cunha
 Descrição..: Melhoria no Planus para adequação ao TIBERO.
              Inclusão de alias nas tabelas e campos.
              Retirar INDEX, +rule etc
--------------------------------------------------------------------------------
 alteração   : {.dfm), FormCreate, ValidaDeterminacaoJudicial, bbtnProcurarClick
               SetarMatricula, SetarVariaveis
 SIG         : 42986
 Responsável : Edilaine
 Data        : 04/08/2017
 Descrição   : ajustes para apresentação maximizada dos paineis
--------------------------------------------------------------------------------
 Autor(a)    : Peterson Victor
 Data        : 28/01/2016
 Pendência   : SOL 268467 PPM 1262098
 Descricao   : evento não está deixando inserir um outro
--------------------------------------------------------------------------------
 Autor(a)    : Fernando Xavier
 Data        : 10/12/2015
 Pendência   : SOL 266322 PPM 1200913
 Descricao   : Solicito corrigir erro "Falta expressão" na versão atual do
               cadastro para inclusão de evento de aposentadoria.
--------------------------------------------------------------------------------
 Autor(a)    : Peterson Victor
 Data        : 02/12/2015
 Pendência   : SOL 265717 PPM 1186709
 Descricao   : Só realizar as alterações na tabela EVENTOSPREV quando
                 for o modulo 454 e fonte pagadora 2
--------------------------------------------------------------------------------
 Autor(a)    : Michelle Suellyn Mota
 Data        : 18/11/2015
 Pendência   : SOL 260409 PPM 1034998
 Descricao   : Eventos duplicados.
--------------------------------------------------------------------------------
 Autor(a)    : William Moreira da Silva
 Data        : 24/09/2015
 Pendência   : SOL 262312 PPM 1084914
 Descricao   : Erro de constrait no cadastro de eventos.
--------------------------------------------------------------------------------
Alteração  : (dfm) desabilitar controles
Nº SOL.....: 253577-17374
KTN / PPM  : 848182
Data       : 18/06/2015
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - requerimento de benefícios
-------------------------------------------------------------------------------}
// Autor(a)    : William Moreira da Silva
// Data        : 18/09/2015
// Pendência   : SOL 261800 - PPM 1072008
// Descricao   : O sistema realizava inserção na EVENTOSPREV mesmo o evento não sendo de aposentadoria por INSS.
//------------------------------------------------------------------------------
// Rotina      : DesfazRequerimentos
// Autor(a)    : Fernando Xavier
// Data        : 30/07/2015
// Pendência   : SOL 256744 PPM 999526
// Descricao   : ao clicar no botão sair da tela de concessão o sistema apresenta a
//               mensagem informando que o requerimento será desfeito, porém foi observado
//               que o sistema esta muito lento quando da deleção do requerimento.
//------------------------------------------------------------------------------
//Pendência   : SOL 255459 PPM 828036
//Responsável : William Moreira da Silva
//Data        : 09/06/2015
//Descrição   : Ajuste pois o botão cancelar estava desabilitado
//-------------------------------------------------------------------------------
// Autor(a)  : Marcio Sanches Spinosa SOL 241392 PPM 551450
// Data      : 17/10/2014
// Pendência : SOL 241392 PPM 551450
// Descricao : Validação incorreta em eventos ja cadastrados.
// -----------------------------------------------------------------------------
// Autor(a)  : William Moreira da Silva
// Data      : 09/07/2014
// Pendência : SOL 235054 PPM 442686
// Descricao : Insconsistência ao registrar eventos
// -----------------------------------------------------------------------------
//Pendência   : SOL 221079 KINTANA 2058169
//Responsável : Fernando Xavier
//Data        : 29/01/2012
//Descrição   : A rotina esta cancelando as contribuições do beneficio FUNCEF
//              ao cancelar um evento de Aposentadoria INSS.
//------------------------------------------------------------------------------
//Pendência   : SOL 225864 Kintana 2059480
//Responsável : Thiago Melo
//Data        : 16/05/2014
//Descrição   : Evento de aposentadoria esta permitindo gerar novo evento quando
//              o mesmo já existe.
//--------------------------------------------------------------------------------
//Pendência   : SOL 226897 KINTANA 2060868
//Responsável : Thiago Melo
//Data        : 20/02/2014
//Descrição   : Verificar Erro ao efetuar o evento de Aposentadoria por Tempo de Contribuição
//--------------------------------------------------------------------------------
//Pendência   : SOL 225863 KINTANA 2059478
//Responsável : Thiago/Fernando Xavier
//Data        : 06/02/2014
//Descrição   : Ao iniciar a concessão do benefício de aposentadoria por idade,
//              identificamos no final do processo que o sistema não esta gravando
//              o evento de concessão.
//--------------------------------------------------------------------------------
//Pendência   : SOL 225403 KINTANA 2059330
//Responsável : Fernando Xavier
//Data        : 04/02/2014
//Descrição   : alterar a origem de busca da data de evento.
//--------------------------------------------------------------------------------
//Pendência   : SOL 211709/15287 KINTANA 2050393
//Responsável : Higor Nayde Ferreira
//Data        : 25/10/2013
//Descrição   : Atividade para liberação de versão 15188.
//              Retirar de campos e fazer com que não possa mais ser inserido
//              mais nenhum evento de morte no modulo.
//--------------------------------------------------------------------------------
//Pendência   : SOL 175700 KINTANA 1685331
//Responsável : Jonas Otavio
//Data        : 21/08/2012
//Descrição   : Implementação da limitação do campo "Data do Evento", na funcionalidade
//eventos seja limitada sempre até a data atual.
//--------------------------------------------------------------------------------
//Pendência   : SOL 182331 KINTANA 1710430
//Responsável : José Roberto Marque - JRM6
//Data        : 09/07/2012
//Descrição   : Implementação de trava após busca quando não possuir data de
//              demissão previamente cadastrada.
//--------------------------------------------------------------------------------
//Pendência   : SOL 160863 KINTANA 1381911
//Responsável : OTACILIO AQUINO
//Data        : 18/11/2011
//Descrição   : Gravar o Evento antes de fazer uma nova pesquisa.
//------------------------------------------------------------------------------
//Responsável : Otacilio Aquino
//Pendência   : SOL 161040 Kintana 1356059
//Descrição   : Implementação de trava no requerimento quando não tiver conta
//              salario cadastrada.
//------------------------------------------------------------------------------
//Responsável : Renato Visoni
//Pendência   : SOL 156778 Kintana 1247264
//Descrição   : Ao requerer um benefício quando o evento já foi efetivado o sistema está
//              bloqueando o botão para abrir a tela dos benefícios.
//--------------------------------------------------------------------------------
//Responsável : Renato Visoni
//Pendência   : SOL 155058 Kintana 1197225
//Descrição   : Ao clicar no botão OK o sistema não estava fazendo nada.
//--------------------------------------------------------------------------------
//Responsável : Fernando Xavier
//Pendência   : SOL 141078 Kintana 888253
//Descrição   : Implementação de TRava no requerimento
//--------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 16/08/2007
// Pendência   : 19962
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 28/09/2006
// Pendência   : 23419
// Rotina      : bbtnRequerBeneficioClick
// Descricao   : Passar a DataRequerimento do evento para a rotina AbreRequerParticip.
//------------------------------------------------------------------------------
//  Autor      : Claudio Faria
//  Rotina     : Variados
//  Data       : 21/09/2006
//  Pendencia  : 23370
//  Descrição  : Incluir o metodo "performSearch" em todas as TwwDBLookupCombo que tem atribuição a uma query
//------------------------------------------------------------------------------// Rotinas     : Montaselect
// Autor(a)    : Paulo Ramos
// Pendência   : 23046
// Data        : 10/08/2006
// Descricao   : Não efetuar filtro do FLGDESATIVADO = 0, para permitir que os
//   planos em saldamento sejam buscados pelo Montaselect.
//   Filtro retirado do MontaSelectPart
//      'PARTPREVPLAN.FLGDESATIVADO = 0'
//------------------------------------------------------------------------------
// Rotinas     : VerificaEstadoEvento
// Autor(a)    : Leo
// Pendência   : 20115
// Data        : 06/09/2005
// Descricao   : verifica se o participante já teve um evento de aposentadoria que foi
//cancelado, por exemplo, uma invalidez que foi revogada pelo inss e, mais tarde,
//o participante requer a aposentadoria por tempo de contribuição.
//a consulta abaixo testa se existe algum processo ativo
//------------------------------------------------------------------------------
// Rotinas     : SetarMatricula, GravaEVENTOSPREV, LimpaCampos e bbtnConfirmarClick
// Autor(a)    : Gleyber
// Pendência   : 16427
// Data        : 05/05/2004
// Descricao   : Criacao do campo Data de Requerimento na EVENTOSPREV
//------------------------------------------------------------------------------
// Rotina      : ValidaBeneficioAnterior
// Autor(a)    : Camille
// Pendência   : 16616
// Data        : 26.04.2004
// Descricao   : Criacao de variavel para dizer se encerrou ou nao beneficio
//               para que os eventos possam saber se devem ou não encerrar
//               as contribuicoes.
//------------------------------------------------------------------------------
// Rotina      : SetarMatricula
// Autor(a)    : Gleyber
// Data        : 25/03/2004
// Pendência   : 16354
// Alteração   : Atribuindo valor à variável sIdTitular do componente ConsPart.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 10/10/2003
// Alteração   : bbtnConfirmarClick
// Pendência   : 14938
// Descrição   : Inclusão da rotina de impressão da carta do evento
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 21.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina      : bbtnRequerBeneficioClick
// Autor(a)    : Augusto
// Data        : 19/02/2003
// Alteração   : Novos parametros para tela de Requerimento, Tempo de Serviço.
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Camille
// Data        : 06.02.2003
// Alteração   : Deixar o tempo de servico informado preenchido com o que estiver
//               na tabela elegpatro
//------------------------------------------------------------------------------
// Rotina      : AssociaRubricasIndividuais
// Autor(a)    : Leo
// Data        : 13/11/2002
// Alteração   : associação das rubricas individuais relacionadas ao evento
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 13/11/2002
// Alteração   : inclusão dos campos VALORBASE4 , VALORBASE5 , VALORBASE6
//------------------------------------------------------------------------------
unit FEventoAposentadoria;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc,   cmseldlg, TREdit, URegra, TB97Tlbr, Mask, DBCtrls, UConsPart,
  IvDictio, IvMulti, IvEMulti, TEdNum, wwdbdatetimepicker,
  CMDateTimePicker, wwdblook,

  dRelRetroRegional,dRelatorios, dRelatAdmPrev,  fTipoBenefConcede,
  dRelatGerencial,  dRelTempoServicoMT,
  dRelatEspecificos, dRelTransfPlano, fCadRequerBenefPensionista,fCadRequerBenefBfciario;

const
sSQLCO =  ('SELECT  DISTINCT  EL.MATRICULA,'+
          '        PP.INSCRICAONUMERO,'+
          '        PES.NOME,'+
          '        BF.NOME,'+
          '        P.DTEVENTO,'+
          '        P.NUMEROPROCESSO,'+
          '        EL.IDPESSOA,'+
          '        EL.DATAADMISSAO,'+
          '        P.NUMEROPROCESSO,'+
          '        B.IDTITULAR,'+
          '        B.SEQPROPOSTA,'+
          '        B.IDPESSJUR,'+
          '        B.IDPLANOPREV, '+
          '        B.FONTEPAGADORA ' +
          '  FROM  PROCESSOBENEF P,'+
          '        BENEFBFCIARIO B,'+
          '        ELEGPATRO EL,'+
          '        PARTPREVPLAN PP,'+
          '        PESSOA PES,'+
          '        BENEFPLANPREV BPL,'+
          '        BENEFICIO BF '+
          ' WHERE (P.NUMEROPROCESSO = B.NUMEROPROCESSO)'+
          '   AND (EL.IDPESSOA = B.IDTITULAR)'+
          '   AND (EL.IDPESSJUR = B.IDPESSJUR)'+
          '   AND (B.IDPESSJUR = PP.IDPESSJUR)'+
          '   AND (B.IDPLANOPREV = PP.IDPLANOPREV)'+
          '   AND (B.IDTITULAR = PP.IDPESSOA)'+
          '   AND (B.SEQPROPOSTA = PP.SEQPROPOSTA)'+
          '   AND (B.IDTITULAR = PES.IDPESSOA)'+
          '   AND (BPL.IDPLANOPREV = B.IDPLANOPREV)'+
          '   AND (BPL.IDBENEFICIO = B.IDBENEFICIO)'+
          '   AND (BF.IDBENEFICIO = B.IDBENEFICIO)'+
          '   AND (((BPL.FLGREFERENCIA = 0) OR'+
          '                ((BPL.FLGREFERENCIA = 1) AND (BPL.FLGPAGAINSS = 1))))'+
          '   AND (B.IDPESSOA = B.IDTITULAR)'+
          '   AND (((B.IDSITBENEFICIO = 4) OR (B.IDSITBENEFICIO = 6)))'+
          '   AND (PP.IDPESSJUR IN'+
          '                (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = 1))'+
          '   AND (EL.MATRICULA = :MATRICULA)');



type
  TfrmEventoAposentadoria = class(TfrmOkCancelar)
    Panel2: TPanel;
    Label2: TLabel;
    lblPatro: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    edNome: TEdit;
    edPatro: TEdit;
    edPlano: TEdit;
    Panel3: TPanel;
    bbtnProcurar: TBitBtn;
    qrySitFunc: TwwQuery;
    qrySitPlanoPrev: TwwQuery;
    pnlInformacao: TPanel;
    lblSitNovaPatro: TLabel;
    dblkpcmbSitFunc: TwwDBLookupCombo;
    Label7: TLabel;
    dblkpcmbSitPlanoPrev: TwwDBLookupCombo;
    qryAux: TwwQuery;
    lblValores: TLabel;
    Label11: TLabel;
    pnlBotao: TPanel;
    regCalculo: TRegra;
    bbtnRequerBeneficio: TBitBtn;
    MontaSelectPart: TMontaSelect;
    qrySitPart: TwwQuery;
    Label13: TLabel;
    dblkpcmbSitPart: TwwDBLookupCombo;
    qryRegra: TwwQuery;
    Label10: TLabel;
    dtEvento: TCMDateTimePicker;
    qryGrava: TwwQuery;
    Panel5: TPanel;
    Label9: TLabel;
    lblSitPatro: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    edSitPatro: TEdit;
    edSitPlano: TEdit;
    edSitFundacao: TEdit;
    Label1: TLabel;
    dtDemissao: TCMDateTimePicker;
    ConsPart1:  TConsPart;
    bbtnOpcoes: TBitBtn;
    chkSitEspecial: TCheckBox;
    Label4: TLabel;
    qryEvento: TwwQuery;
    edInscNumero: TEdit;
    pnlTempoServTotal: TPanel;
    Label12: TLabel;
    Label14: TLabel;
    edTempoServTotal: TEditNum;
    Label15: TLabel;
    edTempoServMes: TEditNum;
    edTempoServDia: TEditNum;
    Label16: TLabel;
    dtRequerimento: TCMDateTimePicker;
    Label17: TLabel;
    ToolbarSep972: TToolbarSep97;
    btnBeneficio: TBitBtn;
    edMatricula: TEdit;
    qryJudicial: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnRequerBeneficioClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtEventoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnOpcoesClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure edMatriculaExit(Sender: TObject);
    procedure edInscNumeroExit(Sender: TObject);
    procedure ConsPart1Click(Sender: TObject);
    procedure ConcederOK;
    procedure CriaDataModule;
  private
    { Private declarations }
    iIdEventoPrev: integer;

    bEncerrou : boolean;
    sNumerosProcessos,
    sTipoSitFuncAntes,
    sFlgIntPartAntes,

    sIdPessoa, sIdPessJur, sIdPlanoPrev, sSeqProposta: string;
    sIdSitFunc, sIdSitPart, sIdSitPlanoPrev, sTempoServAntReal: string;
    sFlgSitFuncImed, sFlgSitPartImed, sFlgSitPlanoImed: string;
    sFlgEfetivado, sDataEfetivado: string;
    bEfetivado,   // informa se o evento foi efetivado
    bAltera,
    bRequerBenef: boolean; // indica se requereu beneficio
    sEstadoEvento: string;
    pIdSitFunc, pIdSitPart, pIdSitPlanoPrev, pTipoSit,  sFlgSitEspecial: string;
    rOpcao1,               rOpcao2,                  rOpcao3,
    rOpcao4,               rOpcao5,                  rOpcao6                  : real;

    bAposentaJudicial : boolean;               //edilaine - SIG42986

    procedure VerificaeGravaSituacoes;
    procedure GravaEVENTOSPREV;
    procedure LimpaCampos;
    procedure VerificaEstadoEvento;
    procedure SetarMatricula;
    procedure SetarVariaveis;

    function  ValidaDeterminacaoJudicial : boolean;         //edilaine - SIG42986
  public
    { Public declarations }
    Msg : String;
    sRequerimento: Boolean;
  end;

var
  frmEventoAposentadoria: TfrmEventoAposentadoria;
{Evento Definitivo}

implementation

uses
  UAdmPrev, UDataBase, UMensErro, FTelaAut, DBaseDados,
  FCadContribParticipante, FMostraContribuicoes, UEventos,
  FCadOpcoesElegivel, FCadRequerBenefParticip, UBeneficio,
  fAguarde, UParticipante, DAPrev, Usistema,DRelatAdmPREV2;

{$R *.DFM}

procedure TfrmEventoAposentadoria.FormCreate(Sender: TObject);
begin
  inherited;
  bRequerBenef := False;

  qrySitFunc.Close;
  qrysitFunc.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrySitFunc.Open;
  qrySitPlanoPrev.Close;
  qrysitPlanoPrev.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrySitPlanoPrev.Open;
  qrySitPart.Close;
  qrysitPart.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrySitPart.Open;

  lblPatro.Caption := 'Patrocinadora';
  lblSitPatro.Caption := 'Situação na Patrocinadora';
  lblSitNovaPatro.Caption := 'Nova Situação na Patrocinadora';

  if not dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.StartTransaction;
  bEncerrou := False;

  bAposentaJudicial := false;               //edilaine - SIG42986

end;

procedure TfrmEventoAposentadoria.FormShow(Sender: TObject);
begin
  inherited;
  //Otacilio Aquino SOL 160863 Kintana 1381911
  uBeneficio.bGravaEvento := False;

  //edMatricula.SetFocus;  // edilaine - SOL 253577-17374 / PPM 848182 - comentado
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');

  //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
  if (Sistema.IdModulo = 454) then begin
     frmEventoAposentadoria.Height := 287;

     //William Moreira da Silva - SOL 255459 PPM 828036
     //TB97oKCancelar.Enabled := false;
     TB97oKCancelar.Enabled := true;
     TB97oKCancelar.SetFocus;
     //TB97oKCancelar.Focused := true;
     //William Moreira da Silva - SOL 255459 PPM 828036

     //bbtnConfirmar.Enabled := false;
     //bbtnCancelar.Enabled := false;
     pnlInformacao.Visible := false;
     pnlBotao.Visible := false;
     ConsPart1.Visible := false;
     bbtnOpcoes.Visible := false;
     bbtnProcurar.top := 57;
     bbtnAjuda.Visible := false;
     // ------- TABELA
     MontaSelectPart.Tabelas.Add('EVENTOSPREV');
     MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPLANOPREV = EVENTOSPREV.IDPLANOPREV');
     MontaSelectPart.Filtro.Add('PESSOA.IDPESSOA = EVENTOSPREV.IDPESSOA');
     MontaSelectPart.Filtro.Add('EVENTOSPREV.IDEVENTOGERADOR = '+ sIdEventoGerador );
     // ------- FILTRO

  end else begin
   btnBeneficio.Visible := false;
  end;

  LimpaCampos();       // edilaine - SOL 253577-17374 / PPM 848182
end;

procedure TfrmEventoAposentadoria.bbtnProcurarClick(Sender: TObject);
Var
  wSai: Boolean;
begin
  wSai := false;
  //Otacilio Aquino SOL 160863 Kintana 1381911
  if uBeneficio.bGravaEvento then
  begin
         MsgDlg('Evento em aberto confirme "OK" ou "Cancelar".', 'Evento', mtInformation, [mbok], 0);
         Abort;
  end;

  inherited;

  bAposentaJudicial := false;               //edilaine - SIG42986

  Msg := '';
  MontaSelectPart.Executar;
  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then Begin
    sIdPessoa              := MontaSelectPart.ValoresChave[0];
    sIdPessJur             := MontaSelectPart.ValoresChave[1];
    sIdPlanoPrev           := MontaSelectPart.ValoresChave[2];
    sIdSitFunc             := MontaSelectPart.ValoresChave[15];
    sIdSitPart             := MontaSelectPart.ValoresChave[16];
    sIdSitPlanoPrev        := MontaSelectPart.ValoresChave[17];
    sSeqProposta           := MontaSelectPart.ValoresChave[19];
    edNome.Text            := MontaSelectPart.ValoresChave[3];
    edMatricula.Text       := MontaSelectPart.ValoresChave[4];
    edPatro.Text           := MontaSelectPart.ValoresChave[5];
    edPlano.Text           := MontaSelectPart.ValoresChave[6];
    edSitPatro.Text        := MontaSelectPart.ValoresChave[7];
    edSitFundacao.Text     := MontaSelectPart.ValoresChave[8];
    edSitPlano.Text        := MontaSelectPart.ValoresChave[9];
    edInscNumero.Text      := MontaSelectPart.ValoresChave[12];

    if MontaSelectPart.ValoresChave[22] <> ''
    then sTempoServAntReal := MontaSelectPart.ValoresChave[21]
    else sTempoServAntReal := MontaSelectPart.ValoresChave[22];

    dtDemissao.Text        := MontaSelectPart.ValoresChave[23];
    sFlgSitEspecial        := MontaSelectPart.ValoresChave[24];
    sTipoSitFuncAntes      := MontaSelectPart.ValoresChave[25];
    edTempoServTotal.Text  := MontaSelectPart.ValoresChave[26];
    sFlgIntPartAntes       := MontaSelectPart.ValoresChave[27];
    edTempoServMES.Text    := MontaSelectPart.ValoresChave[28];
    edTempoServDIA.Text    := MontaSelectPart.ValoresChave[29];

    bAposentaJudicial := ValidaDeterminacaoJudicial();             //edilaine - SIG42986

    // SOL 182331 KINTANA 1710430 JRM6

    With qryAux do
    begin
      Msg := '';

      close;
      sql.clear;
      sql.add(' SELECT DATADEMISSAO FROM CM.ELEGPATRO WHERE IDPESSOA = ' + sIdPessoa );
      Open;
      if IsEmpty then
      begin
        Msg := 'Funcionário não localizado em ELEGPATRO!';
      end;

      if (Trim(FieldByName('DATADEMISSAO').AsString ) = '') and (not bAposentaJudicial) then    //edilaine - SIG42986
      begin
        Msg := Msg + #13 + 'Participante não possui data de demissão cadastrada. ' +
                            'Para requerimento do benefício e registro do evento é necessário cadastrá-la previamente.';
      end;

      if Msg <> '' then
      begin
        wSai := True;
        MsgDlg(Msg,'Informação',mtInformation,[mbOk],0);
        bbtnSair.Click;
    //        bbtnSairClick(Sender);
    //      exit;
      end;
    end;
    if wsai then
      exit;
    Msg := '';
    // SOL 182331 KINTANA 1710430 - JRM6

    // SOL 141078 KINTANA 888253
    with qryAux do
    begin
      Close;
      SQL.Clear;
      //KINTANA 1356059 SOL 161040 Otacilio Aquino ** Inicio **
      SQL.Add(' SELECT TIPOCONTA FROM CM.CONTABANCARIA ' +
             ' WHERE TIPOCONTA = 2 ' +
             ' AND (IDPESSOA = ' + sIdPessoa + ')');
      Open;
      if IsEmpty then
      begin
        Msg := 'Conta Salário não cadastrada!';
      end;
      //KINTANA 1356059 SOL 161040 Otacilio Aquino ** Fim **

      Close;
      SQL.Clear;
      SQL.Add(' SELECT NUMDOCUMENTO FROM CM.PESSOA  '+
             ' WHERE  NUMDOCUMENTO IS NOT NULL '+
             ' AND   (IDPESSOA        = '+sIdPessoa   +')');
      Open;
      if IsEmpty then
      begin
        if Msg <> '' then
           Msg := Msg + chr(13) + 'Participante/Pensionita sem CPF cadastrado!'
        else
           Msg := 'Participante/Pensionita sem CPF cadastrado!';
      end;

      Close;
      SQL.Clear;
      SQL.Add(' SELECT FLGISENTOIRRF FROM CM.PESSOAFISICA  '+
              ' WHERE  FLGISENTOIRRF IS NOT NULL '+
              ' AND   (IDPESSOA        = '+sIdPessoa   +')');
      Open;
      if IsEmpty then
      begin
        if Msg <> '' then
           Msg := Msg + chr(13) + 'Participante/Pensionista sem Opção de Imposto de Renda!'
        else
           Msg := 'Participante/Pensionista sem Opção de Imposto de Renda!';
     end;
    //Renato Visoni SOL 155058 Kintana 1197225
    if Msg <> '' then begin
      MsgDlg(Msg,'Informação',mtInformation,[mbOk],0);
      exit;
    end;
    //Renato Visoni SOL 155058 Kintana 1197225
  end;


  // SOL 141078 KINTANA 888253

    SetarMatricula;
  end;

  // edilaine - SOL 253577-17374 / PPM 848182 - inicio
  if  (montaselectpart.retornouvalor)  {and (sEstadoEvento = 'NAO REGISTRADO')} then
  begin
    if (sEstadoEvento = 'NAO REGISTRADO') then
    begin
      dblkpcmbSitFunc.text:='';
      dblkpcmbSitPlanoPrev.Text:='';
      dblkpcmbSitPart.text:='';
    end;

    bbtnConfirmar.Enabled := true;
    bbtnCancelar.Enabled  := true;
    btnBeneficio.Enabled  := true;
    // edilaine - SOL 253577-17374 / PPM 848182 - fim


  end;

  //Peterson Victor SOL 268467 PPM 1262098
  if sEstadoEvento = 'EFETIVADO' then
    bbtnConfirmar.Enabled := False;

end;

procedure TfrmEventoAposentadoria.VerificaEstadoEvento;
begin
  // Verificar se evento já foi registrado na mesma categoria
   with qryEvento do
   begin
      Close;
      // Início - Michelle Mota - SOL:260409 - PPM:1034998
      SQL.Clear;
      SQL.Add('SELECT EP.FLGEFETIVADO, EG.IDEVENTOGERADOR, EP.DATAEVENTO, ');
      SQL.Add('       EP.IDSITPARTNOVO, EP.IDSITPLANONOVO, EP.IDSITFUNCNOVO, ');
      SQL.Add('       SPART.FLGINTERNO, ');
      SQL.Add('       EG.FLGINTERNO AS FLGINTANT, ');
      SQL.Add('       SPART.DESCRICAO  AS NOMESITPART, ');
      SQL.Add('       SPLANO.DESCRICAO AS NOMESITPLANO, ');
      SQL.Add('       SFUNC.DESCRICAO  AS NOMESITFUNC, ');
      SQL.Add('       SPARTANT.DESCRICAO  AS NOMESITPARTANT, ');
      SQL.Add('       SPLANOANT.DESCRICAO AS NOMESITPLANOANT, ');
      SQL.Add('       SFUNCANT.DESCRICAO  AS NOMESITFUNCANT, ');
      SQL.Add('       EP.DATAREQUERIMENTO, ');
      SQL.Add('       EP.DATAVOLTA '); //Peterson Victor SOL 268467 PPM 1262098
      SQL.Add('FROM   EVENTOGERADOR EG, EVENTOSPREV EP, SITPART SPART, ');
      SQL.Add('       SITPLANOPREV SPLANO, SITFUNC SFUNC, ');
      SQL.Add('       SITPART SPARTANT, ');
      SQL.Add('       SITPLANOPREV SPLANOANT, SITFUNC SFUNCANT ');
      SQL.Add('WHERE (EG.FLGINTERNO     IN (''TS'', ''ID'', ''IN'') ) ');
      SQL.Add('AND   (EG.IDEVENTOGERADOR = EP.IDEVENTOGERADOR) ');
      SQL.Add('AND   (EG.IDEVENTOGERADOR = :IDEVENTOGERADOR) ');
      SQL.Add('AND   (EP.SEQPROPOSTA     = :SEQPROPOSTA) ');
      SQL.Add('AND   (EP.IDPESSJUR       = :IDPESSJUR) ');
      SQL.Add('AND   (EP.IDPLANOPREV     = :IDPLANOPREV) ');
      SQL.Add('AND   (EP.IDPESSOA        = :IDPESSOA) ');
      SQL.Add('AND   (EP.IDSITFUNCNOVO   = SFUNC.IDSITFUNC) ');
      SQL.Add('AND   (EP.IDSITPARTNOVO   = SPART.IDSITPART) ');
      SQL.Add('AND   (EP.IDSITPLANONOVO  = SPLANO.IDSITPLANOPREV) ');
      SQL.Add('AND   (EP.IDSITFUNCATUAL  = SFUNCANT.IDSITFUNC) ');
      SQL.Add('AND   (EP.IDSITPARTATUAL  = SPARTANT.IDSITPART) ');
      SQL.Add('AND   (EP.IDSITPLANOATUAL = SPLANOANT.IDSITPLANOPREV) ');
      if (Sistema.IdModulo = 454) then
        begin
          SQL.Add('AND  EP.DATAVOLTA IS NULL');
        end;
     //SIG81616 -Inicio
     if (sIdEventoGerador = '2') then
        begin
          SQL.Add(' and not exists (select 1 from eventosprev et ');
          SQL.Add('                  where et.idpessoa = ep.idpessoa ');
          SQL.Add('                       and et.idplanoprev = ep.idplanoprev ');
          SQL.Add('                       and et.dataevento>= ep.dataevento ');
          SQL.Add('                       and et.idpessjur=ep.idpessjur ');
          SQL.Add('                       and et.ideventogerador in (383,352)) ');
        end;
    //SIG81616 -Fim     

      Prepare;

      // Término - Michelle Mota - SOL:260409 - PPM:1034998
      ParamByName('IdPessJur').AsInteger   := StrToInt(sIdPessJur);
      ParamByName('IdPlanoPrev').AsInteger := StrToInt(sIdPlanoPrev);
      ParamByName('IdPessoa').AsInteger    := StrToInt(sIdPessoa);
      ParamByName('SeqProposta').AsInteger := StrToInt(sSeqProposta);
      ParamByName('IdEventoGerador').AsInteger := StrToInt(sIdEventoGerador); //Marcio Sanches Spinosa SOL 241392 PPM 551450
      Open;
   end;

   if qryEvento.IsEmpty then
      sEstadoEvento := 'NAO REGISTRADO' // Pode Inserir
   else
   if qryEvento.FieldByName('DATAVOLTA').AsString = '' then //Peterson Victor SOL 268467 PPM 1262098
      sEstadoEvento := 'EFETIVADO' // Não pode Alterar, nem inserir um novo   //Peterson Victor SOL 268467 PPM 1262098
   else
   if qryEvento.FieldByName('FLGEFETIVADO').AsString = '0' then
   begin
              sEstadoEvento := 'REGISTRADO'; // Pode Alterar
              sIdEventoGerador := qryEvento.FieldByName('IDEVENTOGERADOR').AsString;
   end
   else
   begin
              //verifica se o participante já teve um evento de aposentadoria que foi
              //cancelado, por exemplo, uma invalidez que foi revogada pelo inss e, mais tarde,
              //o participante requer a aposentadoria por tempo de contribuição.
              //a consulta abaixo testa se existe algum processo ativo
              qryaux.close;
              qryaux.Sql.Clear; // Thiago Melo SOL 225864 Kintana 2059480
              qryaux.sql.Add('SELECT 1 '+ // Thiago Melo SOL 225864 Kintana 2059480
                                 ' FROM PROCESSOBENEF P, BENEFBFCIARIO B '+
//                                 ' WHERE IDEVENTOGERADOR IN '+ //Everson TIBERO
                                 ' WHERE P.IDEVENTOGERADOR IN '+ //Everson TIBERO
                                 '       (SELECT IDEVENTOGERADOR FROM EVENTOGERADOR WHERE FLGINTERNO     IN (''TS'', ''ID'', ''IN'')) '+
                                 ' AND   (B.IDPESSJUR       = '''+sIdPessJur+''') '+
                                 ' AND   (B.IDPLANOPREV     = '''+sIdPlanoPrev+''' ) '+
                                 ' AND   (B.IDPESSOA        = '''+sIdPessoa+''') '+
                                 ' AND   B.NUMEROPROCESSO = P.NUMEROPROCESSO ' +
                                 ' AND   P.IDSITPROCESSO < 3              ');

                                 //Peterson Victor SOL 268467 PPM 1262098 inicio
                                 {

                                 // Thiago Melo SOL 225864 Kintana 2059480

                                 if (Sistema.IdModulo = 454) then begin
                                   qryaux.sql.Add(' AND   P.IDSITPROCESSO < 3              ');
                                 end;
                                 // No caso de aposentadoria por tempo de contribuição, o sistema deve verificar apenas se existe
                                 // evento gerado independente do campo idsitprocesso.
                                 // Thiago Melo SOL 225864 Kintana 2059480
                                 }
                                 //Peterson Victor SOL 268467 PPM 1262098 Fim

      qryaux.open;

      if qryaux.isempty then
         sEstadoEvento := 'NAO REGISTRADO'
      else
         sEstadoEvento := 'EFETIVADO' // Não pode Alterar, nem inserir um novo
   end;

end;


procedure TfrmEventoAposentadoria.bbtnRequerBeneficioClick(Sender: TObject);
var sDataDemissao, sTempoContribuicao,
    sMsgErro : string;
begin
  inherited;
  if Trim(edNome.Text) = '' then
     begin
          MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
          bbtnProcurar.SetFocus;
          Exit;

     end;

  if (Trim(dtEvento.Text) = '')  and (Sistema.IdModulo <> 454)  then
     begin
          MsgDlg('A Data do Evento deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
          dtEvento.SetFocus;
          Exit;
     end;
     //Jonas Otavio - SOL 175700
  //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
  if (Sistema.IdModulo <> 454) then begin
     qryaux.close;
     qryaux.sql.text := 'SELECT trunc(sysdate) FROM DUAL WHERE trunc(sysdate) < to_date(''' + Trim(dtEvento.Text) + ''',''dd/mm/YYYY'')' ;
     qryaux.open;
     if not qryaux.IsEmpty then
     begin
     MsgDlg('A data do evento não pode ser maior que a data atual.','Informação',mtInformation,[mbOk],0);
     dtEvento.SetFocus;
     Exit;
     end;
   end;

//Jonas Otavio - SOL 175700


     if (Trim(dblkpcmbSitFunc.Text) = '') and (Sistema.IdModulo <> 454)then
        begin
           MsgDlg('A Nova Situação do Participante na '+lblPatro.Caption+' deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
           dblkpcmbSitFunc.SetFocus;
           Exit;
        end;

  if (Trim(dblkpcmbSitPlanoPrev.Text) = '') and (Sistema.IdModulo <> 454)then
     begin
          MsgDlg('A Nova Situação do Participante no Plano deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          dblkpcmbSitPlanoPrev.SetFocus;
          Exit;
     end;

  if (Trim(dblkpcmbSitPart.Text) = '') and (Sistema.IdModulo <> 454)then
     begin
          MsgDlg('A Nova Situação do Participante na Fundação deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          dblkpcmbSitPart.SetFocus;
          Exit;
     end;

  if qrySitPart.FieldByName('FLGINTERNO').AsString <> 'AS' then
     begin
          MsgDlg('A Nova Situação do Participante na Fundação deve ser da Categoria Assistido.','Erro',mtError,[mbOk,mbHelp],0);
          dblkpcmbSitPart.SetFocus;
          Exit;
     end;

  if ((Trim(edTempoServTotal.Text) = '') or (Trim(edTempoServTotal.Text) = '0')) and (Sistema.IdModulo <> 454)
  then begin
     if MsgDlg('O Tempo de Serviço Total não foi informado. Confirma ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
     then begin
        edTempoServTotal.SetFocus;
        Exit;
     end;
  end;
   //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393

  // Verificar se o participante tem contribuicoes que ainda nao alimentaram reserva
  // e alimentá-las, em caso positivo.
  frmAguarde.Mostra('Atualizando Reserva ... ');

  if not AtualizaReservaParticipante ( qryAux, qryGrava,
                                       StrToInt(sIdPessJur),
                                       StrToInt(sIdPlanoPrev),
                                       StrToInt(sIdPessoa),
                                       StrToInt(sSeqProposta),
                                       -1, // nao passar evento gerador para mostrar no extrato o nome da contribuicao
                                       dtEvento.Text,
                                       sMsgErro ) then
  begin
    frmAguarde.Apaga;
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
    Exit;
  end;
  frmAguarde.Apaga;

  // Gravar data de demissao independente da nova situacao
  if  (Trim(dtDemissao.Text) <> '')
  then sDataDemissao := ' TO_DATE(''' + Trim(dtDemissao.Text) + ''',''DD/MM/YYYY'')'
  else sDataDemissao := ' NULL ';

  if (sistema.IdModulo <> 454) then //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
  begin
    qryGrava.Close;
    qryGrava.Sql.Clear;
    qryGrava.Sql.Add(' UPDATE ELEGPATRO SET DATADEMISSAO = '+sDataDemissao+
                     ' WHERE  IDPESSJUR = ' + sIdPessJur + ' AND ' +
                     '        IDPESSOA  = ' + sIdPessoa);

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

  if (not bRequerBenef) and (not bAltera)
  then begin
     if not ValidaBeneficioAnterior ( qryAux,
                                      StrToInt(sIdPessJur),
                                      StrToInt(sIdPlanoPrev),
                                      StrToInt(sIdPessoa),
                                      StrToInt(sSeqProposta),
                                      StrToInt(sIdEventoGerador),
                                      False,
                                      dtEvento.Text,
                                      sMsgErro,
                                      bEncerrou) 

     then begin
        MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
        Exit;
     end;
  end;

  bRequerBenef := True;

  pIdSitFunc      := qrySitFunc.FieldByName('IDSITFUNC').AsString;
  pIdSitPart      := qrySitPart.FieldByName('IDSITPART').AsString;
  pIdSitPlanoPrev := qrySitPlanoPrev.FieldByName('IDSITPLANOPREV').AsString;
  pTipoSit        := qrySitFunc.FieldByName('TIPOSIT').AsString;

  if (not bEfetivado) and (Sistema.IdModulo <> 454)   //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
  then VerificaeGravaSituacoes;

  If ((edTempoServTotal.Text <> '0') And (edTempoServTotal.Text <> '')) and (Sistema.IdModulo <> 454) Then
    sTempoContribuicao := edTempoServTotal.Text+' anos ';
  If ((edTempoServMes.Text <> '0')   And (edTempoServMes.Text <> '')) and (Sistema.IdModulo <> 454) Then
    sTempoContribuicao := sTempoContribuicao + edTempoServMes.Text+' meses ';
  If ((edTempoServDia.Text <> '0')   And (edTempoServDia.Text <> '')) and (Sistema.IdModulo <> 454) Then
    sTempoContribuicao := sTempoContribuicao + edTempoServDia.Text+' dias ';

 { if (sistema.idmodulo = 454) then
     frmCadRequerBenefParticip.sRequerimento := True;     }
  if qryEvento.Locate('IDEVENTOGERADOR', sIdEventoGerador,[]) then // SOL 225403 KINTANA 2059330
  if qryEvento.FieldByName('DataEvento').AsString <> '' then // SOL 225403 KINTANA 2059330
     dtEvento.Text := qryEvento.FieldByName('DataEvento').AsString; //SOL 225403 KINTANA 2059330

  AbreRequerParticip('EV', sIdPessoa, sIdPessJur, sIdPlanoPrev,
                     sSeqProposta,dtEvento.Text,'',
                     sIdEventoGerador, '',sNumerosProcessos,
                     sTipoSitFuncAntes,
                     sFlgIntPartAntes,
                     qrySitPart.FieldByName('FlgInterno').AsString,
                     sIdSitPart,
                     sIdSitPlanoPrev,
                     sIdSitFunc,
                     qrySitPart.FieldByName('IdSitPart').AsString,
                     qrySitPlanoPrev.FieldByName('IdSitPlanoPrev').AsString,
                     qrySitFunc.FieldByName('IdSitFunc').AsString,
                     sTempoContribuicao,
                     dtRequerimento.Text);


  // Mesmo que o evento já esteja efetivado,
  // se o usuario requereu um beneficio, habilitar o ok e o cancelar
  // para que ele possa gravar o beneficio
  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled  := True;
  //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
  if (sistema.IdModulo = 454) then begin
     ConcederOK;

  end;
end;

procedure TfrmEventoAposentadoria.bbtnConfirmarClick(Sender: TObject);
var
  sMesRef,
  sDataDemissao : string;
  sMsgErro : string;

  sProcessosVerificar   : string;
  iNumeroProcesso       : longint;
  bRequereuSoINSS       : boolean;
  qryNUMPROC: TwwQuery;
begin
//  inherited;
  if Trim(sNumerosProcessos) = '' then    // SOL 256744 PPM 999526
  begin
      // SOL 221079
      qryNUMPROC := TwwQuery.Create(Application);
      qryNUMPROC.DatabaseName := 'BaseDados';
      qryNUMPROC.SQL.Text := sSQLCO;
      qryNUMPROC.Close;
      qryNUMPROC.ParamByName('MATRICULA').AsString := edMatricula.Text;
      qryNUMPROC.Open;
      if not qryNUMPROC.IsEmpty then begin
          sNumerosProcessos:= qryNUMPROC.FieldByName('NUMEROPROCESSO').AsString;
      end;
      FREEANDNIL(qryNUMPROC);
  end; //SOL 256744 PPM 999526

  if (Msg <> '') and (sistema.IdModulo <> 454) then  //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
  begin
     MsgDlg(Msg,'Informação',mtInformation,[mbOk],0);
     exit;
  end;
  if Trim(edNome.Text) = '' then
     begin
          MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
          bbtnProcurar.SetFocus;
          Exit;
     end;
 if (sistema.IdModulo <> 454)then begin    //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
  if Trim(dtEvento.Text) = '' then
     begin
          MsgDlg('A Data do Evento deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          dtEvento.SetFocus;
          Exit;
     end;
     //Jonas Otavio - SOL 175700
     qryaux.close;
     qryaux.sql.text := 'SELECT trunc(sysdate) FROM DUAL WHERE trunc(sysdate) < to_date(''' + Trim(dtEvento.Text) + ''',''dd/mm/YYYY'')' ;
     qryaux.open;
     if not qryaux.IsEmpty then
     begin
     MsgDlg('A data do evento não pode ser maior que a data atual.','Informação',mtInformation,[mbOk],0);
     dtEvento.SetFocus;
     Exit;
     end;
//Jonas Otavio - SOL 175700


     if Trim(dblkpcmbSitFunc.Text) = '' then
        begin
           MsgDlg('A Nova Situação do Participante na '+lblPatro.Caption+' deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
           dblkpcmbSitFunc.SetFocus;
           Exit;
        end;

  if Trim(dblkpcmbSitPlanoPrev.Text) = '' then
     begin
          MsgDlg('A Nova Situação do Participante no Plano deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          dblkpcmbSitPlanoPrev.SetFocus;
          Exit;
     end;

  if Trim(dblkpcmbSitPart.Text) = '' then
     begin
          MsgDlg('A Nova Situação do Participante na Fundação deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          dblkpcmbSitPart.SetFocus;
          Exit;
     end;

  if qrySitPart.FieldByName('FLGINTERNO').AsString <> 'AS' then
     begin
          MsgDlg('A Nova Situação do Participante na Fundação deve ser da Categoria Assistido.','Erro',mtError,[mbOk,mbHelp],0);
          dblkpcmbSitPart.SetFocus;
          Exit;
     end;

  If Trim(dtRequerimento.Text) = ''
   Then Begin
     MsgDlg('A data do requerimento deve ser preenchida.','Erro',mtError,[mbOk,mbHelp],0);
     dtRequerimento.SetFocus;
     Exit;
   End;

  if not AtualizaFLGPossuiEmprestimo ( qryAux,
                                       StrToInt(sIdPessJur),
                                       StrToInt(sIdPlanoPrev),
                                       StrToInt(sIdPessoa) ,
                                       StrToInt(sSeqProposta))
  then begin
     MsgDlg('Erro ao verificar se participante possui empréstimo. ','Erro',mtError,[mbOk,mbHelp],0);
     TiraSql(qryAux);
     Exit;
  end;

  if not bEfetivado
  then VerificaeGravaSituacoes;

  GravaEVENTOSPREV;

  // Gravar data de demissao independente da nova situacao
  if  (Trim(dtDemissao.Text) <> '')
  then sDataDemissao := ' To_Date(''' + Trim(dtDemissao.Text) + ''',''dd/MM/yyyy'')'
  else sDataDemissao := ' NULL ';

  if (sistema.IdModulo <> 454) then //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
  begin
    qryGrava.Close;
    qryGrava.Sql.Clear;
    qryGrava.Sql.Add(' UPDATE ELEGPATRO SET DATADEMISSAO = '+sDataDemissao+
                     ' WHERE  IDPESSJUR = ' + sIdPessJur + ' AND ' +
                     '        IDPESSOA  = ' + sIdPessoa);

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
  // Atualizar HISTFUNCPREV com DATADEMISSAO

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE HISTFUNCPREV SET DATAFINAL = TO_DATE(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')'+
                 ' WHERE  IDPESSJUR = ' + sIdPessJur +
                 ' AND    IDPESSOA  = ' + sIdPessoa +
                 ' AND    DATAFINAL IS NULL '+
                 ' AND    SEQHISTFUNC IN ( SELECT MAX(SEQHISTFUNC) '+
                 '                         FROM HISTFUNCPREV '+
                 '                         WHERE  IDPESSJUR = ' + sIdPessJur +
                 '                         AND    IDPESSOA  = ' + sIdPessoa  +
                 '                         AND    DATAFINAL IS NULL ) ');

  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
       begin
            MostrarErro(E);
            Exit;
       end;
  end;


  if (chkSitEspecial.Checked) and (Sistema.IdModulo <> 454)   //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
  then sFlgSitEspecial := '1'
  else sFlgSitEspecial := '0';

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE PARTPREVPLAN SET DATAINICIOASSIST = To_Date(''' + Trim(dtEvento.Text) + ''',''dd/mm/yyyy'') ,' +
                 '                         DATAFIMASSIST    = NULL ,' +
                 '                         FLGFITESPECIAL   = ' + sFlgSitEspecial+
                 ' WHERE IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
                 '       IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
                 '       SEQPROPOSTA = ' + sSeqProposta + ' AND ' +
                 '       IDPESSOA    = ' + sIdPessoa);
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
       begin
            MostrarErro(E);
            Exit;
       end;
  end;
 end; //esse

  if (Sistema.IdModulo = 454) then   //SOL 266322 PPM 1200913
  begin
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add( ' SELECT FONTEPAGADORA FROM BENEFBFCIARIO WHERE NUMEROPROCESSO = ' + QuotedStr(sNumerosProcessos) ); //SOL 266322 PPM 1200913

     try
        qryAux.Open;
     except
        on E:EDBEngineError do
          begin
               MostrarErro(E);
               Exit;
          end;
     end;

     if (Sistema.IdModulo = 454) and // SOL 225863 KINTANA 2059478
        (qryAux.FieldByName('FONTEPAGADORA').AsString = '2') then // SOL 265717 PPM 1186709
     begin
       SetarMatricula;
       GravaEVENTOSPREV;
     end;
  end; //SOL 266322 PPM 1200913
  // Se for Aposentadoria por Incapacidade (Invalidez), Grava Participante como Inválido
  if sFlgInterno = 'IN'
  then begin
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' UPDATE PESSOA SET FLGINVALIDO = 1 ' +
                    ' WHERE IDPESSOA = ' + sIdPessoa);
     try
        qryAux.ExecSQL;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;
  end;

  // Verificar se o benefício requerido foi apenas do INSS. Se Sim, entao não suspender as contribuicoes
  bRequereuSoINSS     := False;
  sProcessosVerificar := sNumerosProcessos;

  if (Trim(sNumerosProcessos) <> '') and  (Pos(',', sNumerosProcessos) <= 0)
  then sProcessosVerificar := sProcessosVerificar + ', ';

  while Pos(',', sProcessosVerificar) > 0 do
  begin
     iNumeroProcesso := StrToInt(Copy(sProcessosVerificar, 1, Pos(',', sProcessosVerificar)  - 1));
     if (ContaBeneficiosProcesso ( dtmAPrev.qry, iNumeroProcesso, 'I' ) > 0) and
        (ContaBeneficiosProcesso ( dtmAPrev.qry, iNumeroProcesso, 'S' ) <= 0)
     then bRequereuSoINSS := True;
     sProcessosVerificar := Copy(sProcessosVerificar,Pos(',', sProcessosVerificar )+ 1, length(sProcessosVerificar) - 1);
  end;


  if (not bAltera) and (not bRequereuSoINSS)  and (Sistema.IdModulo <> 454)  // SOL 256744 PPM 999526
  then begin
     sMesRef := Copy(dtEvento.Text,7,4)+'/'+Copy(dtEvento.Text,4,2);

     GravaHSTCONTEVENTOSPRFechado(IntToStr(iIdEventoPrev), sIdPlanoPrev, sIdEventoGerador, '',sIdPessoa, sIdPessJur, sSeqProposta, '','',
                                       dtEvento.Text,
                                       True, qryAux, qryGrava,sIdPlanoPrev);

     if not bEncerrou
     then begin 
        if not SuspendeContribuicoes(sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta, sIdEventoGerador, dtEvento.Text, '',
                                          edMatricula.Text, sIdSitPart, qryAux, qryGrava,
                                          sFlgInterno, sFlgIntPartAntes)
        then begin
           MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
           if dtmBaseDados.dbBaseDados.InTransaction
           then dtmBasedados.dbBaseDados.RollBack;
           LimpaCampos;
           if not dtmBaseDados.dbBaseDados.InTransaction
           then dtmBaseDados.dbBaseDados.StartTransaction;
           exit;
        end;
     end;

     if not AssociaNovasContribuicoes(sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta, sIdEventoGerador, dtEvento.Text, '',
                                      edMatricula.Text,
                                      qrySitPart.FieldByName('IDSITPART').AsString, '',True,
                                      False, 
                                      False, 
                                      qryAux, qryGrava, sFlgInterno,iIdEventoPrev,'') 
     then begin
        MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
        if dtmBaseDados.dbBaseDados.InTransaction
        then dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        if not dtmBaseDados.dbBaseDados.InTransaction
        then dtmBaseDados.dbBaseDados.StartTransaction;
        exit;
     end;

     MostraContribuicoes(IntToStr(iIdEventoPrev), edNome.Text, edPatro.Text, edPlano.Text);
  end;

  if (not bRequerBenef) and (not bAltera)
  then begin
     
     if not ValidaBeneficioAnterior ( qryAux,
                                      StrToInt(sIdPessJur),
                                      StrToInt(sIdPlanoPrev),
                                      StrToInt(sIdPessoa),
                                      StrToInt(sSeqProposta),
                                      StrToInt(sIdEventoGerador),
                                      False,
                                      dtEvento.Text,
                                      sMsgErro,
                                      bEncerrou) 

     then begin
        MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
        Exit;
     end;
  end;

  
  if not AssociaRubricasIndividuais(sIdPessJur,       sIdPlanoPrev,     sIdPessoa,
                                   sSeqProposta,     sIdEventoGerador, dtEvento.Text ,
                                   qryAux,        qryGrava ,
                                   sMsgErro  )
  then
  begin
     MsgDlg('Evento não efetuado. '+sMsgErro,'Informação',mtInformation,[mbOk,mbHelp],0);
     if dtmBaseDados.dbBaseDados.InTransaction
     then dtmBasedados.dbBaseDados.RollBack;
     LimpaCampos;
     if dtmBaseDados.dbBaseDados.InTransaction
     then dtmBaseDados.dbBaseDados.StartTransaction;
     Exit;
  end;



    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;


  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBasedados.dbBaseDados.Commit;

  MsgDlg('Evento efetuado com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);

  LimpaCampos;
  TiraSql(qryAux);
  bRequerBenef := False;


  If Not CartaEvento(sIdPessoa, sIdPessJur, sIdPlanoPrev, sIdEventoGerador, sSeqProposta)
    Then MsgDlg('Carta do evento não emitida.','Informação',mtInformation,[mbOk,mbHelp],0);


  if not dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.StartTransaction;

  //Otacilio Aquino SOL 160863 Kintana 1381911
  uBeneficio.bGravaEvento := False;


  if  (sistema.IdModulo = 454) then   //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
  begin
      TB97oKCancelar.Enabled := false;
      bbtnConfirmar.Enabled := false;
  end;
end;

procedure TfrmEventoAposentadoria.VerificaeGravaSituacoes;
begin
  // Gravar tempo de servido total, independente de gravar situacoes
  // neste momento
  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSERVTOTAL   = '+ OraNumero(edTempoServTotal.Text)+', '+
                   '                      TEMPOSERVTOTMES  = '+ OraNumero(edTempoServMes.Text)+', '+
                   '                      TEMPOSERVTOTDIA  = '+ OraNumero(edTempoServDia.Text)+
                   ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
                   '       IDPESSOA  = ' + sIdPessoa);
  try
     qryGrava.ExecSQL;
  except
     on E:EDBEngineError do
     begin
        MostrarErro(E);
        Exit;
     end;
  end;

  // Verificar se o usuario deseja gravar novas situacoes imediatamente
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' SELECT FLGSITFUNCIMEDIA, FLGSITPARTIMEDIA, FLGSITPLANOIMEDI FROM EVENTOGERADOR ' +
                 ' WHERE IDEVENTOGERADOR = ' + sIdEventoGerador);
  try
     qryAux.Open;
  except
     on E:EDBEngineError do
        begin
             MostrarErro(E);
             Exit;
        end;
  end;

  if (qryAux.FieldByName('FLGSITFUNCIMEDIA').AsString  = '1') and
     (qryAux.FieldByName('FLGSITPARTIMEDIA').AsString  = '1') and
     (qryAux.FieldByName('FLGSITPLANOIMEDI').AsString = '1')
  then begin
     sFlgEfetivado  := '1';
     
     sDataEfetivado := ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')'; 
  end
  else begin
     sFlgEfetivado  := '0';
     sDataEfetivado := 'NULL';
  end;


  if qryAux.FieldByName('FLGSITFUNCIMEDIA').AsString  = '1'
  then begin
     sFlgSitFuncImed := '1';

     // Grava nova Situação do Participante na Patrocinadora
     qryGrava.Close;
     qryGrava.Sql.Clear;
     qryGrava.Sql.Add(' UPDATE ELEGPATRO SET IDSITFUNC = ''' +qrySitFunc.FieldByName('IDSITFUNC').AsString +''''+
                      ' WHERE  IDPESSJUR = ' + sIdPessJur + ' AND ' +
                      '        IDPESSOA  = ' + sIdPessoa);
     try
        qryGrava.ExecSQL;
     except
        on E:EDBEngineError do
           begin
                MostrarErro(E);
                Exit;
           end;
     end;
  end
  else sFlgSitFuncImed := '0';


  if qryAux.FieldByName('FLGSITPARTIMEDIA').AsString  = '1'
  then begin
     sFlgSitPartImed := '1';

     // Grava nova Situação do Participante na Fundação
     qryGrava.Close;
     qryGrava.Sql.Clear;
     qryGrava.Sql.Add(' UPDATE PARTPREVPLAN SET IDSITPART = ' + qrySitPart.FieldByName('IDSITPART').AsString +
                      ' WHERE IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
                      '       IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
                      '       SEQPROPOSTA = ' + sSeqProposta + ' AND ' +
                      '       IDPESSOA    = ' + sIdPessoa);
     try
        qryGrava.ExecSQL;
     except
        on E:EDBEngineError do
           begin
                MostrarErro(E);
                Exit;
           end;
     end;
  end
  else sFlgSitPartImed := '0';


  if qryAux.FieldByName('FLGSITPLANOIMEDI').AsString  = '1'
  then begin
    sFlgSitPlanoImed := '1';

    // Grava nova Situação do Participante no Plano
    qryGrava.Close;
    qryGrava.Sql.Clear;
    qryGrava.Sql.Add(' UPDATE PARTPREVPLAN SET IDSITPLANOPREV = ' + qrySitPlanoPrev.FieldByName('IDSITPLANOPREV').AsString +
                     ' WHERE IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
                     '       IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
                     '       SEQPROPOSTA = ' + sSeqProposta + ' AND ' +
                     '       IDPESSOA    = ' + sIdPessoa);
    try
       qryGrava.ExecSQL;
    except
       on E:EDBEngineError do
          begin
               MostrarErro(E);
               Exit;
          end;
    end;
  end
  else sFlgSitPlanoImed := '0';
end;

procedure TfrmEventoAposentadoria.GravaEVENTOSPREV;
begin
  //William Moreira da Silva - SOL 261800 - PPM 1072008 - Inserida a consição, para só realizar a inserção na EVENTOSPREV, caso seja evento de aposentadorio por INSS
  //if (not bAltera) and (sIdEventoGerador = '129')
  if (not bAltera) and ((sIdEventoGerador = '129') or (Sistema.IdModulo <> 454))//William Moreira da Silva - SOL 262312 PPM 1084914
  then begin
          iIdEventoPrev := LeUltRegistro(qryAux,'EVENTOSPREV');

          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(' INSERT INTO EVENTOSPREV(IDEVENTOSPREV, DATAREGISTRO, DATAEVENTO, ' +
                         '                         IDPESSOA, IDPESSJUR, IDPLANOPREV, SEQPROPOSTA, ' +
                         '                         IDSITFUNCATUAL, IDSITPARTATUAL, IDSITPLANOATUAL, ' +
                         '                         IDSITFUNCNOVO, IDSITPARTNOVO, IDSITPLANONOVO, ' +
                         '                         IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED, FLGSITPLANOIMED, ' +
                         '                         DATAEFETIVADO, FLGEFETIVADO, INSCRICAONUMERO, DATAREQUERIMENTO) ' +
                         ' VALUES(' + IntToStr(iIdEventoPrev) + ',' + ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')' + ',' + ' To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
                                      sIdPessoa  + ',' + sIdPessJur + ',' + sIdPlanoPrev + ',' + sSeqProposta + ',' +
                                      '''' + sIdSitFunc + '''' + ',' + sIdSitPart + ',' + sIdSitPlanoPrev + ',' +
                                      '''' + qrySitFunc.FieldbyName('IDSITFUNC').AsString + '''' + ',' +
                                      qrySitPart.FieldbyName('IDSITPART').AsString + ',' +
                                      qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString + ',' +
                                      sIdEventoGerador + ',' + QuotedStr(sFlgSitFuncImed) + ',' + QuotedStr(sFlgSitPartImed) + ',' + QuotedStr(sFlgSitPlanoImed) + ', ');// SOL 225863 KINTANA 2059478
                                      // Thiago Melo SOL 226897 KINTANA 2060868
                                      //QuotedStr(sDataEfetivado) + ',' + QuotedStr(sFlgEfetivado) +','+OraNumero(edInscNumero.Text) + ', ' + // SOL 225863 KINTANA 2059478
                                      if Trim(sDataEfetivado) = 'NULL' then begin
                                        //qryAux.SQL.Add(' NULL, ' +
                                        qryAux.SQL.Add('TO_DATE(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''DD/MM/YYYY''),' +
                                        QuotedStr(sFlgEfetivado) +','+OraNumero(edInscNumero.Text) + ', '); // SOL 225863 KINTANA 2059478
                                      end else begin
                                        //qryAux.SQL.Add(QuotedStr(sDataEfetivado) + ',' + QuotedStr(sFlgEfetivado) +','+OraNumero(edInscNumero.Text) + ', '); // SOL 225863 KINTANA 2059478
                                        qryAux.SQL.Add('TO_DATE(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''DD/MM/YYYY''),' +
                                        QuotedStr(sFlgEfetivado) +','+OraNumero(edInscNumero.Text) + ', '); //William Moreira da Silva - SOL 235054 PPM 442686
                                      end;
                                      // Thiago Melo SOL 226897 KINTANA 2060868
                                      qryAux.SQL.Add('TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dtRequerimento.Date) + ''',''DD/MM/YYYY'') )');
          try
             qryAux.ExecSQL;
          except
             on E:EDBEngineError do
               begin
                    MostrarErro(E);
                    Exit;
               end;
          end;
     end
  else
     begin
          //William Moreira da Silva - SOL 261800 - PPM 1072008
          if dtEvento.Text = '' then
          begin
               dtEvento.text := datetostr(date);
          end;
          //William Moreira da Silva - SOL 261800 - PPM 1072008

          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.Sql.Add(' UPDATE EVENTOSPREV SET DATAALTERADO = To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')' + ',' +
                         '                        DATAEVENTO   = To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
                         '                        DATAREQUERIMENTO = TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dtRequerimento.Date) + ''',''DD/MM/YYYY''), ' +
                         '                        IDSITFUNCATUAL  = ''' + sIdSitFunc + ''',' +
                         '                        IDSITPARTATUAL  = ' + sIdSitPart + ',' +
                         '                        IDSITPLANOATUAL = ' + sIdSitPlanoPrev + ',' +
                         '                        IDSITFUNCNOVO   = ''' + qrySitFunc.FieldbyName('IDSITFUNC').AsString + ''',' +
                         '                        IDSITPARTNOVO   = ' + qrySitPart.FieldbyName('IDSITPART').AsString + ',' +
                         '                        IDSITPLANONOVO  = ' + qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString +
                         ' WHERE SEQPROPOSTA     = ' + sSeqProposta + ' AND ' +
                         '       IDPESSJUR       = ' + sIdPessJur   + ' AND ' +
                         '       IDPLANOPREV     = ' + sIdPlanoPrev + ' AND ' +
                         '       IDPESSOA        = ' + sIdPessoa    + ' AND ' +
                         '       IDEVENTOGERADOR = ' + sIdEventoGerador);
          try
             qryAux.ExecSQL;
          except
             on E:EDBEngineError do
               begin
                    MostrarErro(E);
                    Exit;
               end;
          end;
     end;
end;

procedure TfrmEventoAposentadoria.bbtnCancelarClick(Sender: TObject);
begin
  if MsgDlg('Todas as operações executadas serão canceladas. Confirma ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes then
  begin
     if dtmBasedados.dbBaseDados.InTransaction then
       dtmBasedados.dbBaseDados.RollBack;

     // Se requereu beneficio, apagar os requerimentos
     if bRequerBenef then
     begin
        if not dtmBaseDados.dbBaseDados.InTransaction then
          dtmBaseDados.dbBaseDados.StartTransaction;

        if not DesfazRequerimentos(qryAux, sNumerosProcessos) then
        begin
           if MsgDlg('Ocorreram erros ao Desfazer os Requerimentos de Benefício. '+
                     'Deseja desfazer apenas o evento ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo then
           begin
             dtmBaseDados.dbBaseDados.Rollback;
             Exit;
           end;
        end;
          dtmBaseDados.dbBaseDados.Commit;
     end;

     //Otacilio Aquino SOL 160863 Kintana 1381911
     {if dtmBasedados.dbBaseDados.InTransaction
     then dtmBasedados.dbBaseDados.RollBack;}

     LimpaCampos;
     TiraSql(qryAux);

     bRequerBenef := False;
     if not dtmBaseDados.dbBaseDados.InTransaction
     then   dtmBaseDados.dbBaseDados.StartTransaction;

     //Otacilio Aquino SOL 160863 Kintana 1381911
     uBeneficio.bGravaEvento := False;
     if (sistema.idmodulo <> 454)then   //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
        TB97oKCancelar.Enabled := false

  end;
  inherited;
end;

procedure TfrmEventoAposentadoria.LimpaCampos;
begin
  edNome.Text        := '';
  edMatricula.Text   := '';
  edPatro.Text       := '';
  edPlano.Text       := '';
  edSitPatro.Text    := '';
  edSitFundacao.Text := '';
  edSitPlano.Text    := '';
  edInscNumero.Text  := '';
  dtEvento.Text      := '';
  dtDemissao.Text    := '';
  dtRequerimento.Text   := '';  
  edTempoServTotal.Text := '';
  edTempoServMes.Text   := '';
  edTempoServDia.Text   := '';
  dblkpcmbSitFunc.Text  := '';
  dblkpcmbSitPlanoPrev.Text := '';
  dblkpcmbSitPart.Text      := '';
  chkSitEspecial.Checked    := False;
  bbtnProcurar.SetFocus;
  if (sistema.IdModulo <> 454) then begin     //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
    ConsPart1.Enabled := false;
    bbtnOpcoes.enabled := false;
  end
  else   // edilaine - SOL 253577-17374 / PPM 848182 - inicio
  begin
    bbtnConfirmar.Enabled := false;
    bbtnCancelar.Enabled  := false;
    btnBeneficio.Enabled  := false;
  end; // edilaine - SOL 253577-17374 / PPM 848182 - fim
end;

procedure TfrmEventoAposentadoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Otacilio Aquino SOL 160863 Kintana 1381911
  if uBeneficio.bGravaEvento then
  begin
     MsgDlg('Evento em aberto confirme "OK" ou "Cancelar".', 'Evento', mtInformation, [mbok], 0);
     Abort;
  end;
  
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.RollBack;
end;

procedure TfrmEventoAposentadoria.dtEventoExit(Sender: TObject);
begin
  inherited;
  //edilaine - SIG42986 - inicio
  if (Trim(dtDemissao.Text) = '') and (not bAposentaJudicial) then
     dtDemissao.Text := dtEvento.Text;
  //edilaine - SIG42986 - fim

  
  If Trim(dtRequerimento.Text) = ''
   Then dtRequerimento.Date := dtEvento.Date;
  
end;

procedure TfrmEventoAposentadoria.bbtnOpcoesClick(Sender: TObject);
var bPodeAlterarOpcoes, bOpcoesExistem : boolean;
    cAuxSeparador : char;
begin
  //Otacilio Aquino SOL 160863 Kintana 1381911
  if uBeneficio.bGravaEvento then
  begin
     MsgDlg('Evento em aberto confirme "OK" ou "Cancelar".', 'Evento', mtInformation, [mbok], 0);
     Abort;
  end;

  inherited;
  // Verificar se participante já fez opções
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT EL.VALORBASE1, EL.VALORBASE2, EL.VALORBASE3,  EL.VALORBASE4, EL.VALORBASE5, EL.VALORBASE6, '+
                 ' PATRO.NUMOPCOES    , '+
                 ' PATRO.NOMEVALORBASE1    ,  PATRO.NOMEVALORBASE2   ,  PATRO.NOMEVALORBASE3, '+
                 ' PATRO.FLGOBRIGAOP1    , PATRO.FLGOBRIGAOP2  ,  PATRO.FLGOBRIGAOP3  , '+
                 ' PATRO.FLGEDITAOP1    , PATRO.FLGEDITAOP2    ,  PATRO.FLGEDITAOP3    , '+
                 ' PATRO.IDREGRACALCOP1   ,  PATRO.IDREGRACALCOP2  ,  PATRO.IDREGRACALCOP3  ,  '+
                 ' PATRO.IDREGRAVALIDAOP1  ,   PATRO.IDREGRAVALIDAOP2  ,  PATRO.IDREGRAVALIDAOP3, '+
                 ' PATRO.NOMEVALORBASE4    ,  PATRO.NOMEVALORBASE5   ,  PATRO.NOMEVALORBASE6, '+
                 ' PATRO.FLGOBRIGAOP4    , PATRO.FLGOBRIGAOP5  ,  PATRO.FLGOBRIGAOP6  , '+
                 ' PATRO.FLGEDITAOP4    , PATRO.FLGEDITAOP5    ,  PATRO.FLGEDITAOP6    , '+
                 ' PATRO.IDREGRACALCOP4   ,  PATRO.IDREGRACALCOP5  ,  PATRO.IDREGRACALCOP6  ,  '+
                 ' PATRO.IDREGRAVALIDAOP4  ,   PATRO.IDREGRAVALIDAOP5  ,  PATRO.IDREGRAVALIDAOP6 '+
                 ' FROM ELEGPATRO EL, PATRO ' +
                 ' WHERE EL.IDPESSJUR   = ' +sidpessjur+ ' AND '+
                 ' EL.IDPESSOA = '+sidpessoa+' AND '+
                 ' EL.IDPESSJUR = PATRO.IDPESSOA ' );
  qryAux.Open;

  if qryAux.IsEmpty
  then begin
     rOpcao1 := 0;
     rOpcao2 := 0;
     rOpcao3 := 0;
     rOpcao4 := 0;
     rOpcao5 := 0;
     rOpcao6 := 0;
  end
  else begin
     if qryAux.FieldByName('VALORBASE1').AsString <> ''
     then rOpcao1 := qryAux.FieldByName('VALORBASE1').AsFloat
     else rOpcao1 := 0;

     if qryAux.FieldByName('VALORBASE2').AsString <> ''
     then rOpcao2 := qryAux.FieldByName('VALORBASE2').AsFloat
     else rOpcao2 := 0;

     if qryAux.FieldByName('VALORBASE3').AsString <> ''
     then rOpcao3 := qryAux.FieldByName('VALORBASE3').AsFloat
     else rOpcao3 := 0;

     if qryAux.FieldByName('VALORBASE4').AsString <> ''
     then rOpcao4 := qryAux.FieldByName('VALORBASE4').AsFloat
     else rOpcao4 := 0;

     if qryAux.FieldByName('VALORBASE5').AsString <> ''
     then rOpcao5 := qryAux.FieldByName('VALORBASE5').AsFloat
     else rOpcao5 := 0;

     if qryAux.FieldByName('VALORBASE6').AsString <> ''
     then rOpcao6 := qryAux.FieldByName('VALORBASE6').AsFloat
     else rOpcao6 := 0;
  end;

  bPodeAlterarOpcoes := True;

  if not qryAux.IsEmpty
  then begin // Opcoes já cadastradas
     bOpcoesExistem := True;
     frmCadOpcoesElegivel := TfrmCadOpcoesElegivel.Create(Application);
     frmCadOpcoesElegivel.LerOpcoes(edNome.text,  edPatro.text,
                                 qryaux.FieldByName('NOMEVALORBASE1').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE2').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE3').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE4').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE5').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE6').AsString,
                                 qryaux.FieldByName('NUMOPCOES').AsInteger,
                                 rOpcao1, rOpcao2, rOpcao3,
                                 rOpcao4, rOpcao5, rOpcao6, bPodeAlterarOpcoes,
                                 qryaux.FieldByName('FLGEDITAOP1').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP2').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP3').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP4').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP5').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP6').AsInteger,
                                 strtoint(sidpessjur),strtoint(sidpessoa),
                                 '','');
     frmCadOpcoesElegivel.Free;
  end
  else begin // Cadastrar Opcoes
     bOpcoesExistem := False;
     frmCadOpcoesElegivel := TfrmCadOpcoesElegivel.Create(Application);
     frmCadOpcoesElegivel.LerOpcoes(edNome.text, edPatro.text,
                                 qryaux.FieldByName('NOMEVALORBASE1').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE2').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE3').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE4').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE5').AsString,
                                 qryaux.FieldByName('NOMEVALORBASE6').AsString,
                                 qryaux.FieldByName('NUMOPCOES').AsInteger,
                                 rOpcao1, rOpcao2, rOpcao3,
                                 rOpcao4, rOpcao5, rOpcao6, bPodeAlterarOpcoes,
                                 qryaux.FieldByName('FLGEDITAOP1').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP2').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP3').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP4').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP5').AsInteger,
                                 qryaux.FieldByName('FLGEDITAOP6').AsInteger,
                                 strtoint(sidpessjur), strtoint(sidpessoa),
                                 '', '');

     frmCadOpcoesElegivel.Free;
  end;

  if ((rOpcao1 >= 0) or (rOpcao2 >= 0) or (rOpcao3 >= 0)
      or (rOpcao4 >= 0) or (rOpcao5 >= 0) or (rOpcao6 >= 0)) and
     (frmCadOpcoesElegivel.ModalResult = mrok)
  then begin
     qryAux.Close;
     qryAux.SQL.Clear;
     cAuxSeparador    := DecimalSeparator;
     DecimalSeparator := '.';
     qryAux.SQL.Add(' UPDATE ELEGPATRO SET VALORBASE1 = ' + FormatFloat('#0.00000',rOpcao1) + ',' +
                    '                      VALORBASE2 = ' + FormatFloat('#0.00000',rOpcao2) + ',' +
                    '                      VALORBASE3 = ' + FormatFloat('#0.00000',rOpcao3) + ',' +
                    '                      VALORBASE4 = ' + FormatFloat('#0.00000',rOpcao4) + ',' +
                    '                      VALORBASE5 = ' + FormatFloat('#0.00000',rOpcao5) + ',' +
                    '                      VALORBASE6 = ' + FormatFloat('#0.00000',rOpcao6) +
                    ' WHERE IDPESSJUR   = ' + sidpessjur   + ' AND ' +
                    '       IDPESSOA    = ' + sidpessoa   + ' ' );
     DecimalSeparator := cAuxSeparador;
     try
        qryAux.ExecSQL;
     except
        on E:EDBEngineError do
        begin
           MostrarErro(E);
           Exit;
        end;
     end;// except
  end;//if


end;

procedure TfrmEventoAposentadoria.bbtnSairClick(Sender: TObject);
Var qryNUMPROC: TwwQuery;
begin

  //Otacilio Aquino SOL 160863 Kintana 1381911
  if uBeneficio.bGravaEvento then
  begin
     MsgDlg('Evento em aberto confirme "OK" ou "Cancelar".', 'Evento', mtInformation, [mbok], 0);
     Abort;
  end;

  //Otacilio Aquino SOL 160863 Kintana 1381911
  if (bRequerBenef) {and (dtmBaseDados.dbBaseDados.InTransaction)} then
  begin
     if MsgDlg('O evento ainda não foi confirmado. '+#13+
               'O Requerimento de Benefício será desfeito. '+#13+
               'Deseja realmente sair da tela ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes then
     begin
       //Otacilio Aquino SOL 160863 Kintana 1381911 ** Inicio **
       if dtmBasedados.dbBaseDados.InTransaction then
         dtmBasedados.dbBaseDados.RollBack;

       dtmBasedados.dbBaseDados.StartTransaction;
       //Otacilio Aquino SOL 160863 Kintana 1381911 ** Fim **

       if not DesfazRequerimentos(qryAux, sNumerosProcessos) then
       begin
         if MsgDlg('Ocorreram erros ao Desfazer os Requerimentos de Benefício. '+
                   'Deseja desfazer apenas o evento ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo then
         begin
           //Otacilio Aquino SOL 160863 Kintana 1381911
           dtmBaseDados.dbBaseDados.Rollback;
           dtmBasedados.dbBaseDados.StartTransaction;
           Abort;
         end;
       end;
       //Otacilio Aquino SOL 160863 Kintana 1381911
       dtmBaseDados.dbBaseDados.Commit;
       dtmBasedados.dbBaseDados.StartTransaction;
     end
     else
       Abort;
  end;

  inherited;
end;

procedure TfrmEventoAposentadoria.edMatriculaExit(Sender: TObject);
begin
  inherited;
  if edMatricula.Text = '' Then
     bbtnProcurar.SetFocus
  else Begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Text := 'SELECT ELEGPATRO.MATRICULA AS C0, PESSOA.NOME AS C1, PARTPREVPLAN.INSCRICAONUMERO AS C2,' +
        ' PARTPREVPLAN.INSCRICAODATA AS C3, PLANPREV.NOME AS C4, PATRO.NOME AS C5, ELEGPATRO.IDPESSOA AS C6, '+
        ' ELEGPATRO.IDPESSJUR AS C7, PLANPREV.IDPLANOPREV AS C8, PESSOA.NOME AS C9, '+
        ' ELEGPATRO.MATRICULA AS C10, PATRO.NOME AS PATRO, PLANPREV.NOME AS PLANO, '+
        ' SITFUNC.DESCRICAO AS C13, SITPART.DESCRICAO AS C14, SITPLANOPREV.DESCRICAO AS C15, '+
        ' PESSOA.NUMDOCUMENTO AS C16, PESSOAFISICA.DATANASC AS C17, PARTPREVPLAN.INSCRICAONUMERO AS C18, '+
        ' PARTPREVPLAN.INSCRICAODATA AS C19, PARTPREVPLAN.VALORCALCINSS AS C20, SITFUNC.IDSITFUNC AS C21, '+
        ' SITPART.IDSITPART AS C22, SITPLANOPREV.IDSITPLANOPREV AS C23, PARTPREVPLAN.DATAINICIOASSIST AS C24, '+
        ' PARTPREVPLAN.SEQPROPOSTA AS C25, PARTPREVPLAN.FLGSALVIRTBENEF AS C26, '+
        ' ELEGPATRO.TEMPOSERVANTREAL AS C27, ELEGPATRO.TEMPOSERVANTERIOR AS C28, '+
        ' ELEGPATRO.DATADEMISSAO AS C29, PARTPREVPLAN.FLGFITESPECIAL AS C30, '+
        ' SITFUNC.TIPOSIT AS C31, ELEGPATRO.TEMPOSERVTOTAL AS C32, SITPART.FLGINTERNO AS C33, '+
        ' ELEGPATRO.TEMPOSERVTOTMES AS C34, ELEGPATRO.TEMPOSERVTOTDIA AS C35 '+
        ' FROM PESSOA, ELEGPATRO, PARTPREVPLAN, PESSOA PATRO, PLANPREV, SITFUNC, SITPART, '+
        ' SITPLANOPREV, PESSOAFISICA '+
        ' WHERE ( ELEGPATRO.MATRICULA = ''' + edMatricula.Text + ''') AND '+
        '       ( PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA ) AND '+
        '       ( ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA ) AND '+
        '       ( ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR ) AND '+
        '       ( PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV ) AND '+
        '       ( PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR ) AND '+
        '       ( ELEGPATRO.IDSITFUNC = SITFUNC.IDSITFUNC(+) ) AND '+
        '       ( PARTPREVPLAN.IDSITPART = SITPART.IDSITPART ) AND '+
        '       ( PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV ) AND '+
        '       ( PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA ) ';
     qryAux.Open;
     if qryAux.EOF Then
     Begin
        MsgDlg('Matrícula não encontrada','Informação',mtInformation,[mbOk,mbHelp],0);
        LimpaCampos;
        TiraSql(qryAux);
        EdMatricula.SetFocus;
        bbtnConfirmar.Enabled := False;
        bbtnCancelar.Enabled  := False;
        exit;
     end;
     SetarVariaveis;
     SetarMatricula;
  end;
end;

procedure TfrmEventoAposentadoria.SetarMatricula;
begin

  pnlInformacao.Enabled := True;
  pnlBotao.Enabled      := True;

  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled  := True;

  // SOL 182331 KINTANA 1710430 - JRM6
  // Este código foi implementado neste SOL pois estava ocorrendo "Access Violation"
  // pela falta do create. apesar de não ser escopo do SOL em questão foi
  // implementado de forma a suprimir a ocorrencia de erro.
  if conspart1 = Nil then
  begin
    ConsPart1 := TConsPart.Create(self);
  end;
  // SOL 182331 KINTANA 1710430 - JRM6

   ConsPart1.sIdPessoa    := sidpessoa;
   ConsPart1.sIdTitular   := sIdPessoa;
   ConsPart1.sSeqProposta := sseqproposta;
   ConsPart1.sIdPlanoprev := sidplanoprev;
   ConsPart1.DataBaseName := 'BaseDados';
   ConsPart1.sIdPessjur := sidpessjur;
  if (sistema.IdModulo <> 454) then begin //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
      ConsPart1.Enabled := true;
      bbtnOpcoes.enabled := true;
  end;

   // Verifica se o evento já foi registrado
   VerificaEstadoEvento;

   bAltera := True;
   if sEstadoEvento = 'NAO REGISTRADO'
   then begin // Verifica se pode Inserir
        if not PodeRegistrarEvento(qryAux, sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta,
                                           sFlgInterno,sIdSitFunc,sIdSitPart,sIdSitPlanoPrev,sMotivoEvento)
        then begin
           MsgDlg('Esse Evento não pode ser registrado. Motivo : '+sMotivoEvento,'Informação',mtInformation,[mbOk,mbHelp],0);
           LimpaCampos;
           TiraSql(qryAux);

           bbtnConfirmar.Enabled := False;
           bbtnCancelar.Enabled  := False;
           exit;
        end;
        bAltera := False;
        bEfetivado := False;
        dtEvento.Text         := '';

        //edilaine - SIG42986 - inicio
        If (Trim(dtDemissao.Text) = '') and (not bAposentaJudicial) Then
           dtDemissao.Text  := FormatDateTime('dd/mm/yyyy', Date);
        //edilaine - SIG42986 - fim


        dblkpcmbSitFunc.Text      := '';
        dblkpcmbSitPlanoPrev.Text := '';
        dblkpcmbSitPart.Text      := '';


        chkSitEspecial.Checked    := False;
        pnlBotao.Enabled := True;
     end
     else begin
        if (sistema.idmodulo <> 454) then begin  //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
            if sEstadoEvento = 'REGISTRADO'
            then begin// Pode Alterar
               MsgDlg('Esse Evento já foi registrado.','Informação',mtInformation,[mbOk,mbHelp],0);
               TiraSql(qryAux);
               bAltera := True;
               bEfetivado := False;

               if Trim(sFlgSitEspecial) = '1'
               then chkSitEspecial.Checked    := True
               else chkSitEspecial.Checked    := False;

               bbtnConfirmar.Enabled := True;
               bbtnCancelar.Enabled  := True;
               pnlBotao.Enabled := True;
               if (sistema.idmodulo <> 454) then //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
               dtEvento.SetFocus;
            end
            else if sEstadoEvento = 'EFETIVADO'
                 then begin// Não Pode Alterar, nem inserir outro evento
                    MsgDlg('Esse Evento já foi efetivado. Não pode ser alterado.','Informação',mtInformation,[mbOk,mbHelp],0);
                    TiraSql(qryAux);
                    bAltera := True;
                    bEfetivado := True;

                    if Trim(sFlgSitEspecial) = '1'
                    then chkSitEspecial.Checked    := True
                    else chkSitEspecial.Checked    := False;
                    pnlInformacao.Enabled := False;

                    bbtnConfirmar.Enabled := False;
                    bbtnCancelar.Enabled  := False;
                    bbtnRequerBeneficio.Enabled := True;
                    pnlBotao.Enabled      := True; //Renato Visoni SOL 156778 Kintana 1247264


                 end;
          end;
        dtEvento.Date             := StrToDate(qryEvento.FieldByName('DataEvento').AsString);
        dblkpcmbSitFunc.Text      := qryEvento.FieldByName('NOMESITFUNC').AsString;
        dblkpcmbSitFunc.PerformSearch;

        dblkpcmbSitPlanoPrev.Text := qryEvento.FieldByName('NOMESITPLANO').AsString;
        dblkpcmbSitPlanoPrev.PerformSearch;

        dblkpcmbSitPart.Text      := qryEvento.FieldByName('NOMESITPART').AsString;
        dblkpcmbSitPart.PerformSearch;

        edSitPatro.Text           := qryEvento.FieldByName('NOMESITFUNCANT').AsString;
        edSitPlano.Text           := qryEvento.FieldByName('NOMESITPLANOANT').AsString;
        edSitFundacao.Text        := qryEvento.FieldByName('NOMESITPARTANT').AsString;
        sFlgIntPartAntes          := qryEvento.FieldByName('FLGINTANT').AsString;
        dtRequerimento.Text       := qryEvento.FieldByName('DATAREQUERIMENTO').AsString;
   end;
end;

procedure TfrmEventoAposentadoria.SetarVariaveis;
begin
     sIdPessoa          := InttoStr(qryAux.FieldByName('C6').AsInteger); // IDPESSOA
     sIdPessJur         := InttoStr(qryAux.FieldByName('C7').AsInteger); // IDPESSJUR
     sIdPlanoPrev       := InttoStr(qryAux.FieldByName('C8').AsInteger); // IDPLANOPREV
     edNome.Text        := qryAux.FieldByName('C1').AsString; // PESSOA.NOME
     edMatricula.Text   := qryAux.FieldByName('C0').AsString; // MATRICULA
     edPatro.Text       := qryAux.FieldByName('C5').AsString; // PATRO.NOME
     edPlano.Text       := qryAux.FieldByName('C4').AsString; // PLANO.NOME
     edSitPatro.Text    := qryAux.FieldByName('C14').AsString; // PATRO.SITPATRO
     edSitFundacao.Text := qryAux.FieldByName('C13').AsString; // SITFUNDACAO
     edSitPlano.Text    := qryAux.FieldByName('C15').AsString; // SITPLANO
     edInscNumero.Text  := qryAux.FieldByName('C2').AsString; // INSCRICAONUMERO
     sIdSitFunc         := InttoStr(qryAux.FieldByName('C21').AsInteger); // IDSITFUNC
     sIdSitPart         := InttoStr(qryAux.FieldByName('C22').AsInteger); // IDSITPART
     sIdSitPlanoPrev    := InttoStr(qryAux.FieldByName('C23').AsInteger); // IDSITPLANOPREV
     sSeqProposta       := InttoStr(qryAux.FieldByName('C26').AsInteger); // SEQPROPOSTA
     if qryAux.FieldByName('C22').AsInteger <> 0   // TEMPOSERVANTREAL
     then sTempoServAntReal  := InttoStr(qryAux.FieldByName('C22').AsInteger) // ELEGPATRO.TEMPOSERVANTREAL
     else sTempoServAntReal  := InttoStr(qryAux.FieldByName('C23').AsInteger); // ELEGPATRO.TEMPOSERVANTERIOR
     dtDemissao.Text    := qryAux.FieldByName('C30').AsString;  // DATADEMISSAO
     sFlgSitEspecial    := qryAux.FieldByName('C31').AsString;  // FLGSITESPECIAL
     sTipoSitFuncAntes  := qryAux.FieldByName('C32').AsString; //TIPOSITFUNCANTES
     edTempoServTotal.Text := InttoStr(qryAux.FieldByName('C33').AsInteger); //TEMPOSERVTOTAL
     sFlgIntPartAntes   := qryAux.FieldByName('C34').AsString; //FLGINTPARTANTES
     edTempoServMES.Text    := qryAux.FieldByName('C35').AsString;
     edTempoServDIA.Text    := qryAux.FieldByName('C36').AsString;

     bAposentaJudicial := ValidaDeterminacaoJudicial();             //edilaine - SIG42986     
end;

procedure TfrmEventoAposentadoria.edInscNumeroExit(Sender: TObject);
begin
  inherited;
  if edInscNumero.Text = '' Then
     bbtnProcurar.SetFocus
  else Begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Text := 'SELECT ELEGPATRO.MATRICULA AS C0, PESSOA.NOME AS C1, PARTPREVPLAN.INSCRICAONUMERO AS C2,' +
        ' PARTPREVPLAN.INSCRICAODATA AS C3, PLANPREV.NOME AS C4, PATRO.NOME AS C5, ELEGPATRO.IDPESSOA AS C6, '+
        ' ELEGPATRO.IDPESSJUR AS C7, PLANPREV.IDPLANOPREV AS C8, PESSOA.NOME AS C9, '+
        ' ELEGPATRO.MATRICULA AS C10, PATRO.NOME AS PATRO, PLANPREV.NOME AS PLANO, '+
        ' SITFUNC.DESCRICAO AS C13, SITPART.DESCRICAO AS C14, SITPLANOPREV.DESCRICAO AS C15, '+
        ' PESSOA.NUMDOCUMENTO AS C16, PESSOAFISICA.DATANASC AS C17, PARTPREVPLAN.INSCRICAONUMERO AS C18, '+
        ' PARTPREVPLAN.INSCRICAODATA AS C19, PARTPREVPLAN.VALORCALCINSS AS C20, SITFUNC.IDSITFUNC AS C21, '+
        ' SITPART.IDSITPART AS C22, SITPLANOPREV.IDSITPLANOPREV AS C23, PARTPREVPLAN.DATAINICIOASSIST AS C24, '+
        ' PARTPREVPLAN.SEQPROPOSTA AS C25, PARTPREVPLAN.FLGSALVIRTBENEF AS C26, '+
        ' ELEGPATRO.TEMPOSERVANTREAL AS C27, ELEGPATRO.TEMPOSERVANTERIOR AS C28, '+
        ' ELEGPATRO.DATADEMISSAO AS C29, PARTPREVPLAN.FLGFITESPECIAL AS C30, '+
        ' SITFUNC.TIPOSIT AS C31, ELEGPATRO.TEMPOSERVTOTAL AS C32, SITPART.FLGINTERNO AS C33 '+
        ' ELEGPATRO.TEMPOSERVTOTMES AS C34, ELEGPATRO.TEMPOSERVTOTDIA AS C35 '+
        ' FROM PESSOA, ELEGPATRO, PARTPREVPLAN, PESSOA PATRO, PLANPREV, SITFUNC, SITPART, '+
        ' SITPLANOPREV, PESSOAFISICA '+
        ' WHERE ( PARTPREVPLAN.INSCRICAONUMERO = ''' + edInscNumero.Text + ''') AND '+
        '       ( PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA ) AND '+
        '       ( ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA ) AND '+
        '       ( ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR ) AND '+
        '       ( PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV ) AND '+
        '       ( PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR ) AND '+
        '       ( ELEGPATRO.IDSITFUNC = SITFUNC.IDSITFUNC(+) ) AND '+
        '       ( PARTPREVPLAN.IDSITPART = SITPART.IDSITPART ) AND '+
        '       ( PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV ) AND '+
        '       ( PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA ) ';
     qryAux.Open;
     if qryAux.EOF Then
     Begin
        MsgDlg('Inscrição não encontrada','Informação',mtInformation,[mbOk,mbHelp],0);
        LimpaCampos;
        TiraSql(qryAux);
        EdMatricula.SetFocus;
        bbtnConfirmar.Enabled := False;
        bbtnCancelar.Enabled  := False;
        exit;
     end;
     SetarVariaveis;

     SetarMatricula;
  end;

end;

procedure TfrmEventoAposentadoria.ConsPart1Click(Sender: TObject);
begin
  //Otacilio Aquino SOL 160863 Kintana 1381911
  if uBeneficio.bGravaEvento then
  begin
     MsgDlg('Evento em aberto confirme "OK" ou "Cancelar" para fazer nova consulta.', 'Evento', mtInformation, [mbok], 0);
     Abort;
  end;

  inherited;
end;

procedure TfrmEventoAposentadoria.ConcederOK;
var
  sNumerosProcessos : string;
  cTipoBenef : Char;
  iIdCalculo : Integer;
  qryCO: TwwQuery;
begin
  inherited;
  qryCO := TwwQuery.Create(Application);
  qryCO.DatabaseName := 'BaseDados';
  qryCO.SQL.Text := sSQLCO;
  qryCO.Close;
  qryCO.ParamByName('MATRICULA').AsString := edMatricula.Text;
  qryCO.Open;
  if not qryCO.IsEmpty then begin
      sNumerosProcessos:= qryCO.FieldByName('NUMEROPROCESSO').AsString;

      CriaDataModule;
      cTipoBenef := 'P';


      case  cTipoBenef of
         'P' : // Concessao de Beneficio para PARTICIPANTE
         begin
                AbreRequerParticip(
                  'CO',qryCO.FieldByName('IDPESSOA').AsString, qryCO.FieldByName('IDPESSJUR').AsString,
                  qryCO.FieldByName('IDPLANOPREV').AsString, qryCO.FieldByName('SEQPROPOSTA').AsString,
                  qryCO.FieldByName('DTEVENTO').AsString,'', '-1','',
                  sNumerosProcessos,'',
                  '','','','','','','','','',
                  '',sNumerosProcessos,qryCO.FieldByName('MATRICULA').AsString,true);

                  TB97oKCancelar.Visible := true;
                  TB97oKCancelar.Enabled := true;
                  bbtnConfirmar.Enabled := true;
                  bbtnCancelar.Enabled := false;
                  if (uBeneficio.bGravaEvento)then begin
                      uBeneficio.bGravaEvento := false;
                        //bbtnConfirmarClick(self);
                  end;

         end;
      end;
  end;
end;

procedure TfrmEventoAposentadoria.CriaDataModule;
begin
  inherited;
  If DtmRelatorios = nil
   Then Begin
     Screen.Cursor := crSQLWait;
     try
       application.processmessages;
       Application.CreateForm(TDtmRelatorios, DtmRelatorios);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelatorios".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;
   End;

  If DtmRelatAdmPrev = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TDtmRelatAdmPrev, DtmRelatAdmPrev);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelatAdmPrev".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If DtmRelRetroRegional = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TDtmRelRetroRegional, DtmRelRetroRegional);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelRetroRegional".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If DtmRelatorioGerencial = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TDtmRelatorioGerencial, DtmRelatorioGerencial);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelatorioGerencial".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If DtmRelatAdmPrev2 = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TDtmRelatAdmPrev2, DtmRelatAdmPrev2);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelatAdmPrev2".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If dtmRelTempoServicoMT = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TdtmRelTempoServicoMT, dtmRelTempoServicoMT);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TdtmRelTempoServicoMT".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If dtmRelatEspecificos = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TdtmRelatEspecificos, dtmRelatEspecificos);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TdtmRelatEspecificos".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If DtmRelTransfPlano = Nil
   Then
     try
       application.processmessages;
       Application.CreateForm(TDtmRelTransfPlano, DtmRelTransfPlano);
       application.processmessages;
     except
       on E:Exception do
       begin
         MessageDlg(
           'Erro ao criar datamodule "TDtmRelTransfPlano".'+#13+#10+
           'Mensagem de erro : '+E.Message+#13+#10+
           'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
       end;
     end;

  If Screen.Cursor = crSqlWait
   Then Screen.Cursor := crDefault;
end;

//edilaine - SIG42986 - inicio
function TfrmEventoAposentadoria.ValidaDeterminacaoJudicial : boolean;
begin
  {para Aposentadoria por Tempo de Contribuição (evento = 2), TC Especial (evento = 11) e
   TC Adcional (evento = 364) quando o participante possuir o parâmetro
   135 - Concessão por decisão judicial, a elegibilidade nao verifica "data de demissão" }

  if (Sistema.IdModulo = 452) and
     ((sIdEventoGerador = '2') or (sIdEventoGerador = '11') or (sIdEventoGerador = '364') or (sIdEventoGerador = '7')) then
  begin
    qryJudicial.Close;
    qryJudicial.ParamByName('IDPESSOA').AsInteger := StrToInt(sIdPessoa);
    qryJudicial.Open;

    result := not qryJudicial.eof;

    qryJudicial.Close;
  end
  else
    Result := false;
end;
//edilaine - SIG42986 - fim

end.
