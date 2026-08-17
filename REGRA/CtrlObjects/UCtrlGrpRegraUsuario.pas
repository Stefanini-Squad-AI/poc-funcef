unit UCtrlGrpRegraUsuario;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbGrpRegraUsuario, Dialogs;

Type

  TCtrlGrpRegraUsuario = class(TCmControlObject)
  private
    FCdsGrpRegraUsuario: TCMClientDataSet;
    FDbGrpRegraUsuario: TDbGrpRegraUsuario;
    procedure SetCdsGrpRegraUsuario(const Value: TCMClientDataSet);
    procedure SetDbGrpRegraUsuario(const Value: TDbGrpRegraUsuario);

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbGrupoRegraUsuario : TDbGrpRegraUsuario read FDbGrpRegraUsuario  write SetDbGrpRegraUsuario;
    property CdsGrpRegraUsuario : TCMClientDataSet  read FCdsGrpRegraUsuario write SetCdsGrpRegraUsuario;

    function SelecionaGrpRegraUsuario( IdUsuario : Integer )  : OleVariant;
    function SelecionaTipoRegraUsuario( IdUsuario : Integer )  : OleVariant;

    function GravaGrpRegraUsuario : Boolean;

    function ListaUsuario : OleVariant;

    function ListaGrpRegraNaoAssociado( idUsuario : Integer ): OleVariant;
    function ListaTipoRegraNaoAssociado( idUsuario : Integer ): OleVariant;

    Procedure AcertaControleAcesso;

  published

end;

implementation

{ TCtrlGrpRegraUsuario }

constructor TCtrlGrpRegraUsuario.Create;
begin
  inherited;
  FDbGrpRegraUsuario := TDbGrpRegraUsuario.Create(Self);
  FCdsGrpRegraUsuario  := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlGrpRegraUsuario.Destroy;
begin
  FDbGrpRegraUsuario.Free;
  FCdsGrpRegraUsuario.Free;
  inherited;
end;

procedure TCtrlGrpRegraUsuario.DoChangeDataBase;
begin
  inherited;
  FDbGrpRegraUsuario.DataBaseName := Self.DataBaseName;
end;


function TCtrlGrpRegraUsuario.GravaGrpRegraUsuario: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarGrpRegraUsuario( CdsGrpRegraUsuario.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsGrpRegraUsuario, DbGrupoRegraUsuario, [], [] );

      Msg := DbGrupoRegraUsuario.MessageInfo;

      if not Result then raise Exception.Create( Msg );

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


procedure TCtrlGrpRegraUsuario.SetCdsGrpRegraUsuario(const Value: TCMClientDataSet);
begin
  FCdsGrpRegraUsuario := Value;
end;

procedure TCtrlGrpRegraUsuario.SetDbGrpRegraUsuario(const Value: TDbGrpRegraUsuario);
begin
  FDbGrpRegraUsuario := Value;
end;

function TCtrlGrpRegraUsuario.SelecionaGrpRegraUsuario( IdUsuario : Integer )  : OleVariant;
Var
  sSQL : String;
begin
  sSQL := ' SELECT                                                   '+
          '   GRU.IDGRUPOREGRAUSU, GRU. IDGRUPOREGRA, GRU.IDUSUARIO, '+
          '   GRU.FLGINSERIR,   GRU.FLGALTERAR, GRU.FLGEXCLUIR, '+
          '   GRU.FLGPROCURAR,  US.NOMEUSUARIO,                 '+
          '   GR.DESCRICAO                                      '+
          ' FROM                                                '+
          '   GRUPOREGRAUSUARIO GRU, USUARIOSISTEMA US, GRUPOREGRA GR '+
          ' WHERE                                               '+
          '   ( GRU.IDUSUARIO   = '+ IntToStr( IdUsuario )+ ' ) AND '+
          '   ( GRU.IDUSUARIO   = US.IDUSUARIO )    AND             '+
          '   ( GRU.IDGRUPOREGRA= GR.IDGRUPOREGRA )                 '+
          ' ORDER BY                                                '+
          '   GR.DESCRICAO                                          ' ;
  Result := GetDataPacket( sSQL ); 

end;



function TCtrlGrpRegraUsuario.ListaUsuario: OleVariant;
begin
  Result := GetDataPacket( 'SELECT * FROM USUARIOSISTEMA ORDER BY NOMEUSUARIO' );
end;


function TCtrlGrpRegraUsuario.ListaGrpRegraNaoAssociado( idUsuario : Integer ): OleVariant;
Var
  sSQL : String;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ListaGrpRegraNaoAssociado;//( IdUsuario : Integer );
  end else begin
    sSQL :=  'SELECT '+
             '  GRU.IDGRUPOREGRA, GRU.DESCRICAO '+
             'FROM   '+
             '  GRUPOREGRA GRU '+
             'WHERE  '+
             '  GRU.IDGRUPOREGRA NOT IN (SELECT               '+
             '                             NVL(IDGRUPOREGRA,0) AS IDGRUPOREGRA '+
             '                           FROM                 '+
             '                             GRUPOREGRAUSUARIO  '+
             '                           WHERE                '+
             '                             ( IDUSUARIO   = '+ IntToStr( IdUsuario )+ ' ) )'+
             'ORDER BY '+
             '  GRU.DESCRICAO ' ;
    Result := GetDataPacket( sSQL );
  end;
end;

function TCtrlGrpRegraUsuario.SelecionaTipoRegraUsuario(IdUsuario: Integer): OleVariant;
Var
  sSQL : String;
begin
  sSQL := ' SELECT                                                   '+
          '   GRU.IDGRUPOREGRAUSU, GRU. IDGRUPOREGRA, GRU.IDUSUARIO, '+
          '   GRU.FLGINSERIR,   GRU.FLGALTERAR, GRU.FLGEXCLUIR,      '+
          '   GRU.FLGPROCURAR,  US.NOMEUSUARIO,                      '+
          '   TR.IDTIPOREGRA,   TR.DESCREGRA                         '+
          ' FROM                                                     '+
          '   GRUPOREGRAUSUARIO GRU, USUARIOSISTEMA US, TIPOREGRA TR '+
          ' WHERE                                                    '+
          '   ( GRU.IDUSUARIO   = '+ IntToStr( IdUsuario )+ ' ) AND  '+
          '   ( GRU.IDUSUARIO   = US.IDUSUARIO )  AND '+
          '   ( GRU.IDTIPOREGRA = TR.IDTIPOREGRA )    '+
          ' ORDER BY                                  '+
          '   TR.DESCREGRA                            ' ;
  Result := GetDataPacket( sSQL );

end;

function TCtrlGrpRegraUsuario.ListaTipoRegraNaoAssociado(idUsuario: Integer): OleVariant;
Var
  sSQL : String;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ListaTipoRegraNaoAssociado;//( IdUsuario : Integer );
  end else begin
    sSQL :=  'SELECT '+
             '  TR.IDTIPOREGRA, TR.DESCREGRA  '+
             'FROM   '+
             '  TIPOREGRA TR '+
             'WHERE  '+
             '  TR.IDTIPOREGRA NOT IN (SELECT               '+
             '                           NVL(IDTIPOREGRA,0) AS IDTIPOREGRA '+
             '                         FROM                 '+
             '                           GRUPOREGRAUSUARIO  '+
             '                         WHERE                '+
             '                           ( IDUSUARIO = '+ IntToStr( IdUsuario )+ ' ) ) '+
             'ORDER BY '+
             '  TR.DESCREGRA ' ;
    Result := GetDataPacket( sSQL );
  end;
end;

{ Processo temporario para atualizar a chave da tabela de Controle de Acessos }
procedure TCtrlGrpRegraUsuario.AcertaControleAcesso;
Var
  sSQL : String;
  I : Integer;
begin
  sSQL := 'SELECT * FROM GRUPOREGRAUSUARIO WHERE IDGRUPOREGRA IS NOT NULL';
  _Cds.Data := GetDataPacket(sSQL);
  I := 1;
  While Not _Cds.Eof Do Begin
    sSQL := 'UPDATE GRUPOREGRAUSUARIO SET IDGRUPOREGRAUSU = '+IntToStr(I) +' '+
            'WHERE IDUSUARIO    = '+_Cds.FieldByName('IDUSUARIO').AsString+' AND '+
            '      IDGRUPOREGRA = '+_Cds.FieldByName('IDGRUPOREGRA').AsString;

    If Not ExecSQL(sSQL) Then Begin
      ShowMessage('ERRO');
      Exit;
    End;

    _Cds.Next;

    Inc(I);
    
  End;

end;

end.

