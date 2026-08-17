{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugênio C. Frioli               }
{ Criado Em: 11/05/2004                                 }
{                                                       }
{*******************************************************}

unit uDbOrcamPessoal;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbOrcamPessoal = class(TCmDbObject)
  private
    FIdOrcamPessoal: TCmDbField;
    FAno: TCmDbField;
    FMes: TCmDbField;
    FIdCargo: TCmDbField;
    FIdEmpresa: TCmDbField;
    FCodCentroCusto: TCmDbField;
    FIdEstab: TCmDbField;
    FQtdePessoal: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdOrcamPessoal: TCmDbField read FIdOrcamPessoal write FIdOrcamPessoal;
    property Ano: TCmDbField read FAno write FAno;
    property Mes: TCmDbField read FMes write FMes;
    property IdCargo: TCmDbField read FIdCargo write FIdCargo;
    property IdEmpresa: TCmDbField read FIdEmpresa write FIdEmpresa;
    property CodCentroCusto: TCmDbField read FCodCentroCusto write FCodCentroCusto;
    property IdEstab: TCmDbField read FIdEstab write FIdEstab;
    property QtdePessoal: TCmDbField read FQtdePessoal write FQtdePessoal;
  end;

implementation

{ TDbOrcamPessoal }

constructor TDbOrcamPessoal.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'ORCAMPESSOAL';

  FIdOrcamPessoal := CreateCmDbField('IDORCAMPESSOAL',ftFloat,true,true,false,false,'');
  FAno := CreateCmDbField('ANO',ftFloat,true,false,false,false,'');
  FMes := CreateCmDbField('MES',ftFloat,true,false,false,false,'');
  FIdCargo := CreateCmDbField('IDCARGO',ftFloat,true,false,false,false,'');
  FIdEmpresa := CreateCmDbField('IDEMPRESA',ftFloat,true,false,false,false,'');
  FCodCentroCusto := CreateCmDbField('CODCENTROCUSTO',ftString,false,false,false,false,'');
  FIdEstab := CreateCmDbField('IDESTAB',ftFloat,true,false,false,false,'');
  FQtdePessoal := CreateCmDbField('QTDEPESSOAL',ftFloat,false,false,false,false,'');
end;

function TDbOrcamPessoal.Insert: boolean;
begin
  FIdOrcamPessoal.asFloat := GetSequence('ORCAMPESSOAL');
  Result := inherited Insert;  
end;

end.
