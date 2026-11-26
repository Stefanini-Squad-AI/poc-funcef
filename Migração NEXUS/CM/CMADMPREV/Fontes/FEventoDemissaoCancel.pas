// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//SIG:                131531
//Data da Alteração:  06/01/2022
//Alteração:          Permitir mais de uma portabilidade
//Responsável:        André Imakawa
//******************************************************************************
//SIG:                98044
//Data da Alteração:  26/02/2020
//Alteração:          Ajuste para permitir a geração de resgate mais de uma vez
//                    em casos de retorno de aposentadoria - complemento SIG96688
//Responsável:        Taffarel Sevaybriker
//******************************************************************************
//SIG:                96688
//Data da Alteração:  04/02/2020
//Alteração:          Ajuste para permitir a geração de resgate mais de uma vez
//                    em casos de retorno de aposentadoria.
//Responsável:        Taffarel Sevaybriker
//******************************************************************************
//SIG:                95620
//Data da Alteração:  06/01/2019
//Alteração:          Alteração na regra do evento para permitir a execução
//					  quando esses parâmetros possuírem data fim
//Responsável:        Rafael Vasconcelos
//******************************************************************************
//SIG:                85590
//Data da Alteração:  02/05/2019
//Alteração:          Não impedir portabilidade, criticar que participante possui
//                    emprestimo.
//Responsável:        André Imakawa
//******************************************************************************
//Nº SOL:             266932-18049
//Nº KINTANA          1239691
//Data da Alteração:  22/02/2016
//Alteração Form:     ReadOnly = true para campo data demissao
//Responsável:        André Imakawa
//******************************************************************************
//--------------------------------------------------------------------------------
//Pendência   : SOL 242983 PPM 581156
//Responsável : Marcio Sanches Spinosa SOL 242983 PPM 581156
//Data        : 17/11/2014
//Descrição   : Ajuste de erro de versão.
//--------------------------------------------------------------------------------
//Pendência   : SOL 180021 Kintana 1662068
//Responsável : Fernando Xavier
//Data        : 14/05/2012
//Descrição   : Acerto no controle de transação
//--------------------------------------------------------------------------------
//Pendência   : SOL 159941 Kintana 1345690
//Responsável : Douglas.Siqueira
//Data        : 10/05/2012
//Descrição   : Retornar a mensagem: "Participante migrou para o REB. Não é possível conceder resgate no REG/REPLAN" quando a situação do plano for Migrado
//--------------------------------------------------------------------------------
//Pendência   : SOL 172398 Kintana 1553776
//Responsável : Monica da Silva Gonzaga
//Data        : 27/01/2012
//Descrição   : Implementar a query feita para verificação das dívidas de empréstimos no sol 164235.
//--------------------------------------------------------------------------------
//Responsável : Vinicius Ferreira
//Pendência   : SOL 174003 KINTANA 1570355
//Data        : 14/02/2012
//Descrição   : Erro ao tentar conceder mais de um resgate com a tela aberta.
//------------------------------------------------------------------------------
//  Autor      : Marcelo Almeida da Silva
//  Rotina     : Analise de Elegilibidade
//  Data       : 06/10/2010
//  Pendencia  : SOL 136956 - KINTANA 917626
//  Descrição  : Incluir uso da validação de elegibilidade.
//--------------------------------------------------------------------------------
//Responsável : Vinicius Ferreira
//Pendência   : SOL 164235 Kintana 1409163
//Data        : 27/12/2011
//Descrição   : Implementar trava para impedir a concessão de portabilidade ou resgate
//--------------------------------------------------------------------------------
//Pendência   : SOL 151393 Kintana 1138110
//Responsável : BRUNO AZEVEDO
//Data        : 15/02/2011
//Descrição   : Trava no registro do evento verificando a parametrização 115.
//--------------------------------------------------------------------------------
//Pendência   : SOL 148482 Kintana 1043189
//Responsável : FERNANDO XAVIER
//Data        : 03/12/2010
//Descrição   : Erro ao cadastrar resgate judcicial com outro resgate 
//--------------------------------------------------------------------------------
//Pendência   : SOL 133960 Kintana 808133
//Responsável : FERNANDO XAVIER
//Data        : 12/11/2010
//Descrição   : Erro ao cadastrar resgate judcicial com outro resgate 
//--------------------------------------------------------------------------------
//Pendência   : SOL 141651 KINTANA 905060
//Responsável : FERNANDO XAVIER
//Data        : 19/08/2010
//Descrição   : Desabilita o botão ok apos click para que não duplique registro //caso o usuario de um duplo click no botão.
//--------------------------------------------------------------------------------
//Pendência   : SOL 141651 KINTANA 905060
//Responsável : FERNANDO XAVIER
//Data        : 19/08/2010
//Descrição   : Desabilita o botão ok apos click para que não duplique registro //caso o usuario de um duplo click no botão.
//--------------------------------------------------------------------------------
//Pendência   : SOL 135569 KINTANA 807056
//Responsável : BRUNO AZEVEDO
//Data        : 11/05/2010
//Descrição   : Adicionado o componente TConsPart.
//--------------------------------------------------------------------------------
// Autor(a)    : Ádler Souza
// Data        : 15/04/2010
// Rotina      : MoveReserva
// Pendência   : SOL 125426 Kintana 711048
// Descricao   : Criação do campo de Percentual de Retenção.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Daniel Begnami
// Rotina      : Criação do Metodo: AbreRequerParticipLocal
// Data        : 30/06/2009
// Pendência   : 102758 - KINTANA 534.895
// Alteração   : Implementar tela de critica ao usuário nos processos de RESGATE DE CONTRIBUICOES,
//               não obrigando necessariamente o encerramento de beneficio vitalício, conforme demonstrado nas telas em anexo.
// -----------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Rotina      : Varias
// Data        : 16/08/2007
// Pendência   : 19962
// Alteração   : Troca do DateToStr para FormatDateTime.
// -----------------------------------------------------------------------------
//  Autor      : Claudio Faria
//  Rotina     : Variados
//  Data       : 21/09/2006
//  Pendencia  : 23370
//  Descrição  : Incluir o metodo "performSearch" em todas as TwwDBLookupCombo que tem atribuição a uma query
//------------------------------------------------------------------------------
// Rotinas     : bbtnRequerBeneficioClick
// Autor(a)    : Augusto
// Data        : 07/07/2005
// Pendência   : 19429
// Descricao   : Passar para tela de beneficios a Data de Requerimento
//------------------------------------------------------------------------------
// Rotinas     : Tela ( campo Data da Demissão )
// Autor(a)    : Leo
// Data        : 28.07.2004
// Descricao   : separação da gravação da data de cancelamento e demissão
//               pois caso a demissão seja retrotiva, a data de cancelamento não necessariamente segue
//               esta data, caso o participante já estivesse em manutenção, não cancelado no plano.
//------------------------------------------------------------------------------
// Rotinas     : Tela ( campo Data do Evento )
// Autor(a)    : Camille
// Pendência   : 17195
// Data        : 13.07.2004
// Descricao   : Indicar que a data do evento é a data da demissao
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
// Data        : 10/10/2003
// Alteração   : bbtnConfirmarClick
// Pendência   : 14938
// Descrição   : Inclusão da rotina de impressão da carta do evento
//------------------------------------------------------------------------------
// Autor(a)    : Carlos Guedes
// Data        : 30/09/2003
// Pendencia   : 15053
// Rotina      : AtualizaHistFuncPrev
// Descrição   : Acrescentando parametros à função.
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 17/09/2003
// Alteração   : MontaSelect de participante agora pega os desativados (FLGDESATIVADO = 1 ou 0)
//               para que se possa mexer na reserva dos cancelados (FUNCEF-Dennys)
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
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Gleyber
// Data        : 27/11/2002
// Alteração   : Passando a data de demissao para calcular o tempo de serviço.
//------------------------------------------------------------------------------
// Rotina      :
// Autor(a)    : Leo
// Data        : 13/11/2002
// Alteração   : inclusão dos campos VALORBASE4 , VALORBASE5 , VALORBASE6
//------------------------------------------------------------------------------


unit FEventoDemissaoCancel;

interface
                                                                
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc, cmseldlg, URegra, TB97Tlbr, UConsPart, IvDictio, IvMulti,
  IvEMulti, TEdNum, wwdbdatetimepicker, CMDateTimePicker, wwdblook, UAnaliseElegibilidade;

type
  TfrmEventoDemissaoCancel = class(TfrmOkCancelar)
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
    seldlgProcura: TcmSelectDlg;
    qryBfCiarioTitPlan: TwwQuery;
    MontaSelectPart: TMontaSelect;
    qrySitPart: TwwQuery;
    Label13: TLabel;
    dblkpcmbSitPart: TwwDBLookupCombo;
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
    qryEvento: TwwQuery;
    pnlTempoServTotal: TPanel;
    Label4: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    edTempoServTotal: TEditNum;
    edTempoServMes: TEditNum;
    edTempoServDia: TEditNum;
    dtRequerimento: TCMDateTimePicker;
    Label5: TLabel;
    dtDemissao: TCMDateTimePicker;
    Label9: TLabel;
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnRequerBeneficioClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbConsultaBeneficiarioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bbtnOpcoesClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure dtEventoExit(Sender: TObject);
  private
    { Private declarations }
    bEncerrou : boolean; 
    iIdEventoPrev: integer;

    sNumerosProcessos,

    sFlgIntPartAntes, 

    sTipoSitFuncAntes, 
    sIdPessoa, sIdPessJur, sIdPlanoPrev, sSeqProposta: string;
    sIdSitFunc, sIdSitPart, sIdSitPlanoPrev, sTempoServAntReal: string;
    sFlgSitFuncImed, sFlgSitPartImed, sFlgSitPlanoImed: string;
    sFlgEfetivado, sDataEfetivado: string;
    bEfetivado,   // informa se o evento foi efetivado
    bRegistrado,  // informa se o evento foi registrado
    bRequerBenef  // informa se o usuario clicou no botao Requerimento de beneficio
                  : boolean;
    sEstadoEvento : string;
    pIdSitFunc, pIdSitPart, pIdSitPlanoPrev, pTipoSit: string;
    rOpcao1,               rOpcao2,                  rOpcao3,
    rOpcao4,               rOpcao5,                  rOpcao6                  : real;
    procedure VerificaeGravaSituacoes;
    procedure GravaEVENTOSPREV;
    procedure LimpaCampos;
    procedure VerificaEstadoEvento;
    function  ValidarAnaliseElegibilidade : Boolean;
    procedure AnaliseElegibilidadeValidouRegra(ARegraElegibilidade : TValidacaoRegraElegibilidade; var Validou: Boolean);
  public
    { Public declarations }
       pFlgInterno : string;    //Marcio Sanches Spinosa SOL 242983 PPM 581156
    procedure AbreRequerParticipLocal;  // SOL 102758 - KINTANA 534.895 Daniel Begnami

  end;

var
  frmEventoDemissaoCancel: TfrmEventoDemissaoCancel;

  {Evento Definitivo}

implementation

uses
  UAdmPrev, UDataBase, UMensErro, FTelaAut, DBaseDados,
  FMostraContribuicoes, UEventos, 
  FCadOpcoesElegivel, FEventoAposentadoria, FCadRequerBenefParticip,
  UBeneficio, UDotacao, UParticipante, fAguarde, DAPrev, USistema, DDividaEP, UIntegraEP, dEmptmo;

{$R *.DFM}

procedure TfrmEventoDemissaoCancel.FormCreate(Sender: TObject);
begin
  inherited;
  lblPatro.Caption := 'Patrocinadora';
  lblSitPatro.Caption := 'Situação na Patrocinadora';
  lblSitNovaPatro.Caption := 'Nova Situação na Patrocinadora';
  bEncerrou := False; 
end;

procedure TfrmEventoDemissaoCancel.FormShow(Sender: TObject);
begin
  inherited;
  {Vinicius Ferreira SOL 174003 KINTANA 1570355
  InicializaEP; //Vinicius Ferreira SOL 164235 Kintana 1409163}

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
  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
  if not dtmBaseDados.dbBaseDados.InTransaction
  then dtmBaseDados.dbBaseDados.StartTransaction;
  //Marcio Sanches Spinosa SOL 242983 PPM 581156 - Inicio
  if (pFlgInterno = 'DC') then
    sflginterno :=  pFlgInterno;
  //Marcio Sanches Spinosa SOL 242983 PPM 581156 - Fim
end;

procedure TfrmEventoDemissaoCancel.bbtnProcurarClick(Sender: TObject);
var
  xQry: TwwQuery; //BRUNO AZEVEDO SOL KINTANA
  verifdivQry:TwwQuery;//Monica SOLº 172398 
  // Vinicius Ferreira SOL 164235 Kintana 1409163 - Inicio
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
  // Vinicius Ferreira SOL 164235 Kintana 1409163 - Fim
begin
  inherited;
  InicializaEP;// Vinicius Ferreira SOL 174003 KINTANA 1570355

  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '') then
  begin
    bbtnConfirmar.enabled := true; //SOL 141651 KINTANA 905060
    sIdPessoa             := MontaSelectPart.ValoresChave[0];
    sIdPessJur            := MontaSelectPart.ValoresChave[1];
    sIdPlanoPrev          := MontaSelectPart.ValoresChave[2];
    dtDemissao.Text       := MontaSelectPart.ValoresChave[14];
    sIdSitFunc            := MontaSelectPart.ValoresChave[15];
    sIdSitPart            := MontaSelectPart.ValoresChave[16];
    sIdSitPlanoPrev       := MontaSelectPart.ValoresChave[17];
    sSeqProposta          := MontaSelectPart.ValoresChave[19];
    edNome.Text           := MontaSelectPart.ValoresChave[3];
    edMatricula.Text      := MontaSelectPart.ValoresChave[4];
    edPatro.Text          := MontaSelectPart.ValoresChave[5];
    edPlano.Text          := MontaSelectPart.ValoresChave[6];
    edSitPatro.Text       := MontaSelectPart.ValoresChave[7];
    edSitFundacao.Text    := MontaSelectPart.ValoresChave[8];
    edSitPlano.Text       := MontaSelectPart.ValoresChave[9];
    edInscNumero.Text     := MontaSelectPart.ValoresChave[12];
    if MontaSelectPart.ValoresChave[21] <> ''
    then sTempoServAntReal := MontaSelectPart.ValoresChave[21]  
    else sTempoServAntReal := MontaSelectPart.ValoresChave[22]; 

    sTipoSitFuncAntes := MontaSelectPart.ValoresChave[23];      
    sFlgIntPartAntes  := MontaSelectPart.ValoresChave[25];      

    edTempoServTotal.Text  := MontaSelectPart.ValoresChave[24]; 
    edTempoServMES.Text    := MontaSelectPart.ValoresChave[27]; 
    edTempoServDIA.Text    := MontaSelectPart.ValoresChave[28]; 

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
    bbtnOpcoes.enabled := true;

    //BRUNO AZEVEDO SOL 151393 Kintana 1138110
    try
      xQry := TwwQuery.Create(Self);
      xQry.DatabaseName := 'BaseDados';

      with xQry do begin
        Close;
        Sql.Clear;
        Sql.Add('SELECT VALOR FROM PESSOAPARAM');
        Sql.Add(' WHERE IDPESSOA = ' + sIdPessoa);
        Sql.Add('   AND IDPARAM = ''115''');
        Sql.Add('   AND DATAFIM IS NULL '); //Rafael SIG 95620
        Open;

        if (FieldByName('Valor').AsString = 'S') then begin
          MsgDlg('Esse evento não pode ser registrado. Verificar parametrização.','Informação',mtInformation,[mbOk,mbHelp],0);
          LimpaCampos;
          pnlBotao.Enabled := False;
          bbtnConfirmar.Enabled := False;
          bbtnCancelar.Enabled  := False;
          Exit;
        end;
      end;
    finally
      FreeAndNil(xQry);
    end;
    //BRUNO AZEVEDO SOL 151393 Kintana 1138110

    // Vinicius Ferreira SOL 164235 Kintana 1409163 - Inicio
    try
      xQry := TwwQuery.Create(Self);
      xQry.DatabaseName := 'BaseDados';

       with xQry do begin

       Sql.Clear;
       Sql.Add(' SELECT Count(1) Over() AS Qtde , PP.IDPESSOA, PP.IDPARAM, PP.DATAINICIO, PP.DATAFIM, PP.VALOR, ');
       Sql.Add(' PF.DESCRICAO, PF.TIPO, PF.VALIDACAO, PF.LEGENDA,  ');
       Sql.Add(' PF.MSGALERTARRESGATE, PF.FLGALERTARRESGATE, PF.MSGIMPEDEPORTABILIDADE, PF.FLGIMPEDEPORTABILIDADE ');
       Sql.Add(' FROM PESSOAPARAM PP, PARAMFLAGPESSOA PF ');
       Sql.Add(' WHERE  PP.IDPESSOA = ' + sIdPessoa + ' AND  ');
       Sql.Add(' PP.IDPARAM  = PF.IDPARAM AND ');
       //Sql.Add(' sysdate between PP.Datainicio and PP.Datafim AND  ');
       Sql.Add(' sysdate > PP.Datainicio and (sysdate < PP.Datafim or PP.Datafim is null) AND  ');
       Sql.Add(' PF.FLGIMPEDEPORTABILIDADE = 1 ');
       Sql.Add(' ORDER BY PF.DESCRICAO ');
       Open;

       //Monica SOLº 172398 - inicio

     
       verifdivQry := TwwQuery.Create(Self);
       verifdivQry.DatabaseName := 'BaseDados';

           with verifdivQry do begin

           Sql.Clear;
           Sql.Add('SELECT * FROM CONTRATOEMPTMO C WHERE ');
           Sql.Add('C.FLGSITUACAO NOT IN (''Q'', ''C'') AND C.IDBENEF =' + sidpessoa + 'AND C.IDPESSOA =' + sidpessoa +'');
           Open;

           end;



 {  DividaEMP := dtmDividaEP.ValorDevidoMutuario(StrToint(sIdPessoa),
                                              Date,
                                              -1,
                                              10,
                                              fSaldoAtualizado,
                                              fSaldoDevedor,
                                              fParcelasAberto,
                                              False, False );  }
         //Monica SOLº 172398 - fim


        If sIdEventoGerador = '334' then
        begin //Portabilidade

           If xQry.FieldByName('Qtde').AsInteger  > 1 then
           begin
              MsgDlg('Participante possui mais de um parâmetro que impedem portabilidade.', 'Informação',mtInformation,[mbOk],0);
              LimpaCampos;
              pnlBotao.Enabled := False;
              bbtnConfirmar.Enabled := False;
              bbtnCancelar.Enabled  := False;
              Exit;
           end
           else
           begin
              if (xQry.FieldByName('FLGIMPEDEPORTABILIDADE').AsInteger = 1) then begin
                 MsgDlg('' + FieldByName('MSGIMPEDEPORTABILIDADE').AsString + '','Informação',mtInformation,[mbOk],0);
                 LimpaCampos;
                 pnlBotao.Enabled := False;
                 bbtnConfirmar.Enabled := False;
                 bbtnCancelar.Enabled  := False;
                 Exit;
              end;

              //Monica SOLº 172398 - inicio
              if not verifdivQry.isempty then
              begin
                if (xQry.FieldByName('FLGIMPEDEPORTABILIDADE').AsInteger = 0) and (verifdivQry.RecordCount > 0) then
                begin
                  // Andre Imakawa - SIG 85590 - Inicio
                  //MsgDlg('O participante possui dívidas de empréstimo - Impedido de cadastrar portabilidade','Informação',mtInformation,[mbOk],0);
                  if MsgDlg('O participante possui dívidas de empréstimo. Deseja continuar?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then
                  begin
                    LimpaCampos;
                    pnlBotao.Enabled := False;
                    bbtnConfirmar.Enabled := False;
                    bbtnCancelar.Enabled  := False;
                    Exit;
                  end;
                  // Andre Imakawa - SIG 85590 - Fim
                end;

              end;////if not empty


          {
              if (xQry.FieldByName('FLGIMPEDEPORTABILIDADE').AsInteger = 0) and (dtmDividaEP.bExisteDividaValor) then begin
                 MsgDlg('O participante possui dívidas de empréstimo - Impedido de cadastrar portabilidade','Informação',mtInformation,[mbOk],0);
                 LimpaCampos;
                 pnlBotao.Enabled := False;
                 bbtnConfirmar.Enabled := False;
                 bbtnCancelar.Enabled  := False;
                 Exit;
              end;

              if (xQry.FieldByName('FLGIMPEDEPORTABILIDADE').AsInteger = 0) and (dtmDividaEP.bNExisteAtuDiaria) then begin
                 MsgDlg('O participante possui dívidas de empréstimo - Impedido de cadastrar portabilidade','Informação',mtInformation,[mbOk],0);
                 LimpaCampos;
                 pnlBotao.Enabled := False;
                 bbtnConfirmar.Enabled := False;
                 bbtnCancelar.Enabled  := False;
                 Exit;
              end;      }
              //Monica SOLº 172398 - fim


          end
          {if (xQry.FieldByName('FLGIMPEDEPORTABILIDADE').AsInteger = 1) and (DividaEMP = False) and (dtmDividaEP.bExisteDividaValor = False)  then begin
            MsgDlg('' + FieldByName('MSGIMPEDEPORTABILIDADE').AsString + '','Informação',mtInformation,[mbOk],0);
            LimpaCampos;
            pnlBotao.Enabled := False;
            bbtnConfirmar.Enabled := False;
            bbtnCancelar.Enabled  := False;
            Exit;
          end;

          if (xQry.FieldByName('FLGIMPEDEPORTABILIDADE').AsInteger = 1) and (DividaEMP) and (dtmDividaEP.bExisteDividaValor)  then begin
            MsgDlg('' + FieldByName('MSGIMPEDEPORTABILIDADE').AsString + '','Informação',mtInformation,[mbOk],0);
            LimpaCampos;
            pnlBotao.Enabled := False;
            bbtnConfirmar.Enabled := False;
            bbtnCancelar.Enabled  := False;
            Exit;
          end;

          if (xQry.FieldByName('FLGIMPEDEPORTABILIDADE').AsInteger = 1) and (DividaEMP = False) and (dtmDividaEP.bExisteDividaValor) then begin
            MsgDlg('' + FieldByName('MSGIMPEDEPORTABILIDADE').AsString + '','Informação',mtInformation,[mbOk],0);
            LimpaCampos;
            pnlBotao.Enabled := False;
            bbtnConfirmar.Enabled := False;
            bbtnCancelar.Enabled  := False;
            Exit;
          end;

          if (xQry.FieldByName('FLGIMPEDEPORTABILIDADE').AsInteger = 1) and (DividaEMP) and (dtmDividaEP.bExisteDividaValor = False) then begin
            MsgDlg('' + FieldByName('MSGIMPEDEPORTABILIDADE').AsString + '','Informação',mtInformation,[mbOk],0);
            LimpaCampos;
            pnlBotao.Enabled := False;
            bbtnConfirmar.Enabled := False;
            bbtnCancelar.Enabled  := False;
            Exit;
          end;}

        End;

       Sql.Clear;
       Sql.Add(' SELECT Count(1) Over() AS Qtde ,PP.IDPESSOA, PP.IDPARAM, PP.DATAINICIO, PP.DATAFIM, PP.VALOR, ');
       Sql.Add(' PF.DESCRICAO, PF.TIPO, PF.VALIDACAO, PF.LEGENDA,  ');
       Sql.Add(' PF.MSGALERTARRESGATE, PF.FLGALERTARRESGATE, PF.MSGIMPEDEPORTABILIDADE, PF.FLGIMPEDEPORTABILIDADE ');
       Sql.Add(' FROM PESSOAPARAM PP, PARAMFLAGPESSOA PF ');
       Sql.Add(' WHERE  PP.IDPESSOA = ' + sIdPessoa + ' AND  ');
       Sql.Add(' PP.IDPARAM  = PF.IDPARAM AND ');
       //Sql.Add(' sysdate between PP.Datainicio and PP.Datafim AND  ');
       Sql.Add(' sysdate > PP.Datainicio and (sysdate < PP.Datafim or PP.Datafim is null) AND  ');
       Sql.Add(' PF.FLGALERTARRESGATE = 1 ');
       Sql.Add(' ORDER BY PF.DESCRICAO ');
       Open;

        //   Resgate Complementar             Resgate Judicial         Resgate REG/REPLAN SALDADO
        If (sIdEventoGerador = '337') or (sIdEventoGerador = '336') or (sIdEventoGerador = '345') or (sIdEventoGerador = '15') then begin
          If xQry.FieldByName('Qtde').AsInteger  > 1 then
          begin
             if MsgDlg('Participante possui mais de um parâmetro que alertam para resgate. Deseja continuar?',
             'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
             then begin
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
                if MsgDlg('' + FieldByName('MSGALERTARRESGATE').AsString + ' - Deseja continuar ?',
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
                if MsgDlg('Participante possui dívidas de empréstimo - Deseja continuar ?',
                'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then
                     begin
                   LimpaCampos;
                   pnlBotao.Enabled := False;
                   bbtnConfirmar.Enabled := False;
                   bbtnCancelar.Enabled  := False;
                   Exit;
                end;
                   end;
                      end;

            { if (xQry.FieldByName('FLGALERTARRESGATE').AsInteger = 0) and (dtmDividaEP.bExisteDividaValor) then begin
                if MsgDlg('Participante possui dívidas de empréstimo - Deseja continuar ?',
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
                if MsgDlg('Participante possui dívidas de empréstimo - Deseja continuar ?',
                'Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then
                begin
                   LimpaCampos;
                   pnlBotao.Enabled := False;
                   bbtnConfirmar.Enabled := False;
                   bbtnCancelar.Enabled  := False;
                   Exit;
                end;
             end;     }//Monica SOLº 172398 - fim

          end;

        End;

        End;



    finally
      FreeAndNil(xQry);
      FreeAndNil(verifdivQry);
    end;
    // Vinicius Ferreira SOL 164235 Kintana 1409163 - Fim

   {Verifica se o evento já foi registrado}
    VerificaEstadoEvento;


    //SOL 159941 Kintana 1345690    Douglas.Siqueira

   Qryaux.close;
   Qryaux.SQL.clear;
   Qryaux.SQL.Append( '  SELECT * FROM PARTPREVPLAN ');
   Qryaux.SQL.Append( '  WHERE IDPESSOA = '+(sIdPessoa)+' AND ');
   Qryaux.SQL.Append( '  IDPLANOPREV = '+(sIdPlanoPrev)+'  AND ');
   Qryaux.SQL.Append( '  IDSITPLANOPREV IN ');
   Qryaux.SQL.Append( '  (SELECT IDSITPLANOPREV ');
   Qryaux.SQL.Append( '  FROM SITPLANOPREV ');
   Qryaux.SQL.Append( '  WHERE FLGINTERNO = '+#39+'TR'+#39+')');
   Qryaux.Active:=true;

   if not Qryaux.IsEmpty then
      begin
      MsgDlg('Paticipante migrou para o REB. Não é possível conceder resgate no REG/REPLAN.','Erro',mtError,[mbOk,mbHelp],0);
      qryAux.Close;
      TiraSql(qryAux);
      pnlBotao.Enabled := False;
      bbtnConfirmar.Enabled := False;
      bbtnCancelar.Enabled  := False;
      Exit;
      end;

    //SOL 159941 Kintana 1345690 Douglas.Siqueira

    if sEstadoEvento = 'NAO REGISTRADO' then
    begin // Verifica se pode Inserir
       if not PodeRegistrarEvento(qryAux, sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta,
                                  sFlgInterno,sIdSitFunc,sIdSitPart,sIdSitPlanoPrev,sMotivoEvento)
       then begin
          MsgDlg('Esse Evento não pode ser registrado. Motivo : '+sMotivoEvento,'Informação',mtInformation,[mbOk,mbHelp],0);
          LimpaCampos;
          TiraSql(qryAux);

          pnlBotao.Enabled := False;
          bbtnConfirmar.Enabled := False;
          bbtnCancelar.Enabled  := False;
          Exit;
       end;
       bRegistrado := False;
       bEfetivado := False;

       dtEvento.Text             := '';
       dtDemissao.text           := '';
       dblkpcmbSitFunc.Text      := '';
       dblkpcmbSitPlanoPrev.Text := '';
       dblkpcmbSitPart.Text      := '';


       bbtnConfirmar.Enabled := True;
       bbtnCancelar.Enabled  := True;
      
    end
    else  begin
       
       if sEstadoEvento = 'REGISTRADO'
       then begin// Pode Alterar
             MsgDlg('Esse Evento já foi registrado.','Informação',mtInformation,[mbOk,mbHelp],0);
             bRegistrado := True;
             bEfetivado := False;
             bbtnConfirmar.Enabled := True;
             bbtnCancelar.Enabled  := True;
             dtEvento.SetFocus;
          end
             else if (sEstadoEvento = 'EFETIVADO') and ((sIdEventoGerador = '334') or (sIdEventoGerador = '15') or (sIdEventoGerador = '345'))  //SOL 133960 Kintana 808133
               then begin// Não Pode Alterar, nem inserir outro evento
                  MsgDlg('Esse Evento já foi efetivado. Não pode ser alterado.','Informação',mtInformation,[mbOk,mbHelp],0);
                  bRegistrado := True;
                  bEfetivado := True;
                  pnlInformacao.Enabled := False;
                  bbtnConfirmar.Enabled := False;
                  bbtnCancelar.Enabled  := False;

                  edTempoServTotal.Text     := MontaSelectPart.ValoresChave[24];
                  edTempoServMES.Text       := MontaSelectPart.ValoresChave[27]; 
                  edTempoServDIA.Text       := MontaSelectPart.ValoresChave[28]; 

                  dtEvento.Text             := qryEvento.FieldByName('DataEvento').AsString;
                  dtRequerimento.Text       := qryEvento.FieldByName('DATAREQUERIMENTO').AsString;
                   dblkpcmbSitFunc.Text      := qryEvento.FieldByName('NOMESITFUNC').AsString;
                  dblkpcmbSitFunc.PerformSearch;

                  dblkpcmbSitPlanoPrev.Text := qryEvento.FieldByName('NOMESITPLANO').AsString;
                  dblkpcmbSitPlanoPrev.PerformSearch;

                  dblkpcmbSitPart.Text      := qryEvento.FieldByName('NOMESITPART').AsString;
                  dblkpcmbSitPart.PerformSearch;
             end
             else
             begin
                  MsgDlg('O participante já possuí esse evento.','Informação',mtInformation,[mbOk,mbHelp],0);
             end;
       edSitPatro.Text           := qryEvento.FieldByName('NOMESITFUNCANT').AsString;
       edSitPlano.Text           := qryEvento.FieldByName('NOMESITPLANOANT').AsString;
       edSitFundacao.Text        := qryEvento.FieldByName('NOMESITPARTANT').AsString;
       sFlgIntPartAntes          := qryEvento.FieldByName('FLGINTANT').AsString;

       pnlBotao.Enabled          := True;
    end;
    
    if Trim(MontaSelectPart.ValoresChave[14]) <> '' then
      dtDemissao.Text := MontaSelectPart.ValoresChave[14];

    //BRUNO AZEVEDO SOL 136956 KINTANA
    if not(sIdEventoGerador = '15') then //TAES - SIG96688
    begin
      if not(ValidarAnaliseElegibilidade) then
      begin
        if dtmBasedados.dbBaseDados.InTransaction then begin
          dtmBasedados.dbBaseDados.RollBack;
        end;
        LimpaCampos;
        Exit;
      end;
    end;
    //BRUNO AZEVEDO SOL 136956 KINTANA
  end;

  
   if  (montaselectpart.retornouvalor) and (sEstadoEvento = 'NÃO REGISTRADO')  then
     begin
       dblkpcmbSitPlanoPrev.Text:='';
       dblkpcmbSitPart.text:='';
       dblkpcmbSitFunc.Text:='';
     end;

end;

procedure TfrmEventoDemissaoCancel.VerificaEstadoEvento;
begin
   
   with qryEvento do
   begin
      Close;
      ParamByName('FlgInterno').AsString   := sFlgInterno;
      ParamByName('IdPessJur').AsInteger   := StrToInt(sIdPessJur);
      ParamByName('IdPlanoPrev').AsInteger := StrToInt(sIdPlanoPrev);
      ParamByName('IdPessoa').AsInteger    := StrToInt(sIdPessoa);
      ParamByName('SeqProposta').AsInteger := StrToInt(sSeqProposta);
      Open;

      //TAES - SIG98044 - início
      if ((sIdEventoGerador = '15')or(sIdEventoGerador = '334') ) and not(IsEmpty) then // Andre Imakawa - SIG 131531
      begin
        if MsgDlg('Este evento já foi efetivado. Deseja gerar um novo evento?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo then
        begin
          if(FieldByName('FLGEFETIVADO').AsString = '0') then
            sEstadoEvento := 'REGISTRADO'
          else
            sEstadoEvento := 'EFETIVADO';
        end
        else
          sEstadoEvento := 'NAO REGISTRADO';
      //TAES - SIG98044 - fim
      end
      else if (IsEmpty)
      then sEstadoEvento := 'NAO REGISTRADO' // Pode Inserir
      else if FieldByName('FLGEFETIVADO').AsString = '0'
           then begin
              sEstadoEvento := 'REGISTRADO'; // Pode Alterar
              sIdEventoGerador := FieldByName('IDEVENTOGERADOR').AsString;
           end
           else sEstadoEvento := 'EFETIVADO' // Não pode Alterar, nem inserir um novo
   end;

end;

procedure TfrmEventoDemissaoCancel.bbConsultaBeneficiarioClick(Sender: TObject);
begin
  inherited;
  if edNome.Text = '' then
     begin
          MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
          bbtnProcurar.SetFocus;
          Exit;
     end;

 {Consulta}
  qryBfciarioTitPlan.Close;
  qryBfciarioTitPlan.ParamByName('pIdTitular').AsString       := sIdPessoa;
  qryBfciarioTitPlan.ParamByName('pIdPlanoPrev').AsString     := sIdPlanoPrev;
  qryBfciarioTitPlan.ParamByName('pIdPessJur').AsString       := sIdPessJur;
  qryBfciarioTitPlan.ParamByName('pSeqProposta').AsString     := sSeqProposta;
  qryBfciarioTitPlan.ParamByName('pIdEventoGerador').AsString := sIdEventoGerador;
  qryBfciarioTitPlan.Open;

  if qryBfciarioTitPlan.IsEmpty then
     begin
          MsgDlg('Este Participante não possui nenhum Beneficiário. Para Cadastrar um Beneficiário, utilize o Cadastro de Beneficiários.','Informação',mtInformation,[mbOk,mbHelp],0);
          TiraSql(qryAux);
     end;

  seldlgProcura.Execute;
end;

procedure TfrmEventoDemissaoCancel.bbtnRequerBeneficioClick(Sender: TObject);
var sTempoContribuicao, sMsgErro : string;
begin
  inherited;
  if Trim(edNome.Text) = '' then
     begin
          MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
          If bbtnProcurar.CanFocus Then bbtnProcurar.SetFocus;
          Exit;
     end;

  if Trim(dtEvento.Text) = '' then
     begin
          MsgDlg('A Data do Evento deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
          If dtEvento.CanFocus Then dtEvento.SetFocus;
          Exit;
     end;

  if Trim(dtDemissao.Text) = '' then
     begin
          MsgDlg('A Data de Demissão deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
          If dtDemissao.CanFocus Then dtDemissao.SetFocus;
          Exit;
     end;

     if Trim(dblkpcmbSitFunc.Text) = '' then
        begin
             MsgDlg('A Nova Situação do Participante na '+lblPatro.Caption+' deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
             If dblkpcmbSitFunc.CanFocus Then dblkpcmbSitFunc.SetFocus;
             Exit;
        end;

  if Trim(dblkpcmbSitPlanoPrev.Text) = '' then
     begin
          MsgDlg('A Nova Situação do Participante no Plano deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          If dblkpcmbSitPlanoPrev.CanFocus Then dblkpcmbSitPlanoPrev.SetFocus;
          Exit;
     end;

  if Trim(dblkpcmbSitPart.Text) = '' then
     begin
          MsgDlg('A Nova Situação do Participante na Fundação deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          If dblkpcmbSitPart.CanFocus Then dblkpcmbSitPart.SetFocus;
          Exit;
     end;

  
  if (Trim(edTempoServTotal.Text) = '') or (Trim(edTempoServTotal.Text) = '0')
  then begin
     if MsgDlg('O Tempo de Serviço Total não foi informado. Confirma ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
     then begin
        If edTempoServTotal.CanFocus Then edTempoServTotal.SetFocus;
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
                                       dtEvento.Text,
                                       sMsgErro ) then
  begin
     frmAguarde.Apaga;
     MsgDlg(sMsgErro,'Erro',mtError,[mbOk, mbHelp], 0);
     Exit;
  end;
  frmAguarde.Apaga;

  if (not bRequerBenef) and (not bRegistrado)
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


  if not bEfetivado
  then VerificaeGravaSituacoes;

  If (edTempoServTotal.Text <> '0') And (edTempoServTotal.Text <> '') Then
    sTempoContribuicao := edTempoServTotal.Text+' anos ';
  If (edTempoServMes.Text <> '0')   And (edTempoServMes.Text <> '') Then
    sTempoContribuicao := sTempoContribuicao + edTempoServMes.Text+' meses ';
  If (edTempoServDia.Text <> '0')   And (edTempoServDia.Text <> '') Then
    sTempoContribuicao := sTempoContribuicao + edTempoServDia.Text+' dias ';

  AbreRequerParticip('EV', sIdPessoa, sIdPessJur, sIdPlanoPrev,
                     sSeqProposta,dtEvento.Text,'',
                     sIdEventoGerador, '', sNumerosProcessos,
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

end;

procedure TfrmEventoDemissaoCancel.bbtnConfirmarClick(Sender: TObject);
var sMesRef, sMsgErro  : string;
  sProcessosVerificar   : string;
  iNumeroProcesso       : longint;
  bRequereuSoINSS       : boolean;

begin                                 
    // inherited; // SOL 180021 Kintana 1662068
  if not dtmBaseDados.dbBaseDados.InTransaction then
     dtmBaseDados.dbBaseDados.StartTransaction;
	 
  bbtnConfirmar.enabled := false;// SOL 141651 KINTANA 905060
  if Trim(edNome.Text) = '' then
     begin
          MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
          bbtnConfirmar.enabled := true;// SOL 141651 KINTANA 905060
          bbtnProcurar.SetFocus;
          Exit;
     end;

  if Trim(dtEvento.Text) = '' then
     begin
          MsgDlg('A Data do Evento deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          bbtnConfirmar.enabled := true;// SOL 141651 KINTANA 905060
          dtEvento.SetFocus;
          Exit;
     end;

  if Trim(dtDemissao.Text) = '' then
     begin
          MsgDlg('A Data de Demissao deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          bbtnConfirmar.enabled := true;// SOL 141651 KINTANA 905060
          dtDemissao.SetFocus;
          Exit;
     end;

     if Trim(dblkpcmbSitFunc.Text) = '' then
        begin
             MsgDlg('A Nova Situação do Participante na '+lblPatro.Caption+' deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
             bbtnConfirmar.enabled := true;// SOL 141651 KINTANA 905060
             dblkpcmbSitFunc.SetFocus;
             Exit;
        end;

  if Trim(dblkpcmbSitPlanoPrev.Text) = '' then
     begin
          MsgDlg('A Nova Situação do Participante no Plano deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          bbtnConfirmar.enabled := true;// SOL 141651 KINTANA 905060
          dblkpcmbSitPlanoPrev.SetFocus;
          Exit;
     end;

  if Trim(dblkpcmbSitPart.Text) = '' then
     begin
          MsgDlg('A Nova Situação do Participante na Fundação deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          bbtnConfirmar.enabled := true;// SOL 141651 KINTANA 905060
          dblkpcmbSitPart.SetFocus;
          Exit;
     end;


  If Trim(dtRequerimento.Text) = ''
   Then Begin
     MsgDlg('A data do requerimento deve ser preenchida.','Erro',mtError,[mbOk,mbHelp],0);
     bbtnConfirmar.enabled := true;// SOL 141651 KINTANA 905060
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
     bbtnConfirmar.enabled := true;// SOL 141651 KINTANA 905060
     TiraSql(qryAux);
     Exit;
  end;

  if not bEfetivado
  then VerificaeGravaSituacoes;

  GravaEVENTOSPREV;

  // Grava Data de Demissão
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE ELEGPATRO SET DATADEMISSAO = To_Date(''' + Trim(dtDemissao.Text) + ''',''dd/MM/yyyy'')'+
                 ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
                 '       IDPESSOA  = ' + sIdPessoa);
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
       begin
            MostrarErro(E);
            bbtnConfirmar.enabled := true;// SOL 141651 KINTANA 905060
            Exit;
       end;
  end;

  if not AtualizaHistFuncPrev ( qryAux, StrToInt(sIdPessJur), StrToInt(sIdPessoa), '',Trim(dtEvento.Text), sIdEventoGerador )
  //
  then begin
     MsgDlg('Erro ao atualizar histórico funcional. Verifique.','Erro',mtError,[mbOk],0);
     bbtnConfirmar.enabled := true;// SOL 141651 KINTANA 905060
     Exit;
  end;


  // Grava Data de Cancelamento
  qryAux.Close;
  qryAux.Sql.Clear;
  qryAux.Sql.Add(' UPDATE PARTPREVPLAN SET DATACANCELAMENTO  = To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' +
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
            bbtnConfirmar.enabled := true;// SOL 141651 KINTANA 905060
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

  if (not bRegistrado) and (not bRequereuSoINSS )
  then begin
     sMesRef := Copy(dtEvento.Text,7,4)+'/'+Copy(dtEvento.Text,4,2);

     GravaHSTCONTEVENTOSPRFechado(IntToStr(iIdEventoPrev), sIdPlanoPrev, sIdEventoGerador, '',sIdPessoa, sIdPessJur, sSeqProposta, '','',
          dtEvento.text,
          True, qryAux, qryGrava,sIdPlanoPrev);

     if not bEncerrou
     then begin
        if not SuspendeContribuicoes(sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta, sIdEventoGerador, dtDemissao.Text, '',
                                     edMatricula.Text, sIdSitPart, qryAux, qryGrava,sFlgInterno,
                                     sFlgIntPartAntes)
        then begin
           MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
           if dtmBaseDados.dbBaseDados.InTransaction
           then dtmBasedados.dbBaseDados.RollBack;
           LimpaCampos;
           if not dtmBaseDados.dbBaseDados.InTransaction // SOL 180021 Kintana 1662068
           then dtmBaseDados.dbBaseDados.StartTransaction;
           Exit;
        end;
     end;


     if not AssociaNovasContribuicoes(sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta, sIdEventoGerador, dtEvento.Text, '',
                                      edMatricula.Text, qrySitPart.FieldByName('IDSITPART').AsString, '',True,
                                      False,
                                      False,
                                      qryAux, qryGrava,sFlgInterno,iIdEventoPrev,'')
     then begin
        MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
        bbtnConfirmar.enabled := true;
        if dtmBaseDados.dbBaseDados.InTransaction
        then dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        if not dtmBaseDados.dbBaseDados.InTransaction // SOL 180021 Kintana 1662068
        then dtmBaseDados.dbBaseDados.StartTransaction;
        exit;
     end;

     if not ApagaDotacao (StrToInt(sIdPessJur), StrToInt(sIdPlanoPrev), StrToInt(sIdPessoa),
                          StrToInt(sSeqProposta),
                          dtEvento.Text,
                          sMsgErro)
     then begin
        MsgDlg('Erro : '+sMsgErro+'Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
        bbtnConfirmar.enabled := true;
        dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        Exit;
     end;

     if not AbateSalario (StrToInt(sIdPessJur), StrToInt(sIdPlanoPrev), StrToInt(sIdPessoa),
                          StrToInt(sSeqProposta),
                          dtEvento.Text,
                          sMsgErro)
     then begin
        MsgDlg('Erro : '+sMsgErro+'Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
        bbtnConfirmar.enabled := true;
        dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        Exit;
     end;

     MostraContribuicoes(IntToStr(iIdEventoPrev), edNome.Text, edPatro.Text, edPlano.Text);
  end;

  if (not bRequerBenef) and (not bRegistrado)
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
        bbtnConfirmar.enabled := true;
        Exit;
     end;
  end;



    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes('Evento Demissão com Cancelamento') Then
        raise exception.Create('Erro ao gravar Log.')
    Except
       bbtnConfirmar.enabled := true;
    End;


  if dtmBaseDados.dbBaseDados.InTransaction
  then dtmBasedados.dbBaseDados.Commit;
  MsgDlg('Evento efetuado com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);
  LimpaCampos;
  TiraSql(qryAux);
  bRequerBenef := False;
  bbtnConfirmar.enabled := true;

  If Not CartaEvento(sIdPessoa, sIdPessJur, sIdPlanoPrev, sIdEventoGerador, sSeqProposta)
    Then MsgDlg('Carta do evento não emitida.','Informação',mtInformation,[mbOk,mbHelp],0);


  if not dtmBaseDados.dbBaseDados.InTransaction // SOL 180021 Kintana 1662068
  then dtmBaseDados.dbBaseDados.StartTransaction;

  inherited; // SOL 180021 Kintana 1662068

end;

procedure TfrmEventoDemissaoCancel.VerificaeGravaSituacoes;
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
           sDataEfetivado := ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')'; 
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
          qryGrava.Sql.Add(' UPDATE ELEGPATRO SET IDSITFUNC = '+ qrySitFunc.FieldByName('IDSITFUNC').AsString +
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


  if qryAux.FieldByName('FLGSITPLANOIMEDI').AsString  = '1' then
     begin
          sFlgSitPlanoImed := '1';

         {Grava nova Situação do Participante no Plano}
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
  else
     sFlgSitPlanoImed := '0';
end;

procedure TfrmEventoDemissaoCancel.GravaEVENTOSPREV;
begin
   if not bRegistrado
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
                                  sIdPessoa  + ','   + sIdPessJur + ',' + sIdPlanoPrev + ',' + sSeqProposta + ',' +
                                  '''' + sIdSitFunc + '''' + ',' + sIdSitPart + ',' + sIdSitPlanoPrev + ',' +
                                  '''' + qrySitFunc.FieldByName('IDSITFUNC').AsString + '''' + ',' + qrySitPart.FieldByName('IDSITPART').AsString + ',' + qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString + ',' +
                                  sIdEventoGerador + ',' + sFlgSitFuncImed + ',' + sFlgSitPartImed + ',' + sFlgSitPlanoImed + ',' +
                                  sDataEfetivado + ',' + sFlgEfetivado+','+OraNumero(edInscNumero.Text) + ', ' +
                               
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
   end // if not bRegistrado
   else begin
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

procedure TfrmEventoDemissaoCancel.bbtnCancelarClick(Sender: TObject);
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
  end;
  inherited;
end;

procedure TfrmEventoDemissaoCancel.LimpaCampos;
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
  dtDemissao.Text      := '';  
  dblkpcmbSitFunc.Text := '';
  dblkpcmbSitPlanoPrev.Text := '';
  dblkpcmbSitPart.Text := '';
  edTempoServTotal.Text := '';
  edTempoServMES.Text    := '';
  edTempoServDIA.Text    := '';
  dtRequerimento.Text    := '';  

  bbtnProcurar.SetFocus;
  ConsPart1.Enabled := false;
  bbtnOpcoes.enabled := false;    
end;

procedure TfrmEventoDemissaoCancel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with dtmBasedados.dbBaseDados do
     if InTransaction then
        RollBack;
end;

procedure TfrmEventoDemissaoCancel.bbtnOpcoesClick(Sender: TObject);
var bPodeAlterarOpcoes, bOpcoesExistem : boolean;
    cAuxSeparador : char;
begin
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

procedure TfrmEventoDemissaoCancel.bbtnSairClick(Sender: TObject);
begin
   if (bRequerBenef) and (dtmBaseDados.dbBaseDados.InTransaction)
  then begin
     if MsgDlg('O evento ainda não foi confirmado. '+#13+
               'O Requerimento de Benefício será desfeito. '+#13+
               'Deseja realmente sair da tela ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrYes
     then begin
        if not DesfazRequerimentos(qryAux, sNumerosProcessos)
        then begin
           if MsgDlg('Ocorreram erros ao Desfazer os Requerimentos de Benefício. '+
                     'Deseja desfazer apenas o evento ? ', 'Confirmação', mtConfirmation, [mbYes, mbNo, mbHelp], 0) = mrNo
           then Abort;
        end;
     end
     else Abort;
  end;

  inherited;
end;

procedure TfrmEventoDemissaoCancel.dtEventoExit(Sender: TObject);
begin
  inherited;
  
  If Trim(dtRequerimento.Text) = ''
   Then dtRequerimento.Date := dtEvento.Date;
  


  If Trim(dtDemissao.Text) = ''
   Then dtDemissao.Date := dtEvento.Date;
end;

//SOL 102758 - KTN 534.895 Daniel Begnami
procedure TfrmEventoDemissaoCancel.AbreRequerParticipLocal;
var
  sTempoContribuicao : String;
begin

  If (edTempoServTotal.Text <> '0') And (edTempoServTotal.Text <> '') Then
    sTempoContribuicao := edTempoServTotal.Text+' anos ';
  If (edTempoServMes.Text <> '0')   And (edTempoServMes.Text <> '') Then
    sTempoContribuicao := sTempoContribuicao + edTempoServMes.Text+' meses ';
  If (edTempoServDia.Text <> '0')   And (edTempoServDia.Text <> '') Then
    sTempoContribuicao := sTempoContribuicao + edTempoServDia.Text+' dias ';

   AbreRequerParticip('EV', sIdPessoa, sIdPessJur, sIdPlanoPrev,
                     sSeqProposta,dtEvento.Text,'',
                     sIdEventoGerador, '', sNumerosProcessos,
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
// FIM

procedure TfrmEventoDemissaoCancel.AnaliseElegibilidadeValidouRegra(
  ARegraElegibilidade: TValidacaoRegraElegibilidade; var Validou: Boolean);
begin
  if ((ARegraElegibilidade = vrePossui120DiasContadosAPartirDataFatoGerador) and (not(Validou))) then
  begin
    Validou := (MessageDlg('A data de início do afastamento está anterior a 120 dias da data atual.', mtConfirmation, mbOKCancel, 0) = mrOk);
  end;

  if ((ARegraElegibilidade = vreValidarVerificacaoFinanciamentoHabitacional) and (not(Validou))) then
  begin
    Validou := (MessageDlg('Participante possui financiamento habitacional ativo.', mtInformation, [mbOk], 0) = mrOk);
  end;

  if ((ARegraElegibilidade = vreValidarBeneficiosPeculio) and (not(Validou))) then
  begin
    Validou := (MessageDlg('Participante Falecido.', mtConfirmation, mbOKCancel, 0) = mrOk);
  end;
end;

function TfrmEventoDemissaoCancel.ValidarAnaliseElegibilidade: Boolean;
var
  analiseElegibilidade : TAnaliseElegibilidade;
begin
  Result := True;
  if (TAnaliseElegibilidade.LocalizarRegraElegibilidade(sIdEventoGerador, sFlgInterno) in [reElegibilidadePortabilidade, reElegibilidadeResgate]) then
  begin
    analiseElegibilidade := TAnaliseElegibilidade.Create('BaseDados',
                                                         TAnaliseElegibilidade.LocalizarRegraElegibilidade(sIdEventoGerador, sFlgInterno),
                                                         StrToInt(sIdPessoa),
                                                         StrToInt(sIdPlanoPrev),
                                                         StrToInt(sIdEventoGerador),
                                                         Trim(dtEvento.Text),
                                                         Trim(dtRequerimento.Text),
                                                         Trim(sFlgIntPartAntes),
                                                         Trim(sFlgInterno),
                                                         Trim(sIdSitPart),
                                                         Trim(sIdSitPlanoPrev),
                                                         Trim(sIdSitFunc),
                                                         Trim(qrySitPart.FieldByName('IDSITPART').AsString),
                                                         Trim(qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString),
                                                         Trim(qrySitFunc.FieldByName('IDSITFUNC').AsString),
                                                         StrToInt(sIdPessoa),
                                                         StrToInt(sIdPessJur));
    try
      analiseElegibilidade.OnValidouAnaliseElegibilidade := AnaliseElegibilidadeValidouRegra;
      Result := analiseElegibilidade.ValidarRegra();
      if not(Result) then
      begin
        MsgDlg(analiseElegibilidade.MensagemRegrasNaoElegiveis, 'Validação da Analise de Elegibilidade', mtInformation, [mbOk], 0);
      end;
    finally
      FreeAndNil(analiseElegibilidade);
    end;
  end;
end;

end.

