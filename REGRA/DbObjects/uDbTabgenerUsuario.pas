{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 07/04/2003                             }
{                                                       }
{*******************************************************}

unit uDbTabgenerUsuario;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTabgenerUsuario = class(TCmDbObject)

  private
    FFlgalterar: TCmDbField;
    FIdusuario: TCmDbField;
    FFlgexcluir: TCmDbField;
    FFlgProcurar: TCmDbField;
    FCodtabela: TCmDbField;
    procedure SetCodtabela(const Value: TCmDbField);
    procedure SetFlgalterar(const Value: TCmDbField);
    procedure SetFlgexcluir(const Value: TCmDbField);
    procedure SetFlgProcurar(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);

  public

     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property FlgProcurar: TCmDbField read FFlgProcurar write SetFlgProcurar;
     Property Flgexcluir: TCmDbField read FFlgexcluir write SetFlgexcluir;
     Property Flgalterar: TCmDbField read FFlgalterar write SetFlgalterar;
     Property Codtabela: TCmDbField read FCodtabela write SetCodtabela;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTabgenerUsuario }

constructor TDbTabgenerUsuario.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TABGENERUSUARIO';

   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,True,True,False,False,'Usuário');
   fFlgProcurar := CreateCmDbField('FLGProcurar',ftfloat,False,False,False,False,'Procurar');
   fFlgexcluir := CreateCmDbField('FLGEXCLUIR',ftfloat,False,False,False,False,'Excluir');
   fFlgalterar := CreateCmDbField('FLGALTERAR',ftfloat,False,False,False,False,'Alterar');
   fCodtabela := CreateCmDbField('CODTABELA',ftString,True,True,False,False,'Tabela Genérica');
end;

function TDbTabgenerUsuario.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbTabgenerUsuario.SetCodtabela(const Value: TCmDbField);
begin
  FCodtabela := Value;
end;

procedure TDbTabgenerUsuario.SetFlgalterar(const Value: TCmDbField);
begin
  FFlgalterar := Value;
end;

procedure TDbTabgenerUsuario.SetFlgexcluir(const Value: TCmDbField);
begin
  FFlgexcluir := Value;
end;

procedure TDbTabgenerUsuario.SetFlgProcurar(const Value: TCmDbField);
begin
  FFlgProcurar := Value;
end;

procedure TDbTabgenerUsuario.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

end.



