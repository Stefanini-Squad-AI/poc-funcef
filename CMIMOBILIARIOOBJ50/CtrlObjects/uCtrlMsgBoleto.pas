unit uCtrlMsgBoleto;

// -----------------------------------------------------------------------------
//
//      OBJETO DE CONTROLE DE MENSAGENS DE BOLETO  ( MT )
//
//      Módulo          :  Comuns Imobiliário
//	Autor           :  Vinícius Meyer Lana
//	Data de Início  :  13/09/2002
//	Data de Término :  13/09/2002
//
//  FUNÇÕES PUBLICADAS:
//
//      GravaMsgBoleto     -  Insere, Altera e Exclui cadastro de MsgBoleto     ( TLB )
//      LookupMsgBoleto    -  Abre um ou mais registros de MsgBoleto
//      LookupMsgComLinhas -  Abre uma ou mais mensagens com as devidas linhas
// -----------------------------------------------------------------------------

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, DbClient, DB,
     uDbMsgBoleto, uDbLinhaMsgBoleto, uCMTypes;

Type TCtrlMsgBoleto = class(TCmControlObject)
     private
       FCdsMsgBoleto: TCMClientDataSet;
       FDbMsgBoleto : TDbMsgBoleto;
       FDbLinhaMsgBoleto: TDbLinhaMsgBoleto;
       procedure SetCdsMsgBoleto(const Value: TCMClientDataSet);
       procedure SetDbMsgBoleto (const Value: TDbMsgBoleto);
       procedure SetDbLinhaMsgBoleto(const Value: TDbLinhaMsgBoleto);

     protected
       procedure AfterInitialize;  Override;
       procedure OnCreateAppServer; Override;

       procedure OnApplyCdsRecord   (aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Var Accept: Boolean); Override;
       procedure AfterApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean);     Override;

     public
       constructor Create;  override;
       destructor  Destroy; override;

       property DbMsgBoleto  : TDbMsgBoleto     read FDbMsgBoleto  write SetDbMsgBoleto;
       property CdsMsgBoleto : TCMClientDataSet read FCdsMsgBoleto write SetCdsMsgBoleto;
       property DbLinhaMsgBoleto : TDbLinhaMsgBoleto read FDbLinhaMsgBoleto write SetDbLinhaMsgBoleto;

       function GravaMsgBoleto  : Boolean;
       function ExcluiMsgBoleto (const iDocumento:Integer; const bTransacao: Boolean = True): Boolean;
       function LookupMsgBoleto(const iIdMsgBoleto:Integer; const iIdModulo:Integer = -1) : OLEVariant;
       function LookupMsgBoletoComLinhas(const iIdMsgBoleto, iIdDocumento: Integer; const iIdModulo:Integer = -1) : OLEVariant;

     published

end;



implementation

{ TCtrlMsgBoleto }

constructor TCtrlMsgBoleto.Create;
begin
  inherited;
  // Cria os DbOjbects
  FDbMsgBoleto := TDBMsgBoleto.Create( Self );
  FDbLinhaMsgBoleto := TDBLinhaMsgBoleto.Create( Self );
end;

destructor TCtrlMsgBoleto.Destroy;
begin
  // Destrói os DbObjects criados
  FDbMsgBoleto.Free;
  FDbLinhaMsgBoleto.Free;
  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then FCdsMsgBoleto.Free;
  inherited;
end;

procedure TCtrlMsgBoleto.OnCreateAppServer;
begin
  inherited;
  // Cria os Cds somente no caso de execução pela aplicação servidora, pois na
  // aplicação cliente, os mesmos já foram criados.
  FCdsMsgBoleto := TCMClientDataSet.Create( nil );
end;

procedure TCtrlMsgBoleto.AfterInitialize;
begin
  inherited;
  // define o DataBase a ser utilizado
  FDbMsgBoleto.DataBaseName      := DataBaseName;
  FDbLinhaMsgBoleto.DataBaseName := DataBaseName;
end;

function TCtrlMsgBoleto.GravaMsgBoleto: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaMsgBoleto( CdsMsgBoleto.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsMsgBoleto, DbMsgBoleto, [], [] );
      if not Result then raise Exception.Create( DbMsgBoleto.MessageInfo );
      Commit;
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;


procedure TCtrlMsgBoleto.OnApplyCdsRecord(aCds: TClientDataSet; const sTableName: String;
                                          CdsState: TUpdateStatus; var Accept: Boolean);
var i : Integer;
begin
  inherited;
  Accept := True;
  if AnsiUpperCase(sTableName) = 'MSGBOLETO' then begin
    if CdsState in [usModified, usDeleted] then begin
      try
        // Exclui todas as linhas do boleto ( 9 linha Fixas )
        for i := 1 to 9 do begin
          DbLinhaMsgBoleto.Idmsgboleto.AsInteger := aCds.FieldByName('IDMSGBOLETO').AsInteger;
          DbLinhaMsgBoleto.Lmbnumlinha.AsInteger := i;
          if not DbLinhaMsgBoleto.Delete then raise Exception.Create( DbLinhaMsgBoleto.MessageInfo );
        end;
      except
        on E : Exception do begin
          Accept := False;
          MessageInfo := E.Message;
        end;
      end;
    end;
  end;
end;


procedure TCtrlMsgBoleto.AfterApplyCdsRecord(aCds: TClientDataSet; const sTableName: String;
                                             CdsState: TUpdateStatus; Accept: Boolean);
var i : Integer;
    sLinha : String;
begin
  inherited;
  Accept := True;
  if AnsiUpperCase(sTableName) = 'MSGBOLETO' then begin
    if CdsState in [usModified, usInserted] then begin
      try
        // Insere as linhas do boleto ( 9 linha Fixas )
        for i := 1 to 9 do begin
          sLinha := 'TEXTOLINHA_' + Trim(IntToStr(i));
          if not aCds.FieldByName(sLinha).IsNull then begin
            DbLinhaMsgBoleto.Idmsgboleto.AsInteger  := DbMsgBoleto.Idmsgboleto.AsInteger;
            DbLinhaMsgBoleto.Lmbnumlinha.AsInteger  := i;
            DbLinhaMsgBoleto.Lmbtextolinha.AsString := aCds.FieldByName(sLinha).AsString;
            if not DbLinhaMsgBoleto.Insert then raise Exception.Create( DbLinhaMsgBoleto.MessageInfo );
          end;
        end;
      except
        on E : Exception do begin
          Accept := False;
          MessageInfo := E.Message;
        end;
      end;
    end;
  end;
end;


function TCtrlMsgBoleto.ExcluiMsgBoleto(const iDocumento: Integer; const bTransacao: Boolean): Boolean;
var sSql : String;
begin
  Result := True;
  try
    if bTransacao then StartTransaction;

    // Apaga as linhas da mensagem do boleto
    sSql := 'DELETE FROM LINHAMSGBOLETO '+#13+
            ' WHERE IDMSGBOLETO IN( SELECT DISTINCT IDMSGBOLETO '+#13+
            '                         FROM MSGBOLETO '+#13+
            '                        WHERE IDDOCUMENTO = ' + InttoStr(iDocumento) + ' )';
    if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );

    // Apaga o cabeçalho da mensagem do boleto no Imobiliário
    sSql := 'DELETE FROM MSGBOLETO '+#13+
            ' WHERE IDDOCUMENTO = ' + InttoStr(iDocumento);
    if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );

    // Apaga a mensagem CNAB
    sSql := 'DELETE FROM MENSAGENSCNAB '+#13+
            ' WHERE CODDOCUMENTO = ' + InttoStr(iDocumento);
    if not ExecSQL( sSql ) then raise Exception.Create( MessageInfo );

    if bTransacao then Commit;
  except
    on e : Exception do begin
      Result := False;
      if bTransacao then Rollback;
      MessageInfo := e.message;
    end;
  end;
end;


function TCtrlMsgBoleto.LookupMsgBoleto(const iIdMsgBoleto, iIdModulo: Integer): OLEVariant;
var sSql, sParam : String;
begin
  sParam := '';
  if iIdMsgBoleto <> -1 then sParam := ' AND IDMSGBOLETO = ' + IntToStr(iIdMsgBoleto);
  if iIdModulo    <> -1 then sParam := ' AND IDMODULO = '    + IntToStr(iIdModulo);

  sSql := 'SELECT  IDMSGBOLETO, MSGDESCRICAO ' +#13+
          '  FROM  MSGBOLETO ' +#13+
          ' WHERE IDDOCUMENTO IS NULL ' +#13+ sParam +
          ' ORDER BY MSGDESCRICAO ';
  Result := GetDataPacket( sSql );
end;

function TCtrlMsgBoleto.LookupMsgBoletoComLinhas(const iIdMsgBoleto, iIdDocumento, iIdModulo: Integer): OLEVariant;
var sSql, sParam : String;
begin
  sParam := '';
  if iIdMsgBoleto <> -1 then sParam := sParam + ' AND M.IDMSGBOLETO = ' + IntToStr(iIdMsgBoleto);
  if iIdModulo    <> -1 then sParam := sParam + ' AND M.IDMODULO = '    + IntToStr(iIdModulo);
  if iIdDocumento <> -1 then
       sParam := sParam + ' AND M.IDDOCUMENTO = ' + IntToStr(iIdDocumento)
  else sParam := sParam + ' AND M.IDDOCUMENTO IS NULL ';

  sSql := 'SELECT M.IDMSGBOLETO, M.MSGDESCRICAO, M.IDDOCUMENTO, M.IDMODULO,   ' +#13+
          '       L1.LMBNUMLINHA AS LINHA_1, L1.LMBTEXTOLINHA AS TEXTOLINHA_1,' +#13+
          '       L2.LMBNUMLINHA AS LINHA_2, L2.LMBTEXTOLINHA AS TEXTOLINHA_2,' +#13+
          '       L3.LMBNUMLINHA AS LINHA_3, L3.LMBTEXTOLINHA AS TEXTOLINHA_3,' +#13+
          '       L4.LMBNUMLINHA AS LINHA_4, L4.LMBTEXTOLINHA AS TEXTOLINHA_4,' +#13+
          '       L5.LMBNUMLINHA AS LINHA_5, L5.LMBTEXTOLINHA AS TEXTOLINHA_5,' +#13+
          '       L6.LMBNUMLINHA AS LINHA_6, L6.LMBTEXTOLINHA AS TEXTOLINHA_6,' +#13+
          '       L7.LMBNUMLINHA AS LINHA_7, L7.LMBTEXTOLINHA AS TEXTOLINHA_7,' +#13+
          '       L8.LMBNUMLINHA AS LINHA_8, L8.LMBTEXTOLINHA AS TEXTOLINHA_8,' +#13+
          '       L9.LMBNUMLINHA AS LINHA_9, L9.LMBTEXTOLINHA AS TEXTOLINHA_9 ' +#13+
          '  FROM MSGBOLETO M, '+#13+
          '       ( '+#13+
          '        SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA '+#13+
          '        FROM     LINHAMSGBOLETO  '+#13+
          '        WHERE    LMBNUMLINHA = 1 '+#13+
          '        ) L1, '+#13+
          '        ( '+#13+
          '        SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA '+#13+
          '        FROM     LINHAMSGBOLETO  '+#13+
          '        WHERE    LMBNUMLINHA = 2 '+#13+
          '        ) L2, '+#13+
          '        ( '+#13+
          '        SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA '+#13+
          '        FROM     LINHAMSGBOLETO  '+#13+
          '        WHERE    LMBNUMLINHA = 3 '+#13+
          '        ) L3, '+#13+
          '        ( '+#13+
          '        SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA '+#13+
          '        FROM     LINHAMSGBOLETO  '+#13+
          '        WHERE    LMBNUMLINHA = 4 '+#13+
          '        ) L4, '+#13+
          '        ( '+#13+
          '        SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA '+#13+
          '        FROM     LINHAMSGBOLETO  '+#13+
          '        WHERE    LMBNUMLINHA = 5 '+#13+
          '        ) L5, '+#13+
          '        ( '+#13+
          '        SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA '+#13+
          '        FROM     LINHAMSGBOLETO  '+#13+
          '        WHERE    LMBNUMLINHA = 6 '+#13+
          '        ) L6, '+#13+
          '        ( '+#13+
          '        SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA '+#13+
          '        FROM     LINHAMSGBOLETO  '+#13+
          '        WHERE    LMBNUMLINHA = 7 '+#13+
          '        ) L7, '+#13+
          '        ( '+#13+
          '        SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA '+#13+
          '        FROM     LINHAMSGBOLETO  '+#13+
          '        WHERE    LMBNUMLINHA = 8 '+#13+
          '        ) L8, '+#13+
          '        ( '+#13+
          '        SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA '+#13+
          '        FROM     LINHAMSGBOLETO  '+#13+
          '        WHERE    LMBNUMLINHA = 9 '+#13+
          '        ) L9 '+#13+
          '  WHERE ( M.IDMSGBOLETO = L1.IDMSGBOLETO(+) ) '+#13+
          '    AND ( M.IDMSGBOLETO = L2.IDMSGBOLETO(+) ) '+#13+
          '    AND ( M.IDMSGBOLETO = L3.IDMSGBOLETO(+) ) '+#13+
          '    AND ( M.IDMSGBOLETO = L4.IDMSGBOLETO(+) ) '+#13+
          '    AND ( M.IDMSGBOLETO = L5.IDMSGBOLETO(+) ) '+#13+
          '    AND ( M.IDMSGBOLETO = L6.IDMSGBOLETO(+) ) '+#13+
          '    AND ( M.IDMSGBOLETO = L7.IDMSGBOLETO(+) ) '+#13+
          '    AND ( M.IDMSGBOLETO = L8.IDMSGBOLETO(+) ) '+#13+
          '    AND ( M.IDMSGBOLETO = L9.IDMSGBOLETO(+) ) '+#13+ sParam +
          ' ORDER BY M.MSGDESCRICAO ';

  Result := GetDataPacket( sSql );
end;


procedure TCtrlMsgBoleto.SetDbLinhaMsgBoleto( const Value: TDbLinhaMsgBoleto);
begin
  FDbLinhaMsgBoleto := Value;
end;

procedure TCtrlMsgBoleto.SetCdsMsgBoleto(const Value: TCMClientDataSet);
begin
  FCdsMsgBoleto := Value;
end;

procedure TCtrlMsgBoleto.SetDbMsgBoleto(const Value: TDbMsgBoleto);
begin
  FDbMsgBoleto := Value;
end;


end.
