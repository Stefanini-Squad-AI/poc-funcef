{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 04/06/2004                             }
{                                                       }
{*******************************************************}

unit uDBMotivoBaixa;

interface

Uses uCmDbObject, uSistema, DB, uCmCustomCdbObject;

Type
  TDBMotivoBaixa = class(TCmDbObject)

  private
    FDescmotivobaixa: TCmDbField;
    FIdmotivobaixa: TCmDbField;
    FCodsisproxofa: TCmDbField;
    procedure SetDescmotivobaixa(const Value: TCmDbField);
    procedure SetIdmotivobaixa(const Value: TCmDbField);
    procedure SetCodsisproxofa(const Value: TCmDbField);

  public
     Property  Idmotivobaixa: TCmDbField read FIdmotivobaixa write SetIdmotivobaixa;
     Property  Descmotivobaixa: TCmDbField read FDescmotivobaixa write SetDescmotivobaixa;
     Property  Codsisproxofa: TCmDbField read FCodsisproxofa write SetCodsisproxofa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;

  End;

implementation

{ TDBMotivoBaixa }

constructor TDBMotivoBaixa.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'MOTIVOBAIXA';

   fIdmotivobaixa := CreateCmDbField('IDMOTIVOBAIXA',ftfloat,True,True,False,True,'');
   fDescmotivobaixa := CreateCmDbField('DESCMOTIVOBAIXA',ftString,True,False,False,True,'');
   fCodsisproxofa := CreateCmDbField('CODSISPROXOFA',ftString,False,False,False,True,'');
end;

function TDBMotivoBaixa.Insert: Boolean;
begin
   fIdmotivobaixa.AsFloat := GetSequence('MOTIVOBAIXA');
   Result := Inherited Insert;
end;

function TDBMotivoBaixa.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBMotivoBaixa.SetCodsisproxofa(const Value: TCmDbField);
begin
  FCodsisproxofa := Value;
end;

procedure TDBMotivoBaixa.SetDescmotivobaixa(const Value: TCmDbField);
begin
  FDescmotivobaixa := Value;
end;

procedure TDBMotivoBaixa.SetIdmotivobaixa(const Value: TCmDbField);
begin
  FIdmotivobaixa := Value;
end;

end.

