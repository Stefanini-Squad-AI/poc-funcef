unit uDbAgenteRiscoXCondifer;

// Alterações:
{ --------------------------------------------------------------------------------------------------
 Autor......: Felipe A. Santos
 Data.......: 08/01/2015
 Sol........: 229873.16665
 Kintana....: 570016
 Descrição..: Criação da DB.
--------------------------------------------------------------------------------------------------}


interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbAgenteRiscoXCondifer = class(TCmDbObject)
  private
    FUtilEPC: TCmDbField;
    FIdCondifer: TCmDbField;
    FIdAgenteRisco: TCmDbField;
    FDescEPI: TCmDbField;
    FUtilEPI: TCmDbField;
    FIExposicao: TCmDbField;
    FMedicao: TCmDbField;
    FIdAgenteRiscoxCondifer: TCmDbField;
  public
    constructor Create(AOwner : TCmCustomCdbObject); override;

    function Insert : Boolean; override;

    property IdAgenteRiscoxCondifer : TCmDbField read FIdAgenteRiscoxCondifer write FIdAgenteRiscoxCondifer;
    property IdAgenteRisco : TCmDbField read FIdAgenteRisco write FIdAgenteRisco;
    property IdCondifer : TCmDbField read FIdCondifer write FIdCondifer;
    property UtilEPC : TCmDbField read FUtilEPC write FUtilEPC;
    property UtilEPI : TCmDbField read FUtilEPI write FUtilEPI;
    property DescEPI : TCmDbField read FDescEPI write FDescEPI;
    property IExposicao : TCmDbField read FIExposicao write FIExposicao;
    property Medicao : TCmDbField read FMedicao write FMedicao;
  end;

implementation

{ TDbAgenteRiscoXCondifer }

constructor TDbAgenteRiscoXCondifer.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  TableName := 'AGENTERISCOXCONDIFER';

  FIdAgenteRiscoxCondifer := CreateCmDbField('IDAGENTERISCOXCONDIFER', ftFloat,true,true,false,false,'');
  FIdAgenteRisco := CreateCmDbField('IDAGENTERISCO', ftFloat,false,false,false,true,'');
  FIdCondifer := CreateCmDbField('IDCONDIFER', ftFloat,true,true,false,true,'');
  FUtilEPC := CreateCmDbField('UTILEPC', ftFloat,false,false,false,false,'');
  FUtilEPI := CreateCmDbField('UTILEPI', ftFloat,false,false,false,false,'');
  FDescEPI := CreateCmDbField('DESCEPI', ftString,false,false,false,true,'');
  FIExposicao := CreateCmDbField('IEXPOSICAO', ftString,false,false,false,true,'');
  FMedicao := CreateCmDbField('MEDICAO',ftString,false,false,false,true,'');
end;

function TDbAgenteRiscoXCondifer.Insert: Boolean;
begin
  FIdAgenteRiscoxCondifer.AsFloat := GetSequence('AGENTERISCOXCONDIFER');
  Result := inherited Insert;
end;

end.
