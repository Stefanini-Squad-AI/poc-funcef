{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 01/04/2003                             }
{                                                       }
{*******************************************************}

unit uDbClassedebem;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbClassedebem = class(TCmDbObject)

  private
    FAnasint: TCmDbField;
    FDescricao: TCmDbField;
    FIdgrupo: TCmDbField;
    FCodhierarq: TCmDbField;
    FIdclassebem: TCmDbField;
    FMascaraidopcional: TCmDbField;
    procedure SetAnasint(const Value: TCmDbField);
    procedure SetCodhierarq(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdclassebem(const Value: TCmDbField);
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetMascaraidopcional(const Value: TCmDbField);

  public

     Property Mascaraidopcional: TCmDbField read FMascaraidopcional write SetMascaraidopcional;
     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;
     Property Idclassebem: TCmDbField read FIdclassebem write SetIdclassebem;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Codhierarq: TCmDbField read FCodhierarq write SetCodhierarq;
     Property Anasint: TCmDbField read FAnasint write SetAnasint;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbClassedebem }

constructor TDbClassedebem.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CLASSEDEBEM';

   fMascaraidopcional := CreateCmDbField('MASCARAIDOPCIONAL',ftString,False,False,False,True,'');
   fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,False,False,False,True,'');
   fIdclassebem := CreateCmDbField('IDCLASSEBEM',ftfloat,True,True,False,True,'');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
   fCodhierarq := CreateCmDbField('CODHIERARQ',ftString,True,False,False,True,'');
   fAnasint := CreateCmDbField('ANASINT',ftString,True,False,False,True,'');
end;

function TDbClassedebem.Insert: Boolean;
begin

   fIdclassebem.AsFloat := GetSequence('CLASSEDEBEM');
   Result := Inherited Insert;

end;


procedure TDbClassedebem.SetAnasint(const Value: TCmDbField);
begin
  FAnasint := Value;
end;

procedure TDbClassedebem.SetCodhierarq(const Value: TCmDbField);
begin
  FCodhierarq := Value;
end;

procedure TDbClassedebem.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbClassedebem.SetIdclassebem(const Value: TCmDbField);
begin
  FIdclassebem := Value;
end;

procedure TDbClassedebem.SetIdgrupo(const Value: TCmDbField);
begin
  FIdgrupo := Value;
end;

procedure TDbClassedebem.SetMascaraidopcional(const Value: TCmDbField);
begin
  FMascaraidopcional := Value;
end;

end.



