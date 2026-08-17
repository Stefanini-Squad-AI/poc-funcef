{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcos Inacio da Lux            }
{ Atualizado Em: 06/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbClasfisc;

interface
Uses uCmCustomCDbObject, uCmDbObject, DB, uDataBase;

Type
  TDbClasfisc = class(TCmDbObject)

  private
    FSiglafiscal: TCmDbField;
    FFlgicms: TCmDbField;
    FDescclassifiscal: TCmDbField;
    FCodfiscal: TCmDbField;
    FInativo: TcmDbField;
    procedure SetCodfiscal(const Value: TCmDbField);
    procedure SetDescclassifiscal(const Value: TCmDbField);
    procedure SetFlgicms(const Value: TCmDbField);
    procedure SetSiglafiscal(const Value: TCmDbField);
    procedure SetInativo(const Value: TcmDbField);
  protected
    function GetSqlSelect: String; Override;
  public

     Property Siglafiscal: TCmDbField read FSiglafiscal write SetSiglafiscal;
     Property Flgicms: TCmDbField read FFlgicms write SetFlgicms;
     Property Descclassifiscal: TCmDbField read FDescclassifiscal write SetDescclassifiscal;
     Property Codfiscal: TCmDbField read FCodfiscal write SetCodfiscal;
     Property Inativo : TcmDbField read FInativo write SetInativo;

     Constructor Create (Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbClasfisc }

constructor TDbClasfisc.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CLASFISC';

   fFlgicms          := CreateCmDbField('FLGICMS',ftString,False,False,False,True,'');
   fDescclassifiscal := CreateCmDbField('DESCCLASSIFISCAL',ftString,False,False,False,True,'');
   fCodfiscal        := CreateCmDbField('CODFISCAL',ftString,True,True,False,True,'');
   FInativo          := CreateCmDbField('INATIVO',ftString,False,False,False,True,'');
end;

function TDbClasfisc.GetSqlSelect: String;
begin
  If FCodfiscal.AsString = '' Then
    Result := 'SELECT * FROM CLASFISC '+
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

procedure TDbClasfisc.SetInativo(const Value: TcmDbField);
begin
  FInativo := Value;
end;

procedure TDbClasfisc.SetSiglafiscal(const Value: TCmDbField);
begin
  FSiglafiscal := Value;
end;

end.



