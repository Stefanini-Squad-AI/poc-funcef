{ Augusto 11/10/2002 - Funções de Calculo dos tempos de contribuiçao agora estão }
{                      localizadas nas units do componente ConsPart (uConsPart)  }
unit FPRelHisFuncional;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MontaSelect, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery,
  wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmPRelHisFuncional = class(TfrmOkCancelar)
    msElegivel: TMontaSelect;
    qryAux: TwwQuery;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edMatricula: TEdit;
    Label2: TLabel;
    btnProcurar: TBitBtn;
    edNome: TEdit;
    GroupBox2: TGroupBox;
    ckbContaTempo: TCheckBox;
    Label3: TLabel;
    dtReferencia: TCMDateTimePicker;
    dbDataTempo: TCMDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure ckbContaTempoClick(Sender: TObject);
// Gleyber - 02/07/2002 - Calcula e Retorna Tempo de Contribuicao Deste Periodo
    Function  LocalCalcTempoContrib(QryLocal: TwwQuery;
                               IdPessoa, Sequencia, FlgContaTempoServico,
                               FlgTipoCalculo: Integer;
                               DataInicial, DataFinal, DataFimProc: String):Integer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRelHisFuncional: TfrmPRelHisFuncional;
  IdPessoa : Integer;
  sTempoTotal, sTempoSemConversao : String;
implementation

Uses dRelTempoServico, uconsPArt, UMensErro, UAdmPrev, UDiasUteis, UFuncoesUteis;

{$R *.DFM}

procedure TfrmPRelHisFuncional.FormShow(Sender: TObject);
begin
  inherited;
  edMatricula.SetFocus;
  dtReferencia.Text := DateToStr(date);
  dbDataTempo.Visible := False;
end;

procedure TfrmPRelHisFuncional.btnProcurarClick(Sender: TObject);
begin
  inherited;
  IdPessoa         := 0;
  edMatricula.Text := '';
  edNome.Text  := StringOfChar(' ',80);
  msElegivel.Executar;
  if (msElegivel.RetornouValor) then
  Begin
    IdPessoa         := StrtoInt(msElegivel.ValoresChave[0]);
    edMatricula.Text := msElegivel.ValoresChave[1];
    edNome.Text  := msElegivel.ValoresChave[2];
    // Gleyber - 01/07/2002
    ckbContaTempo.Visible := (msElegivel.ValoresChave[3] = 'MA');
  end;

end;

procedure TfrmPRelHisFuncional.bbtnConfirmarClick(Sender: TObject);
Var
// Gleyber - 02/07/2002
 iSeq, iTotal : Integer;
 iTempoSimples : LongInt;
begin
  inherited;
// Gleyber - 02/07/2002
  iSeq := 0;
  if (edMatricula.Text = '') Then
  Begin
    MsgDlg('Escolha uma Matrícula','Erro',mtError,[mbOk,mbHelp],0);
    edMatricula.SetFocus;
    ModalResult := mrNone;
    exit;
  end;
  if (edMatricula.Text <> '') and (idPessoa = 0 ) Then
  Begin
  // procura pela matricula digitada
    qryAux.SQL.Clear;
    qryAux.SQL.Text := 'SELECT  ELEGPATRO.IDPESSOA, ELEGPATRO.MATRICULA, PESSOA.NOME, '+
                       '        PESSOA.NUMDOCUMENTO, PESSOA.IDPESSOA '+
                       'FROM    ELEGPATRO, PESSOA '+
                       'WHERE  (ELEGPATRO.MATRICULA LIKE ''' + edMatricula.Text + '%'')' +
                       'AND    (PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA ) ';
    qryAux.Open;
    if qryAux.EOF Then
    Begin
       MsgDlg('Matrícula não encontrada','Erro',mtError,[mbOk,mbHelp],0);
       edMatricula.SetFocus;
       ModalResult := mrNone;
       exit;
    end;
    if qryAux.RecordCount > 1 Then
    Begin
       MsgDlg('Mais de uma Matrícula encontrada','Erro',mtError,[mbOk,mbHelp],0);
       edMatricula.SetFocus;
       ModalResult := mrNone;
       exit;
    end;

    IdPessoa     := qryAux.FieldByName('IDPESSOA').AsInteger;
    edNome.Text  := qryAux.FieldByName('NOME').AsString;
  end;

  // Gleyber - 23/09/2002 - Inicio

  // Refaz os Calculos dos Tempos de Contribuicao para esta pessoa
  ProcessaHistContrib(QryAux,
                      IdPessoa,
                      dtReferencia.Text);
  // Gleyber - 23/09/2002 - Fim

  with dtmTempoServico do // CAMILLE - 24.09.2002
  begin
    qryFundacao.Close;
    qryFundacao.ParamByName('pFundacao').asinteger;
    qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
    qryFundacao.Prepare;
    qryFundacao.Open;
    sDataReferencia := dtReferencia.Text;
  end;

  dtmTempoServico.qryTempoServico.Close;
  dtmTempoServico.qryTempoServico.ParamByName('idpessoa').AsInteger := idPessoa;
  dtmTempoServico.qryTempoServico.ParamByName('anomesdiaref').AsString := Copy(dtReferencia.Text,7,4)+'/'+Copy(dtReferencia.Text,4,2)+'/'+Copy(dtReferencia.Text,1,2);
  dtmTempoServico.qryTempoServico.Open;
  dtmTempoServico.qryTempoServico.First;
  // escrever tempos de servicos por extenso
  if not dtmTempoServico.qryTempoServico.EOF Then
  Begin
    with dtmTempoServico Do
    Begin
      sTempoTotal        := TempoExtenso(qryTempoServico.FieldByName('TEMPOSERVCALC').AsInteger);
      sTempoSemConversao := TempoExtenso(qryTempoServico.FieldByName('TEMPOSEMCONVERSAO').AsInteger);
      while not qryTempoServico.EOF Do
      begin
        qryTempoServico.Edit;
        qryTempoServico.FieldByName('TEMPOTOTALEXT').AsString := sTempoTotal;
        qryTempoServico.FieldByName('TEMPOSEMCONVERSAOEXT').AsString := sTempoSemConversao;

        { Inicio Augusto 10/10/2002 }
        iTempoSimples := CalcTempoContrib(qryAux,
                                          qryTempoServico.FieldByName('IDPESSOA').AsInteger,
                                          qryTempoServico.FieldByName('SEQHISTFUNC').AsInteger,
                                          qryTempoServico.FieldByName('FLGCONTATS').AsInteger,
                                          1, // Calculo Normal
                                          qryTempoServico.FieldByName('DATAINICIO').AsString,
                                          qryTempoServico.FieldByName('DATAFINAL').AsString,
                                          dtReferencia.Text);
        qryTempoServico.FieldByName('TEMPOINDIVEXT').AsString := TempoExtenso(iTempoSimples);
        { Fim Augusto 10/10/2002 }

        qryTempoServico.Post;
        qryTempoServico.Next;
        // Gleyber - 02/07/2002
        iSeq   := qryTempoServico.FieldByName('SEQHISTFUNC').AsInteger + 1;
        iTotal := qryTempoServico.FieldByName('TEMPOSERVCALC').AsInteger;
      end;
    end;
  end;

  // Gleyber - 02/07/2002
  dtmTempoServico.pplblDescTempo.Caption:='';
  with dtmTempoServico Do
   Begin
    If ckbContaTempo.Checked then
     If trim(dbDataTempo.Text) <> '' then
      Begin
       qryAux.SQL.Clear;
       qryAux.SQL.Add('SELECT E1.DATAEVENTO AS DATAINICIO, E2.DATAFINAL'+#13+#10+
                      'FROM EVENTOSPREV E1, '+#13+#10+
                      '     SITPART     SP, '+#13+#10+
                      '     (SELECT EP.IDPESSOA, EP.DATAEVENTO AS DATAFINAL'+#13+#10+
                      '      FROM EVENTOSPREV EP, SITPART ST'+#13+#10+
                      '      WHERE (EP.IDPESSOA = '+ IntToStr(IdPessoa) +')'+#13+#10+
                      '        AND (EP.IDSITPARTNOVO = ST.IDSITPART)'+#13+#10+
                      '        AND (ST.DESCRICAO LIKE ''%APOSENTADO%'')'+#13+#10+
                      '        AND IDPESSOA IN (SELECT E.IDPESSOA'+#13+#10+
                      '                         FROM EVENTOSPREV E, SITPART S'+#13+#10+
                      '                         WHERE (E.IDPESSOA = '+ IntToStr(IdPessoa) +')'+#13+#10+
                      '                           AND (E.IDSITPARTNOVO = S.IDSITPART)'+#13+#10+
                      '                           AND (S.FLGINTERNO = ''MA''))) E2'+#13+#10+
                      'WHERE (E1.IDPESSOA = '+ IntToStr(IdPessoa) +')'+#13+#10+
                      '  AND (E1.IDSITPARTNOVO = SP.IDSITPART)'+#13+#10+
                      '  AND (SP.FLGINTERNO = ''MA'')'+#13+#10+
                      '  AND (E1.IDPESSOA = E2.IDPESSOA(+))');
       qryAux.Open;

       // Insert apenas para visualizar no report

       qryTempoServico.Insert;

       qryTempoServico.FieldByName('IDPESSOA').AsInteger             := IdPessoa;
       qryTempoServico.FieldByName('NOME').AsString                  := edNome.Text;
       qryTempoServico.FieldByName('DATAINICIO').AsDateTime          := qryAux.FieldByName('DATAINICIO').AsDateTime;
       If Trim(qryAux.FieldByName('DATAFINAL').AsString) <> ''
        Then qryTempoServico.FieldByName('DATAFINAL').AsDateTime     := qryAux.FieldByName('DATAFINAL').AsDateTime;
       qryTempoServico.FieldByName('FLGCONTATSTRANSF').AsString      := 'Sim';
       qryTempoServico.FieldByName('FLGCONCOMITANTETRANSF').AsString := 'Nao';
       qryTempoServico.FieldByName('EMPRESA').AsString               := 'MANUTENÇÃO DE INSCRIÇÃO';
       qryTempoServico.FieldByName('FATOR').AsInteger                := 0;
       qryTempoServico.FieldByName('SEQHISTFUNC').AsInteger          := iSeq;
       qryTempoServico.FieldByName('TEMPOCALC').AsInteger            := CalcTempoContrib(qryAux,
                                                                                         idPessoa,
                                                                                         iSeq,
                                                                                         1,
                                                                                         1,
                                                                                         qryAux.FieldByName('DATAINICIO').AsString,
                                                                                         dbDataTempo.Text,
                                                                                         DateToStr(Date));
       qryTempoServico.FieldByName('TEMPOINDIVEXT').AsString         := TempoExtenso(qryTempoServico.FieldByName('TEMPOCALC').AsInteger);

       iTotal := iTotal + qryTempoServico.FieldByName('TEMPOCALC').AsInteger;

       qryTempoServico.Post;

       qryTempoServico.First;

       While not qryTempoServico.EOF do
        Begin
         qryTempoServico.Edit;
         qryTempoServico.FieldByName('TEMPOSERVCALC').AsInteger := iTotal;
         qryTempoServico.FieldByName('TEMPOTOTALEXT').AsString  := TempoExtenso(iTotal);
         qryTempoServico.FieldByName('TEMPOSEMCONVERSAOEXT').AsString := sTempoSemConversao;
         qryTempoServico.Post;
         qryTempoServico.Next;
        End;

       pplblDescTempo.Caption := 'Tempo de Manutenção calculado até '+ dbDataTempo.Text;

      End;
   End;

  edMatricula.Text := '';
  IdPessoa         := 0;
  edNome.Text  := StringOfChar(' ',80);
  edMatricula.SetFocus;
end;

// Gleyber - 01/07/2002
procedure TfrmPRelHisFuncional.ckbContaTempoClick(Sender: TObject);
begin
  inherited;
  If ckbContaTempo.Checked
   Then
    Begin
     ckbContaTempo.Caption := 'Conta Tempo de Manutenção até';
     dbDataTempo.Visible   := True;
    End
   Else
    Begin
     ckbContaTempo.Caption:='Conta Tempo de Manutenção';
     dbDataTempo.Visible   := False;
    End;

end;

// Gleyber - 02/07/2002
function TfrmPRelHisFuncional.LocalCalcTempoContrib(QryLocal: TwwQuery;
  IdPessoa, Sequencia, FlgContaTempoServico, FlgTipoCalculo: Integer;
  DataInicial, DataFinal, DataFimProc: String): Integer;
Var
  wAnoI, wMesI, wDiaI,
  wAnoF, wMesF, wDiaF :Word;
  wStrAno, wStrMes, wStrDia, wStrDataI, wStrDataF, wStrTempoFinal:String;
  wTempoFinal, I :Integer;
Begin
  Result :=0;

// Caso DataFinal Vazia = Data Atual
  If Trim(DataFinal) = '' Then DataFinal := DateToStr(Date);
// Caso Data Final maior que a Data Fim de Processamento
// Data Final passa a ser a Data Fim de Processamento
  If StrToDate(DataFinal) > StrToDate(DataFimProc) Then DataFinal := DataFimProc;

// Decodifica as Datas \\
// Incial
  DecodeDate(StrToDate(DataInicial),wAnoI,wMesI,wDiaI); // Inical
    wStrAno :=IntToStr(wAnoI);
    If wMesI >= 10 Then wStrMes:= IntToStr(wMesI) Else wStrMes:= '0'+IntToStr(wMesI);
    If wDiaI >= 10 Then wStrDia:= IntToStr(wDiaI) Else wStrDia:= '0'+IntToStr(wDiaI);
    wStrDataI:= wStrAno+wStrMes+wStrDia;
// Final
  DecodeDate(StrToDate(DataFinal),  wAnoF,wMesF,wDiaF); // Final

// Caso mes Final seja FEREVEIRO, Ultimo dia conta como 30. (Testa se é Bissexto)
    If ((wMesF = 02) And ((wDiaF = 29) Or ( (wDiaF = 28) And (AnoBissexto(wAnoF) = False) ) ) )
    Then Begin
      wDiaF:=30;
    End;

    wStrAno :=IntToStr(wAnoF);
    If wMesF >= 10 Then wStrMes:= IntToStr(wMesF) Else wStrMes:= '0'+IntToStr(wMesF);
    If wDiaF >= 10 Then wStrDia:= IntToStr(wDiaF) Else wStrDia:= '0'+IntToStr(wDiaF);
    wStrDataF:= wStrAno+wStrMes+wStrDia;

// Calcula Tempo Final
  wTempoFinal:= StrToInt(wStrDataF)-StrToInt(wStrDataI);

// Caso não seja dia 31 o Final Soma 1 dia para acerto
  If (wDiaF <> 31) Then wTempoFinal:= (wTempoFinal+1);

// Decodifica Tempo Final
  wStrTempoFinal := IntToStr(wTempoFinal);
  I := Length(wStrTempoFinal);
  wStrTempoFinal:= Replicate('0',(6-I))+wStrTempoFinal; // Acerta Tamanho para 6 Casas
  wStrAno :=Copy(wStrTempoFinal,1,2);
  wStrMes :=Copy(wStrTempoFinal,3,2);
  wStrDia :=Copy(wStrTempoFinal,5,2);

//------------------------------------------------------------------------------
// Acerta datas \\

// Regras Passadas Pela Ursula Para Acerto da Data Final
// Caso Dias Maior que 30 Acerta
  If (wStrDia > '30')  Then Begin
// Acerta Dia Final
    wTempoFinal:=(wTempoFinal-70);
    wStrTempoFinal := IntToStr(wTempoFinal);
    I := Length(wStrTempoFinal);
    wStrTempoFinal:= Replicate('0',(6-I))+wStrTempoFinal; // Acerta Tamanho para 6 Casas
    wStrAno :=Copy(wStrTempoFinal,1,2);
    wStrMes :=Copy(wStrTempoFinal,3,2);
    wStrDia :=Copy(wStrTempoFinal,5,2);
  End;

// Caso Meses > 12 Aumenta Ano
  If wStrMes > '12' Then Begin
// Acerta Dia Final
    wTempoFinal:=(wTempoFinal-8800);
    wStrTempoFinal := IntToStr(wTempoFinal);
    I := Length(wStrTempoFinal);
    wStrTempoFinal:= Replicate('0',(6-I))+wStrTempoFinal; // Acerta Tamanho para 6 Casas
    wStrAno :=Copy(wStrTempoFinal,1,2);
    wStrMes :=Copy(wStrTempoFinal,3,2);
    wStrDia :=Copy(wStrTempoFinal,5,2);
  End;

// Caso mes Final seja FEREVEIRO
  If ( (FlgTipoCalculo = 1) And (wMesF = 02) And (StrToInt(wStrDia) >= 28)) Then Begin
    wStrDia:= '30';
  End;

// Caso Dias = 30 Aumenta Mes
  If wStrDia = '30' Then Begin
    wStrMes:= IntToStr((StrToInt(wStrMes)+1));
    If (StrToInt(wStrMes) < 10) Then wStrMes:= '0'+wStrMes;
    wStrDia:= '00';
  End;

// Caso Meses = 12 Aumenta Ano
  If wStrMes = '12' Then Begin
    wStrAno:= IntToStr((StrToInt(wStrAno)+1));
    wStrMes:= '00';
  End;

// Monta e seta Resultado
  wTempoFinal  := (StrToInt(wStrAno)*360)+
                  (StrToInt(wStrMes)*30)+
                   StrToInt(wStrDia);
  Result := wTempoFinal;
end;

procedure TfrmPRelHisFuncional.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // Voltar tempo de servico para hoje
  ProcessaHistContrib(qryAux,
                      IdPessoa,
                      DateToStr(date));

  inherited;

end;

end.
