{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbOutrodadoXUnidaut;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbOutrodadoXUnidaut = class(TCmDbObject)

  private
    FIdoutrodado: TCmDbField;
    FOduvalor: TCmDbField;
    FIdunidaut: TCmDbField;
    procedure SetIdoutrodado(const Value: TCmDbField);
    procedure SetIdunidaut(const Value: TCmDbField);
    procedure SetOduvalor(const Value: TCmDbField);

  public

     Property Oduvalor: TCmDbField read FOduvalor write SetOduvalor;
     Property Idunidaut: TCmDbField read FIdunidaut write SetIdunidaut;
     Property Idoutrodado: TCmDbField read FIdoutrodado write SetIdoutrodado;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbOutrodadoXUnidaut }

constructor TDbOutrodadoXUnidaut.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'OUTRODADOXUNIDAUT';

   fOduvalor := CreateCmDbField('ODUVALOR',ftString,True,False,False,True,'Valor para outro dado');
   fIdunidaut := CreateCmDbField('IDUNIDAUT',ftfloat,True,True,False,True,'Unidade Autônoma');
   fIdoutrodado := CreateCmDbField('IDOUTRODADO',ftfloat,True,True,False,True,'Outro Dado');
end;

function TDbOutrodadoXUnidaut.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbOutrodadoXUnidaut.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbOutrodadoXUnidaut.SetIdoutrodado(const Value: TCmDbField);
begin
  FIdoutrodado := Value;
end;

procedure TDbOutrodadoXUnidaut.SetIdunidaut(const Value: TCmDbField);
begin
  FIdunidaut := Value;
end;

procedure TDbOutrodadoXUnidaut.SetOduvalor(const Value: TCmDbField);
begin
  FOduvalor := Value;
end;

end.



