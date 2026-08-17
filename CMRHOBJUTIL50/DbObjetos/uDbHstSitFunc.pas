{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 26/06/2002                                 }
{                                                       }
{*******************************************************}

unit uDbHstSitFunc;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB;

type
  TDbHstSitFunc = class(TCmDbObject)
  private
    FIdPessoa: TCmDbField;
    FDataSitFunc: TCmDbField;
    FIdMovContrCAGED: TCmDbField;
    FIdMotivoOfic: TCmDbField;
    FIdSitFunc: TCmDbField;
    FIdMotivoGer: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property DataSitFunc: TCmDbField read FDataSitFunc write FDataSitFunc;
    property IdSitFunc: TCmDbField read FIdSitFunc write FIdSitFunc;
    property IdMovContrCAGED: TCmDbField read FIdMovContrCAGED write FIdMovContrCAGED;
    property IdMotivoOfic: TCmDbField read FIdMotivoOfic write FIdMotivoOfic;
    property IdMotivoGer: TCmDbField read FIdMotivoGer write FIdMotivoGer;
  end;

implementation

{ TDbHstSitFunc }

constructor TDbHstSitFunc.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;
  _UpdateKeyFields := true;
  
  TableName := 'HSTSITFUNC';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,false,'');
  FDataSitFunc := CreateCmDbField('DATASITFUNC',ftDateTime,true,true,false,true,'');
  FIdSitFunc := CreateCmDbField('IDSITFUNC',ftFloat,false,false,false,true,'');
  FIdMovContrCAGED := CreateCmDbField('IDMOVCONTRCAGED',ftFloat,false,false,false,true,'');
  FIdMotivoOfic := CreateCmDbField('IDMOTIVOOFIC',ftFloat,false,false,false,true,'');
  FIdMotivoGer := CreateCmDbField('IDMOTIVOGER',ftFloat,false,false,false,true,'');
end;

end.
