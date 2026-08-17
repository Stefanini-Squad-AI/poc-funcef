{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 31/10/2006                             }
{                                                       }
{*******************************************************}

unit uDbRADParam;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadParam = class(TCmDbObject)

  private
    FIdemailconexao: TCmDbField;
    FIdempresa: TCmDbField;
    procedure SetIdemailconexao(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);

  public

     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Idemailconexao: TCmDbField read FIdemailconexao write SetIdemailconexao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbRadParam }

constructor TDbRadParam.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADPARAM';

   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,True,False,True,'Id. Empresa');
   fIdemailconexao := CreateCmDbField('IDEMAILCONEXAO',ftfloat,False,False,False,True,'Id. Conexão e-mail');
end;

function TDbRadParam.Insert: Boolean;
begin
   fIdempresa.AsFloat := GetSequence('RADPARAM');
   Result := Inherited Insert;
end;


procedure TDbRadParam.SetIdemailconexao(const Value: TCmDbField);
begin
  FIdemailconexao := Value;
end;

procedure TDbRadParam.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

end.



