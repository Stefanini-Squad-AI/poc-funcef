unit uCtrl_HistMovInscricao;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCmTypes, DB,
     uCtrlFuncoesAA;

Type

  TCtrl_HistMovInscricao = class(TCmControlObject)
  private
    FCdsHistMovInscricao: TCMClientDataSet;
    procedure SetCdsHistMovInscricao(const Value: TCMClientDataSet);

  protected

    procedure OnCreateAppServer; Override;

  public

    destructor Destroy; override;

    property CdsHistMovInscricao : TCMClientDataSet read FCdsHistMovInscricao write SetCdsHistMovInscricao;

    function SelecionaHistMovInscricao( iIdHistMovInsc : integer ) : OleVariant;
    function SelecionaDadosHistMovInscricao( iIdInscricao : extended ) : OleVariant;    
    function IncluiHistMovInscricao : boolean;

  published

end;

implementation

{ TCtrl_HistMovInscricao }

destructor TCtrl_HistMovInscricao.Destroy;
begin
  if IsAppServer then FCdsHistMovInscricao.Free;
  inherited;
end;

procedure TCtrl_HistMovInscricao.OnCreateAppServer;
begin
  inherited;
  FCdsHistMovInscricao := TCMClientDataSet.Create( nil );
end;

function TCtrl_HistMovInscricao.IncluiHistMovInscricao: boolean;
var
  sSQL : string;
begin
  Result := False;

  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.IncluiHistMovInscricao( FCdsHistMovInscricao.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try

      sSQL := ' insert into HISTMOVINSCRICAO   ' +
              ' (           IDHISTMOVINSC,     ' +
              '             IDREGRA,           ' +
              '             IDINSCRICAOEMPTMO, ' +
              '             IDITEMEMPTMO,      ' +
              '             HMICENTRALIZA,     ' +
              '             HMIDESTACADO,      ' +
              '             HMIVLRPREVISTO     ' +
              ' ) values (                     ' +
              IntToStr( ProxId( Self, 'HISTMOVINSCRICAO' ) ) + ', ' +
              IntToStr( StrToIntDef( FCdsHistMovInscricao.FieldByName('IDREGRA').AsString, 0 ) ) + ', ' +
              IntToStr( StrToIntDef( FCdsHistMovInscricao.FieldByName('IDINSCRICAOEMPTMO').AsString, 0 ) ) + ', ' +
              IntToStr( StrToIntDef( FCdsHistMovInscricao.FieldByName('IDITEMEMPTMO').AsString, 0 ) ) + ', ' +
              '             null,              ' +
              '             null,              ' +
              OraNumero( FCdsHistMovInscricao.FieldByName('HMIVLRPREVISTO').AsString ) + ' ) ';

      Result := ExecSQL( sSQL );

      if not Result then raise Exception.Create( MessageInfo );

      Result := True

    except
      On E : Exception Do
      begin
        Result := False;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrl_HistMovInscricao.SelecionaHistMovInscricao( iIdHistMovInsc: integer ): OleVariant;
begin
  Result := GetDataPacket(
   ' select IDHISTMOVINSC,                                 ' +
   '        IDREGRA,                                       ' +
   '        IDINSCRICAOEMPTMO,                             ' +
   '        IDITEMEMPTMO,                                  ' +
   '        HMICENTRALIZA,                                 ' +
   '        HMIDESTACADO,                                  ' +
   '        HMIVLRPREVISTO                                 ' +
   ' from   HISTMOVINSCRICAO                               ' +
   ' where  IDHISTMOVINSC = ' + IntToStr( iIdHistMovInsc ) ) ;
end;

procedure TCtrl_HistMovInscricao.SetCdsHistMovInscricao( const Value: TCMClientDataSet);
begin
  FCdsHistMovInscricao := Value;
end;

function TCtrl_HistMovInscricao.SelecionaDadosHistMovInscricao(iIdInscricao: extended): OleVariant;
begin
  Result := GetDataPacket(
   ' select i.ITEDESCRICAO,                                  ' +
   '        h.IDHISTMOVINSC,                                 ' +
   '        h.IDREGRA,                                       ' +
   '        h.IDINSCRICAOEMPTMO,                             ' +
   '        h.IDITEMEMPTMO,                                  ' +
   '        h.HMICENTRALIZA,                                 ' +
   '        h.HMIDESTACADO,                                  ' +
   '        h.HMIVLRPREVISTO                                 ' +
   ' from   HISTMOVINSCRICAO h,                              ' +
   '        ITEMEMPTMO       i                               ' +
   ' where  h.IDINSCRICAOEMPTMO = ' + FloatToStr(iIdInscricao) +
   '   and  h.IDITEMEMPTMO      = i.IDITEMEMPTMO             ' );
end;

end.

