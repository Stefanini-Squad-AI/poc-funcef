{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbCheques;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbCheques = class(TCmDbObject)

  private
    FIdcheques: TCmDbField;
    FNumchequefinal: TCmDbField;
    FCodportador: TCmDbField;
    FNumchequeinicial: TCmDbField;
    FNumtalao: TCmDbField;
    FNumproximocheque: TCmDbField;
    procedure SetCodportador(const Value: TCmDbField);
    procedure SetIdcheques(const Value: TCmDbField);
    procedure SetNumchequefinal(const Value: TCmDbField);
    procedure SetNumchequeinicial(const Value: TCmDbField);
    procedure SetNumproximocheque(const Value: TCmDbField);
    procedure SetNumtalao(const Value: TCmDbField);

  public

     Property Numtalao: TCmDbField read FNumtalao write SetNumtalao;
     Property Numproximocheque: TCmDbField read FNumproximocheque write SetNumproximocheque;
     Property Numchequeinicial: TCmDbField read FNumchequeinicial write SetNumchequeinicial;
     Property Numchequefinal: TCmDbField read FNumchequefinal write SetNumchequefinal;
     Property Idcheques: TCmDbField read FIdcheques write SetIdcheques;
     Property Codportador: TCmDbField read FCodportador write SetCodportador;

     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbCheques }

constructor TDbCheques.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CHEQUES';

   fNumtalao := CreateCmDbField('NUMTALAO',ftfloat,False,False,False,True,'');
   fNumproximocheque := CreateCmDbField('NUMPROXIMOCHEQUE',ftfloat,False,False,False,True,'');
   fNumchequeinicial := CreateCmDbField('NUMCHEQUEINICIAL',ftfloat,False,False,False,True,'');
   fNumchequefinal := CreateCmDbField('NUMCHEQUEFINAL',ftfloat,False,False,False,True,'');
   fIdcheques := CreateCmDbField('IDCHEQUES',ftfloat,True,True,False,True,'');
   fCodportador := CreateCmDbField('CODPORTADOR',ftfloat,False,False,False,True,'');
end;

function TDbCheques.Insert: Boolean;
begin

   fIdcheques.AsFloat := GetSequence('CHEQUES');
   Result := Inherited Insert;

end;

function TDbCheques.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbCheques.SetCodportador(const Value: TCmDbField);
begin
  FCodportador := Value;
end;

procedure TDbCheques.SetIdcheques(const Value: TCmDbField);
begin
  FIdcheques := Value;
end;

procedure TDbCheques.SetNumchequefinal(const Value: TCmDbField);
begin
  FNumchequefinal := Value;
end;

procedure TDbCheques.SetNumchequeinicial(const Value: TCmDbField);
begin
  FNumchequeinicial := Value;
end;

procedure TDbCheques.SetNumproximocheque(const Value: TCmDbField);
begin
  FNumproximocheque := Value;
end;

procedure TDbCheques.SetNumtalao(const Value: TCmDbField);
begin
  FNumtalao := Value;
end;

end.



