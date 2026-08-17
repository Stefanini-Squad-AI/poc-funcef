{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia
 Atualizado Em: 08/01/2002                              }
{                                                       }
{*******************************************************}

unit uDbUnCusteio;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject ;

Type
  TDbUnCusteio = class(TCmDbObject)

  private
    FUcContabil: TCmDbField;
    FDesccusteio: TCmDbField;
    FCodCusteio: TCmDbField;
    FIdPessoa: TCmDbField;
    procedure SetCodCusteio(const Value: TCmDbField);
    procedure SetDesccusteio(const Value: TCmDbField);
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure SetUcContabil(const Value: TCmDbField);
  public

     Property UcContabil  : TCmDbField read FUcContabil write SetUcContabil;
     Property IdPessoa    : TCmDbField read FIdPessoa write SetIdPessoa;
     Property Desccusteio : TCmDbField read FDesccusteio write SetDesccusteio;
     Property CodCusteio  : TCmDbField read FCodCusteio write SetCodCusteio;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbUnCusteio }

constructor TDbUnCusteio.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'UNCUSTEI';

   fUccontabil   := CreateCmDbField('UCCONTABIL'  ,ftString,True,False,False,True,'Contábil');
   fIdpessoa     := CreateCmDbField('IDPESSOA'    ,ftfloat,True,False,False,True,'');
   fDesccusteio  := CreateCmDbField('DESCCUSTEIO' ,ftString,True,False,False,True,'Descrição');
   fCodCusteio   := CreateCmDbField('CODCUSTEIO'  ,ftfloat,False,True,False,True,'Código');
   //
   fCodCusteio.AsFloat := 0;
end;

function TDbUnCusteio.Insert: Boolean;
begin

   fCodcusteio.AsFloat := GetSequence('UNCUSTEI');
   Result := Inherited Insert;

end;

function TDbUnCusteio.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbUnCusteio.SetCodCusteio(const Value: TCmDbField);
begin
  FCodCusteio := Value;
end;

procedure TDbUnCusteio.SetDesccusteio(const Value: TCmDbField);
begin
  FDesccusteio := Value;
end;

procedure TDbUnCusteio.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

procedure TDbUnCusteio.SetUcContabil(const Value: TCmDbField);
begin
  FUcContabil := Value;
end;

end.



