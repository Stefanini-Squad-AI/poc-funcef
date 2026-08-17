{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 05/07/2006                             }
{                                                       }
{*******************************************************}

unit uDbPortcontaxplano;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbPortcontaxplano = class(TCmDbObject)

  private
    FIdportcontaxplano: TCmDbField;
    FCodportador: TCmDbField;
    FIdplanoprev: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FTrguserinclusao: TCmDbField;
    procedure SetCodportador(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdportcontaxplano(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);

  public

     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Idportcontaxplano: TCmDbField read FIdportcontaxplano write SetIdportcontaxplano;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Codportador: TCmDbField read FCodportador write SetCodportador;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbPortcontaxplano }

constructor TDbPortcontaxplano.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PORTCONTAXPLANO';

   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fIdportcontaxplano := CreateCmDbField('IDPORTCONTAXPLANO',ftfloat,True,True,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,False,False,False,True,'');
   fCodportador := CreateCmDbField('CODPORTADOR',ftfloat,False,False,False,True,'');
end;

function TDbPortcontaxplano.Insert: Boolean;
begin

   fIdportcontaxplano.AsFloat := GetSequence('PORTCONTAXPLANO');
   Result := Inherited Insert;

end;


procedure TDbPortcontaxplano.SetCodportador(const Value: TCmDbField);
begin
  FCodportador := Value;
end;

procedure TDbPortcontaxplano.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbPortcontaxplano.SetIdportcontaxplano(const Value: TCmDbField);
begin
  FIdportcontaxplano := Value;
end;

procedure TDbPortcontaxplano.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbPortcontaxplano.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



