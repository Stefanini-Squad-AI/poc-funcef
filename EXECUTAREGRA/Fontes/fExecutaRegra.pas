unit fExecutaRegra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FTelaAut, IvDictio, IvMulti, IvEMulti, StdCtrls, Db, ADODB, DBTables,Wwquery,
  ExtCtrls, FileCtrl;

type
  TfrmExecutaRegra = class(TfrmTelaAutorizacao)
    btnProcessa: TButton;
    QryExecucao: TwwQuery;
    mLog: TMemo;
    lblIdExecucao: TLabel;
    lblIdArquivo: TLabel;
    lblIdDebug: TLabel;
    procedure btnProcessaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    iProcesso : string;
    iSeqIni   : string;
    iSeqFim   : string;
    bDebug    : boolean;
    bParar    : boolean;
    bDisplay  : boolean;
    //Path      : string; //wo23149 leandro
    sEscopo   : string; //wo23149 leandro
    sPathArq  : string; //wo23149 leandro
    sNomeArq  : string; //wo23149 leandro

    bErro     : boolean;

   procedure Gravalog(sTexto, sExt:string; bLimpaArquivo : boolean = True );
   procedure MostraTela(bMostra:boolean = false);

   function RegraNumerica(sNumRegra,sSQL : string;var sErro : string; var piIdCalculo : integer;
                          psMostraMsg : Boolean = True; limpaRegra : Boolean = False) : string; // Thiago Melo SOL 210200 Kintana 2027146
   procedure TiraSQL( qry : TwwQuery);

   { Rotinas para tratar PONTOS e VIRGULAS do Delphi x  Oracle }
   function OraNumero(sNumero : string):string;
   function ClienteNumero(sNumero : string):string;

    //edilaine WO28421 : inicio
    function Insere_Regra_Irrf_BaseTrib(prParametros : string) : boolean;
    function Retorna_Valores_IRRF_Reducao : string;
    //edilaine WO28421 : fim


  public
    { Public declarations }
    property idProcesso : string  read iProcesso write iProcesso;
    property idSeqIni   : string  read iSeqIni   write iSeqIni;
    property idSeqFim   : string  read iSeqFim   write iSeqFim;
    property Debug      : boolean read bDebug    write bDebug;
    property Display    : boolean read bDisplay  write MostraTela;
    property Escopo     : string  read sEscopo   write sEscopo;  //wo23149 leandro
    property PathArq    : string  read sPathArq  write sPathArq; //wo23149 leandro
    property NomeArq    : string  read sNomeArq  write sNomeArq; //wo23149 leandro

    property ErroProcessar : boolean  read bErro write bErro;

    procedure Dispara;


  end;

var
  frmExecutaRegra: TfrmExecutaRegra;


implementation
Uses  UDataBase, fAguarde,DBaseDados, uAutorizacao, uExecutaRegra, uSistema ;

{$R *.DFM}


//edilaine WO28421 : inicio
function iif(bCondicao : boolean; sVerdade,sFalso : string) : string;
begin
  if bCondicao then result := sVerdade
               else result := sFalso;
end;
//edilaine WO28421 : fim


procedure TfrmExecutaRegra.Dispara;
begin
  //Path := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\ETL_REGRA\'; //wo23149 leandro
  bErro := false;
  btnProcessa.OnClick(Self);

  //close(); wo25641 - Leandro
end;

procedure TfrmExecutaRegra.Gravalog(sTexto, sExt:string; bLimpaArquivo : boolean);
var
  ArqLog : String;
  fLog   : TextFile;
begin

 if (Length(trim(sPathArq)) = 0 ) or (Length(trim(sNomeArq)) = 0 ) then
    exit;

  if not DirectoryExists(sPathArq)then
  begin
     if not CreateDir(sPathArq) then
     begin
        ForceDirectories(sPathArq);
     end;
  end;

  ArqLog := sPathArq + sNomeArq;
  AssignFile(fLog, ArqLog);
  if bLimpaArquivo then
    Rewrite(fLog)
  else
    Append(fLog);
  Writeln(fLog,sTexto);
  CloseFile(fLog);
end;

procedure TfrmExecutaRegra.btnProcessaClick(Sender: TObject);
var
   sValorRegra : string;
   sErroRegra  : string;
   iIdCalculo  : Integer;
   sSqlUpdt    : string;
   iContProc   : Integer;
   sParamOut   : string;   //edilaine WO28421
begin
  inherited;

  try

    mLog.Lines.Clear;
    lblIdExecucao.Caption := 'ID Execução : ' + iProcesso +
                             '  |  ' +
                             ' Escopo : ' + sEscopo   +
                             '  |  ' +
                             ' Seq Inicial : ' + iSeqIni   +
                             '  |  ' +
                             ' Seq Final : ' + iSeqFim ;


    lblIdArquivo.Caption  := 'Arquivo : ' + PathArq + NomeArq;

    if bDebug then
      lblIdDebug.Caption    := 'Debug - Log  : True'
    else
      lblIdDebug.Caption    := 'Debug - Log  : False';

    lblIdDebug.Caption    := lblIdDebug.Caption + '  |  ' ;

    if bDisplay then
      lblIdDebug.Caption    := lblIdDebug.Caption + 'Debug - Tela : True'
    else
      lblIdDebug.Caption    := lblIdDebug.Caption + 'Debug - Tela : False';



{        sSqlUpdt := 'UPDATE LISTA_REGRA_EXECUCAO  ' +
                   ' SET RESULTADO = NULL, ERRO = NULL, DATA_EXECUCAO = NULL ' +
                   ' WHERE ID_EXECUCAO = 13 AND (id_seq  >= 103800 and id_seq <= 103900) ';
        dtmBaseDados.dbBaseDados.Execute(sSqlUpdt) ;
}


    QryExecucao := TwwQuery.Create( nil );
    QryExecucao.DatabaseName := 'BASEDADOS';
    //QryExecucao.close;
    QryExecucao.SQL.Clear;
    //wo23149 leandro - inicio
    //QryExecucao.sql.Add('select * from CM.LISTA_REGRA_EXECUCAO WHERE id_execucao = ' + iProcesso  + ' and (id_seq  >= ' + iSeqIni + ' and id_seq <= ' + iSeqFim  + ') order by id_seq');
    QryExecucao.sql.Add('select * from CM.LISTA_REGRA_EXECUCAO ');

    if ((iProcesso = '#') or (iProcesso = ''))then
      QryExecucao.sql.Add(' WHERE id_execucao > 0')
    else
      QryExecucao.sql.Add(' WHERE id_execucao = ' + iProcesso  );

    if (Escopo = 'A') then
      QryExecucao.sql.Add(' and (data_execucao is null)');


    if ((iSeqIni <> '#') and (iSeqIni <> '')) and ((iSeqFim <> '#') and (iSeqFim <> '')) then
      QryExecucao.sql.Add(' and (id_seq  >= ' + iSeqIni + ' and id_seq <= ' + iSeqFim  + ')');

    QryExecucao.sql.Add(' order by id_seq');

    //wo23149 leandro - fim

    try
      QryExecucao.open;
    except
      on E:EDBEngineError do
        begin
           //ShowMessage(E.Message);
           if Debug then mLog.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', now) +
                           ' Erro Regra ' +
                           ' Erro: ' + e.Message);
           QryExecucao.Close;
           //Application.Terminate;
           berro := True;
           Exit;
        end;
    end;

    if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;

    bParar := false;
    iContProc := 0;

    while not QryExecucao.eof do
    begin
      Inc(iContProc);

      try
        if Debug then mLog.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', now) +
                       ' Chamando Regra - ID Regra: ' + QryExecucao.FieldByName('ID_REGRA').AsString +
                       ' ID Execução: ' + QryExecucao.FieldByName('ID_EXECUCAO').AsString +
                       ' ID Seq: ' + QryExecucao.FieldByName('ID_SEQ').AsString);

          //edilaine WO28421 : inicio
          if QryExecucao.FieldByName('REDUCAO_PARAMETROS').AsString <> '' then
             Insere_Regra_Irrf_BaseTrib(QryExecucao.FieldByName('REDUCAO_PARAMETROS').AsString );
          //edilaine WO28421 : fim

          sValorRegra := RegraNumerica(QryExecucao.FieldByName('ID_REGRA').AsString,
                                   QryExecucao.FieldByName('SQL_ENTRADA').AsString,
                                   sErroRegra,
                                   iIdCalculo,
                                   False,
                                   True);

          //edilaine WO28421 : inicio
          sParamOut := '';
          if sValorRegra <> '' then
             sParamOut := Retorna_Valores_IRRF_Reducao();
          //edilaine WO28421 : fim

        if Debug then mLog.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', now) +
                       ' Resultado Regra - ID Regra: ' + QryExecucao.FieldByName('ID_REGRA').AsString +
                       ' ID Execução: ' + QryExecucao.FieldByName('ID_EXECUCAO').AsString +
                       ' ID Seq: ' + QryExecucao.FieldByName('ID_SEQ').AsString +
                       ' Valor: ' + sValorRegra +
                       ' Erro: ' + sErroRegra);

        sSqlUpdt := 'update CM.LISTA_REGRA_EXECUCAO set ' +
                    ' resultado = ' + QuotedStr(sValorRegra) +
                    ' , erro = ' + QuotedStr(sErroRegra) +
                    ' , data_execucao =  TO_DATE(' + QuotedStr(FormatDateTime('yyyy/mm/dd hh:mm:ss', now)) + ', ''yyyy/mm/dd hh24:mi:ss'')' +
                    ' , reducao_paramout = '+QuotedStr(sParamOut) +   //edilaine WO28421
                    ' where ' +
                    ' id_execucao = ' + QryExecucao.FieldByName('id_execucao').asString +
                    ' and id_seq = ' + QryExecucao.FieldByName('id_seq').asString;


        if Debug then mLog.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', now) +
                       ' Gravando Regra - ID Regra: ' + QryExecucao.FieldByName('ID_REGRA').AsString +
                       ' ID Execução: ' + QryExecucao.FieldByName('ID_EXECUCAO').AsString +
                       ' ID Seq: ' + QryExecucao.FieldByName('ID_SEQ').AsString +
                       ' Valor: ' + sValorRegra +
                       ' Erro: ' + sErroRegra);

        dtmBaseDados.dbBaseDados.Execute(sSqlUpdt) ;

        if Debug then mLog.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', now) +
                       ' Fez Regra - ID Regra: ' + QryExecucao.FieldByName('ID_REGRA').AsString +
                       ' ID Execução: ' + QryExecucao.FieldByName('ID_EXECUCAO').AsString +
                       ' ID Seq: ' + QryExecucao.FieldByName('ID_SEQ').AsString +
                       ' Valor: ' + sValorRegra +
                       ' Erro: ' + sErroRegra);

        application.ProcessMessages;

        if Debug then mLog.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', now) +
                       ' ProcessMessages Regra - ID Regra: ' + QryExecucao.FieldByName('ID_REGRA').AsString +
                       ' ID Execução: ' + QryExecucao.FieldByName('ID_EXECUCAO').AsString +
                       ' ID Seq: ' + QryExecucao.FieldByName('ID_SEQ').AsString +
                       ' Valor: ' + sValorRegra +
                       ' Erro: ' + sErroRegra);

      except
        on E:Exception do
          begin
            if Debug then mLog.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', now) +
                           ' Erro Regra - ID Regra: ' + QryExecucao.FieldByName('ID_REGRA').AsString +
                           ' ID Execução: ' + QryExecucao.FieldByName('ID_EXECUCAO').AsString +
                           ' ID Seq: ' + QryExecucao.FieldByName('ID_SEQ').AsString +
                           ' Valor: ' + sValorRegra +
                           ' Erro: ' + sErroRegra + ' - ' + e.Message);

            sSqlUpdt := 'update CM.LISTA_REGRA_EXECUCAO set ' +
                        ' resultado = ' + QuotedStr(sValorRegra) +
                        ' , erro = ' + QuotedStr(E.Message) +
                        ' , data_execucao =   TO_DATE(' + QuotedStr(FormatDateTime('yyyy/mm/dd hh:mm:ss', now)) + ', ''yyyy/mm/dd hh24:mi:ss'')' +
                        ' where ' +
                        ' id_execucao = ' + QryExecucao.FieldByName('id_execucao').asString +
                        ' and id_seq = ' + QryExecucao.FieldByName('id_seq').asString;

            dtmBaseDados.dbBaseDados.Execute(sSqlUpdt);
          end;
      end;

      Try
        if iContProc >= 1000 then
        begin
          iContProc := 0;
          if dtmBaseDados.dbBaseDados.InTransaction then
           dtmBaseDados.dbBaseDados.commit;
        end;
      Except
        on E:Exception do
          begin
            if Debug then mLog.Lines.Add(FormatDateTime('dd/mm/yyyy hh:mm:ss', now) +
                           ' Erro Regra - Não foi possivel realizar commit' +
                           ' Erro: ' + sErroRegra + ' - ' + e.Message);
          end;
      end;

      QryExecucao.Next;
    end;

    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.commit;

    QryExecucao.close;

    Gravalog('PROCESSAMENTO: OK','OK');

    if Debug then
      Gravalog(mLog.text,'OK', false);

    //Application.Terminate;

  except
    on E:Exception do
    begin
      Gravalog('PROCESSAMENTO: ERRO','ERR');
      Gravalog('ERRO: ' + E.Message,'ERR',false);

      if Debug then
        Gravalog(mLog.text,'ERR',false);

      if dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Rollback;

      //QryExecucao.Close;

      //Application.Terminate;
      bErro := True;

      Exit;
    end;
  END;

  //Application.Terminate;
end;


function TfrmExecutaRegra.RegraNumerica(sNumRegra,sSQL : string; var sErro : String; var piIdCalculo : longInt;
                       psMostraMsg : Boolean = True; limpaRegra : Boolean = False) : string;
var cAux : char;
begin
   Result := '0';
   sErro := '';

   if limpaRegra then begin
     dtmExecutaRegra.regraAPrev.LimpaVariaveis;
   end;
   // Se o idcalculo for menor que zero, entao igualar a zero, pois a regra dá
   // erro se o idcalculo for menor que zero
   if piIdCalculo < 0 then piIdCalculo := 0;
   if Trim(sNumRegra) = '' then Exit;

   with dtmExecutaRegra do
   begin
      try
        regraAPrev.RuleName := sNumRegra;
      except
        on E:Exception do begin
           sErro     := E.Message;
         end;
      End;

      try
        qryRegra.Close;
        qryRegra.SQL.Clear;
        qryRegra.SQl.Add(sSQL);
        qryRegra.Open;
      except
        on E:Exception do begin
          sErro     := E.Message;
          Result := '0';
          Exit;
        end;
      End;

      // Se a query estiver vazia, passar uma query generica pois talvez
      // a regra nao precise de nenhum campo da query, mas precisa de uma
      // linha qualquer.
      if qryRegra.IsEmpty
      then begin
         Result := '';
         sErro  := '';
         qryRegra.Close;
         tirasql(qryregra);
         Exit;
      end;
      cAux                      := DecimalSeparator;
      regraAPrev.QueryIn        := dtmExecutaRegra.qryRegra;
      regraAPrev.IdCalculo      := piIdCalculo;
      regraAPrev.ExibeMensagens := psMostraMsg;
      try
         If (Sistema.NomeUsuario = 'AUGUSTO.CM') Then Begin
           regraAPrev.QueryIn.SQL.SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\TEMP\REGRA-'+regraAPrev.RuleName+'.TXT');

           regraAPrev.FlgReloadRule := True;
         End;

         { Tratamento de Erros }
         Try
           regraAPrev.Execute;
         Except
           on E:Exception do begin
             sErro     := E.Message;
             qryRegra.Close;
             Result := '0'; //WO25641
           end;
         End;


      finally
         DecimalSeparator := cAux;

      end;

      if not regraAPrev.Error
      then begin
         piIdCalculo := regraAPrev.IdCalculo;

         try
            StrToFloat(ClienteNumero(RegraAPrev.Result));
            Result := OraNumero(regraAPrev.Result);
         except
           on E:Exception do begin
             sErro     := E.Message;
             Result := '0';
           end;
         end;

      end
      else begin
         sErro := regraAPrev.MessageInfo;
         piIdCalculo := -1;
      end;

      qryRegra.Close;
   end;
end;

procedure TfrmExecutaRegra.TiraSQL( qry : TwwQuery);
begin
   with qry do
   begin
     Close;
     SQL.Clear;
     SQL.Add(' SELECT 1 FROM DUAL ');
     Open;
     Close;
   end;
end;

function TfrmExecutaRegra.ClienteNumero(sNumero : string):string;
var i : integer;
    sResult,
    sCliente : string;
    bPrimPonto : boolean;
begin
   if Trim(sNumero)  = ''
   then begin
      Result := '0';
      exit;
   end;

   sCliente := '';
   bPrimPonto := False;
   for i := length(Trim(sNumero)) downto 1
   do begin
     if sNumero[i] = '.'
     then begin
        if not bPrimPonto
        then begin
           sCliente := sCliente + DecimalSeparator;
           bPrimPonto := True;
        end
        else sCliente := sCliente;
     end
     else begin
        if sNumero[i] <> DecimalSeparator
        then sCliente := sCliente + sNumero[i]
        else begin
           if not bPrimPonto
           then begin
              sCliente := sCliente+DecimalSeparator;
              bPrimPonto := True;
           end
           else sCliente := sCliente;
        end;
     end;
   end;
   sResult := '';
   for i := length(sCliente) downto 1
   do begin
      sResult := sResult + sCliente[i];
   end;
   Result := sResult;
end;

function TfrmExecutaRegra.OraNumero(sNumero : string):string;
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


procedure TfrmExecutaRegra.FormClose(Sender: TObject;  var Action: TCloseAction);
begin
  inherited;
  try
    //Application.Terminate;
  Except
  end;
end;

procedure TfrmExecutaRegra.MostraTela(bMostra : boolean = false);
begin
  visible := bMostra;

end;
procedure TfrmExecutaRegra.FormCreate(Sender: TObject);
begin
  DecimalSeparator := '.';
  ThousandSeparator := ',';

  inherited;

end;

//edilaine WO28421
function TfrmExecutaRegra.Insere_Regra_Irrf_BaseTrib(prParametros : string) : boolean;
var
  qry: TwwQuery;
  sTexto, sSql: string;
begin
  try
    qry := TwwQuery.Create(nil);
    qry.DataBaseName :='BaseDados';

    sTexto := StringReplace(prParametros, '||', ',', [rfReplaceAll]);

    sSQL := 'INSERT INTO CM.REGRA_IRRF_REDUCAO(SEQ, PARAMETROS_IN) '+ #13#10 +
            'VALUES( '+ #13#10 +
            '(SELECT COUNT(1) + 1 FROM CM.REGRA_IRRF_REDUCAO), '+ #13#10 +
             QuotedStr(sTexto) + #13#10 +
            ')';
    qry.close;
    qry.SQL.Clear;
    qry.SQL.Text := sSQL;
    try
      qry.ExecSQL;
    except

    end;
  finally
    FreeAndNil(qry);
  end;
end;


function TfrmExecutaRegra.Retorna_Valores_IRRF_Reducao : string;
var
  query, queryDelete:TwwQuery;
  sSQL: string;
begin
  query := TwwQuery.Create(nil);
  queryDelete := TwwQuery.Create(nil);
  try
    try
      sSQL := 'SELECT SEQ, VALOR_IMPOSTO, VALOR_REDUCAO, VALOR_REDUCAOINSS, VALOR_REDUCAOTOT, ' + #13#10 +
              '       VALOR_TRIBUTAVEL, VALOR_TRIBUTINSS, VALOR_TRIBUTTOTAL                   ' + #13#10 +
              '  FROM CM.REGRA_IRRF_REDUCAO ';

      query.DataBaseName := 'BaseDados';
      query.SQL.clear;
      query.SQL.Add(sSQL);
      query.open;
      if not(query.IsEmpty) then
      begin

        result := iif(query.FieldByName('VALOR_TRIBUTAVEL').AsString  = '', '0', query.FieldByName('VALOR_TRIBUTAVEL').AsString)  +'||'+
                  iif(query.FieldByName('VALOR_TRIBUTINSS').AsString  = '', '0', query.FieldByName('VALOR_TRIBUTINSS').AsString)  +'||'+
                  iif(query.FieldByName('VALOR_TRIBUTTOTAL').AsString = '', '0', query.FieldByName('VALOR_TRIBUTTOTAL').AsString) +'||'+
                  iif(query.FieldByName('VALOR_IMPOSTO').AsString     = '', '0', query.FieldByName('VALOR_IMPOSTO').AsString)     +'||'+
                  iif(query.FieldByName('VALOR_REDUCAO').AsString     = '', '0', query.FieldByName('VALOR_REDUCAO').AsString)     +'||'+
                  iif(query.FieldByName('VALOR_REDUCAOINSS').AsString = '', '0', query.FieldByName('VALOR_REDUCAOINSS').AsString) +'||'+
                  iif(query.FieldByName('VALOR_REDUCAOTOT').AsString  = '', '0', query.FieldByName('VALOR_REDUCAOTOT').AsString);

        result := StringReplace( result, ',', '.', [rfReplaceAll]);

      end
      else
        result := '';

      sSQL := 'DELETE FROM CM.REGRA_IRRF_REDUCAO';
      queryDelete.DataBaseName := 'BaseDados';
      queryDelete.SQL.clear;
      queryDelete.SQL.Add(sSQL);
      queryDelete.ExecSQL;

    except
      result := '';
    end;
  finally
    FreeAndNil(query);
    FreeAndNil(queryDelete);
  end;
end;
//edilaine WO28421 : fim



end.
