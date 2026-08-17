{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 25/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbDesenhodemo;

interface

Uses uCmCustomCdbObject, uCmDbObject,  DB, uDataBase;

Type
  TDbDesenhodemo = class(TCmDbObject)

  private
    FIdreports: TCmDbField;
    FOrigemcm: TCmDbField;
    FFlgtipolayout: TCmDbField;
    FIddemonstrativo: TCmDbField;
    FIddesenhodemo: TCmDbField;
    FNomelayout: TCmDbField;
    procedure SetFlgtipolayout(const Value: TCmDbField);
    procedure SetIddemonstrativo(const Value: TCmDbField);
    procedure SetIddesenhodemo(const Value: TCmDbField);
    procedure SetIdreports(const Value: TCmDbField);
    procedure SetNomelayout(const Value: TCmDbField);
    procedure SetOrigemcm(const Value: TCmDbField);

  public

     Property Origemcm: TCmDbField read FOrigemcm write SetOrigemcm;
     Property Nomelayout: TCmDbField read FNomelayout write SetNomelayout;
     Property Idreports: TCmDbField read FIdreports write SetIdreports;
     Property Iddesenhodemo: TCmDbField read FIddesenhodemo write SetIddesenhodemo;
     Property Iddemonstrativo: TCmDbField read FIddemonstrativo write SetIddemonstrativo;
     Property Flgtipolayout: TCmDbField read FFlgtipolayout write SetFlgtipolayout;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbDesenhodemo }

constructor TDbDesenhodemo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'DESENHODEMO';

   fOrigemcm        := CreateCmDbField('ORIGEMCM',ftfloat,False,False,False,False);
   fNomelayout      := CreateCmDbField('NOMELAYOUT',ftString,False,False,False,True,'');
   fIdreports       := CreateCmDbField('IDREPORTS',ftfloat,False,False,False,True,'');
   fIddesenhodemo   := CreateCmDbField('IDDESENHODEMO',ftfloat,True,True,False,True,'');
   fIddemonstrativo := CreateCmDbField('IDDEMONSTRATIVO',ftfloat,True,False,False,True,'');
   fFlgtipolayout   := CreateCmDbField('FLGTIPOLAYOUT',ftString,False,False,False,True,'');
end;

function TDbDesenhodemo.Insert: Boolean;
begin

   fIddesenhodemo.AsFloat := GetSequence('DESENHODEMO');
   Result := Inherited Insert;

end;

function TDbDesenhodemo.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbDesenhodemo.SetFlgtipolayout(const Value: TCmDbField);
begin
  FFlgtipolayout := Value;
end;

procedure TDbDesenhodemo.SetIddemonstrativo(const Value: TCmDbField);
begin
  FIddemonstrativo := Value;
end;

procedure TDbDesenhodemo.SetIddesenhodemo(const Value: TCmDbField);
begin
  FIddesenhodemo := Value;
end;

procedure TDbDesenhodemo.SetIdreports(const Value: TCmDbField);
begin
  FIdreports := Value;
end;

procedure TDbDesenhodemo.SetNomelayout(const Value: TCmDbField);
begin
  FNomelayout := Value;
end;

procedure TDbDesenhodemo.SetOrigemcm(const Value: TCmDbField);
begin
  FOrigemcm := Value;
end;

end.



