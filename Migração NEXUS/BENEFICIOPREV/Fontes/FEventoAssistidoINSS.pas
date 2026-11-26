// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{
-------------------------------------------------------------------------------
Nº SIG.....: 94444
Data       : 21/11/2019
Responsável: Rafael Vasconcelos
Descrição..: Quando o participante possuir evento de Falecimento, o sistema não
			 não pode inserir outro.
-------------------------------------------------------------------------------
Nº SIG.....: 83457
Data       : 08/08/2019
Responsável: Taffarel Sevaybriker
Descrição..: Ajuste na validação do evento.
-------------------------------------------------------------------------------
Nº SIG.....: 83421
Data       : 12/03/2019
Responsável: Osni Cavalcante
Descrição..: Ajuste complementar ao atendimento do SIG 83420
-------------------------------------------------------------------------------
Nº SIG.....: 83420
Data       : 12/03/2019
Responsável: Osni Cavalcante
Descrição..: Correção, na alteração realizada pelo SIG 83134, para considerar
             apenas o evento de aposentadoria INSS (idEventoGerador = 129)
-------------------------------------------------------------------------------
Nº SIG.....: 83134
Data       : 12/03/2019
Responsável: Taffarel Sevaybriker
Descrição..: Alteração na consulta para não trazer pessoas canceladas no plano
             na tela de geração de evento de aposentadoria.
-------------------------------------------------------------------------------
Nº SIG.....: 23985
Data       : 27/10/2016
Responsável: Darivaldo Alencar
Descrição..: Alteração da mensagem "O Tempo de Serviço Total não foi informado"
             para não permitir prosseguir quando não for preenchido.
-------------------------------------------------------------------------------
Nº SIG.....: 23382
Data       : 14/09/2016
Responsável: Andre Imakawa
Descrição..: Ao fazer a concessão em 2 etapas (deixar pendente, e homologar via
             tela de concessão, posteriormente), o sistema não está gravando o
             tempo de contribuição na tabela BENEFBFCIARIO.
-------------------------------------------------------------------------------
Nº SOL.....:
PPM........: 22462
Data       : 07/06/2016
Responsável: William Moreira da Silva
Descrição..: Erro ao criar evento de aposentadoria
-------------------------------------------------------------------------------
Nº SOL.....: 249379/18179
PPM........: 1410733
Data       : 10/05/2016
Responsável: Felipe Azevedo dos Santos
Descrição..: Gravar as informações de tempo de contribuição na estrutura BENEFBFCIARIO
-------------------------------------------------------------------------------
Nº SOL.....: 271138
PPM........: 1353841
Data       : 31/03/2016
Responsável: William Santana
Descrição..: inconsistência no momento de gerar um novo evento de aposentadoria
-------------------------------------------------------------------------------
Alteração  : bbtnSairClick
Nº SOL.....: 271251
KTN / PPM  : 1355374
Data       : 31/03/2016
Responsável: Edilaine
Descrição..: Ao clicar no botão sair das telas de eventos INSS o sistema apresenta
             tela de erro
{-------------------------------------------------------------------------------
Alteração  : separacao da funcionalidade do CadastroPrev
Nº SOL.....: 253577-18129
KTN / PPM  : 1303078
Data       : 24/02/2016
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - separação das interfaces
-------------------------------------------------------------------------------}
//Pendência   : SOL 263820 KINTANA 1124364
//Responsável : Fernando Xavier
//Data        : 21/10/2015
//Descrição   : A tela esta apresentando informações coerentes as informações do
//              plano selecionado.
//--------------------------------------------------------------------------------
//Pendência   : SOL 224532 KINTANA 2059240
//Responsável : Fernando Xavier
//Data        : 04/02/2014
//Descrição   : retirada a implementação do SOL 219376.
//--------------------------------------------------------------------------------

//Pendência   : SOL 211709/15287 KINTANA 2050393
//Responsável : Higor Nayde Ferreira
//Data        : 25/10/2013
//Descrição   : Atividade para liberação de versão 15188.
//              Retirar de campos e fazer com que não possa mais ser inserido
//              mais nenhum evento de morte no modulo.
// -----------------------------------------------------------------------------
//Pendência   : SOL 219376 KINTANA 2055349
//Responsável : Fernando Xavier
//Data        : 12/12/2013
//Descrição   : A tela esta apresentando o nome do plano errado.
//--------------------------------------------------------------------------------
// Pendência : SOL 181948 - KINTANA 1724239
// Autor(a)  : TADEU PASSOS
// Data      : 05/03/2013
// Descrição : Remoção de mensagem de erro, aliás ela apenas foi comentada
// -----------------------------------------------------------------------------
//Pendência   : SOL 175700 KINTANA 1685331
//Responsável : Jonas Otavio
//Data        : 21/08/2012
//Descrição   : Implementação da limitação do campo "Data do Evento", na funcionalidade
//eventos seja limitada sempre até a data atual.
//--------------------------------------------------------------------------------
//Responsável : Marcos Merola/Douglas.Siqueira
// Data       : 30/03/2012
//Pendência   : SOL 157501 Kintana 1256867
//Descrição   : Implementação na rotina SetarMatricula , para gerar um novo Evento
//              Caso Evento já estiver encerrado - Aposentadoria INSS.
//--------------------------------------------------------------------------------
//Pendência   : SOL 160863 KINTANA 1381911
//Responsável : OTACILIO AQUINO
//Data        : 18/11/2011
//Descrição   : Gravar o Evento antes de fazer uma nova pesquisa.
//--------------------------------------------------------------------------------
//------------------------------------------------------------------------------
//Responsável : Otacilio Aquino
//Pendência   : SOL 161040 Kintana 1356059
//Descrição   : Implementação de trava no requerimento quando não tiver conta
//              salario cadastrada.
//------------------------------------------------------------------------------
//Responsável : Renato Visoni
//Pendência   : SOL 157179 Kintana 1249229
//Descrição   : A trava do requerimento estava sendo feira pelo IDPESSOA e o certo
//              é fazer pelo IDTITULAR.
//--------------------------------------------------------------------------------
//Responsável : Renato Visoni
//Pendência   : SOL 155058 Kintana 1197225
//Descrição   : Ao clicar no botão OK o sistema não estava fazendo nada.
//--------------------------------------------------------------------------------
//Responsável : Fernando Xavier
//Pendência   : SOL 141078 Kintana 888253
//Descrição   : Implementação de TRava no requerimento
//--------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 07/05/2007
// Pendência   : 19061
// Rotina      : bbtnRequerBeneficioClick
// Descricao   : Incluir paramento para função AbreRequerBfciario retornar o IDCALCULO e
//               depois atualizar a tabela de eventos.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 28/09/2006
// Pendência   : 23419
// Rotina      : bbtnRequerBeneficioClick
// Descricao   : Passar a DataRequerimento do evento para a rotina AbreRequerParticip.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Pendência   : 23380
// Data        : 26/09/2006
// Descrição   : Retirei filtro do FLGDESATIVADO do MontaSelect
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
// Autor(a)    : Augusto
// Data        : 06/04/2004
// Descrição   : Acerto para botar conceder beneficio de evento EFETIVADO 
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
// Data        : 01.09.2003
// Alteração   : Inclusao do parametro flginterno para ver se o evento já existe
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

unit FEventoAssistidoINSS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc, cmseldlg, TREdit, URegra, TB97Tlbr, Mask, DBCtrls, UConsPart,
  IvDictio, IvMulti, IvEMulti, TEdNum, wwdbdatetimepicker, CMDateTimePicker,

  dRelRetroRegional,dRelatorios, dRelatAdmPrev,  fTipoBenefConcede,
  dRelatGerencial,  dRelTempoServicoMT,
  dRelatEspecificos, dRelTransfPlano, fCadRequerBenefPensionista;

const
sSQLCO =     ('SELECT  DISTINCT  EL.MATRICULA,'+
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
              '        B.IDPLANOPREV '+
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


sSQLCOMort = ('SELECT    '+
              '       BB.NUMEROPROCESSO, '+
              '       P.NOME, '+
              '       D.DESCRICAO, '+
              '       P.IDPESSOA, '+
              '       DT.NUMSEQUENCIA,'+
              '       DT.IDDEPENDENCIA,'+
              '       DT.FLGCONTAIMPOSTOR,'+
              '       DT.FLGCONTASALARIOF,'+
              '       DT.FLGBENEFICIARIO,'+
              '       BT.IDTITULAR,'+
              '       BT.IDPESSJUR,'+
              '       BT.IDPLANOPREV,'+
              '       BT.IDPESSOA,'+
              '       BT.IDRESPONSAVEL,'+
              '       BT.IDBENEFICIO,'+
              '       BT.PRIORIDADE,'+
              '       BT.PERCENTUAL,'+
              '       PRESP.NOME AS NOMERESPONSAVEL,'+
              '       PF.DATANASC,'+
              '       PF.SEXO,'+
              '       DT.MATRICULA,'+
              '       BT.IDPLANOORIGEM,'+
              '       BT.SEQPROPOSTA,  '+
              '       PB.DTEVENTO      '+
              '  FROM PESSOA          P,'+
              '       PESSOA          PRESP,'+
              '       DEPEN           D,'+
              '       DEPENTIT        DT,'+
              '       BFCIARIOTITPLAN BT,'+
              '       BENEFBFCIARIO   BB,'+
              '       PESSOAFISICA    PF,'+
              '       PROCESSOBENEF   PB '+
              ' WHERE (BB.NUMEROPROCESSO = :NUMEROPROCESSO) '+
              '   AND (PB.NUMEROPROCESSO = BB.NUMEROPROCESSO) '+
              '   AND (P.IDPESSOA = BT.IDPESSOA) '+
              '   AND (PF.IDPESSOA = P.IDPESSOA) '+
              '   AND (BB.IDPESSOA = BT.IDPESSOA) '+
              '   AND (BB.IDTITULAR = BT.IDTITULAR) '+
              '   AND (BB.IDPESSJUR = BT.IDPESSJUR) '+
              '   AND (BB.IDPLANOPREV = BT.IDPLANOPREV) '+
              '   AND (BB.IDPLANOORIGEM = BT.IDPLANOORIGEM) '+
              '   AND (BB.IDBENEFICIO = BT.IDBENEFICIO) '+
              '   AND (BT.IDRESPONSAVEL = PRESP.IDPESSOA(+)) '+
              '   AND (DT.IDPESSOA = BT.IDPESSOA) '+
              '   AND (DT.IDTITULAR = BT.IDTITULAR) '+
              '   AND (D.IDDEPENDENCIA = DT.IDDEPENDENCIA) '+
              ' ORDER BY P.NOME ');


type
  TfrmEventoAssistidoINSS = class(TfrmOkCancelar)
    Panel2: TPanel;
    Panel3: TPanel;
    bbtnProcurar: TBitBtn;
    pnlInformacao: TPanel;
    lblSitNovaPatro: TLabel;
    Label7: TLabel;
    qryAux: TwwQuery;
    lblValores: TLabel;
    Label11: TLabel;
    pnlBotao: TPanel;
    bbtnRequerBeneficio: TBitBtn;
    MontaSelectPart: TMontaSelect;
    Label13: TLabel;
    qryRegra: TwwQuery;
    regCalculo: TRegra;
    Label10: TLabel;
    dtEvento: TCMDateTimePicker;
    qryGrava: TwwQuery;
    Panel5: TPanel;
    ConsPart1: TConsPart;
    bbtnOpcoes: TBitBtn;
    chkSitEspecial: TCheckBox;
    Label4: TLabel;
    qryEvento: TwwQuery;
    pnlTempoServTotal: TPanel;
    Label12: TLabel;
    Label14: TLabel;
    edTempoServTotal: TEditNum;
    Label15: TLabel;
    edTempoServMes: TEditNum;
    edTempoServDia: TEditNum;
    Label16: TLabel;
    edSitFuncNova: TEdit;
    edSitPlanoNova: TEdit;
    edSitPartNova: TEdit;
    dtRequerimento: TCMDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    edNome: TEdit;
    Label8: TLabel;
    lblPatro: TLabel;
    edPatro: TEdit;
    Label3: TLabel;
    edPlano: TEdit;
    edMatricula: TEdit;
    Label9: TLabel;
    lblSitPatro: TLabel;
    Label6: TLabel;
    edSitPatro: TEdit;
    edSitPlano: TEdit;
    Label5: TLabel;
    edSitFundacao: TEdit;
    edInscNumero: TEdit;
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnRequerBeneficioClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnOpcoesClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure edMatriculaExit(Sender: TObject);
    procedure edInscNumeroExit(Sender: TObject);
    procedure dtEventoExit(Sender: TObject);
    procedure ConsPart1Click(Sender: TObject);
    procedure MontaSelectPartBeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure ConcederOK(cTipoBenef : Char);
    procedure CriaDataModule;
  private
    { Private declarations }
    bEncerrou : boolean; 
    iIdEventoPrev: integer;
    iIdCalculo : Integer;

    sNumerosProcessos,
    sTipoSitFuncAntes,
    sFlgIntPartAntes,

    sIdPessoa, sIdPessJur, sIdPlanoPrev, sSeqProposta,IDPESSOA: string;
    sIdSitFunc, sIdSitPart, sIdSitPlanoPrev, sTempoServAntReal: string;
    sFlgSitFuncImed, sFlgSitPartImed, sFlgSitPlanoImed: string;
    sFlgEfetivado, sDataEfetivado: string;
    bEfetivado,
    bAltera,
    bRequerBenef: boolean;

    sEstadoEvento: string;
    sFlgSitEspecial: string;
    rOpcao1,               rOpcao2,                  rOpcao3,
    rOpcao4,               rOpcao5,                  rOpcao6               : real;
    sGera : String;
    procedure VerificaeGravaSituacoes;
    procedure GravaEVENTOSPREV;
    procedure LimpaCampos;
    procedure VerificaEstadoEvento;
    procedure SetarMatricula;
    procedure SetarVariaveis;
    procedure AtualizaTempoContribuicaoBenefBfCiario;  // Felipe Azevedo dos Santos - SOL 249379/18179 PPM 1410733
    procedure EventoRegistrado; //SIG83457 - TAES
    procedure EventoEfetivado;  //SIG83457 - TAES
  public
    { Public declarations }
    
    Msg : String;
  end;

var
  frmEventoAssistidoINSS: TfrmEventoAssistidoINSS;

implementation

uses
  UAdmPrev, UDataBase, UMensErro, FTelaAut, DBaseDados,
  FCadContribParticipante, FMostraContribuicoes, UEventos,
  UModulo, FCadOpcoesElegivel, FCadRequerBenefParticip, UBeneficio,
  fAguarde, UParticipante, FCadRequerBenefBfciario, Usistema,DRelatAdmPREV2;

{$R *.DFM}

procedure TfrmEventoAssistidoINSS.FormCreate(Sender: TObject);
begin
  inherited;
  bRequerBenef := False;

  if not dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.StartTransaction;
  bEncerrou := False; 
end;

procedure TfrmEventoAssistidoINSS.FormShow(Sender: TObject);
begin
  inherited;
  //Otacilio Aquino SOL 160863 Kintana 1381911
  uBeneficio.bGravaEvento := False;
  uBeneficio.sIdBeneficios := ''; // Felipe Azevedo dos Santos - SOL 249379/18179 PPM 1410733
  uBeneficio.sIdPessoas := ''; // Felipe Azevedo dos Santos - SOL 249379/18179 PPM 1410733

  pnlInformacao.enabled   := false;             // edilaine - SOL 253577-18129 / PPM 1303078

  //MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
 // edMatricula.SetFocus;
end;

procedure TfrmEventoAssistidoINSS.bbtnProcurarClick(Sender: TObject);
begin
  //Otacilio Aquino SOL 160863 Kintana 1381911
  if uBeneficio.bGravaEvento then
  begin
     MsgDlg('Evento em aberto confirme "OK" ou "Cancelar" para fazer nova procura.', 'Evento', mtInformation, [mbok], 0);
     Abort;
  end;

  inherited;
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
    then sTempoServAntReal := MontaSelectPart.ValoresChave[21]  // ELEGPATRO.TEMPOSERVANTREAL
    else sTempoServAntReal := MontaSelectPart.ValoresChave[22]; // ELEGPATRO.TEMPOSERVANTERIOR


    sFlgSitEspecial        := MontaSelectPart.ValoresChave[24];
    sTipoSitFuncAntes      := MontaSelectPart.ValoresChave[25];
    edTempoServTotal.Text  := MontaSelectPart.ValoresChave[26];
    sFlgIntPartAntes       := MontaSelectPart.ValoresChave[27];
    edTempoServMES.Text    := MontaSelectPart.ValoresChave[28];
    edTempoServDIA.Text    := MontaSelectPart.ValoresChave[29];

    SetarMatricula;
  {
  // SOL 141078 KINTANA 888253
  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT FLGCONTAPREF FROM CM.CONTABANCARIA  '+
             ' WHERE  FLGCONTAPREF = 1 '+
             // Renato Visoni SOL 157179 Kintana 1249229
             //' AND   (IDPESSOA        = '+sIdPessoa   +')'
             ' AND    IDPESSOA IN ( SELECT IDPESSOA FROM BENEFBFCIARIO WHERE IDTITULAR = ' + sIdPessoa + ' AND IDTITULAR <> IDPESSOA )  '
             );
             // Renato Visoni SOL 157179 Kintana 1249229
     Open;
     if IsEmpty
     then begin
        Msg := 'Conta preferencial não cadastrada!';
     end;

     Close;
     SQL.Clear;
     SQL.Add(' SELECT NUMDOCUMENTO FROM CM.PESSOA  '+
             ' WHERE  NUMDOCUMENTO IS NOT NULL '+
             // Renato Visoni SOL 157179 Kintana 1249229
             //' AND   (IDPESSOA        = '+sIdPessoa   +')'
             ' AND    IDPESSOA IN ( SELECT IDPESSOA FROM BENEFBFCIARIO WHERE IDTITULAR = ' + sIdPessoa + ' AND IDTITULAR <> IDPESSOA ) '
             );
             // Renato Visoni SOL 157179 Kintana 1249229

     Open;
     if IsEmpty
     then begin
        if Msg <> '' then
           Msg := Msg + chr(13) + 'Participante/Pensionita sem CPF cadastrado!'
        else
           Msg := 'Participante/Pensionita sem CPF cadastrado!';
     end;

     Close;
     SQL.Clear;
     SQL.Add(' SELECT FLGISENTOIRRF FROM CM.PESSOAFISICA  '+
             ' WHERE  FLGISENTOIRRF IS NOT NULL '+
             // Renato Visoni SOL 157179 Kintana 1249229
             //' AND   (IDPESSOA        = '+sIdPessoa   +')'
             ' AND    IDPESSOA IN ( SELECT IDPESSOA FROM BENEFBFCIARIO WHERE IDTITULAR = ' + sIdPessoa + ' AND IDTITULAR <> IDPESSOA ) '
              );
             // Renato Visoni SOL 157179 Kintana 1249229
     Open;
     if IsEmpty
     then begin
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
  }


  end;

end;

procedure TfrmEventoAssistidoINSS.VerificaEstadoEvento;
begin
   // Verificar se evento já foi registrado na mesma categoria
   with qryEvento do
   begin
      Close;
      ParamByName('IdPessJur').AsInteger   := StrToInt(sIdPessJur);
      ParamByName('IdPlanoPrev').AsInteger := StrToInt(sIdPlanoPrev);
      ParamByName('IdPessoa').AsInteger    := StrToInt(sIdPessoa);
      ParamByName('SeqProposta').AsInteger := StrToInt(sSeqProposta);
      ParamByName('FlgInterno').AsString   := sFlgInterno; 
      Open;

      if IsEmpty
      then sEstadoEvento := 'NAO REGISTRADO' // Pode Inserir
      else if FieldByName('FLGEFETIVADO').AsString = '0'
           then begin
              sEstadoEvento := 'REGISTRADO'; // Pode Alterar
              sIdEventoGerador := FieldByName('IDEVENTOGERADOR').AsString;
           end
           else sEstadoEvento := 'EFETIVADO' // Não pode Alterar, nem inserir um novo
   end;

end;

procedure TfrmEventoAssistidoINSS.bbtnRequerBeneficioClick(Sender: TObject);
var sTempoContribuicao,
    sMsgErro : string;
begin
  inherited;
  if Trim(edNome.Text) = '' then
     begin
          MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
          bbtnProcurar.SetFocus;
          Exit;
     end;

  if Trim(dtEvento.Text) = ''
  then begin
     MsgDlg('A Data do Evento deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
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

  //Darivaldo Alencar SIG 23985 -inicio
  //if (Trim(edTempoServTotal.Text) = '') or (Trim(edTempoServTotal.Text) = '0')
  if (edTempoServTotal.Text = EmptyStr) or
     (edTempoServMes.Text = EmptyStr) or
     (edTempoServDia.Text = EmptyStr) then
   begin
    //     if MsgDlg('O Tempo de Serviço Total não foi informado. Confirma ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
    //     then begin
    //        edTempoServTotal.SetFocus;
            MsgDlg('O Tempo de Serviço Total não foi informado.','Aviso',mtWarning,[mbOK],0);
            Exit;
    //     end;
   end;
  //Darivaldo Alencar SIG 23985 -fim

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

  if not bEfetivado
  then VerificaeGravaSituacoes;

  If (edTempoServTotal.Text <> '0') And (edTempoServTotal.Text <> '') Then
    sTempoContribuicao := edTempoServTotal.Text+' anos ';
  If (edTempoServMes.Text <> '0')   And (edTempoServMes.Text <> '') Then
    sTempoContribuicao := sTempoContribuicao + edTempoServMes.Text+' meses ';
  If (edTempoServDia.Text <> '0')   And (edTempoServDia.Text <> '') Then
    sTempoContribuicao := sTempoContribuicao + edTempoServDia.Text+' dias ';

  if sFlgInterno = 'AI'
  then begin
     AbreRequerParticip('EV', sIdPessoa, sIdPessJur, sIdPlanoPrev,
                        sSeqProposta,dtEvento.Text,'',
                        sIdEventoGerador, '',sNumerosProcessos,
                        sTipoSitFuncAntes,
                        sFlgIntPartAntes,
                        sFlgIntPartAntes,
                        sIdSitPart,
                        sIdSitPlanoPrev,
                        sIdSitFunc,
                        sIdSitPart,
                        sIdSitPlanoPrev,
                        sIdSitFunc,
                        sTempoContribuicao,
                        dtRequerimento.Text);



  end
  else begin
     // Verifica se o Participante Selecionado possui Beneficiários
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT BF.IDTITULAR ' +
                    ' FROM BFCIARIOTITPLAN BF, BENEFICIO B ' +
                    ' WHERE BF.IDTITULAR   = ' + sIdPessoa    + ' AND ' +
                    '       BF.IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
                    '       BF.IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
                    '       BF.SEQPROPOSTA = ' + sSeqProposta + ' AND ' +
                    '       BF.IDBENEFICIO = B.IDBENEFICIO AND ' +
                    '       B.IDEVENTOGERADOR = ' + sIdEventoGerador + ' AND ' +
                    '       BF.IDTITULAR <> BF.IDPESSOA ');
     try
        qryAux.Open;
     except
        on E: EDBEngineError do
        begin
             MostrarErro(E);
             Exit;
        end;
     end;

     if qryAux.IsEmpty
     then begin

        MsgDlg('Este Participante não possui nenhum Beneficiário cadastrado. '+
               'Para Cadastrar um Beneficiário, utilize o Cadastro de Beneficiários.',
               'Informação',mtInformation,[mbOk,mbHelp],0);
        TiraSql(qryAux);
        Exit;
     end;

     iIdCalculo := 0;
     AbreRequerBfciario('EV',sIdPessoa, sIdPessJur, sIdPlanoPrev, sSeqProposta,
                        dtEvento.Text, sIdEventoGerador,'',
                        sNumerosProcessos,
                        sFlgIntPartAntes,
                        sFlgIntPartAntes,
                        sIdSitPart,
                        sIdSitPlanoPrev,
                        sIdSitFunc,
                        sIdSitPart,
                        sIdSitPlanoPrev,
                        sIdSitFunc,
                        iIdCalculo);

  end;

   // Felipe Azevedo dos Santos - SOL 249379/18179 PPM 1410733 - início
  if (uBeneficio.sIdBeneficios <> '') then
     AtualizaTempoContribuicaoBenefBfCiario;
  // Felipe Azevedo dos Santos - SOL 249379/18179 PPM 1410733 - fim

  // Mesmo que o evento já esteja efetivado,
  // se o usuario requereu um beneficio, habilitar o ok e o cancelar
  // para que ele possa gravar o beneficio
  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled  := True;
  //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
  if (sistema.IdModulo = 454)then begin
    if (sIdEventoGerador = '129')then
       ConcederOK('P')
    else if(sIdEventoGerador = '130') then
       ConcederOK('B');
  end;
 //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
end;

procedure TfrmEventoAssistidoINSS.bbtnConfirmarClick(Sender: TObject);
var
  sMesRef  : string;
  sMsgErro : string;
begin
  // SOL 141078 KINTANA 888253
  with qryAux do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT IDPESSOA FROM BENEFBFCIARIO ');
    SQL.Add(' WHERE IDTITULAR = ' + sIdPessoa  );
    SQL.Add(' AND IDTITULAR <> IDPESSOA   ');
    Open;
    if not isEmpty then
    begin
       Close;
       SQL.Clear;
       //KINTANA 1356059 SOL 161040 Otacilio Aquino ** Inicio **
       SQL.Add(' SELECT TIPOCONTA FROM CM.CONTABANCARIA '+
               ' WHERE TIPOCONTA = 2 '+
               // Renato Visoni SOL 157179 Kintana 1249229
               //' AND   (IDPESSOA        = '+sIdPessoa   +')'
               ' AND IDPESSOA IN ( SELECT IDPESSOA FROM BENEFBFCIARIO WHERE IDTITULAR = ' + sIdPessoa + ' AND IDTITULAR <> IDPESSOA )  '
               );
               // Renato Visoni SOL 157179 Kintana 1249229
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
               // Renato Visoni SOL 157179 Kintana 1249229
               //' AND   (IDPESSOA        = '+sIdPessoa   +')'
               ' AND    IDPESSOA IN ( SELECT IDPESSOA FROM BENEFBFCIARIO WHERE IDTITULAR = ' + sIdPessoa + ' AND IDTITULAR <> IDPESSOA ) '
               );
               // Renato Visoni SOL 157179 Kintana 1249229

       Open;
       if IsEmpty
       then begin
          if Msg <> '' then
             Msg := Msg + chr(13) + 'Participante/Pensionita sem CPF cadastrado!'
          else
             Msg := 'Participante/Pensionita sem CPF cadastrado!';
       end;

       Close;
       SQL.Clear;
       SQL.Add(' SELECT FLGISENTOIRRF FROM CM.PESSOAFISICA  '+
               ' WHERE  FLGISENTOIRRF IS NOT NULL '+
               // Renato Visoni SOL 157179 Kintana 1249229
               //' AND   (IDPESSOA        = '+sIdPessoa   +')'
               ' AND    IDPESSOA IN ( SELECT IDPESSOA FROM BENEFBFCIARIO WHERE IDTITULAR = ' + sIdPessoa + ' AND IDTITULAR <> IDPESSOA ) '
                );
               // Renato Visoni SOL 157179 Kintana 1249229
       Open;
       if IsEmpty
       then begin
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
  end;

  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     bbtnProcurar.SetFocus;
     Exit;
  end;

  if Trim(dtEvento.Text) = ''
  then begin
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

   //Rafael SIG 94444 - Inicio

  //GravaEVENTOSPREV;

   if  (sIdEventoGerador='130') and (not bAltera) then
   begin
       qryaux.close;
       qryaux.sql.text := ' SELECT 1  FROM CM.EVENTOSPREV  '+
               ' WHERE  IDPESSOA= '+  sIdPessoa +
               ' AND  IDPLANOPREV= '+  sIdPlanoPrev +
               ' AND  IDPESSJUR= '+  sIdPessJur +
               ' AND  IDEVENTOGERADOR = 130' ;
       qryaux.Open;
       if qryaux.IsEmpty
       then begin
          GravaEVENTOSPREV;
       end;
   end
   else
    GravaEVENTOSPREV;

 //Rafael SIG 94444 - Fim

  if chkSitEspecial.Checked
  then sFlgSitEspecial := '1'
  else sFlgSitEspecial := '0';

  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE PARTPREVPLAN SET FLGFITESPECIAL   = ' + sFlgSitEspecial+
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


    // cguedes - 19/12/2002
    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;


  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBasedados.dbBaseDados.Commit;

  // edilaine - SOL 253577-18129 / PPM 1303078 - comentado
  //MsgDlg('Evento efetuado com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);

  LimpaCampos;
  TiraSql(qryAux);
  bRequerBenef := False;

  // edilaine - SOL 253577-18129 / PPM 1303078 - inicio




  bbtnSairClick(self);

  {If Not CartaEvento(sIdPessoa, sIdPessJur, sIdPlanoPrev, sIdEventoGerador, sSeqProposta)
    Then MsgDlg('Carta do evento não emitida.','Informação',mtInformation,[mbOk,mbHelp],0);

  if not dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.StartTransaction;

  //Otacilio Aquino SOL 160863 Kintana 1381911
  uBeneficio.bGravaEvento := False;
  //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
  if (Sistema.IdModulo = 454)then  begin
    TB97oKCancelar.Enabled := false;
    bbtnConfirmar.Enabled := false;
  end;
  //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
  } // edilaine - SOL 253577-18129 / PPM 1303078 - fim


end;

procedure TfrmEventoAssistidoINSS.VerificaeGravaSituacoes;
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

  sFlgSitFuncImed := '0';
  sFlgSitPartImed := '0';
  sFlgSitPlanoImed:= '0';
  sFlgEfetivado   := '1';
end;

procedure TfrmEventoAssistidoINSS.GravaEVENTOSPREV;
Var
  sIdCalculo : String;
begin

  If ( iIdCalculo > 0 )
  Then sIdCalculo  := IntToStr( iIdCalculo )
  Else sIdCalculo := 'NULL';

  if not bAltera
  then begin
     iIdEventoPrev := LeUltRegistro(qryAux,'EVENTOSPREV');

     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' INSERT INTO EVENTOSPREV(IDEVENTOSPREV, DATAREGISTRO, DATAEVENTO, ' +
                    '                         IDPESSOA, IDPESSJUR, IDPLANOPREV, SEQPROPOSTA, ' +
                    '                         IDSITFUNCATUAL, IDSITPARTATUAL, IDSITPLANOATUAL, ' +
                    '                         IDSITFUNCNOVO, IDSITPARTNOVO, IDSITPLANONOVO, ' +
                    '                         IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED, FLGSITPLANOIMED, ' +
                    '                         DATAEFETIVADO, FLGEFETIVADO, INSCRICAONUMERO, DATAREQUERIMENTO, '+
                    '                         IDCALCULO '+' ) ' +
                    ' VALUES(' + IntToStr(iIdEventoPrev) + ',' + ' TO_DATE(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')' + ',' + ' To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
                                 sIdPessoa  + ',' + sIdPessJur + ',' + sIdPlanoPrev + ',' + sSeqProposta + ',' +
                                 sIdSitFunc + ',' + sIdSitPart + ',' + sIdSitPlanoPrev + ',' +
                                 sIdSitFunc + ',' + sIdSitPart + ',' + sIdSitPlanoPrev + ',' +
                                 sIdEventoGerador + ',' + sFlgSitFuncImed + ',' + sFlgSitPartImed + ',' + sFlgSitPlanoImed + ',' +
                                  'SYSDATE,' + sFlgEfetivado+','+OraNumero(edInscNumero.Text) + ', ' +
                                  'TO_DATE(''' + DateToStr(dtRequerimento.Date) + ''',''DD/MM/YYYY''), '+
                                  sIdCalculo +' ) ');
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
  else begin
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.Sql.Add(' UPDATE EVENTOSPREV SET DATAALTERADO = To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')' + ',' +
                    '                        DATAEVENTO   = To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
                    '                        DATAREQUERIMENTO = TO_DATE(''' + DateToStr(dtRequerimento.Date) + ''',''DD/MM/YYYY''), ' + 
                    '                        IDSITFUNCATUAL  = ' + sIdSitFunc + ',' +
                    '                        IDSITPARTATUAL  = ' + sIdSitPart + ',' +
                    '                        IDSITPLANOATUAL = ' + sIdSitPlanoPrev + ',' +
                    '                        IDSITFUNCNOVO   = ' + sIdSitFunc + ',' +
                    '                        IDSITPARTNOVO   = ' + sIdSitPart + ',' +
                    '                        IDSITPLANONOVO  = ' + sIdSitPlanoPrev + ',' +
                    '                        IDCALCULO       = ' + sIdCalculo +
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

procedure TfrmEventoAssistidoINSS.bbtnCancelarClick(Sender: TObject);
begin
  if MsgDlg('Todas as operações executadas serão canceladas. Confirma ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes
  then begin
     // Se requereu beneficio, apagar os requerimentos
     if bRequerBenef
     then begin
        if not DesfazRequerimentos(qryAux, sNumerosProcessos)
        then begin
           if MsgDlg('Ocorreram erros ao Desfazer os Requerimentos de Benefício. '+
                     'Deseja desfazer apenas o evento ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo
           then Exit;
        end;
     end;

     if dtmBasedados.dbBaseDados.InTransaction
     then dtmBasedados.dbBaseDados.RollBack;

     LimpaCampos;
     TiraSql(qryAux);

     bRequerBenef := False;
     if not dtmBaseDados.dbBaseDados.InTransaction
     then   dtmBaseDados.dbBaseDados.StartTransaction;

     //Otacilio Aquino SOL 160863 Kintana 1381911
     uBeneficio.bGravaEvento := False;
  end;
  inherited;
end;

procedure TfrmEventoAssistidoINSS.LimpaCampos;
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

  dtRequerimento.Text := '';          // edilaine - SOL 253577-18129 / PPM 1303078
  
  edTempoServTotal.Text := '';
  edTempoServMes.Text   := '';
  edTempoServDia.Text   := '';
  edSitFuncNova.Text    := '';
  edSitPlanoNova.Text   := '';
  edSitPartNova.Text    := '';
  dtRequerimento.Text   := '';  
  chkSitEspecial.Checked    := False;
  bbtnProcurar.SetFocus;
  ConsPart1.Enabled := false;
  bbtnOpcoes.enabled := false;    
end;

procedure TfrmEventoAssistidoINSS.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Otacilio Aquino SOL 160863 Kintana 1381911
  if uBeneficio.bGravaEvento then
  begin
     MsgDlg('Evento em aberto confirme "OK" ou "Cancelar".', 'Evento', mtInformation, [mbok], 0);
     Abort;
  end;
  
  inherited;
  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.RollBack;
end;

procedure TfrmEventoAssistidoINSS.bbtnOpcoesClick(Sender: TObject);
var bPodeAlterarOpcoes, bOpcoesExistem : boolean;
    cAuxSeparador : char;
begin
  //Otacilio Aquino SOL 160863 Kintana 1381911
  if uBeneficio.bGravaEvento then
  begin
     MsgDlg('Evento em aberto confirme "OK" ou "Cancelar" para fazer nova procura.', 'Evento', mtInformation, [mbok], 0);
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

procedure TfrmEventoAssistidoINSS.bbtnSairClick(Sender: TObject);
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

      if sNumerosProcessos <> '' then           // edilaine - SOL 271251 / PPM 1355374 - inicio
      begin
        dtmBasedados.dbBaseDados.StartTransaction;
        //Otacilio Aquino SOL 160863 Kintana 1381911 ** Fim **

        if not DesfazRequerimentos(qryAux, sNumerosProcessos)then
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
      end;  // edilaine - SOL 271251 / PPM 1355374 - fim
    end
    else
      Abort;
  end;

  inherited;
end;

procedure TfrmEventoAssistidoINSS.edMatriculaExit(Sender: TObject);
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
        ' ELEGPATRO.TEMPOSERVANTREAL AS C27, ELEGPATRO.TEMPOSERVANTERIOR AS C28,'+
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
        '       ( PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA ) AND '+
        '       ( PARTPREVPLAN.FLGDESATIVADO = 0 ) ';
     qryAux.Open;
     if qryAux.EOF Then
     Begin
        MsgDlg('Matrícula não encontrada','Informação',mtInformation,[mbOk,mbHelp],0);
        LimpaCampos;
        TiraSql(qryAux);
      //  EdMatricula.SetFocus;
        bbtnConfirmar.Enabled := False;
        bbtnCancelar.Enabled  := False;
        exit;
     end;
     SetarVariaveis;
     SetarMatricula;
  end;
end;

procedure TfrmEventoAssistidoINSS.SetarMatricula;
begin

   pnlInformacao.Enabled := True;
   pnlBotao.Enabled      := True;

   bbtnConfirmar.Enabled := True;
   bbtnCancelar.Enabled  := True;

   ConsPart1.sIdPessoa    := sidpessoa;
   ConsPart1.sIdTitular   := sIdPessoa;   
   ConsPart1.sSeqProposta := sseqproposta;
   ConsPart1.sIdPlanoprev := sidplanoprev;
   ConsPart1.DataBaseName := 'BaseDados';
   ConsPart1.sIdPessjur := sidpessjur;
   ConsPart1.Enabled := true;
   bbtnOpcoes.enabled := true;

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

           bbtnConfirmar.Enabled  := False;
           bbtnCancelar.Enabled   := False;
           exit;
        end;
        bAltera                   := False;
        bEfetivado                := False;
       // dtEvento.Date           := date;

        dtEvento.Text             := '';
        edTempoServTotal.Text     := '';
        edTempoServMes.Text       := '';
        edTempoServDia.Text       := '';

        edSitFuncNova.Text        := edSitPatro.Text;
        edSitPlanoNova.Text       := edSitPlano.Text;
        edSitPartNova.Text        := edSitFundacao.Text;

        chkSitEspecial.Checked    := False;
        pnlBotao.Enabled          := True;
      //  dtEvento.SetFocus;
     end
     else begin
        //SIG83457 - TAES - início
        if (HelpContext = 160025) then
          begin
             EventoRegistrado;
          end
        else
        if (HelpContext = 160024) then
          begin
             EventoEfetivado;
          end
        else
        if (sEstadoEvento = 'REGISTRADO') then
          begin // Pode Alterar
            EventoRegistrado;
          end
        else
        if (sEstadoEvento = 'EFETIVADO') then
          begin // Não Pode Alterar, nem inserir outro evento
            EventoEfetivado;
          end;
        //SIG83457 - TAES - fim  
   end;
end;

procedure TfrmEventoAssistidoINSS.SetarVariaveis;
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

     sFlgSitEspecial    := qryAux.FieldByName('C31').AsString;  // FLGSITESPECIAL
     sTipoSitFuncAntes  := qryAux.FieldByName('C32').AsString; 
     edTempoServTotal.Text := InttoStr(qryAux.FieldByName('C33').AsInteger); 
     sFlgIntPartAntes   := qryAux.FieldByName('C34').AsString; 
     edTempoServMES.Text    := qryAux.FieldByName('C35').AsString;
     edTempoServDIA.Text    := qryAux.FieldByName('C36').AsString;
end;

procedure TfrmEventoAssistidoINSS.edInscNumeroExit(Sender: TObject);
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
        ' SITFUNC.TIPOSIT AS C31, ELEGPATRO.TEMPOSERVTOTAL AS C32, SITPART.FLGINTERNO AS C33,'+
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
        '       ( PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA ) AND '+
        '       ( PARTPREVPLAN.FLGDESATIVADO = 0 ) ';
     qryAux.Open;
     if qryAux.EOF Then
     Begin
        MsgDlg('Inscrição não encontrada','Informação',mtInformation,[mbOk,mbHelp],0);
        LimpaCampos;
        TiraSql(qryAux);
       // EdMatricula.SetFocus;
        bbtnConfirmar.Enabled := False;
        bbtnCancelar.Enabled  := False;
        exit;
     end;
     SetarVariaveis;

     SetarMatricula;
  end;

end;

procedure TfrmEventoAssistidoINSS.dtEventoExit(Sender: TObject);
begin
  inherited;

  If Trim(dtRequerimento.Text) = ''
   Then dtRequerimento.Date := dtEvento.Date;
end;



procedure TfrmEventoAssistidoINSS.ConsPart1Click(Sender: TObject);
begin
  //Otacilio Aquino SOL 160863 Kintana 1381911
  if uBeneficio.bGravaEvento then
  begin
     MsgDlg('Evento em aberto confirme "OK" ou "Cancelar" para fazer nova procura.', 'Evento', mtInformation, [mbok], 0);
     Abort;
  end;

  inherited;

end;

procedure TfrmEventoAssistidoINSS.MontaSelectPartBeforeOpenCds(
  var sqlText: String; strListParams: TStringList);
  var I : integer;
  var sSql1, sSql2, sSql3, sSql4, sfiltro, sordem, sparametro : string;
begin
  inherited;
  sSql1:= ' SELECT '+
          '   ELEGPATRO.MATRICULA AS C0, '+
          '   PESSOA.NOME AS C1, '+
          '   PARTPREVPLAN.INSCRICAONUMERO AS C2, '+
          '   PARTPREVPLAN.INSCRICAODATA AS C3, '+
          '   PLANPREV.NOME AS C4, '+
          '   PATRO.NOME AS C5, '+
          '   ELEGPATRO.IDPESSOA AS C6, '+
          '   ELEGPATRO.IDPESSJUR AS C7, '+
          '   PLANPREV.IDPLANOPREV AS C8, '+
          '   PESSOA.NOME AS C9, '+
          '   ELEGPATRO.MATRICULA AS C10, '+
          '  PATRO.NOME AS PATRO, '+
          '  PLANPREV.NOME AS PLANO, '+
          '  SITFUNC.DESCRICAO AS C13, '+
          '  SITPART.DESCRICAO AS C14, '+
          '  SITPLANOPREV.DESCRICAO AS C15, '+
          '  PESSOA.NUMDOCUMENTO AS C16, '+
          '  PESSOAFISICA.DATANASC AS C17, '+
          '  PARTPREVPLAN.INSCRICAONUMERO AS C18, '+
          '   PARTPREVPLAN.INSCRICAODATA AS C19, '+
          '   PARTPREVPLAN.VALORCALCINSS AS C20, '+
          '   SITFUNC.IDSITFUNC AS C21, '+
          '   SITPART.IDSITPART AS C22, '+
          '   SITPLANOPREV.IDSITPLANOPREV AS C23, '+
          '   PARTPREVPLAN.DATAINICIOASSIST AS C24, '+
          '   PARTPREVPLAN.SEQPROPOSTA AS C25, '+
          '   PARTPREVPLAN.FLGSALVIRTBENEF AS C26, '+
          '   ELEGPATRO.TEMPOSERVANTREAL AS C27, '+
          '   ELEGPATRO.TEMPOSERVANTERIOR AS C28, '+
          '   ELEGPATRO.DATADEMISSAO AS C29, '+
          '   PARTPREVPLAN.FLGFITESPECIAL AS C30, '+
          '   SITFUNC.TIPOSIT AS C31, '+
          '   ELEGPATRO.TEMPOSERVTOTAL AS C32, '+
          '   SITPART.FLGINTERNO AS C33, '+
          '   ELEGPATRO.TEMPOSERVTOTMES AS C34, '+
          '   ELEGPATRO.TEMPOSERVTOTDIA AS C35 ';
  sSql2 :=' FROM '+
          '   PESSOA, '+
          '   ELEGPATRO, '+
          '   PARTPREVPLAN, '+
          '   PESSOA PATRO, '+
          '   PLANPREV, '+
          '   SITFUNC, '+
          '   SITPART, '+
          '   SITPLANOPREV, '+
          '   PESSOAFISICA, '+
          '   (SELECT PP.IDPESSOA, '+
          '       CASE '+
          '         WHEN PP.IDSITPLANOPREV IN (25,26,27,28,29) THEN '+
          '           PP.IDPLANOPREV '+
          '         ELSE '+
          '           NVL((SELECT bf.idplanoprev '+
          '                FROM BENEFBFCIARIO BF '+
          '                WHERE PP.IDPESSOA = BF.IDTITULAR '+
          '                  AND BF.IDTPPAGTOBENEFIC = 1 '+
          '                  AND BF.FONTEPAGADORA = 1 '+
          '                  AND BF.IDSITBENEFICIO = 1 '+
          '                  AND ROWNUM = 1 '+
          '                  AND (BF.IDPLANPREVCONTAB = 28 '+
          '                       OR (BF.IDPLANPREVCONTAB <> 28 '+
          '                           AND NOT EXISTS (SELECT 1 '+
          '                                           FROM BENEFBFCIARIO BF1 '+
          '                                           WHERE BF1.IDTPPAGTOBENEFIC = 1 '+
          '                                             AND BF1.FONTEPAGADORA = 1 '+
          '                                             AND BF1.IDPLANPREVCONTAB = 28 '+
          '                                             AND BF1.IDSITBENEFICIO = 1 '+
          '                                             AND BF1.IDTITULAR = BF.IDTITULAR '+
          '                                             AND BF1.IDPESSOA = BF.IDPESSOA)))),PP.IDPLANOPREV) '+
          '       END IDPLANOPREV, ';

  sSql3 :='       CASE '+
          '         WHEN PP.IDSITPLANOPREV IN (25,26,27,28,29) THEN '+
          '           28 '+
          '         ELSE '+
          '           NVL((SELECT bf.Idplanprevcontab '+
          '                FROM BENEFBFCIARIO BF '+
          '                WHERE PP.IDPESSOA = BF.IDTITULAR '+
          '                  AND BF.IDTPPAGTOBENEFIC = 1 '+
          '                  AND BF.FONTEPAGADORA = 1 '+
          '                  AND BF.IDSITBENEFICIO = 1 '+
          '                  AND ROWNUM = 1 '+
          '                  AND (BF.IDPLANPREVCONTAB = 28 '+
          '                       OR (BF.IDPLANPREVCONTAB <> 28 '+
          '                           AND NOT EXISTS (SELECT 1 '+
          '                                           FROM BENEFBFCIARIO BF1 '+
          '                                           WHERE BF1.IDTPPAGTOBENEFIC = 1 '+
          '                                             AND BF1.FONTEPAGADORA = 1 '+
          '                                             AND BF1.IDPLANPREVCONTAB = 28 '+
          '                                             AND BF1.IDSITBENEFICIO = 1 '+
          '                                             AND BF1.IDTITULAR = BF.IDTITULAR '+
          '                                             AND BF1.IDPESSOA = BF.IDPESSOA)))),PP.IDPLANOPREV) '+
          '       END Idplanprevcontab, '+
          '       PP.IDSITPART, '+
          '       PP.IDSITPLANOPREV, '+
          '       PP.SEQPROPOSTA, '+
          '       PP.INSCRICAONUMERO, '+
          '       PP.IDPESSJUR, '+
          '       pp.datacancelamento '+
          //Taffarel - SIG83134 - início
          //' FROM PARTPREVPLAN PP ';
          ' FROM PARTPREVPLAN PP, SITPART SP ';

  //sSql4 := ' WHERE (PP.IDSITPLANOPREV IN (25,26,27,28,29) '+
  sSql4 := ' WHERE PP.IDSITPART = SP.IDSITPART ';

  if HelpContext = 160024 then  //  idEventoGerador = 129  //SIG83420
    sSql4 := sSql4 + ' AND SP.FLGINTERNO <> ''CA'' ';       //SIG83420

  sSql4 := sSql4 +  //Taffarel - SIG83134 - fim
                    '  AND (PP.IDSITPLANOPREV IN (25,26,27,28,29) ' +
                    '       OR (PP.IDSITPLANOPREV NOT IN (25,26,27,28,29) '+
                    '          AND PP.FLGDESATIVADO = 0 '+
                    '           AND NOT EXISTS (SELECT 1 '+ // SOL 219376 KINTANA 2055349 // SOL 224532 KINTANA 2059240
                    '                           FROM PARTPREVPLAN PPP1 '+
                    '                           WHERE PPP1.IDPESSOA = PP.IDPESSOA '+
                    '                             AND PPP1.IDSITPLANOPREV IN (25,26,27,28,29)) '+ // SOL 219376 KINTANA 2055349 // SOL 224532 KINTANA 2059240
                    ' ) '+
                    '      )  ) PLA  '+
                    ' WHERE '+
                    '   ( PLA.IDPESSOA    = PESSOA.IDPESSOA ) AND '+
                    '   ( PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA ) AND '+
                    '   ( ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA ) AND '+
                    '   ( ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR ) AND '+
                    '   ( PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV ) AND '+   // SOL 263820 KINTANA 1124364
                    '   ( PLA.IDPLANOPREV = PARTPREVPLAN.IDPLANOPREV ) AND '+ // SOL 219376 KINTANA 2055349 // SOL 224532 KINTANA 2059240  // SOL 263820 KINTANA 1124364
                    '   ( PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR ) AND '+
                    '   ( ELEGPATRO.IDSITFUNC = SITFUNC.IDSITFUNC(+) ) AND '+
                    '   ( PARTPREVPLAN.IDSITPART = SITPART.IDSITPART ) AND '+
                    '   ( PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV ) AND '+
                    '   ( PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA ) AND '+
                    '   ( PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = 1) ) '; //SOL 263820 KINTANA 1124364
                    //'   ( PARTPREVPLAN.FLGDESATIVADO = 0 )     '; // SOL 219376 KINTANA 2055349 // SOL 224532 KINTANA 2059240  // SOL 263820 KINTANA 1124364
                    //'   ( PARTPREVPLAN.IDSITPLANOPREV IN (25, 26, 27, 28, 29) OR  '+
                    //'         (PARTPREVPLAN.IDSITPLANOPREV NOT IN (25, 26, 27, 28, 29) AND '+
                    //'          PARTPREVPLAN.FLGDESATIVADO = 0))  '; // SOL 219376 KINTANA 2055349 // SOL 224532 KINTANA 2059240

  for I := 0 to strListParams.Count -1 do
  begin
       if pos('1001',sqlText) > 0 then
       begin
           sparametro := copy(sqlText, (pos('1001',sqlText)+6), (length(sqlText) -1));
           sparametro := StringReplace(sparametro, '#$D#$A#', '', []);
       end;
  end;

  sqlText:= sSql1 + sSql2 +  sSql3 + sSql4 + sparametro;


end;
//Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
procedure TfrmEventoAssistidoINSS.ConcederOK(cTipoBenef : Char);
var
  sNumerosProcessos : string;
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
     {if sFlgInterno = 'AI' then
        cTipoBenef := 'P'
     else
        cTipoBenef := 'B';   }

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


                 TB97oKCancelar.Enabled := true;
                 bbtnConfirmar.Enabled  := true;
                 bbtnCancelar.Enabled   := false;
                 if (uBeneficio.bGravaEvento)then begin
                    uBeneficio.bGravaEvento := false;
                    bbtnConfirmarClick(self);
                 end;
            end;

          'B' : // Concessao de Beneficio para BENEFICIARIO
            begin
               qryCO.SQL.Clear;
              qryCO.SQL.Add(' SELECT P.NUMEROPROCESSO FROM PROCESSOBENEF P, BENEFBFCIARIO B '+
                    ' WHERE P.IDEVENTOGERADOR = '+sIdEventoGerador+
                    ' AND   P.IDSITPROCESSO   IN (1,4) '+
                    ' AND   P.DTEVENTO = TO_DATE('''+dtEvento.Text+''',''DD/MM/YYYY'') '+
                    ' AND   B.NUMEROPROCESSO = P.NUMEROPROCESSO '+
                    ' AND   B.IDTITULAR = '+sIdPessoa+
                    ' AND   B.IDPLANOORIGEM = '+sIdPlanoPrev+
                    ' AND   B.IDPESSJUR  = '+sIdPessJur+
                    ' AND   B.IDTITULAR <> B.IDPESSOA ');
              qryCO.Open;

              sNumerosProcessos:= qryCO.FieldByName('NUMEROPROCESSO').AsString;

              qryCO.SQL.Clear;
              qryCO.SQL.Text := sSQLCOMort;
              qryCO.Close;
              qryCO.ParamByName('NUMEROPROCESSO').AsString := sNumerosProcessos;
              qryCO.Open;



               AbreRequerBfciario( 'CO',qryCO.FieldByName('IDTITULAR').AsString, qryCO.FieldByName('IDPESSJUR').AsString,
                   qryCO.FieldByName('IDPLANOPREV').AsString, qryCO.FieldByName('SEQPROPOSTA').AsString,
                   qryCO.FieldByName('DTEVENTO').AsString, '-1','',sNumerosProcessos,
                   '','','','','','','','', iIdCalculo, True,sNumerosProcessos,qryCO.FieldByName('MATRICULA').AsString,true);

                 TB97oKCancelar.Enabled := true;
                 bbtnConfirmar.Enabled  := true;
                 bbtnCancelar.Enabled   := false;

                 if (uBeneficio.bGravaEvento)then begin
                     uBeneficio.bGravaEvento := false;
                     //bbtnConfirmarClick(self);
                 end;
            end;


      end;
  end;
end;

procedure TfrmEventoAssistidoINSS.CriaDataModule;
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
//Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393


procedure TfrmEventoAssistidoINSS.AtualizaTempoContribuicaoBenefBfCiario;
var btransacao : Boolean;
begin
  // Felipe Azevedo dos Santos - SOL 249379/18179 PPM 1410733 - início
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add('SELECT TEMPOSERVTOTAL, TEMPOSERVTOTDIA, TEMPOSERVTOTMES ' +
                 '  FROM ELEGPATRO ' +
                 ' WHERE IDPESSOA = ' + sIdPessoa + ' AND ' +
                 '       IDPESSJUR = ' + sIdPessJur);
  qryAux.Open;

  qryGrava.Close;
  qryGrava.SQL.Clear;
  qryGrava.SQL.Add(' UPDATE BENEFBFCIARIO SET TEMPOSERVICOANOS = ' + OraNumero(qryAux.FieldByName('TEMPOSERVTOTAL').AsString)+', '+
                   '                          TEMPOSERVICOMES = ' + OraNumero(qryAux.FieldByName('TEMPOSERVTOTMES').AsString)+', '+
                   '                          TEMPOSERVICODIAS = ' +  OraNumero(qryAux.FieldByName('TEMPOSERVTOTDIA').AsString) +
                   '  WHERE IDTITULAR = ' + sIdPessoa + ' AND ' +
                   '        IDPESSJUR = ' + sIdPessJur + 'AND ' +
                   '        IDSITBENEFICIO = 4 AND ' +
                   '        FONTEPAGADORA = 2 AND ' +
                   '        IDPESSOA IN (' + uBeneficio.sIdPessoas + ') AND ' +
                   '        IDBENEFICIO IN (' + uBeneficio.sIdBeneficios + ')');

  try
    // Andre Imakawa - SIG 23382 - Inicio
    if not dtmBaseDados.dbBaseDados.InTransaction then
    begin
      btransacao := False;
      dtmBaseDados.dbBaseDados.StartTransaction;
    end
    else
      btransacao := True;
    // Andre Imakawa - SIG 23382 - Fim

    qryGrava.ExecSQL;
  except
    on E: EDBEngineError do
    begin
      MostrarErro(E);
      // Andre Imakawa - SIG 23382 - Inicio
      if dtmBaseDados.dbBaseDados.InTransaction then
        dtmBasedados.dbBaseDados.rollback;
      // Andre Imakawa - SIG 23382 - Fim
      Exit;
    end;
  end;

  // Andre Imakawa - SIG 23382 - Inicio
  if dtmBaseDados.dbBaseDados.InTransaction then
     dtmBasedados.dbBaseDados.commit;

  if btransacao then
    if not dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;
  // Andre Imakawa - SIG 23382 - Fim
  
  uBeneficio.sIdBeneficios := '';
  uBeneficio.sIdPessoas := '';
   // Felipe Azevedo dos Santos - SOL 249379/18179 PPM 1410733 - fim
end;

//SIG83457 - TAES - início
procedure TfrmEventoAssistidoINSS.EventoRegistrado;
begin
     MsgDlg('Esse Evento já foi registrado.','Informação',mtInformation,[mbOk,mbHelp],0);
     TiraSql(qryAux);

     //William Moreira da Silva - SIG 22462
     //bAltera := True;
     bAltera := FALSE;
     //William Moreira da Silva - SIG 22462

     bEfetivado := False;

     if Trim(sFlgSitEspecial) = '1'
     then chkSitEspecial.Checked    := True
     else chkSitEspecial.Checked    := False;

     bbtnConfirmar.Enabled := True;
     bbtnCancelar.Enabled  := True;
     pnlBotao.Enabled      := True;
     //William Moreira da Silva - SIG 22462
     pnlInformacao.enabled := true;
     //pnlInformacao.enabled := false;             // edilaine - SOL 253577-18129 / PPM 1303078
     //  dtEvento.SetFocus;
     //William Moreira da Silva - SIG 22462

     //William Moreira da Silva - SIG 22462
     dtEvento.Date             := StrToDate(qryEvento.FieldByName('DataEvento').AsString);
     edSitFuncNova.Text        := edSitPatro.Text;
     edSitPlanoNova.Text       := edSitPlano.Text;
     edSitPartNova.Text        := edSitFundacao.Text;
     dtRequerimento.Text       := qryEvento.FieldByName('DATAREQUERIMENTO').AsString;
     //William Moreira da Silva - SIG 22462
end;
//SIG83457 - TAES - fim

//SIG83457 - TAES - início
procedure TfrmEventoAssistidoINSS.EventoEfetivado;
begin
//Marcos Merola Sol 157501 01/11/2011 Inicio...../ Alterado Douglas.Siqueira 29022012

   IDPESSOA:='';
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT IDPESSOA ' +
           ' FROM DEPENTIT ' +
           ' WHERE matricula ='+#39+edMatricula.Text+#39);

    try
       qryAux.Open;
     except
       on E: EDBEngineError do
          begin
          MostrarErro(E);
          Exit;
         end;
     end;

    if not qryAux.IsEmpty then    /// se não achar eu pego idtitular.
      begin
      IDPESSOA:=qryAux.fieldbyname('IDPESSOA').text;
      end
    else
      IDPESSOA:=sIdPessoa;//sIdPessoa = IDTITULAR

   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.Add(' SELECT BF.IDTITULAR ' +
           ' FROM BENEFBFCIARIO BF ' +
           ' WHERE BF.IDTITULAR ='+sIdPessoa +/// idtitular
           ' AND BF.IDPESSOA ='+IDPESSOA +
           ' AND BF.IDSITBENEFICIO <> 3' +
           ' AND BF.IDTPPAGTOBENEFIC = 1' +
           ' AND BF.FONTEPAGADORA = 2');

   try
     qryAux.Open;
   except
     on E: EDBEngineError do
        begin
        MostrarErro(E);
        Exit;
       end;
   end;

   if not qryAux.IsEmpty then
      begin

      // Comentado por TADEU PASSOS, SOL 181948, KTN 1724239
      {MsgDlg('A Situação do Benefício não se Encontra Encerrada.','Erro',mtError,[mbOk,mbHelp],0);
      TiraSql(qryAux);

      TiraSql(qryAux);
      bAltera := True;
      bEfetivado := True;

      if Trim(sFlgSitEspecial) = '1' then
         chkSitEspecial.Checked    := True
      else chkSitEspecial.Checked    := False;
      pnlInformacao.Enabled := False;
      pnlBotao.Enabled      := True;

      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled  := False;
      bbtnRequerBeneficio.Enabled := True;
      sGera:='';}
      // Comentado por TADEU PASSOS, SOL 181948, KTN 1724239

      end
   else
     if MsgDlg('Esse Evento já foi efetivado. Não pode ser alterado.'+#13+#10+ 'Deseja Gerar um Novo Evento ?','Informação',mtConfirmation,[mbYes,mbNo],0) = mryes then
        begin
        edSitFuncNova.Text        := edSitPatro.Text;
        edSitPlanoNova.Text       := edSitPlano.Text;
        edSitPartNova.Text        := edSitFundacao.Text;
        dtEvento.Clear;
        dtRequerimento.Clear;
        edTempoServTotal.Clear;
        edTempoServMes.Clear;
        edTempoServDia.Clear;
        chkSitEspecial.Checked:=False;
        sGera  := 'S';

        //William Moreira da Silva - SIG 22462
        bAltera := false;
        //William Moreira da Silva - SIG 22462

        //comentado - William Santana - SOL 271138 PPM 1353841
        // pnlInformacao.enabled := false;   // edilaine - SOL 253577-18129 / PPM 1303078

        end
      else
      begin
        sGera:='';

        TiraSql(qryAux);
        bAltera := True;
        bEfetivado := True;

        if Trim(sFlgSitEspecial) = '1'
         then chkSitEspecial.Checked    := True
        else chkSitEspecial.Checked    := False;
        pnlInformacao.Enabled := False;
        pnlBotao.Enabled      := True;

        bbtnConfirmar.Enabled := False;
        bbtnCancelar.Enabled  := False;
        bbtnRequerBeneficio.Enabled := True;
        //comentado - William Santana - SOL 271138 PPM 1353841
       // pnlInformacao.enabled := true;             // edilaine - SOL 253577-18129 / PPM 1303078
    end;

    if sGera <> 'S' then
    begin
        dtEvento.Date             := StrToDate(qryEvento.FieldByName('DataEvento').AsString);
        //SOL 263820 KINTANA 1124364
        //edSitPatro.Text           := qryEvento.FieldByName('NOMESITFUNCANT').AsString;
        //edSitPlano.Text           := qryEvento.FieldByName('NOMESITPLANOANT').AsString;
        //edSitFundacao.Text        := qryEvento.FieldByName('NOMESITPARTANT').AsString;

        edSitFuncNova.Text        := edSitPatro.Text;
        edSitPlanoNova.Text       := edSitPlano.Text;
        edSitPartNova.Text        := edSitFundacao.Text;
        dtRequerimento.Text       := qryEvento.FieldByName('DATAREQUERIMENTO').AsString;
        //comentado - William Santana - SOL 271138 PPM 1353841
       // pnlInformacao.enabled     := true;             // edilaine - SOL 253577-18129 / PPM 1303078


        //SOL 263820 KINTANA 1124364
       //Marcos Merola Sol 151501 01/11/2011 Fim
    end;

end;
//SIG83457 - TAES - fim

end.

