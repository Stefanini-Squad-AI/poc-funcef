{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 10/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbDemcolxlin;

interface

Uses uCmCustomCdbObject, uCmDbObject,  DB, uDataBase;

Type
  TDbDemcolxlin = class(TCmDbObject)

  private
    FIddemonstrativo: TCmDbField;
    FIdlinha: TCmDbField;
    FNumcoluna: TCmDbField;
    FIdelemdemonstrat: TCmDbField;
    procedure SetIddemonstrativo(const Value: TCmDbField);
    procedure SetIdelemdemonstrat(const Value: TCmDbField);
    procedure SetIdlinha(const Value: TCmDbField);
    procedure SetNumcoluna(const Value: TCmDbField);

  public

     Property Numcoluna: TCmDbField read FNumcoluna write SetNumcoluna;
     Property Idlinha: TCmDbField read FIdlinha write SetIdlinha;
     Property Idelemdemonstrat: TCmDbField read FIdelemdemonstrat write SetIdelemdemonstrat;
     Property Iddemonstrativo: TCmDbField read FIddemonstrativo write SetIddemonstrativo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbDemcolxlin }

constructor TDbDemcolxlin.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DEMCOLXLIN';

   fNumcoluna        := CreateCmDbField('NUMCOLUNA',ftfloat,True,True,False,True,'');
   fIdlinha          := CreateCmDbField('IDLINHA',ftfloat,True,True,False,True,'');
   fIdelemdemonstrat := CreateCmDbField('IDELEMDEMONSTRAT',ftfloat,True,False,False,True,'');
   fIddemonstrativo  := CreateCmDbField('IDDEMONSTRATIVO',ftfloat,True,True,False,True,'');
end;

function TDbDemcolxlin.Insert: Boolean;
begin
   Result := Inherited Insert;

end;

function TDbDemcolxlin.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbDemcolxlin.SetIddemonstrativo(const Value: TCmDbField);
begin
  FIddemonstrativo := Value;
end;

procedure TDbDemcolxlin.SetIdelemdemonstrat(const Value: TCmDbField);
begin
  FIdelemdemonstrat := Value;
end;

procedure TDbDemcolxlin.SetIdlinha(const Value: TCmDbField);
begin
  FIdlinha := Value;
end;

procedure TDbDemcolxlin.SetNumcoluna(const Value: TCmDbField);
begin
  FNumcoluna := Value;
end;

end.



