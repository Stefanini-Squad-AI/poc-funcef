// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
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
//Pendência   : SOL 155058 Kintana 1197225
//Descrição   : Ao clicar no botão OK o sistema não estava fazendo nada.
//------------------------------------------------------------------------------
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
//  Autor      : Claudio Faria
//  Rotina     : Variados
//  Data       : 21/09/2006
//  Pendencia  : 23370
//  Descrição  : Incluir o metodo "performSearch" em todas as TwwDBLookupCombo que tem atribuição a uma query
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
// Autor(a)    : Camille
// Data        : 21.06.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
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

unit FEventoReclusao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc,   cmseldlg, URegra, TB97Tlbr, UConsPart, IvDictio, IvMulti,
  IvEMulti, TEdNum, wwdbdatetimepicker, CMDateTimePicker, wwdblook;

type
  TfrmEventoReclusao = class(TfrmOkCancelar)
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
    bbConsultaBeneficiario: TBitBtn;
    bbtnRequerBeneficio: TBitBtn;
    Label9: TLabel;
    seldlgProcura: TcmSelectDlg;
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
    dtRequerimento: TCMDateTimePicker;
    Label13: TLabel;
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
    procedure ConsPart1Click(Sender: TObject);
  private
    { Private declarations }
    bEncerrou : boolean; 
    iIdEventoPrev: integer;
    iIdCalculo : Integer;

    sNumerosProcessos,
    sIdPessoa, sIdPessJur, sIdPlanoPrev, sSeqProposta: string;
    sFlgIntPartAntes, 
    sIdSitFunc, sIdSitPart, sIdSitPlanoPrev, sTempoServAntReal: string;
    sFlgSitFuncImed, sFlgSitPartImed, sFlgSitPlanoImed: string;
    sFlgEfetivado, sDataEfetivado: string;
    bEfetivado,   // informa se o evento foi efetivado
    bAltera, bRequerBenef: boolean;
    sEstadoEvento: string;
    pIdSitFunc, pIdSitPart, pIdSitPlanoPrev, pTipoSit: string;
    rOpcao1,               rOpcao2,                  rOpcao3,
    rOpcao4,               rOpcao5,                  rOpcao6                  : real;    
    procedure LimpaCampos;
    procedure VerificaeGravaSituacoes;
    procedure GravaEVENTOSPREV;
    procedure VerificaEstadoEvento;
  public
    { Public declarations }
    Msg : String;
  end;

var
  frmEventoReclusao: TfrmEventoReclusao;

{Evento Definitivo}

implementation

uses
  UAdmPrev, UDataBase, UMensErro, FTelaAut, DBaseDados, 
  FMostraContribuicoes, UEventos, UModulo,
  FCadOpcoesElegivel, FCadRequerBenefParticip, FCadRequerBenefBfciario,
  UBeneficio, fAguarde, UParticipante, DAPrev, USistema;

{$R *.DFM}

procedure TfrmEventoReclusao.FormCreate(Sender: TObject);
begin
  inherited;
  lblPatro.Caption := 'Patrocinadora';
  lblSitPatro.Caption := 'Situação na Patrocinadora';
  lblSitNovaPatro.Caption := 'Nova Situação na Patrocinadora';
  bEncerrou := False; 
end;

procedure TfrmEventoReclusao.FormShow(Sender: TObject);
begin
  inherited;
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

  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
  dtmBaseDados.dbBaseDados.StartTransaction;
end;

procedure TfrmEventoReclusao.bbtnProcurarClick(Sender: TObject);
begin
  //Otacilio Aquino SOL 160863 Kintana 1381911
  if uBeneficio.bGravaEvento then
  begin
     MsgDlg('Evento em aberto confirme "OK" ou "Cancelar" para fazer nova procura.', 'Evento', mtInformation, [mbok], 0);
     Abort;;
  end;
  
  inherited;
  Msg := '';
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
     edInscNumero.Text  := MontaSelectPart.ValoresChave[12];
     if MontaSelectPart.ValoresChave[21] <> ''
     then sTempoServAntReal := MontaSelectPart.ValoresChave[21]
     else sTempoServAntReal := MontaSelectPart.ValoresChave[22];
     edTempoServTotal.Text  := MontaSelectPart.ValoresChave[23];

     sFlgIntPartAntes       := MontaSelectPart.ValoresChave[24]; 

     edTempoServMES.Text    := MontaSelectPart.ValoresChave[25]; 
     edTempoServDIA.Text    := MontaSelectPart.ValoresChave[26]; 

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

     //  Verifica se o evento já foi registrado
     VerificaEstadoEvento;

     if sEstadoEvento = 'NAO REGISTRADO'
     then  begin // Verifica se pode Inserir
       if not PodeRegistrarEvento(qryAux, sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta,
                                  sFlgInterno,sIdSitFunc,sIdSitPart,sIdSitPlanoPrev,sMotivoEvento)
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

        if dblkpcmbSitFunc.LookupTable.RecordCount >= 1
        then dblkpcmbSitFunc.Text      := dblkpcmbSitFunc.LookupTable.fieldbyname('descricao').asString
        else dblkpcmbSitFunc.Text      := '';
        dblkpcmbSitFunc.PerformSearch;

        if dblkpcmbSitPart.LookupTable.RecordCount >= 1
        then dblkpcmbSitPart.Text      := dblkpcmbSitPart.LookupTable.fieldbyname('descricao').asString
        else dblkpcmbSitPart.Text      := '';
        dblkpcmbSitPlanoPrev.PerformSearch;

        if dblkpcmbSitPlanoPrev.LookupTable.RecordCount >= 1
        then dblkpcmbSitPlanoPrev.Text := dblkpcmbSitPlanoPrev.LookupTable.fieldbyname('descricao').asString
        else dblkpcmbSitPlanoPrev.Text := '';
        dblkpcmbSitPart.PerformSearch;
        
       // dtEvento.SetFocus;
     end
     else begin
        if sEstadoEvento = 'REGISTRADO'
        then begin // Pode Alterar
           MsgDlg('Esse Evento já foi registrado.','Informação',mtInformation,[mbOk,mbHelp],0);
           bAltera := True;
           bEfetivado := False;
           dtEvento.SetFocus;

           pnlBotao.Enabled := True;
           bbtnConfirmar.Enabled := True;
           bbtnCancelar.Enabled  := True;
        end
        else if sEstadoEvento = 'EFETIVADO'
             then begin // Não Pode Alterar, nem inserir outro evento
                 MsgDlg('Esse Evento já foi efetivado. Não pode ser alterado.','Informação',mtInformation,[mbOk,mbHelp],0);
                 bAltera := True; 
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

  if not dtmBaseDados.dbBaseDados.InTransaction then
  dtmBaseDados.dbBaseDados.StartTransaction;

  if  montaselectpart.retornouvalor then
     begin
       dblkpcmbSitPlanoPrev.Text:='';
       dblkpcmbSitPart.text:='';
       dblkpcmbSitFunc.TexT:='';
     end;
end;



procedure TfrmEventoReclusao.VerificaEstadoEvento;
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

procedure TfrmEventoReclusao.bbConsultaBeneficiarioClick(Sender: TObject);
begin
  inherited;
  if edNome.Text = '' then
     begin
          MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
          bbtnProcurar.SetFocus;
          Exit;
     end;

  // Consulta
  qryBfciarioTitPlan.Close;
  qryBfciarioTitPlan.ParamByName('pIdTitular').AsString       := sIdPessoa;
  qryBfciarioTitPlan.ParamByName('pIdPlanoPrev').AsString     := sIdPlanoPrev;
  qryBfciarioTitPlan.ParamByName('pIdPessJur').AsString       := sIdPessJur;
  qryBfciarioTitPlan.ParamByName('pSeqProposta').AsString     := sSeqProposta;
  qryBfciarioTitPlan.ParamByName('pIdEventoGerador').AsString := sIdEventoGerador;
  qryBfciarioTitPlan.Open;

  seldlgProcura.Execute;
end;

procedure TfrmEventoReclusao.bbtnRequerBeneficioClick(Sender: TObject);
var sMsgErro, sIddependente : string;
begin
  inherited;

  if Trim(edNome.Text) = '' then
     begin
          MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
          bbtnProcurar.SetFocus;
          Exit;
     end;

  if Trim(dtEvento.Text) = '' then
     begin
          MsgDlg('A Data do Evento deve ser informada antes desta operação.','Erro',mtError,[mbOk,mbHelp],0);
          dtEvento.SetFocus;
          Exit;
     end;

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


  if (Trim(edTempoServTotal.Text) = '') or (Trim(edTempoServTotal.Text) = '0')
  then begin
     if MsgDlg('O Tempo de Serviço Total não foi informado. Confirma ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
     then begin
        edTempoServTotal.SetFocus;
        Exit;
     end;
  end;

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

  if not bEfetivado
  then VerificaeGravaSituacoes;

  // SOL 141078 KINTANA 888253
  sIddependente := '';
  with qryAux do
  begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT IDPESSOA FROM CM.DEPENTIT '+
             ' WHERE IDPESSOA <> IDTITULAR '+
             ' AND   MATRICULA  =  '+edMatricula.text );
     Open;
     while eof do begin
        if sIddependente <> '' then
           sIddependente := sIddependente +','+ FieldByName('IDPESSOA').AsString
        else
           sIddependente := FieldByName('IDPESSOA').AsString;
        next;
     end;

     Close;
     SQL.Clear;
     SQL.Add(' SELECT FLGCONTAPREF FROM CM.CONTABANCARIA  '+
             ' WHERE  FLGCONTAPREF = 1 '+
             ' AND    IDPESSOA     IN ( '+sIddependente   +')');
     Open;
     if IsEmpty
     then begin
        Msg := 'Conta preferencial não cadastrada!';
     end;

     Close;
     SQL.Clear;
     SQL.Add(' SELECT NUMDOCUMENTO FROM CM.PESSOA  '+
             ' WHERE  NUMDOCUMENTO IS NOT NULL '+
             ' AND    IDPESSOA     IN ( '+sIddependente   +')');
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
             ' AND    IDPESSOA        IN ('+sIddependente   +')');
     Open;
     if IsEmpty
     then begin
        if Msg <> '' then
           Msg := Msg + chr(13) + 'Participante/Pensionista sem Opção de Imposto de Renda!'
        else
           Msg := 'Participante/Pensionista sem Opção de Imposto de Renda!';
     end;

  if Msg <> '' then
     MsgDlg(Msg,'Informação',mtInformation,[mbOk],0);
     exit;
  end;


  // SOL 141078 KINTANA 888253

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
                     iIdCalculo );

  // Mesmo que o evento já esteja efetivado,
  // se o usuario requereu um beneficio, habilitar o ok e o cancelar
  // para que ele possa gravar o beneficio
  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled  := True;
end;

procedure TfrmEventoReclusao.bbtnConfirmarClick(Sender: TObject);
var sMsgErro : string;
  sProcessosVerificar   : string;
  iNumeroProcesso       : longint;
  bRequereuSoINSS       : boolean;

begin
  inherited;
  if Msg <> '' then
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

  if Trim(dtEvento.Text) = '' then
     begin
          MsgDlg('A Data do Evento deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          dtEvento.SetFocus;
          Exit;
     end;

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

     if not bEncerrou
     then begin 
        if not SuspendeContribuicoes(sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta, sIdEventoGerador, dtEvento.Text, '',
                                          edMatricula.Text, sIdSitPart, qryAux, qryGrava,
                                          sFlgInterno, sFlgIntPartAntes) 
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
                                      '',True,
                                      False, 
                                      False,
                                      qryAux, qryGrava,sFlgInterno,iIdEventoPrev,'')
     then begin
        MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
        if dtmBasedados.dbBaseDados.InTransaction
        then dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
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
                                      True,
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
  
  Try
    If Not Sistema.GravaLogOperacoes('Evento Reclusão') Then
      raise exception.Create('Erro ao gravar Log.')
  Except
  End;

  if dtmBasedados.dbBaseDados.InTransaction then
  dtmBasedados.dbBaseDados.Commit;
  MsgDlg('Evento efetuado com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);

  If Not CartaEvento(sIdPessoa, sIdPessJur, sIdPlanoPrev, sIdEventoGerador, sSeqProposta)
    Then MsgDlg('Carta do evento não emitida.','Informação',mtInformation,[mbOk,mbHelp],0);

  LimpaCampos;
  TiraSql(qryAux);
  bRequerBenef := False;

  dtmBaseDados.dbBaseDados.StartTransaction;

  //Otacilio Aquino SOL 160863 Kintana 1381911
  uBeneficio.bGravaEvento := False;
end;

procedure TfrmEventoReclusao.VerificaeGravaSituacoes;
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
                           '     IDSITPART      = ' + qrySitPart.FieldByName('IDSITPART').AsString +  
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

procedure TfrmEventoReclusao.GravaEVENTOSPREV;
Var
  sIdCalculo : String;
begin

  If ( iIdCalculo > 0 )
  Then sIdCalculo  := IntToStr( iIdCalculo )
  Else sIdCalculo := 'NULL';

  if bAltera = False then
     begin
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

                         ' VALUES(' + IntToStr(iIdEventoPrev) + ',' + ' To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')' + ',' + ' To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
                                      sIdPessoa + ',' + sIdPessJur + ',' + sIdPlanoPrev + ',' + sSeqProposta + ',' +
                                      '''' + sIdSitFunc + '''' + ',' + sIdSitPart + ',' + sIdSitPlanoPrev + ',' +
                                      '''' + qrySitFunc.FieldbyName('IDSITFUNC').AsString + '''' + ',' +
                                             qrySitPart.FieldByName('IDSITPART').AsString + ','  +  
                                             qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString + ',' +
                                      sIdEventoGerador + ',' + sFlgSitFuncImed + ',' + sFlgSitPartImed + ',' + sFlgSitPlanoImed + ',' +
                                      sDataEfetivado + ',' + sFlgEfetivado +','+OraNumero(edInscNumero.Text)+ ', ' +
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
  else
     begin
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.Sql.Add(' UPDATE EVENTOSPREV SET DATAALTERADO = To_Date(''' + DateToStr(Date) + ''',''dd/MM/yyyy'')' + ',' +
                         '                        DATAEVENTO   = To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
                         '                        DATAREQUERIMENTO = TO_DATE(''' + DateToStr(dtRequerimento.Date) + ''',''DD/MM/YYYY''), ' + 
                         '                        IDSITFUNCATUAL  = ''' + sIdSitFunc + ''',' +
                         '                        IDSITPARTATUAL  = ' + sIdSitPart + ',' +
                         '                        IDSITPLANOATUAL = ' + sIdSitPlanoPrev + ',' +
                         '                        IDSITFUNCNOVO   = ''' + qrySitFunc.FieldbyName('IDSITFUNC').AsString + ''',' +
                         '                        IDSITPARTNOVO   = '   + qrySitPart.FieldByName('IDSITPART').AsString + ','   +  
                         '                        IDSITPLANONOVO  = '   + qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString + ' , ' +
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

procedure TfrmEventoReclusao.bbtnCancelarClick(Sender: TObject);
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

procedure TfrmEventoReclusao.LimpaCampos;
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
  edTempoServTotal.Text := '';
  edTempoServMES.Text    := '';
  edTempoServDIA.Text    := '';
  dtRequerimento.Text    := '';  

  dblkpcmbSitFunc.Text := '';
  dblkpcmbSitPlanoPrev.Text := '';
  dblkpcmbSitPart.Text      := '';
  bbtnProcurar.SetFocus;
  ConsPart1.Enabled := false;
  bbtnOpcoes.enabled := false;    
end;

procedure TfrmEventoReclusao.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TfrmEventoReclusao.bbtnOpcoesClick(Sender: TObject);
var bPodeAlterarOpcoes, bOpcoesExistem : boolean;
    cAuxSeparador : char;
begin
  //Otacilio Aquino SOL 160863 Kintana 1381911
  if uBeneficio.bGravaEvento then
  begin
     MsgDlg('Evento em aberto confirme "OK" ou "Cancelar".', 'Evento', mtInformation, [mbok], 0);
     Abort;
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

procedure TfrmEventoReclusao.bbtnSairClick(Sender: TObject);
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

procedure TfrmEventoReclusao.dtEventoExit(Sender: TObject);
begin
  inherited;

  If Trim(dtRequerimento.Text) = ''
   Then dtRequerimento.Date := dtEvento.Date;
end;



procedure TfrmEventoReclusao.ConsPart1Click(Sender: TObject);
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