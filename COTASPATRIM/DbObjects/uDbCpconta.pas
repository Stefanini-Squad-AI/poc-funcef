{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 16/08/2006                             }
{                                                       }
{*******************************************************}

unit uDbCpconta;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCpconta = class(TCmDbObject)

  private
    FIdcpativo: TCmDbField;
    FDescricao: TCmDbField;
    FNome: TCmDbField;
    FIdcpconta: TCmDbField;
    FCotasabert: TCmDbField;
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdcpativo(const Value: TCmDbField);
    procedure SetIdcpconta(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);
    procedure SetCotasabert(const Value: TCmDbField);

  public

     Property Nome: TCmDbField read FNome write SetNome;
     Property Idcpconta: TCmDbField read FIdcpconta write SetIdcpconta;
     Property Idcpativo: TCmDbField read FIdcpativo write SetIdcpativo;
     Property Descricao: TCmDbField read FDescricao write SetDescricao;
     Property Cotasabert: TCmDbField read FCotasabert write SetCotasabert;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCpconta }

constructor TDbCpconta.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CPCONTA';

   fNome := CreateCmDbField('NOME',ftString,True,False,False,True,'Nome');
   fIdcpconta := CreateCmDbField('IDCPCONTA',ftfloat,True,True,False,True,'Conta');
   fIdcpativo := CreateCmDbField('IDCPATIVO',ftfloat,True,False,False,True,'Ativo');
   fDescricao := CreateCmDbField('DESCRICAO',ftString,False,False,False,True,'');
   fCotasabert := CreateCmDbField('COTASABERT',ftfloat,False,False,False,False,'');
end;

function TDbCpconta.Insert: Boolean;
begin
   fIdcpconta.AsFloat := GetSequence('CPCONTA');
   Result := Inherited Insert;

end;


procedure TDbCpconta.SetCotasabert(const Value: TCmDbField);
begin
  FCotasabert := Value;
end;

procedure TDbCpconta.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbCpconta.SetIdcpativo(const Value: TCmDbField);
begin
  FIdcpativo := Value;
end;

procedure TDbCpconta.SetIdcpconta(const Value: TCmDbField);
begin
  FIdcpconta := Value;
end;

procedure TDbCpconta.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

end.



