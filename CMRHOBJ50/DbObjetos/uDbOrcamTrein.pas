{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 03/06/2002                                 }
{                                                       }
{*******************************************************}

unit uDbOrcamTrein;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbOrcamTrein = class(TCmDbObject)
  private
    FOcorrencias: TCmDbField;
    FIdCurso: TCmDbField;
    FCodCentroCusto: TCmDbField;
    FIdOrcamTrein: TCmDbField;
    FAno: TCmDbField;
    FIdEmpresa: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdOrcamTrein: TCmDbField read FIdOrcamTrein write FIdOrcamTrein;
    property IdEmpresa: TCmDbField read FIdEmpresa write FIdEmpresa;
    property IdCurso: TCmDbField read FIdCurso write FIdCurso;
    property CodCentroCusto: TCmDbField read FCodCentroCusto write FCodCentroCusto;
    property Ocorrencias: TCmDbField read FOcorrencias write FOcorrencias;
    property Ano: TCmDbField read FAno write FAno;
  end;

implementation

{ TDbOrcamTrein }

constructor TDbOrcamTrein.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'ORCAMTREIN';

  FIdOrcamTrein := CreateCmDbField('IDORCAMTREIN',ftFloat,true,true,false,false,'');
  FIdEmpresa := CreateCmDbField('IDEMPRESA',ftFloat,true,false,false,false,'');
  FIdCurso := CreateCmDbField('IDCURSO',ftFloat,true,false,false,false,'');
  FCodCentroCusto := CreateCmDbField('CODCENTROCUSTO',ftString,false,false,false,false,'');
  FOcorrencias := CreateCmDbField('OCORRENCIAS',ftFloat,false,false,false,false,'');
  FAno := CreateCmDbField('ANO',ftFloat,true,false,false,false,'');
end;

function TDbOrcamTrein.Insert: boolean;
begin
  FIdOrcamTrein.asFloat := GetSequence('ORCAMTREIN');
  Result := inherited Insert;  
end;

end.
