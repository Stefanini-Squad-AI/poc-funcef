// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Marcio Sanches Spinosa
// Data        : 27/06/2013
// Pendência   : SOL 209358 Kintana 2026665
// Alteração   : Atualizar o flgdesativado na tabela partprevplan
// para 1 quando houver cancelamento.
// -----------------------------------------------------------------------------
// Autor(a)    : Renato Visoni
// Pendência   : SOL 116118 KINTANA 547380
// Alteração   : Permitir o cancelamento do REB mesmo com um evento de cancelamento já existente.
// -----------------------------------------------------------------------------
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
//------------------------------------------------------------------------------
// Rotinas     : GravaEVENTOSPREV
// Autor(a)    : Gleyber
// Pendência   : 19457
// Data        : 20/06/2005
// Descricao   : A gravação da data de registro do evento passa a ser a data da
//               inserção do sistema.
//------------------------------------------------------------------------------
// Rotinas     : ExecutaRegra
// Autor(a)    : Augusto
// Pendência   : 17835
// Data        : 05/10/2004
// Descricao   : Novos campos para regra
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
// Data        : 05/02/2003
// Alteração   : bbtnConfirmarClick
// Pendência   : 16048
// Descrição   : Acertando chamadas do frmaguarde.apaga
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
// Autor(a)    : Leo
// Data        : 13/11/2002
// Alteração   : inclusão dos campos VALORBASE4 , VALORBASE5 , VALORBASE6
//------------------------------------------------------------------------------

unit FEventoCancelInicia;

interface                            

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc,   cmseldlg, URegra, TB97Tlbr, UConsPart, IvDictio, IvMulti,
  IvEMulti, wwdbdatetimepicker, CMDateTimePicker, wwdblook;

type
  TfrmEventoCancelInicia = class(TfrmOkCancelar)
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
    qrySitPlanoPrev: TwwQuery;
    pnlInformacao: TPanel;
    Label7: TLabel;
    dblkpcmbSitPlanoPrev: TwwDBLookupCombo;
    qryAux: TwwQuery;
    lblValores: TLabel;
    Label11: TLabel;
    MontaSelectPart: TMontaSelect;
    qryRegra: TwwQuery;
    regCalculo: TRegra;
    qrySitPart: TwwQuery;
    Label12: TLabel;
    dblkpcmbSitPart: TwwDBLookupCombo;
    qryGrava: TwwQuery;
    Panel5: TPanel;
    Label9: TLabel;
    lblSitPatro: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    edInscNumero: TEdit;
    edSitPatro: TEdit;
    edSitPlano: TEdit;
    edSitFundacao: TEdit;
    ConsPart1: TConsPart;
    bbtnOpcoes: TBitBtn;
    Label10: TLabel;
    Label1: TLabel;
    dtEvento: TCMDateTimePicker;
    dtRequerimento: TCMDateTimePicker;
    qryEvento: TwwQuery;
    pnlBotao: TPanel;
    bbtnRequerBeneficio: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnOpcoesClick(Sender: TObject);
    procedure bbtnRequerBeneficioClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    bEncerrou : boolean; 
    iIdEventoPrev: integer;
    sTipoSitFuncAntes,
    sFlgIntPartAntes,
    sNumerosProcessos, 
    sIdPessoa, sIdPessJur, sIdPlanoPrev, sSeqProposta, sInscricaoNumero: string;
    sIdSitFunc, sIdSitPart, sIdSitPlanoPrev: string;
    sResultadoRegra: string;
    sFlgSitFuncImed, sFlgSitPartImed, sFlgSitPlanoImed: string;
    sFlgEfetivado, sDataEfetivado: string;
    bAltera: boolean;
    sEstadoEvento: string;
    rOpcao1,               rOpcao2,                  rOpcao3,
    rOpcao4,               rOpcao5,                  rOpcao6                    : real;

    
    bEfetivado,   // informa se o evento foi efetivado
    bRegistrado,  // informa se o evento foi registrado
    bRequerBenef  : boolean; // informa se o usuario clicou no botao Requerimento de beneficio

    procedure VerificaeGravaSituacoes;
    procedure GravaEVENTOSPREV;
    procedure LimpaCampos;
    function  ExecutaRegra : boolean;
    procedure VerificaEstadoEvento;
    function  VerificaEmprestimoPendente(sIdBenef : string) : boolean;
  public
    { Public declarations }
  end;

var
  frmEventoCancelInicia: TfrmEventoCancelInicia;

{Evento Temporário}

implementation

uses
  UAdmPrev, UDataBase, UMensErro, DBaseDados,
  UMovReserva, FMostraContribuicoes, UEventos, FCadOpcoesElegivel,
  fAguarde, UIntegraBack, UBeneficio, DAPrev, UDotacao, UParticipante,
  FCadRequerBenefParticip, USistema;

{$R *.DFM}


procedure TfrmEventoCancelInicia.FormShow(Sender: TObject);
begin
  inherited;


  qrySitPlanoPrev.Close;
  qrysitPlanoPrev.parambyname('IDEVENTO').AsString := sIdEventoGerador;  
  qrySitPlanoPrev.Open;
  qrySitPart.Close;
  qrysitPart.parambyname('IDEVENTO').AsString := sIdEventoGerador;
  qrySitPart.Open;

  MontaSelectPart.Filtro.Add('PARTPREVPLAN.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')');
  dtmBaseDados.dbBaseDados.StartTransaction;
end;

procedure TfrmEventoCancelInicia.bbtnProcurarClick(Sender: TObject);
begin
  inherited;


  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
          {Carrega Campos}
           sIdPessoa          := MontaSelectPart.ValoresChave[0];
           sIdPessJur         := MontaSelectPart.ValoresChave[1];
           sIdPlanoPrev       := MontaSelectPart.ValoresChave[2];
           sIdSitFunc         := MontaSelectPart.ValoresChave[15];
           sIdSitPart         := MontaSelectPart.ValoresChave[16];
           sIdSitPlanoPrev    := MontaSelectPart.ValoresChave[17];
           sSeqProposta       := MontaSelectPart.ValoresChave[18];
           sInscricaoNumero   := MontaSelectPart.ValoresChave[12];
           edNome.Text        := MontaSelectPart.ValoresChave[3];
           edMatricula.Text   := MontaSelectPart.ValoresChave[4];
           edPatro.Text       := MontaSelectPart.ValoresChave[5];
           edPlano.Text       := MontaSelectPart.ValoresChave[6];
           edSitPatro.Text    := MontaSelectPart.ValoresChave[7];
           edSitFundacao.Text := MontaSelectPart.ValoresChave[8];
           edSitPlano.Text    := MontaSelectPart.ValoresChave[9];
           edInscNumero.Text  := MontaSelectPart.ValoresChave[12];
           sTipoSitFuncAntes  := MontaSelectPart.ValoresChave[19];
           pnlInformacao.Enabled := True;
           bbtnConfirmar.Enabled := True;
           bbtnCancelar.Enabled  := True;
          {Fim - Carrega Campos}

           ConsPart1.sIdPessoa    := sidpessoa;
           ConsPart1.sIdTitular   := sIdPessoa;   
           ConsPart1.sSeqProposta := sseqproposta;
           ConsPart1.sIdPlanoprev := sidplanoprev;
           ConsPart1.DataBaseName := 'BaseDados';
           ConsPart1.sIdPessjur   := sidpessjur;
           ConsPart1.Enabled      := true;
           bbtnOpcoes.enabled     := true;
           pnlBotao.Enabled       := True;

          {Verifica se o evento já foi registrado}
           VerificaEstadoEvento;

           if sEstadoEvento = 'NAO REGISTRADO'
           then begin // Verifica se pode Inserir
              if not PodeRegistrarEvento(qryAux, sIdPessJur, sIdPlanoPrev, sIdPessoa, sSeqProposta,
                                         sFlgInterno,sIdSitFunc,sIdSitPart,sIdSitPlanoPrev,sMotivoEvento)
              then begin
                 MsgDlg('Esse Evento não pode ser registrado. Motivo : '+sMotivoEvento,'Informação',mtInformation,[mbOk,mbHelp],0);
                 pnlBotao.Enabled := False;
                 LimpaCampos;
                 TiraSql(qryAux);
                 exit;
              end;

              bAltera := False;
              bRegistrado := False;
              bEfetivado := False;

              dtRequerimento.Text       :='';
              dtEvento.Text             :='';

              dblkpcmbSitPlanoPrev.Text := '';
              dblkpcmbSitPart.Text      := '';
           end
           else begin
              if sEstadoEvento = 'REGISTRADO'
              then begin// Pode Alterar
                 MsgDlg('Esse Evento já foi registrado.','Informação',mtInformation,[mbOk,mbHelp],0);
                 bAltera     := True;
                 bRegistrado := True;
                 bEfetivado  := False;
                 dtEvento.SetFocus;
              end
              else if sEstadoEvento = 'EFETIVADO'
                   then begin// Não Pode Alterar
                      MsgDlg('Esse Evento já foi efetivado. Não pode ser alterado.','Informação',mtInformation,[mbOk,mbHelp],0);
                      pnlInformacao.Enabled := False;
                      bbtnConfirmar.Enabled := False;
                      bbtnCancelar.Enabled  := False;
                      bRegistrado := True;
                      bEfetivado := True;
                      bAltera    := True; 
                   end;
              
              dtRequerimento.Text       := qryEvento.FieldByName('DATAREQUERIMENTO').AsString;           
              dtEvento.Date             := StrToDate(qryEvento.FieldByName('DataEvento').AsString);
              dblkpcmbSitPlanoPrev.Text := qryEvento.FieldByName('NOMESITPLANO').AsString;
              dblkpcmbSitPlanoPrev.PerformSearch;

              dblkpcmbSitPart.Text      := qryEvento.FieldByName('NOMESITPART').AsString;
              dblkpcmbSitPart.PerformSearch;

              edSitPatro.Text           := qryEvento.FieldByName('NOMESITFUNCANT').AsString;
              edSitPlano.Text           := qryEvento.FieldByName('NOMESITPLANOANT').AsString;
              edSitFundacao.Text        := qryEvento.FieldByName('NOMESITPARTANT').AsString;
              sFlgIntPartAntes          := qryEvento.FieldByName('FLGINTANT').AsString;
              pnlBotao.Enabled          := True;

           end;
      end;
    
     if  montaselectpart.retornouvalor  and (sEstadoEvento <> 'EFETIVADO')then
     begin
       dblkpcmbSitPlanoPrev.Text:='';
       dblkpcmbSitPart.text:='';
     end;                                                
end;

procedure TfrmEventoCancelInicia.VerificaEstadoEvento;
begin

   with qryEvento do
   begin
      Close;
      ParamByName('FlgInterno').AsString   := sFlgInterno;
      ParamByName('IdPessJur').AsInteger   := StrToInt(sIdPessJur);
      ParamByName('IdPlanoPrev').AsInteger := StrToInt(sIdPlanoPrev);
      ParamByName('IdPessoa').AsInteger    := StrToInt(sIdPessoa);
      ParamByName('SeqProposta').AsInteger := StrToInt(sSeqProposta);
      
      ParamByName('INSCRICAONUMERO').AsInteger := StrToInt(sInscricaoNumero);

      Open;


      if IsEmpty
      then sEstadoEvento := 'NAO REGISTRADO' // Pode Inserir
      else if FieldByName('FLGEFETIVADO').AsString = '0'
           then begin
              sEstadoEvento := 'REGISTRADO'; // Pode Alterar
              sIdEventoGerador := FieldByName('IDEVENTOGERADOR').AsString;
           end
           else sEstadoEvento := 'EFETIVADO'; // Não pode Alterar, nem inserir um novo

      // Renato Visoni SOL 116118 KINTANA 547380
      if (StrToInt(sIdPlanoPrev) = 66) and (FieldByname('IDEVENTOGERADOR').asInteger in [1,14]) then begin
        sEstadoEvento := 'NAO REGISTRADO'; // Pode Inserir
      end;
      // Renato Visoni SOL 116118 KINTANA 547380
      
   end;

end;

procedure TfrmEventoCancelInicia.bbtnConfirmarClick(Sender: TObject);
var
  sMesRef, sMsgErro, 
  sIdEvento, sNomeTitular: string;
  bFlgIntContab: boolean;
  dValorDivida : double;
begin
  inherited;

    //Fanuel Marinho SOL171685  Kintana1549656
 if sIdEventoGerador = '14' then
  if VerificaEmprestimoPendente(sIdPessoa) then
     begin
          MsgDlg('Participante possui empréstimo pendente, não é possível efetuar o cancelamento.','Atenção',mtInformation,[mbOk],0);//William Moreira SOL171685  Kintana1549656
          //dblkpcmbSitPart.SetFocus;
          Exit;
     end;
    //Fanuel Marinho SOL171685  Kintana1549656


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

  if not bEfetivado then
  begin
    frmAguarde.Mostra('Verificando elegibilidade ...');

    if not ExecutaRegra then
    begin
      frmAguarde.Apaga;
      Exit;
    end;

    frmAguarde.Apaga; 
  end;

  dValorDivida := 0;
  frmAguarde.Mostra('Verificando dívida previdenciária ...');
  dValorDivida := DividaPrevidenciaria ( qryAux,
                            StrToInt(sIdPessJur),
                            StrToInt(sIdPlanoPrev),
                            StrToInt(sIdPessoa),
                            StrToInt(sSeqProposta),
                            Copy(dtEvento.Text,7,4)+'/'+Copy(dtEvento.Text,4,2));

  if dValorDivida > 0 then
  begin
     frmAguarde.Apaga;

     if MsgDlg('Este participante possui um total de R$ '+FormatFloat('#0.00', dValorDivida)+
               ' de contribuições em aberto. Deseja continuar com o cancelamento ? ','Confirmação',
               mtConfirmation, [mbYes, mbNo],0) = mrNo then
       Exit;
  end;

  frmAguarde.Apaga;

  if not bAltera
  then begin
     frmAguarde.Mostra('Atualizando situações ...');
     VerificaeGravaSituacoes;
     frmAguarde.Apaga; 
  end;

  if not bEfetivado
  then begin
     frmAguarde.Mostra('Registrando evento ...');
     GravaEVENTOSPREV;
     frmAguarde.Apaga;

     frmAguarde.Mostra('Cancelando participante ...');
     qryAux.Close;
     qryAux.Sql.Clear;
     qryAux.Sql.Add(' UPDATE PARTPREVPLAN SET DATACANCELAMENTO = To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' +
                    ' , FLGDESATIVADO = 1 ' + //Marcio Sanches Spinosa SOL 209358 Kintana 2026665
                    ' WHERE IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
                    '       IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
                    '       SEQPROPOSTA = ' + sSeqProposta + ' AND ' +
                    '       IDPESSOA    = ' + sIdPessoa);
     try
        qryAux.ExecSQL;
     except
        on E:EDBEngineError do
        begin
           frmAguarde.Apaga;
           MostrarErro(E);
           Exit;
        end;
     end;
     frmAguarde.Apaga;
  end;

  if not bAltera
  then begin
     // Grava o Histórico de Contribuições por Evento Gerador
     sMesRef := Copy(dtEvento.Text,7,4)+'/'+Copy(dtEvento.Text,4,2);

     frmAguarde.Mostra('Registrando contribuições do evento ...');
     if not GravaHSTCONTEVENTOSPRFechado(IntToStr(iIdEventoPrev), sIdPlanoPrev, sIdEventoGerador, '', sIdPessoa, sIdPessJur, sSeqProposta,  '','',
                 dtEvento.Text,
                 True, qryAux, qryGrava,sIdPlanoPrev)
     then begin
        frmAguarde.Apaga;
        MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
        dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        Exit;
     end;
     frmAguarde.Apaga;

     
     if not bEncerrou
     then begin 
        if not SuspendeContribuicoes( sIdPessJur,
                                      sIdPlanoPrev,
                                      sIdPessoa,
                                      sSeqProposta,
                                      sIdEventoGerador,
                                      dtEvento.Text,
                                      '',
                                      edMatricula.Text,
                                      sIdSitPart,
                                      qryAux,
                                      qryGrava,
                                      sFlgInterno,
                                      sFlgIntPartAntes)
        then begin
           MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
           dtmBasedados.dbBaseDados.RollBack;
           LimpaCampos;
           dtmBaseDados.dbBaseDados.StartTransaction;
           Exit;
        end;
     end;

     frmAguarde.Mostra('Verificando contribuições ...');

     frmAguarde.Apaga; 

     if not ApagaDotacao (StrToInt(sIdPessJur), StrToInt(sIdPlanoPrev), StrToInt(sIdPessoa),
                          StrToInt(sSeqProposta),
                          dtEvento.Text,
                          sMsgErro)
     then begin
        MsgDlg('Erro : '+sMsgErro+'Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
        dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        Exit;
     end;

     frmAguarde.Mostra('Verificando salários ...');
     if not AbateSalario (StrToInt(sIdPessJur), StrToInt(sIdPlanoPrev), StrToInt(sIdPessoa),
                          StrToInt(sSeqProposta),
                          dtEvento.Text,
                          sMsgErro)
     then begin
        frmAguarde.Apaga;
        MsgDlg('Erro : '+sMsgErro+'Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
        dtmBasedados.dbBaseDados.RollBack;
        LimpaCampos;
        dtmBaseDados.dbBaseDados.StartTransaction;
        Exit;
     end;
     frmAguarde.Apaga;

     MostraContribuicoes(IntToStr(iIdEventoPrev), edNome.Text, edPatro.Text, edPlano.Text);

  end;

  frmAguarde.Apaga;

  sIdEvento     := sIdEventoGerador;
  sNomeTitular  := edNome.Text;
  bFlgIntContab := (IntegraBack.Contabilidade = 'S');

    
    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;

  dtmBasedados.dbBaseDados.Commit;
  MsgDlg('Evento efetuado com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);
  bRequerBenef := False;
  LimpaCampos;
  TiraSql(qryAux);

  If Not CartaEvento(sIdPessoa, sIdPessJur, sIdPlanoPrev, sIdEventoGerador, sSeqProposta)
    Then MsgDlg('Carta do evento não emitida.','Informação',mtInformation,[mbOk,mbHelp],0);

  dtmBaseDados.dbBaseDados.StartTransaction;
end;

procedure TfrmEventoCancelInicia.VerificaeGravaSituacoes;
begin
 {Se o Evento não requer Benefício, grava as situações de Imediato, e já grava o evento como efetivado}
  sFlgEfetivado  := '1';
  sDataEfetivado := ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')'; 

  sFlgSitFuncImed  := '1';
  sFlgSitPartImed  := '1';
  sFlgSitPlanoImed := '1';

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
end;

procedure TfrmEventoCancelInicia.GravaEVENTOSPREV;
begin
  if bAltera = False then
     begin
          iIdEventoPrev := LeUltRegistro(qryAux,'EVENTOSPREV');

          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(' INSERT INTO EVENTOSPREV(IDEVENTOSPREV,   DATAREGISTRO,   DATAEVENTO, ' +
                         '                         IDPESSOA,        IDPESSJUR,      IDPLANOPREV,    SEQPROPOSTA, ' +
                         '                         IDSITFUNCATUAL,  IDSITPARTATUAL, IDSITPLANOATUAL, ' +
                         '                         IDSITFUNCNOVO,   IDSITPARTNOVO,  IDSITPLANONOVO,  ' +
                         '                         IDEVENTOGERADOR, FLGSITFUNCIMED, FLGSITPARTIMED, FLGSITPLANOIMED, ' +
                         '                         DATAEFETIVADO,   FLGEFETIVADO, INSCRICAONUMERO, DATAREQUERIMENTO) '  + 
                         ' VALUES(' + IntToStr(iIdEventoPrev)  + ',' + ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')' + ',' + ' To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' + 
                                      sIdPessoa + ','   + sIdPessJur + ',' + sIdPlanoPrev + ',' + sSeqProposta + ',' +
                                      sIdSitFunc  + ',' + sIdSitPart + ','   + sIdSitPlanoPrev + ',' +
                                      sIdSitFunc  + ',' + qrySitPart.FieldbyName('IDSITPART').AsString + ',' + qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString + ',' +
                                      sIdEventoGerador  + ',' + sFlgSitFuncImed + ',' + sFlgSitPartImed + ',' + sFlgSitPlanoImed + ',' +
                                      sDataEfetivado    + ',' + sFlgEfetivado+','+OraNumero(edInscNumero.Text)+ ', ' +
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
  else
     begin
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.Sql.Add(' UPDATE EVENTOSPREV SET DATAALTERADO = To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'')' + ',' + 
                         '                        DATAEVENTO   = To_Date(''' + Trim(dtEvento.Text) + ''',''dd/MM/yyyy'')' + ',' +
                         '                        DATAREQUERIMENTO = TO_DATE(''' + FormatDateTime('dd/mm/yyyy', dtRequerimento.Date) + ''',''DD/MM/YYYY''), ' + 
                         '                        IDSITFUNCATUAL  = ''' + sIdSitFunc + ''',' +
                         '                        IDSITPARTATUAL  = ' + sIdSitPart + ',' +
                         '                        IDSITPLANOATUAL = ' + sIdSitPlanoPrev + ',' +
                         '                        IDSITFUNCNOVO   = ''' + sIdSitFunc + ''',' +
                         '                        IDSITPARTNOVO   = ' + qrySitPart.FieldbyName('IDSITPART').AsString + ',' +
                         '                        IDSITPLANONOVO  = ' + qrySitPlanoPrev.FieldbyName('IDSITPLANOPREV').AsString +
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

function TfrmEventoCancelInicia.ExecutaRegra : boolean;
var
  sMsgErro,
  sIdRegraCancelamento,
  sUltMesPreparo,
  sSQL: string;
begin
  Result := False;
  // Executar Regra de Cancelamento - Passa para a regra os mesmos dados da Regra de Admissão
  sUltMesPreparo := CalcUltMesContribuicao(StrToInt(sIdPessJur),
                                           StrToInt(sIdPlanoPrev),
                                           StrToInt(sIdPessoa),
                                           StrToInt(sSeqProposta),-1,
                                           Copy(Trim(dtEvento.Text),7,4)+'/'+Copy(Trim(dtEvento.Text),4,2),
                                           qryAux);

  frmAguarde.Mostra('Executando Regra de Cancelamento por Desistência ...');

  sSQL := ' SELECT PL.IDREGRADESISTENC, PP.IDPESSOA,          PP.IDPESSJUR,        PP.IDPLANOPREV,              ' +
          '        PP.INSCRICAODATA,    EL.DATADEMISSAO,      PP.DATACANCELAMENTO, '+
          '        PP.SEQPROPOSTA,      EL.IDSITFUNC,         EL.CODCENTROCUSTO,   EL.IDCARGOEXT, EL.MATRICULA, ' +
          '        EL.DATAADMISSAO,     EL.SALTOTAL,          EL.PARTICIPPREVID,   EL.PARTICIPASSIST,     ' +
          '        EL.NIVEL,            EL.TEMPOSERVANTERIOR, PF.DATANASC,         PF.SEXO, PF.DATAMORTE, ' +
          '        PF.ESTCIVIL,         P.NUMDOCUMENTO,       PP.IDSITPART,        PP.IDSITPLANOPREV,     ' +
          '        PP.IDSITPART AS IDSITPARTATUAL,      '+
          '        EL.IDSITFUNC AS IDSITFUNCATUAL,       '+
          '        PP.IDSITPLANOPREV AS IDSITPLANOATUAL, '+
          '        PP.FLGDEVEASSISTENC, PP.FLGDEVEEMPRESTIMO, PP.FLGDEVEPREVIDENC, PL.IDREGRACANCDESC,    ' +  
          ''''+sUltMesPreparo+''' AS ULTMESPREPARO, '+
          '        To_Date(''' + Trim(dtEvento.Text)      + ''',''DD/MM/yyyy'') AS DATAEVENT,  ' +
          '        To_Date(''' + Trim(dtEvento.Text)      + ''',''DD/MM/yyyy'') AS DATAREF,  ' +
          '        To_Date(''' + Trim(dtRequerimento.Text)+ ''',''DD/MM/yyyy'') AS DTREQDESIST, ' +
          
          QuotedStr(sIdEventoGerador) +' AS IDEVENTOGERADOR,         '+
          QuotedStr(dblkpcmbSitPart.LookupValue) +' AS IDSITPARTNOVO '+
          ' FROM PARTPREVPLAN PP, ELEGPATRO EL, PLANPREV PL, PESSOAFISICA PF, PESSOA P ' +
          ' WHERE PP.IDPESSOA    = ' + sIdPessoa    + ' AND ' +
          '       PP.IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
          '       PP.IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
          '       PP.SEQPROPOSTA = ' + sSeqProposta + ' AND ' +
          '       EL.IDPESSOA  = PP.IDPESSOA AND ' +
          '       EL.IDPESSJUR = PP.IDPESSJUR AND ' +
          '       PP.IDPLANOPREV = PL.IDPLANOPREV AND ' +
          '       PP.IDPESSOA = PF.IDPESSOA AND ' +
          '       PP.IDPESSOA = P.IDPESSOA ';
  qryRegra.Close;
  qryRegra.Sql.Clear;
  qryRegra.Sql.Add(sSQL);
  try
     qryRegra.Open;
  except
     on E:EDBEngineError do
     begin
         frmAguarde.Apaga;
         MostrarErro(E);
         sResultadoRegra := 'False';
         Exit;
     end;
  end;

  // Usa o mesmo Form de Evento para [Cancelamento Por Iniciativa do Participante]
  //                                 [Cancelamento Por Descumprimento de Prazo]
  // mas roda Regra diferente

  if sFlgInterno = 'CD' then
     begin
        sIdRegraCancelamento := qryRegra.FieldByName('IDREGRACANCDESC').AsString;  
        sMsgErro             := 'Descumprimento de Prazo Nº ';
     end
  else
     begin
        sIdRegraCancelamento := qryRegra.FieldByName('IDREGRADESISTENC').AsString;
        sMsgErro             := 'Desistência Nº ';
     end;

  if sIdRegraCancelamento = ''
  then begin
     Result := True;
     Exit;
  end;

  regCalculo.QueryIn  := qryRegra;
  regCalculo.RuleName := sIdRegraCancelamento;

  try
     regCalculo.Execute;
  except
     frmAguarde.Apaga;
     MsgDlg('Erro na Execução da Regra de Cancelamento por '+sMsgErro+
            sIdRegraCancelamento,'Informação',mtInformation,[mbOk,mbHelp],0);
     sResultadoRegra := 'False';
     TiraSql(qryAux);
     Exit;
  end;

  frmAguarde.Apaga;

  sResultadoRegra := regCalculo.Result;
  if (UpperCase(sResultadoRegra) <> 'FALSE') and (UpperCase(sResultadoRegra) <> 'TRUE')
  then begin
     Result := False;
     MsgDlg('A Regra de Cancelamento por '+sMsgErro+
            sIdRegraCancelamento+
            ' retornou um resultado inválido. Verifique.','Informação',mtInformation,[mbOk,mbHelp],0);
     TiraSql(qryAux);
     Exit;
  end
  else begin
     if UpperCase(sResultadoRegra) = 'FALSE'
     then begin
        Result := False;
        MsgDlg('A Regra de Cancelamento por '+sMsgErro+
               sIdRegraCancelamento+
               ' não permitiu o cancelamento do participante. Verifique.','Informação',mtInformation,[mbOk,mbHelp],0);
        TiraSql(qryAux);
        Exit;
     end
     else begin
        if MsgDlg(' O participante foi APROVADO pela "Regra de Cancelamento por Desistência". '+#13+
                  ' Confirma o cancelamento do participante ? ','Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes
        then Result := True
        else Result := False;
     end;
  end;
end;

procedure TfrmEventoCancelInicia.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
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

     with dtmBasedados.dbBaseDados do
          if InTransaction then RollBack;

     LimpaCampos;
     dtmBaseDados.dbBaseDados.StartTransaction;
  end;
end;

procedure TfrmEventoCancelInicia.LimpaCampos;
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
  dblkpcmbSitPlanoPrev.Text := '';
  dblkpcmbSitPart.Text := '';
  bbtnProcurar.SetFocus;
  ConsPart1.Enabled := false;
  bbtnOpcoes.enabled := false;    
end;

procedure TfrmEventoCancelInicia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with dtmBasedados.dbBaseDados do
     if InTransaction then
        RollBack;
end;

procedure TfrmEventoCancelInicia.bbtnOpcoesClick(Sender: TObject);
var bPodeAlterarOpcoes, bOpcoesExistem : boolean;
    cAuxSeparador : char;
begin
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

procedure TfrmEventoCancelInicia.bbtnRequerBeneficioClick(Sender: TObject);
var sMsgErro : string; 
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

  if (not bRequerBenef) and (not bRegistrado) then
  begin
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

  if not bEfetivado then
    VerificaeGravaSituacoes;

  AbreRequerParticip('EV', sIdPessoa, sIdPessJur, sIdPlanoPrev,
                     sSeqProposta,dtEvento.Text,'',
                     sIdEventoGerador, '',
                     sNumerosProcessos,
                     sTipoSitFuncAntes,
                     sFlgIntPartAntes,
                     qrySitPart.FieldByName('FlgInterno').AsString,
                     sIdSitPart,
                     sIdSitPlanoPrev,
                     sIdSitFunc,
                     qrySitPart.FieldByName('IdSitPart').AsString,
                     qrySitPlanoPrev.FieldByName('IdSitPlanoPrev').AsString,
                     sIdSitFunc,
                     '', 
                     dtRequerimento.Text); 

  // Mesmo que o evento já esteja efetivado,
  // se o usuario requereu um beneficio, habilitar o ok e o cancelar
  // para que ele possa gravar o beneficio
  bbtnConfirmar.Enabled := True;
  bbtnCancelar.Enabled  := True;

end;

procedure TfrmEventoCancelInicia.bbtnSairClick(Sender: TObject);
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


function TfrmEventoCancelInicia.VerificaEmprestimoPendente(sIdBenef : string) : boolean;
var
qryBuscaContrato : TwwQuery;
begin

   qryBuscaContrato := TwwQuery.Create(nil);
   qryBuscaContrato.DataBaseName := 'BASEDADOS';
   qryBuscaContrato.Close;
   qryBuscaContrato.SQL.Clear;
   qryBuscaContrato.SQL.Add('SELECT * FROM CONTRATOEMPTMO WHERE IDBENEF = '+sIdBenef+' AND FLGSITUACAO NOT IN (''Q'', ''C'')');
   qryBuscaContrato.Open;

   result := qryBuscaContrato.RecordCount > 0 ;
   qryBuscaContrato.Close;
   FreeAndNil(qryBuscaContrato);
end;


procedure TfrmEventoCancelInicia.FormCreate(Sender: TObject);
begin
  inherited;
  bEncerrou := False; 
end;

end.
