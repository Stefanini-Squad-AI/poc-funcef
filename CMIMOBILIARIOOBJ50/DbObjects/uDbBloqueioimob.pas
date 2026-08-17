{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 10/08/2007                             }
{                                                       }
{*******************************************************}

unit uDbBloqueioimob;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbBloqueioimob = class(TCmDbObject)

  private
    FDatapagto: TCmDbField;
    FIddocumentobloq: TCmDbField;
    FIddocumentolib: TCmDbField;
    FIdcontratoimovel: TCmDbField;
    FIdbloqueioimob: TCmDbField;
    FVlrpagto: TCmDbField;
    procedure SetDatapagto(const Value: TCmDbField);
    procedure SetIdbloqueioimob(const Value: TCmDbField);
    procedure SetIdcontratoimovel(const Value: TCmDbField);
    procedure SetIddocumentobloq(const Value: TCmDbField);
    procedure SetIddocumentolib(const Value: TCmDbField);
    procedure SetVlrpagto(const Value: TCmDbField);

  public

     Property Vlrpagto: TCmDbField read FVlrpagto write SetVlrpagto;
     Property Iddocumentolib: TCmDbField read FIddocumentolib write SetIddocumentolib;
     Property Iddocumentobloq: TCmDbField read FIddocumentobloq write SetIddocumentobloq;
     Property Idcontratoimovel: TCmDbField read FIdcontratoimovel write SetIdcontratoimovel;
     Property Idbloqueioimob: TCmDbField read FIdbloqueioimob write SetIdbloqueioimob;
     Property Datapagto: TCmDbField read FDatapagto write SetDatapagto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbBloqueioimob }

constructor TDbBloqueioimob.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'BLOQUEIOIMOB';

   fVlrpagto := CreateCmDbField('VLRPAGTO',ftfloat,False,False,False,True,'');
   fIddocumentolib := CreateCmDbField('IDDOCUMENTOLIB',ftfloat,False,False,False,True,'');
   fIddocumentobloq := CreateCmDbField('IDDOCUMENTOBLOQ',ftfloat,True,False,False,True,'');
   fIdcontratoimovel := CreateCmDbField('IDCONTRATOIMOVEL',ftfloat,True,False,False,True,'');
   fIdbloqueioimob := CreateCmDbField('IDBLOQUEIOIMOB',ftfloat,True,True,False,True,'');
   fDatapagto := CreateCmDbField('DATAPAGTO',ftDateTime,False,False,False,True,'');
end;

function TDbBloqueioimob.Insert: Boolean;
begin

   fIdbloqueioimob.AsFloat := GetSequence('BLOQUEIOIMOB');
   Result := Inherited Insert;

end;


procedure TDbBloqueioimob.SetDatapagto(const Value: TCmDbField);
begin
  FDatapagto := Value;
end;

procedure TDbBloqueioimob.SetIdbloqueioimob(const Value: TCmDbField);
begin
  FIdbloqueioimob := Value;
end;

procedure TDbBloqueioimob.SetIdcontratoimovel(const Value: TCmDbField);
begin
  FIdcontratoimovel := Value;
end;

procedure TDbBloqueioimob.SetIddocumentobloq(const Value: TCmDbField);
begin
  FIddocumentobloq := Value;
end;

procedure TDbBloqueioimob.SetIddocumentolib(const Value: TCmDbField);
begin
  FIddocumentolib := Value;
end;

procedure TDbBloqueioimob.SetVlrpagto(const Value: TCmDbField);
begin
  FVlrpagto := Value;
end;

end.



