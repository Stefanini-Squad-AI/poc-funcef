{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbElegpatro;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbElegpatro = class(TCmDbObject)

  private
    FValorbase3: TCmDbField;
    FValorbase1: TCmDbField;
    FSaltotal: TCmDbField;
    FValorbase2: TCmDbField;
    FIdpessoa: TCmDbField;
    FMatricula: TCmDbField;
    FSalreferencia: TCmDbField;
    FIdpessjur: TCmDbField;
    procedure SetIdpessjur(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetMatricula(const Value: TCmDbField);
    procedure SetSalreferencia(const Value: TCmDbField);
    procedure SetSaltotal(const Value: TCmDbField);
    procedure SetValorbase1(const Value: TCmDbField);
    procedure SetValorbase2(const Value: TCmDbField);
    procedure SetValorbase3(const Value: TCmDbField);

  public

     Property Valorbase3: TCmDbField read FValorbase3 write SetValorbase3;
     Property Valorbase2: TCmDbField read FValorbase2 write SetValorbase2;
     Property Valorbase1: TCmDbField read FValorbase1 write SetValorbase1;
     Property Saltotal: TCmDbField read FSaltotal write SetSaltotal;
     Property Salreferencia: TCmDbField read FSalreferencia write SetSalreferencia;
     Property Matricula: TCmDbField read FMatricula write SetMatricula;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idpessjur: TCmDbField read FIdpessjur write SetIdpessjur;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbElegpatro }

constructor TDbElegpatro.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ELEGPATRO';

   fValorbase3 := CreateCmDbField('VALORBASE3',ftfloat,False,False,False,True,'');
   fValorbase2 := CreateCmDbField('VALORBASE2',ftfloat,False,False,False,True,'');
   fValorbase1 := CreateCmDbField('VALORBASE1',ftfloat,False,False,False,True,'');
   fSaltotal := CreateCmDbField('SALTOTAL',ftfloat,False,False,False,True,'');
   fSalreferencia := CreateCmDbField('SALREFERENCIA',ftfloat,False,False,False,True,'');
   fMatricula := CreateCmDbField('MATRICULA',ftString,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdpessjur := CreateCmDbField('IDPESSJUR',ftfloat,True,True,False,True,'');
end;

function TDbElegpatro.Insert: Boolean;
begin


   Result := Inherited Insert;

end;


procedure TDbElegpatro.SetIdpessjur(const Value: TCmDbField);
begin
  FIdpessjur := Value;
end;

procedure TDbElegpatro.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbElegpatro.SetMatricula(const Value: TCmDbField);
begin
  FMatricula := Value;
end;

procedure TDbElegpatro.SetSalreferencia(const Value: TCmDbField);
begin
  FSalreferencia := Value;
end;

procedure TDbElegpatro.SetSaltotal(const Value: TCmDbField);
begin
  FSaltotal := Value;
end;

procedure TDbElegpatro.SetValorbase1(const Value: TCmDbField);
begin
  FValorbase1 := Value;
end;

procedure TDbElegpatro.SetValorbase2(const Value: TCmDbField);
begin
  FValorbase2 := Value;
end;

procedure TDbElegpatro.SetValorbase3(const Value: TCmDbField);
begin
  FValorbase3 := Value;
end;

end.



