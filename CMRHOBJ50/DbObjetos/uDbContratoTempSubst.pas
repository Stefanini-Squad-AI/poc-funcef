unit uDbContratoTempSubst;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
    TDbContratoTempSubst = class(TCmDbObject)

    private
      FIdMotivo: TCmDbField;
      FIdPessoa: TCmDbField;
      FMatricula: TCmDbField;
      FIdContratoTempSubst: TCmDbField;
      FDescricao: TCmDbField;
      FCodCentroCusto: TCmDbField;
      FDataInicio: TCmDbField;
      FDataFim: TCmDbField;
      FIdContratoTemp: TCmDbField;
      FCodDiretoria : TCmDbField;
      FIdEmpresa : TCmDbField;
    protected

      function Insert : boolean; override;

    public

      constructor Create(Aowner: TCmCustomCdbObject); override;

      property IdContratoTempSubst : TCmDbField read FIdContratoTempSubst write FIdContratoTempSubst;
      property Matricula : TCmDbField read FMatricula write FMatricula;
      property IdPessoa : TCmDbField read FIdPessoa write FIdPessoa;
      property IdMotivo : TCmDbField read FIdMotivo write FIdMotivo;
      property CodCentroCusto : TCmDbField read FCodCentroCusto write FCodCentroCusto;
      property Descricao : TCmDbField read FDescricao write FDescricao;
      property DataInicio : TCmDbField read FDataInicio write FDataInicio;
      property DataFim : TCmDbField read FDataFim write FDataFim;
      property IdContratoTemp : TCmDbField read FIdContratoTemp write FIdContratoTemp;
      property CodDiretoria : TCmDbField read FCodDiretoria write FCodDiretoria;
      property IdEmpresa : TCmDbField read FIdEmpresa write FIdEmpresa;
    end;

implementation

{ TDbContratoTempSubst }

constructor TDbContratoTempSubst.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;

  TableName := 'CONTRATOTEMPSUBST';

  FIdContratoTempSubst := CreateCmDbField('IDCONTRATOTEMPSUBST', ftInteger, True, True, False, False);
  FMatricula := CreateCmDbField('MATRICULA', ftString, False, False, False, False);
  FIdPessoa := CreateCmDbField('IDPESSOA', ftInteger, False, False, False, False);
  FIdMotivo := CreateCmDbField('IDMOTIVO', ftInteger, False, False, False, False);
  FCodCentroCusto := CreateCmDbField('CODCENTROCUSTO', ftString, False, False, False, False);
  FDescricao := CreateCmDbField('DESCRICAO', ftString, False, False, False, False);
  FDataInicio := CreateCmDbField('DATAINICIO', ftDateTime, False, False, False, False);
  FDataFim := CreateCmDbField('DATAFIM', ftDateTime, False, False, False, False);
  FIdContratoTemp := CreateCmDbField('IDCONTRATOTEMP', ftInteger, True, False, False, False);
  FCodDiretoria := CreateCmDbField('CODDIRETORIA', ftString, False, False, False, False);
  FIdEmpresa := CreateCmDbField('IDEMPRESA', ftInteger, False, False, False, False);
end;

function TDbContratoTempSubst.Insert: boolean;
begin
  FIdContratoTempSubst.AsInteger := GetSequence('CONTRATOTEMPSUBST');
  Result := inherited Insert;
end;

end.
