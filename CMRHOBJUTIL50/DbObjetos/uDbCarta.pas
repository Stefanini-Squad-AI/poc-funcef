{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Atualizado Em: 16/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbCarta;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB;

type
  TDbCarta = class(TCmDbObject)
  private
    FNumCarta: TCmDbField;
    FAssunto: TCmDbField;
    FTexto: TCmDbField;
    FDataCarta: TCmDbField;
    FIdMotivo: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property NumCarta: TCmDbField read FNumCarta write FNumCarta;
    property DataCarta: TCmDbField read FDataCarta write FDataCarta;
    property IdMotivo: TCmDbField read FIdMotivo write FIdMotivo;
    property Assunto: TCmDbField read FAssunto write FAssunto;
    property Texto: TCmDbField read FTexto write FTexto;
  end;

implementation

{ TDbCarta }

constructor TDbCarta.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'CARTA';

  FNumCarta := CreateCmDbField('NUMCARTA',ftFloat,true,true,false,false,'');
  FDataCarta := CreateCmDbField('DATACARTA',ftDateTime,true,false,false,true,'');
  FIdMotivo := CreateCmDbField('IDMOTIVO',ftFloat,false,false,false,true,'');
  FAssunto := CreateCmDbField('ASSUNTO',ftString,false,false,false,false,'');
  FTexto := CreateCmDbField('TEXTO',ftBlob,true,false,false,false,'');
end;

function TDbCarta.Insert: boolean;
begin
  FNumCarta.asFloat := GetSequence('CARTA');
  Result := inherited Insert;
end;

end.
