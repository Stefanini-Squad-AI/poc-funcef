{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 26/03/2002                             }
{                                                       }
{*******************************************************}

unit uDBPlanoPatroxBem;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBPlanoPatroxBem = class(TCmDbObject)

  private
    FIdpessoa: TCmDbField;
    FIdpatro: TCmDbField;
    FPpbpercrateio: TCmDbField;
    FIdplanoprev: TCmDbField;
    FIdbem: TCmDbField;
    procedure SetIdbem(const Value: TCmDbField);
    procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetPpbpercrateio(const Value: TCmDbField);

  public

     Property Ppbpercrateio: TCmDbField read FPpbpercrateio write SetPpbpercrateio;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property Idbem: TCmDbField read FIdbem write SetIdbem;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBPlanoPatroxBem }

constructor TDBPlanoPatroxBem.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'PLANOPATROXBEM';

   fPpbpercrateio := CreateCmDbField('PPBPERCRATEIO',ftfloat,False,False,False,False,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdpatro := CreateCmDbField('IDPATRO',ftfloat,True,True,False,True,'');
   fIdbem := CreateCmDbField('IDBEM',ftfloat,True,True,False,True,'');
end;

function TDBPlanoPatroxBem.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBPlanoPatroxBem.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBPlanoPatroxBem.SetIdbem(const Value: TCmDbField);
begin
  FIdbem := Value;
end;

procedure TDBPlanoPatroxBem.SetIdpatro(const Value: TCmDbField);
begin
  FIdpatro := Value;
end;

procedure TDBPlanoPatroxBem.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBPlanoPatroxBem.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDBPlanoPatroxBem.SetPpbpercrateio(const Value: TCmDbField);
begin
  FPpbpercrateio := Value;
end;

end.



