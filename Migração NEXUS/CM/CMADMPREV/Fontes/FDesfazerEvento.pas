// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//  Autor      : Claudio Faria
//  Rotina     : Varias
//  Data       : 16/08/2007
//  Pendencia  : 19962
//  Descrição  : Troca do DateToStr para FormatDateTime.
//------------------------------------------------------------------------------
//  Autor      : Camille
//  Rotina     : Tela
//  Data       : 21.07.2004
//  Pendencia  : ------
//  Descrição  : Padronizacao da tela com a tela de eventos
//------------------------------------------------------------------------------

unit FDesfazerEvento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, MontaSelect,
  Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery, Wwdatsrc,   cmseldlg, TB97Tlbr, IvDictio, IvMulti, IvEMulti,
  wwdbdatetimepicker, CMDateTimePicker, UConsPart;

type
  TfrmDesfazerEvento = class(TfrmOkCancelar)
    pnlInformacao: TPanel;
    qryAux: TwwQuery;
    Label10: TLabel;
    dtVolta: TCMDateTimePicker;
    Label11: TLabel;
    Panel3: TPanel;
    bbtnProcurar: TBitBtn;
    pnlSitAntes: TPanel;
    qryGrava: TwwQuery;
    MontaSelectPart: TMontaSelect;
    qryUltEventoGerador: TwwQuery;
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
    Label4: TLabel;
    lblSitPatro: TLabel;
    Label5: TLabel;
    Label14: TLabel;
    edInscNumero: TEdit;
    edSitPatro: TEdit;
    edSitPlano: TEdit;
    edSitFundacao: TEdit;
    Label9: TLabel;
    Label1: TLabel;
    edDataEvento: TEdit;
    Label6: TLabel;
    edSitFuncDepois: TEdit;
    Label7: TLabel;
    edSitPlanoDepois: TEdit;
    Label12: TLabel;
    edSitPartDepois: TEdit;
    Label13: TLabel;
    edDataRegistro: TEdit;
    ConsPart1: TConsPart;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnProcurarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    sFlgIntEvento, 
    sFlgIntSitPart,
    sIdPessoa,
    sIdPessJur,
    sIdPlanoPrev,
    sIdEventoGerador,
    sIdEventosPrev,  // ID DA EVENTOSPREV DO EVENTO QUE ESTÁ SENDO TERMINADO
    sIdBenefEventoAnterior,
    sIdRegraBenefAnterior,
    sIdRegraResgAnterior,
    sIdEventoGeradorAnterior, // ID DA EVENTOSPREV DO EVENTO PARA O QUAL O PARTICIPANTE ESTÁ VOLTANDO
    sIdEventosPrevAnterior    // ID DO EVENTOGERADOR DO EVENTO PARA O QUAL O PARTICIPANTE ESTÁ VOLTANDO
                               : string;
    sIdSitPartNovo, sIdSitFuncAtual, sIdSitPlanoAtual, sIdSitPartAtual, sSeqProposta : string;
    bErro : boolean;

    procedure LimpaCampos;
    function  RetornarDoEvento : boolean;    
  public
    { Public declarations }
  end;

var
  frmDesfazerEvento: TfrmDesfazerEvento;

{Evento Definitivo}

implementation

uses
  UAdmPrev, UDataBase, UMensErro, UEventos, DBaseDados;

{$R *.DFM}

procedure TfrmDesfazerEvento.FormShow(Sender: TObject);
begin
  inherited;
  LimpaCampos;
end;

procedure TfrmDesfazerEvento.bbtnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Executar;

  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '')
  then begin
     sIdPessoa                  := MontaSelectPart.ValoresChave[0];
     sIdPessJur                 := MontaSelectPart.ValoresChave[1];
     sIdPlanoPrev               := MontaSelectPart.ValoresChave[2];
     sSeqProposta               := '1';
     edNome.Text                := MontaSelectPart.ValoresChave[3];
     edPatro.Text               := MontaSelectPart.ValoresChave[5];
     edPlano.Text               := MontaSelectPart.ValoresChave[6];
     edSitPatro.Text            := MontaSelectPart.ValoresChave[7];
     edSitFundacao.Text         := MontaSelectPart.ValoresChave[8];
     edSitPlano.Text            := MontaSelectPart.ValoresChave[9];
     edInscNumero.Text          := MontaSelectPart.ValoresChave[12];
     edMatricula.Text           := MontaSelectPart.ValoresChave[4];



     ConsPart1.sIdPessoa    := sidpessoa;
     ConsPart1.sIdTitular   := sIdPessoa;
     ConsPart1.sSeqProposta := sseqproposta;
     ConsPart1.sIdPlanoprev := sidplanoprev;
     ConsPart1.DataBaseName := 'BaseDados';
     ConsPart1.sIdPessjur   := sidpessjur;
     ConsPart1.Enabled      := true;

     // Procurar o Ultimo Evento Gerador da pessoa
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT MAX(EP.IDEVENTOSPREV) AS IDEVENTOSPREV '+
                    ' FROM   EVENTOSPREV EP '+
                    ' WHERE  EP.IDPLANOPREV = '+sIdPlanoPrev+
                    ' AND    EP.IDPESSOA       = '+sIdPessoa+
                    ' AND    EP.IDPESSJUR      = '+sIdPessJur);
     qryAux.Open;
     if (qryAux.IsEmpty) OR (qryAux.FieldByName('IdEventosPrev').AsString = '')
     then begin
        MsgDlg('Nenhum evento foi encontrado para este participante. Verifique. ','Informação',mtInformation,[mbOk,mbHelp],0);
        LimpaCampos;
        Exit;
     end;

     sIdEventosPrev := qryAux.FieldByName('IdEventosPrev').AsString;

     qryAux.Close;

     // SELECIONA O ULTIMO EVENTO GERADOR E SUA SITUACÃO
     qryultEventoGerador.Close;
     qryultEventoGerador.ParamByName('IDEVENTOSPREV').AsInteger := strtoint(sIdEventosPrev);
     qryultEventoGerador.Open;
     if qryUltEventoGerador.IsEmpty
     then  begin
        MsgDlg('Nenhum evento foi encontrado para este participante. Verifique. ','Informação',mtInformation,[mbOk,mbHelp],0);
        LimpaCampos;
        Exit;
     end;

     // Procurar o Penultimo Evento Gerador da pessoa
     qryAux.Close;
     qryAux.SQL.Clear;
     qryAux.SQL.Add(' SELECT IDEVENTOGERADOR, IDBENEFICIO,IDREGRARESGATE,IDREGRACALCBENEF, '+
                    '        MAX(EP.IDEVENTOSPREV) AS IDEVENTOSPREV '+
                    ' FROM   EVENTOSPREV EP '+
                    ' WHERE  EP.IDPLANOPREV    = '+sIdPlanoPrev+
                    ' AND    EP.IDPESSOA       = '+sIdPessoa+
                    ' AND    EP.IDPESSJUR      = '+sIdPessJur+
                    ' AND    EP.IDEVENTOSPREV  <> '+sIdEventosPrev+
                    ' GROUP BY IDEVENTOGERADOR, IDBENEFICIO,IDREGRARESGATE,IDREGRACALCBENEF');
     qryAux.Open;
     if (qryAux.IsEmpty) OR (qryAux.FieldByName('IdEventosPrev').AsString = '')
     then begin
       sIdEventoGeradorAnterior := '-1';
       sIdEventosPrevAnterior   := '-1';
       sIdBenefEventoAnterior   := '-1';
       sIdRegraBenefAnterior    := '-1';
       sIdRegraResgAnterior     := '-1';
     end
     else begin
       sIdEventoGeradorAnterior := qryAux.FieldByName('IdEventoGerador').AsString;
       sIdEventosPrevAnterior   := qryAux.FieldByName('IdEventosPrev').AsString;
       sIdBenefEventoAnterior   := qryAux.FieldByName('IDBENEFICIO').AsString;
       sIdRegraBenefAnterior    := qryAux.FieldByName('IDREGRACALCBENEF').AsString;
       sIdRegraResgAnterior     := qryAux.FieldByName('IDREGRARESGATE').AsString;
     end;

     sIdEventoGerador           := qryUltEventogerador.FieldByName('IdEventoGerador').AsString;
     sFlgIntEvento              := qryUltEventogerador.FieldByName('FlgInterno').AsString;
     sFlgIntSitPart             := qryUltEventogerador.FieldByName('FlgIntSitPart').AsString;

     edDataEvento.Text          := qryUltEventogerador.FieldByName('DataEvento').AsString;
     edDataRegistro.Text        := qryUltEventogerador.FieldByName('DataRegistro').AsString;
     edSitFuncDepois.Text       := qryUltEventogerador.FieldByName('DESCSITFUNC').AsString;
     edSitPartDepois.Text       := qryUltEventogerador.FieldByName('DESCSITPART').AsString;
     edSitPlanoDepois.Text      := qryUltEventogerador.FieldByName('DESCSITPLANOPREV').AsString;
     sIdSitPlanoAtual           := qryUltEventogerador.FieldByName('IDSITPLANOATUAL').AsString;
     sIdSitFuncAtual            := qryUltEventogerador.FieldByName('IDSITFUNCATUAL').AsString;
     sIdSitPartAtual            := qryUltEventogerador.FieldByName('IDSITPARTATUAL').AsString;
     sIdSitPartNovo             := qryUltEventogerador.FieldByName('IDSITPARTNOVO').AsString;
  end;

  if (sFlgIntEvento = 'DM') or (sFlgIntEvento = 'AF') or (sFlgIntSitPart = 'MA')
  then begin
     MsgDlg('Este participante entrou em manutenção. Caso deseje retorná-lo para ativo, '+#13+
            'utilize um evento da categoria "Retorno de Mantido para Ativo".','Erro',mtError,[mbOk,mbHelp],0);
     dtVolta.Text := '';
  end;

end;

procedure TfrmDesfazerEvento.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  bErro := False;

  if (sFlgIntEvento = 'DM') or (sFlgIntEvento = 'AF') or (sFlgIntSitPart = 'MA')
  then begin
     MsgDlg('Este participante entrou em manutenção. Caso deseje retorná-lo para ativo, '+#13+
            'utilize um evento da categoria "Retorno de Mantido para Ativo".','Erro',mtError,[mbOk,mbHelp],0);
     dtVolta.Text := '';
     Exit;
  end;

  if edNome.Text = '' then
     begin
          MsgDlg('Primeiro selecione o Participante.','Erro',mtError,[mbOk,mbHelp],0);
          bbtnProcurar.SetFocus;
          Exit;
     end;

  if Trim(dtVolta.Text) = '' then
     begin
          MsgDlg('A Data do Retorno deve ser informada.','Erro',mtError,[mbOk,mbHelp],0);
          dtVolta.SetFocus;
          Exit;
     end;

  if MsgDlg('Confirma retorno do participante ?','Confirmação',mtConfirmation,[mbYes,mbNo],0) = mrNo
  then begin
       TiraSql(qryAux);
       LimpaCampos;
       Exit;
  end;

  StartTransacao;

  if not RetornarDoEvento
  then bErro := True;

  if bErro
  then begin
     RollBackTransacao;
     MsgDlg('Evento não efetuado.','Informação',mtInformation,[mbOk,mbHelp],0);
  end
  else begin
     CommitTransacao;
     MsgDlg('Evento efetuado com sucesso.','Informação',mtInformation,[mbOk,mbHelp],0);
  end;

  TiraSql(qryAux);
  LimpaCampos;
end;

procedure TfrmDesfazerEvento.LimpaCampos;
begin
   sIdPessoa                  := '-1';
   sIdPessJur                 := '-1';
   sIdPlanoPrev               := '-1';
   sSeqProposta               := '1';
   edNome.Text                := '';
   edPatro.Text               := '';
   edPlano.Text               := '';
   edSitPatro.Text            := '';
   edSitFundacao.Text         := '';
   edSitPlano.Text            := '';
   edInscNumero.Text          := '';
   edMatricula.Text           := '';

   ConsPart1.sIdPessoa        := sidpessoa;
   ConsPart1.sIdTitular       := sIdPessoa;
   ConsPart1.sSeqProposta     := sseqproposta;
   ConsPart1.sIdPlanoprev     := sidplanoprev;
   ConsPart1.DataBaseName     := 'BaseDados';
   ConsPart1.sIdPessjur       := sidpessjur;
   ConsPart1.Enabled          := False;

   edDataEvento.Text          := '';
   edDataRegistro.Text        := '';
   edSitFuncDepois.Text       := '';
   edSitPartDepois.Text       := '';
   edSitPlanoDepois.Text      := '';
   sIdSitPlanoAtual           := '-1';
   sIdSitFuncAtual            := '-1';
   sIdSitPartAtual            := '-1';
   sIdSitPartNovo             := '-1';

   dtVolta.Text := '';
   bbtnProcurar.SetFocus;
end;

function TfrmDesfazerEvento.RetornarDoEvento : boolean;
var sSQL          : string;
    iIdEventoPrev : longint;
begin
  Result := False;
  // Grava a Data em que o participante voltou de um evento temporário
  qryAux.Close;
  qryAux.SQL.Clear;
  qryAux.Sql.Add(' UPDATE EVENTOSPREV SET DATAVOLTA = To_Date(''' + Trim(dtVolta.Text) + ''',''dd/MM/yyyy'')' +
                 ' WHERE IDPESSJUR       = ' + sIdPessJur   + ' AND ' +
                 '       IDPLANOPREV     = ' + sIdPlanoPrev + ' AND ' +
                 '       IDPESSOA        = ' + sIdPessoa    + ' AND ' +
                 '       SEQPROPOSTA     = ' + sSeqProposta + ' AND ' +
                 '       IDEVENTOSPREV   = ' + sIdEventosPrev);
  try
     qryAux.ExecSQL;
  except
     on E:EDBEngineError do
        begin
             MostrarErro(E);
             bErro := True;
             Exit;
        end;
  end;

  // Suspende as contribuições geradas pelo evento retornado.
  // Obs: Passar apenas o 'id' do evento retornado.
  // Voltar a cobrar as contribuições da situação anterior
  if not RetornaContribuicoesAntigas(sIdEventosPrev,         // Cancelamento
                                     sIdEventoGerador,       // Cancelamento
                                     sIdEventosPrevAnterior, // Inscricao, Reinscricao, Manutencao
                                     sIdPlanoPrev,
                                     sIdEventoGeradorAnterior,// Inscricao, Reinscricao, Manutencao
                                     sIdPessoa,
                                     sIdPessJur,
                                     sSeqProposta,
                                     FormatDateTime('dd/mm/yyyy', StrToDate(dtVolta.Text) - 1),
                                     dtVolta.Text,
                                     sIdSitPartNovo,
                                     sIdSitPartAtual,
                                     True,
                                     qryAux,
                                     qryGrava,
                                     sFlgIntEvento)
  then begin
      bErro := True;
      Exit;
  end;

  // Volta a situação anterior ao evento retornado
   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' UPDATE ELEGPATRO SET IDSITFUNC = ' + sIdSitFuncAtual +
                  ' WHERE IDPESSJUR = ' + sIdPessJur + ' AND ' +
                  '       IDPESSOA  = ' + sIdPessoa);
   try
      qryAux.ExecSQL;
   except
      on E:EDBEngineError do
        begin
             MostrarErro(E);
             bErro := True;
             Exit;
        end;
   end;

   qryAux.Close;
   qryAux.Sql.Clear;
   qryAux.Sql.Add(' UPDATE PARTPREVPLAN SET IDSITPLANOPREV = ' + sIdSitPlanoAtual + ',' +
                  '                         IDSITPART      = ' + sIdSitPartAtual  +
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
             bErro := True;
             Exit;
        end;
   end;

   if sIdEventoGeradorAnterior <> '-1'
   then begin
      iIdEventoPrev := LeUltRegistro(qryAux,'EVENTOSPREV');

      sSQL := ' INSERT INTO EVENTOSPREV(IDEVENTOSPREV, DATAREGISTRO, DATAEVENTO, ' +
              '                         IDPESSOA,      IDPESSJUR,    IDPLANOPREV, SEQPROPOSTA, ' +
              '                         IDSITFUNCATUAL,  IDSITPARTATUAL,  IDSITPLANOATUAL, ' +
              '                         IDSITFUNCNOVO,   IDSITPARTNOVO,   IDSITPLANONOVO, ' +
              '                         IDEVENTOGERADOR, FLGSITFUNCIMED,  FLGSITPARTIMED, FLGSITPLANOIMED, ' +
              '                         DATAEFETIVADO,   FLGEFETIVADO,    IDBENEFICIO,    IDREGRARESGATE,  ' +
              '                         IDREGRACALCBENEF, INSCRICAONUMERO ) ' +
              ' VALUES(' + IntToStr(iIdEventoPrev) + ',' +
                       ' To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy'') , '+ 
                       ' To_Date(''' + Trim(dtVolta.Text) + ''',''dd/MM/yyyy'') , '+
                       sIdPessoa + ',' + sIdPessJur + ',' + sIdPlanoPrev + ',' + sSeqProposta + ',' +
                       qryUltEventoGerador.FieldByName('IdSitFuncNovo').AsString+', '+
                       qryUltEventoGerador.FieldByName('IdSitPartNovo').AsString+', '+
                       qryUltEventoGerador.FieldByName('IdSitPlanoNovo').AsString+', '+
                       qryUltEventoGerador.FieldByName('IdSitFuncAtual').AsString+', '+
                       qryUltEventoGerador.FieldByName('IdSitPartAtual').AsString+', '+
                       qryUltEventoGerador.FieldByName('IdSitPlanoAtual').AsString+', '+
                       sIdEventoGeradorAnterior + ', 1 , 1 , 1, ' +
                       'To_Date(''' + FormatDateTime('dd/mm/yyyy', Date) + ''',''dd/MM/yyyy''), 1  ';

      if (sIdBenefEventoAnterior <> '-1') and (sIdBenefEventoAnterior <> '')
      then sSQL := sSQL +', '+sIdBenefEventoAnterior
      else sSQL := sSQL +', NULL ';

      if (sIdRegraBenefAnterior <> '-1') and (sIdRegraBenefAnterior <> '')
      then sSQL := sSQL +', '+sIdRegraBenefAnterior
      else sSQL := sSQL +', NULL ';

      if (sIdRegraResgAnterior <> '-1') and (sIdRegraResgAnterior <> '')
      then sSQL := sSQL +', '+sIdRegraResgAnterior
      else sSQL := sSQL +', NULL ';

      sSQL := sSQL +','+OraNumero(edInscNumero.Text)+ ') ';


      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(sSQL);
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

   Result := True;
end;

end.
