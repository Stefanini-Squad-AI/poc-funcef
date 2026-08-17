unit FEventoMorte;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Rotina...........: bbtnProcurarClick
//Nº SIG:..........: 86058
//Data da Alteração: 13/05/2019
//Responsável......: Edilaine
//Descrição........: Crítica ao registrar evento de Resgate complementar para Beneficiário Designado
//------------------------------------------------------------------------------
//Pendência   : SOL 267841 PPM 1250374
//Responsável : Peterson Victor
//Data        : 07/03/2016
//Descrição   : Seguir regras da especificação, incluido na uses FInscricaoNovoPlano
//------------------------------------------------------------------------------
//Pendência   : SOL 260838 KINTANA 1060022
//Responsável : Fernando Xavier
//Data        : 09/09/2015
//Descrição   : Ao registrar evento o sistema altera data de morte indevidamente.
//------------------------------------------------------------------------------
//Pendência   : SOL 229783/16102 PPM 391537
//Responsável : Felipe A. Santos
//Data        : 28/05/2013
//Descrição   : envio da demanda abaixo 177151/9541 para produção.
//--------------------------------------------------------------------------------
//Pendência   : SOL 177151/9541 KTN 1665621
//Responsável : André Felipe
//Data        : 09/08/2013
//Descrição   : Permitir o cadastro deste evento e do seu Resgate mesmo que o 
//				participante já tenha evento da categoria de falecimento 
//				cadastrado e/ou esteja cancelado na fundação.
//Observação  : Tadeu Passos, apenas subiu a demanada.
//--------------------------------------------------------------------------------
//Pendência   : SOL 175700 KINTANA 1685331
//Responsável : Jonas Otavio
//Data        : 21/08/2012
//Descrição   : Implementação da limitação do campo "Data do Evento", na funcionalidade
//eventos seja limitada sempre até a data atual.
//--------------------------------------------------------------------------------
//Pendência   : SOL 172398 Kintana 1553776
//Responsável : Monica da Silva Gonzaga
//Data        : 27/01/2012
//Descrição   : Implementar a query feita para verificação das dívidas de empréstimos no sol 164235.
//--------------------------------------------------------------------------------
//Responsável : Vinicius Ferreira
//Pendência   : SOL 164235 Kintana 1409163
//Data        : 27/12/2011
//Descrição   : Implementar trava para impedir a concessão de portabilidade ou resgate
//--------------------------------------------------------------------------------
//Pendência   : SOL 160863 KINTANA 1381911
//Responsável : OTACILIO AQUINO
//Data        : 18/11/2011
//Descrição   : Gravar o Evento antes de fazer uma nova pesquisa.
//--------------------------------------------------------------------------------
//Responsável : Otacilio Aquino
//Pendência   : SOL 161040 Kintana 1356059
//Descrição   : Implementação de trava no requerimento quando não tiver conta
//              salario cadastrada.
//------------------------------------------------------------------------------
//Responsável : Renato Visoni
//Pendência   : SOL 155258 Kintana 1200878
//Descrição   : Ajuste na trava implementada no SOL 141078 referente a participantes
//              isentos de IRRF no evento de Falecimento.
//--------------------------------------------------------------------------------
//Responsável : Renato Visoni
//Pendência   : SOL 155058 Kintana 1197225
//Descrição   : Ao clicar no botão OK o sistema não estava fazendo nada.
//--------------------------------------------------------------------------------
//Responsável : Fernando Xavier
//Pendência   : SOL 141078 Kintana 888253
//Descrição   : Implementação de TRava no requerimento
//--------------------------------------------------------------------------------
// Autor(a)    : Ádler Teodoro de Souza
// Data        : 13/08/2009
// SOL         : 122922
// Kintana     : 609589
// Descricao   : Alteração na função ValidaBeneficioAnterior para aceitar o UPDATE
//               pela data de Encerramento(fReabNovaData) e não data do evento.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 07/05/2007
// Pendência   : 19061
// Rotina      : bbtnRequerBeneficioClick
// Descricao   : Incluir paramento para função AbreRequerBfciario retornar o IDCALCULO e
//               depois atualizar a tabela de eventos.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 08/01/2007
// Pendência   : 24043
// Rotina      : MontaSelect
// Descricao   : retirado o FLGDESATIVADO
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 24/10/2006
// Pendência   : 23246
// Rotina      : bbtnRequerParticipClick
// Descricao   : Inclusão de parâmetro default na chamada para abrir requerimento.
//------------------------------------------------------------------------------
// Autor(a)    : Paulo Ramos
// Data        : 28/09/2006
// Pendência   : 23419
// Rotina      : bbtnRequerParticipClick
// Descricao   : Passar a DataRequerimento nula para a rotina AbreRequerParticip.
//------------------------------------------------------------------------------
//  Autor      : Claudio Faria
//  Rotina     : Variados
//  Data       : 21/09/2006
//  Pendencia  : 23370
//  Descrição  : Incluir o metodo "performSearch" em todas as TwwDBLookupCombo que tem atribuição a uma query
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Augusto
// Data        : 04/01/2006
// Pendência   : 21190
// Alteração   : Cancelar processo caso não tenha encerrado o beneficio
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Augusto
// Data        : 25/10/2004
// Pendência   : 17906
// Alteração   : Alterar a posição da rotina ValidabeneficioAnterior para encerrar
//               o beneficio depois de se fazer o backup das contribuições desassociadas
//               e antes de suspende-las encerrar o beneficio.
//------------------------------------------------------------------------------
// Rotina      : bbtnRequerBeneficioClick
// Autor(a)    : Camille
// Pendência   : -----
// Data        : 10.08.2004
// Descricao   : Incluir na verificacao de beneficiarios cadastrados o teste
//               da data de cancelamento
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
// Data        : 10/10/2003
// Alteração   : bbtnConfirmarClick
// Pendência   : 14938
// Descrição   : Inclusão da rotina de impressão da carta do evento
//------------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 21.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Gleyber
// Data        : 28/03/2003
// Alteração   : Permitir conceder benefício para o próprio participante.
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Camille
// Data        : 06.02.2003
// Alteração   : Deixar o tempo de servico informado preenchido com o que estiver
//               na tabela elegpatro
//------------------------------------------------------------------------------
// Rotina      : Pesquisa de Participante
// Autor(a)    : Augusto
// Data        : 26/11/2002
// Alteração   : Caso o evento já tenha sido registrado, mostra as situações do evento
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 13/11/2002
// Alteração   : inclusão dos campos VALORBASE4 , VALORBASE5 , VALORBASE6
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 13/11/2002
// Alteração   : inclusão dos campos VALORBASE4 , VALORBASE5 , VALORBASE6
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Gleyber
// Data        : 04/11/2002
// Alteração   : Alteração para verificar se já encerrou todos benefícios
// -----------------------------------------------------------------------------
// Rotina      : bbtnProcurarClick
// Autor(a)    : Leo
// Data        : 27.09.2002
// Alteração   : "Locate" nas queries de situação, caso contrário as situações são
//               gravadas pela primeira ocorrência
// -----------------------------------------------------------------------------
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc,  cmseldlg, URegra, TB97Tlbr, UConsPart, IvDictio, IvMulti,
  IvEMulti, TEdNum, wwdbdatetimepicker, CMDateTimePicker, wwdblook;

type
  TfrmEventoMorte = class(TfrmOkCancelar)
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
    qrySitFunc: TwwQuery;
    qrySitPlanoPrev: TwwQuery;
    pnlInformacao: TPanel;
    lblSitNovaPatro: TLabel;
    dblkpcmbSitFunc: TwwDBLookupCombo;
    Label7: TLabel;
    dblkpcmbSitPlanoPrev: TwwDBLookupCombo;
    qryAux: TwwQuery;
    Label10: TLabel;
    dtEvento: TCMDateTimePicker;
    lblValores: TLabel;
    Label11: TLabel;
    pnlBotao: TPanel;
    bbtnRequerBeneficio: TBitBtn;
    qryBfCiarioTitPlan: TwwQuery;
    MontaSelectPart: TMontaSelect;
    qryGrava: TwwQuery;
    regCalculo: TRegra;
    Panel5: TPanel;
    Label1: TLabel;
    lblSitPatro: TLabel;
    Label6: TLabel;
    Label12: TLabel;
    edInscNumero: TEdit;
    edSitPatro: TEdit;
    edSitPlano: TEdit;
    edSitFundacao: TEdit;
    ConsPart1: TConsPart;
    bbtnOpcoes: TBitBtn;
    Label4: TLabel;
    dblkpcmbSitPart: TwwDBLookupCombo;
    qrySitPart: TwwQuery;
    qryEvento: TwwQuery;
    pnlTempoServTotal: TPanel;
    Label5: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edTempoServTotal: TEditNum;
    edTempoServMes: TEditNum;
    edTempoServDia: TEditNum;
    dsBfciarioTitPlan: TwwDataSource;
    bbtnRequerParticip: TBitBtn;
    QryPlanoPrev: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnRequerBeneficioClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnOpcoesClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure bbtnRequerParticipClick(Sender: TObject);
    procedure ConsPart1Click(Sender: TObject);
  private
    { Private declarations }
    bEncerrou : boolean; 
    iIdEventoPrev: integer;
    iIdCalculo : Integer;

    sNumerosProcessos,       sIdPessoa,          sIdPessJur,
    sIdPlanoPrev,            sSeqProposta,       sFlgIntPartAntes,
    sIdSitFunc,              sIdSitPart,         sIdSitPlanoPrev,
    sTempoServAntReal,       sFlgSitFuncImed,    sFlgSitPartImed,
    sFlgSitPlanoImed,        sFlgEfetivado,      sDataEfetivado,
    sEstadoEvento,           pIdSitFunc,         pIdSitPart,
    pIdSitPlanoPrev,         pTipoSit                              : string;
    bEfetivado,              bAltera,            bRequerBenef      : boolean;
    rOpcao1,                 rOpcao2,            rOpcao3 ,
    rOpcao4,                 rOpcao5,            rOpcao6            : real;

    procedure LimpaCampos;
    procedure VerificaeGravaSituacoes;
    procedure GravaEVENTOSPREV;
    procedure VerificaEstadoEvento;
  public
    { Public declarations }
    Msg : String;
  end;

var
  frmEventoMorte: TfrmEventoMorte;

{Evento Definitivo}

implementation

uses
  UAdmPrev, UDataBase, UMensErro, FTelaAut, DBaseDados,
  FMostraContribuicoes, UEventos, UModulo,
  FCadOpcoesElegivel, FCadRequerBenefParticip, FCadRequerBenefBfciario,
  UBeneficio, fAguarde, UParticipante, DAPrev, Usistema, DDividaEP, UIntegraEP, dEmptmo, FInscricaoNovoPlano;

{$R *.DFM}

procedure TfrmEventoMorte.FormCreate(Sender: TObject);
begin
  inherited;
  lblPatro.Caption := 'Patrocinadora';
  lblSitPatro.Caption := 'Situação na Patrocinadora';
  lblSitNovaPatro.Caption := 'Nova Situação na Patrocinadora';
  bEncerrou := False; 
end;

procedure TfrmEventoMorte.FormShow(Sender: TObject);
begin
  inherited;
  InicializaEP; //Vinicius Ferreira SOL 164235 Kintana 1409163

  //Otacilio Aquino SOL 160863 Kintana 1381911
  uBeneficio.bGravaEvento := False;
  bRequerBenef := False;

  qrySitFunc.Close;
  qrysitFunc.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrySitFunc.Open;

  qrySitPlanoPrev.Close;
  qrysitPlanoPrev.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrySitPlanoPrev.Open;

  qrySitPart.Close;
  qrySitPart.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrySitPart.Open;

  bbtnRequerBeneficio.Caption := 'Benefício p/'+#13+'&Beneficiário';
  bbtnRequerParticip.Caption  := 'Benefício p/'+#13+'&Participante';

  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
  dtmBaseDados.dbBaseDados.StartTransaction;
end;

procedure TfrmEventoMorte.bbtnProcurarClick(Sender: TObject);
var
  // Vinicius Ferreira SOL 164235 Kintana 1409163 - Inicio
  xQry: TwwQuery;
  VerifFalecimentovQry,
  VerifFalecimentovQry2  :TwwQuery;
  bTrazerRegistrado : Boolean;
  verifdivQry:TwwQuery; //Monica SOL 172398
  // Parametros para Quitacao de EMPRESTIMO
  fSaldoAtualizado,
  fSaldoDevedor,
  fParcelasAberto  : Currency;
  iPlanilha,
  iPlanilhaResult  : longint;
  sResult          : TStringList;
  sErro            : TStringList;
  sMensagemErro    : String;
  sDataSaldoEmprestimo : string;
  DividaEMP : Boolean;
  sMatricula :string;

  // Vinicius Ferreira SOL 164235 Kintana 1409163 - Fim
begin
   //Otacilio Aquino SOL 160863 Kintana 1381911
  if uBeneficio.bGravaEvento then
  begin
     MsgDlg('Evento em aberto confirme "OK" ou "Cancelar" para fazer nova procura.', 'Evento', mtInformation, [mbok], 0);
     Abort;
  end;

  inherited;
  Msg := '';
  dblkpcmbSitFunc.Clear;      dblkpcmbSitFunc.Enabled      := True;
  dblkpcmbSitPlanoPrev.Clear; dblkpcmbSitPlanoPrev.Enabled := True;
  dblkpcmbSitPart.Clear;      dblkpcmbSitPart.Enabled      := True                              ;
  bTrazerRegistrado := False;
  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     sIdPessoa          := MontaSelectPart.ValoresChave[0];
     sIdPessJur         := MontaSelectPart.ValoresChave[1];
     sIdPlanoPrev       := MontaSelectPart.ValoresChave[2];
     sIdSitFunc         := MontaSelectPart.ValoresChave[15];
     sIdSitPart         := MontaSelectPart.ValoresChave[16];
     sIdSitPlanoPrev    := MontaSelectPart.ValoresChave[17];
     sSeqProposta       := MontaSelectPart.ValoresChave[19];
     edNome.Text        := MontaSelectPart.ValoresChave[3];
     edMatricula.Text   := MontaSelectPart.ValoresChave[4];
     edPatro.Text       := MontaSelectPart.ValoresChave[5];
     edPlano.Text       := MontaSelectPart.ValoresChave[6];
     edSitPatro.Text    := MontaSelectPart.ValoresChave[7];
     edSitFundacao.Text := MontaSelectPart.ValoresChave[8];
     edSitPlano.Text    := MontaSelectPart.ValoresChave[9];
     sMatricula         := MontaSelectPart.ValoresChave[4];
     edInscNumero.Text  := MontaSelectPart.ValoresChave[12];
     if MontaSelectPart.ValoresChave[21] <> ''
     then sTempoServAntReal := MontaSelectPart.ValoresChave[21]
     else sTempoServAntReal := MontaSelectPart.ValoresChave[22];

     edTempoServTotal.Text  := MontaSelectPart.ValoresChave[23];
     edTempoServMES.Text    := MontaSelectPart.ValoresChave[25];
     edTempoServDIA.Text    := MontaSelectPart.ValoresChave[26];

     sFlgIntPartAntes       := MontaSelectPart.ValoresChave[24];


     pnlInformacao.Enabled := True;
     pnlBotao.Enabled      := True;
     bbtnConfirmar.Enabled := True;
     bbtnCancelar.Enabled  := True;

     ConsPart1.sIdPessoa    := sidpessoa;
     ConsPart1.sIdTitular   := sIdPessoa;
     ConsPart1.sSeqProposta := sseqproposta;
     ConsPart1.sIdPlanoprev := sidplanoprev;
     ConsPart1.DataBaseName := 'BaseDados';
     ConsPart1.sIdPessjur   := sidpessjur;
     ConsPart1.Enabled      := true;
     bbtnOpcoes.enabled     := true;

    // Vinicius Ferreira SOL 164235 Kintana 1409163 - Inicio
       try
         xQry := TwwQuery.Create(Self);
         xQry.DatabaseName := 'BaseDados';
        VerifFalecimentovQry := TwwQuery.Create(Self);
        VerifFalecimentovQry.DatabaseName := 'BaseDados';

        VerifFalecimentovQry2 := TwwQuery.Create(Self);
        VerifFalecimentovQry2.DatabaseName := 'BaseDados';

         with xQry do
         begin

            Sql.Clear;
            Sql.Add(' SELECT Count(1) Over() AS Qtde , PP.IDPESSOA, PP.IDPARAM, PP.DATAINICIO, PP.DATAFIM, PP.VALOR, ');
            Sql.Add(' PF.DESCRICAO, PF.TIPO, PF.VALIDACAO, PF.LEGENDA,  ');
            Sql.Add(' PF.MSGALERTARRESGATE, PF.FLGALERTARRESGATE, PF.MSGIMPEDEPORTABILIDADE, PF.FLGIMPEDEPORTABILIDADE ');
            Sql.Add(' FROM PESSOAPARAM PP, PARAMFLAGPESSOA PF ');
            Sql.Add(' WHERE  PP.IDPESSOA = ' + sIdPessoa + ' AND  ');
            Sql.Add(' PP.IDPARAM  = PF.IDPARAM AND ');
            //Sql.Add(' sysdate between PP.Datainicio and PP.Datafim AND ');
            Sql.Add(' sysdate > PP.Datainicio and (sysdate < PP.Datafim or PP.Datafim is null) AND  ');
            Sql.Add(' PF.FLGALERTARRESGATE = 1 ');
            Sql.Add(' ORDER BY PF.DESCRICAO ');
            Open;

            //Monica SOLº 172398  - inicio
            {DividaEMP := dtmDividaEP.ValorDevidoMutuario(StrToint(sIdPessoa),
                                                    Date,
                                                    -1,
                                                    10,
                                                    fSaldoAtualizado,
                                                    fSaldoDevedor,
                                                    fParcelasAberto,
                                                    False, False );} //Monica SOLº 172398



           verifdivQry := TwwQuery.Create(Self);
           verifdivQry.DatabaseName := 'BaseDados';

               with verifdivQry do begin

               Sql.Clear;
               Sql.Add('SELECT C.IDCONTRATOEMPTMO FROM CONTRATOEMPTMO C WHERE ');
               Sql.Add('C.FLGSITUACAO NOT IN (''Q'', ''C'') AND C.IDBENEF =' + sidpessoa + 'AND C.IDPESSOA =' + sidpessoa +'');
               Open;

               end;

               //Monica SOLº 172398 - fim

            If (sIdEventoGerador = '346') or (sIdEventoGerador = '387') then   //edilaine - SIG86058
            begin  //Falecimento - Resgate p/ Beneficiário Designado
               If xQry.FieldByName('Qtde').AsInteger  > 1 then
               begin
                  if MsgDlg('Participante possui mais de um parâmetro que alertam para resgate. Deseja continuar?',
                  'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then
                  begin
                     LimpaCampos;
                     pnlBotao.Enabled := False;
                     bbtnConfirmar.Enabled := False;
                     bbtnCancelar.Enabled  := False;
                     Exit;
                  end;
               end
               else
               begin
                  if (xQry.FieldByName('FLGALERTARRESGATE').AsInteger = 1) then
                  begin
                     if MsgDlg('' + FieldByName('MSGALERTARRESGATE').AsString + '. Deseja continuar ?',
                     'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then
                     begin
                        LimpaCampos;
                        pnlBotao.Enabled := False;
                        bbtnConfirmar.Enabled := False;
                        bbtnCancelar.Enabled  := False;
                        Exit;
                     end;
                  end;

                     //Monica SOLº 172398  - inicio

               if not verifdivQry.isempty then
                   begin
                   if (xQry.FieldByName('FLGALERTARRESGATE').AsInteger = 0) and (verifdivQry.RecordCount  > 0) then
                  begin
                     if MsgDlg('O participante possui dívidas de empréstimo - Deseja continuar ?',
                     'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then
                     begin
                        LimpaCampos;
                        pnlBotao.Enabled := False;
                        bbtnConfirmar.Enabled := False;
                        bbtnCancelar.Enabled  := False;
                        Exit;
                     end;
                  end;
                end; ////if not empty




                  { if (xQry.FieldByName('FLGALERTARRESGATE').AsInteger = 0) and (dtmDividaEP.bExisteDividaValor) then
                  begin
                     if MsgDlg('O participante possui dívidas de empréstimo - Deseja continuar ?',
                     'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then
                     begin
                        LimpaCampos;
                        pnlBotao.Enabled := False;
                        bbtnConfirmar.Enabled := False;
                        bbtnCancelar.Enabled  := False;
                        Exit;
                     end;
                  end;

                     if (xQry.FieldByName('FLGALERTARRESGATE').AsInteger = 0) and (dtmDividaEP.bNExisteAtuDiaria) then
                     begin
                        if MsgDlg('' + FieldByName('MSGALERTARRESGATE').AsString + ' - Deseja continuar ?',
                        'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then
                        begin
                           LimpaCampos;
                           pnlBotao.Enabled := False;
                           bbtnConfirmar.Enabled := False;
                           bbtnCancelar.Enabled  := False;
                           Exit;
                        end;
                     end;}

                     //Monica SOLº 172398 - fim

                  End;
               end;
         end;


        with VerifFalecimentovQry2 do
        begin
          Close;
          Sql.Clear;
          SQL.Add('SELECT  P.IDEVENTOGERADOR');
          SQL.Add('          FROM eventosprev P, ELEGPATRO E');
          SQL.Add('         WHERE   P.IDPESSOA = E.IDPESSOA --iIdPessoa');
          SQL.Add('           and E.matricula = '+ QuotedStr(sMatricula) );
          //SQL.Add('           AND BF.IDPLANOORIGEM = 2 --iIdPlanoPrev');
          SQL.Add('           AND  P.IDEVENTOGERADOR = 4 -- tipo evento falecimento ');
          //SQL.Add('           AND BF.IDSITBENEFICIO <> 3 -- nao esta encerrado');
          Open;
        end;

        with VerifFalecimentovQry do
        begin
          Close;
          Sql.Clear;
          SQL.Add('SELECT  P.IDEVENTOGERADOR');
          SQL.Add('          FROM eventosprev P, depentit D');
          SQL.Add('         WHERE   P.IDPESSOA = D.IDPESSOA --iIdPessoa');
          SQL.Add('           and D.matricula = '+ QuotedStr(sMatricula) );
          //SQL.Add('           AND BF.IDPLANOORIGEM = 2 --iIdPlanoPrev');
          SQL.Add('           AND  P.IDEVENTOGERADOR = 4 -- tipo evento falecimento ');
          //SQL.Add('           AND BF.IDSITBENEFICIO <> 3 -- nao esta encerrado');
          Open;

          if((VerifFalecimentovQry.IsEmpty) and (VerifFalecimentovQry2.IsEmpty))and (sIdEventoGerador = '346')then
          begin
               MsgDlg('Para cadastrar um evento de falecimento de resgate para beneficiário designado é preciso possuir  um evento de falecimento cadastrado','Informação',mtInformation,[mbOk,mbHelp],0);

                      LimpaCampos;
                      pnlBotao.Enabled := False;
                      bbtnConfirmar.Enabled := False;
                      bbtnCancelar.Enabled  := False;
                      Exit;

          end;

        end;
        with VerifFalecimentovQry do
        begin
          Close;
          Sql.Clear;
          SQL.Add('SELECT  EP.IDEVENTOGERADOR');
          SQL.Add('FROM   EVENTOGERADOR EG, EVENTOSPREV EP, SITPART SPART,');
          SQL.Add('       SITPLANOPREV SPLANO, SITFUNC SFUNC,');
          SQL.Add('       SITPART SPARTANT,');
          SQL.Add('       SITPLANOPREV SPLANOANT, SITFUNC SFUNCANT');
          SQL.Add('WHERE (EG.FLGINTERNO      = '+QuotedStr(FInscricaoNovoPlano.sFlgInterno)+')');
          SQL.Add('AND   (EG.IDEVENTOGERADOR = EP.IDEVENTOGERADOR)');
          SQL.Add('AND   (EP.IDPESSJUR       = '+sIdPessJur+')');
          SQL.Add('AND   (EP.IDPLANOPREV     = '+sIdPlanoPrev+')');
          SQL.Add('AND   (EP.IDPESSOA        = '+sIdPessoa+')');
          SQL.Add('AND   (EG.IDEVENTOGERADOR = '+sIdEventoGerador+')');
          SQL.Add('AND   (EP.IDSITFUNCNOVO   = SFUNC.IDSITFUNC)');
          SQL.Add('AND   (EP.IDSITPARTNOVO   = SPART.IDSITPART)');
          SQL.Add('AND   (EP.IDSITPLANONOVO  = SPLANO.IDSITPLANOPREV)');
          SQL.Add('AND   (EP.IDSITFUNCATUAL  = SFUNCANT.IDSITFUNC)');
          SQL.Add('AND   (EP.IDSITPARTATUAL  = SPARTANT.IDSITPART)');
          SQL.Add('AND   (EP.IDSITPLANOATUAL = SPLANOANT.IDSITPLANOPREV)');
          Open;

          if not (VerifFalecimentovQry.IsEmpty) and ((sIdEventoGerador = '346') or (sIdEventoGerador = '387'))  then   //edilaine - SIG86058
          begin
              if MsgDlg('Já Existe um evento registrado para essa pessoa. Deseja registrar um novo evento?',
                   'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrYes then
              begin
                   bTrazerRegistrado := False;
              end
              else
                  bTrazerRegistrado := True;

          end;
        end;



       finally
          FreeAndNil(xQry);
          FreeAndNil(verifdivQry);
          FreeAndNil(VerifFalecimentovQry);
          FreeAndNil(VerifFalecimentovQry2);
       end;


    // Vinicius Ferreira SOL 164235 Kintana 1409163 - Fim

     //  Verifica se o evento já foi registrado
     if (sIdEventoGerador <> '346') and (sIdEventoGerador <> '387') or                              //edilaine - SIG86058
        (((sIdEventoGerador = '346') or (sIdEventoGerador = '387')) and (bTrazerRegistrado)) then   //edilaine - SIG86058
     begin
        VerificaEstadoEvento;
     end;

     if (sEstadoEvento = 'NAO REGISTRADO') or
        (((sIdEventoGerador = '346') or (sIdEventoGerador = '387')) and not (bTrazerRegistrado)   )   //edilaine - SIG86058
     then  begin // Verifica se pode Inserir
       if not PodeRegistrarEvento(qryAux, sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta,
                                  FInscricaoNovoPlano.sFlgInterno,sIdSitFunc,sIdSitPart,sIdSitPlanoPrev,sMotivoEvento,sIdEventoGerador)
       then begin
           MsgDlg('Esse Evento não pode ser registrado. Motivo : '+sMotivoEvento,'Informação',mtInformation,[mbOk,mbHelp],0);
           LimpaCampos;
           TiraSql(qryAux);
           exit;
        end;

        bAltera := False;
        bEfetivado := False;

        dtEvento.Text             := '';

        dblkpcmbSitFunc.Text      := '';
        dblkpcmbSitPlanoPrev.Text := '';
        dblkpcmbSitPart.Text      := '';
     end
     else
     begin
          bAltera := True ;


          if( sEstadoEvento = 'REGISTRADO')
          then begin // Pode Alterar
             if (sIdEventoGerador <> '346') and (sIdEventoGerador <> '387') then   //edilaine - SIG86058
                MsgDlg('Esse Evento já foi registrado.','Informação',mtInformation,[mbOk,mbHelp],0);
             bEfetivado := False;
            // dtEvento.SetFocus;
             pnlBotao.Enabled := True;
             bbtnConfirmar.Enabled := True;
             bbtnCancelar.Enabled  := True;
          end
          else if sEstadoEvento = 'EFETIVADO'
          then begin // Não Pode Alterar, nem inserir outro evento
             MsgDlg('Esse Evento já foi efetivado. Não pode ser alterado.','Informação',mtInformation,[mbOk,mbHelp],0);
             bEfetivado := True;
             pnlInformacao.Enabled := False;
             pnlBotao.Enabled      := True;
             bbtnConfirmar.Enabled := False;
             bbtnCancelar.Enabled  := False;
          end;

        edTempoServTotal.Text  := MontaSelectPart.ValoresChave[23];
        edTempoServMES.Text    := MontaSelectPart.ValoresChave[25];
        edTempoServDIA.Text    := MontaSelectPart.ValoresChave[26];

        dtEvento.date             := StrToDate(qryEvento.FieldByName('DataEvento').AsString);


        qrySitFunc.locate('IDSITFUNC',qryEvento.FieldByName('IDSITFUNCNOVO').AsInteger,[loCaseInsensitive] );
        qrySitPlanoPrev.locate('IDSITPLANOPREV',qryEvento.FieldByName('IDSITPLANONOVO').AsInteger,[loCaseInsensitive] );
        qrySitPart.locate('IDSITPART',qryEvento.FieldByName('IDSITPARTNOVO').AsInteger,[loCaseInsensitive] );

        dblkpcmbSitFunc.LookupValue      := qryEvento.FieldByName('IDSITFUNCNOVO').AsString;
        dblkpcmbSitFunc.PerformSearch;
        dblkpcmbSitFunc.Enabled      := False;

        dblkpcmbSitPlanoPrev.LookupValue := qryEvento.FieldByName('IDSITPLANONOVO').AsString;
        dblkpcmbSitPlanoPrev.PerformSearch;
        dblkpcmbSitPlanoPrev.Enabled := False;

        dblkpcmbSitPart.LookupValue      := qryEvento.FieldByName('IDSITPARTNOVO').AsString;
        dblkpcmbSitPart.PerformSearch;
        dblkpcmbSitPart.Enabled      := False;

        edSitPatro.Text           := qryEvento.FieldByName('NOMESITFUNCANT').AsString;
        edSitPlano.Text           := qryEvento.FieldByName('NOMESITPLANOANT').AsString;
        edSitFundacao.Text        := qryEvento.FieldByName('NOMESITPARTANT').AsString;

        sIdSitFunc                := qryEvento.FieldByName('IDSITFUNCATUAL').AsString;
        sIdSitPart                := qryEvento.FieldByName('IDSITPARTATUAL').AsString;
        sIdSitPlanoPrev           := qryEvento.FieldByName('IDSITPLANOATUAL').AsString;
        sFlgIntPartAntes          := qryEvento.FieldByName('FLGINTANT').AsString;

     end;
  end;

  if not dtmBaseDados.dbBaseDados.InTransaction then
  dtmBaseDados.dbBaseDados.StartTransaction;

end;


procedure TfrmEventoMorte.VerificaEstadoEvento;
begin
   with qryEvento do
   begin
      Close;
      ParamByName('FlgInterno').AsString   := FInscricaoNovoPlano.sFlgInterno;
      ParamByName('IdPessJur').AsInteger   := StrToInt(sIdPessJur);
      ParamByName('IdPlanoPrev').AsInteger := StrToInt(sIdPlanoPrev);
      ParamByName('IdPessoa').AsInteger    := StrToInt(sIdPessoa);
      ParamByName('SeqProposta').AsInteger := StrToInt(sSeqProposta);
      ParamByName('IDEVENTOGERADOR').AsInteger := StrToInt(sIdEventoGerador);
      Open;

      if IsEmpty
      then sEstadoEvento := 'NAO REGISTRADO' // Pode Inserir
      else if FieldByName('FLGEFETIVADO').AsString = '0'
           then begin
              sEstadoEvento := 'REGISTRADO'; // Pode Alterar
              sIdEventoGerador := FieldByName('IDEVENTOGERADOR').AsString;
           end
           else
           begin
              sEstadoEvento := 'EFETIVADO'; // Não pode Alterar, nem inserir um novo
           end;
   end;
end;

procedure TfrmEventoMorte.bbtnRequerBeneficioClick(Sender: TObject);
var
  sTempoContribuicao, sSQL,
  sMsgErro : string;
begin
  inherited;

  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     bbtnProcurar.SetFocus;
     Exit;
  end;

  if Trim(dtEvento.Text) = '' then
     begin
          MsgDlg('A Data do Evento deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
         // dtEvento.SetFocus;
          Exit;
     end;
     
        //Jonas Otavio - SOL 175700
     if (sIdEventoGerador <> '346') and (sIdEventoGerador <> '387') then   //edilaine - SIG86058
        begin
             qryaux.close;
             qryaux.sql.text := 'SELECT trunc(sysdate) FROM DUAL WHERE trunc(sysdate) < to_date(''' + Trim(dtEvento.Text) + ''',''dd/mm/YYYY'')' ;
             qryaux.open;
              if not qryaux.IsEmpty then
              begin
              MsgDlg('A data do evento não pode ser maior que a data atual.','Informação',mtInformation,[mbOk],0);
              dtEvento.SetFocus;
              Exit;
           end
           end;

//Jonas Otavio - SOL 175700


  if Trim(dblkpcmbSitFunc.Text) = '' then
     begin
          MsgDlg('A Nova Situação do Participante na '+lblPatro.Caption+' deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
         // dblkpcmbSitFunc.SetFocus;
          Exit;
     end;

  if Trim(dblkpcmbSitPlanoPrev.Text) = '' then
     begin
          MsgDlg('A Nova Situação do Participante no Plano deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
        //  dblkpcmbSitPlanoPrev.SetFocus;
          Exit;
     end;


  if (Trim(edTempoServTotal.Text) = '') or (Trim(edTempoServTotal.Text) = '0')
  then begin
     if MsgDlg('O Tempo de Serviço Total não foi informado. Confirma ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
     then begin
     //   edTempoServTotal.SetFocus;
        Exit;
     end;
  end;

  // Verifica se o Participante Selecionado possui Beneficiários
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.SQL.Add(' SELECT BF.IDTITULAR ' +
                 ' FROM BFCIARIOTITPLAN BF, DEPENTIT DP, BENEFICIO B ' +
                 ' WHERE BF.IDTITULAR   = ' + sIdPessoa    +
                 ' AND   BF.IDPLANOPREV = ' + sIdPlanoPrev +
                 ' AND   BF.IDPESSJUR   = ' + sIdPessJur   +
                 ' AND   BF.SEQPROPOSTA = ' + sSeqProposta +
                 ' AND   BF.IDBENEFICIO = B.IDBENEFICIO '+
                 ' AND   B.IDEVENTOGERADOR = ' + sIdEventoGerador +
                 ' AND   BF.IDTITULAR <> BF.IDPESSOA '+
                 ' AND   DP.IDTITULAR = BF.IDTITULAR '+  
                 ' AND   DP.IDPESSOA  = BF.IDPESSOA  '+  
                 ' AND   DP.DATACANCELA IS NULL      '); 

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

     MsgDlg('Este Participante não possui nenhum dependente elegível a benefício cadastrado. '+
            'Para cadastrar, utilize o Cadastro de Dependentes/Beneficiários.',
            'Informação',mtInformation,[mbOk,mbHelp],0);
     TiraSql(qryAux);
     Exit;
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
                                       dtEvento.Text,
                                       sMsgErro )

  then begin
     frmAguarde.Apaga;
     MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
     Exit;
  end;
  frmAguarde.Apaga;


  //SOL 122922 - Adler Souza
  //Alteração: Comentei.

  // Grava Data do Falecimento
//  qryAux.Close;
//  qryAux.Sql.Clear;
//  qryAux.Sql.Add(' UPDATE PESSOAFISICA SET DATAMORTE = To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' +
//                 ' WHERE  IDPESSOA  = ' + sIdPessoa);
//  try
//     qryAux.ExecSQL;
//  except
//     on E:EDBEngineError do
//       begin
//            MostrarErro(E);
//            Exit;
//       end;
//  end;
  // Fim - Grava Data do Falecimento
  //Fim - SOL 122922 - Adler Souza

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
                                      bEncerrou,true) //SOL 122922 - Adler Souza 
     then begin
        MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
        Exit;
     end;
  end;

  pIdSitFunc      := qrySitFunc.FieldByName('IDSITFUNC').AsString;
  pIdSitPart      := qrySitPart.FieldByName('IDSITPART').AsString;   //sIdSitPart;
  pIdSitPlanoPrev := qrySitPlanoPrev.FieldByName('IDSITPLANOPREV').AsString;
  pTipoSit        := qrySitFunc.FieldByName('TIPOSIT').AsString;
// sIdSitPart      := qrySitPart.FieldByName('IDSITPART').AsString;   // ROSANA - refer - 06/08/99

  if not bEfetivado
  then VerificaeGravaSituacoes;

  if (not bAltera) then
    GravaEVENTOSPREV;

  bRequerBenef := True;


  If (edTempoServTotal.Text <> '0') And (edTempoServTotal.Text <> '') Then
    sTempoContribuicao := edTempoServTotal.Text+' anos ';
  If (edTempoServMes.Text <> '0')   And (edTempoServMes.Text <> '') Then
    sTempoContribuicao := sTempoContribuicao + edTempoServMes.Text+' meses ';
  If (edTempoServDia.Text <> '0')   And (edTempoServDia.Text <> '') Then
    sTempoContribuicao := sTempoContribuicao + edTempoServDia.Text+' dias ';

  iIdCalculo := 0;
  AbreRequerBfciario('EV',sIdPessoa, sIdPessJur, sIdPlanoPrev, sSeqProposta,
                     dtEvento.Text, sIdEventoGerador,'',
                     sNumerosProcessos,
                     sFlgIntPartAntes,
                     qrySitPart.FieldByName('FlgInterno').AsString,
                     sIdSitPart,
                     sIdSitPlanoPrev,
                     sIdSitFunc,
                     qrySitPart.FieldByName('IdSitPart').AsString,
                     qrySitPlanoPrev.FieldByName('IdSitPlanoPrev').AsString,
                     qrySitFunc.FieldByName('IdSitFunc').AsString,
                     iIdCalculo,
                     True 
                     );


  // Mesmo que o evento já esteja efetivado,
  // se o usuario requereu um beneficio, habilitar o ok e o cancelar
  // para que ele possa gravar o beneficio
  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled  := True;
end;

procedure TfrmEventoMorte.bbtnConfirmarClick(Sender: TObject);
var sMsgErro : string;
  sProcessosVerificar   : string;
  iNumeroProcesso       : longint;
  bRequereuSoINSS       : boolean;
  bEncerrouBenef       : boolean;

begin
  inherited;

  // Renato Visoni SOL 155258 Kintana 1200878
  // SOL 141078 KINTANA 888253
  with qryAux do begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT IDPESSOA FROM BENEFBFCIARIO ');
    SQL.Add(' WHERE IDTITULAR = ' + sIdPessoa  );
    SQL.Add(' AND IDTITULAR <> IDPESSOA   ');
    Open;
    if not isEmpty then
    begin

      with qryAux do
      begin
         Close;
         SQL.Clear;
         //KINTANA 1356059 SOL 161040 Otacilio Aquino ** Inicio **
         SQL.Add(' SELECT TIPOCONTA FROM CM.CONTABANCARIA '+
                 ' WHERE TIPOCONTA = 2 '+
                 ' AND IDPESSOA IN ( SELECT IDPESSOA FROM BENEFBFCIARIO WHERE IDTITULAR = ' + sIdPessoa + ' AND IDTITULAR <> IDPESSOA )  ');
          Open;
         if IsEmpty then
         begin
            Msg := 'Conta Salário não cadastrada!';
         end;
         //KINTANA 1356059 SOL 161040 Otacilio Aquino ** Inicio **

         Close;
         SQL.Clear;
         SQL.Add(' SELECT NUMDOCUMENTO FROM CM.PESSOA  '+
                 ' WHERE  NUMDOCUMENTO IS NOT NULL '+
                 ' AND    IDPESSOA IN ( SELECT IDPESSOA FROM BENEFBFCIARIO WHERE IDTITULAR = ' + sIdPessoa + ' AND IDTITULAR <> IDPESSOA ) ');

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
                 ' AND    IDPESSOA IN ( SELECT IDPESSOA FROM BENEFBFCIARIO WHERE IDTITULAR = ' + sIdPessoa + ' AND IDTITULAR <> IDPESSOA ) ');

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
    // SOL 141078 KINTANA 888253
  end;
  // Renato Visoni SOL 155258 Kintana 1200878

  if Trim(edNome.Text) = '' then
     begin
          MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
          bbtnProcurar.SetFocus;
          Exit;
     end;

  if Trim(dtEvento.Text) = '' then
     begin
          MsgDlg('A Data do Evento deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
         // dtEvento.SetFocus;
          Exit;
     end;
     //Jonas Otavio - SOL 175700
     if (sIdEventoGerador <> '346') and (sIdEventoGerador <> '387') then   //edilaine - SIG86058
        begin
             qryaux.close;
             qryaux.sql.text := 'SELECT trunc(sysdate) FROM DUAL WHERE trunc(sysdate) < to_date(''' + Trim(dtEvento.Text) + ''',''dd/mm/YYYY'')' ;
             qryaux.open;
              if not qryaux.IsEmpty then
              begin
              MsgDlg('A data do evento não pode ser maior que a data atual.','Informação',mtInformation,[mbOk],0);
              dtEvento.SetFocus;
              Exit;
           end
           end;
//Jonas Otavio - SOL 175700


     if Trim(dblkpcmbSitFunc.Text) = '' then
        begin
             MsgDlg('A Nova Situação do Participante na '+lblPatro.Caption+' deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
           //  dblkpcmbSitFunc.SetFocus;
             Exit;
        end;

  if Trim(dblkpcmbSitPlanoPrev.Text) = '' then
     begin
          MsgDlg('A Nova Situação do Participante no Plano deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
        //  dblkpcmbSitPlanoPrev.SetFocus;
          Exit;
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

  if not bEfetivado
  then VerificaeGravaSituacoes;

  GravaEVENTOSPREV;


 {Grava Data do Falecimento}
  if sIdEventoGerador = '4' then // SOL 260838 KINTANA 1060022 Grava data de Falecimento somente em evento de falecimento.
  begin
      qryAux.Close;
      qryAux.Sql.Clear;
      qryAux.Sql.Add(' UPDATE PESSOAFISICA SET DATAMORTE = To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' +
                     ' WHERE  IDPESSOA  = ' + sIdPessoa);
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


  if (not bAltera) and (not bRequereuSoINSS)
  then begin
     GravaHSTCONTEVENTOSPRFechado(IntToStr(iIdEventoPrev), sIdPlanoPrev, sIdEventoGerador,'', sIdPessoa, sIdPessJur, sSeqProposta, '','',
                                  dtEvento.Text,True, qryAux, qryGrava,sIdPlanoPrev);

     If (not bRequerBenef) and (not bAltera) then begin
       bEncerrouBenef := ValidaBeneficioAnterior(
                           QryAux, StrToInt(sIdPessJur), StrToInt(sIdPlanoPrev),
                           StrToInt(sIdPessoa),          StrToInt(sSeqProposta),
                           StrToInt(sIdEventoGerador),   False,
                           dtEvento.Text,                sMsgErro, bEncerrou,true); //SOL 122922 - Adler Souza
       If not bEncerrouBenef Then Begin
         MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);

         { Cancelar processo caso não tenha encerrado o beneficio }
         if dtmBasedados.dbBaseDados.InTransaction then dtmBasedados.dbBaseDados.RollBack;
         LimpaCampos;
         dtmBaseDados.dbBaseDados.StartTransaction;
         Exit;

       End;
     End;

     if not bEncerrou
     then begin 
        if not SuspendeContribuicoes( sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta, sIdEventoGerador, dtEvento.Text, '',
                                      edMatricula.Text, sIdSitPart, qryAux, qryGrava,
                                      FInscricaoNovoPlano.sFlgInterno, sFlgIntPartAntes)
        then begin
           MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
           if dtmBasedados.dbBaseDados.InTransaction
           then dtmBasedados.dbBaseDados.RollBack;
           LimpaCampos;
           dtmBaseDados.dbBaseDados.StartTransaction;
           exit;
        end;
     end;


     if not AssociaNovasContribuicoes(sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta, sIdEventoGerador, dtEvento.Text, '',
                                      edMatricula.Text, qrySitPart.FieldByName('IDSITPART').AsString,
                                      '',True, True, False,
                                      qryAux, qryGrava,FInscricaoNovoPlano.sFlgInterno,iIdEventoPrev,'')
     then begin
        MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
        if dtmBasedados.dbBaseDados.InTransaction
        then dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        Exit;
     end;

     MostraContribuicoes(IntToStr(iIdEventoPrev), edNome.Text, edPatro.Text, edPlano.Text);
  end;

  if (not bRequerBenef) and (not bAltera)
     and (not bEncerrouBenef)   
  then begin
     if not ValidaBeneficioAnterior ( qryAux,
                                      StrToInt(sIdPessJur),
                                      StrToInt(sIdPlanoPrev),
                                      StrToInt(sIdPessoa),
                                      StrToInt(sSeqProposta),
                                      StrToInt(sIdEventoGerador),
                                      True,
                                      dtEvento.Text,
                                      sMsgErro,
                                      bEncerrou,
                                      true)//SOL 122922 - Adler Souza

     then begin
        MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
        Exit;
     end;
  end;

    // cguedes - 19/12/2002
    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;


  if dtmBasedados.dbBaseDados.InTransaction then
  dtmBasedados.dbBaseDados.Commit;
  MsgDlg('Evento efetuado com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);

  LimpaCampos;
  TiraSql(qryAux);
  bRequerBenef := False;

  If Not CartaEvento(sIdPessoa, sIdPessJur, sIdPlanoPrev, sIdEventoGerador, sSeqProposta)
    Then MsgDlg('Carta do evento não emitida.','Informação',mtInformation,[mbOk,mbHelp],0);

  dtmBaseDados.dbBaseDados.StartTransaction;
  
  //Otacilio Aquino SOL 160863 Kintana 1381911
  uBeneficio.bGravaEvento := False;
end;

procedure TfrmEventoMorte.VerificaeGravaSituacoes;
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
     (qryAux.FieldByName('FLGSITPLANOIMEDI').AsString = '1') then
      begin
           sFlgEfetivado  := '1';
           sDataEfetivado := ' To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')';
      end
  else
      begin
           sFlgEfetivado  := '0';
           sDataEfetivado := 'NULL';
      end;


  if qryAux.FieldByName('FLGSITFUNCIMEDIA').AsString  = '1' then
     begin
          sFlgSitFuncImed := '1';

         {Grava nova Situação do Participante na Patrocinadora}
          qryGrava.Close;
          qryGrava.Sql.Clear;
          qryGrava.Sql.Add(' UPDATE ELEGPATRO SET IDSITFUNC = ''' + qrySitFunc.FieldByName('IDSITFUNC').AsString +''''+
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
     end
  else
     sFlgSitFuncImed := '0';

  if qryAux.FieldByName('FLGSITPARTIMEDIA').AsString  = '1' then
     sFlgSitPartImed := '1'
  else
     sFlgSitPartImed := '0';


  if qryAux.FieldByName('FLGSITPLANOIMEDI').AsString  = '1' then
     begin
          sFlgSitPlanoImed := '1';

         {Grava nova Situação do Participante no Plano}
          qryGrava.Close;
          qryGrava.Sql.Clear;
          qryGrava.Sql.Add(' UPDATE PARTPREVPLAN  ' +
                           ' SET IDSITPLANOPREV = ' + qrySitPlanoPrev.FieldByName('IDSITPLANOPREV').AsString + ', '+
                           '     IDSITPART      = ' + qrySitPart.FieldByName('IDSITPART').AsString +  // rosana - refer - 06/08/99
                           ' WHERE IDPESSJUR    = ' + sIdPessJur   + ' AND ' +
                           '       IDPLANOPREV  = ' + sIdPlanoPrev + ' AND ' +
                           '       SEQPROPOSTA  = ' + sSeqProposta + ' AND ' +
                           '       IDPESSOA     = ' + sIdPessoa);
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
     sFlgSitPlanoImed := '0';
end;

procedure TfrmEventoMorte.GravaEVENTOSPREV;
Var
  sIdCalculo : String;
begin

  If ( iIdCalculo > 0 )
  Then sIdCalculo  := IntToStr( iIdCalculo )
  Else sIdCalculo := 'NULL';

  if (not bAltera) and (not bEfetivado) and (not bRequerBenef)
  then begin
          iIdEventoPrev := LeUltRegistro(qryAux,'EVENTOSPREV');

          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(' INSERT INTO EVENTOSPREV(IDEVENTOSPREV, DATAREGISTRO, DATAEVENTO, ' +
                         '                         IDPESSOA, IDPESSJUR, IDPLANOPREV, SEQPROPOSTA, ' +
                         '                         IDSITFUNCATUAL, IDSITPARTATUAL, IDSITPLANOATUAL, ' +
                         '                         IDSITFUNCNOVO, IDSITPARTNOVO, IDSITPLANONOVO, ' +
                         '                         IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED, FLGSITPLANOIMED, ' +
                         '                         DATAEFETIVADO, FLGEFETIVADO, INSCRICAONUMERO, ' +
                         '                         IDCALCULO '+' ) ' +
                         ' VALUES(' + IntToStr(iIdEventoPrev) + ',' + ' To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')' + ',' + ' To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
                                      sIdPessoa + ',' + sIdPessJur + ',' + sIdPlanoPrev + ',' + sSeqProposta + ',' +
                                      '''' + sIdSitFunc + '''' + ',' + sIdSitPart + ',' + sIdSitPlanoPrev + ',' +
                                      '''' + qrySitFunc.FieldbyName('IDSITFUNC').AsString + '''' + ',' +
                                             qrySitPart.FieldByName('IDSITPART').AsString + ','  +  // rosana - refer - 06/08/99
                                             qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString + ',' +
                                      sIdEventoGerador + ',' + sFlgSitFuncImed + ',' + sFlgSitPartImed + ',' + sFlgSitPlanoImed + ',' +
                                      sDataEfetivado + ',' + sFlgEfetivado+','+OraNumero(edInscNumero.Text) + ', ' +
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
  else
     begin
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.Sql.Add(' UPDATE EVENTOSPREV SET DATAALTERADO = To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')' + ',' +
                         '                        DATAEVENTO   = To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
                         '                        IDSITFUNCATUAL  = ''' + sIdSitFunc + ''',' +
                         '                        IDSITPARTATUAL  = ' + sIdSitPart + ',' +
                         '                        IDSITPLANOATUAL = ' + sIdSitPlanoPrev + ',' +
                         '                        IDSITFUNCNOVO   = ''' + qrySitFunc.FieldbyName('IDSITFUNC').AsString + ''',' +
                         '                        IDSITPARTNOVO   = '   + qrySitPart.FieldByName('IDSITPART').AsString + ','   +  // rosana - refer - 06/08/99
                         '                        IDSITPLANONOVO  = '   + qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString + ',' +
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

procedure TfrmEventoMorte.bbtnCancelarClick(Sender: TObject);
begin
  if MsgDlg('Todas as operações executadas serão canceladas. Confirma ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes
  then
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

procedure TfrmEventoMorte.LimpaCampos;
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
  edTempoServTotal.Text  := '';
  edTempoServMES.Text    := '';
  edTempoServDIA.Text    := '';

  dblkpcmbSitFunc.Text := '';
  dblkpcmbSitPlanoPrev.Text := '';
  dblkpcmbSitPart.Text      := '';
  bbtnProcurar.SetFocus;
  ConsPart1.Enabled := false;
  bbtnOpcoes.enabled := false;    
end;

procedure TfrmEventoMorte.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TfrmEventoMorte.bbtnOpcoesClick(Sender: TObject);
var bPodeAlterarOpcoes, bOpcoesExistem : boolean;
    cAuxSeparador : char;
begin
  //Otacilio Aquino SOL 160863 Kintana 1381911
  if uBeneficio.bGravaEvento then
  begin
     MsgDlg('Evento em aberto confirme "OK" ou "Cancelar".', 'Evento', mtInformation, [mbok], 0);
     Abort;;
  end;  

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

procedure TfrmEventoMorte.bbtnSairClick(Sender: TObject);
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

procedure TfrmEventoMorte.bbtnRequerParticipClick(Sender: TObject);
var
  sTempoContribuicao,
  sMsgErro : string;
begin
  inherited;

  if Trim(edNome.Text) = ''
  then begin
     MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
     bbtnProcurar.SetFocus;
     Exit;
  end;

  if Trim(dtEvento.Text) = '' then
     begin
          MsgDlg('A Data do Evento deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
          Exit;
     end;
     //Jonas Otavio - SOL 175700
     if (sIdEventoGerador <> '346') and (sIdEventoGerador <> '387') then   //edilaine - SIG86058
        begin
             qryaux.close;
             qryaux.sql.text := 'SELECT trunc(sysdate) FROM DUAL WHERE trunc(sysdate) < to_date(''' + Trim(dtEvento.Text) + ''',''dd/mm/YYYY'')' ;
             qryaux.open;
              if not qryaux.IsEmpty then
              begin
              MsgDlg('A data do evento não pode ser maior que a data atual.','Informação',mtInformation,[mbOk],0);
              dtEvento.SetFocus;
              Exit;
           end
           end;
//Jonas Otavio - SOL 175700


  if Trim(dblkpcmbSitFunc.Text) = '' then
     begin
          MsgDlg('A Nova Situação do Participante na '+lblPatro.Caption+' deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          Exit;
     end;

  if Trim(dblkpcmbSitPlanoPrev.Text) = '' then
     begin
          MsgDlg('A Nova Situação do Participante no Plano deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          Exit;
     end;

  if (Trim(edTempoServTotal.Text) = '') or (Trim(edTempoServTotal.Text) = '0')
  then begin
     if MsgDlg('O Tempo de Serviço Total não foi informado. Confirma ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
     then begin
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
                                       -1,
                                       dtEvento.Text,
                                       sMsgErro )

  then begin
     frmAguarde.Apaga;
     MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
     Exit;
  end;
  frmAguarde.Apaga;


  //SOL 122922 - Adler Souza
  // Grava Data do Falecimento
//  qryAux.Close;
//  qryAux.Sql.Clear;
//  qryAux.Sql.Add(' UPDATE PESSOAFISICA SET DATAMORTE = To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' +
//                 ' WHERE  IDPESSOA  = ' + sIdPessoa);
//  try
//     qryAux.ExecSQL;
//  except
//     on E:EDBEngineError do
//       begin
//            MostrarErro(E);
//            Exit;
//       end;
//  end;
  // Fim - Grava Data do Falecimento
  //Fim SOL 122922 - Adler Souza

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
                                      bEncerrou,
                                      true)//SOL 122922 - Adler Souza

     then begin
        MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
        Exit;
     end;
  end;

  pIdSitFunc      := qrySitFunc.FieldByName('IDSITFUNC').AsString;
  pIdSitPart      := qrySitPart.FieldByName('IDSITPART').AsString;
  pIdSitPlanoPrev := qrySitPlanoPrev.FieldByName('IDSITPLANOPREV').AsString;
  pTipoSit        := qrySitFunc.FieldByName('TIPOSIT').AsString;

  if not bEfetivado
  then VerificaeGravaSituacoes;

  if (not bAltera) then
    GravaEVENTOSPREV;

  bRequerBenef := True;


  If (edTempoServTotal.Text <> '0') And (edTempoServTotal.Text <> '') Then
    sTempoContribuicao := edTempoServTotal.Text+' anos ';
  If (edTempoServMes.Text <> '0')   And (edTempoServMes.Text <> '') Then
    sTempoContribuicao := sTempoContribuicao + edTempoServMes.Text+' meses ';
  If (edTempoServDia.Text <> '0')   And (edTempoServDia.Text <> '') Then
    sTempoContribuicao := sTempoContribuicao + edTempoServDia.Text+' dias ';

  AbreRequerParticip('EV', sIdPessoa, sIdPessJur, sIdPlanoPrev,
                     sSeqProposta, dtEvento.Text, '',
                     sIdEventoGerador, '',sNumerosProcessos,
                     '',
                     sFlgIntPartAntes,
                     qrySitPart.FieldByName('FlgInterno').AsString,
                     sIdSitPart,
                     sIdSitPlanoPrev,
                     sIdSitFunc,
                     qrySitPart.FieldByName('IdSitPart').AsString,
                     qrySitPlanoPrev.FieldByName('IdSitPlanoPrev').AsString,
                     qrySitFunc.FieldByName('IdSitFunc').AsString,
                     sTempoContribuicao,
                     ''); 

  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled  := True;
end;



procedure TfrmEventoMorte.ConsPart1Click(Sender: TObject);
begin
  //Otacilio Aquino SOL 160863 Kintana 1381911
  if uBeneficio.bGravaEvento then
  begin
     MsgDlg('Evento em aberto confirme "OK" ou "Cancelar" para fazer nova consulta.', 'Evento', mtInformation, [mbok], 0);
     Abort;
  end;
  
  inherited;
end;

end.
