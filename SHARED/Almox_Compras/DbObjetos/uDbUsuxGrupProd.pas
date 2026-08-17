{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 03/06/2002                             }
{                                                       }
{*******************************************************}

unit uDbUsuxGrupProd;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbUsuxGrupProd = class(TCmDbObject)

  private
    FCodGrupoProd: TCmDbField;
    FIdPessoa: TCmDbField;
    FIdUsuario: TCmDbField;
    procedure SetCodGrupoProd(const Value: TCmDbField);
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure SetIdUsuario(const Value: TCmDbField);

  public

     Property IdUsuario    : TCmDbField read FIdUsuario write SetIdUsuario;
     Property IdPessoa     : TCmDbField read FIdPessoa write SetIdPessoa;
     Property CodGrupoProd : TCmDbField read FCodGrupoProd write SetCodGrupoProd;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert : Boolean; Override;
     Function LoadFromDb : Boolean; Override;
     Function UpDate : Boolean; Override;
     Function Delete : Boolean; Override;
  End;

implementation

{ TDbUsuxGrupProd }

constructor TDbUsuxGrupProd.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'USUXGRUPPROD';

   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fCodgrupoprod := CreateCmDbField('CODGRUPOPROD',ftString,True,True,False,True,'');
end;

function TDbUsuxGrupProd.Delete: Boolean;
begin
  fCodgrupoprod.AsString := Copy(fCodgrupoprod.AsString +'          ',1,10);
   Result := Inherited Delete;
end;

function TDbUsuxGrupProd.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbUsuxGrupProd.LoadFromDB: Boolean;
begin
  fCodgrupoprod.AsString := Copy(fCodgrupoprod.AsString +'          ',1,10);

  Result := Inherited LoadFromDB;
end;

procedure TDbUsuxGrupProd.SetCodGrupoProd(const Value: TCmDbField);
begin
  FCodGrupoProd := Value;
end;

procedure TDbUsuxGrupProd.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

procedure TDbUsuxGrupProd.SetIdUsuario(const Value: TCmDbField);
begin
  FIdUsuario := Value;
end;

function TDbUsuxGrupProd.UpDate: Boolean;
begin
  fCodgrupoprod.AsString := Copy(fCodgrupoprod.AsString +'          ',1,10);
  Result := Inherited UpDate;
end;

end.



