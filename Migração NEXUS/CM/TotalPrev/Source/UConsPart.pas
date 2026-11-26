{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
------------------------------------------------------------------------------
Pendência   : SOL 175950 Kintana 1602996
Responsável : Vinicius Ferreira
Data        : entre 08/03/2012
Descrição   : Concerto de Erros:
              Ao fechar consulta geral de pessoa
              Ao abrir Contracheque e Consulta Part na tela inicial.
--------------------------------------------------------------------------------
        Sol : 159619
        KTN : 1322712
      Autor : José Roberto Marque
  Descrição : Disponibiza botão "Minimizar" na consulta em questão;
              Retira modalidade na exibição do formulário.
--------------------------------------------------------------------------------
Padrão      : 5.10.13
Pendência   : 23991
Data        : 19/12/2006
Responsável : Daniel Simões
Descrição   : Correção na tela de atendimento ao entrar na Consulta Geral de
              Pessoas. Estava entrando a tela de busca, quando o certo seria
              entrar direto na CGP já com os dados carregados do participante
              selecionado no atendimento...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}
unit UConsPart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, FConsPart, stdctrls,Wwquery, DConsPart, fTelaAut, FConsPessoaGeral,
  uCtrlTempoServico, dBaseDados, usistema, DConsPart1;

type

  TTpDesconto = (TpDescontoEspecial,TpDescontoSimples);

  TRecTempo   = uCtrltemposervico.TrecTempo;

  TConsPart = class(TSpeedButton)

  private

  protected
     function CreateMsgDlg(const Msg: String; const Caption: String; AType: TMsgDlgType;
                   Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer): TForm;

     function MsgDlgPos(const Msg: String; const Caption: String; AType: TMsgDlgType;
                   Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer): TModalResult;

     function MsgDlg(const Msg: String; const Caption: String; AType: TMsgDlgType;
                Buttons: TMsgDlgButtons; HelpCtx: Longint): TModalResult;

    { Protected declarations }
  public
     qryaux : Twwquery;
     FsIdpessoa, FsIdplanoprev, FsIdpessjur, FDataBaseName, FsIdtitular,
     FSeqProposta,FPathBmp, fsIDRGELEGBENEF : String;
     Constructor Create(Aowner :TComponent); Override;
     procedure Padrao;

     // Daniel - 23991
     procedure MostraConsultaAtendimento;

     procedure MostraConsulta;
     procedure MostraConsultaContraCheque;
     procedure Click; override;
     function ExisteForm(frm: String): Boolean;


    { Public declarations }
  published
     property sIdPessoa     : String  Read FsIdPessoa Write FsIdPessoa;
     property sIdTitular    : String  Read FsIdTitular Write FsIdTitular;
     property sSeqProposta  : String  Read FSeqProposta Write FSeqProposta;
     property sIdPlanoprev  : String  Read FsIdPlanoprev Write FsIdPlanoprev;
     property sIdPessjur    : String  Read FsIdPessjur Write FsIdPessjur;
     property sIDRGELEGBENEF: String  Read FsIDRGELEGBENEF Write FsIDRGELEGBENEF;
     property DataBaseName  : String  Read FDataBaseName Write FDataBaseName;

    { Published declarations }
  end;
     Function  CalcTempoContrib(QryLocal: TwwQuery;
                                IdPessoa, Sequencia, FlgContaTempoServico,
                                FlgTipoCalculo: Integer;
                                DataInicial, DataFinal, DataFimProc: String):Integer;

     Function  ProcessaDescontos(QryLocal: TwwQuery;
                                 IdPessoa, Sequencia: Integer;
                                 FatorMultiplicador:Double;
                                 DataInicial, DataFinal, DataFimProc: String;
                                 TipoDesconto: TTpDesconto ):Integer;

     Function  ProcessaAcrecimos(QryLocal: TwwQuery;
                                 IdPessoa, Sequencia: Integer;
                                 TempoCalculado:Double;
                                 CodTipInsaubr,
                                 DataInicial, DataFinal, DataFimProc: String):Integer;

     Procedure GravaTempoContrib(QryLocal: TwwQuery;
                                 IdPessoa: Integer);

     Function BuscaTempoContrib(QryLocal: TwwQuery;
                                IdPatro, IdPessoa: Integer):TRecTempo;

     Function  ProcessaHistContrib(QryAux1: TwwQuery;
                                   IdPessoa: Integer;
                                   StrDataFinal:String):Boolean;
     Function  PeriodoConcomitante(Qry: TwwQuery;
                                   IdPessoa, Sequencia: Integer;
                                   DataInicial, DataFinal: String):Boolean;

     function OraNumero(sNumero : string):string;

     { Augusto 16/10/2002 }
     Function TempoExtenso(Tempo:Integer):String;
     Function TransformaDiasTempo(Tempo:Integer):String;

     // tavares
     function pegaDataDoServidor : string;

implementation

procedure TConsPart.Click;
begin
   inherited Click;
   MostraConsulta;
end;

Constructor TConsPart.Create(Aowner :TComponent);
Begin
  Inherited Create(Aowner);
  Try
     Glyph.LoadFromResourceName(HInstance,'TCONSPART');
  finally
     height := 33;
     width  := 33;
  End;
End;

procedure TConsPart.MostraConsulta;
var sInconSis, sSQL : String;
    Resultado       : Integer;
begin
  (* Sol: 159619; Ktn: 1322712 JRM6 *)
  try
    if ( dtmConsPart = nil ) and (DtmconsPart1 = nil ) then
    begin
      dtmConsPart  := TdtmConsPart.Create(Self);
      dtmConsPart1 := TdtmConsPart1.Create(Self);
      Resultado    := mrCancel;
    end;

    // Tavares 05/12/2002
    if not ( ExisteForm('FRMCONSPESSOAGERAL') and (StrToIntDef(FsIdpessoa,0)=0) ) and (not ExisteForm('FRMCONSPART')) then
    begin
      frmConsPessoaGeral := TfrmConsPessoaGeral.Create(Self);

      if not frmConsPessoaGeral.Visible then
        frmConsPessoaGeral.ShowModal;

      sIdPessoaConsPart    := FConsPessoaGeral.cIdPessoa;
      sIdPessJurConsPart   := FConsPessoaGeral.cIdPessjur;
      iIdTitular           := StrToIntDef(FConsPessoaGeral.cIdTitular,-1);
      Resultado            := frmConsPessoaGeral.ModalResult;
      frmConsPessoaGeral.Close;
      frmConsPessoaGeral.Free;
    end
    else
    begin
      try
        FConsPessoaGeral.cIdPessoa  := FsIdpessoa;
        FConsPessoaGeral.cIdTitular := FsIdtitular;
      except
      end;
      sIdPessoaConsPart := FsIdPessoa;
      iIdTitular        := StrToIntDef(FsIdTitular,-1);
    end;

    if ( ExisteForm('FRMCONSPESSOAGERAL') and (FConsPessoaGeral.cIdpessoa='0') ) then
      Exit;

    if ( not ExisteForm('FRMCONSPART') ) and ( (Resultado=mrOK) or (sIdPessoaConsPart<>'') ) then
    begin
      FrmConsPart := TFrmConsPart.Create(Self);

      // Daniel - 23136
      FrmConsPart.bConsPessoaGeral := True;

      FrmConsPart.pgAcessoDireto   := '';
      FrmConsPart.Show;
    end
    else
    // JRM6 - 29/02/2012
    begin
     If (ExisteForm('FRMCONSPART')) then
      FrmConsPart.windowstate := wsNormal; //Vinicius Ferreira SOL 175950 Kintana 1602996
    end;
    // JRM6 - 29/02/2012
  finally
    {
    FsIdPessoa        := '';
    FsIdTitular       := '';
    iIdTitular        := -1;
    sIdPessoaConsPart := '';
    {}
  end;

end;


procedure TConsPart.MostraConsultaContraCheque;
var sInConSis, sSQL  : String;
    Resultado        : Integer;
begin
  try


    if not ExisteForm('FRMCONSPESSOAGERAL') and (StrToIntDef(FsIdpessoa,0)=0) then begin
      frmConsPessoaGeral := TfrmConsPessoaGeral.Create(Self);

      if not (frmConsPessoaGeral.Visible) then
        frmConsPessoaGeral.ShowModal;

      sIdPessoaConsPart  := FConsPessoaGeral.cIdpessoa;
      sIdPessJurConsPart := FConsPessoaGeral.cIdPessjur;
      iIdTitular         := StrToIntDef(FConsPessoaGeral.cIdTitular,-1);
      Resultado          := frmConsPessoaGeral.ModalResult;

      frmConsPessoaGeral.Close;
      frmConsPessoaGeral.Free;
    end else begin
      try
        FConsPessoaGeral.cIdpessoa  := FsIdpessoa;
        FConsPessoaGeral.cIdTitular := FsIdtitular;
      except end;

      sIdPessoaConsPart := FsIdpessoa;
      iIdTitular        := StrToIntDef(FsIdTitular,-1);
    end;

    if ( ExisteForm('FRMCONSPESSOAGERAL') and (FConsPessoaGeral.cIdPessoa='0') ) then
      Exit;

    sIdPessoaConsPart := FsIdTitular;
    // Daniel - 21551
    dtmConsPart       := TdtmConsPart.Create(Self);
    dtmConsPart1      := TdtmConsPart1.Create(Self);
    Resultado         := mrCancel;

    if ( (not ExisteForm('FRMCONSPART')) and (sIdPessoaConsPart<>'') ) then begin
      FrmConsPart                := TFrmConsPart.Create(Self);
      //FrmConsPart.Visible        := False;
      //FrmConsPart.pgAcessoDireto := 'PgBeneficiosPagamentosContraCheque';
      //FrmConsPart.ShowModal;
      FrmConsPart.NBKelegpart.ActivePage := 'PgBeneficiosPagamentosContraCheque';
      FrmConsPart.Show;
    end;
  finally
    {
    FsIdPessoa        := '';
    FsIdTitular       := '';
    iIdTitular        := -1;
    sIdPessoaConsPart := '';
    {}
  end;
end;

procedure TConsPart.Padrao;
begin
   try
      Caption := 'Consulta';
      Flat := False;
   except
   end;
end;

function TConsPart.CreateMsgDlg(const Msg: String; const Caption: String; AType: TMsgDlgType;
                   Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer): TForm;
var ControlCtr : integer;
begin
  Result := CreateMessageDialog(Msg, TMsgDlgType(AType), TMsgDlgButtons(Buttons));

  {Se o usuário especificar um novo caption }
  if Caption <> EmptyStr then begin
    Result.Caption := Caption;
  end; {if}

  {Ajusta a posição do dialogo.}
  if X > -1 then begin
    Result.Left := X;
  end; {if}
  if Y > -1 then begin
    Result.Top := Y;
  end; {if}

  {Seta o help context e ajusta a escala de video correta .}
  Result.HelpContext := HelpCtx;
  Result.ScaleBy(Screen.PixelsPerInch, 96);

  for ControlCtr := 0 to (Result.ControlCount - 1) do begin
    if (Result.Controls[ControlCtr] is TButton) then begin
      with TButton(Result.Controls[ControlCtr]) do
         if Name = 'Yes'
         then Caption := '&Sim'
         else if Name = 'No'
         then Caption := '&Não'
         else if Name = 'Ok'
         then Caption := '&Ok'
         else if Name = 'Cancel'
         then Caption := '&Cancelar'
         else if Name = 'Abort'
         then Caption := '&Abortar'
         else if Name = 'Retry'
         then Caption := '&Repetir'
         else if Name = 'Ignore'
         then Caption := '&Ignorar'
         else if Name = 'All'
         then Caption := '&Todos'
         else if Name = 'Help'
         then Caption := 'Aj&uda';
    end; {if}
  end; {for}
end;


function TConsPart.MsgDlgPos(const Msg: String; const Caption: String; AType: TMsgDlgType;
                   Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer): TModalResult;
var
  Dlg    : TForm;  {Handle do dialogbox.}
  Cursor : TCursor;

begin
  Cursor := Screen.Cursor;
  Screen.Cursor := crDefault;

  {Cria e mostra o dialog, retorna o modalresult.}
  Dlg := CreateMsgDlg(Msg, Caption, AType, Buttons, HelpCtx, X, Y);
  try
  Result := Dlg.ShowModal;
  {Garante a liberação de memória do dialogo.}
  finally
    Dlg.Free;
    Screen.Cursor := Cursor;
  end; {finally}
end;

function TConsPart.MsgDlg(const Msg: String; const Caption: String; AType: TMsgDlgType;
                Buttons: TMsgDlgButtons; HelpCtx: Longint): TModalResult;
begin
  {Chama MsgDlgPos com a posição default.}
  Result := MsgDlgPos(Msg, Caption, AType, Buttons, HelpCtx, -1, -1);
end;


function TConsPart.ExisteForm(frm: string): Boolean;
var
   i: Integer;

begin
   Result := False;
   for i := 0 to Screen.FormCount - 1 do
      if uppercase(Screen.Forms[i].Name) = uppercase(frm) then
      begin
         Result := True;
         Break;
      end;
end;


// André Tavares - pendência 15567 - encapsulamento para todos utilizarem a rotina em 3 Camadas
Function  PeriodoConcomitante(Qry: TwwQuery;
                              IdPessoa, Sequencia: Integer;
                              DataInicial, DataFinal: String):Boolean;
var CtrlTempoServico : TCtrlTempoServico;
Begin
  result := false;
  CtrlTempoServico := TCtrlTempoServico.Create;
  CtrlTempoServico.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True, nil);

  result := CtrlTempoServico.PeriodoConcomitante(idPessoa, sequencia, DataInicial, DataFinal) = 1;

  CtrlTempoServico.Free;
end;

// André Tavares - pendência 15567 - encapsulamento para todos utilizarem a rotina em 3 Camadas
Function  ProcessaHistContrib(QryAux1: TwwQuery;
                              IdPessoa: Integer;
                              StrDataFinal:String):Boolean;
var CtrlTempoServico : TCtrlTempoServico;
begin
  CtrlTempoServico := TCtrlTempoServico.Create;
  CtrlTempoServico.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True, nil);

  CtrlTempoServico.CalculaTempos(IdPessoa, Date);
  CtrlTempoServico.Free;
end;

// André Tavares - pendência 15567 - encapsulamento para todos utilizarem a rotina em 3 Camadas
Function BuscaTempoContrib(QryLocal: TwwQuery;
                           IdPatro, IdPessoa: Integer):TRecTempo;
var CtrlTempoServico : TCtrlTempoServico;
begin
  CtrlTempoServico := TCtrlTempoServico.Create;

  CtrlTempoServico.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                              Sistema.ConnectionSide, Sistema.AppRemoteServer, True, nil);

  result := CtrlTempoServico.BuscaTempoContrib(IdPatro, IdPessoa);

  CtrlTempoServico.Free;
end;

//******************************************************************************
// Grava o Tempo de Contribuicao calculado
Procedure GravaTempoContrib(QryLocal: TwwQuery;
                            IdPessoa: Integer);
Var
  wTempoTotal, wTempoEspecial, iTempoSemConversao:Integer;     // FDIAS - 13.12.2001 - FCRT
Begin
// Inicio da Rotina
  Try
    With QryLocal Do Begin
// Busca Todos os Lancamentos da Pessoa Ordenado por Data Inicial
      Close;
      SQL.Clear;
      SQL.Add('SELECT * FROM HISTFUNCPREV                '+
              'WHERE IDPESSOA = ' + IntToStr(IdPessoa)+' '+
              'ORDER BY IDPESSOA, DATAINICIO');
      Open;
// Caso não Tenha Volta
      If IsEmpty Then Begin
        Exit;
      End;

// Varre Arquivo Acumulando Tempos de Contribuicao Validos
      wTempoTotal:=0;
      iTempoSemConversao:=0;
      wTempoEspecial := 0; //tavares 31/03/2003  *** Por que esta variável não era iniciALIZADA???
      First;
      While Not Eof Do Begin
        If FieldByName('FLGCONTATS').AsInteger = 1 Then
        Begin
          wTempoTotal := (wTempoTotal+FieldByName('TEMPOCALC').AsInteger);
          { Inicio Augusto 16/10/2002 }
          If Trim(FieldByName('CODTPINSALUBRI').AsString) = ''  Then
            iTempoSemConversao := (iTempoSemConversao+FieldByName('TEMPOSIMPLES').AsInteger);
          { Fim Augusto }
        End;
        wTempoEspecial := (wTempoEspecial+FieldByName('TEMPOCALCINSALUB').AsInteger); // FDIAS - 13.12.2001 - FCRT

// Proximo Registro
        Next;
      End;

// Atualiza Tabela ELEGPATRO com o Tempo de Contribuicao Total Calculado
      Close;
      SQL.Clear;
      SQL.Add(' UPDATE ELEGPATRO SET TEMPOSERVCALC    = ' +IntToStr(wTempoTotal)       +', '+
              '                      TEMPOSIMPLES     = ' +IntToStr(iTempoSemConversao)+', '+ { Augusto 16/10/2002 }
              '                      TEMPOSITESPECIAL = ' +IntToStr(wTempoEspecial)    +' '+  // FDIAS - 13.12.2001 - FCRT
              ' WHERE IDPESSOA = ' + IntToStr(IdPessoa));
      ExecSQL;
    End;

  Except
// Caso de Erro mostra Mensagem
    On E:Exception Do Begin
      ShowMessage('Erro ao gravar o Tempo de Contribuição, Pessoa ('+IntToStr(IdPessoa)+') '+#13+
                  'com a mensagem '+E.Message);
    End;
  End;

End;
//******************************************************************************
// Processa os Acrecimos no tempo de Contribuicao
Function  ProcessaAcrecimos(QryLocal: TwwQuery;
                            IdPessoa, Sequencia: Integer;
                            TempoCalculado:Double;
                            CodTipInsaubr,
                            DataInicial, DataFinal, DataFimProc: String):Integer;
Var
  wDataFimCalc:String;
  wTempoCalc, wTotalAcrecimos:Integer;
  wFator:Double;
Begin
  Result :=0;
// Caso não possua Insalubridade Sai Fora
  If Trim(CodTipInsaubr) = '' Then Exit;
// Caso DataFinal Vazia = Data Atual
  If Trim(DataFinal) = '' Then DataFinal := PegaDataDoServidor;// tavares
// Caso Data Final maior que a Data Fim de Processamento
// Data Final passa a ser a Data Fim de Processamento
  If StrToDate(DataFinal) > StrToDate(DataFimProc) Then DataFinal := DataFimProc;
// Caso Tempo Negativo Zera Dias Calculados
  If TempoCalculado < 0 Then TempoCalculado :=0;
// Busca Fator de Multiplicacao
  wFator:=1; // Inicia
  With QryLocal Do Begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT FATOR, TEMPOPERMANMINIMO, FLGTEMPOCONTINUO, IDREGRAINSALUBRI ' +
            'FROM TPINSALUBRI  ' +
            'WHERE CODTPINSALUBRI = ' + QuotedStr(CodTipInsaubr) );
    Open;

// Guarda Fator Multiplicador
    wFator:= FieldByName('FATOR').AsFloat;

// Gera Resultado
    Result := Trunc((TempoCalculado*wFator) - TempoCalculado);
  End;

End;


//******************************************************************************
// Processa os Descontos no tempo de Contribuicao
Function  ProcessaDescontos(QryLocal: TwwQuery;
                            IdPessoa, Sequencia: Integer;
                            FatorMultiplicador:Double;
                            DataInicial, DataFinal, DataFimProc: String;
                            TipoDesconto: TTpDesconto):Integer;
Var
  wDataFimCalc,wDataIniCalc:String;
  wTempoCalc, wTotalDescontos,
  wTipoDesconto :Integer;
Begin
  Result:=0;
  wTotalDescontos:=0;
// Caso DataFinal Vazia = Data Atual
  If Trim(DataFinal) = '' Then DataFinal := PegaDataDoServidor; // tavares

// Caso Data Final maior que a Data Fim de Processamento
// Data Final passa a ser a Data Fim de Processamento
  If StrToDate(DataFinal) > StrToDate(DataFimProc) Then DataFinal := DataFimProc;

// Busca Registros Concomitantes com o Processado
  With QryLocal Do Begin
    Close;
    SQL.Clear;
    SQL.Add(
      'SELECT NVL(H.DATAFINAL, SYSDATE) AS DATAFINAL, H.*, T.* '+
      'FROM HISTFUNCPREV H, TPINSALUBRI T    ' +
      'WHERE H.IDPESSOA    =  ' + IntToStr(IdPessoa)  + ' AND ' +
      '      H.SEQHISTFUNC <> ' + IntToStr(Sequencia) + ' AND ' +
      '      H.CODTPINSALUBRI = T.CODTPINSALUBRI(+)       AND ' );
    If TipoDesconto = TpDescontoSimples Then Begin
      SQL.Add(' ((H.CODTPINSALUBRI IS NULL) OR (H.CODTPINSALUBRI IS NOT NULL AND FLGCONTATS = 0)) AND ');
    End;
    SQL.Add(
      '      (   ' +
      '       ( (H.TEMPOCALC IS NULL) AND (NVL(T.FATOR,0) >= '+OraNumero(FloatToStr(FatorMultiplicador))+') ) OR '+
      '       (NVL(T.FATOR,0) > '+OraNumero(FloatToStr(FatorMultiplicador))+') OR '+
      '       (H.FLGCONTATS= 0 AND H.DATAINICIO <= TO_DATE('+QuotedStr(DataInicial)+',''DD/MM/YYYY'')) '+
      '      )  AND ' +
      '      (   ' +
      '      (H.DATAINICIO BETWEEN TO_DATE(' +QuotedStr(DataInicial)+ ',' + '''DD/MM/YYYY'') AND ' +
      '                            TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY'')     ' +
      '       OR ' +
      '       H.DATAFINAL  BETWEEN TO_DATE(' +QuotedStr(DataInicial)+ ',' + '''DD/MM/YYYY'') AND ' +
      '                            TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY''))    ' +
      '       OR ' +
      '      (H.DATAINICIO < TO_DATE(' +QuotedStr(DataInicial)+ ',' + '''DD/MM/YYYY'')  ' +
      '       AND ' +
      '       NVL(H.DATAFINAL, SYSDATE) > TO_DATE(' +QuotedStr(DataFinal)  + ',' + '''DD/MM/YYYY'')) AND ' +
      '         (NVL(T.FATOR,0) >= '+OraNumero(FloatToStr(FatorMultiplicador))+')'+
      '      )   ' +
      'ORDER BY DATAINICIO ');
    Open;

// Caso não Possua Registros, sai Fora
    If IsEmpty Then Begin
      Result:=0;
      Exit;
    End;

// Se a data de Inicio de Calculo é menor que o Inicio do Processo, o Calculo
// Assume a data de Inicio do processo, caso contrario assume a mesma.
    If (FieldByName('DATAINICIO').AsDateTime < StrToDate(DataInicial)) Then begin
      wDataIniCalc:=DataInicial;
    End Else Begin
      wDataIniCalc:=FieldByName('DATAINICIO').AsString;
    End;

//------------------------------------------------------------------------------
// Processa Registros
    While Not Eof Do Begin

// Caso Data Inicial seja menor que a Data de Inicio do Proximo calculo, ignora
      If StrToDate(wDataIniCalc) > FieldByName('DATAFINAL').AsDateTime Then Begin
// Proximo Registro e Volta ao Inicio
        Next;
        Continue;
      End;

// Gera a data final que sera calculada,
// Caso data final deste registro seja maior que a final do processo,
// data final = a do processo
      If (FieldByName('DATAFINAL').AsDateTime > StrToDate(DataFinal)) Then begin
        wDataFimCalc  := DataFinal;
        wTipoDesconto := 2;
      End Else Begin
        wDataFimCalc := FieldByName('DATAFINAL').AsString;
        wTipoDesconto := 1;
      End;

// Calcula Tempo Sem Descontos deste periodo
      wTempoCalc := CalcTempoContrib(QryLocal,
                                     FieldByName('IDPESSOA').AsInteger,
                                     FieldByName('SEQHISTFUNC').AsInteger,
                                     FieldByName('FLGCONTATS').AsInteger,
                                     wTipoDesconto, // Calculo Especial caso descontando
                                     wDataIniCalc,
                                     wDataFimCalc,
                                     DataFimProc);

      { Acumula descontos especiais }
      wTotalDescontos:= (wTotalDescontos+wTempoCalc);

// Proximo Registro
      Next;

// Se a data de Inicio do Proximo Calculo é menor que o final da ultima está e a data
// de inicio do proximo Calculo
      If (FieldByName('DATAINICIO').AsDateTime < StrToDate(wDataFimCalc)) Then begin
        wDataIniCalc:=DateToStr(StrToDate(wDataFimCalc)+1);
      End Else Begin
        wDataIniCalc:=FieldByName('DATAINICIO').AsString;
      End;

// Caso a data de Inicio do Proximo calculo passe da Data Final do Processo, sai Fora
      If StrToDate(wDataIniCalc) > StrToDate(DataFinal) Then Begin
        Break;
      End;
    End;
  End;
// Seta Resultado
  Result := wTotalDescontos;

End;


//******************************************************************************
// Calcula e Retorna Tempo de Contribuicao Deste Periodo
Function CalcTempoContrib(QryLocal: TwwQuery;
                          IdPessoa, Sequencia, FlgContaTempoServico,
                          FlgTipoCalculo: Integer;
                          DataInicial, DataFinal, DataFimProc: String):Integer;
Var
  wAnoI, wMesI, wDiaI,
  wAnoF, wMesF, wDiaF :Word;
  wStrAno, wStrMes, wStrDia, wStrDataI, wStrDataF, wStrTempoFinal:String;
  wTempoFinal, I :Integer;
Begin
  Result :=0;

// Caso DataFinal Vazia = Data Atual
  If Trim(DataFinal) = '' Then DataFinal := PegaDataDoServidor; // tavares
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
    If ((wMesF = 02) And ((wDiaF = 29) Or ( (wDiaF = 28)  ) ) )
    Then Begin
      wDiaF:=30;
    End;

    wStrAno :=IntToStr(wAnoF);
    If wMesF >= 10 Then wStrMes:= IntToStr(wMesF) Else wStrMes:= '0'+IntToStr(wMesF);
    If wDiaF >= 10 Then wStrDia:= IntToStr(wDiaF) Else wStrDia:= '0'+IntToStr(wDiaF);
    wStrDataF:= wStrAno+wStrMes+wStrDia;

// Calcula Tempo Final
  wTempoFinal:= StrToInt(wStrDataF)-StrToInt(wStrDataI);

// Caso Não seja dia 31 o Final Soma 1 dia para acerto
//tavares 11/10/2002 { Augusto }
  if (wDiaF <> 31) Then wTempoFinal:= (wTempoFinal+1);

// Decodifica Tempo Final
  wStrTempoFinal := IntToStr(wTempoFinal);
  I := Length(wStrTempoFinal);
  wStrTempoFinal:= StringOfChar('0',(6-I))+wStrTempoFinal; // Acerta Tamanho para 6 Casas
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
    wStrTempoFinal:= StringOfChar('0',(6-I))+wStrTempoFinal; // Acerta Tamanho para 6 Casas
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
    wStrTempoFinal:= StringOfChar('0',(6-I))+wStrTempoFinal; // Acerta Tamanho para 6 Casas
    wStrAno :=Copy(wStrTempoFinal,1,2);
    wStrMes :=Copy(wStrTempoFinal,3,2);
    wStrDia :=Copy(wStrTempoFinal,5,2);
  End;

// Augusto 17/10/2002
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
End;


function OraNumero(sNumero : string):string;
var i : integer;
    sResult,
    sOra : string;
    bPrimPonto : boolean;
begin
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;
   sOra := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if (sNumero[i] = ',') or (sNumero[i] = '@')
     then begin
        if sNumero[i] = '@'
        then DecimalSeparator := ',';

        if not bPrimPonto
        then begin
           sOra := sOra + '.';
           bPrimPonto := True;
        end
        else sOra := sOra;
     end
     else begin
        if sNumero[i] <> '.'
        then sOra := sOra + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sOra := sOra+'.';
              bPrimPonto := True;
           end
           else sOra := sOra;
        end;
     end;
   end;
   sResult := '';
   for i := length(sOra) downto 1
   do begin
      sResult := sResult + sOra[i];
   end;
   Result := sResult;
end;

// tavares
function PegaDataDoServidor: String;
var
  ano, mes, dia : word;
  QryLocal : TwwQuery;
Begin

  QryLocal:= TwwQuery.Create(Application);
  Try
    QryLocal.DatabaseName:='BaseDados';
    QryLocal.SQL.Clear;
    QryLocal.SQL.Add('SELECT SYSDATE AS DATASERVIDOR FROM DUAL');
    QryLocal.Open;
    DecodeDate(QryLocal.FieldByName('DATASERVIDOR').AsDateTime, ano, mes, dia);
    QryLocal.close;

    Result := IntToStr(dia)+'/'+inttostr(mes)+'/'+inttostr(ano);
  Finally
    FreeAndNil(QryLocal);
  End;
End;

//******************************************************************************
// Retorna tempo em extenso
Function TempoExtenso(Tempo:Integer):String;
Var
  wStrAno, wStrMes, wStrDia, wStrTempo :String;
  wTempo, I:Integer;
Begin
// Decodifica Tempo Final
  wStrTempo:=IntToStr(Tempo);
// Caso Vazio, Sai Fora
  If Trim(wStrTempo) = '' Then Exit;

  wStrTempo := TransformaDiasTempo(StrToInt(wStrTempo));
  I := Length(wStrTempo);
  wStrTempo:= StringofChar('0',(6-I))+wStrTempo; // Acerta Tamanho para 6 Casas
  wStrAno  :=Copy(wStrTempo,1,2);
  wStrMes  :=Copy(wStrTempo,3,2);
  wStrDia  :=Copy(wStrTempo,5,2);
// Monta String do Resultador
  Result := wStrAno + ' ano(s), '+
            wStrMes + ' mes(es) e '+
            wStrDia + ' dia(s) ';
End;

//******************************************************************************
// Transforma numero de dias Dias em Tempo DDMMAAAA
Function TransformaDiasTempo(Tempo:Integer):String;
Var
  I:Integer;
  wAnoF, wMesF, wDiaF:Double;
  wAno, wMes, wDia, wStrTempo:String;
Begin
  Result :='';

// Calcula Tempos
  wAnoF := (Tempo/360);
  wMesF := (Frac(wAnoF)*12);
  wDiaF := Round((wMesF-Int(wMesF))*30);

// Separa Tempos
  wAno := FloatToStr( Int( wAnoF ) );
  wMes := FloatToStr( Int( wMesF ) );
  wDia := FloatToStr( Int( wDiaF ) );

  If StrToInt(wAno) < 10 Then wAno:= '0'+wAno;
  If StrToInt(wMes) < 10 Then wMes:= '0'+wMes;
  If StrToInt(wDia) < 10 Then wDia:= '0'+wDia;

// Caso Dias = 30 Aumenta Mes
  If wDia = '30' Then Begin
    wMes:= IntToStr((StrToInt(wMes)+1));
    If (StrToInt(wMes) < 10) Then wMes:= '0'+wMes;
    wDia:= '00';
  End;
// Caso Meses = 12 Aumenta Ano
  If wMes = '12' Then Begin
    wAno:= IntToStr((StrToInt(wAno)+1));
    wMes:= '00';
  End;

  wStrTempo:=wAno+wMes+wDia;

  I := Length(wStrTempo);

  Result := StringofChar('0',(6-I))+wStrTempo; // Acerta Tamanho para 6 Casas

end;

// Daniel - 23991 - Início -----------------------------------------------------
procedure TConsPart.MostraConsultaAtendimento;
var iResultado : Integer;
begin
  dtmConsPart  := TdtmConsPart.Create(Self);
  dtmConsPart1 := TdtmConsPart1.Create(Self);
  iResultado   := mrCancel;

  FrmConsPart                  := TFrmConsPart.Create(Self);
  FrmConsPart.bConsPessoaGeral := True;
  //FrmConsPart.Visible          := False; //Vinicius Ferreira SOL 175950 Kintana 1602996
  //FrmConsPart.pgAcessoDireto   := '';  //Vinicius Ferreira SOL 175950 Kintana 1602996
  FrmConsPart.NBKelegpart.ActivePage := 'PgDadosPessoais'; //Vinicius Ferreira SOL 175950 Kintana 1602996

  //FrmConsPart.ShowModal;
  FRMconspart.Show;
end;
// Daniel - 23991 - Fim --------------------------------------------------------
end.
