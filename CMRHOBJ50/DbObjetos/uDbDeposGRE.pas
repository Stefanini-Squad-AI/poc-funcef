{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 04/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbDeposGRE;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbDeposGRE = class(TCmDbObject)
  private
    FDescricao: TCmDbField;
    FIdDeposGRE: TCmDbField;
    FTipoContrato: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdDeposGRE: TCmDbField read FIdDeposGRE write FIdDeposGRE;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property TipoContrato: TCmDbField read FTipoContrato write FTipoContrato;
  end;

implementation

{ TDbDeposGRE }

constructor TDbDeposGRE.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'DEPOSGRE';

  FIdDeposGRE := CreateCmDbField('IDDEPOSGRE',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
  FTipoContrato := CreateCmDbField('TIPOCONTRATO',ftString,false,false,false,false,'');
end;

end.
