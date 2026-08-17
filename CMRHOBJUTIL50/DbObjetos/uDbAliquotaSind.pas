{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 11/03/2002                                 }
{                                                       }
{*******************************************************}

unit uDbAliquotaSind;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbAliquotaSind = class(TCmDbObject)
  private
    FValLimiteFaixa: TCmDbField;
    FIdSindicato: TCmDbField;
    FTaxaDaFaixa: TCmDbField;
    FIdFaixaAliqSind: TCmDbField;
  public
    {$IFNDEF VERSAO0505}
    constructor Create(AOwner: TCmCustomCdbObject); override;
    {$ELSE}
    constructor Create; override;
    {$ENDIF}

    property IdSindicato: TCmDbField read FIdSindicato write FIdSindicato;
    property IdFaixaAliqSind: TCmDbField read FIdFaixaAliqSind write FIdFaixaAliqSind;
    property TaxaDaFaixa: TCmDbField read FTaxaDaFaixa write FTaxaDaFaixa;
    property ValLimiteFaixa: TCmDbField read FValLimiteFaixa write FValLimiteFaixa;
  end;

implementation

{ TDbAliquotaSind }

{$IFNDEF VERSAO0505}
constructor TDbAliquotaSind.Create(AOwner: TCmCustomCdbObject);
{$ELSE}
constructor TDbAliquotaSind.Create;
{$ENDIF}
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'AliquotaSind';

  FIdSindicato := CreateCmDbField('IdSindicato',ftFloat,true,true,false,true,'');
  FIdFaixaAliqSind := CreateCmDbField('IdFaixaAliqSind',ftFloat,true,true,false,true,'');
  FTaxaDaFaixa := CreateCmDbField('TaxaDaFaixa',ftFloat,false,false,false,true,'');
  FValLimiteFaixa := CreateCmDbField('ValLimiteFaixa',ftFloat,true,false,false,true,'');
end;

end.
