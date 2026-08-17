{*******************************************************}
{                                                       }
{  -- No Create do Form                                 }
{   Fiario := TFiario.Create;                           }
{                                                       }
{   StartTransacao;                                     }
{   If Fiario.Inserir Then                              }
{      CommiTransacao                                   }
{   Else                                                }
{      RollbackTransacao;                               }
{                                                       }
{   -- No Close do Form                                 }
{   Fiario.Free;                                        }
{                                                       }
{*******************************************************}

unit uFiario;

interface

uses
   Classes, wwQuery, SysUtils;

type
   TFiario = Class

   private
      _QryInsert :TwwQuery;
    FDataBaseName: String;
    FIdFiario: Integer;
    FDescricao: String;
    Fx: integer;
    FIdpessoa: Integer;
    Fidtitular: integer;
    FDataInclusao: TDateTime;
    FIdusuario: Integer;
    FIdmodulo: Integer;
    FIDrubs: Integer;
    FIdGrupo:Integer;

    procedure SetDataBaseName(const Value: String);
    procedure SetDescricao(const Value: String);
    procedure SetIdFiario(const Value: Integer);
    procedure SetIdpessoa(const Value: Integer);
    procedure SetIdtitular(const Value: integer);
    procedure SetIdmodulo(const Value: Integer);
    procedure SetIdrubs(const Value: Integer);
    procedure SetIdusuario(const Value: Integer);
    procedure SetDataInclusao(const Value: TDateTime);
    procedure SetIdGrupo(const Value: Integer);

   public

      Constructor Create;
      Destructor Destroy; Override;
      function Inserir: Boolean;

      property DataBaseName :String read FDataBaseName write SetDataBaseName;

      //Propriedades para persistir com os campos da tabela fiario
      property IDFiario       : Integer   read FIDFiario       write SetIDFiario;
      property IDPessoa       : Integer   read FIDPessoa       write SetIDPessoa;
      property IDTitular      : Integer   read FIDTitular      write SetIDTitular;
      property IDUsuario      : Integer   read FIDUsuario      write SetIDUsuario;
      property IDModulo       : Integer   read FIDModulo       write SetIDModulo;
      property IDRubs         : Integer   read FIDRubs         write SetIDRubs;
      property Descricao      : String    read FDescricao      write SetDescricao;
      property DataInclusao   : TDateTime read FDataInclusao   write SetDataInclusao;
      property IDGrupo        : Integer   read FIDGrupo        write SetIDGrupo;

  end;



var
  Fiario :TFiario;



implementation
{ TFiario }
Uses
   UDataBase;



constructor TFiario.Create;
begin
   _QryInsert     := TwwQuery.Create(nil);
   FDataBaseName := '';
   FIdFiario      := 0;
   FIdtitular     := 0;
   FIdusuario     := 0;
   FIdmodulo      := 0;
   FIdRubs        := 0;
   FDataInclusao  := Date;
   FDescricao     := '';
   FIDpessoa      := 0;
   FIdGrupo       := 0;
end;



destructor TFiario.Destroy;
begin
   _QryInsert.Free;
   Inherited Destroy;
end;



function TFiario.Inserir: Boolean;
begin
   Fiario.DataBaseName  := 'BASEDADOS';
   Fiario.IdFiario      := LeUltRegistro(nil, 'FIARIO') ;

   if FIdrubs = 0 then begin
      _QryInsert.Sql.Text := SqlInsert([FIdFiario, FIdpessoa, FIdtitular, FIdusuario, FIdmodulo,
                                        FIdGrupo, FDescricao, variant(FDataInclusao)], 'FIARIO',
                                        ['IDFIARIOA', 'IDPESSOA', 'IDTITULAR', 'IDUSUARIO', 'IDMODULO',
                                        'IDGRUPO', 'DESCRICAO', 'DATAINCLUSAO']);

   end; (* if FIdrubs = 0 *)

   if FIdrubs <> 0 then begin
      _QryInsert.Sql.Text := SqlInsert([FIdFiario, FIdpessoa, FIdtitular, FIdusuario, FIdmodulo,
                                        FIdGrupo, FIdrubs, FDescricao, variant(FDataInclusao)],
                                        'FIARIO', ['IDFIARIOA', 'IDPESSOA', 'IDTITULAR', 'IDUSUARIO',
                                        'IDMODULO', 'IDGRUPO', 'IDRUBS', 'DESCRICAO', 'DATAINCLUSAO']);


   end; (* FIdrubs <> 0 *)


   try
      _QryInsert.ExecSql;
      Result := True;
   except
      Result := False;
   end;
end;



procedure TFiario.SetDataBaseName(const Value: String);
begin
   FDataBaseName := Value;

   if _QryInsert.DataBaseName <> Value then
   begin
      If _QryInsert.Active Then _QryInsert.Close;
     _QryInsert.DataBaseName := Value
   end;
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



procedure TFiario.SetIdGrupo(const Value: Integer);
begin
   FIDGrupo := Value;
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
