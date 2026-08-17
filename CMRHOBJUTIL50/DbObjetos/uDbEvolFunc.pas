{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/09/2002                                 }
{                                                       }
{*******************************************************}

unit uDbEvolFunc;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB;

type
  TDbEvolFunc = class(TCmDbObject)
  private
    FCodCentroCusto: TCmDbField;
    FIdMotivo: TCmDbField;
    FIdCargo: TCmDbField;
    FIdEmpresa: TCmDbField;
    FPerc_Reaj: TCmDbField;
    FIdFuncao: TCmDbField;
    FIdPessoa: TCmDbField;
    FSalario: TCmDbField;
    FIdProcesso: TCmDbField;
    FTipoPagamento: TCmDbField;
    FDataAlterFunc: TCmDbField;
    FIdEstab: TCmDbField;
    FIdfaixaCargo: TCmDbField;
    FIdfaixaFuncao: TCmDbField;
    FNivelIndiv1: TCmDbField;
    FNivelIndiv2: TCmDbField;
    FTrgDtInclusao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property IdEmpresa: TCmDbField read FIdEmpresa write FIdEmpresa;
    property DataAlterFunc: TCmDbField read FDataAlterFunc write FDataAlterFunc;
    property IdEstab: TCmDbField read FIdEstab write FIdEstab;
    property IdMotivo: TCmDbField read FIdMotivo write FIdMotivo;
    property IdCargo: TCmDbField read FIdCargo write FIdCargo;
    property IdFuncao: TCmDbField read FIdFuncao write FIdFuncao;
    property CodCentroCusto: TCmDbField read FCodCentroCusto write FCodCentroCusto;
    property TipoPagamento: TCmDbField read FTipoPagamento write FTipoPagamento;
    property Perc_Reaj: TCmDbField read FPerc_Reaj write FPerc_Reaj;
    property Salario: TCmDbField read FSalario write FSalario;
    property IdProcesso: TCmDbField read FIdProcesso write FIdProcesso;
    property IdFaixaCargo: TCmDbField read FIdFaixaCargo write FIdFaixaCargo;
    property IdFaixaFuncao: TCmDbField read FIdFaixaFuncao write FIdFaixaFuncao;
    property NivelIndiv1: TCmDbField read FNivelIndiv1 write FNivelIndiv1;
    property NivelIndiv2: TCmDbField read FNivelIndiv2 write FNivelIndiv2;
    property TrgDtInclusao: TCmDbField read FTrgDtInclusao write FTrgDtInclusao;
  end;

implementation

{ TDbEvolFunc }

constructor TDbEvolFunc.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;
  _UpdateKeyFields := true;
  
  TableName := 'EVOLFUNC';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,true,'');
  FDataAlterFunc := CreateCmDbField('DATAALTERFUNC',ftDateTime,true,true,false,true,'');
  FIdMotivo := CreateCmDbField('IDMOTIVO',ftFloat,true,true,false,true,'');
  FIdEmpresa := CreateCmDbField('IDEMPRESA',ftFloat,false,false,false,true,'');
  FIdEstab := CreateCmDbField('IDESTAB',ftFloat,false,false,false,true,'');
  FIdCargo := CreateCmDbField('IDCARGO',ftFloat,false,false,false,true,'');
  FIdFuncao := CreateCmDbField('IDFUNCAO',ftFloat,false,false,false,true,'');
  FCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,false,false,false,true,'');
  FTipoPagamento := CreateCmDbField('TIPOPAGAMENTO',ftString,true,false,false,true,'');
  FPerc_Reaj := CreateCmDbField('PERC_REAJ',ftFloat,false,false,false,true,'');
  FSalario := CreateCmDbField('SALARIO',ftFloat,false,false,false,true,'');
  FIdProcesso := CreateCmDbField('IDPROCESSO',ftFloat,false,false,false,true,'');
  FIdFaixaCargo := CreateCmDbField('IDFAIXACARGO',ftFloat,false,false,false,true,'');
  FIdFaixaFuncao := CreateCmDbField('IDFAIXAFUNCAO',ftFloat,false,false,false,true,'');
  FNivelIndiv1 := CreateCmDbField('NIVELINDIV1',ftFloat,false,false,false,false,'');
  FNivelIndiv2 := CreateCmDbField('NIVELINDIV2',ftFloat,false,false,false,false,'');
  FTrgDtInclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,true,false,false,false,'', -1, true);
end;

end.
