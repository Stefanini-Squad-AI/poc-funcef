unit uCtrlMensagensCnab;

interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase,
     DbClient, uCMTypes, uCMClientDataSet, uCtrlDocumento;

type
  TCtrlMensagensCnab = class(TCmControlObject)
  _Cds           : TCMClientDataSet;
  Protected
    procedure OnCreateAppServer; Override;
    procedure AfterInitialize; Override;
  private
    _CdsBloquete : TCMClientDataSet;
    _Documento   : TCtrlDocumento;
  Public
    constructor Create;  Override;
    destructor  Destroy; Override;
    function DeletaMensagens(fCodDocumento : Double) : Boolean;
    function ListBloquete(PortadorForma : String; RecPag : String; TipoDocumento : String) : Boolean;
    function ListMensagensCnab(fIDMensagem : Double) : OleVariant;
    function GravarMensagensCnab(fCodDocumento : Integer; PageIndex : Integer;
                                 Mensagens0, Mensagens1, Mensagens2, Mensagens3,
                                 Mensagens4, Mensagens5, Mensagens6, Mensagens7,
                                 Mensagens8 : String;
                                 ovBloquete : OleVariant; bDeletaMensagens : Boolean) : Boolean;
End;


implementation

{ TCtrlMensagensCnab }

constructor TCtrlMensagensCnab.Create;
begin
  inherited;
  _Documento   := TCtrlDocumento.Create;
  _CdsBloquete := TCMClientDataSet.Create(nil);
end;

destructor TCtrlMensagensCnab.Destroy;
begin
  inherited;
  _Documento.Free;
  _CdsBloquete.Free;
  if isAppServer then _Cds.Free;
end;


function TCtrlMensagensCnab.GravarMensagensCnab(fCodDocumento : Integer;
                                                PageIndex : Integer;
                                                Mensagens0, Mensagens1, Mensagens2, Mensagens3,
                                                Mensagens4, Mensagens5, Mensagens6, Mensagens7,
                                                Mensagens8 : String;
                                                ovBloquete : OleVariant;
                                                bDeletaMensagens : Boolean) : Boolean;
var
  Mensagens    : Array [0..8] of String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarMensagensCnab(fCodDocumento,
                                                       PageIndex,
                                                       Mensagens0,
                                                       Mensagens1,
                                                       Mensagens2,
                                                       Mensagens3,
                                                       Mensagens4,
                                                       Mensagens5,
                                                       Mensagens6,
                                                       Mensagens7,
                                                       Mensagens8,
                                                       ovBloquete,
                                                       bDeletaMensagens);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := True;
      Mensagens[0] := Mensagens0;
      Mensagens[1] := Mensagens1;
      Mensagens[2] := Mensagens2;
      Mensagens[3] := Mensagens3;
      Mensagens[4] := Mensagens4;
      Mensagens[5] := Mensagens5;
      Mensagens[6] := Mensagens6;
      Mensagens[7] := Mensagens7;
      Mensagens[8] := Mensagens8;
      if _CdsBloquete.Active then _CdsBloquete.Close;
      _CdsBloquete.Data := ovBloquete;

      if (PageIndex = 0) or (_cds.State = dsEdit) then
        _Documento.IntBanco.SetaMensagensCNAB(fCodDocumento, -1,
                                              Mensagens,
                                              bDeletaMensagens)
      else
      begin
        _cdsBloquete.First;
        while not _cdsBloquete.Eof Do
        begin
          _Documento.IntBanco.SetaMensagensCNAB(_cdsBloquete.FieldByName('CODDOCUMENTO').AsInteger, -1,
                                                       Mensagens,
                                                       bDeletaMensagens);
          _cdsBloquete.Next;
        end;
      end;
      Commit;
   except
     on E:Exception do
     begin
       Result := False;
       Rollback;
       MessageInfo := E.Message;
     end;
   end;
  end;
end;

function TCtrlMensagensCnab.ListBloquete(PortadorForma: String;
  RecPag: String; TipoDocumento: String): Boolean;
var sSQL : String;
begin
  sSql := 'SELECT DISTINCT D.CODDOCUMENTO ' +
          'FROM DOCUMENTO D ' +
          'WHERE ' +
          '  (D.EMISBLOQ = ''N'') AND' +
          '  (D.CODPORTFORMA = ' + PortadorForma + ') AND' +
          '  (D.STATUS <> ''2'') AND' +
          '  (D.OPERACAO IN (''2'',''3'')) AND' +
          '  (D.RECPAG = ' + QuotedStr(RecPag) + ')';
  if trim(TipoDocumento) <> '' Then
    sSql := sSql + ' AND (D.CODTIPDOC = ' + TipoDocumento + ')';

  Result := GetDataPacket(sSQL);
end;

function TCtrlMensagensCnab.ListMensagensCnab(
  fIDMensagem: Double): OleVariant;
var sSQL : String;
begin
  sSQL := 'SELECT '+
          '  IDMENSAGENSCNAB, '+
          '  CODDOCUMENTO, '+
          '  MENSAGEM1, '+
          '  MENSAGEM2, '+
          '  MENSAGEM3, '+
          '  MENSAGEM4, '+
          '  MENSAGEM5, '+
          '  MENSAGEM6, '+
          '  MENSAGEM7, '+
          '  MENSAGEM8, '+
          '  MENSAGEM9  '+
          'FROM         '+
          '  MENSAGENSCNAB '+
          'WHERE '+
          ' (IDMENSAGENSCNAB = ' + FloatToStr(fIDMensagem) + ')';
  Result := GetDataPacket(sSQL);
end;

procedure TCtrlMensagensCnab.OnCreateAppServer;
begin
  inherited;
  _Cds := TCMClientDataSet.Create(nil);
end;

procedure TCtrlMensagensCnab.AfterInitialize;
begin
  inherited;
  _Documento.InitializeAs(self);
end;

function TCtrlMensagensCnab.DeletaMensagens(
  fCodDocumento: Double): Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.DeletaMensagens(fCodDocumento);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      if not ExecSQL('DELETE FROM MENSAGENSCNAB WHERE CODDOCUMENTO = ' + FloatToStr(fCodDocumento)) then
        Raise Exception.Create(MessageInfo);
      Commit;
      Result := True;
    except
      on E:Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
