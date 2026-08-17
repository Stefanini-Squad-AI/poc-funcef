{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 28/06/2002                                 }
{                                                       }
{*******************************************************}

unit uDbTurnoSem;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbTurnoSem = class(TCmDbObject)
  private
    FIdHorario: TCmDbField;
    FIdTurnoDiario: TCmDbField;
    FIdDiaSemana: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdTurnoDiario: TCmDbField read FIdTurnoDiario write FIdTurnoDiario;
    property IdHorario: TCmDbField read FIdHorario write FIdHorario;
    property IdDiaSemana: TCmDbField read FIdDiaSemana write FIdDiaSemana;
  end;

implementation

{ TDbTurnoSem }

constructor TDbTurnoSem.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TURNOSEM';

  FIdTurnoDiario := CreateCmDbField('IDTURNODIARIO',ftFloat,false,false,false,false,'');
  FIdHorario := CreateCmDbField('IDHORARIO',ftFloat,true,true,false,false,'');
  FIdDiaSemana := CreateCmDbField('IDDIASEMANA',ftFloat,true,true,false,false,'');
end;

end.
