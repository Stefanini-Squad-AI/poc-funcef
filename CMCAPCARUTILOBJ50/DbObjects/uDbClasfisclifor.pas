{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 10/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbClasfisclifor;

interface

Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbClasfisclifor = class(TCmDbObject)

  private

     fIdclasfisclifor: TCmDbField;
     fFlgtipofatura: TCmDbField;
     fDescclasfisclifor: TCmDbField;
     fCodreduzido: TCmDbField;
     Procedure SetIdclasfisclifor(const Value: TCmDbField);
     Procedure SetFlgtipofatura(const Value: TCmDbField);
     Procedure SetDescclasfisclifor(const Value: TCmDbField);
     Procedure SetCodreduzido(const Value: TCmDbField);

  public

     Property Idclasfisclifor: TCmDbField read fIdclasfisclifor write SetIdclasfisclifor;
     Property Flgtipofatura: TCmDbField read fFlgtipofatura write SetFlgtipofatura;
     Property Descclasfisclifor: TCmDbField read fDescclasfisclifor write SetDescclasfisclifor;
     Property Codreduzido: TCmDbField read fCodreduzido write SetCodreduzido;

     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbClasfisclifor }

constructor TDbClasfisclifor.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CLASFISCLIFOR';

   fIdclasfisclifor := CreateCmDbField('IDCLASFISCLIFOR',ftfloat,False,True,False,True,'');
   fFlgtipofatura := CreateCmDbField('FLGTIPOFATURA',ftString,True,False,False,True,'');
   fDescclasfisclifor := CreateCmDbField('DESCCLASFISCLIFOR',ftString,True,False,False,True,'');
   fCodreduzido := CreateCmDbField('CODREDUZIDO',ftString,True,False,False,True,'');
end;

function TDbClasfisclifor.Insert: Boolean;
begin

   fIdclasfisclifor.AsFloat := GetSequence('CLASFISCLIFOR');
   Result := Inherited Insert;

end;

function TDbClasfisclifor.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbClasfisclifor.SetCodreduzido(const Value: TCmDbField);
begin
fCodreduzido := value;
end;

procedure TDbClasfisclifor.SetDescclasfisclifor(const Value: TCmDbField);
begin
fDescclasfisclifor := value;
end;

procedure TDbClasfisclifor.SetFlgtipofatura(const Value: TCmDbField);
begin
fFlgtipofatura := value;
end;

procedure TDbClasfisclifor.SetIdclasfisclifor(const Value: TCmDbField);
begin
fIdclasfisclifor := value;
end;

end.



