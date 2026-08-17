{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 30/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbPrograma;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbPrograma = class(TCmDbObject)

  private
    FCodprograma: TCmDbField;
    FDescprograma: TCmDbField;
    FIdprograma: TCmDbField;
    FFlgTipoPrograma: TCmDbField;
    procedure SetCodprograma(const Value: TCmDbField);
    procedure SetDescprograma(const Value: TCmDbField);
    procedure SetIdprograma(const Value: TCmDbField);
    procedure SetFlgTipoPrograma(const Value: TCmDbField);

  public
    Property Idprograma: TCmDbField read FIdprograma write SetIdprograma;
    Property Descprograma: TCmDbField read FDescprograma write SetDescprograma;
    Property Codprograma: TCmDbField read FCodprograma write SetCodprograma;
    property FlgTipoPrograma: TCmDbField read FCodprograma write SetFlgTipoPrograma;


    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbPrograma }

constructor TDbPrograma.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'PROGRAMA';

  fIdprograma      := CreateCmDbField('IDPROGRAMA',ftfloat,True,True,False,True,'Id Programa');
  fDescprograma    := CreateCmDbField('DESCPROGRAMA',ftString,False,False,False,True,'Descrição');
  fCodprograma     := CreateCmDbField('CODPROGRAMA',ftString,False,False,False,True,'Código');
  FFlgTipoPrograma := CreateCmDbField('FLGTIPOPROGRAMA',ftString,False,False,False,True,'Tipo');
end;

function TDbPrograma.Insert: Boolean;
begin
  fIdprograma.AsFloat := GetSequence('PROGRAMA');
  Result := Inherited Insert;
end;

function TDbPrograma.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbPrograma.SetCodprograma(const Value: TCmDbField);
begin
  FCodprograma := Value;
end;

procedure TDbPrograma.SetDescprograma(const Value: TCmDbField);
begin
  FDescprograma := Value;
end;

procedure TDbPrograma.SetFlgTipoPrograma(const Value: TCmDbField);
begin
  FFlgTipoPrograma := Value;
end;

procedure TDbPrograma.SetIdprograma(const Value: TCmDbField);
begin
  FIdprograma := Value;
end;

end.

