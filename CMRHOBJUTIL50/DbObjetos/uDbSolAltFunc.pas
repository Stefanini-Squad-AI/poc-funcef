{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 26/05/2003                                 }
{                                                       }
{*******************************************************}

unit uDbSolAltFunc;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbSolAltFunc = class(TCmDbObject)
  private
    FNovo_Salario: TCmDbField;
    FPerc_Reaj: TCmDbField;
    FCodCentroCusto: TCmDbField;
    FIdRequisitante: TCmDbField;
    FIdEstab: TCmDbField;
    FIdIndicado: TCmDbField;
    FIdCargo: TCmDbField;
    FIdMotivo: TCmDbField;
    FData_Efetiv_Alter: TCmDbField;
    FId_Solic_Alter_Func: TCmDbField;
    FSituacao_Solic: TCmDbField;
    FIdProcesso: TCmDbField;
    FFlag_Perc_Salar: TCmDbField;
    FNovo_Tipo_Sal: TCmDbField;
    FIdEmpresa: TCmDbField;
    FObserv_Solic: TCmDbField;
    FData_Solic_Alter: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property Situacao_Solic: TCmDbField read FSituacao_Solic write FSituacao_Solic;
    property Perc_Reaj: TCmDbField read FPerc_Reaj write FPerc_Reaj;
    property Observ_Solic: TCmDbField read FObserv_Solic write FObserv_Solic;
    property Novo_Tipo_Sal: TCmDbField read FNovo_Tipo_Sal write FNovo_Tipo_Sal;
    property Novo_Salario: TCmDbField read FNovo_Salario write FNovo_Salario;
    property Id_Solic_Alter_Func: TCmDbField read FId_Solic_Alter_Func write FId_Solic_Alter_Func;
    property IdRequisitante: TCmDbField read FIdRequisitante write FIdRequisitante;
    property IdProcesso: TCmDbField read FIdProcesso write FIdProcesso;
    property IdMotivo: TCmDbField read FIdMotivo write FIdMotivo;
    property IdIndicado: TCmDbField read FIdIndicado write FIdIndicado;
    property IdEstab: TCmDbField read FIdEstab write FIdEstab;
    property IdEmpresa: TCmDbField read FIdEmpresa write FIdEmpresa;
    property IdCargo: TCmDbField read FIdCargo write FIdCargo;
    property Flag_Perc_Salar: TCmDbField read FFlag_Perc_Salar write FFlag_Perc_Salar;
    property Data_Solic_Alter: TCmDbField read FData_Solic_Alter write FData_Solic_Alter;
    property Data_Efetiv_Alter: TCmDbField read FData_Efetiv_Alter write FData_Efetiv_Alter;
    property CodCentroCusto: TCmDbField read FCodCentroCusto write FCodCentroCusto;
  end;

implementation

{ TDbSolAltFunc }

constructor TDbSolAltFunc.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'SOLALTFUNC';

  FSituacao_Solic := CreateCmDbField('SITUACAO_SOLIC',ftFloat,false,false,false,false,'');
  FPerc_Reaj := CreateCmDbField('PERC_REAJ',ftFloat,false,false,false,false,'');
  FObserv_Solic := CreateCmDbField('OBSERV_SOLIC',ftBlob,false,false,false,false,'');
  FNovo_Tipo_Sal := CreateCmDbField('NOVO_TIPO_SAL',ftString,false,false,false,false,'');
  FNovo_Salario := CreateCmDbField('NOVO_SALARIO',ftFloat,false,false,false,false,'');
  FId_Solic_Alter_Func := CreateCmDbField('ID_SOLIC_ALTER_FUNC',ftFloat,true,true,false,true,'');
  FIdRequisitante := CreateCmDbField('IDREQUISITANTE',ftFloat,false,false,false,true,'');
  FIdProcesso := CreateCmDbField('IDPROCESSO',ftFloat,false,false,false,true,'');
  FIdMotivo := CreateCmDbField('IDMOTIVO',ftFloat,false,false,false,true,'');
  FIdIndicado := CreateCmDbField('IDINDICADO',ftFloat,false,false,false,true,'');
  FIdEstab := CreateCmDbField('IDESTAB',ftFloat,false,false,false,true,'');
  FIdEmpresa := CreateCmDbField('IDEMPRESA',ftFloat,false,false,false,true,'');
  FIdCargo := CreateCmDbField('IDCARGO',ftFloat,false,false,false,true,'');
  FFlag_Perc_Salar := CreateCmDbField('FLAG_PERC_SALAR',ftFloat,false,false,false,false,'');
  FData_Solic_Alter := CreateCmDbField('DATA_SOLIC_ALTER',ftDateTime,false,false,false,true,'');
  FData_Efetiv_Alter := CreateCmDbField('DATA_EFETIV_ALTER',ftDateTime,false,false,false,true,'');
  FCodCentroCusto := CreateCmDbField('CODCENTROCUSTO',ftString,false,false,false,true,'');
end;

end.
