{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Alex Pereira                    }
{ Atualizado Em: 16/12/2003                             }
{                                                       }
{*******************************************************}

unit uDbSegregadata;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbSegregadata = class(TCmDbObject)

  private
    FIdsegregadata: TCmDbField;
    FDatafim: TCmDbField;
    FIdsegregacriter: TCmDbField;
    FDataini: TCmDbField;
    procedure SetDatafim(const Value: TCmDbField);
    procedure SetDataini(const Value: TCmDbField);
    procedure SetIdsegregacriter(const Value: TCmDbField);
    procedure SetIdsegregadata(const Value: TCmDbField);

  public

     Property Idsegregadata: TCmDbField read FIdsegregadata write SetIdsegregadata;
     Property Idsegregacriter: TCmDbField read FIdsegregacriter write SetIdsegregacriter;
     Property Dataini: TCmDbField read FDataini write SetDataini;
     Property Datafim: TCmDbField read FDatafim write SetDatafim;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbSegregadata }

constructor TDbSegregadata.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SEGREGADATA';

   fIdsegregadata := CreateCmDbField('IDSEGREGADATA',ftfloat,True,True,False,True,'');
   fIdsegregacriter := CreateCmDbField('IDSEGREGACRITER',ftfloat,True,False,False,True,'');
   fDataini := CreateCmDbField('DATAINI',ftDateTime,False,False,False,True,'');
   fDatafim := CreateCmDbField('DATAFIM',ftDateTime,False,False,False,True,'');
end;

function TDbSegregadata.Insert: Boolean;
begin

   fIdsegregadata.AsFloat := GetSequence('SEGREGADATA');
   Result := Inherited Insert;

end;


procedure TDbSegregadata.SetDatafim(const Value: TCmDbField);
begin
  FDatafim := Value;
end;

procedure TDbSegregadata.SetDataini(const Value: TCmDbField);
begin
  FDataini := Value;
end;

procedure TDbSegregadata.SetIdsegregacriter(const Value: TCmDbField);
begin
  FIdsegregacriter := Value;
end;

procedure TDbSegregadata.SetIdsegregadata(const Value: TCmDbField);
begin
  FIdsegregadata := Value;
end;

end.



