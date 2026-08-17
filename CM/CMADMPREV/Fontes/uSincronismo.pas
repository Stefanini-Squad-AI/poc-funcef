unit uSincronismo;

// Objetivo         : Esta unit tem como objetivo tratar o sincronismo entre as etapas dos
//                    grandes ciclos previdenciarios : cobrança de contribuição e pagamento
//                    de benefício

// Tabela Principal : SINCRONPREV

// Definição Tabela : ANOMESREF        NOT NULL VARCHAR2(7)
//                    IDPESSJUR        NOT NULL NUMBER
//                    IDMODULO         NOT NULL NUMBER
//                    OPERACAO         NOT NULL CHAR(1)      - A
//                                                             B
//                                                             E : Envio
//                                                             R
//                                                             P
//                    DATAFECHAMENTO            DATE
//                    TIPOENVPREV               CHAR(1)

interface

uses
  Windows, Messages, SysUtils,  Classes,
  Controls, Dialogs, ExtCtrls, ComCtrls,
  wwQuery, Forms;

function VerificaObriga(const sTabela, sFlag: string): string;

function VerificaFechamento(const lIdPessJur, lIdModulo: LongInt;
                            const sAnoMesRef: string; const sOperacao: Char;
                            var   cTipoEnvPrev: Char): Boolean;

function VerificaPartFolha(const lIdPatro, lIdPlanoPrev, lIdPessoa, lSeqProposta: LongInt;
                           const sAnoMesPgto: string): Boolean;

function AtualizaCtrlInterfaceCCP(const bFlgIda: Byte; const sDataIda, sMesRef: string): Boolean;

// Esta rotina insere um registro na tabela de Sincronismo (SINCRONPREV)
// para registrar o fechamento do ciclo de Envio ou Recebimento, dependendo
// do parametro, para aquele módulo
function FechaMesSistema (qry : TwwQuery;
                          psAnoMesRef,
                          psDataFechamento : string;
                          piIdPessJur,
                          piIdModulo       : longint;
                          cOperacao,
                          cTipoEnvPrev     : char ) : boolean;

// Esta rotina exclui um registro da tabela de Sincronismo (SINCRONPREV)
// para que o ciclo seja reaberto dentro de um mes que já tinha sido encerrado
function ExcluiSincronismo ( qry             : TwwQuery;
                             psAnoMesRef     : string;
                             piIdPessJur,
                             piIdModulo      : longint;
                             cOperacao,
                             cTipoEnvPrev: char ) : boolean;

// Esta rotina retorna o próxmio ano/mês que esteja em aberto para um determinado
// módulo
function ProximoMesAberto( psAnoMesRef   : string;
                           piIdPessJur,
                           piIdModulo    : longint;
                           cOperacao     : char ) : string;

function SAnoMesPosterior(sAnoMes : string) : string;

implementation

uses DBaseDados, uMensErro, UAdmPREV;

//Esta função tem por objetivo agilizar os processos de verificação de flags em tabelas de parâmetros;
function VerificaObriga(const sTabela, sFlag: string): string;
begin
  Result := ''; //Inicializando "Result";

  try
   Screen.Cursor := crHourGlass;

   with TwwQuery.Create(dtmBaseDados) do
   begin
     DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;

     SQL.Add('SELECT ' + sFlag + ' FROM ' + sTabela);
     Open;

     Result := FieldByName(sFlag).AsString; //"Result" recebe o valor do campo;

     Close;
     Free;
   end;

   Screen.Cursor := crDefault;
   except on Error: Exception do
   begin
     Screen.Cursor := crDefault;
     MsgDlg('Atenção! Não foi possível concluir a verificação devido ao erro: ' + Error.Message,
            'Erro', mtError, [mbOK], 0);
   end;
  end;
end;

//Esta funçao tem por objetivo verificar se determinado módulo já fechou determinado ciclo (envio ou recebimento);
function VerificaFechamento(const lIdPessJur, lIdModulo: LongInt;
                            const sAnoMesRef: string; const sOperacao: Char;
                            var   cTipoEnvPrev: Char): Boolean;
begin
  Result := False; //Inicializando "Result";

  if not (sOperacao in ['A', 'B', 'E', 'R', 'P']) then
  begin
    MsgDlg('Atenção! Tipo de Operação inválido.', 'Erro', mtError, [mbOK], 0);
    Exit;
  end;

  {-----}

  try
   Screen.Cursor := crHourGlass;

   with TwwQuery.Create(dtmBaseDados) do
   begin
     DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;

     SQL.Add('SELECT DATAFECHAMENTO,');
     SQL.Add('       TIPOENVPREV');
     SQL.Add('FROM   SINCRONPREV');
     SQL.Add('WHERE  IDPESSJUR = ' + IntToStr(lIdPessJur));
     SQL.Add('AND    IDMODULO  = ' + IntToStr(lIdModulo));
     SQL.Add('AND    OPERACAO  = ''' + sOperacao  + '''');
     SQL.Add('AND    ANOMESREF = ''' + sAnoMesRef + '''');

     Open;

     //Se a Query possuir algum registro, "Result" será "True";
     if not IsEmpty then
     begin
       Result := True;
       if not FieldByName('TIPOENVPREV').IsNull then
        cTipoEnvPrev := FieldByName('TIPOENVPREV').AsString[1]
       else
        cTipoEnvPrev := ' ';
     end
     else
     begin
       Result       := False;
       cTipoEnvPrev := ' ';
     end;

     Close;
     Free;
   end;

   Screen.Cursor := crDefault;
   except on Error: Exception do
   begin
     Screen.Cursor := crDefault;
     MsgDlg('Atenção! Não foi possível concluir a verificação devido ao erro: ' + Error.Message,
            'Erro', mtError, [mbOK], 0);
   end;         
  end;  
end;

//Esta função tem por objetivo verificar se um participante já está na prévia ou na efetivação da folha de um determinado mês;
function VerificaPartFolha(const lIdPatro, lIdPlanoPrev, lIdPessoa, lSeqProposta: LongInt;
                           const sAnoMesPgto: string): Boolean;
begin
  Result := False; //Inicializando "Result";

  {-----}

  try
   Screen.Cursor := crHourGlass;

   with TwwQuery.Create(dtmBaseDados) do
   begin
     DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;

     SQL.Add('SELECT MES');
     SQL.Add('FROM   PREVIA');
     SQL.Add('WHERE  IDPATRO     = ' + IntToStr(lIdPatro));
     SQL.Add('AND    IDPLANOPREV = ' + IntToStr(lIdPlanoPrev));
     SQL.Add('AND    IDPESSOA    = ' + IntToStr(lIdPessoa));
     SQL.Add('AND    SEQPROPOSTA = ' + IntToStr(lSeqProposta));
     SQL.Add('AND    MESCOBRANCA = ''' + sAnoMesPgto + '''');
     SQL.Add('UNION');
     SQL.Add('SELECT MES');
     SQL.Add('FROM   HISTRUBSAL');
     SQL.Add('WHERE  IDPATRO     = ' + IntToStr(lIdPatro));
     SQL.Add('AND    IDPESSOA    = ' + IntToStr(lIdPessoa));
     SQL.Add('AND    MESCOBRANCA = ''' + sAnoMesPgto + '''');

     Open;
     Result := not IsEmpty; //Se a Query possuir algum registro, "Result" será "True";

     Close;
     Free;
   end;
   
   Screen.Cursor := crDefault;
   except on Error: Exception do
   begin
     Screen.Cursor := crDefault;
     MsgDlg('Atenção! Não foi possível concluir a verificação devido ao erro: ' + Error.Message,
            'Erro', mtError, [mbOK], 0);
   end;         
  end;  
end;

//Esta função tem por objetivo atualizar a tabela "CTRLINTERFACE", setando o Flag e a Data de Ida; 
function AtualizaCtrlInterfaceCCP(const bFlgIda: Byte; const sDataIda, sMesRef: string): Boolean;
begin
  Result := False; //Inicializando "Result";

  {-----}

  try
   Screen.Cursor := crHourGlass;

   with TwwQuery.Create(dtmBaseDados) do
   begin
     DataBaseName := dtmBaseDados.dbBaseDados.DataBaseName;

     SQL.Add('UPDATE CTRLINTERFACE');
     SQL.Add('SET    FLGIDAINTERFACE  = '   + IntToStr(bFlgIda) + ', ');
     SQL.Add('       DATAIDAINTERFACE = ''' + sDataIda          + '''');
     SQL.Add('WHERE  MESREFERENCIA    = ''' + sMesRef           + '''');

     ExecSQL;
     Free;

     Result := True;
   end;
   
   Screen.Cursor := crDefault;
   except on Error: Exception do
   begin
     Screen.Cursor := crDefault;
     MsgDlg('Atenção! Não foi possível atualizar a tabela de Controle de Interface devido ao erro: ' + Error.Message,
            'Erro', mtError, [mbOK], 0);
   end;         
  end;  
end;

function FechaMesSistema (qry : TwwQuery;
                          psAnoMesRef,
                          psDataFechamento : string;
                          piIdPessJur,
                          piIdModulo       : longint;
                          cOperacao,
                          cTipoEnvPrev     : char ) : boolean;
begin
   Result := False;

   with qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT * FROM SINCRONPREV '+
              ' WHERE  ANOMESREF = '''+psAnoMesRef+''''+
              ' AND    IDPESSJUR = '+IntToStr(piIdPessJur)+
              ' AND    IDMODULO  = '+IntToStr(piIdModulo)+
              ' AND    OPERACAO  = '''+cOperacao+'''');
      Open;

      if IsEmpty
      then begin
         Close;
         SQL.Clear;
         SQL.Add('INSERT INTO SINCRONPREV (ANOMESREF, IDPESSJUR, IDMODULO, OPERACAO,  DATAFECHAMENTO, TIPOENVPREV)');
         SQL.Add('VALUES (''' + Trim(psAnoMesRef) + ''', ' + IntToStr(piIdPessJur) + ', ');
         SQL.Add(IntToStr(piIdModulo) + ', ''' + cOperacao + ''', ' + 'TO_DATE(''' + psDataFechamento + ''',''dd/mm/yyyy''), ');

         if cTipoEnvPrev = ' '
         then SQL.Add('NULL)')
         else SQL.Add('''' + cTipoEnvPrev + ''') ');
      end
      else begin
         Close;
         SQL.Clear;
         SQL.Add('UPDATE SINCRONPREV SET DATAFECHAMENTO = TO_DATE(''' + psDataFechamento + ''',''dd/mm/yyyy'') '+
                 ' WHERE  ANOMESREF = '''+psAnoMesRef+''''+
                 ' AND    IDPESSJUR = '+IntToStr(piIdPessJur)+
                 ' AND    IDMODULO  = '+IntToStr(piIdModulo)+
                 ' AND    OPERACAO  = '''+cOperacao+'''');
      end;

      try
         ExecSQL;
      except
         MsgDlg('Erro ao fechar mês. ', 'Erro', mtError, [mbOk, mbHelp], 0);
         Exit;
      end;
      Close;
   end;
   Result := True;
end;

function ExcluiSincronismo ( qry           : TwwQuery;
                             psAnoMesRef   : string;
                             piIdPessJur,
                             piIdModulo    : longint;
                             cOperacao,
                             cTipoEnvPrev: char ) : boolean;
begin
   Result := False;
   with qry do
   begin
      Close;
      SQL.Clear;
      SQL.Add(' DELETE FROM SINCRONPREV '   +
              ' WHERE (IDPESSJUR    = '   + IntToStr(piIdPessJur) + ')' +
              ' AND   (ANOMESREF    = ''' + psAnoMesRef+''') ' +
              ' AND   (IDMODULO     = '   + IntToStr(piIdModulo) + ')' +
              ' AND   (OPERACAO     = ''' + cOperacao + ''' ) ');

      if cTipoEnvPrev in ['N', 'V', 'A'] then
       SQL.Add(' AND   (TIPOENVPREV  = ''' + cTipoEnvPrev + ''' )');

      try
         ExecSQL;
      except
         MsgDlg('Erro ao desfazer sincronismo. ','Erro',mtError,[mbOk, mbHelp],0);
         Exit;
      end;
   end; // with
   Result := True;
end;

function ProximoMesAberto( psAnoMesRef   : string;
                           piIdPessJur,
                           piIdModulo    : longint;
                           cOperacao     : char ) : string;
var bEncontrou  : boolean;
    sProxAnoMes : string;
    cTipoEnvPrev: Char;
begin
    Result := psAnoMesRef;
    bEncontrou := False;
    sProxAnoMes := psAnoMesRef;
    while not bEncontrou do
    begin
       if not VerificaFechamento( piIdPessJur, piIdModulo,
                                  sProxAnoMes, cOperacao, cTipoEnvPrev)
       then begin
          bEncontrou := True;
          continue;
       end;
       sProxAnoMes := SAnoMesPosterior(sProxAnoMes);
    end;
    Result := sProxAnoMes;
end;

function SAnoMesPosterior(sAnoMes : string) : string;
var iAno, iMes : integer;
begin
  Result := '';
  iAno := StrToInt(Copy(sAnoMes,1,4));
  iMes := StrToInt(Copy(sAnoMes,6,2));

  if iMes = 12
  then begin
     sAnoMes := IntToStr(iAno+1)+'/';
     sAnoMes := sAnoMes+'01';
  end
  else begin
    sAnoMes := IntToStr(iAno)+'/';
    iMes := iMes + 1;
    if iMes <= 9
    then sAnoMes := sAnoMes+'0'+IntToStr(iMes)
    else sAnoMes := sAnoMes+IntToStr(iMes);
  end;
  Result := sAnoMes;
end;

end.
