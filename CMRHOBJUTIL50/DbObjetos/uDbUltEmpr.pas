{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 13/12/2002                                 }
{                                                       }
{*******************************************************}

unit uDbUltEmpr;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbUltEmpr = class(TCmDbObject)
  private
    FEmpresa: TCmDbField;
    FNumSeq: TCmDbField;
    FDat_Admis: TCmDbField;
    FIdCargo: TCmDbField;
    FUltSalario: TCmDbField;
    FIdMotivo: TCmDbField;
    FDataDem: TCmDbField;
    FObservacao: TCmDbField;
    FIdPessoa: TCmDbField;
    FCargo: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property NumSeq: TCmDbField read FNumSeq write FNumSeq;
    property IdMotivo: TCmDbField read FIdMotivo write FIdMotivo;
    property IdCargo: TCmDbField read FIdCargo write FIdCargo;
    property Empresa: TCmDbField read FEmpresa write FEmpresa;
    property Dat_Admis: TCmDbField read FDat_Admis write FDat_Admis;
    property DataDem: TCmDbField read FDataDem write FDataDem;
    property Cargo: TCmDbField read FCargo write FCargo;
    property UltSalario: TCmDbField read FUltSalario write FUltSalario;
    property Observacao: TCmDbField read FObservacao write FObservacao;
  end;

implementation

{ TDbUltEmpr }

constructor TDbUltEmpr.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'ULTEMPR';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,false,'');  
  FNumSeq := CreateCmDbField('NUMSEQ',ftFloat,true,true,false,false,'');
  FIdMotivo := CreateCmDbField('IDMOTIVO',ftFloat,false,false,false,true,'');
  FIdCargo := CreateCmDbField('IDCARGO',ftFloat,false,false,false,true,'');
  FEmpresa := CreateCmDbField('EMPRESA',ftString,false,false,false,true,'');
  FDat_Admis := CreateCmDbField('DAT_ADMIS',ftDateTime,false,false,false,true,'');
  FDataDem := CreateCmDbField('DATADEM',ftDateTime,false,false,false,true,'');
  FCargo := CreateCmDbField('CARGO',ftString,false,false,false,true,'');
  FUltsalario := CreateCmDbField('ULTSALARIO',ftFloat,false,false,false,true,'');
  FObservacao := CreateCmDbField('OBSERVACAO',ftString,false,false,false,true,'');
end;

end.
