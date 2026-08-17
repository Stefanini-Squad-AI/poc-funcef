{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 09/07/2002                                 }
{                                                       }
{*******************************************************}

unit uDbBancoPortForma;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbBancoPortForma = class(TCmDbObject)
  private
    FColValor: TCmDbField;
    FTamValor: TCmDbField;
    FIdBanco: TCmDbField;
    FVlrArredSalario: TCmDbField;
    FDFloatPagto: TCmDbField;
    FIdBancoPortForma: TCmDbField;
    FPrefixoArq: TCmDbField;
    FCodPortForma: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;
    function Insert: boolean; override;

    property IdBancoPortForma: TCmDbField read FIdBancoPortForma write FIdBancoPortForma;
    property IdBanco: TCmDbField read FIdBanco write FIdBanco;
    property CodPortForma: TCmDbField read FCodPortForma write FCodPortForma;
    property VlrArredSalario: TCmDbField read FVlrArredSalario write FVlrArredSalario;
    property TamValor: TCmDbField read FTamValor write FTamValor;
    property PrefixoArq: TCmDbField read FPrefixoArq write FPrefixoArq;
    property DFloatPagto: TCmDbField read FDFloatPagto write FDFloatPagto;
    property ColValor: TCmDbField read FColValor write FColValor;
  end;

implementation

{ TDbBancoPortForma }

constructor TDbBancoPortForma.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'BANCOPORTFORMA';

  FIdBancoPortForma := CreateCmDbField('IDBANCOPORTFORMA',ftFloat,true,true,false,true,'');
  FIdBanco := CreateCmDbField('IDBANCO',ftFloat,false,false,false,true,'');
  FCodPortForma := CreateCmDbField('CODPORTFORMA',ftFloat,true,false,false,false,'');
  FVlrArredSalario := CreateCmDbField('VLRARREDSALARIO',ftFloat,false,false,false,true,'');
  FTamValor := CreateCmDbField('TAMVALOR',ftFloat,false,false,false,true,'');
  FPrefixoArq := CreateCmDbField('PREFIXOARQ',ftString,false,false,false,true,'');
  FDFloatPagto := CreateCmDbField('DFLOATPAGTO',ftFloat,false,false,false,true,'');
  FColValor := CreateCmDbField('COLVALOR',ftFloat,false,false,false,true,'');
end;

function TDbBancoPortForma.Insert: boolean;
begin
  FIdBancoPortForma.asFloat := GetSequence('BANCOPORTFORMA');
  Result := inherited Insert;
end;

end.
