{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/06/2002                                 }
{                                                       }
{*******************************************************}

unit uDbHstEndPess;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbHstEndPess = class(TCmDbObject)
  private
    FNumero: TCmDbField;
    FIdPessoa: TCmDbField;
    FIdCidades: TCmDbField;
    FDataAlt: TCmDbField;
    FCep: TCmDbField;
    FBairro: TCmDbField;
    FComplemento: TCmDbField;
    FLogradouro: TCmDbField;
  public
    {$IFNDEF VERSAO0505}
    constructor Create(AOwner: TCmCustomCdbObject); override;
    {$ELSE}
    constructor Create; override;
    {$ENDIF}

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property DataAlt: TCmDbField read FDataAlt write FDataAlt;
    property Logradouro: TCmDbField read FLogradouro write FLogradouro;
    property IdCidades: TCmDbField read FIdCidades write FIdCidades;
    property Numero: TCmDbField read FNumero write FNumero;
    property Bairro: TCmDbField read FBairro write FBairro;
    property Cep: TCmDbField read FCep write FCep;
    property Complemento: TCmDbField read FComplemento write FComplemento;
  end;

implementation

{ TDbHstEndPess }

{$IFNDEF VERSAO0505}
constructor TDbHstEndPess.Create(AOwner: TCmCustomCdbObject);
{$ELSE}
constructor TDbHstEndPess.Create;
{$ENDIF}
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'HSTENDPESS';

  FIdPessoa := CreateCmDbField('IdPessoa',ftFloat,true,true,false,false,'');
  FDataAlt := CreateCmDbField('DataAlt',ftDateTime,true,true,false,false,'');
  FLogradouro := CreateCmDbField('Logradouro',ftString,true,false,false,true,'');
  FIdCidades := CreateCmDbField('IdCidades',ftFloat,false,false,false,true,'');
  FNumero := CreateCmDbField('Numero',ftString,false,false,false,true,'');
  FBairro := CreateCmDbField('Bairro',ftString,false,false,false,true,'');
  FCep := CreateCmDbField('Cep',ftString,false,false,false,true,'');
  FComplemento := CreateCmDbField('Complemento',ftString,false,false,false,true,'');
end;

end.
