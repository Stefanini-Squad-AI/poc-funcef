{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/04/2002                                 }
{                                                       }
{*******************************************************}

unit uDbRateioProcTrab;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbRateioProcTrab = class(TCmDbObject)
  private
    FIdPessoa: TCmDbField;
    FIdFilialPessoa: TCmDbField;
    FDataBaseRateio: TCmDbField;
    FTipoRateio: TCmDbField;
    FPeriodo: TCmDbField;
    FPercent1: TCmDbField;
    FPercent2: TCmDbField;
    FPercent3: TCmDbField;
    FPercent4: TCmDbField;
    FPercent5: TCmDbField;
    FValorBase1: TCmDbField;
    FValorBase2: TCmDbField;
    FValorBase3: TCmDbField;
    FValorBase4: TCmDbField;
    FValorBase5: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property IdFilialPessoa: TCmDbField read FIdFilialPessoa write FIdFilialPessoa;
    property DataBaseRateio: TCmDbField read FDataBaseRateio write FDataBaseRateio;
    property TipoRateio: TCmDbField read FTipoRateio write FTipoRateio;
    property Periodo: TCmDbField read FPeriodo write FPeriodo;
    property Percent1: TCmDbField read FPercent1 write FPercent1;
    property Percent2: TCmDbField read FPercent2 write FPercent2;
    property Percent3: TCmDbField read FPercent3 write FPercent3;
    property Percent4: TCmDbField read FPercent4 write FPercent4;
    property Percent5: TCmDbField read FPercent5 write FPercent5;
    property ValorBase1: TCmDbField read FValorBase1 write FValorBase1;
    property ValorBase2: TCmDbField read FValorBase2 write FValorBase2;
    property ValorBase3: TCmDbField read FValorBase3 write FValorBase3;
    property ValorBase4: TCmDbField read FValorBase4 write FValorBase4;
    property ValorBase5: TCmDbField read FValorBase5 write FValorBase5;
  end;

implementation

{ TDbRateioProcTrab }

constructor TDbRateioProcTrab.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'RATEIOPROCTRAB';

  FIdFilialPessoa := CreateCmDbField('IDFILIALPESSOA',ftFloat,true,true,false,true,'');
  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,false,false,false,true,'');
  FTipoRateio := CreateCmDbField('TIPORATEIO',ftFloat,true,false,false,false,'');
  FDataBaseRateio := CreateCmDbField('DATABASERATEIO',ftDateTime,false,false,false,true,'');
  FPeriodo := CreateCmDbField('PERIODO',ftFloat,false,false,false,false,'');
  FValorBase1 := CreateCmDbField('VALORBASE1',ftFloat,false,false,false,false,'');
  FValorBase2 := CreateCmDbField('VALORBASE2',ftFloat,false,false,false,false,'');
  FValorBase3 := CreateCmDbField('VALORBASE3',ftFloat,false,false,false,false,'');
  FValorBase4 := CreateCmDbField('VALORBASE4',ftFloat,false,false,false,false,'');
  FValorBase5 := CreateCmDbField('VALORBASE5',ftFloat,false,false,false,false,'');
  FPercent1 := CreateCmDbField('PERCENT1',ftFloat,false,false,false,false,'');
  FPercent2 := CreateCmDbField('PERCENT2',ftFloat,false,false,false,false,'');
  FPercent3 := CreateCmDbField('PERCENT3',ftFloat,false,false,false,false,'');
  FPercent4 := CreateCmDbField('PERCENT4',ftFloat,false,false,false,false,'');
  FPercent5 := CreateCmDbField('PERCENT5',ftFloat,false,false,false,false,'');
end;

end.
