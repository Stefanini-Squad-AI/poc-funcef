{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 14/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbTermodiario;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTermodiario = class(TCmDbObject)

  private
    FTertexto         : TCmDbField;
    FAbertfecham      : TCmDbField;
    FIdusuarioinclusao: TCmDbField;
    FIdpessoa         : TCmDbField;
    procedure SetAbertfecham      (const Value: TCmDbField);
    procedure SetIdpessoa         (const Value: TCmDbField);
    procedure SetIdusuarioinclusao(const Value: TCmDbField);
    procedure SetTertexto         (const Value: TCmDbField);

  public

     Property Tertexto         : TCmDbField Read FTertexto          Write SetTertexto;
     Property Idusuarioinclusao: TCmDbField Read FIdusuarioinclusao Write SetIdusuarioinclusao;
     Property Idpessoa         : TCmDbField Read FIdpessoa          Write SetIdpessoa;
     Property Abertfecham      : TCmDbField Read FAbertfecham       Write SetAbertfecham;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTermodiario }

constructor TDbTermodiario.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TERMODIARIO';

   FTertexto          := CreateCmDbField('TERTEXTO',ftBlob,True);
   FIdusuarioinclusao := CreateCmDbField('IDUSUARIOINCLUSAO',ftfloat,False,False,False,True);
   FIdpessoa          := CreateCmDbField('IDPESSOA',ftfloat,False,True,False,True);
   FAbertfecham       := CreateCmDbField('ABERTFECHAM',ftString,True,True,False,True);
end;

function TDbTermodiario.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbTermodiario.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbTermodiario.SetAbertfecham(const Value: TCmDbField);
begin
  FAbertfecham := Value;
end;

procedure TDbTermodiario.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbTermodiario.SetIdusuarioinclusao(const Value: TCmDbField);
begin
  FIdusuarioinclusao := Value;
end;

procedure TDbTermodiario.SetTertexto(const Value: TCmDbField);
begin
  FTertexto := Value;
end;

end.



