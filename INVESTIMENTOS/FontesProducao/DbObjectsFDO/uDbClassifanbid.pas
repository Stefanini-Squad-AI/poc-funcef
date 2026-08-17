{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 31/01/2006                             }
{                                                       }
{*******************************************************}

unit uDbClassifanbid;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbClassifanbid = class(TCmDbObject)

  private
    FDesclassifanbid: TCmDbField;
    FCodclassifanbid: TCmDbField;
    FIdclassifanbid: TCmDbField;
    FDatavigencia: TCmDbField;
    FClassifanalit: TCmDbField;
    procedure SetClassifanalit(const Value: TCmDbField);
    procedure SetCodclassifanbid(const Value: TCmDbField);
    procedure SetDatavigencia(const Value: TCmDbField);
    procedure SetDesclassifanbid(const Value: TCmDbField);
    procedure SetIdclassifanbid(const Value: TCmDbField);

  public

     Property Idclassifanbid: TCmDbField read FIdclassifanbid write SetIdclassifanbid;
     Property Desclassifanbid: TCmDbField read FDesclassifanbid write SetDesclassifanbid;
     Property Datavigencia: TCmDbField read FDatavigencia write SetDatavigencia;
     Property Codclassifanbid: TCmDbField read FCodclassifanbid write SetCodclassifanbid;
     Property Classifanalit: TCmDbField read FClassifanalit write SetClassifanalit;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbClassifanbid }

constructor TDbClassifanbid.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CLASSIFANBID';

   fIdclassifanbid := CreateCmDbField('IDCLASSIFANBID',ftfloat,True,True,False,True,'');
   fDesclassifanbid := CreateCmDbField('DESCLASSIFANBID',ftString,False,False,False,True,'');
   fDatavigencia := CreateCmDbField('DATAVIGENCIA',ftDateTime,False,False,False,True,'');
   fCodclassifanbid := CreateCmDbField('CODCLASSIFANBID',ftString,False,False,False,True,'');
   fClassifanalit := CreateCmDbField('CLASSIFANALIT',ftString,False,False,False,True,'');
end;

function TDbClassifanbid.Insert: Boolean;
begin

   fIdclassifanbid.AsFloat := GetSequence('CLASSIFANBID');
   Result := Inherited Insert;

end;

procedure TDbClassifanbid.SetClassifanalit(const Value: TCmDbField);
begin
  FClassifanalit := Value;
end;

procedure TDbClassifanbid.SetCodclassifanbid(const Value: TCmDbField);
begin
  FCodclassifanbid := Value;
end;

procedure TDbClassifanbid.SetDatavigencia(const Value: TCmDbField);
begin
  FDatavigencia := Value;
end;

procedure TDbClassifanbid.SetDesclassifanbid(const Value: TCmDbField);
begin
  FDesclassifanbid := Value;
end;

procedure TDbClassifanbid.SetIdclassifanbid(const Value: TCmDbField);
begin
  FIdclassifanbid := Value;
end;

end.



