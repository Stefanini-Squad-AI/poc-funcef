{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 22/04/2008                             }
{                                                       }
{*******************************************************}

unit uDbLinhascnab;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbLinhascnab = class(TCmDbObject)

  private
    FQtdchar: TCmDbField;
    FTipolinha: TCmDbField;
    FIdmodeloscnab: TCmDbField;
    FIdlinhascnab: TCmDbField;
    FDesclinhacnab: TCmDbField;
    procedure SetDesclinhacnab(const Value: TCmDbField);
    procedure SetIdlinhascnab(const Value: TCmDbField);
    procedure SetIdmodeloscnab(const Value: TCmDbField);
    procedure SetQtdchar(const Value: TCmDbField);
    procedure SetTipolinha(const Value: TCmDbField);

  public

     Property Tipolinha: TCmDbField read FTipolinha write SetTipolinha;
     Property Qtdchar: TCmDbField read FQtdchar write SetQtdchar;
     Property Idmodeloscnab: TCmDbField read FIdmodeloscnab write SetIdmodeloscnab;
     Property Idlinhascnab: TCmDbField read FIdlinhascnab write SetIdlinhascnab;
     Property Desclinhacnab: TCmDbField read FDesclinhacnab write SetDesclinhacnab;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbLinhascnab }

constructor TDbLinhascnab.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LINHASCNAB';

   fTipolinha := CreateCmDbField('TIPOLINHA',ftString,False,False,False,True,'');
   fQtdchar := CreateCmDbField('QTDCHAR',ftfloat,False,False,False,True,'');
   fIdmodeloscnab := CreateCmDbField('IDMODELOSCNAB',ftfloat,False,False,False,True,'');
   fIdlinhascnab := CreateCmDbField('IDLINHASCNAB',ftfloat,True,True,False,True,'');
   fDesclinhacnab := CreateCmDbField('DESCLINHACNAB',ftString,False,False,False,True,'');
end;

function TDbLinhascnab.Insert: Boolean;
begin

   fIdlinhascnab.AsFloat := GetSequence('LINHASCNAB');
   Result := Inherited Insert;

end;


procedure TDbLinhascnab.SetDesclinhacnab(const Value: TCmDbField);
begin
  FDesclinhacnab := Value;
end;

procedure TDbLinhascnab.SetIdlinhascnab(const Value: TCmDbField);
begin
  FIdlinhascnab := Value;
end;

procedure TDbLinhascnab.SetIdmodeloscnab(const Value: TCmDbField);
begin
  FIdmodeloscnab := Value;
end;

procedure TDbLinhascnab.SetQtdchar(const Value: TCmDbField);
begin
  FQtdchar := Value;
end;

procedure TDbLinhascnab.SetTipolinha(const Value: TCmDbField);
begin
  FTipolinha := Value;
end;

end.



