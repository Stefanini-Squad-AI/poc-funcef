unit uThreadExecutaRegra;

interface

uses
  Classes, Wwquery, SysUtils, DBTables, URegra;

type
  ThreadExecuraRegra = class(TThread)
  private
    { Private declarations }
    FIDExecucao: Integer;
    FIDSeqStart: Integer;
    FNumRegistros: Integer;  protected

    qryRegra: TwwQuery;
    QryExecucao: TwwQuery;
//    qryUpdt : TwwQuery;
    regraAPrev: TRegra;
  protected
    procedure Execute; override;

    function RegraNumerica(sNumRegra,sSQL : string;var sErro : string; var piIdCalculo : integer;
                          psMostraMsg : Boolean = True; limpaRegra : Boolean = False) : string; // Thiago Melo SOL 210200 Kintana 2027146
    procedure TiraSQL( qry : TwwQuery);

    { Rotinas para tratar PONTOS e VIRGULAS do Delphi x  Oracle }
    function OraNumero(sNumero : string):string;
    function ClienteNumero(sNumero : string):string;

  public
    constructor Create;
    procedure Parametros(IDExecucao, IDSeqStart, NumRegistros: Integer);
  end;

implementation

Uses DBaseDados;
{ Important: Methods and properties of objects in VCL can only be used in a
  method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure ThreadExecuraRegra.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ ThreadExecuraRegra }

constructor ThreadExecuraRegra.Create;
begin
    inherited Create(True);

    qryRegra := TwwQuery.Create( nil );
    qryRegra.DatabaseName := 'BASEDADOS';

    QryExecucao := TwwQuery.Create( nil );
    QryExecucao.DatabaseName := 'BASEDADOS';

    regraAPrev := TRegra.Create( nil);
    regraAPrev.DatabaseName := 'BaseDados';
    regraAPrev.QueryIn      := qryRegra;
    regraAPrev.TipoCliente  := tcFundacao;

end;

procedure ThreadExecuraRegra.Parametros(IDExecucao, IDSeqStart, NumRegistros: Integer);
begin
//  inherited  Create(False); // Create the thread suspended
  FIDExecucao := IDExecucao;
  FIDSeqStart := IDSeqStart;
  FNumRegistros := NumRegistros;
//  FreeOnTerminate := True; // Automatically free the thread when it finishes
end;

procedure ThreadExecuraRegra.Execute;
var
    sValorRegra : string;
    sErroRegra  : string;
    iIdCalculo  : Integer;
    sSqlUpdt    : string;
    sErro       : string;
begin
  try
    if not dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.StartTransaction;
  except
    on E: Exception do
    begin
      sErro := e.Message;
    end;
  end;

  try
    QryExecucao.Close();
    QryExecucao.SQL.Clear;
    QryExecucao.sql.Add(' SELECT * FROM CM.LISTA_REGRA_EXECUCAO ' +
                        ' WHERE id_execucao = ' + IntToStr(FIDExecucao) +
                        ' AND (id_seq  >= ' + IntToStr(FIDSeqStart) + ' and id_seq <= ' + IntToStr(FIDSeqStart + (FNumRegistros-1)) + ') ' +
                        ' ORDER BY id_seq');

    try
      QryExecucao.open;
    except
      on E:EDBEngineError do
        begin
           QryExecucao.Close;
           Exit;
        end;
    end;

    while not QryExecucao.eof do
    begin
      try
        //Memo1.Lines.Add('Chamando regra - ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', now) );

        sValorRegra := RegraNumerica(QryExecucao.FieldByName('ID_REGRA').AsString,
                                   QryExecucao.FieldByName('SQL_ENTRADA').AsString,
                                   sErroRegra,
                                   iIdCalculo,
                                   False,
                                   True);

        //Memo1.Lines.Add('Montndo sql - ' + FormatDateTime('dd/mm/yyyy hh:mm:ss', now) );

        sSqlUpdt := 'update CM.LISTA_REGRA_EXECUCAO set ' +
                    ' resultado = ' + QuotedStr(sValorRegra) +
                    ' , erro = ' + QuotedStr(sErroRegra) +
                    ' , data_execucao =  TO_DATE(' + QuotedStr(FormatDateTime('yyyy/mm/dd hh:mm:ss', now)) + ', ''yyyy/mm/dd hh24:mi:ss'')' +
                    ' where ' +
                    ' id_execucao = ' + QryExecucao.FieldByName('id_execucao').asString +
                    ' and id_seq = ' + QryExecucao.FieldByName('id_seq').asString;

        dtmBaseDados.dbBaseDados.Execute(sSqlUpdt) ;
      except
        on E:EDBEngineError do
          begin
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

      QryExecucao.Next;
    end;


    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.commit;

    QryExecucao.close;

    //ShowMessage('Fim Execução.');

  Finally
    if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;

    //FreeAndNil(QryExecucao);
    //FreeAndNil(regraAPrev);
    //FreeAndNil(QryRegra);
  end;

end;


function ThreadExecuraRegra.RegraNumerica(sNumRegra,sSQL : string; var sErro : String; var piIdCalculo : longInt;
                       psMostraMsg : Boolean = True; limpaRegra : Boolean = False) : string;
var cAux : char;
begin

   Result := '0';
   sErro := '';

   if limpaRegra then begin
     regraAPrev.LimpaVariaveis;
   end;
   // Se o idcalculo for menor que zero, entao igualar a zero, pois a regra dá
   // erro se o idcalculo for menor que zero
   if piIdCalculo < 0 then piIdCalculo := 0;
   if Trim(sNumRegra) = '' then Exit;

   //with dtmExecutaRegra do
   //begin
      try
        regraAPrev.RuleName := sNumRegra;
      except
        on E:Exception do begin
           sErro     := E.Message;
        end;
       End;

      qryRegra.Close;
      qryRegra.SQL.Clear;
      qryRegra.SQl.Add(sSQL);
      qryRegra.Open;
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
      //regraAPrev.QueryIn        := dtmExecutaRegra.qryRegra;
      regraAPrev.QueryIn        := qryRegra;
      regraAPrev.IdCalculo      := piIdCalculo;
      regraAPrev.ExibeMensagens := psMostraMsg;
      try
         { Tratamento de Erros }
         Try
           regraAPrev.Execute;
         Except
           on E:Exception do
            begin
             sErro     := E.Message;
             qryRegra.Close;
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
           on E:Exception do
            begin
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


   //end;
end;

procedure ThreadExecuraRegra.TiraSQL( qry : TwwQuery);
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

function ThreadExecuraRegra.ClienteNumero(sNumero : string):string;
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

function ThreadExecuraRegra.OraNumero(sNumero : string):string;
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

end.



