unit uCtrlWebTpUsuCampo;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbWebTpUsuCampo, JCLSysUtils;

Type
  TCtrlWebTpUsuCampo = class(TCmControlObject)
  private
    FCdsWebTpUsuCampo: TCMClientDataSet;
    FDbWebTpUsuCampo: TDbWebTpUsuCampo;
    procedure SetCdsWebTpUsuCampo(const Value: TCMClientDataSet);
    procedure SetDbWebTpUsuCampo(const Value: TDbWebTpUsuCampo);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbWebTpUsuCampo : TDbWebTpUsuCampo read FDbWebTpUsuCampo write SetDbWebTpUsuCampo;
    property CdsWebTpUsuCampo : TCMClientDataSet read FCdsWebTpUsuCampo write SetCdsWebTpUsuCampo;

    function GravaWebTpUsuCampo : Boolean;
    function SelecionaPorTipoUsuarioInterface( iIdTipoUsuario, iIdWebInterface : integer ) : OleVariant;
    function SelecionaTodos : OleVariant;
    function LookupCampo( iIdPagina, iIdTipoUsuario, iIdWebInterface : Integer ) : OleVariant;        

    function ApagaDados( iIdTipoUsuario, iIdWebInterface : integer ) : Boolean;

    function IncluiCampoNaInterface( Data : OLEVariant   ) : Boolean;
    function AlteraCampoNaInterface( Data : OLEVariant   ) : Boolean;
    function ExcluiCampoNaInterface( iIdTipoUsuario, iIdWebInterface, iIdCampo : integer ) : Boolean;

  published

end;

implementation

{ TCtrlWebTpUsuCampo }

constructor TCtrlWebTpUsuCampo.Create;
begin
  inherited;
  FDbWebTpUsuCampo  := TDbWebTpUsuCampo.Create( self );
end;

destructor TCtrlWebTpUsuCampo.Destroy;
begin
  FDbWebTpUsuCampo.Free;
  if IsAppServer then FCdsWebTpUsuCampo.Free;
  inherited;
end;

procedure TCtrlWebTpUsuCampo.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
    FDbWebTpUsuCampo.DataBaseName    := DataBaseName
  else
    FDbWebTpUsuCampo.dbADOConnection := dbADOConnection;
end;

function TCtrlWebTpUsuCampo.GravaWebTpUsuCampo: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarWebTpUsuCampo( CdsWebTpUsuCampo.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsWebTpUsuCampo, FDbWebTpUsuCampo, [], [] );

      Msg := FDbWebTpUsuCampo.MessageInfo;

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

procedure TCtrlWebTpUsuCampo.OnCreateAppServer;
begin
  inherited;
  FCdsWebTpUsuCampo := TCMClientDataSet.Create( nil );
end;

function TCtrlWebTpUsuCampo.SelecionaPorTipoUsuarioInterface(
  iIdTipoUsuario, iIdWebInterface : integer ): OleVariant;
begin
  Result := GetDataPacket( ' select IDTIPOUSUARIO,   '                               +
                           '        IDCAMPO,         '                               +
                           '        IDWEBINTERFACE,  '                               +
                           '        TITULOCAMPO,     '                               +
                           //Pendência 18467 - 13/02/2007
                           '        FLGDISPONIVEL,   '                               +
                           '        IDREGRAACESSO    '                               +
                           //Fim Pendência 18467
                           '   from WEBTPUSUCAMPO    '                               +
                           '  where IDTIPOUSUARIO  = ' + IntToStr( iIdTipoUsuario )  +
                           '    and IDWEBINTERFACE = ' + IntToStr( iIdWebInterface ) );
end;

procedure TCtrlWebTpUsuCampo.SetCdsWebTpUsuCampo(
  const Value: TCMClientDataSet);
begin
  FCdsWebTpUsuCampo := Value;
end;

procedure TCtrlWebTpUsuCampo.SetDbWebTpUsuCampo(
  const Value: TDbWebTpUsuCampo);
begin
  FDbWebTpUsuCampo := Value;
end;

function TCtrlWebTpUsuCampo.SelecionaTodos: OleVariant;
begin
  Result := GetDataPacket( ' select   IDTIPOUSUARIO,  ' +
                           '          IDCAMPO,        ' +
                           '          IDWEBINTERFACE, ' +
                           '          TITULOCAMPO,    ' +
                           //Pendência 18467 - 13/02/2007
                           '          FLGDISPONIVEL,  ' +
                           '          IDREGRAACESSO   ' +
                           //Fim Pendência 18467
                           '   from   WEBTPUSUCAMPO   ' +
                           ' order by IDTIPOUSUARIO,  ' +
                           '          IDCAMPO,        ' +
                           '          IDWEBINTERFACE  ' );
end;

function TCtrlWebTpUsuCampo.LookupCampo( iIdPagina, iIdTipoUsuario, iIdWebInterface : Integer ): OleVariant;
begin
  Result := GetDataPacket( ' select IDCAMPO,         ' +
                           //Pendência 18467 - 13/02/2007
                           '        TITULOCAMPO,     ' +
                           '        IDREGRAACESSO    ' +
                           //Fim Pendência 18467
                           ' from   WEBTPUSUCAMPO    ' +
                           ' where  IDPAGINA       = ' + IntToStr( iIdPagina       ) +
                           '   and  IDTIPOUSUARIO  = ' + IntToStr( iIdTipoUsuario  ) +
                           '   and  IDWEBINTERFACE = ' + IntToStr( iIdWebInterface ) );
end;


function TCtrlWebTpUsuCampo.ApagaDados(iIdTipoUsuario,
  iIdWebInterface: integer): Boolean;
begin
  try
    Result := ExecSQL( ' delete from WEBTPUSUCAMPO    ' +
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

function TCtrlWebTpUsuCampo.AlteraCampoNaInterface(Data: OLEVariant): Boolean;
var
  cdsLocal : TCMClientDataSet;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.AlteraCampoNaInterface( Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    cdsLocal := TCMClientDataSet.Create( nil );
    try
      cdsLocal.Data := Data;
      try
        Result := ExecSQL(
                  ' update WEBTPUSUCAMPO  set                                       ' +
                  '        TITULOCAMPO    = ' + QuotedStr( cdsLocal.FieldByName('TITULOCAMPO').AsString )   + ' , ' +
                  '        FLGDISPONIVEL  = ' + QuotedStr( cdsLocal.FieldByName('FLGDISPONIVEL').AsString ) +
                  //Pendência 18467 - 13/02/2007
                  '        IDREGRAACESSO  = ' + iff( trim( cdsLocal.FieldByName('IDREGRAACESSO').AsString ) = '', ' null ', cdsLocal.FieldByName('IDREGRAACESSO').AsString ) + ' , ' +
                  //Fim Pendência 18467
                  ' where  IDTIPOUSUARIO  = ' + cdsLocal.FieldByName('IDTIPOUSUARIO').AsString              +
                  '   and  IDCAMPO        = ' + cdsLocal.FieldByName('IDCAMPO').AsString                    +
                  '   and  IDWEBINTERFACE = ' + cdsLocal.FieldByName('IDWEBINTERFACE').AsString             );
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

function TCtrlWebTpUsuCampo.ExcluiCampoNaInterface(iIdTipoUsuario,iIdWebInterface, iIdCampo: integer): Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExcluiCampoNaInterface( iIdTipoUsuario,iIdWebInterface, iIdCampo );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      Result := ExecSQL(
                ' delete WEBTPUSUCAMPO                                   ' +
                ' where  IDTIPOUSUARIO  = ' + IntToStr( iIdTipoUsuario   ) +
                '   and  IDCAMPO        = ' + IntToStr( iIdCampo         ) +
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

function TCtrlWebTpUsuCampo.IncluiCampoNaInterface(Data: OLEVariant): Boolean;
var
  cdsLocal : TCMClientDataSet;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.IncluiCampoNaInterface( Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    cdsLocal := TCMClientDataSet.Create( nil );
    try
      cdsLocal.Data := Data;
      try
        Result := ExecSQL(
                  ' insert into WEBTPUSUCAMPO                                       ' +
                  ' (  IDTIPOUSUARIO  ,                                             ' +
                  '    IDCAMPO        ,                                             ' +
                  '    IDWEBINTERFACE ,                                             ' +
                  '    TITULOCAMPO    ,                                             ' +
                  //Pendência 18467 - 13/02/2007
                  '    IDREGRAACESSO  ,                                             ' +
                  //Fim Pendência 18467
                  '    FLGDISPONIVEL  )                                             ' +
                  ' values (                                                        ' +
                  cdsLocal.FieldByName('IDTIPOUSUARIO').AsString              + ' , ' +
                  cdsLocal.FieldByName('IDCAMPO').AsString                    + ' , ' +
                  cdsLocal.FieldByName('IDWEBINTERFACE').AsString             + ' , ' +
                  QuotedStr( cdsLocal.FieldByName('TITULOCAMPO').AsString )   + ' , ' +
                  //Pendência 18467 - 13/02/2007
                  iff( trim( cdsLocal.FieldByName('IDREGRAACESSO').AsString ) = '', ' null ', cdsLocal.FieldByName('IDREGRAACESSO').AsString ) + ' , ' +
                  //Fim Pendência 18467
                  QuotedStr( cdsLocal.FieldByName('FLGDISPONIVEL').AsString ) + ' ) ' );
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
