//***************************************************************************************
//Nº SOL...........: 229881/16649
//Nº PPM...........: 566000
//Data da Alteração: 26/02/2015
//Responsável......: Felipe A. Santos
//Descrição........: Criação da Db.
//***************************************************************************************

unit uDbAvisoPrev;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbAvisoPrev = class(TCmDbObject)
  private
    FIdPessoa: TCmDbField;
    FTipoAviso: TCmDbField;
    FMotivoCancel: TCmDbField;
    FFlgSituacao: TCmDbField;
    FDtPrevDeslig: TCmDbField;
    FObservacao: TCmDbField;
    FDataCancel: TCmDbField;
    FIdAvisoPrev: TCmDbField;

  public
     function Insert : Boolean; override;

     constructor Create(AOwner : TCmCustomCdbObject); override;

     property IdAvisoPrev : TCmDbField read FIdAvisoPrev write FIdAvisoPrev;
     property IdPessoa : TCmDbField read FIdPessoa write FIdPessoa;
     property TipoAviso : TCmDbField read FTipoAviso write FTipoAviso;
     property DtPrevDeslig : TCmDbField read FDtPrevDeslig write FDtPrevDeslig;
     property FlgSituacao : TCmDbField read FFlgSituacao write FFlgSituacao;
     property MotivoCancel : TCmDbField read FMotivoCancel write FMotivoCancel;
     property DataCancel : TCmDbField read FDataCancel write FDataCancel;
     property Observacao : TCmDbField read FObservacao write FObservacao;
  end;

implementation

{ TDbAvisoPrev }

constructor TDbAvisoPrev.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  TableName := 'AVISOPREV';

  IdAvisoPrev := CreateCmDbField('IDAVISOPREV', ftFloat, True, True, False, False, '');
  IdPessoa := CreateCmDbField('IDPESSOA', ftFloat, False, False, False, True, '');
  TipoAviso := CreateCmDbField('TIPOAVISO', ftFloat, False, False, False, True, '');
  DtPrevDeslig := CreateCmDbField('DTPREVDESLIG', ftDateTime, False, False, False, True, '');
  FlgSituacao := CreateCmDbField('FLGSITUACAO', ftFloat, False, False, False, True, '');
  MotivoCancel := CreateCmDbField('MOTIVOCANCEL', ftFloat, False, False, False, True, '');
  DataCancel := CreateCmDbField('DATACANCEL', ftDateTime, False, False, False, True, '');
  Observacao := CreateCmDbField('OBSERVACAO', ftString, False, False, False, True, '');
end;

function TDbAvisoPrev.Insert: Boolean;
begin
  IdAvisoPrev.AsFloat := GetSequence('AVISOPREV');

  Result := inherited Insert;
end;

end.
