unit UCtrlTabgenerUsuario;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     uCmTypes, uDbTabgenerUsuario;

Type

  TCtrlTabgenerUsuario = class(TCmControlObject)
  private
    FCdsTabgenerUsuario: TCMClientDataSet;
    FDbTabgenerUsuario: TDbTabgenerUsuario;
    procedure SetCdsTabgenerUsuario(const Value: TCMClientDataSet);
    procedure SetDbTabgenerUsuario(const Value: TDbTabgenerUsuario);

  protected

    procedure DoChangeDataBase; Override;

  public

    constructor Create;  override;
    destructor  Destroy; override;

    property DbGrupoRegraUsuario : TDbTabgenerUsuario read FDbTabgenerUsuario  write SetDbTabgenerUsuario;
    property CdsTabgenerUsuario : TCMClientDataSet  read FCdsTabgenerUsuario write SetCdsTabgenerUsuario;

    function SelecionaTabgenerUsuario( IdUsuario : Integer )  : OleVariant;
    function GravaTabgenerUsuario : Boolean;

    function ListaUsuario : OleVariant;
    function ListaTabgenerNaoAssociado( idUsuario : Integer ): OleVariant;
  published

end;

implementation

{ TCtrlTabgenerUsuario }

constructor TCtrlTabgenerUsuario.Create;
begin
  inherited;
  FDbTabgenerUsuario := TDbTabgenerUsuario.Create(Self);
  FCdsTabgenerUsuario  := TCMClientDataSet.Create(Nil);
end;

destructor TCtrlTabgenerUsuario.Destroy;
begin
  FDbTabgenerUsuario.Free;
  FCdsTabgenerUsuario.Free;
  inherited;
end;

procedure TCtrlTabgenerUsuario.DoChangeDataBase;
begin
  inherited;
  FDbTabgenerUsuario.DataBaseName := Self.DataBaseName;
end;


function TCtrlTabgenerUsuario.GravaTabgenerUsuario: Boolean;
var
  Msg : String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarTabgenerUsuario( CdsTabgenerUsuario.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      Result := ApplyCds( CdsTabgenerUsuario, DbGrupoRegraUsuario, [], [] );

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


procedure TCtrlTabgenerUsuario.SetCdsTabgenerUsuario(const Value: TCMClientDataSet);
begin
  FCdsTabgenerUsuario := Value;
end;

procedure TCtrlTabgenerUsuario.SetDbTabgenerUsuario(const Value: TDbTabgenerUsuario);
begin
  FDbTabgenerUsuario := Value;
end;

function TCtrlTabgenerUsuario.SelecionaTabgenerUsuario( IdUsuario : Integer )  : OleVariant;
Var
  sSQL : String;
begin
  sSQL := ' SELECT                             '+
          '   TXU.CODTABELA  , TXU.IDUSUARIO,  '+
          '   TXU.FLGALTERAR , TXU.FLGEXCLUIR, '+
          '   TXU.FLGPROCURAR, TG.DESCRICAO,  US.NOMEUSUARIO  '+
          ' FROM                                              '+
          '   TABGENERUSUARIO TXU, USUARIOSISTEMA US, TABGENER TG '+
          ' WHERE                                                 '+
          '   ( TXU.IDUSUARIO = '+ IntToStr( IdUsuario )+ ' ) AND '+
          '   ( TXU.IDUSUARIO = US.IDUSUARIO ) AND                '+
          '   ( TXU.CODTABELA = TG.CODTABELA )                    '+
          ' ORDER BY                                              '+
          '   TG.DESCRICAO                                        ';
  Result := GetDataPacket( sSQL );
end;



function TCtrlTabgenerUsuario.ListaUsuario: OleVariant;
Var
  sSQL : String;
begin
  sSQL :=  'SELECT * FROM USUARIOSISTEMA ORDER BY NOMEUSUARIO';
  Result := GetDataPacket( sSQL );
end;


function TCtrlTabgenerUsuario.ListaTabgenerNaoAssociado( idUsuario : Integer ): OleVariant;
Var
  sSQL : String;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ListaTabgenerNaoAssociado;//( IdUsuario : Integer );
  end else begin
    sSQL :=  'SELECT '+
             '  TG.CODTABELA, TG.DESCRICAO '+
             'FROM   '+
             '  TABGENER TG '+
             'WHERE  '+
             '  TG.CODTABELA NOT IN (SELECT             '+
             '                         CODTABELA        '+
             '                       FROM               '+
             '                         TABGENERUSUARIO  '+
             '                       WHERE              '+
             '                         ( IDUSUARIO   = '+ IntToStr( IdUsuario )+ ' ) )'+
             'ORDER BY '+
             '  TG.DESCRICAO ' ;
    Result := GetDataPacket( sSQL );
  end;
end;

end.

