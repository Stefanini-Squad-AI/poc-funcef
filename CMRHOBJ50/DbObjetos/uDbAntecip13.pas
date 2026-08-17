{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 11/06/2002                                 }
{                                                       }
{*******************************************************}

unit uDbAntecip13;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbAntecip13 = class(TCmDbObject)
  private
    FAno: TCmDbField;
    FIdPessoa: TCmDbField;
    FFlgOcorrida: TCmDbField;
    FMes: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property Mes: TCmDbField read FMes write FMes;
    property Ano: TCmDbField read FAno write FAno;
    property FlgOcorrida: TCmDbField read FFlgOcorrida write FFlgOcorrida;
  end;

implementation

{ TDbAntecip13 }

constructor TDbAntecip13.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'ANTECIP13';

  FIdPessoa := CreateCmDbField('IdPessoa',ftFloat,true,true,false,false,'');
  FMes := CreateCmDbField('Mes',ftFloat,true,false,false,false,'');
  FAno := CreateCmDbField('Ano',ftFloat,true,true,false,false,'');
  FFlgOcorrida := CreateCmDbField('FlgOcorrida',ftFloat,false,false,false,false,'');
end;

end.
