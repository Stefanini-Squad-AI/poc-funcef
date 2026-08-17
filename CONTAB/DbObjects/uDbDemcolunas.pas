{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em:  20/01/2002                            }
{                                                       }
{*******************************************************}

unit uDbDemcolunas;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbDemcolunas = class(TCmDbObject)

  private
    FIddemonstrativo: TCmDbField;
    FNomecoluna     : TCmDbField;
    FNumcoluna      : TCmDbField;

    procedure SetIddemonstrativo(const Value: TCmDbField);
    procedure SetNomecoluna(const Value: TCmDbField);
    procedure SetNumcoluna(const Value: TCmDbField);

  public

     Property Numcoluna      : TCmDbField read FNumcoluna       write SetNumcoluna;
     Property Nomecoluna     : TCmDbField read FNomecoluna      write SetNomecoluna;
     Property Iddemonstrativo: TCmDbField read FIddemonstrativo write SetIddemonstrativo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbDemcolunas }

constructor TDbDemcolunas.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DEMCOLUNAS';

   fNumcoluna       := CreateCmDbField('NUMCOLUNA',ftfloat,True,True,False,True,'');
   fNomecoluna      := CreateCmDbField('NOMECOLUNA',ftString,False,False,False,True,'');
   fIddemonstrativo := CreateCmDbField('IDDEMONSTRATIVO',ftfloat,True,True,False,True,'');
end;

function TDbDemcolunas.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbDemcolunas.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbDemcolunas.SetIddemonstrativo(const Value: TCmDbField);
begin
  FIddemonstrativo := Value;
end;

procedure TDbDemcolunas.SetNomecoluna(const Value: TCmDbField);
begin
  FNomecoluna := Value;
end;

procedure TDbDemcolunas.SetNumcoluna(const Value: TCmDbField);
begin
  FNumcoluna := Value;
end;

end.



