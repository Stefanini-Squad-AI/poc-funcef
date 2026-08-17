{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Alexandre Gonçalves             }
{ Atualizado Em: 24/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbDocrecxcomp;

interface
Uses uCmDbObject, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbDocrecxcomp = class(TCmDbObject)

  private
     FVlrreembolso: TCmDbField;
     FIdreservaorcamen: TCmDbField;
     FCoddocumento: TCmDbField;

     Procedure SetVlrreembolso(const Value: TCmDbField);
     Procedure SetIdreservaorcamen(const Value: TCmDbField);
     Procedure SetCoddocumento(const Value: TCmDbField);
  public

     Property Vlrreembolso    : TCmDbField
                               Read FVlrreembolso     Write SetVlrreembolso;
     Property Idreservaorcamen: TCmDbField
                               Read FIdreservaorcamen Write SetIdreservaorcamen;
     Property Coddocumento    : TCmDbField
                               Read FCoddocumento     Write SetCoddocumento;

     Constructor Create(AOwner: TcmCustomcdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbDocrecxcomp }

constructor TDbDocrecxcomp.Create(AOwner: TcmCustomcdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DOCRECXCOMP';

   fVlrreembolso     := CreateCmDbField('VLRREEMBOLSO',    ftfloat,False,False,
                        False,True,'');
   fIdreservaorcamen := CreateCmDbField('IDRESERVAORCAMEN',ftfloat,True ,True ,
                        False,True,'');
   fCoddocumento     := CreateCmDbField('CODDOCUMENTO',    ftfloat,True ,True ,
                        False,True,'');
end;

function TDbDocrecxcomp.Insert: Boolean;
begin

   fCoddocumento.AsFloat := GetSequence('DOCRECXCOMP');
   Result := Inherited Insert;

end;

function TDbDocrecxcomp.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

Procedure TDbDocrecxcomp.SetVlrreembolso(const Value: TCmDbField);
Begin

  FVlrreembolso := Value;
End;

Procedure TDbDocrecxcomp.SetIdreservaorcamen(const Value: TCmDbField);
Begin

  FIdreservaorcamen := Value;
End;

Procedure TDbDocrecxcomp.SetCoddocumento(const Value: TCmDbField);
Begin

  FCoddocumento := Value;
End;

end.



