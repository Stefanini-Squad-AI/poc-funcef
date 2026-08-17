{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Atualizado Em: 26/11/2002                             }
{                                                       }
{*******************************************************}

unit uDbHoraTrabOutroCC;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDbHoraTrabOutroCC = class(TCmDbObject)
  private
    FFlgRateio: TCmDbField;
    FIdPessoa: TCmDbField;
    FHorasTrab: TCmDbField;
    FNumSeq: TCmDbField;
    FIdEmpresa: TCmDbField;
    FCodCentroCusto: TCmDbField;
    FDataTrab: TCmDbField;
    FFlgPermanente: TCmDbField;
    FFlgCargaTotal: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property NumSeq: TCmDbField read FNumSeq write FNumSeq;
    property IdEmpresa: TCmDbField read FIdEmpresa write FIdEmpresa;
    property CodCentroCusto: TCmDbField read FCodCentroCusto write FCodCentroCusto;
    property HorasTrab: TCmDbField read FHorasTrab write FHorasTrab;
    property FlgRateio: TCmDbField read FFlgRateio write FFlgRateio;
    property DataTrab: TCmDbField read FDataTrab write FDataTrab;
    property FlgPermanente: TCmDbField read FFlgPermanente write FFlgPermanente;
    property FlgCargaTotal: TCmDbField read FFlgCargaTotal write FFlgCargaTotal;
  end;

implementation

{ TDbHoraTrabOutroCC }

constructor TDbHoraTrabOutroCC.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'HORATRABOUTROCC';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,true,'');
  FNumSeq := CreateCmDbField('NUMSEQ',ftFloat,true,true,false,true,'');
  FIdEmpresa := CreateCmDbField('IDEMPRESA',ftFloat,false,false,false,true,'');
  FCodCentroCusto := CreateCmDbField('CODCENTROCUSTO',ftString,false,false,false,true,'');
  FHorasTrab := CreateCmDbField('HORASTRAB',ftFloat,false,false,false,false,'');
  FFlgRateio := CreateCmDbField('FLGRATEIO',ftFloat,false,false,false,false,'');
  FDataTrab := CreateCmDbField('DATATRAB',ftDateTime,false,false,false,true,'');
  FFlgPermanente := CreateCmDbField('FLGPERMANENTE',ftFloat,false,false,false,false,'');
  FFlgCargaTotal := CreateCmDbField('FLGCARGATOTAL',ftFloat,false,false,false,false,'');
end;

function TDbHoraTrabOutroCC.Insert: boolean;
begin
  FNumSeq.asFloat := GetSequence('HORATRABOUTROCC');
  Result := inherited Insert;
end;

end.
