{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 12/12/2001                                 }
{                                                       }
{*******************************************************}

unit uDbRubricaIndiv;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbRubricaIndiv = class(TCmDbObject)
  private
    FIdPessoa: TCmDbField;
    FIdEmpresa: TCmDbField;
    FIdRubrica: TCmDbField;
    FNumOcorrencias: TCmDbField;
    FSeqRubricaIndiv: TCmDbField;
    FIdFavorecido: TCmDbField;
    FIdRegraCalculo: TCmDbField;
    FValorRubrica: TCmDbField;
    FAnoMesInicio: TCmDbField;
    FFlgPermanente: TCmDbField;
    FParcelas: TCmDbField;
    FFlgTpRubManut: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property IdEmpresa: TCmDbField read FIdEmpresa write FIdEmpresa;
    property IdRubrica: TCmDbField read FIdRubrica write FIdRubrica;
    property NumOcorrencias: TCmDbField read FNumOcorrencias write FNumOcorrencias;
    property SeqRubricaIndiv: TCmDbField read FSeqRubricaIndiv write FSeqRubricaIndiv;
    property IdFavorecido: TCmDbField read FIdFavorecido write FIdFavorecido;
    property IdRegraCalculo: TCmDbField read FIdRegraCalculo write FIdRegraCalculo;
    property ValorRubrica: TCmDbField read FValorRubrica write FValorRubrica;
    property AnoMesInicio: TCmDbField read FAnoMesInicio write FAnoMesInicio;
    property FlgPermanente: TCmDbField read FFlgPermanente write FFlgPermanente;
    property Parcelas: TCmDbField read FParcelas write FParcelas;
    property FlgTpRubManut: TCmDbField read FFlgTpRubManut write FFlgTpRubManut;
  end;

implementation

{ TDbRubricaIndiv }

constructor TDbRubricaIndiv.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'RUBRICAINDIV';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,false,'');
  FIdEmpresa := CreateCmDbField('IDEMPRESA',ftFloat,true,true,false,false,'');
  FIdRubrica := CreateCmDbField('IDRUBRICA',ftFloat,true,true,false,false,'');
  FNumOcorrencias := CreateCmDbField('NUMOCORRENCIAS',ftString,true,false,false,false,'');
  FSeqRubricaIndiv := CreateCmDbField('SEQRUBRICAINDIV',ftFloat,true,true,false,false,'');
  FIdFavorecido := CreateCmDbField('IDFAVORECIDO',ftFloat,false,false,false,true,'');
  FIdRegraCalculo := CreateCmDbField('IDREGRACALCULO',ftFloat,false,false,false,true,'');
  FValorRubrica := CreateCmDbField('VALORRUBRICA',ftFloat,false,false,false,false,'');
  FAnoMesInicio := CreateCmDbField('ANOMESINICIO',ftString,false,false,false,true,'');
  FFlgPermanente := CreateCmDbField('FLGPERMANENTE',ftString,true,false,false,false,'');
  FParcelas := CreateCmDbField('PARCELAS',ftFloat,false,false,false,false,'');
  FFlgTpRubManut := CreateCmDbField('FLGTPRUBMANUT',ftString,false,false,false,true,'');
end;

end.
