{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbHstrubricaxpess;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbHstrubricaxpess = class(TCmDbObject)

  private
    FMesreferencia: TCmDbField;
    FValoracumulado: TCmDbField;
    FIdpessoa: TCmDbField;
    FValororiginal: TCmDbField;
    FIdplanoprev: TCmDbField;
    FIdrubrica: TCmDbField;
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdplanoprev(const Value: TCmDbField);
    procedure SetIdrubrica(const Value: TCmDbField);
    procedure SetMesreferencia(const Value: TCmDbField);
    procedure SetValoracumulado(const Value: TCmDbField);
    procedure SetValororiginal(const Value: TCmDbField);

  public

     Property Valororiginal: TCmDbField read FValororiginal write SetValororiginal;
     Property Valoracumulado: TCmDbField read FValoracumulado write SetValoracumulado;
     Property Mesreferencia: TCmDbField read FMesreferencia write SetMesreferencia;
     Property Idrubrica: TCmDbField read FIdrubrica write SetIdrubrica;
     Property Idplanoprev: TCmDbField read FIdplanoprev write SetIdplanoprev;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbHstrubricaxpess }

constructor TDbHstrubricaxpess.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HSTRUBRICAXPESS';

   fValororiginal := CreateCmDbField('VALORORIGINAL',ftfloat,False,False,False,True,'');
   fValoracumulado := CreateCmDbField('VALORACUMULADO',ftfloat,False,False,False,True,'');
   fMesreferencia := CreateCmDbField('MESREFERENCIA',ftString,True,True,False,True,'');
   fIdrubrica := CreateCmDbField('IDRUBRICA',ftfloat,True,True,False,True,'');
   fIdplanoprev := CreateCmDbField('IDPLANOPREV',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
end;

function TDbHstrubricaxpess.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbHstrubricaxpess.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbHstrubricaxpess.SetIdplanoprev(const Value: TCmDbField);
begin
  FIdplanoprev := Value;
end;

procedure TDbHstrubricaxpess.SetIdrubrica(const Value: TCmDbField);
begin
  FIdrubrica := Value;
end;

procedure TDbHstrubricaxpess.SetMesreferencia(const Value: TCmDbField);
begin
  FMesreferencia := Value;
end;

procedure TDbHstrubricaxpess.SetValoracumulado(const Value: TCmDbField);
begin
  FValoracumulado := Value;
end;

procedure TDbHstrubricaxpess.SetValororiginal(const Value: TCmDbField);
begin
  FValororiginal := Value;
end;

end.



