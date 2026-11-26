// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Rotinas     : bbtnProcurarClick
// Autor(a)    : Gleyber
// Pendência   : 16427
// Data        : 05/05/2004
// Descricao   : Criacao do campo Data de Requerimento na EVENTOSPREV
//------------------------------------------------------------------------------
// Rotina      : bbtnProcurarClick
// Autor(a)    : Gleyber
// Data        : 25/03/2004
// Pendência   : 16354
// Alteração   : Atribuindo valor à variável sIdTitular do componente ConsPart.
//------------------------------------------------------------------------------
// Autor(a)    : Ricardo Vigorito
// Data        : 15/10/2003
// Pendência   : 15143  - 15145
// Descrição   : Inclusão da chamada da rotina RODAPADRAOMOVRESERVA
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
unit FEventoProrrogacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Buttons, UConsPart, StdCtrls, MAHlpBtn, TB97Tlbr,
  TB97, ExtCtrls, Db, DBTables, Wwquery, MontaSelect, URegra, IvDictio,
  IvMulti, IvEMulti, FOkCancelar, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmEventoProrrogacao = class(TfrmOkCancelar)
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
    Panel3: TPanel;
    ConsPart1: TConsPart;
    bbtnProcurar: TBitBtn;
    Panel5: TPanel;
    Label1: TLabel;
    lblSitPatro: TLabel;
    Label6: TLabel;
    Label14: TLabel;
    edInscNumero: TEdit;
    edSitPatro: TEdit;
    edSitPlano: TEdit;
    edSitFundacao: TEdit;
    Label17: TLabel;
    Label18: TLabel;
    pnlInformacao: TPanel;
    Label10: TLabel;
    Label9: TLabel;
    dtAfastIni: TCMDateTimePicker;
    dtAfastFim: TCMDateTimePicker;
    pnlTempoContrib: TPanel;
    Label13: TLabel;
    Label16: TLabel;
    edTempoContrib: TEdit;
    pnlTempoAfast: TPanel;
    Label7: TLabel;
    Label15: TLabel;
    edTempoAfast: TEdit;
    Panel1: TPanel;
    Label5: TLabel;
    dtAfastFimNov: TCMDateTimePicker;
    Panel4: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    edTempoContribNov: TEdit;
    Panel6: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    edTempoAfastNov: TEdit;
    Label21: TLabel;
    Label4: TLabel;
    MontaSelectPart: TMontaSelect;
    qryAux: TwwQuery;
    qryGrava: TwwQuery;
    regCalculo: TRegra;
    qryRegra: TwwQuery;
    Label22: TLabel;
    edTempoNaoCredAnt: TEdit;
    Label23: TLabel;
    edTempoNaoCredNovo: TEdit;
    dtRequerimento: TCMDateTimePicker;
    Label24: TLabel;
    procedure bbtnProcurarClick(Sender: TObject);
    procedure dtAfastFimNovExit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtAfastIniExit(Sender: TObject);
  private
    { Private declarations }
    sIdPessoa, sIdPessJur, sIdPlanoPrev, sSeqProposta: string;
    sIdSitFunc, sIdSitPart, sIdSitPlanoPrev: string;
    sFlgSitFuncImed, sFlgSitPartImed, sFlgSitPlanoImed: string;
    sFlgEfetivado, sDataEfetivado: string;

    bAltera: boolean;
    sEstadoEvento: string;
    sResultadoRegra, sMensagem: string;

    procedure ExecutaRegraTempoAfast(sDataFinal, sFlgDtNova : string);
  public
    { Public declarations }
  end;

var
  frmEventoProrrogacao: TfrmEventoProrrogacao;

implementation

uses
  UAdmPrev, UDataBase, UMensErro, FTelaAut, DBaseDados, FCadContribParticipante,
  UMovReserva, FMostraContribuicoes, UEventos,
  UFuncoesUteis, FCadOpcoesElegivel, Usistema;

{$R *.DFM}

procedure TfrmEventoProrrogacao.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Filtro[11]     := ' EG.FLGINTERNO IN ' + '(''AF'', ''AR'')';
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
     dtRequerimento.Date := StrToDate(MontaSelectPart.ValoresChave[30]); 

     dtAfastIni.Date    := StrToDate(MontaSelectPart.ValoresChave[27]);
     if Trim(MontaSelectPart.ValoresChave[28]) <> ''
     then dtAfastFim.Date    := StrToDate(MontaSelectPart.ValoresChave[28]);
     edTempoNaoCredAnt.Text  := MontaSelectPart.ValoresChave[29];  

     dtAfastFimNov.Text := dtAfastFim.Text;
     ExecutaRegraTempoAfast(dtAfastFim.Text, '');

     ConsPart1.sIdPessoa    := sidpessoa;
     ConsPart1.sIdTitular   := sIdPessoa;
     ConsPart1.sSeqProposta := sseqproposta;
     ConsPart1.sIdPlanoprev := sidplanoprev;
     ConsPart1.DataBaseName := 'BaseDados';
     ConsPart1.sIdPessjur   := sidpessjur;
     ConsPart1.Enabled      := true;

   end;
end;

procedure TfrmEventoProrrogacao.ExecutaRegraTempoAfast(sDataFinal, sFlgDtNova : string);
var
  sSql, sValorRegra: string;
  liNumDias, liNumMeses, liNumAnos, liTotMeses : longInt;

begin
  if (dtAfastIni.Text = '') or (sDataFinal = '') then
  begin
      MsgDlg('A data de inicio ou data final do evento não foi encontrada.','Informação',mtInformation,[mbOk,mbHelp],0);
      Exit;
  end;

  // Calcular a diferenca entre a data de inicio e a data final em meses
  if not DifDatas(Trim(dtAfastIni.Text),Trim(sDataFinal),
                       liNumDias, liNumMeses, liNumAnos)
  then begin
     MsgDlg('Erro no cálculo do Tempo Total de Afastamento. Verifique se as datas de início e final são válidas.','Erro',mtError,[mbOk,mbHelp],0);
     edTempoAfast.Text := '';
     Exit;
  end
  else begin
     liTotMeses := liNumMeses;

     if sFlgDtNova = '1' then  
        edTempoAfastNov.Text := IntToStr(liTotMeses)
     else
        edTempoAfast.Text    := IntToStr(liTotMeses);

     if sFlgDtNova = '1' then
        edTempoNaoCredNovo.Text := IntToStr((StrToInt(edTempoNaoCredAnt.Text) -  StrToInt(edTempoAfast.Text)) +
                                             StrToInt(edTempoAfastNov.Text) );
  end;

  sResultadoRegra := 'True';

  // Executar Regra de Validação do Tempo de Afastamento
  // Passar para a regra a Data Inicial e Final do Afastamento,
  // e o Tempo Total Acumulado de Afastamento
  sSql := ' SELECT ' + '''' + dtAfastIni.Text + '''' + ' AS DATAINICIOAFAST, ' +
          '''' + dtAfastFim.Text + '''' + ' AS DATAFIMAFAST, ' +
          edTempoAfast.Text+' AS TEMPOAFAST,    '+
          edTempoAfast.Text+' AS TEMPOAFASTADO, '+
          ' NVL(EL.TEMPONAOCREDITADO,0) TEMPONAOCREDITADO, PLP.IDREGRAVALIDAAFA ' + 
          ' FROM  PLANPREVPATRO PLP, ELEGPATRO EL ' +
          ' WHERE PLP.IDPESSJUR   = ' + sIdPessJur   + ' AND '  +
          '       PLP.IDPLANOPREV = ' + sIdPlanoPrev + ' AND '  +
          '       EL.IDPESSJUR    = PLP.IDPESSJUR AND ' +
          '       EL.IDPESSOA     = ' + sIdPessoa;
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

  if qryRegra.FieldByName('IDREGRAVALIDAAFA').AsString = '' then Exit;

  regCalculo.RuleName := qryRegra.FieldByName('IDREGRAVALIDAAFA').AsString;
  regCalculo.QueryIn  := qryRegra;

  try
     regCalculo.Execute;
  except
     MsgDlg('Erro na Execução da Regra de Validação do Tempo de Afastamento.','Informação',mtInformation,[mbOk,mbHelp],0);
     sResultadoRegra := 'False';
     sMensagem       := 'Erro na Execução da Regra de Validação do Tempo de Afastamento.';
     TiraSql(qryAux);
     Exit;
  end;

  sValorRegra := Trim(UpperCase(regCalculo.Result));
  
  if (sValorRegra = 'FALSE') or (sValorRegra = 'FALSO')
  then begin
     MsgDlg('Tempo de Afastamento inválido. ','Informação',mtInformation,[mbOk,mbHelp],0);
     TiraSql(qryAux);
     edTempoAfast.Text := '';
     sResultadoRegra   := 'False';
     sMensagem         := 'Tempo de Afastamento inválido.';
     Exit;
  end;
end;

procedure TfrmEventoProrrogacao.dtAfastFimNovExit(Sender: TObject);
begin
  inherited;
  ExecutaRegraTempoAfast(dtAfastFimNov.Text, '1');
end;

procedure TfrmEventoProrrogacao.bbtnConfirmarClick(Sender: TObject);
VAR
sMsgErro : String;
begin
  inherited;
  if dtAfastFimNov.Text = '' then Exit;
  if sResultadoRegra <> 'True' then
  begin
      MsgDlg('A Regra de validação do afastamento não foi satisfeita.','Informação',mtInformation,[mbOk,mbHelp],0);
      Exit;
  end;

   // Modifica a data final do evento
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' UPDATE ELEGPATRO SET DATAFIMAFAST      = To_Date(''' + Trim(dtAfastFimNov.Text) + ''',''dd/MM/yyyy'')' +
                  '                     ,TEMPONAOCREDITADO =  ''' + edTempoNaoCredNovo.Text +''''+
                  ' WHERE  IDPESSJUR = ' + sIdPessJur + ' AND '   +
                  '        IDPESSOA  = ' + sIdPessoa);
   try
      qryAux.ExecSQL;
   except
      on E:EDBEngineError do
      begin
           MsgDlg('Erro na atualização da data final. Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
           qryAux.Close;
           Exit;
      end;
   end;

   // Grava Data Final de todas as Contribuições Previdenciarias do Participante que serão suspensas
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' UPDATE CONTRIBPREVPARTP SET DATAFINAL = To_Date(''' + Trim(dtAfastFimNov.Text) + ''',''DD/MM/YYYY'')' +
                  ' WHERE  SEQPROPOSTA = ' + sSeqProposta + ' AND ' +
                  '        IDPESSJUR   = ' + sIdPessJur   + ' AND ' +
                  '        IDPLANOPREV = ' + sIdPlanoPrev + ' AND ' +
                  '        IDPESSOA    = ' + sIdPessoa    + ' AND ' +
                  '        FLGCOBRA    = 1 ');
   try
      qryAux.ExecSQL;
   except
      on E:EDBEngineError do
      begin
           MsgDlg('Erro na atualização da data final. Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
           qryAux.Close;
           Exit;
      end;
   end;

   // Gravar nova data final no evento
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' UPDATE EVENTOSPREV SET DATAVOLTA = To_Date(''' + Trim(dtAfastFimNov.Text) + ''',''DD/MM/YYYY'')' +
                  ' WHERE  IDPESSJUR   = ' + sIdPessJur   +
                  ' AND    IDPLANOPREV = ' + sIdPlanoPrev +
                  ' AND    IDPESSOA    = ' + sIdPessoa    +
                  ' AND    SEQPROPOSTA = ' + sSeqProposta +
                  ' AND    IDEVENTOSPREV IN ( SELECT MAX(E.IDEVENTOSPREV) '+
                  '                           FROM EVENTOSPREV E, EVENTOGERADOR EG '+
                  '                           WHERE  E.IDPESSJUR   = ' + sIdPessJur   +
                  '                           AND    E.IDPLANOPREV = ' + sIdPlanoPrev +
                  '                           AND    E.IDPESSOA    = ' + sIdPessoa    +
                  '                           AND    E.SEQPROPOSTA = ' + sSeqProposta +
                  '                           AND    E.IDEVENTOGERADOR = EG.IDEVENTOGERADOR '+
                  '                           AND    EG.FLGINTERNO IN (''AF'',''AR'') ');

   try
      qryAux.ExecSQL;
   except
      on E:EDBEngineError do
      begin
           MsgDlg('Erro na atualização da data final na tabela de eventos. Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
           qryAux.Close;
           Exit;
      end;
   end;

    // Adicionando Log Padrao
    Try
      If Not Sistema.GravaLogOperacoes(Self.Caption) Then
        raise exception.Create('Erro ao gravar Log.')
    Except
    End;
   if not RODAPADRAOMOVRESERVA
        (  StrToInt(sIdPessJur)  ,
           StrToInt(sIdPlanoPrev) ,
           StrToInt(sIdPessoa) ,
           1,
          -1,
          StrToint(sIdEventoGerador),
          StrToInt(sIdPessJur)  ,
          strtoInt(sIdPlanoPrev) ,
          sFlgInterno,
          dtAfastIni.Text,
          sMsgErro,
          -1  ,
           'O',
           ' ' )
        then begin
           MsgDlg('Ocorreu um erro na execução do Padrão de Movimentação de Reserva ['+sMsgErro+']. Verifique.','Erro',mtError,[mbOk,mbHelp],0);
           Exit;
    end;

   MsgDlg('Efetuado com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);
   qryAux.Close;

  If Not CartaEvento(sIdPessoa, sIdPessJur, sIdPlanoPrev, sIdEventoGerador, sSeqProposta)
    Then MsgDlg('Carta do evento não emitida.','Informação',mtInformation,[mbOk,mbHelp],0);

end;

procedure TfrmEventoProrrogacao.FormShow(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Filtro.Add('PP.IDPESSJUR IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO = '+IntToStr(iIdFundacao)+')'); 
end;

procedure TfrmEventoProrrogacao.dtAfastIniExit(Sender: TObject);
begin
  inherited;
  If Trim(dtRequerimento.Text) = ''
   Then dtRequerimento.Date := dtAfastIni.date;
end;

end.



