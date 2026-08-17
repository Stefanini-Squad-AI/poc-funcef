{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 16/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbOutrodadoxTipoimo;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbOutrodadoxTipoimo = class(TCmDbObject)

  private
    FIdoutrodado: TCmDbField;
    FCodtipimovel: TCmDbField;
    procedure SetCodtipimovel(const Value: TCmDbField);
    procedure SetIdoutrodado(const Value: TCmDbField);

  public

     Property Idoutrodado: TCmDbField read FIdoutrodado write SetIdoutrodado;
     Property Codtipimovel: TCmDbField read FCodtipimovel write SetCodtipimovel;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbOutrodadoxTipoimo }

constructor TDbOutrodadoxTipoimo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'OUTRODADOXTIPOIMO';

   fIdoutrodado := CreateCmDbField('IDOUTRODADO',ftfloat,True,True,False,True,'Outro Dado');
   fCodtipimovel := CreateCmDbField('CODTIPIMOVEL',ftString,True,True,False,True,'Tipo Imóvel');
end;

function TDbOutrodadoxTipoimo.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbOutrodadoxTipoimo.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbOutrodadoxTipoimo.SetCodtipimovel(const Value: TCmDbField);
begin
  FCodtipimovel := Value;
end;

procedure TDbOutrodadoxTipoimo.SetIdoutrodado(const Value: TCmDbField);
begin
  FIdoutrodado := Value;
end;

end.



