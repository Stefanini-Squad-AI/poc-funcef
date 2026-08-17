{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 19/09/2002                             }
{                                                       }
{*******************************************************}

unit uDbParamtrfcontab;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbParamtrfcontab = class(TCmDbObject)

  private
    FRecpag: TCmDbField;
    FIdpessoa: TCmDbField;
    FFlgativo: TCmDbField;
    FPlacontadest: TCmDbField;
    FPlacontaorig: TCmDbField;
    FCodtiprecdesorig: TCmDbField;
    FPlanodest: TCmDbField;
    FPlanoorig: TCmDbField;
    FIdparamtrfcontab: TCmDbField;
    FCodtiprecdesdest: TCmDbField;
    procedure SetCodtiprecdesdest(const Value: TCmDbField);
    procedure SetCodtiprecdesorig(const Value: TCmDbField);
    procedure SetFlgativo(const Value: TCmDbField);
    procedure SetIdparamtrfcontab(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetPlacontadest(const Value: TCmDbField);
    procedure SetPlacontaorig(const Value: TCmDbField);
    procedure SetPlanodest(const Value: TCmDbField);
    procedure SetPlanoorig(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);

  public

     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Planoorig: TCmDbField read FPlanoorig write SetPlanoorig;
     Property Planodest: TCmDbField read FPlanodest write SetPlanodest;
     Property Placontaorig: TCmDbField read FPlacontaorig write SetPlacontaorig;
     Property Placontadest: TCmDbField read FPlacontadest write SetPlacontadest;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idparamtrfcontab: TCmDbField read FIdparamtrfcontab write SetIdparamtrfcontab;
     Property Flgativo: TCmDbField read FFlgativo write SetFlgativo;
     Property Codtiprecdesorig: TCmDbField read FCodtiprecdesorig write SetCodtiprecdesorig;
     Property Codtiprecdesdest: TCmDbField read FCodtiprecdesdest write SetCodtiprecdesdest;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbParamtrfcontab }

constructor TDbParamtrfcontab.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMTRFCONTAB';

   fRecpag := CreateCmDbField('RECPAG',ftString,True,False,False,True,'');
   fPlanoorig := CreateCmDbField('PLANOORIG',ftfloat,False,False,False,True,'');
   fPlanodest := CreateCmDbField('PLANODEST',ftfloat,False,False,False,True,'');
   fPlacontaorig := CreateCmDbField('PLACONTAORIG',ftString,False,False,False,True,'');
   fPlacontadest := CreateCmDbField('PLACONTADEST',ftString,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
   fIdparamtrfcontab := CreateCmDbField('IDPARAMTRFCONTAB',ftfloat,True,True,False,True,'');
   fFlgativo := CreateCmDbField('FLGATIVO',ftString,False,False,False,True,'');
   fCodtiprecdesorig := CreateCmDbField('CODTIPRECDESORIG',ftString,False,False,False,True,'');
   fCodtiprecdesdest := CreateCmDbField('CODTIPRECDESDEST',ftString,False,False,False,True,'');
end;

function TDbParamtrfcontab.Insert: Boolean;
begin

   fIdparamtrfcontab.AsFloat := GetSequence('PARAMTRFCONTAB');
   Result := Inherited Insert;

end;


procedure TDbParamtrfcontab.SetCodtiprecdesdest(const Value: TCmDbField);
begin
  FCodtiprecdesdest := Value;
end;

procedure TDbParamtrfcontab.SetCodtiprecdesorig(const Value: TCmDbField);
begin
  FCodtiprecdesorig := Value;
end;

procedure TDbParamtrfcontab.SetFlgativo(const Value: TCmDbField);
begin
  FFlgativo := Value;
end;

procedure TDbParamtrfcontab.SetIdparamtrfcontab(const Value: TCmDbField);
begin
  FIdparamtrfcontab := Value;
end;

procedure TDbParamtrfcontab.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbParamtrfcontab.SetPlacontadest(const Value: TCmDbField);
begin
  FPlacontadest := Value;
end;

procedure TDbParamtrfcontab.SetPlacontaorig(const Value: TCmDbField);
begin
  FPlacontaorig := Value;
end;

procedure TDbParamtrfcontab.SetPlanodest(const Value: TCmDbField);
begin
  FPlanodest := Value;
end;

procedure TDbParamtrfcontab.SetPlanoorig(const Value: TCmDbField);
begin
  FPlanoorig := Value;
end;

procedure TDbParamtrfcontab.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

end.



