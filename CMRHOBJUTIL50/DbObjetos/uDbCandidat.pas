{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 30/09/2002                                 }
{                                                       }
{*******************************************************}

unit uDbCandidat;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB;

type
  TDbCandidat = class(TCmDbObject)
  private
    FTipoPagamento: TCmDbField;
    FDatUltAtu: TCmDbField;
    FTipoContrato: TCmDbField;
    FSalario: TCmDbField;
    FIdPessoa: TCmDbField;
    FDat_Admis: TCmDbField;
    FSituacao: TCmDbField;
    FIdCargo: TCmDbField;
    FDatInclu: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property IdCargo: TCmDbField read FIdCargo write FIdCargo;
    property DatUltAtu: TCmDbField read FDatUltAtu write FDatUltAtu;
    property DatInclu: TCmDbField read FDatInclu write FDatInclu;
    property Dat_Admis: TCmDbField read FDat_Admis write FDat_Admis;
    property TipoPagamento: TCmDbField read FTipoPagamento write FTipoPagamento;
    property TipoContrato: TCmDbField read FTipoContrato write FTipoContrato;
    property Situacao: TCmDbField read FSituacao write FSituacao;
    property Salario: TCmDbField read FSalario write FSalario;
  end;

implementation

{ TDbCandidat }

constructor TDbCandidat.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'CANDIDAT';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,true,'');
  FIdCargo := CreateCmDbField('IDCARGO',ftFloat,false,false,false,true,'');
  FDatUltAtu := CreateCmDbField('DATULTATU',ftDateTime,false,false,false,true,'');
  FDatInclu := CreateCmDbField('DATINCLU',ftDateTime,true,false,false,true,'');
  FDat_Admis := CreateCmDbField('DAT_ADMIS',ftDateTime,false,false,false,true,'');
  FTipoPagamento := CreateCmDbField('TIPOPAGAMENTO',ftString,false,false,false,true,'');
  FTipoContrato := CreateCmDbField('TIPOCONTRATO',ftString,true,false,false,true,'');
  FSituacao := CreateCmDbField('SITUACAO',ftString,false,false,false,true,'');
  FSalario := CreateCmDbField('SALARIO',ftFloat,false,false,false,true,'');
end;

end.
