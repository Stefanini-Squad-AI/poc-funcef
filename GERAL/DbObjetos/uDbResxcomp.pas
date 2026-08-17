{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Alexandre Goncalves             }
{ Atualizado Em: 18/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbResxcomp;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbResxcomp = class(TCmDbObject)

  private
     FIdresxcomp    : TCmDbField;
     FIdreserva     : TCmDbField;
     FIdpessoa      : TCmDbField;
     FIdcompromisso : TCmDbField;

     Procedure SetIdresxcomp(const Value: TCmDbField);
     Procedure SetIdreserva(const Value: TCmDbField);
     Procedure SetIdpessoa(const Value: TCmDbField);
     Procedure SetIdcompromisso(const Value: TCmDbField);
  public

     Property Idresxcomp    : TCmDbField
                              Read FIdresxcomp    Write SetIdresxcomp;
     Property Idreserva     : TCmDbField
                              Read FIdreserva     Write SetIdreserva;
     Property Idpessoa      : TCmDbField
                              Read FIdpessoa      Write SetIdpessoa;
     Property Idcompromisso : TCmDbField
                              Read FIdcompromisso Write SetIdcompromisso;

     Constructor Create(AOwner: TcmCustomcdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbResxcomp }

constructor TDbResxcomp.Create(AOwner: TcmCustomcdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RESXCOMP';

   fIdresxcomp    := CreateCmDbField('IDRESXCOMP'   ,ftfloat,True ,True ,
                     False,True,'');
   fIdreserva     := CreateCmDbField('IDRESERVA'    ,ftfloat,False,False,
                     False,True,'');
   fIdpessoa      := CreateCmDbField('IDPESSOA'     ,ftfloat,False,False,
                     False,True,'');
   fIdcompromisso := CreateCmDbField('IDCOMPROMISSO',ftfloat,False,False,
                     False,True,'');
end;

function TDbResxcomp.Insert: Boolean;
begin

   fIdresxcomp.AsFloat := GetSequence('RESXCOMP');
   Result := Inherited Insert;

end;

function TDbResxcomp.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

Procedure TDbResxcomp.SetIdresxcomp(const Value: TCmDbField);
Begin

  FIdresxcomp    := Value;

End;

Procedure TDbResxcomp.SetIdreserva(const Value: TCmDbField);
Begin

  FIdreserva     := Value;

End;

Procedure TDbResxcomp.SetIdpessoa(const Value: TCmDbField);
Begin

  FIdpessoa      := Value;

End;

Procedure TDbResxcomp.SetIdcompromisso(const Value: TCmDbField);
Begin

  FIdcompromisso := Value;

End;

end.



