unit uFiario;

interface

Uses Classes, wwQuery, SysUtils;

Type
  TFiario = Class

  private
     _QryInsert :TwwQuery;
    FDataBaseNamse: String;
    FIdFiario: Integer;
    FDescricao: String;
    Fx: integer;
    FIdpessoa: Integer;
    Fidtitular: integer;
    FDataInclusao: TDateTime;
    FIdusuario: Integer;
    FIdmodulo: Integer;
    FIDrubs: Integer;
    procedure SetDataBaseNamse(const Value: String);
    procedure SetDescricao(const Value: String);
    procedure SetIdFiario(const Value: Integer);
    procedure SetIdpessoa(const Value: Integer);
    procedure SetIdtitular(const Value: integer);
    procedure SetIdmodulo(const Value: Integer);
    procedure SetIdrubs(const Value: Integer);
    procedure SetIdusuario(const Value: Integer);
    procedure SetDataInclusao(const Value: TDateTime);
  public
     Constructor Create;
     Destructor Destroy; Override;
     function Inserir :Boolean;

     property DataBaseNamse :String read FDataBaseNamse write SetDataBaseNamse;

     //Propriedades para persistir com os campos da tabela fiario
     property IdFiario :Integer read FIdFiario write SetIdFiario;
     property Idpessoa :Integer read FIdpessoa write  SetIdpessoa;
     property Idtitular :Integer read FIdtitular write SetIdtitular;
     property Idusuario :Integer read FIdusuario write SetIdusuario;
     property Idmodulo :Integer read FIdmodulo write SetIdmodulo;
     property Idrubs :Integer read FIDrubs write SetIdrubs;
     property Descricao :String read FDescricao write SetDescricao;
     property DataInclusao :TDateTime read FDataInclusao write SetDataInclusao;
  End;

Var
  Fiario :TFiario;

implementation

{ TFiario }

Uses UDataBase;

constructor TFiario.Create;
begin
   _QryInsert := TwwQuery.Create(nil);;
   FDataBaseNamse := '';
   FIdFiario := 0;
   FIdtitular := 0;
   FIdusuario := 0;
   FIdmodulo := 0;
   FIdRubs   := 0;
   FDataInclusao := Date;
   FDescricao := '';
   FIDpessoa := 0;
end;

destructor TFiario.Destroy;
begin
   _QryInsert.Free;
   Inherited Destroy;
end;

function TFiario.Inserir: Boolean;
begin
    Fiario.DataBaseNamse := 'BaseDados';
    Fiario.IdFiario := leUltRegistro(nil,'Fiario') ;
   If FIdrubs = 0  then
   begin
        _QryInsert.Sql.Text := SqlInsert([FIdFiario,FIdpessoa,FIdtitular,FIdusuario,FIdmodulo,FDescricao,variant(FDataInclusao)],
                                       'FIARIO',
                                        ['IDFIARIOA','IDPESSOA','IDTITULAR','IDUSUARIO','IDMODULO','DESCRICAO','DATAINCLUSAO']);

   end;
  If FIdrubs <> 0  then
   begin
      _QryInsert.Sql.Text := SqlInsert([FIdFiario,FIdpessoa,FIdtitular,FIdusuario,FIdmodulo,FIdrubs,FDescricao,variant(FDataInclusao)],
                                       'FIARIO',
                                        ['IDFIARIOA','IDPESSOA','IDTITULAR','IDUSUARIO','IDMODULO','IDRUBS','DESCRICAO','DATAINCLUSAO']);

  end;
  Try

    _QryInsert.ExecSql;
    Result := True;
  Except
    Result := False;
  End;
end;

procedure TFiario.SetDataBaseNamse(const Value: String);
begin
  FDataBaseNamse := Value;

  If _QryInsert.DataBaseName <> Value Then
  Begin
     If _QryInsert.Active Then _QryInsert.Close;
     _QryInsert.DataBaseName := Value
  End;
end;

procedure TFiario.SetDataInclusao(const Value: TDateTime);
begin
  FDataInclusao := Value;
end;

procedure TFiario.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TFiario.SetIdFiario(const Value: Integer);
begin
  FIdFiario := Value;
end;

procedure TFiario.SetIdmodulo(const Value: Integer);
begin
  FIdmodulo := Value;
end;

procedure TFiario.SetIdpessoa(const Value: Integer);
begin
  FIdpessoa := Value;
end;

procedure TFiario.SetIdrubs(const Value: Integer);
begin
  FIDrubs := Value;
end;

procedure TFiario.SetIdtitular(const Value: integer);
begin
  Fidtitular := Value;
end;

procedure TFiario.SetIdusuario(const Value: Integer);
begin
  FIdusuario := Value;
end;

end.
