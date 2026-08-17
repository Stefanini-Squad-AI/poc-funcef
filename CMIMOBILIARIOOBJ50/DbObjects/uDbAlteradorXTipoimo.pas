{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 28/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbAlteradorXTipoimo;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbAlteradorXTipoimo = class(TCmDbObject)

  private
    FCodalterador: TCmDbField;
    FCodtipimovel: TCmDbField;
    procedure SetCodalterador(const Value: TCmDbField);
    procedure SetCodtipimovel(const Value: TCmDbField);

  public

     Property Codtipimovel: TCmDbField read FCodtipimovel write SetCodtipimovel;
     Property Codalterador: TCmDbField read FCodalterador write SetCodalterador;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbAlteradorXTipoimo }

constructor TDbAlteradorXTipoimo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ALTERADORXTIPOIMO';

   fCodtipimovel := CreateCmDbField('CODTIPIMOVEL',ftString,True,True,False,True,'Tipo Imóvel');
   fCodalterador := CreateCmDbField('CODALTERADOR',ftfloat,True,True,False,True,'Alterador');
end;

function TDbAlteradorXTipoimo.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbAlteradorXTipoimo.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbAlteradorXTipoimo.SetCodalterador(const Value: TCmDbField);
begin
  FCodalterador := Value;
end;

procedure TDbAlteradorXTipoimo.SetCodtipimovel(const Value: TCmDbField);
begin
  FCodtipimovel := Value;
end;

end.



