unit uDbContratoTempObs;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
    TDbContratoTempObs = class(TCmDbObject)

    private
      FIdContratoTemp: TCmDbField;
      FIdContratoTempObs: TCmDbField;
      FDataObserv: TCmDbField;
      FObservacao: TCmDbField;

    protected

      function Insert : boolean; override;

    public
      constructor Create(Aowner : TCmCustomCdbObject); override;


      property IdContratoTempObs : TCmDbField read FIdContratoTempObs write FIdContratoTempObs;
      property DataObserv : TCmDbField read FDataObserv write FDataObserv;
      property Observacao : TCmDbField read FObservacao write FObservacao;
      property IdContratoTemp : TCmDbField read FIdContratoTemp write FIdContratoTemp;

    end;

implementation

{ TDbContratoTempObs }

constructor TDbContratoTempObs.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;

  TableName := 'CONTRATOTEMPOBS';

  IdContratoTempObs := CreateCmDbField('IDCONTRATOTEMPOBS', ftInteger, True, True, False, False);
  DataObserv := CreateCmDbField('DATAOBSERV', ftDateTime, False, False, False, False);
  Observacao := CreateCmDbField('OBSERVACAO', ftString, True, False, False, False);
  IdContratoTemp := CreateCmDbField('IDCONTRATOTEMP', ftInteger, True, False, False, False);
end;

function TDbContratoTempObs.Insert: boolean;
begin
   IdContratoTempObs.AsInteger := GetSequence('CONTRATOTEMPOBS');
   Result := inherited Insert;
end;

end.
 