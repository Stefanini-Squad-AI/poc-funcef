{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 05/06/2003                             }
{                                                       }
{*******************************************************}

unit uDbContratoXVlrAno;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbContratoXVlrAno = class(TCmDbObject)

  private
    FAnoinicio: TCmDbField;
    FFlgcorrige: TCmDbField;
    FIdcontratoxvlrano: TCmDbField;
    FValor: TCmDbField;
    FIdimovel: TCmDbField;
    FIdcontratoimovel: TCmDbField;
    procedure SetAnoinicio(const Value: TCmDbField);
    procedure SetFlgcorrige(const Value: TCmDbField);
    procedure SetIdcontratoimovel(const Value: TCmDbField);
    procedure SetIdcontratoxvlrano(const Value: TCmDbField);
    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);

  public

     Property Valor: TCmDbField read FValor write SetValor;
     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;
     Property Idcontratoxvlrano: TCmDbField read FIdcontratoxvlrano write SetIdcontratoxvlrano;
     Property Idcontratoimovel: TCmDbField read FIdcontratoimovel write SetIdcontratoimovel;
     Property Flgcorrige: TCmDbField read FFlgcorrige write SetFlgcorrige;
     Property Anoinicio: TCmDbField read FAnoinicio write SetAnoinicio;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbContratoXVlrAno }

constructor TDbContratoXVlrAno.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'CONTRATOXVLRANO';

   fValor := CreateCmDbField('VALOR',ftfloat,False,False,False,True,'');
   fIdimovel := CreateCmDbField('IDIMOVEL',ftfloat,False,False,False,True,'');
   fIdcontratoxvlrano := CreateCmDbField('IDCONTRATOXVLRANO',ftfloat,True,True,False,True,'');
   fIdcontratoimovel := CreateCmDbField('IDCONTRATOIMOVEL',ftfloat,False,False,False,True,'');
   fFlgcorrige := CreateCmDbField('FLGCORRIGE',ftString,False,False,False,True,'');
   fAnoinicio := CreateCmDbField('ANOINICIO',ftfloat,False,False,False,True,'');
end;

function TDbContratoXVlrAno.Insert: Boolean;
begin
   fIdcontratoxvlrano.AsFloat := GetSequence('CONTRATOXVLRANO');
   Result := Inherited Insert;
end;


procedure TDbContratoXVlrAno.SetAnoinicio(const Value: TCmDbField);
begin
  FAnoinicio := Value;
end;

procedure TDbContratoXVlrAno.SetFlgcorrige(const Value: TCmDbField);
begin
  FFlgcorrige := Value;
end;

procedure TDbContratoXVlrAno.SetIdcontratoimovel(const Value: TCmDbField);
begin
  FIdcontratoimovel := Value;
end;

procedure TDbContratoXVlrAno.SetIdcontratoxvlrano(const Value: TCmDbField);
begin
  FIdcontratoxvlrano := Value;
end;

procedure TDbContratoXVlrAno.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDbContratoXVlrAno.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;

end.



