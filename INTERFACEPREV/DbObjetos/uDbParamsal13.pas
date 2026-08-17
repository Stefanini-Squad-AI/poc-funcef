{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 18/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbParamsal13;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbParamsal13 = class(TCmDbObject)

  private
    FIdpessjur: TCmDbField;
    FMesreferencia: TCmDbField;
    FIdrubrica: TCmDbField;
    FIdregra: TCmDbField;
    FExercicio: TCmDbField;
    procedure SetExercicio(const Value: TCmDbField);
    procedure SetIdpessjur(const Value: TCmDbField);
    procedure SetIdregra(const Value: TCmDbField);
    procedure SetIdrubrica(const Value: TCmDbField);
    procedure SetMesreferencia(const Value: TCmDbField);

  public

     Property Mesreferencia: TCmDbField read FMesreferencia write SetMesreferencia;
     Property Idrubrica: TCmDbField read FIdrubrica write SetIdrubrica;
     Property Idregra: TCmDbField read FIdregra write SetIdregra;
     Property Idpessjur: TCmDbField read FIdpessjur write SetIdpessjur;
     Property Exercicio: TCmDbField read FExercicio write SetExercicio;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbParamsal13 }

constructor TDbParamsal13.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PARAMSAL13';

   fMesreferencia := CreateCmDbField('MESREFERENCIA',ftString,True,True,False,True,'');
   fIdrubrica := CreateCmDbField('IDRUBRICA',ftfloat,False,False,False,True,'');
   fIdregra := CreateCmDbField('IDREGRA',ftfloat,False,False,False,True,'');
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,True,True,False,True,'');
   fExercicio := CreateCmDbField('EXERCICIO',ftfloat,True,True,False,True,'');
end;

function TDbParamsal13.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbParamsal13.SetExercicio(const Value: TCmDbField);
begin
  FExercicio := Value;
end;

procedure TDbParamsal13.SetIdpessjur(const Value: TCmDbField);
begin
  FIdpessjur := Value;
end;

procedure TDbParamsal13.SetIdregra(const Value: TCmDbField);
begin
  FIdregra := Value;
end;

procedure TDbParamsal13.SetIdrubrica(const Value: TCmDbField);
begin
  FIdrubrica := Value;
end;

procedure TDbParamsal13.SetMesreferencia(const Value: TCmDbField);
begin
  FMesreferencia := Value;
end;

end.



