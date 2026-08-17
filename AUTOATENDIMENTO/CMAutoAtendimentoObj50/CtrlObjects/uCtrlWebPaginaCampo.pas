unit uCtrlWebPaginaCampo;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbWebPagina, uDbWebCampo, JCLSysUtils;

Type
  TCtrlWebPaginaCampo = class(TCmControlObject)
  private
    FCdsWebPagina: TCMClientDataSet;
    FDbWebPagina: TDbWebPagina;
    FCdsWebCampo: TCMClientDataSet;
    FDbWebCampo: TDbWebCampo;
    procedure SetCdsWebPagina(const Value: TCMClientDataSet);
    procedure SetDbWebPagina(const Value: TDbWebPagina);
    procedure SetCdsWebCampo(const Value: TCMClientDataSet);
    procedure SetDbWebCampo(const Value: TDbWebCampo);

  protected

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public

    constructor Create; override;
    destructor Destroy; override;

    property DbWebPagina : TDbWebPagina read FDbWebPagina write SetDbWebPagina;
    property CdsWebPagina : TCMClientDataSet read FCdsWebPagina write SetCdsWebPagina;
    property DbWebCampo : TDbWebCampo read FDbWebCampo write SetDbWebCampo;
    property CdsWebCampo : TCMClientDataSet read FCdsWebCampo write SetCdsWebCampo;

    function GravaWebPaginaCampo : Boolean;
    function ExcluiWebPaginaCampo : Boolean;
    function SelecionaTodasPaginas( iIdTipoUsuario, iIdWebInterface : integer ) : OleVariant;
    function SelecionaPaginasPorPai( iIdPaginaPai, iIdTipoUsuario, iIdWebInterface : integer ) : OleVariant;
    function SelecionaTodosCampos( iIdTipoUsuario, iIdWebInterface : integer ): OleVariant;
    function SelecionaCamposPorPai( iIdCampoPai, iIdTipoUsuario, iIdWebInterface : integer ) : OleVariant;
    function SelecionaCamposPorPagina( iIdPagina, iIdTipoUsuario, iIdWebInterface : Integer ) : OleVariant;
    function SelecionaCamposApenasPorPagina( iIdPagina, iIdTipoUsuario, iIdWebInterface : Integer ) : OleVariant;

    function SelecionaPaginas : OleVariant;
    function SelecionaCampos : OleVariant;

    function SelecionaPagina( iIdPagina : Integer ) : OleVariant;
    function SelecionaCampo( iIdCampo : integer ) : OleVariant;

    function SelecionaPaginasPorInterface( iIdWebInterface : integer ) : OleVariant;
    function SelecionaCamposPorInterface( iIdWebInterface : integer ): OleVariant;

    function PaginasUsuario( iIdWebInterface : integer; sTipoUsuario : string ) : OleVariant;
    function CamposUsuario( iIdWebInterface : integer; sTipoUsuario : string ): OleVariant;

    function IncluiPagina( Data : OLEVariant   ) : Boolean;
    function AlteraPagina( Data : OLEVariant   ) : Boolean;
    function ExcluiPagina( iIdPagina : integer ) : Boolean;

    function IncluiCampo( Data : OLEVariant  ) : Boolean;
    function AlteraCampo( Data : OLEVariant  ) : Boolean;
    function ExcluiCampo( iIdCampo : integer ) : Boolean;

  published

end;

implementation

{ TCtrlWebPaginaCampo }

constructor TCtrlWebPaginaCampo.Create;
begin
  inherited;
  FDbWebPagina  := TDbWebPagina.Create( self );
  FDbWebCampo   := TDbWebCampo.Create( self );  
end;

destructor TCtrlWebPaginaCampo.Destroy;
begin
  FDbWebPagina.Free;
  FDbWebCampo.Free;

  if IsAppServer then
  begin
    FCdsWebPagina.Free;
    FCdsWebCampo.Free;
  end;

  inherited;
end;

procedure TCtrlWebPaginaCampo.AfterInitialize;
begin
  inherited;
  if DbConnectionType = cntBDE then
  begin
    FDbWebPagina.DataBaseName    := DataBaseName;
    FDbWebCampo.DataBaseName     := DataBaseName;
  end
  else
  begin
    FDbWebPagina.dbADOConnection := dbADOConnection;
    FDbWebCampo.dbADOConnection  := dbADOConnection;
  end;                                              
end;

function TCtrlWebPaginaCampo.ExcluiWebPaginaCampo: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExcluiWebPaginaCampo( FCdsWebPagina.Data, FCdsWebCampo.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      FCdsWebCampo.First;
      while not FCdsWebCampo.Eof do FCdsWebCampo.Delete;       

      Result := ApplyCds( FCdsWebCampo, FDbWebCampo, [FDbWebPagina.IdPagina], [FDbWebCampo.IdPagina] );
      Msg := FDbWebCampo.MessageInfo;
      if not Result then raise Exception.Create( Msg );

      Result := ApplyCds( FCdsWebPagina, FDbWebPagina, [], [] );
      Msg := FDbWebPagina.MessageInfo;
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

function TCtrlWebPaginaCampo.GravaWebPaginaCampo: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarWebPaginaCampo( FCdsWebPagina.Data, FCdsWebCampo.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds( FCdsWebPagina, FDbWebPagina, [], [] );
      Msg := FDbWebPagina.MessageInfo;
      if not Result then raise Exception.Create( Msg );

      Result := ApplyCds( FCdsWebCampo, FDbWebCampo, [], [] );
      Msg := FDbWebCampo.MessageInfo;
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

procedure TCtrlWebPaginaCampo.OnCreateAppServer;
begin
  inherited;
  FCdsWebPagina := TCMClientDataSet.Create( nil );
  FCdsWebCampo  := TCMClientDataSet.Create( nil );
end;

function TCtrlWebPaginaCampo.SelecionaTodasPaginas( iIdTipoUsuario, iIdWebInterface : integer ): OleVariant;
begin
  Result := GetDataPacket( ' select   p.IDPAGINA,                                      ' +
                           '          p.IDPAGINAPAI,                                   ' +
                           '          x.TITULOPAGINA,                                  ' +
                           '          p.DESCPAGINA,                                    ' +
                           '          x.FLGUSAPADRAO,                                  ' +
                           '          x.PAGCONTEUDO,                                   ' +
                           '          p.FLGSEMPREHAB,                                  ' +
                           '          x.LAYERACESSO,                                   ' +
                           '          x.FLGDISPONIVEL,                                 ' +
                           //Pendência 18467 - 13/02/2007
                           '          x.FLGCONTAACESSO,                                ' +
                           '          x.IDREGRAACESSO                                  ' +
                           //Fim Pendência 18467
                           ' from     WEBPAGINA      p,                                ' +
                           '          WEBTPUSUPAGINA x                                 ' +
                           ' where    p.IDPAGINA       = x.IDPAGINA                    ' +
                           '   and    x.IDTIPOUSUARIO  = ' + IntToStr( iIdTipoUsuario  ) +
                           '   and    x.IDWEBINTERFACE = ' + IntToStr( iIdWebInterface ) +
                           ' order by p.IDPAGINA                                       ' );
end;

function TCtrlWebPaginaCampo.SelecionaTodosCampos( iIdTipoUsuario, iIdWebInterface : integer ): OleVariant;
begin
  Result := GetDataPacket( ' select   c.IDCAMPO,                                       ' +
                           '          x.TITULOCAMPO,                                   ' +
                           '          c.IDPAGINA,                                      ' +
                           '          c.IDCAMPOPAI,                                    ' +
                           '          c.DESCCAMPO,                                     ' +
                           '          c.FLGSEMPREHAB,                                  ' +
                           //Pendência 18467 - 13/02/2007
                           '          x.FLGDISPONIVEL,                                 ' +
                           '          x.IDREGRAACESSO                                  ' +
                           //Fim Pendência 18467
                           ' from     WEBCAMPO      c,                                 ' +
                           '          WEBTPUSUCAMPO x                                  ' +
                           ' where    c.IDCAMPO        = x.IDCAMPO                     ' +
                           '   and    x.IDTIPOUSUARIO  = ' + IntToStr( iIdTipoUsuario  ) +
                           '   and    x.IDWEBINTERFACE = ' + IntToStr( iIdWebInterface ) +
                           ' order by c.IDCAMPO                                        ' );
end;

function TCtrlWebPaginaCampo.SelecionaCamposPorPagina( iIdPagina, iIdTipoUsuario, iIdWebInterface : Integer): OleVariant;
begin
  Result := GetDataPacket( ' select   c.IDCAMPO,                                       ' +
                           '          x.TITULOCAMPO,                                   ' +
                           '          c.IDPAGINA,                                      ' +
                           '          c.IDCAMPOPAI,                                    ' +
                           '          c.DESCCAMPO,                                     ' +
                           '          c.FLGSEMPREHAB,                                  ' +
                           //Pendência 18467 - 13/02/2007
                           '          x.FLGDISPONIVEL,                                 ' +
                           '          x.IDREGRAACESSO                                  ' +
                           //Fim Pendência 18467
                           ' from     WEBCAMPO      c,                                 ' +
                           '          WEBTPUSUCAMPO x                                  ' +
                           ' where    c.IDCAMPO        = x.IDCAMPO                     ' +
                           '   and    x.IDTIPOUSUARIO  = ' + IntToStr( iIdTipoUsuario  ) +
                           '   and    x.IDWEBINTERFACE = ' + IntToStr( iIdWebInterface ) +
                           '   and    c.IDPAGINA       = ' + IntToStr( iIdPagina       ) +
                           ' order by c.IDCAMPOPAI,                                    ' +
                           '          x.TITULOCAMPO                                    ' );
end;

function TCtrlWebPaginaCampo.SelecionaPagina(iIdPagina : integer ) : OleVariant;
begin
  Result := GetDataPacket( ' select * from WEBPAGINA ' );
end;

procedure TCtrlWebPaginaCampo.SetCdsWebCampo(
  const Value: TCMClientDataSet);
begin
  FCdsWebCampo := Value;
end;

procedure TCtrlWebPaginaCampo.SetCdsWebPagina(
  const Value: TCMClientDataSet);
begin
  FCdsWebPagina := Value;
end;

procedure TCtrlWebPaginaCampo.SetDbWebCampo(const Value: TDbWebCampo);
begin
  FDbWebCampo := Value;
end;

procedure TCtrlWebPaginaCampo.SetDbWebPagina(
  const Value: TDbWebPagina);
begin
  FDbWebPagina := Value;
end;

function TCtrlWebPaginaCampo.SelecionaPaginasPorPai( iIdPaginaPai, iIdTipoUsuario, iIdWebInterface : integer ): OleVariant;
var
  sWhere : string;
begin
  if iIdPaginaPai < 1 then
    sWhere := ' where    p.IDPAGINAPAI is null '
  else
    sWhere := ' where    p.IDPAGINAPAI = ' + IntToStr( iIdPaginaPai );

  Result := GetDataPacket( ' select   p.IDPAGINA,                                      ' +
                           '          p.IDPAGINAPAI,                                   ' +
                           '          x.TITULOPAGINA,                                  ' +
                           '          p.DESCPAGINA,                                    ' +
                           '          x.FLGUSAPADRAO,                                  ' +
                           '          x.PAGCONTEUDO,                                   ' +
                           '          p.FLGSEMPREHAB,                                  ' +
                           '          x.LAYERACESSO,                                   ' +
                           '          x.FLGDISPONIVEL,                                 ' +
                           //Pendência 18467 - 13/02/2007
                           '          x.FLGCONTAACESSO,                                ' +
                           '          x.IDREGRAACESSO                                  ' +
                           //Fim Pendência 18467
                           ' from     WEBPAGINA      p,                                ' +
                           '          WEBTPUSUPAGINA x                                 ' +
                           sWhere                                                        +
                           '   and    p.IDPAGINA       = x.IDPAGINA                    ' +
                           '   and    x.IDTIPOUSUARIO  = ' + IntToStr( iIdTipoUsuario  ) +
                           '   and    x.IDWEBINTERFACE = ' + IntToStr( iIdWebInterface ) +
                           ' order by p.IDPAGINA                                       ' );
end;

function TCtrlWebPaginaCampo.SelecionaCamposPorPai( iIdCampoPai, iIdTipoUsuario, iIdWebInterface : integer ): OleVariant;
var
  sWhere : string;
begin
  if iIdCampoPai < 1 then
    sWhere := ' where    c.IDCAMPOPAI is null '
  else
    sWhere := ' where    c.IDCAMPOPAI = ' + IntToStr( iIdCampoPai );

  Result := GetDataPacket( ' select   c.IDCAMPO,                                       ' +
                           '          x.TITULOCAMPO,                                   ' +
                           '          c.IDPAGINA,                                      ' +
                           '          c.IDCAMPOPAI,                                    ' +
                           '          c.DESCCAMPO,                                     ' +
                           '          c.FLGSEMPREHAB,                                  ' +
                           //Pendência 18467 - 13/02/2007
                           '          x.FLGDISPONIVEL,                                 ' +
                           '          x.IDREGRAACESSO                                  ' +
                           //Fim Pendência 18467
                           ' from     WEBCAMPO      c,                                 ' +
                           '          WEBTPUSUCAMPO x                                  ' +
                           sWhere                                                        +
                           '   and    c.IDCAMPO        = x.IDCAMPO                     ' +
                           '   and    x.IDTIPOUSUARIO  = ' + IntToStr( iIdTipoUsuario  ) +
                           '   and    x.IDWEBINTERFACE = ' + IntToStr( iIdWebInterface ) +
                           ' order by c.IDCAMPO                                        ' );
end;

function TCtrlWebPaginaCampo.SelecionaCamposApenasPorPagina( iIdPagina, iIdTipoUsuario, iIdWebInterface : Integer): OleVariant;
begin
  Result := GetDataPacket( ' select   c.IDCAMPO,                                       ' +
                           '          x.TITULOCAMPO,                                   ' +
                           '          c.IDPAGINA,                                      ' +
                           '          c.IDCAMPOPAI,                                    ' +
                           '          c.DESCCAMPO,                                     ' +
                           '          c.FLGSEMPREHAB,                                  ' +
                           //Pendência 18467 - 13/02/2007
                           '          x.FLGDISPONIVEL,                                 ' +
                           '          x.IDREGRAACESSO                                  ' +
                           //Fim Pendência 18467
                           ' from     WEBCAMPO      c,                                 ' +
                           '          WEBTPUSUCAMPO x                                  ' +
                           '  where   c.IDCAMPO        = x.IDCAMPO                     ' +
                           '   and    c.IDPAGINA       = ' + IntToStr( iIdPagina       ) +
                           '   and    c.IDCAMPOPAI     is null                         ' +
                           '   and    x.IDTIPOUSUARIO  = ' + IntToStr( iIdTipoUsuario  ) +
                           '   and    x.IDWEBINTERFACE = ' + IntToStr( iIdWebInterface ) +
                           ' order by c.IDCAMPOPAI,                                    ' +
                           '          x.TITULOCAMPO                                    ' );
end;

function TCtrlWebPaginaCampo.SelecionaCampos: OleVariant;
begin
  Result := GetDataPacket(
   ' select IDCAMPO,     ' +
   '        IDCAMPOPAI,  ' +
   '        IDPAGINA,    ' +
   '        DESCCAMPO,   ' +
   '        FLGSEMPREHAB ' +
   ' from   WEBCAMPO     ' );
end;

function TCtrlWebPaginaCampo.SelecionaPaginas: OleVariant;
begin
  Result := GetDataPacket(
   ' select IDPAGINA,    ' +
   '        IDPAGINAPAI, ' +
   '        DESCPAGINA,  ' +
   '        FLGSEMPREHAB ' +
   ' from   WEBPAGINA    ' );
end;

function TCtrlWebPaginaCampo.SelecionaCamposPorInterface( iIdWebInterface: integer): OleVariant;
begin
  Result := GetDataPacket( ' select   c.IDCAMPO,                                       ' +
                           '          x.IDTIPOUSUARIO,                                 ' +
                           '          x.IDWEBINTERFACE,                                ' +
                           '          x.TITULOCAMPO,                                   ' +
                           '          c.IDPAGINA,                                      ' +
                           '          c.IDCAMPOPAI,                                    ' +
                           '          c.DESCCAMPO,                                     ' +
                           '          c.FLGSEMPREHAB,                                  ' +
                           //Pendência 18467 - 13/02/2007
                           '          x.FLGDISPONIVEL,                                 ' +
                           '          x.IDREGRAACESSO                                  ' +
                           //Fim Pendência 18467
                           ' from     WEBCAMPO      c,                                 ' +
                           '          WEBTPUSUCAMPO x                                  ' +
                           ' where    c.IDCAMPO        = x.IDCAMPO                     ' +
                           '   and    x.IDWEBINTERFACE = ' + IntToStr( iIdWebInterface ) +
                           ' order by c.IDCAMPO                                        ' );
end;

function TCtrlWebPaginaCampo.SelecionaPaginasPorInterface( iIdWebInterface: integer): OleVariant;
begin
  Result := GetDataPacket( ' select   p.IDPAGINA,                                      ' +
                           '          x.IDTIPOUSUARIO,                                 ' +
                           '          x.IDWEBINTERFACE,                                ' +
                           '          p.IDPAGINAPAI,                                   ' +
                           '          x.TITULOPAGINA,                                  ' +
                           '          p.DESCPAGINA,                                    ' +
                           '          x.FLGUSAPADRAO,                                  ' +
                           '          x.PAGCONTEUDO,                                   ' +
                           '          p.FLGSEMPREHAB,                                  ' +
                           '          x.LAYERACESSO,                                   ' +
                           '          x.FLGDISPONIVEL,                                 ' +
                           //Pendência 18467 - 13/02/2007
                           '          x.FLGCONTAACESSO,                                ' +
                           '          x.IDREGRAACESSO                                  ' +
                           //Fim Pendência 18467
                           ' from     WEBPAGINA      p,                                ' +
                           '          WEBTPUSUPAGINA x                                 ' +
                           ' where    p.IDPAGINA       = x.IDPAGINA                    ' +
                           '   and    x.IDWEBINTERFACE = ' + IntToStr( iIdWebInterface ) +
                           ' order by p.IDPAGINA                                       ' );
end;

function TCtrlWebPaginaCampo.AlteraPagina(Data: OLEVariant): Boolean;
var
  cdsLocal : TCMClientDataSet;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.AlteraPagina( Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    cdsLocal := TCMClientDataSet.Create( nil );
    try
      cdsLocal.Data := Data;
      try
        Result := ExecSQL(
                  ' update WEBPAGINA set                                                                       ' +
                  '        IDPAGINAPAI  = ' + iff( cdsLocal.FieldByName('IDPAGINAPAI').IsNull, ' null ', cdsLocal.FieldByName('IDPAGINAPAI').AsString ) + ' , ' +
                  '        DESCPAGINA   = ' + QuotedStr( cdsLocal.FieldByName('DESCPAGINA').AsString )   + ' , ' +
                  '        FLGSEMPREHAB = ' + QuotedStr( cdsLocal.FieldByName('FLGSEMPREHAB').AsString ) +
                  ' where  IDPAGINA     = ' + cdsLocal.FieldByName('IDPAGINA').AsString                  );
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

function TCtrlWebPaginaCampo.ExcluiPagina( iIdPagina : integer ): Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExcluiPagina( iIdPagina );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      Result := ExecSQL(
                ' delete WEBPAGINA                           ' +
                ' where  IDPAGINA  = ' + IntToStr( iIdPagina ) );
    except
      On E : Exception Do
      begin
        Result := False;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlWebPaginaCampo.IncluiPagina(Data: OLEVariant): Boolean;
var
  cdsLocal : TCMClientDataSet;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.IncluiPagina( Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    cdsLocal := TCMClientDataSet.Create( nil );
    try
      cdsLocal.Data := Data;
      try
        Result := ExecSQL(
                  ' insert into WEBPAGINA                                          ' +
                  ' (  IDPAGINA     ,                                              ' +
                  '    IDPAGINAPAI  ,                                              ' +
                  '    DESCPAGINA   ,                                              ' +
                  '    FLGSEMPREHAB )                                              ' +
                  ' values (                                                       ' +
                  cdsLocal.FieldByName('IDPAGINA').AsString                  + ' , ' +
                  iff( cdsLocal.FieldByName('IDPAGINAPAI').IsNull, ' null ', cdsLocal.FieldByName('IDPAGINAPAI').AsString ) + ' , ' +
                  QuotedStr( cdsLocal.FieldByName('DESCPAGINA').AsString )   + ' , ' +
                  QuotedStr( cdsLocal.FieldByName('FLGSEMPREHAB').AsString ) + ' ) ' );
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

function TCtrlWebPaginaCampo.AlteraCampo(Data: OLEVariant): Boolean;
var
  cdsLocal : TCMClientDataSet;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.AlteraCampo( Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    cdsLocal := TCMClientDataSet.Create( nil );
    try
      cdsLocal.Data := Data;
      try
        Result := ExecSQL(
                  ' update WEBCAMPO set                                                                        ' +
                  '        IDCAMPOPAI   = ' + iff( cdsLocal.FieldByName('IDCAMPOPAI').IsNull, ' null ', cdsLocal.FieldByName('IDCAMPOPAI').AsString ) + ' , ' +
                  '        IDPAGINA     = ' + cdsLocal.FieldByName('IDPAGINA').AsString                  + ' , ' +
                  '        DESCCAMPO    = ' + QuotedStr( cdsLocal.FieldByName('DESCCAMPO').AsString )    + ' , ' +
                  '        FLGSEMPREHAB = ' + QuotedStr( cdsLocal.FieldByName('FLGSEMPREHAB').AsString ) +
                  ' where  IDCAMPO      = ' + cdsLocal.FieldByName('IDCAMPO').AsString                   );
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

function TCtrlWebPaginaCampo.ExcluiCampo(iIdCampo: integer): Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.ExcluiCampo( iIdCampo );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      Result := ExecSQL(
                ' delete WEBCAMPO                           ' +
                ' where  IDCAMPO  = ' + IntToStr( iIdCampo ) );
    except
      On E : Exception Do
      begin
        Result := False;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlWebPaginaCampo.IncluiCampo(Data: OLEVariant): Boolean;
var
  cdsLocal : TCMClientDataSet;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.IncluiCampo( Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    cdsLocal := TCMClientDataSet.Create( nil );
    try
      cdsLocal.Data := Data;
      try
        Result := ExecSQL(
                  ' insert into WEBCAMPO                                           ' +
                  ' (  IDCAMPO      ,                                              ' +
                  '    IDCAMPOPAI   ,                                              ' +
                  '    IDPAGINA     ,                                              ' +
                  '    DESCCAMPO    ,                                              ' +
                  '    FLGSEMPREHAB )                                              ' +
                  ' values (                                                       ' +
                  cdsLocal.FieldByName('IDCAMPO').AsString                   + ' , ' +
                  iff( cdsLocal.FieldByName('IDCAMPOPAI').IsNull, ' null ', cdsLocal.FieldByName('IDCAMPOPAI').AsString ) + ' , ' +
                  cdsLocal.FieldByName('IDPAGINA').AsString                  + ' , ' +
                  QuotedStr( cdsLocal.FieldByName('DESCCAMPO').AsString )    + ' , ' +
                  QuotedStr( cdsLocal.FieldByName('FLGSEMPREHAB').AsString ) + ' ) ' );
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

function TCtrlWebPaginaCampo.SelecionaCampo(iIdCampo: integer): OleVariant;
begin
  Result := GetDataPacket( ' select * from WEBCAMPO ' );
end;


function TCtrlWebPaginaCampo.PaginasUsuario( iIdWebInterface : integer; sTipoUsuario : string ): OleVariant;
var
  sSQL : string;
begin
  sSQL :=
   ' select   p.IDPAGINA,                                                   ' +
   '          x.IDTIPOUSUARIO,                                              ' +
   '          x.IDWEBINTERFACE,                                             ' +
   '          p.IDPAGINAPAI,                                                ' +
   '          x.TITULOPAGINA,                                               ' +
   '          p.DESCPAGINA,                                                 ' +
   '          x.FLGUSAPADRAO,                                               ' +
   '          x.PAGCONTEUDO,                                                ' +
   '          p.FLGSEMPREHAB,                                               ' +
   '          x.LAYERACESSO,                                                ' +
   '          x.FLGDISPONIVEL,                                              ' +
   //Pendência 18467 - 13/02/2007
   '          x.FLGCONTAACESSO,                                             ' +
   '          x.IDREGRAACESSO                                               ' +
   //Fim Pendência 18467
   ' from     WEBPAGINA      p,                                             ' +
   '          WEBTPUSUPAGINA x                                              ' +
   ' where    p.IDPAGINA       = x.IDPAGINA                                 ' +
   '   and    x.IDWEBINTERFACE = ' + IntToStr( iIdWebInterface )              +
   '   and    x.IDTIPOUSUARIO  in ( ' + sTipoUsuario + ' )                  ' +
   '   and    ( ( x.FLGDISPONIVEL = ''S'' ) or ( p.FLGSEMPREHAB = ''S'' ) ) ' +
   ' order by p.IDPAGINA                                                    ' ;
  Result := GetDataPacket( sSQL );
end;

function TCtrlWebPaginaCampo.CamposUsuario( iIdWebInterface : integer; sTipoUsuario : string ): OleVariant;
var
  sSQL : string;
begin
  sSQL :=
   ' select   c.IDCAMPO,                                                    ' +
   '          x.IDTIPOUSUARIO,                                              ' +
   '          x.IDWEBINTERFACE,                                             ' +
   '          x.TITULOCAMPO,                                                ' +
   '          c.IDPAGINA,                                                   ' +
   '          c.IDCAMPOPAI,                                                 ' +
   '          c.DESCCAMPO,                                                  ' +
   '          c.FLGSEMPREHAB,                                               ' +
   //Pendência 18467 - 13/02/2007
   '          x.FLGDISPONIVEL,                                              ' +
   '          x.IDREGRAACESSO                                               ' +
   //Fim Pendência 18467
   ' from     WEBCAMPO      c,                                              ' +
   '          WEBTPUSUCAMPO x                                               ' +
   ' where    c.IDCAMPO        = x.IDCAMPO                                  ' +
   '   and    x.IDWEBINTERFACE = ' + IntToStr( iIdWebInterface )              +
   '   and    x.IDTIPOUSUARIO  in ( ' + sTipoUsuario + ' )                  ' +
   '   and    ( ( x.FLGDISPONIVEL = ''S'' ) or ( c.FLGSEMPREHAB = ''S'' ) ) ' +
   ' order by c.IDCAMPO                                                     ' ;
  Result := GetDataPacket( sSQL );
end;


end.

