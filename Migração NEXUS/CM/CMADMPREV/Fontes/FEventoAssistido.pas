// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
{-------------------------------------------------------------------------------
SIG         : 70882
Responsável : Darivaldo Alencar
Data        : 02/08/2018
Descrição   : Removido trava de situação assistido para cancelamento de aposentadoria
-------------------------------------------------------------------------------
SIG         : 42986
Responsável : Peterson 
Data        : 04/08/2017
Descrição   : ajustes para apresentação maximizada dos paineis
-------------------------------------------------------------------------------
Alteração  : (dfm) desabilitar controles
Nº SOL.....: 253577-17374
KTN / PPM  : 848182
Data       : 18/06/2015
Responsável: Edilaine
Descrição..: Ajustes para Equacionamento do Deficit - requerimento de benefícios
-------------------------------------------------------------------------------}
//Pendência   : SOL 255459 PPM 828036
//Responsável : William Moreira da Silva
//Data        : 09/06/2015
//Descrição   : Ajuste pois o botão cancelar estava desabilitado
//--------------------------------------------------------------------------------
//Pendência   : SOL 223982 KINTANA 2057667
//Responsável : Felipe A. Santos
//Data        : 27/01/2014
//Descrição   : correção no fluxo do estado do evento.
//--------------------------------------------------------------------------------
//Pendência   : SOL 223420 KINTANA 2057020
//Responsável : Fernando Xavier
//Data        : 06/01/2014
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
//------------------------------------------------------------------------------
//Pendência   : SOL 182331 KINTANA 1710430
//Responsável : José Roberto Marque - JRM6
//Data        : 09/07/2012
//Descrição   : Implementação de trava após busca quando não possuir data de
//              demissão previamente cadastrada.
//------------------------------------------------------------------------------
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
// Autor(a)    : Augusto
// Data        : 06/03/2007
// Rotina      : MontaSelect
// Descricao   : retirado o FLGDESATIVADO
//------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------
// Rotinas     : ExecutaRegraCalculo
// Autor(a)    : Camille
// Pendência   : 17649
// Data        : 09.09.2004
// Descricao   : Acerto no calculo do salario virtual. Estava convertendo um
//               numero com casa decimal para inteiro -> erro
//------------------------------------------------------------------------------
// Rotinas     : bbtnProcurarClick, GravaEVENTOSPREV, LimpaCampos e bbtnConfirmarClick
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
// Rotina      : bbtnProcurarClick
// Autor(a)    : Gleyber
// Data        : 25/03/2004
// Pendência   : 16354
// Alteração   : Atribuindo valor à variável sIdTitular do componente ConsPart.
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 10/11/2003
// Alteração   : ExecutaRegraCalculo
// Pendência   : 15490
// Descrição   : Caso não ache o valor do salário de participação para mantido
//               executa o cálculo para ativo
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 10/10/2003
// Alteração   : bbtnConfirmarClick
// Pendência   : 14938
// Descrição   : Inclusão da rotina de impressão da carta do evento
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 28/09/2003
// Alteração   : ExecutaRegraCalculo
// Pendência   : 14930
// Descrição   : Inclusão dos campos SALPARTICIPACAO, SALMANTIDO, SALAUXDOE na
//               query da regra p/ calculo salario virtual.
//------------------------------------------------------------------------------
// Autor(a)    : Carlos Guedes
// Data        : 21.07.2003
// Alteração   : ExecutaRegraCalculo
// Pendência   : 14621 - Foi criada nova função para buscar o VALORINTEGRAL da HISTRUBSAL
//               para ser lançada na query da regra do sal. virtual.
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

unit FEventoAssistido;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc,   cmseldlg, URegra, TB97Tlbr, TREdit, UConsPart, Mask, MskEdDlg,
  IvDictio, IvMulti, IvEMulti, TEdNum, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker,
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

type
  TfrmEventoAssistido = class(TfrmOkCancelar)
    Panel2: TPanel;
    Label2: TLabel;

    lblPatro: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    edNome: TEdit;
    edPatro: TEdit;
    edMatricula: TEdit;
    edPlano: TEdit;
    Panel3: TPanel;
    bbtnProcurar: TBitBtn;
    pnlInformacao: TPanel;
    qryAux: TwwQuery;
    dtInicialAssist: TCMDateTimePicker;
    lblValores: TLabel;
    Label11: TLabel;
    pnlBotao: TPanel;
    bbtnRequerBeneficio: TBitBtn;
    MontaSelectPart: TMontaSelect;
    qrySitPart: TwwQuery;
    Label13: TLabel;
    dblkpcmbSitPart: TwwDBLookupCombo;
    Label10: TLabel;
    Label7: TLabel;
    dtFinalAssist: TCMDateTimePicker;
    qryGrava: TwwQuery;
    regCalculo: TRegra;
    Panel5: TPanel;
    Label9: TLabel;
    lblSitPatro: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    edInscNumero: TEdit;
    edSitPatro: TEdit;
    edSitPlano: TEdit;
    edSitFundacao: TEdit;
    lblSalVirtual: TLabel;
    qryRegra: TwwQuery;
    ConsPart1: TConsPart;
    bbtnOpcoes: TBitBtn;
    reSalarioAssistido: TcmMaskEditDlg;
    qrySitFunc: TwwQuery;
    lblSitNovaPatro: TLabel;
    dblkpcmbSitFunc: TwwDBLookupCombo;
    Label1: TLabel;
    dblkpcmbSitPlanoPrev: TwwDBLookupCombo;
    qrySitPlanoPrev: TwwQuery;
    qryEvento: TwwQuery;
    reSalarioPart: TcmMaskEditDlg;
    lblSalPart: TLabel;
    pnlTempoServTotal: TPanel;
    Label12: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edTempoServTotal: TEditNum;
    edTempoServMes: TEditNum;
    edTempoServDia: TEditNum;
    qryeventogerador: TwwQuery;
    dtRequerimento: TCMDateTimePicker;
    Label4: TLabel;
    btnBeneficio: TBitBtn;
    qryJudicial: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnRequerBeneficioClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure reSalarioAssistidoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnOpcoesClick(Sender: TObject);
    procedure reSalarioAssistidoBtnClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure dtInicialAssistExit(Sender: TObject);
    procedure ConsPart1Click(Sender: TObject);

    procedure ConcederOK;
    procedure CriaDataModule;
  private
    { Private declarations }
    iIdRubSalario,
    iIdEventoPrev: integer;
    bEncerrou : boolean;
    sNumerosProcessos,
    sTipoSitFuncAntes,
    sFlgIntPartAntes,
    sIdPessoa,       sIdPessJur,      sIdPlanoPrev,      sSeqProposta,
    sIdSitFunc,      sIdSitPart,      sIdSitPlanoPrev,   sTempoServAntReal,
    sFlgSitFuncImed, sFlgSitPartImed, sFlgSitPlanoImed,  sFlgEfetivado,
    sDataEfetivado,  sMsgErro,        sEstadoEvento,
    pIdSitFunc,      pIdSitPart,      pIdSitPlanoPrev,   pTipoSit   : string;

    bEfetivado,
    bAltera,
    bRequerBenef                                                    : boolean;

    rOpcao1,  rOpcao2,  rOpcao3,  rOpcao4,  rOpcao5,  rOpcao6                : real;

    bAposentaJudicial : boolean;               //Peterson Victor - SIG42986
    //qryJudicial: TwwQuery; //Peterson Victor SIG42986
    procedure ExecutaRegraCalculo;
    procedure VerificaeGravaSituacoes;
    procedure GravaEVENTOSPREV;
    procedure LimpaCampos;
    procedure VerificaEstadoEvento;
    function  ValidaDeterminacaoJudicial : boolean;         //edilaine - SIG42986

  public
    { Public declarations }
    Msg : String;
  end;

var
  frmEventoAssistido: TfrmEventoAssistido;

{Evento Temporário}

implementation

uses
  UAdmPrev, UDataBase, UMensErro, FTelaAut, DBaseDados,
  FCadContribParticipante, FMostraContribuicoes, UEventos,
  UParticipante, FCadOpcoesElegivel, FCadRequerBenefParticip,
  UBeneficio, fAguarde, uSincronismo, DAPrev, USistema,DRelatAdmPREV2;


{  UAdmPrev, UDataBase, UMensErro, FTelaAut, DBaseDados,
  FCadContribParticipante, FMostraContribuicoes, UEventos,
  FCadOpcoesElegivel, FCadRequerBenefParticip, UBeneficio,
  fAguarde, UParticipante, DAPrev, Usistema,;  }

{$R *.DFM}

procedure TfrmEventoAssistido.FormCreate(Sender: TObject);
begin
  inherited;
  qrySitFunc.Close;
  qrysitFunc.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrySitFunc.Open;

  qrySitPlanoPrev.Close;
  qrysitPlanoPrev.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrySitPlanoPrev.Open;

  qrySitPart.Close;
  qrysitPart.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrySitPart.Open;

  qryeventogerador.close;
  qryeventogerador.ParamByName('IDEVENTO').AsString := sIdEventoGerador;
  qryeventogerador.open;

  lblPatro.Caption := 'Patrocinadora';
  lblSitPatro.Caption := 'Situação na Patrocinadora';
  bEncerrou := False;

  bAposentaJudicial := false;               //Peterson Victor - SIG42986

end;

procedure TfrmEventoAssistido.FormShow(Sender: TObject);
begin
  inherited;
  //Otacilio Aquino SOL 160863 Kintana 1381911
  uBeneficio.bGravaEvento := False;

  bRequerBenef := False;

  lblSalVirtual.Visible      := False;
  lblSalPart.Visible         := False;
  reSalarioAssistido.Visible := False;
  reSalarioPart.Visible      := False;

  // Higor Nayde Ferreira SOL 211709/15287 KINTANA 2050393

  if(sIdEventoGerador = '8') and (sistema.IdModulo = 454)then  begin  //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
    pnlInformacao.Visible := false;

    //William Moreira da Silva - SOL 255459 PPM 828036
    //TB97oKCancelar.Enabled := false;
    TB97oKCancelar.Enabled := true;
    TB97oKCancelar.SetFocus;
    //William Moreira da Silva - SOL 255459 PPM 828036

    bbtnOpcoes.Visible := false;
    ConsPart1.Visible := false;
    bbtnProcurar.top := 59;
    frmEventoAssistido.Height := 287;
    pnlBotao.Visible := false;
    bbtnAjuda.visible := false;
    {MontaSelectPart.Tabelas.Add(' BENEFBFCIARIO ');
    MontaSelectPart.Tabelas.Add(' BENEFICIO ');
    MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSOA = BENEFBFCIARIO.IDPESSOA ');
    MontaSelectPart.Filtro.Add('BENEFBFCIARIO.IDBENEFICIO = BENEFICIO.IDBENEFICIO ');
    MontaSelectPart.Filtro.Add('BENEFICIO.IDEVENTOGERADOR = '+ sIdEventoGerador );}
  end else begin
    btnBeneficio.Visible := false;
  end;

  LimpaCampos();       // edilaine - SOL 253577-17374 / PPM 848182

  if (Sistema.IdModulo  = 454) then  //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
  begin
     MontaSelectPart.Tabelas.Add('EVENTOSPREV ');
     MontaSelectPart.Filtro.Add('PESSOA.IDPESSOA = EVENTOSPREV.IDPESSOA');
     MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPLANOPREV = EVENTOSPREV.IDPLANOPREV');
     MontaSelectPart.Filtro.Add('EVENTOSPREV.IDEVENTOGERADOR = '+ sIdEventoGerador );
  end;
  // Higor Nayde Ferreira SOL 211709/15287 KINTANA 2050393
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
  if not dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.StartTransaction;
end;

procedure TfrmEventoAssistido.bbtnProcurarClick(Sender: TObject);
Var
  wSai: Boolean;

begin
  //Otacilio Aquino SOL 160863 Kintana 1381911
  if uBeneficio.bGravaEvento then
  begin
     MsgDlg('Evento em aberto confirme "OK" ou "Cancelar" para fazer nova procura.', 'Evento', mtInformation, [mbok], 0);
     Abort;
  end;

  inherited;
  Msg := '';
  pnlInformacao.Enabled := True;
  pnlBotao.Enabled      := True;

  bAposentaJudicial := false;               //Peterson Victor - SIG42986

  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count <=  0) or (MontaSelectPart.ValoresChave[0] = '')
  then Exit;

  sIdPessoa          := MontaSelectPart.ValoresChave[0];
  sIdPessJur         := MontaSelectPart.ValoresChave[1];
  sIdPlanoPrev       := MontaSelectPart.ValoresChave[2];
  sIdSitFunc         := MontaSelectPart.ValoresChave[16];
  sIdSitPart         := MontaSelectPart.ValoresChave[17];
  sIdSitPlanoPrev    := MontaSelectPart.ValoresChave[18];
  sSeqProposta       := MontaSelectPart.ValoresChave[20];
  edNome.Text        := MontaSelectPart.ValoresChave[3];
  edMatricula.Text   := MontaSelectPart.ValoresChave[4];
  edPatro.Text       := MontaSelectPart.ValoresChave[5];
  edPlano.Text       := MontaSelectPart.ValoresChave[6];
  edSitPatro.Text    := MontaSelectPart.ValoresChave[7];
  edSitFundacao.Text := MontaSelectPart.ValoresChave[8];
  edSitPlano.Text    := MontaSelectPart.ValoresChave[9];
  edInscNumero.Text  := MontaSelectPart.ValoresChave[12];
  if MontaSelectPart.ValoresChave[23] <> ''
  then sTempoServAntReal := MontaSelectPart.ValoresChave[23]
  else sTempoServAntReal := MontaSelectPart.ValoresChave[24];
  sTipoSitFuncAntes := MontaSelectPart.ValoresChave[25];
  edTempoServTotal.Text  := MontaSelectPart.ValoresChave[26];
  sFlgIntPartAntes       := MontaSelectPart.ValoresChave[27];
  edTempoServMES.Text    := MontaSelectPart.ValoresChave[30];
  edTempoServDIA.Text    := MontaSelectPart.ValoresChave[31];

  // edilaine - SOL 253577-17374 / PPM 848182 - inicio
  {bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled  := True; }
  // edilaine - SOL 253577-17374 / PPM 848182 - fim

  // SOL 182331 KINTANA 1710430 - JRM6
  // Este código foi implementado neste SOL pois estava ocorrendo "Access Violation"
  // pela falta do create. apesar de não ser escopo do SOL em questão foi
  // implementado de forma a suprimir a ocorrencia de erro.
  {
  if conspart1 = Nil then
  begin
    ConsPart1 := TConsPart.Create(self);
  end;}
  // SOL 182331 KINTANA 1710430 - JRM6
  ConsPart1.sIdPessoa    := sidpessoa;
  ConsPart1.sIdTitular   := sIdPessoa;
  ConsPart1.sSeqProposta := sseqproposta;
  ConsPart1.sIdPlanoprev := sidplanoprev;
  ConsPart1.DataBaseName := 'BaseDados';
  ConsPart1.sIdPessjur := sidpessjur;
  ConsPart1.Enabled := true;
  bbtnOpcoes.enabled := true;

  // SOL 182331 KINTANA 1710430 JRM6

  bAposentaJudicial := ValidaDeterminacaoJudicial();             //Peterson Victor - SIG42986

  if Self.Caption = 'Aposentadoria por Invalidez' then
  begin
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

      if (Trim(FieldByName('DATADEMISSAO').AsString ) = '') and (not bAposentaJudicial) then    //Peterson Victor - SIG42986
      begin
        Msg := Msg + #13 + 'Participante não possui data de demissão cadastrada. ' +
                            'Para requerimento do benefício e registro do evento é necessário cadastrá-la previamente.';
      end;

      if Msg <> '' then
      begin
        wSai := True;
        MsgDlg(Msg,'Informação',mtInformation,[mbOk],0);
        bbtnSair.Click;
      end;
    end;
    if wsai then
      exit;
    Msg := '';
  End;
  // SOL 182331 KINTANA 1710430 - JRM6

  // SOL 141078 KINTANA 888253
  with qryAux do
  begin
     Close;
     SQL.Clear;
     //KINTANA 1356059 SOL 161040 Otacilio Aquino ** Inicio **
     SQL.Add(' SELECT TIPOCONTA FROM CM.CONTABANCARIA '+
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
             ' AND   (IDPESSOA        = '+sIdPessoa   +')');
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

  // Verifica se o evento já foi registrado
  VerificaEstadoEvento;

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

     //Peterson Victor - SIG42986 - inicio
     If (Trim(dtFinalAssist.Text) = '') and (not bAposentaJudicial) Then
        dtFinalAssist.Text  := FormatDateTime('dd/mm/yyyy', Date);
     //Peterson Victor - SIG42986 - fim


     if dblkpcmbSitFunc.LookupTable.RecordCount >= 1
     then dblkpcmbSitFunc.Text      := dblkpcmbSitFunc.LookupTable.fieldbyname('descricao').asString
     else dblkpcmbSitFunc.Text      := '';
     dblkpcmbSitFunc.PerformSearch;

     if dblkpcmbSitPart.LookupTable.RecordCount >= 1
     then dblkpcmbSitPart.Text      := dblkpcmbSitPart.LookupTable.fieldbyname('descricao').asString
     else dblkpcmbSitPart.Text      := '';
     dblkpcmbSitPart.PerformSearch;

     if dblkpcmbSitPlanoPrev.LookupTable.RecordCount >= 1
     then dblkpcmbSitPlanoPrev.Text := dblkpcmbSitPlanoPrev.LookupTable.fieldbyname('descricao').asString
     else dblkpcmbSitPlanoPrev.Text := '';
     dblkpcmbSitPlanoPrev.PerformSearch;

    if (not((sistema.IdModulo = 454) and (sIdEventoGerador = '8'))) then begin //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
       reSalarioAssistido.Text        := '';
       reSalarioPart.Text             := '';
       dtInicialAssist.Text           := '';
       dtFinalAssist.Text             := '';

       lblSalVirtual.Visible          := (qryeventogerador.fieldbyname('FLGGERASALVIRTUAL').AsInteger = 1);
       reSalarioAssistido.Visible     := (qryeventogerador.fieldbyname('FLGGERASALVIRTUAL').AsInteger = 1);
     end;
  end
  else begin
     bAltera := True;
      // Felipe A. Santos SOL 223982 KINTANA 2057667 - linha abaixo comentada
      // if (sistema.idmodulo <> 454) then begin //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
      if sEstadoEvento = 'REGISTRADO'
       then begin // Pode Alterar
          MsgDlg('Esse Evento já foi registrado.','Informação',mtInformation,[mbOk,mbHelp],0);
          TiraSql(qryAux);
          bEfetivado            := False;
          bbtnConfirmar.Enabled := True;
          bbtnCancelar.Enabled  := True;
          btnBeneficio.Enabled  := true;   // edilaine - SOL 253577-17374 / PPM 848182
       end
      else if sEstadoEvento = 'EFETIVADO' then begin// Não Pode Alterar
          bEfetivado := True;
         if (sistema.idmodulo <> 454) then begin // Felipe A. Santos SOL 223982 KINTANA 2057667
            if MsgDlg('Esse Evento já foi efetivado. '+#13+
                      'Deseja requerer algum benefício neste mesmo evento ?','Confirmação',mtConfirmation,[mbYes, mbNo],0) = mrNo
            then begin
               bEfetivado := True;
               TiraSql(qryAux);
               pnlInformacao.Enabled := False;
               pnlBotao.Enabled      := False;
               bbtnConfirmar.Enabled := False;
               bbtnCancelar.Enabled  := False;
               btnBeneficio.Enabled  := false;   // edilaine - SOL 253577-17374 / PPM 848182

            end
            else begin
               TiraSql(qryAux);
               bEfetivado            := False;
               bbtnConfirmar.Enabled := True;
               bbtnCancelar.Enabled  := True;
               btnBeneficio.Enabled  := true;   // edilaine - SOL 253577-17374 / PPM 848182

            end;
         end else // Felipe A. Santos SOL 223982 KINTANA 2057667 segue o fluxo de sim da mensagem acima
         begin
               TiraSql(qryAux);
               bEfetivado            := False;
               bbtnConfirmar.Enabled := True;
               bbtnCancelar.Enabled  := True;
               btnBeneficio.Enabled  := true;   // edilaine - SOL 253577-17374 / PPM 848182

         end; // Felipe A. Santos SOL 223982 KINTANA 2057667 - fim
      end;
       //end; // Felipe A. Santos SOL 223982 KINTANA 2057667
    //if(sistema.IdModulo <> 454) and (sIdEventoGerador <> '8') then

     //dtInicialAssist.Date     := StrToDate(MontaSelectPart.ValoresChave[14]);     // edilaine - SOL 253577-17374 / PPM 848182 - comentado
     dtInicialAssist.Text       := MontaSelectPart.ValoresChave[14];                // edilaine - SOL 253577-17374 / PPM 848182

     if Trim(MontaSelectPart.ValoresChave[15]) <> ''
     then dtFinalAssist.Date    := StrToDate(MontaSelectPart.ValoresChave[15]);
     edTempoServTotal.Text      := MontaSelectPart.ValoresChave[26];

     edTempoServMES.Text        := MontaSelectPart.ValoresChave[30];
     edTempoServDIA.Text        := MontaSelectPart.ValoresChave[31];

     reSalarioAssistido.Text    := MontaSelectPart.ValoresChave[21];
     if qryEvento.FieldByName('FlgInterno').AsString = 'MA'
     then reSalarioPart.Text    := MontaSelectPart.ValoresChave[29]
     else reSalarioPart.Text    := MontaSelectPart.ValoresChave[28];

     lblSalVirtual.Visible      := (qryeventogerador.fieldbyname('FLGGERASALVIRTUAL').AsInteger = 1);
     reSalarioAssistido.Visible := (qryeventogerador.fieldbyname('FLGGERASALVIRTUAL').AsInteger = 1);
     dblkpcmbSitFunc.Text       := qryEvento.FieldByName('NOMESITFUNC').AsString;
     dblkpcmbSitFunc.PerformSearch;

     dblkpcmbSitPlanoPrev.Text  := qryEvento.FieldByName('NOMESITPLANO').AsString;
     dblkpcmbSitPlanoPrev.PerformSearch;

     dblkpcmbSitPart.Text       := qryEvento.FieldByName('NOMESITPART').AsString;
     dblkpcmbSitPart.PerformSearch;

     edSitPatro.Text            := qryEvento.FieldByName('NOMESITFUNCANT').AsString;
     edSitPlano.Text            := qryEvento.FieldByName('NOMESITPLANOANT').AsString;
     edSitFundacao.Text         := qryEvento.FieldByName('NOMESITPARTANT').AsString;
     sFlgIntPartAntes           := qryEvento.FieldByName('FLGINTANT').AsString;
     dtRequerimento.Text        := qryEvento.FieldByName('DATAREQUERIMENTO').AsString;
  end;


  if (montaselectpart.retornouvalor) AND ( sEstadoEvento = 'NAO REGISTRADO') then
  begin
    if (sEstadoEvento = 'NAO REGISTRADO') then
    begin
      dblkpcmbSitFunc.text:='';
      dblkpcmbSitPlanoPrev.Text:='';
      dblkpcmbSitPart.text:='';
    end;

    // edilaine - SOL 253577-17374 / PPM 848182 - inicio
    bbtnConfirmar.Enabled := true;
    bbtnCancelar.Enabled  := true;
    btnBeneficio.Enabled  := true;
    // edilaine - SOL 253577-17374 / PPM 848182 - fim
  end;

 

end;

procedure TfrmEventoAssistido.VerificaEstadoEvento;
begin

   // Quando for um evento temporario, pode acontecer de já haver
   // um evento e o  usuário querer cadastrar outro

   with qryEvento do
   begin
      Close;
      ParamByName('FlgInterno').AsString   := sFlgInterno;
      ParamByName('IdPessJur').AsInteger   := StrToInt(sIdPessJur);
      ParamByName('IdPlanoPrev').AsInteger := StrToInt(sIdPlanoPrev);
      ParamByName('IdPessoa').AsInteger    := StrToInt(sIdPessoa);
      ParamByName('SeqProposta').AsInteger := StrToInt(sSeqProposta);
      Open;
      if (sistema.idmodulo <> 454)then begin //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
        if IsEmpty
        then sEstadoEvento := 'NAO REGISTRADO' // Pode Inserir

        else if MsgDlg('Existe um outro evento da mesma categoria em aberto. '+#13+
                       'Deseja abrir um novo evento ? ','Confirmação', mtConfirmation,[mbYes,mbNo],0) = mrYes

             then begin
                sEstadoEvento := 'NAO REGISTRADO';
             end
             else begin
                if FieldByName('FLGEFETIVADO').AsString = '0'
                then begin
                   sEstadoEvento := 'REGISTRADO'; // Pode Alterar
                   sIdEventoGerador := FieldByName('IDEVENTOGERADOR').AsString;
                end
                else sEstadoEvento := 'EFETIVADO' // Não pode Alterar
             end
      end else begin // Felipe A. Santos SOL 223982 KINTANA 2057667 - segue o fluxo de não da mensagem acima
          if not IsEmpty then begin
            //sEstadoEvento := 'NAO REGISTRADO' // Pode Inserir
            if FieldByName('FLGEFETIVADO').AsString = '0' then begin
               sEstadoEvento := 'REGISTRADO'; // Pode Alterar
               sIdEventoGerador := FieldByName('IDEVENTOGERADOR').AsString;
            end
            else sEstadoEvento := 'EFETIVADO' // Não pode Alterar
          end
          else
            sEstadoEvento := 'NAO REGISTRADO' // Pode Inserir
       end; // Felipe A. Santos SOL 223982 KINTANA 2057667 - fim
   end;
end;

procedure TfrmEventoAssistido.bbtnRequerBeneficioClick(Sender: TObject);
Var
  sTempoContribuicao : String;
begin
  inherited;
  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     bbtnProcurar.SetFocus;
     Exit;
  end;

    if (Trim(dtInicialAssist.Text) = '') and (not((sistema.IdModulo = 454) and (sIdEventoGerador = '8'))) //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
  then begin
     MsgDlg('A Data Inicial da Assistência deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
     dtInicialAssist.SetFocus;
     Exit;
  end;
  if (not((sistema.IdModulo = 454) and (sIdEventoGerador = '8'))) then //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
  begin  //Jonas Otavio - SOL 175700
         qryaux.close;
         qryaux.sql.text := 'SELECT trunc(sysdate) FROM DUAL WHERE trunc(sysdate) < to_date(''' + Trim(dtInicialAssist.Text) + ''',''dd/mm/YYYY'')' ;
         qryaux.open;
         if not qryaux.IsEmpty then
         begin
           MsgDlg('A data do evento não pode ser maior que a data atual.','Informação',mtInformation,[mbOk],0);
           dtInicialAssist.SetFocus;
           Exit;
         end;
   end;
//Jonas Otavio - SOL 175700
  if (Trim(dblkpcmbSitFunc.Text) = '') and (not((sistema.IdModulo = 454) and (sIdEventoGerador = '8'))) //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
  then begin
     MsgDlg('A Nova Situação do Participante na Patrocinadora deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbSitFunc.SetFocus;
     Exit;
  end;

  if (Trim(dblkpcmbSitPart.Text) = '')and (not((sistema.IdModulo = 454) and (sIdEventoGerador = '8'))) //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
  then begin
     MsgDlg('A Nova Situação do Participante na Fundação deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbSitPart.SetFocus;
     Exit;
  end;

  if (Trim(dblkpcmbSitPlanoPrev.Text) = '') and (not((sistema.IdModulo = 454) and (sIdEventoGerador = '8'))) then  //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
     begin
          MsgDlg('A Nova Situação do Participante no Plano deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          dblkpcmbSitPlanoPrev.SetFocus;
          Exit;
     end;

  if qrySitPart.FieldByName('FLGINTERNO').AsString <> 'AS'
  then begin
     MsgDlg('A Nova Situação do Participante na Fundação deve ser da Categoria Assistido.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbSitPart.SetFocus;
     Exit;
  end;


  if (qryeventogerador.fieldbyname('FLGGERASALVIRTUAL').AsInteger = 1) and
     (Trim(reSalarioAssistido.Text) = '')
  then begin
     MsgDlg('Salário de Assistido deve ser informado.','Informação',mtInformation,[mbOk,mbHelp],0);
     reSalarioAssistido.SetFocus;
     Exit;
  end;


  if (((Trim(edTempoServTotal.Text) = '') or (Trim(edTempoServTotal.Text) = '0')) AND
     ( sflginterno = 'IN' )) and (not((sistema.IdModulo = 454) and (sIdEventoGerador = '8'))) //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
  then begin
     if MsgDlg('O Tempo de Serviço Total não foi informado. Confirma ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
     then begin
        edTempoServTotal.SetFocus;
        Exit;
     end;
  end;

  // Verificar se o participante tem contribuicoes que ainda nao alimentaram reserva
  // e alimentá-las, em caso positivo.
  frmAguarde.Mostra('Atualizando Reserva ... ');
  if not AtualizaReservaParticipante ( qryAux, qryGrava,
                                       StrToInt(sIdPessJur),
                                       StrToInt(sIdPlanoPrev),
                                       StrToInt(sIdPessoa),
                                       StrToInt(sSeqProposta),
                                       -1, // nao passar evento gerador para mostrar no extrato o nome da contribuicao
                                       dtInicialAssist.Text,
                                       sMsgErro ) then
  begin
    frmAguarde.Apaga;
    MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
    Exit;
  end;
  frmAguarde.Apaga;
  
  if (not bRequerBenef) and (not bAltera)
  then begin
     if not ValidaBeneficioAnterior ( qryAux,
                                      StrToInt(sIdPessJur),
                                      StrToInt(sIdPlanoPrev),
                                      StrToInt(sIdPessoa),
                                      StrToInt(sSeqProposta),
                                      StrToInt(sIdEventoGerador),
                                      False,
                                      dtInicialAssist.Text,
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

  if not bEfetivado
  then VerificaeGravaSituacoes;


  If (edTempoServTotal.Text <> '0') And (edTempoServTotal.Text <> '') Then
    sTempoContribuicao := edTempoServTotal.Text+' anos ';
  If (edTempoServMes.Text <> '0')   And (edTempoServMes.Text <> '') Then
    sTempoContribuicao := sTempoContribuicao + edTempoServMes.Text+' meses ';
  If (edTempoServDia.Text <> '0')   And (edTempoServDia.Text <> '') Then
    sTempoContribuicao := sTempoContribuicao + edTempoServDia.Text+' dias ';


  if qryEvento.FieldByName('DATAEVENTO').AsString <> '' then // SOL 223420 KINTANA 2057020
     dtInicialAssist.Text := qryEvento.FieldByName('DATAEVENTO').AsString; // SOL 223420 KINTANA 2057020

  If (Sistema.IdModulo = 454)then begin //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393

  AbreRequerParticip('EV', sIdPessoa, sIdPessJur, sIdPlanoPrev,
                     sSeqProposta,dtInicialAssist.Text,'',
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
  end else begin
    AbreRequerParticip('EV', sIdPessoa, sIdPessJur, sIdPlanoPrev,
                     sSeqProposta,dtInicialAssist.Text,
                     dtFinalAssist.Text,
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
  end;



  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled  := True;
  if (sistema.IdModulo = 454) then begin //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
     ConcederOK;

  end;

end;

procedure TfrmEventoAssistido.bbtnConfirmarClick(Sender: TObject);
var
  sMesRef,
  sSalario,
  sDataInicioNovas,
  sDataFinalNovas,
  sFlgSalVirtBenef      : string;
  bPossuiSalario,
  bSuspendeContribuicao : boolean;

  sProcessosVerificar   : string;
  iNumeroProcesso       : longint;
  bRequereuSoINSS       : boolean;
begin
  inherited;
  if (Msg <> '') and (sistema.IdModulo <> 454) then //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
  begin
     MsgDlg(Msg,'Informação',mtInformation,[mbOk],0);
     exit;
  end;
  bSuspendeContribuicao := False;

  // Verificar campos obrigatorios
  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     bbtnProcurar.SetFocus;
     Exit;
  end;


  if (sistema.IdModulo <> 454)then begin //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
  if Trim(dtInicialAssist.Text) = ''
  then begin
     MsgDlg('A Data Inicial da Assistência deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
     dtInicialAssist.SetFocus;
     Exit;
  end;

       //Jonas Otavio - SOL 175700
     qryaux.close;
     qryaux.sql.text := 'SELECT trunc(sysdate) FROM DUAL WHERE trunc(sysdate) < to_date(''' + Trim(dtInicialAssist.Text) + ''',''dd/mm/YYYY'')' ;
     qryaux.open;
     if not qryaux.IsEmpty then
     begin
     MsgDlg('A data do evento não pode ser maior que a data atual.','Informação',mtInformation,[mbOk],0);
     dtInicialAssist.SetFocus;
     Exit;
     end;
//Jonas Otavio - SOL 175700

   if (qryeventogerador.fieldbyname('FLGGERASALVIRTUAL').AsInteger = 1) and
      (Trim(reSalarioAssistido.Text) = '')
   then begin
      MsgDlg('Salário de Assistido deve ser informado.','Informação',mtInformation,[mbOk,mbHelp],0);
      reSalarioAssistido.SetFocus;
      Exit;
   end;


  if Trim(dblkpcmbSitFunc.Text) = ''
  then begin
     MsgDlg('A Nova Situação do Participante na Patrocinadora deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbSitFunc.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbSitPart.Text) = ''
  then begin
     MsgDlg('A Nova Situação do Participante na Fundação deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbSitPart.SetFocus;
     Exit;
  end;

  if Trim(dblkpcmbSitPlanoPrev.Text) = ''
  then begin
     MsgDlg('A Nova Situação do Participante no Plano deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
     dblkpcmbSitPlanoPrev.SetFocus;
     Exit;
  end;

  //Darivaldo Alencar SIG70882 -Inicio
  if ((sIdEventoGerador <> '351') and (sIdEventoGerador <> '383')) then
    begin
      if qrySitPart.FieldByName('FLGINTERNO').AsString <> 'AS'
      then begin
         MsgDlg('A Nova Situação do Participante na Fundação deve ser da Categoria Assistido.','Erro',mtError,[mbOk,mbHelp],0);
         dblkpcmbSitPart.SetFocus;
         Exit;
      end;
    end;
  //Darivaldo Alencar SIG70882 -Fim

  
  If Trim(dtRequerimento.Text) = ''
   Then Begin
     MsgDlg('A data do requerimento deve ser preenchida.','Erro',mtError,[mbOk,mbHelp],0);
     dtRequerimento.SetFocus;
     Exit;
   End;
  

  // Verificar se participante possui salario de ativo no (mes do evento + 1)
  // Se sim, obrigar data final
  frmAguarde.Mostra('Verificando salário no mês do evento ...');

  if not bRequerBenef
  then begin
     sDataInicioNovas := dtInicialAssist.Text;
  end
  else begin
     sDataInicioNovas := BuscaDIB (sNumerosProcessos, qryAux);
     if Trim(sDataInicioNovas) = ''
     then sDataInicioNovas := dtInicialAssist.Text;
  end;

  sMesRef        := SAnoMesPosterior(Copy(sDataInicioNovas,7,4)+'/'+Copy(sDataInicioNovas,4,2));

  bPossuiSalario := VerificaRubricaMES( StrToInt(sIdPessJur),  StrToInt(sIdPessoa),
                                        iIdRubSalario,
                                        sMesRef,
                                        True,
                                        qryAux);
  frmAguarde.Apaga;

  if bPossuiSalario and (Trim(dtFinalAssist.Text) = '')
  then begin
     MsgDlg('O participante possui salário no mês '+sMesRef+'. A Data Final do Evento, neste caso, é obrigatória.','Erro',mtError,[mbOk,mbHelp],0);
     dtFinalAssist.SetFocus;
     Exit;
  end;

  end;


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




  // Gravar situacoes e registro do evento
  if not bEfetivado
  then VerificaeGravaSituacoes;

  GravaEVENTOSPREV;

  // Grava Salario de Assistido, Data Inicio Assist.,
  // Data Fim Assist. e FlgSalVirtBenef
  if qryeventogerador.fieldbyname('FLGGERASALVIRTUAL').AsInteger = 1 
  then sFlgSalVirtBenef := '1'
  else sFlgSalVirtBenef := '0';

  if Trim(dtFinalAssist.Text) = ''
  then sDataFinalNovas := ' NULL '
  else sDataFinalNovas := ' To_Date(''' + Trim(dtFinalAssist.Text)   + ''',''dd/MM/yyyy'')' ;

  qryAux.Close;
  qryAux.Sql.Clear;
  if (qryeventogerador.fieldbyname('FLGGERASALVIRTUAL').AsInteger = 0)
  then qryAux.Sql.Add(' UPDATE PARTPREVPLAN SET SALAUXDOENCA     = ' + OraNumero(reSalarioAssistido.Text) + ',' +
                      '                         DATAINICIOASSIST = To_Date(''' + Trim(dtInicialAssist.Text) + ''',''dd/MM/yyyy'')' + ',' +
                      '                         DATAFIMASSIST    = '+sDataFinalNovas+',' +
                      '                         FLGSALVIRTBENEF  = ' + sFlgSalVirtBenef +
                      ' WHERE IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
                      '       IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
                      '       SEQPROPOSTA = ' + sSeqProposta + ' AND ' +
                      '       IDPESSOA    = ' + sIdPessoa)
  else qryAux.Sql.Add(' UPDATE PARTPREVPLAN SET DATAINICIOASSIST = To_Date(''' + Trim(dtInicialAssist.Text) + ''',''dd/MM/yyyy'')' + ',' +
                      '                         DATAFIMASSIST    = '+sDataFinalNovas+',' +
                      '                         FLGSALVIRTBENEF  = ' + sFlgSalVirtBenef +
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
  if bRequereuSoINSS then bSuspendeContribuicao := False;
  
  // Grava o Histórico de Contribuições por Evento Gerador
  if not bAltera
  then begin
     // Só suspende as contribuições, se o evento não tiver acabado
     if (Trim(dtFinalAssist.Text) = '') or
        (Date < StrToDate(dtFinalAssist.Text))
     then  bSuspendeContribuicao := True
     else  bSuspendeContribuicao := False;

     sMesRef := Copy(dtInicialAssist.Text,7,4)+'/'+Copy(dtInicialAssist.Text,4,2);

     GravaHSTCONTEVENTOSPRFechado( IntToStr(iIdEventoPrev),
                                   sIdPlanoPrev,
                                   sIdEventoGerador, '', sIdPessoa,
                                   sIdPessJur, sSeqProposta, '','',
                                   dtInicialAssist.Text,
                                   bSuspendeContribuicao, qryAux, qryGrava,sIdPlanoPrev);

  end;


  // Suspender as atuais contribuicoes e associar as novas contribuicoes
  // A data final das contribuicoes atuais é a DIB -1, ou seja, um dia antes do inicio
  //                  do beneficio ( caso o usuario tenha requerido beneficio )
  //                  ou a data do evento ( caso o usuario nao tenha requerido beneficio )
  // A data inicio das novas contribuicoes é um dia após a data final das contribuicoes atuais

  // Só suspende as contribuições, se o evento não tiver acabado
  if bEncerrou then bSuspendeContribuicao := False; 

  if (bSuspendeContribuicao)
  then begin
      if not SuspendeContribuicoes( sIdPessJur,         sIdPlanoPrev,         sIdPessoa,
                                    sSeqProposta,       sIdEventoGerador,
                                    sDataInicioNovas, // a rotina irá subrair um dia e colocar como data final
                                    dtFinalAssist.Text,
                                    edMatricula.Text,     sIdSitPart,
                                    qryAux,             qryGrava,             sFlgInterno,
                                     sFlgIntPartAntes)
      then begin
          MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
          if dtmBaseDados.dbBaseDados.InTransaction
          then dtmBasedados.dbBaseDados.RollBack;
          LimpaCampos;
          if dtmBaseDados.dbBaseDados.InTransaction
          then dtmBaseDados.dbBaseDados.StartTransaction;
          Exit;
      end;
  end;

  // Associar e calcular novas contribuições (de assistido)
  if (not bAltera) and (not bRequereuSoINSS)
  then begin
     // Se o usuario nao requereu beneficio
     // Entao : 1. passar salario como ZERO, para nao gerar salario virtual na HISTRUBSAL,
     //         2. passar data de inicio do evento como data inicio
     // Senao : 1. passar salario de assistido colocado na tela
     //         2. passar a data de inicio do beneficio como data inicio
     if not bRequerBenef
     then sSalario := '0'
     else sSalario    := reSalarioAssistido.Text;

     if not AssociaNovasContribuicoes( sIdPessJur,         sIdPlanoPrev,        sIdPessoa,
                                       sSeqProposta,       sIdEventoGerador,    sDataInicioNovas,
                                       dtFinalAssist.Text, edMatricula.Text,    qrySitPart.FieldByName('IDSITPART').AsString,
                                       sSalario,           True,
                                       False, 
                                       False,              qryAux,              qryGrava,
                                       sFlgInterno,        iIdEventoPrev, 'DIB', 
                                       dtInicialAssist.Text) 
     then begin
        MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
        if dtmBaseDados.dbBaseDados.InTransaction
        then dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        if dtmBaseDados.dbBaseDados.InTransaction
        then dtmBaseDados.dbBaseDados.StartTransaction;
        Exit;
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
                                      True,
                                      dtInicialAssist.Text,
                                      sMsgErro,
                                      bEncerrou)

     then begin
        MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
        Exit;
     end;
  end;



  if not AssociaRubricasIndividuais(sIdPessJur,       sIdPlanoPrev,     sIdPessoa,
                                   sSeqProposta,     sIdEventoGerador, dtInicialAssist.Text ,
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

  //Otacilio Aquino SOL 160863 Kintana 1381911
  uBeneficio.bGravaEvento := False;

  MsgDlg('Evento efetuado com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);

  LimpaCampos;
  TiraSql(qryAux);
  bRequerBenef := False;

  If Not CartaEvento(sIdPessoa, sIdPessJur, sIdPlanoPrev, sIdEventoGerador, sSeqProposta)
    Then MsgDlg('Carta do evento não emitida.','Informação',mtInformation,[mbOk,mbHelp],0);

  if not dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.StartTransaction;

  if (sistema.IdModulo = 454) and (sIdEventoGerador = '8') then begin //Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
    TB97oKCancelar.enabled := false;
    bbtnConfirmar.Enabled := false;
  end;
end;


procedure TfrmEventoAssistido.VerificaeGravaSituacoes;
begin
  // Gravar tempo de servido total, independente de gravar situacoes
  // neste momento
  qryGrava.Close;
  qryGrava.Sql.Clear;
  qryGrava.Sql.Add(' UPDATE ELEGPATRO SET TEMPOSERVTOTAL   = '+ OraNumero(edTempoServTotal.Text) +', '+
                   '                      TEMPOSERVTOTMES  = '+ OraNumero(edTempoServMes.Text)   +', '+
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

  // Se o evento indicar que atualiza situacao imediatamente e a data final ainda nao acabou
  if (qryAux.FieldByName('FLGSITFUNCIMEDIA').AsString  = '1') and
     (qryAux.FieldByName('FLGSITPARTIMEDIA').AsString  = '1') and
     (qryAux.FieldByName('FLGSITPLANOIMEDI').AsString = '1')  and
     ( (Trim(dtFinalAssist.Text) = '') or ( (Trim(dtFinalAssist.Text) <> '') and (StrToDate(dtFinalAssist.Text) <= date) ) )
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

     qryGrava.Close;
     qryGrava.Sql.Clear;
     qryGrava.Sql.Add(' UPDATE ELEGPATRO SET IDSITFUNC = ''' + qrySitFunc.FieldByName('IDSITFUNC').AsString +''''+ 
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


  if qryAux.FieldByName('FLGSITPARTIMEDIA').AsString  = '1' then
     begin
          sFlgSitPartImed := '1';

         {Grava nova Situação do Participante na Fundação}
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
  else
     sFlgSitPartImed := '0';


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

procedure TfrmEventoAssistido.GravaEVENTOSPREV;
var sSalParticipacao : string;
begin
  if Trim(reSalarioPart.Text) = ''
  then sSalParticipacao := '0'
  else sSalParticipacao := OraNumero(Trim(reSalarioPart.Text));

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
                    '                         DATAEFETIVADO, FLGEFETIVADO, SALPARTICIPACAO, INSCRICAONUMERO, DATAREQUERIMENTO) ' + 
                   ' VALUES(' + IntToStr(iIdEventoPrev) + ',' + ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')' + ',' + ' To_Date(''' + Trim(dtInicialAssist.Text) + ''',''dd/MM/yyyy'')' + ',' + 
                                 sIdPessoa  + ',' + sIdPessJur + ',' + sIdPlanoPrev + ',' + sSeqProposta + ',' +
                                 sIdSitFunc + ',' + sIdSitPart + ',' + sIdSitPlanoPrev + ',' +
                                 qrySitFunc.FieldbyName('IDSITFUNC').AsString + ' ,' +
                                 qrySitPart.FieldbyName('IDSITPART').AsString + ',' +
                                 qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString + ',' +
                                 sIdEventoGerador + ',' + sFlgSitFuncImed + ',' + sFlgSitPartImed + ',' + sFlgSitPlanoImed + ',' +
                                 sDataEfetivado + ',' + sFlgEfetivado+','+sSalParticipacao+','+OraNumero(edInscNumero.Text)+ ', ' +
                                 'TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dtRequerimento.Date) + ''',''DD/MM/YYYY'') )'); 
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
     qryAux.Sql.Add(' UPDATE EVENTOSPREV SET DATAALTERADO = To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')' + ',' + 
                    '                        DATAEVENTO   = To_Date(''' + Trim(dtInicialAssist.Text) + ''',''dd/MM/yyyy'')' + ',' +
                    '                        DATAREQUERIMENTO = TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dtRequerimento.Date) + ''',''DD/MM/YYYY''), ' + 
                    '                        IDSITFUNCATUAL  = ''' + sIdSitFunc + ''',' +
                    '                        IDSITPARTATUAL  = ' + sIdSitPart + ',' +
                    '                        IDSITPLANOATUAL = ' + sIdSitPlanoPrev + ',' +
                    '                        IDSITFUNCNOVO   = ''' + qrySitFunc.FieldbyName('IDSITFUNC').AsString + ''',' +
                    '                        IDSITPARTNOVO   = ' + qrySitPart.FieldbyName('IDSITPART').AsString + ',' +
                    '                        IDSITPLANONOVO  = ' + sIdSitPlanoPrev+','+
                    '                        SALPARTICIPACAO = ' + sSalParticipacao+
                    ' WHERE SEQPROPOSTA     = ' + sSeqProposta + ' AND ' +
                    '       IDPESSJUR       = ' + sIdPessJur   + ' AND ' +
                    '       IDPLANOPREV     = ' + sIdPlanoPrev + ' AND ' +
                    '       IDPESSOA        = ' + sIdPessoa    + ' AND ' +
                    '       IDEVENTOGERADOR = ' + sIdEventoGerador + ' AND ' +
                    '       DATAVOLTA IS NULL ');
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

procedure TfrmEventoAssistido.ExecutaRegraCalculo;
var
  sSQL, sValorReserva, sMesReferencia, sSalPart, sRemTotal, sDataInscFund,
  sSalIntegral: string;
begin
  // Executa Regra de Cálculo do Salário de Auxilio Doença
  // Passa para a regra os mesmos dados da Regra de Cálculo do Beneficio

  //Calcula o valor total da soma das reservas do participante
  sValorReserva := OraNumero(CalcReservaPart(StrToInt(sIdPessJur), StrToInt(sIdPlanoPrev),
                                             StrToInt(sIdPessoa), -1, StrToInt(sSeqProposta),
                                             dtInicialAssist.Text, dtInicialAssist.Text, '','','', qryAux));

  sMesReferencia := Copy(Trim(dtInicialAssist.Text),7,4)+'/'+Copy(Trim(dtInicialAssist.Text),4,2);

  if sFlgIntPartAntes = 'MA'
  then Begin
       sSalPart := ORANUMERO(CalcRUBMANTIDO(StrToInt(sIdPessJur), StrToInt(sIdPlanoPrev),
                                            StrToInt(sIdPessoa), StrToInt(sSeqProposta),
                                            SAnoMesAnterior(sMesReferencia), qryAux));
       If StrToFloat(ClienteNumero(sSalPart)) < 0
        Then sSalPart := ORANUMERO(CalcSalPart(StrToInt(sIdPessJur), StrToInt(sIdPessoa),
                                   SAnoMesAnterior(sMesReferencia), qryAux));
  end
  else sSalPart := ORANUMERO(CalcSalPart(StrToInt(sIdPessJur), StrToInt(sIdPessoa),
                                         SAnoMesAnterior(sMesReferencia), qryAux));

  sRemTotal := ORANUMERO(CalcREMTOTAL(StrToInt(sIdPessJur), StrToInt(sIdPessoa),
                                      SAnoMesAnterior(sMesReferencia), qryAux));

  sDataInscFund := CalcDataInscFund(StrToInt(sIdPessJur), StrToInt(sIdPlanoPrev),
                                    StrToInt(sIdPessoa), StrToInt(sSeqProposta),qryAux);

  sSalIntegral := ORANUMERO(BuscaSalarioIntegral(qryAux,sMesReferencia,sFlgIntPartAntes,
                               StrToInt(sIdPessoa),StrToInt(sSeqProposta), StrToInt(sIdPessJur),
                               StrToInt(sIdPlanoPrev)));

  if Trim(sValorReserva) = '' then  sValorReserva := '0';
  if Trim(sSalPart)      = '' then  sSalPart      := '0';
  if Trim(sRemTotal)     = '' then  sRemTotal := '0';

  if Trim(sDataInscFund) = '' then  sDataInscFund := FormatDateTime('dd/mm/yyyy', Date); 

  sSQL := ' SELECT PLP.IDREGRASALAUXDOE, PP.IDPESSOA, PP.IDPESSJUR, PP.IDPLANOPREV, PP.INSCRICAODATA, ' +
          '        PP.IDSITPART, ' +''''+sDataInscFund+''' AS INSCRICAODATAFUND, PF.DATANASC, '+
          '        EL.SALTOTAL, EL.TEMPOSERVANTERIOR, '+
          '        EL.TEMPONAOCREDITADO,'+sSALPART+' AS VALORPROVENTO, '+sREMTOTAL+' AS VALORREMTOTAL, '+
          '        SF.TIPOSIT,SF.IDSITFUNC, '+sValorReserva+' AS VALORRESERVA, '+
                   sSalIntegral + ' AS VALORINTEGRAL, ' +
          '        PP.SALAUXDOENCA, PP.SALMANTIDO, PP.SALPARTICIPACAO , '+
          ''''+  Trim(dtInicialAssist.Text)+''' AS DATAREF '+
          ' FROM   ELEGPATRO EL, PARTPREVPLAN PP, PESSOAFISICA PF,  SITFUNC SF, ' +
          '        PLANPREVPATRO PLP '+
          ' WHERE  PP.IDPESSOA    = ' + sIdPessoa    + ' AND ' +
          '        PP.IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
          '        PP.IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
          '        PP.SEQPROPOSTA = ' + sSeqProposta + ' AND ' +
          '        EL.IDPESSOA    = PP.IDPESSOA      AND ' +
          '        EL.IDPESSJUR   = PP.IDPESSJUR     AND ' +
          '        PF.IDPESSOA    = EL.IDPESSOA      AND ' +
          '        EL.IDSITFUNC   = SF.IDSITFUNC(+)  AND ' +
          '        PP.IDPLANOPREV = PLP.IDPLANOPREV AND ' +
          '        PP.IDPESSJUR   = PLP.IDPESSJUR ';
  qryRegra.Close;
  qryRegra.Sql.Clear;
  qryRegra.Sql.Add(sSQL);
  try
     qryRegra.Open;
  except
     on E:EDBEngineError do
     begin
         MostrarErro(E);
         Exit;
     end;
  end;

  // Se nao tiver regra, trazer o salario de ativo atual
  if qryRegra.FieldByName('IDREGRASALAUXDOE').AsString = ''
  then begin
     reSalarioAssistido.Text := ClienteNumero(sSalPart);
     Exit;
  end;

  regCalculo.QueryIn  := qryRegra;
  regCalculo.RuleName := qryRegra.FieldByName('IDREGRASALAUXDOE').AsString;

  try
     regCalculo.Execute;
  except
     MsgDlg('Erro na Execução da Regra de Cálculo do Salário de Assistido.','Informação',mtInformation,[mbOk,mbHelp],0);
     TiraSql(qryAux);
     Exit;
  end;

  reSalarioAssistido.Text := ClienteNumero(regCalculo.Result);
end;

procedure TfrmEventoAssistido.bbtnCancelarClick(Sender: TObject);
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
  end;
  inherited;
end;

procedure TfrmEventoAssistido.LimpaCampos;
begin
  edNome.Text        := '';
  edMatricula.Text   := '';
  edPatro.Text       := '';
  edPlano.Text       := '';
  edSitPatro.Text    := '';
  edSitFundacao.Text := '';
  edSitPlano.Text    := '';
  edInscNumero.Text  := '';
  dtInicialAssist.Text := '';
  dtFinalAssist.Text   := '';
  edTempoServTotal.Text := '';
  edTempoServMES.Text    := '';
  edTempoServDIA.Text    := '';

  lblSalVirtual.Visible      := (qryeventogerador.fieldbyname('FLGGERASALVIRTUAL').AsInteger = 1);
  reSalarioAssistido.Visible := (qryeventogerador.fieldbyname('FLGGERASALVIRTUAL').AsInteger = 1);
  reSalarioAssistido.Text := '';
  reSalarioPart.Text := '';
  dblkpcmbSitFunc.Text := '';
  dblkpcmbSitPart.Text := '';
  dblkpcmbSitPlanoPrev.Text := '';
  dtRequerimento.Text    := '';  
  bbtnProcurar.SetFocus;
  ConsPart1.Enabled := false;
  bbtnOpcoes.enabled := false;

  // edilaine - SOL 253577-17374 / PPM 848182 - inicio
  bbtnConfirmar.Enabled := false;
  bbtnCancelar.Enabled  := false;
  btnBeneficio.Enabled  := false;
  // edilaine - SOL 253577-17374 / PPM 848182 - fim

end;

procedure TfrmEventoAssistido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Otacilio Aquino SOL 160863 Kintana 1381911
  if uBeneficio.bGravaEvento then
  begin
     MsgDlg('Evento em aberto confirme "OK" ou "Cancelar".', 'Evento', mtInformation, [mbok], 0);
     Abort;
  end;
  
  inherited;
  with dtmBasedados.dbBaseDados do
     if InTransaction then
        RollBack;
end;

procedure TfrmEventoAssistido.reSalarioAssistidoExit(Sender: TObject);
begin
  inherited;
  if Trim(reSalarioAssistido.Text) = ''
  then begin
     MsgDlg('Salário de Assistido deve ser informado.','Informação',mtInformation,[mbOk,mbHelp],0);
     reSalarioAssistido.setfocus;
     Exit;
  end;
end;

procedure TfrmEventoAssistido.bbtnOpcoesClick(Sender: TObject);
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

procedure TfrmEventoAssistido.reSalarioAssistidoBtnClick(Sender: TObject);
begin
  inherited;

  iIdCalculoGeral := -1;

  if Trim(dtInicialAssist.Text) <> ''
  then ExecutaRegraCalculo
  else MsgDlg('Informe a Data Inicial da Assistência .','Informação',mtInformation,[mbOk,mbHelp],0);
end;

procedure TfrmEventoAssistido.bbtnSairClick(Sender: TObject);
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
     else Abort;
  end;

  inherited;
end;

procedure TfrmEventoAssistido.dtInicialAssistExit(Sender: TObject);
begin
  inherited;

  //Peterson Victor - SIG42986 - inicio
  if (Trim(dtFinalAssist.Text) = '') and (not bAposentaJudicial) then
     dtFinalAssist.Text := dtInicialAssist.Text;
  //Peterson Victor - SIG42986 - fim


  If Trim(dtRequerimento.Text) = ''
   Then dtRequerimento.Date := dtInicialAssist.Date;
end;

procedure TfrmEventoAssistido.ConsPart1Click(Sender: TObject);
begin
  //Otacilio Aquino SOL 160863 Kintana 1381911
  if uBeneficio.bGravaEvento then
  begin
     MsgDlg('Evento em aberto confirme "OK" ou "Cancelar" para fazer nova consulta.', 'Evento', mtInformation, [mbok], 0);
     Abort;
  end;

  inherited;

end;
//Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
procedure TfrmEventoAssistido.ConcederOK;
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
                  '',sNumerosProcessos,qryCO.FieldByName('NUMEROPROCESSO').AsString,true);

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
//Higor Nayde Ferreira  SOL 211709/15287 KINTANA 2050393
procedure TfrmEventoAssistido.CriaDataModule;
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

//Peterson Victor - SIG42986 - inicio

function TfrmEventoAssistido.ValidaDeterminacaoJudicial: boolean;
begin

  {para Aposentadoria por Tempo de Contribuição (evento = 2), TC Especial (evento = 11) e
   TC Adcional (evento = 364) quando o participante possuir o parâmetro
   135 - Concessão por decisão judicial, a elegibilidade nao verifica "data de demissão" }

  if (Sistema.IdModulo = 452) and
     ((sIdEventoGerador = '8') or (sIdEventoGerador = '370') or (sIdEventoGerador = '366')) then
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
//Peterson Victor - SIG42986 - fim



end.
