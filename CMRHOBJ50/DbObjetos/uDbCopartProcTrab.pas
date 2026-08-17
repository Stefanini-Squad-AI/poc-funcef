{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 19/11/2002                                 }
{                                                       }
{*******************************************************}

unit uDbCopartProcTrab;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDbCopartProcTrab = class(TCmDbObject)
  private
    FIdPessoa: TCmDbField;
    FIndTestemunha: TCmDbField;
    FIdMotivo: TCmDbField;
    FNumProcTrab: TCmDbField;
    FDataAltSit: TCmDbField;
    FValorCondenacao: TCmDbField;
    FIdPlanPrevCtbPatr: TCmDbField;
    FIdEmpresa: TCmDbField;
    FCodCentroCusto: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property NumProcTrab: TCmDbField read FNumProcTrab write FNumProcTrab;
    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property IdMotivo: TCmDbField read FIdMotivo write FIdMotivo;
    property IndTestemunha: TCmDbField read FIndTestemunha write FIndTestemunha;
    property DataAltSit: TCmDbField read FDataAltSit write FDataAltSit;
    property ValorCondenacao: TCmDbField read FValorCondenacao write FValorCondenacao;
    property IdPlanPrevCtbPatr: TCmDbField read FIdPlanPrevCtbPatr write FIdPlanPrevCtbPatr;
    property IdEmpresa: TCmDbField read FIdEmpresa write FIdEmpresa;
    property CodCentroCusto: TCmDbField read FCodCentroCusto write FCodCentroCusto;
  end;

implementation

{ TDbCopartProcTrab }

constructor TDbCopartProcTrab.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'COPARTPROCTRAB';

  FNumProcTrab := CreateCmDbField('NUMPROCTRAB',ftFloat,true,true,false,true,'');
  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,true,'');
  FIdMotivo := CreateCmDbField('IDMOTIVO',ftFloat,false,false,false,true,'');
  FIndTestemunha := CreateCmDbField('INDTESTEMUNHA',ftFloat,false,false,false,false,'');
  FDataAltSit := CreateCmDbField('DATAALTSIT',ftDateTime,false,false,false,true,'');
  FValorCondenacao := CreateCmDbField('VALORCONDENACAO',ftFloat,false,false,false,false,'');
  FIdPlanPrevCtbPatr := CreateCmDbField('IDPLANPREVCTBPATR',ftFloat,false,false,false,true,'');
  FIdEmpresa := CreateCmDbField('IDEMPRESA',ftFloat,false,false,false,true,'');
  FCodCentroCusto := CreateCmDbField('CODCENTROCUSTO',ftString,false,false,false,true,'');
end;

end.
