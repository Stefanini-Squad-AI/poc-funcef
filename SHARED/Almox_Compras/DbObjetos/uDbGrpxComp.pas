{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 12/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbGrpxComp;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbGrpxComp = class(TCmDbObject)

  private
    FCodGrupoProd: TCmDbField;
    FIdComprador: TCmDbField;
    procedure SetCodGrupoProd(const Value: TCmDbField);
    procedure SetIdComprador(const Value: TCmDbField);

  public

     Property IdComprador  : TCmDbField read FIdComprador write SetIdComprador;
     Property CodGrupoProd : TCmDbField read FCodGrupoProd write SetCodGrupoProd;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbGrpxComp }

constructor TDbGrpxComp.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'GRPXCOMP';

   fIdcomprador  := CreateCmDbField('IDCOMPRADOR',ftfloat,True,True,False,True,'Comprador');
   fCodgrupoprod := CreateCmDbField('CODGRUPOPROD',ftString,True,True,False,True,'Grupo de Produto');
end;

function TDbGrpxComp.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbGrpxComp.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbGrpxComp.SetCodGrupoProd(const Value: TCmDbField);
begin
  FCodGrupoProd := Value;
end;

procedure TDbGrpxComp.SetIdComprador(const Value: TCmDbField);
begin
  FIdComprador := Value;
end;

end.



