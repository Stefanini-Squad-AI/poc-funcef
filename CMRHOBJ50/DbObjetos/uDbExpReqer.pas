{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 29/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbExpReqer;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbExpReqer = class(TCmDbObject)
  private
    FTempoExper: TCmDbField;
    FFlgImprescInd: TCmDbField;
    FIdExper: TCmDbField;
    FIdCargo: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdExper: TCmDbField read FIdExper write FIdExper;
    property IdCargo: TCmDbField read FIdCargo write FIdCargo;
    property TempoExper: TCmDbField read FTempoExper write FTempoExper;
    property FlgImprescInd: TCmDbField read FFlgImprescInd write FFlgImprescInd;
  end;

implementation

{ TDbExpReqer }

constructor TDbExpReqer.Create(AOwner: TCmCustomCdbObject); 
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'EXPREQER';

  FIdExper := CreateCmDbField('IDEXPER',ftFloat,true,true,false,false,'');
  FIdCargo := CreateCmDbField('IDCARGO',ftFloat,true,true,false,false,'');
  FTempoExper := CreateCmDbField('TEMPOEXPER',ftFloat,true,false,false,false,'');
  FFlgImprescInd := CreateCmDbField('FLGIMPRESCIND',ftFloat,false,false,false,true,'');
end;

end.
