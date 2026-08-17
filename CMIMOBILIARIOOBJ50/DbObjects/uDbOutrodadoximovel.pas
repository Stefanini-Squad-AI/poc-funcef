{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 16/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbOutrodadoximovel;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbOutrodadoximovel = class(TCmDbObject)

  private
    FIdoutrodado: TCmDbField;
    FOdivalor: TCmDbField;
    FIdimovel: TCmDbField;
    FIDOutroDadoXImovel: TCmDbField;

    // Daniel - 23518
    FIdContratoImovel: TCmDbField;

    procedure SetIdimovel(const Value: TCmDbField);
    procedure SetIdoutrodado(const Value: TCmDbField);
    procedure SetOdivalor(const Value: TCmDbField);
    procedure SetIDOutroDadoXImovel(const Value: TCmDbField);

    // Daniel - 23518
    procedure SetIdContratoImovel(const Value: TCmDbField);

  public

     Property Odivalor: TCmDbField read FOdivalor write SetOdivalor;
     Property Idoutrodado: TCmDbField read FIdoutrodado write SetIdoutrodado;
     Property Idimovel: TCmDbField read FIdimovel write SetIdimovel;

     property IDOutroDadoXImovel: TCmDbField read FIDOutroDadoXImovel write SetIDOutroDadoXImovel;

     // Daniel - 23518
     property IdContratoImovel: TCmDbField read FIdContratoImovel write SetIdContratoImovel;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbOutrodadoximovel }

constructor TDbOutrodadoximovel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'OUTRODADOXIMOVEL';

   fOdivalor := CreateCmDbField('ODIVALOR',ftString,True,False,False,True,'Valor para outro dado');
   fIdoutrodado := CreateCmDbField('IDOUTRODADO',ftfloat,True,False,False,True,'Código de outro dado');
   fIdimovel := CreateCmDbField('IDIMOVEL',ftfloat,False,False,False,True,'Código do Imóvel');
   FIDOutroDadoXImovel  := CreateCmDbField('IDOUTRODADOXIMOVEL',ftfloat,True,True,False,True,'ID da Tabela');

   // Daniel - 23518
   FIdContratoImovel  := CreateCmDbField('IDCONTRATOIMOVEL',ftfloat,False,False,False,True,'Código do Contrato');
end;

function TDbOutrodadoximovel.Insert: Boolean;
begin

   FIDOutroDadoXImovel.AsFloat := GetSequence('OUTRODADOXIMOVEL');

   Result := Inherited Insert;

end;

function TDbOutrodadoximovel.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

// Daniel - 23518
procedure TDbOutrodadoximovel.SetIdContratoImovel(const Value: TCmDbField);
begin
  FIdContratoImovel := Value;
end;
// Fim

procedure TDbOutrodadoximovel.SetIdimovel(const Value: TCmDbField);
begin
  FIdimovel := Value;
end;

procedure TDbOutrodadoximovel.SetIdoutrodado(const Value: TCmDbField);
begin
  FIdoutrodado := Value;
end;

procedure TDbOutrodadoximovel.SetIDOutroDadoXImovel(
  const Value: TCmDbField);
begin
  FIDOutroDadoXImovel := Value;
end;

procedure TDbOutrodadoximovel.SetOdivalor(const Value: TCmDbField);
begin
  FOdivalor := Value;
end;

end.



