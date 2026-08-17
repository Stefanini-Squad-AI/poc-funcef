{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 06/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbClasfisc;

interface

Uses uCmCustomCDbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbClasfisc = class(TCmDbObject)

  private
    FFlgicms: TCmDbField;
    FDescclassifiscal: TCmDbField;
    FCodfiscal: TCmDbField;
    procedure SetCodfiscal(const Value: TCmDbField);
    procedure SetDescclassifiscal(const Value: TCmDbField);
    procedure SetFlgicms(const Value: TCmDbField);
  protected
    function GetSqlSelect: String; Override;
  public

     Property Flgicms: TCmDbField read FFlgicms write SetFlgicms;
     Property Descclassifiscal: TCmDbField read FDescclassifiscal write SetDescclassifiscal;
     Property Codfiscal: TCmDbField read FCodfiscal write SetCodfiscal;

     Constructor Create (Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
     Function Delete :Boolean; Override;
     Function Update :Boolean; Override;

  End;

implementation

{ TDbClasfisc }

constructor TDbClasfisc.Create (Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CLASFISC';

   fFlgicms := CreateCmDbField('FLGICMS',ftString,False,False,False,True,'');
   fDescclassifiscal := CreateCmDbField('DESCCLASSIFISCAL',ftString,False,False,False,True,'');
   fCodfiscal := CreateCmDbField('CODFISCAL',ftString,True,True,False,True,'');
end;

function TDbClasfisc.Delete: Boolean;
begin
  FCodfiscal.AsString := Copy(FCodfiscal.AsString +'        ',1,4);
  Result := Inherited Delete;
end;

function TDbClasfisc.GetSqlSelect: String;
begin
  If FCodfiscal.AsString = '' Then
    Result := 'SELECT CODFISCAL, DESCCLASSIFISCAL, FLGICMS FROM CLASFISC '+
              ' ORDER BY CODFISCAL '
  Else
    Result := inherited GetSqlSelect;
end;

function TDbClasfisc.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbClasfisc.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbClasfisc.SetCodfiscal(const Value: TCmDbField);
begin
  FCodfiscal := Value;
end;

procedure TDbClasfisc.SetDescclassifiscal(const Value: TCmDbField);
begin
  FDescclassifiscal := Value;
end;

procedure TDbClasfisc.SetFlgicms(const Value: TCmDbField);
begin
  FFlgicms := Value;
end;

function TDbClasfisc.Update: Boolean;
begin
  FCodfiscal.AsString := Copy(FCodfiscal.AsString +'        ',1,4);
  Result := Inherited Update;
end;

end.



