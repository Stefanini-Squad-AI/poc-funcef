{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 07/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbModeloscnab;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbModeloscnab = class(TCmDbObject)

  private
     fRecpag : TCmDbField;
     fIdmodeloscnab: TCmDbField;
     fDescricao: TCmDbField;
     Procedure SetRecpag(const Value: TCmDbField);
     Procedure SetIdmodeloscnab(const Value: TCmDbField);
     Procedure SetDescricao(const Value: TCmDbField);

  public

     Property Recpag: TCmDbField read fRecpag Write SetRecpag;
     Property Idmodeloscnab: TCmDbField read fIdmodeloscnab Write SetIdmodeloscnab;
     Property Descricao: TCmDbField read fDescricao Write SetDescricao ;

     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbModeloscnab }

constructor TDbModeloscnab.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'MODELOSCNAB';

   fRecpag := CreateCmDbField('RECPAG',ftString,False,false,False);
   fIdmodeloscnab := CreateCmDbField('IDMODELOSCNAB',ftfloat,False,True,False);
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False);
end;

function TDbModeloscnab.Insert: Boolean;
begin

   fIDMODELOSCNAB.AsFloat := GetSequence('MODELOSCNAB');
   Result := Inherited Insert;

end;

function TDbModeloscnab.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbModeloscnab.SetDescricao(const Value: TCmDbField);
begin
     fDescricao := value;
end;

procedure TDbModeloscnab.SetIdmodeloscnab(const Value: TCmDbField);
begin
     fIdmodeloscnab := value;
end;

procedure TDbModeloscnab.SetRecpag(const Value: TCmDbField);
begin
     fRecpag := value;
end;

end.



