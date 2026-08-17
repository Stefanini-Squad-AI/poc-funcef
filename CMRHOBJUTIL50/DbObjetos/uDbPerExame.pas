{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 26/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbPerExame;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbPerExame = class(TCmDbObject)
  private
    FIdCargo: TCmDbField;
    FCodTipoOcMed: TCmDbField;
    FCodCentroCusto: TCmDbField;
    FNumSeq: TCmDbField;
    FPeriodo: TCmDbField;
    FLimSuperior: TCmDbField;
    FLimInferior: TCmDbField;
    FIndTempo: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property CodTipoOcMed: TCmDbField read FCodTipoOcMed write FCodTipoOcMed;
    property NumSeq: TCmDbField read FNumSeq write FNumSeq;
    property IdCargo: TCmDbField read FIdCargo write FIdCargo;
    property CodCentroCusto: TCmDbField read FCodCentroCusto write FCodCentroCusto;
    property Periodo: TCmDbField read FPeriodo write FPeriodo;
    property LimSuperior: TCmDbField read FLimSuperior write FLimSuperior;
    property LimInferior: TCmDbField read FLimInferior write FLimInferior;
    property IndTempo: TCmDbField read FIndTempo write FIndTempo;
  end;

implementation

{ TDbPerExame }

constructor TDbPerExame.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'PEREXAME';

  FCodTipoOcMed := CreateCmDbField('CODTIPOOCMED',ftFloat,true,true,false,false,'');
  FNumSeq := CreateCmDbField('NUMSEQ',ftFloat,true,true,false,false,'');
  FIdCargo := CreateCmDbField('IDCARGO',ftFloat,false,false,false,true,'');
  FCodCentroCusto := CreateCmDbField('CODCENTROCUSTO',ftString,false,false,false,false,'');
  FPeriodo := CreateCmDbField('PERIODO',ftFloat,false,false,false,false,'');
  FLimSuperior := CreateCmDbField('LIMSUPERIOR',ftFloat,false,false,false,false,'');
  FLimInferior := CreateCmDbField('LIMINFERIOR',ftFloat,false,false,false,false,'');
  FIndTempo := CreateCmDbField('INDTEMPO',ftFloat,false,false,false,false,'');
end;

end.
