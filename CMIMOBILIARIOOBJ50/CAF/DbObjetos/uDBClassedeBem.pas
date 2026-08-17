{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 12/03/2002                             }
{                                                       }
{*******************************************************}

unit uDBClassedeBem;

interface

Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBClassedeBem = class(TCmDbObject)

  private
    FAnasint: TCmDbField;
    FIdclassebem: TCmDbField;
    FDescricao: TCmDbField;
    FMascaraidopcional: TCmDbField;
    FCodhierarq: TCmDbField;
    procedure SetAnasint(const Value: TCmDbField);
    procedure SetCodhierarq(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdclassebem(const Value: TCmDbField);
    procedure SetMascaraidopcional(const Value: TCmDbField);

  public
     Property Idclassebem: TCmDbField read FIdclassebem write SetIdclassebem;
     Property Codhierarq: TCmDbField read FCodhierarq write SetCodhierarq;
     Property Anasint: TCmDbField read FAnasint write SetAnasint;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Mascaraidopcional: TCmDbField read FMascaraidopcional write SetMascaraidopcional;

     Constructor Create; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBClassedeBem }

constructor TDBClassedeBem.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'CLASSEDEBEM';

   fIdclassebem := CreateCmDbField('IDCLASSEBEM',ftfloat,True,True,False,False,'');
   fCodhierarq := CreateCmDbField('CODHIERARQ',ftString,True,False,False,False,'');
   fAnasint := CreateCmDbField('ANASINT',ftString,True,False,False,False,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,False,'');
   fMascaraidopcional := CreateCmDbField('MASCARAIDOPCIONAL',ftString,False,False,False,False,'');
end;

function TDBClassedeBem.Insert: Boolean;
begin
   fIdclassebem.AsFloat := GetSequence('CLASSEDEBEM');
   Result := Inherited Insert;
end;

function TDBClassedeBem.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBClassedeBem.SetAnasint(const Value: TCmDbField);
begin
   FAnasint := Value;
end;

procedure TDBClassedeBem.SetCodhierarq(const Value: TCmDbField);
begin
   FCodhierarq := Value;
end;

procedure TDBClassedeBem.SetDescricao(const Value: TCmDbField);
begin
   FDescricao := Value;
end;

procedure TDBClassedeBem.SetIdclassebem(const Value: TCmDbField);
begin
   FIdclassebem := Value;
end;

procedure TDBClassedeBem.SetMascaraidopcional(const Value: TCmDbField);
begin
   FMascaraidopcional := Value;
end;

end.



