unit uCtrlWebTpUsuPagina;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbWebTpUsuPagina, JCLSysUtils;

Type
  TCtrlWebTpUsuPagina = class(TCmControlObject)
  private
    FCdsWebTpUsuPagina: TCMClientDataSet;
    FDbWebTpUsuPagina: TDbWebTpUsuPagina;
    procedure SetCdsWebTpUsuPagina(const Value: TCMClientDataSet);
    procedure SetDbWebTpUsuPagina(const Value: TDbWebTpUsuPagina);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbWebTpUsuPagina : TDbWebTpUsuPagina read FDbWebTpUsuPagina write SetDbWebTpUsuPagina;
    property CdsWebTpUsuPagina : TCMClientDataSet read FCdsWebTpUsuPagina write SetCdsWebTpUsuPagina;

    function GravaWebTpUsuPagina : Boolean;
    function SelecionaPorTipoUsuarioInterface( iIdTipoUsuario, iIdWebInterface : integer ) : OleVariant;
    function SelecionaTodos : OleVariant;

    function ApagaDados( iIdTipoUsuario, iIdWebInterface : integer ) : Boolean;

    function IncluiPaginaNaInterface( Data : OLEVariant   ) : Boolean;
    function AlteraPaginaNaInterface( Data : OLEVariant   ) : Boolean;
    function ExcluiPaginaNaInterface( iIdTipoUsuario, iIdWebInterface, iIdPagina : integer ) : Boolean;

  published

end;

implementation

{ TCtrlWebTpUsuPagina }

constructor TCtrlWebTpUsuPagina.Create;
begin
  inherited;
  FDbWebTpUsuPagina  := TDbWebTpUsuPagina.Create( self );
end;

destructor TCtrlWebTpUsuPagina.Destroy;
begin
  FDbWebTpUsuPagina.Free;
  if IsAppServer then FCdsWebTpUsuPagina.Free;
  inherited;
end;

procedure TCtrlWebTpUsuPagina.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbWebTpUsuPagina.DataBaseName    := DataBaseName
  else
    FDbWebTpUsuPagina.dbADOConnection := dbADOConnection;
end;

function TCtrlWebTpUsuPagina.GravaWebTpUsuPagina: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarWebTpUsuPagina( CdsWebTpUsuPagina.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsWebTpUsuPagina, FDbWebTpUsuPagina, [], [] );

      Msg := FDbWebTpUsuPagina.MessageInfo;

      if not Result then raise Exception.Create( Msg );

      Commit;
   except
      On E : Exception Do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
     end;
   end;
  end;
end;

procedure TCtrlWebTpUsuPagina.OnCreateAppServer;
begin
  inherited;
  FCdsWebTpUsuPagina := TCMClientDataSet.Create( nil );
end;

function TCtrlWebTpUsuPagina.SelecionaPorTipoUsuarioInterface(
  iIdTipoUsuario, iIdWebInterface: integer): OleVariant;
begin
  Result := GetDataPacket( ' select IDTIPOUSUARIO,   '                               +
                           '        IDPAGINA,        '                               +
                           '        IDWEBINTERFACE,  '                               +
                           '        TITULOPAGINA,    '                               +
                           '        FLGUSAPADRAO,    '                               +
                           '        PAGCONTEUDO,     '                               +
                           '        LAYERACESSO,     '                               +
                           '        FLGDISPONIVEL,   '                               +
                           //Pendência 18467 - 13/02/2007
                           '        FLGCONTAACESSO,  '                               +
                           '        IDREGRAACESSO    '                               +
                           //Fim Pendência 18467
                           '   from WEBTPUSUPAGINA   '                               +
                           '  where IDTIPOUSUARIO  = ' + IntToStr( iIdTipoUsuario  ) +
                           '    and IDWEBINTERFACE = ' + IntToStr( iIdWebInterface ) );
end;

procedure TCtrlWebTpUsuPagina.SetCdsWebTpUsuPagina(
  const Value: TCMClientDataSet);
begin
  FCdsWebTpUsuPagina := Value;
end;

procedure TCtrlWebTpUsuPagina.SetDbWebTpUsuPagina(
  const Value: TDbWebTpUsuPagina);
begin
  FDbWebTpUsuPagina := Value;
end;

function TCtrlWebTpUsuPagina.SelecionaTodos: OleVariant;
begin
  Result := GetDataPacket( ' select   IDTIPOUSUARIO,  ' +
                           '          IDPAGINA,       ' +
                           '          IDWEBINTERFACE, ' +
                           '          TITULOPAGINA,   ' +
                           '          FLGUSAPADRAO,   ' +
                           '          PAGCONTEUDO,    ' +
                           '          LAYERACESSO,    ' +
                           '          FLGDISPONIVEL,  ' +
                           //Pendência 18467 - 13/02/2007
                           '          FLGCONTAACESSO, ' +
                           '          IDREGRAACESSO   ' +
                           //Fim Pendência 18467
                           '   from   WEBTPUSUPAGINA  ' +
                           ' order by IDTIPOUSUARIO,  ' +
                           '          IDPAGINA,       ' +
                           '          IDWEBINTERFACE  ' );
end;

function TCtrlWebTpUsuPagina.ApagaDados(iIdTipoUsuario,
  iIdWebInterface: integer): Boolean;
begin
  try
    Result := ExecSQL( ' delete from WEBTPUSUPAGINA   ' +
                       ' where       IDTIPOUSUARIO  = ' + IntToStr( iIdTipoUsuario  ) +
                       '   and       IDWEBINTERFACE = ' + IntToStr( iIdWebInterface ) );
  except
    On E : Exception Do
    begin
      Result := False;
      MessageInfo := E.Message;
   end;
  end;
end;

function TCtrlWebTpUsuPagina.AlteraPaginaNaInterface(Data: OLEVariant): Boolean;
var
  cdsLocal : TCMClientDataSet;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.AlteraPaginaNaInterface( Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    cdsLocal := TCMClientDataSet.Create( nil );
    try
      cdsLocal.Data := Data;
      try
        Result := ExecSQL(
                  ' update WEBTPUSUPAGINA set                                                                      ' +
                  '        TITULOPAGINA   = ' + QuotedStr( cdsLocal.FieldByName('TITULOPAGINA').AsString )   + ' , ' +
                  '        FLGUSAPADRAO   = ' + QuotedStr( cdsLocal.FieldByName('FLGUSAPADRAO').AsString )   + ' , ' +
                  '        PAGCONTEUDO    = ' + iff( trim( cdsLocal.FieldByName('PAGCONTEUDO').AsString ) = '', ' null ', QuotedStr( cdsLocal.FieldByName('PAGCONTEUDO').AsString ) ) + ' , ' +
                  '        LAYERACESSO    = ' + iff( trim( cdsLocal.FieldByName('LAYERACESSO').AsString ) = '', ' null ', QuotedStr( cdsLocal.FieldByName('LAYERACESSO').AsString ) ) + ' , ' +
                  '        FLGDISPONIVEL  = ' + QuotedStr( cdsLocal.FieldByName('FLGDISPONIVEL').AsString )  + ' , ' +
                  '        FLGCONTAACESSO = ' + QuotedStr( cdsLocal.FieldByName('FLGCONTAACESSO').AsString ) +
                  //Pendência 18467 - 13/02/2007
                  '        IDREGRAACESSO  = ' + iff( trim( cdsLocal.FieldByName('IDREGRAACESSO').AsString ) = '', ' null ', cdsLocal.FieldByName('IDREGRAACESSO').AsString ) + ' , ' +
                  //Fim Pendência 18467
                  ' where  IDTIPOUSUARIO  = ' + cdsLocal.FieldByName('IDTIPOUSUARIO').AsString               +
                  '   and  IDPAGINA       = ' + cdsLocal.FieldByName('IDPAGINA').AsString                    +
                  '   and  IDWEBINTERFACE = ' + cdsLocal.FieldByName('IDWEBINTERFACE').AsString              );
      except
        On E : Exception Do
        begin
          Result := False;
          MessageInfo := E.Message;
        end;
      end;
    finally
      cdsLocal.Free;
    end;
  end;
end;

function TCtrlWebTpUsuPagina.ExcluiPaginaNaInterface( iIdTipoUsuario, iIdWebInterface, iIdPagina: integer): Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExcluiPaginaNaInterface( iIdTipoUsuario, iIdWebInterface, iIdPagina );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      Result := ExecSQL(
                ' delete WEBTPUSUPAGINA                                  ' +
                ' where  IDTIPOUSUARIO  = ' + IntToStr( iIdTipoUsuario   ) +
                '   and  IDPAGINA       = ' + IntToStr( iIdPagina        ) +
                '   and  IDWEBINTERFACE = ' + IntToStr( iIdWebInterface  ) );
    except
      On E : Exception Do
      begin
        Result := False;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlWebTpUsuPagina.IncluiPaginaNaInterface(Data: OLEVariant): Boolean;
var
  cdsLocal : TCMClientDataSet;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.IncluiPaginaNaInterface( Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    cdsLocal := TCMClientDataSet.Create( nil );
    try
      cdsLocal.Data := Data;
      try
        Result := ExecSQL(
                  ' insert into WEBTPUSUPAGINA                                       ' +
                  ' (  IDTIPOUSUARIO  ,                                              ' +
                  '    IDPAGINA       ,                                              ' +
                  '    IDWEBINTERFACE ,                                              ' +
                  '    TITULOPAGINA   ,                                              ' +
                  '    FLGUSAPADRAO   ,                                              ' +
                  '    PAGCONTEUDO    ,                                              ' +
                  '    LAYERACESSO    ,                                              ' +
                  '    FLGDISPONIVEL  ,                                              ' +
                  //Pendência 18467 - 13/02/2007
                  '    IDREGRAACESSO  ,                                              ' +
                  //Fim Pendência 18467
                  '    FLGCONTAACESSO )                                              ' +
                  ' values (                                                         ' +
                  cdsLocal.FieldByName('IDTIPOUSUARIO').AsString               + ' , ' +
                  cdsLocal.FieldByName('IDPAGINA').AsString                    + ' , ' +
                  cdsLocal.FieldByName('IDWEBINTERFACE').AsString              + ' , ' +
                  QuotedStr( cdsLocal.FieldByName('TITULOPAGINA').AsString )   + ' , ' +
                  QuotedStr( cdsLocal.FieldByName('FLGUSAPADRAO').AsString )   + ' , ' +
                  iff( trim( cdsLocal.FieldByName('PAGCONTEUDO').AsString ) = '', ' null ', QuotedStr( cdsLocal.FieldByName('PAGCONTEUDO').AsString ) ) + ' , ' +
                  iff( trim( cdsLocal.FieldByName('LAYERACESSO').AsString ) = '', ' null ', QuotedStr( cdsLocal.FieldByName('LAYERACESSO').AsString ) ) + ' , ' +
                  QuotedStr( cdsLocal.FieldByName('FLGDISPONIVEL').AsString )  + ' , ' +
                  //Pendência 18467 - 13/02/2007
                  iff( trim( cdsLocal.FieldByName('IDREGRAACESSO').AsString ) = '', ' null ', cdsLocal.FieldByName('IDREGRAACESSO').AsString ) + ' , ' +
                  //Fim Pendência 18467
                  QuotedStr( cdsLocal.FieldByName('FLGCONTAACESSO').AsString ) + ' ) ' );
      except
        On E : Exception Do
        begin
          Result := False;
          MessageInfo := E.Message;
        end;
      end;
    finally
      cdsLocal.Free;
    end;
  end;
end;

end.
