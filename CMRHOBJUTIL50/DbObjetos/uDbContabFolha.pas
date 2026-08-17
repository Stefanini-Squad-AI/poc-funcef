{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 11/07/2002                                 }
{                                                       }
{*******************************************************}

unit uDbContabFolha;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB;

type
  TDbContabFolha = class(TCmDbObject)
  private
    FIdEmpresaProp: TCmDbField;
    FIdProvento: TCmDbField;
    FCodTipRecDes: TCmDbField;
    FIdContabFolha: TCmDbField;
    FCodCentroRespon: TCmDbField;
    FCodCentroCusto: TCmDbField;
    FIdPessDebito: TCmDbField;
    FCodSubCredito: TCmDbField;
    FCodSubDebito: TCmDbField;
    FContaDebito: TCmDbField;
    FRecPag: TCmDbField;
    FUnidNegoc: TCmDbField;
    FContaCredito: TCmDbField;
    FIdPlano2: TCmDbField;
    FIdPlano1: TCmDbField;
    FIdPessCredito: TCmDbField;
    FIdFavorecido: TCmDbField;
    FIdEmpresa: TCmDbField;
    FHitCodHistDebito: TCmDbField;
    FHitCodHistCredito: TCmDbField;
    FFlgSubEmpregDeb: TCmDbField;
    FFlgSubEmpregCred: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); Override;

    function Insert: boolean; override;

    property IdContabFolha: TCmDbField read FIdContabFolha write FIdContabFolha;
    property IdProvento: TCmDbField read FIdProvento write FIdProvento;
    property UnidNegoc: TCmDbField read FUnidNegoc write FUnidNegoc;
    property RecPag: TCmDbField read FRecPag write FRecPag;
    property IdPlano1: TCmDbField read FIdPlano1 write FIdPlano1;
    property IdPlano2: TCmDbField read FIdPlano2 write FIdPlano2;
    property IdPessDebito: TCmDbField read FIdPessDebito write FIdPessDebito;
    property IdPessCredito: TCmDbField read FIdPessCredito write FIdPessCredito;
    property IdFavorecido: TCmDbField read FIdFavorecido write FIdFavorecido;
    property IdEmpresaProp: TCmDbField read FIdEmpresaProp write FIdEmpresaProp;
    property IdEmpresa: TCmDbField read FIdEmpresa write FIdEmpresa;
    property ContaDebito: TCmDbField read FContaDebito write FContaDebito;
    property ContaCredito: TCmDbField read FContaCredito write FContaCredito;
    property CodTipRecDes: TCmDbField read FCodTipRecDes write FCodTipRecDes;
    property CodSubDebito: TCmDbField read FCodSubDebito write FCodSubDebito;
    property CodSubCredito: TCmDbField read FCodSubCredito write FCodSubCredito;
    property CodCentroRespon: TCmDbField read FCodCentroRespon write FCodCentroRespon;
    property CodCentroCusto: TCmDbField read FCodCentroCusto write FCodCentroCusto;
    property HitCodHistDebito: TCmDbField read FHitCodHistDebito write FHitCodHistDebito;
    property HitCodHistCredito: TCmDbField read FHitCodHistCredito write FHitCodHistCredito;
    property FlgSubEmpregDeb: TCmDbField read FFlgSubEmpregDeb write FFlgSubEmpregDeb;
    property FlgSubEmpregCred: TCmDbField read FFlgSubEmpregCred write FFlgSubEmpregCred;
  end;

implementation

{ TDbContabFolha }

constructor TDbContabFolha.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'CONTABFOLHA';

  FIdContabFolha := CreateCmDbField('IDCONTABFOLHA',ftFloat,true,true,false,true,'');
  FIdProvento := CreateCmDbField('IDPROVENTO',ftFloat,false,false,false,true,'');
  FUnidNegoc := CreateCmDbField('UNIDNEGOC',ftFloat,false,false,false,true,'');
  FRecPag := CreateCmDbField('RECPAG',ftString,false,false,false,true,'');
  FIdPlano1 := CreateCmDbField('IDPLANO1',ftFloat,false,false,false,true,'');
  FIdPlano2 := CreateCmDbField('IDPLANO2',ftFloat,false,false,false,true,'');
  FIdPessDebito := CreateCmDbField('IDPESSDEBITO',ftFloat,false,false,false,true,'');
  FIdPessCredito := CreateCmDbField('IDPESSCREDITO',ftFloat,false,false,false,true,'');
  FIdFavorecido := CreateCmDbField('IDFAVORECIDO',ftFloat,false,false,false,true,'');
  FIdEmpresaProp := CreateCmDbField('IDEMPRESAPROP',ftFloat,false,false,false,true,'');
  FIdEmpresa := CreateCmDbField('IDEMPRESA',ftFloat,false,false,false,true,'');
  FContaDebito := CreateCmDbField('CONTADEBITO',ftString,false,false,false,true,'');
  FContaCredito := CreateCmDbField('CONTACREDITO',ftString,false,false,false,true,'');
  FCodTipRecDes := CreateCmDbField('CODTIPRECDES',ftString,false,false,false,true,'');
  FCodSubDebito := CreateCmDbField('CODSUBDEBITO',ftFloat,false,false,false,true,'');
  FCodSubCredito := CreateCmDbField('CODSUBCREDITO',ftFloat,false,false,false,true,'');
  FCodCentroRespon := CreateCmDbField('CODCENTRORESPON',ftString,false,false,false,true,'');
  FCodCentroCusto := CreateCmDbField('CODCENTROCUSTO',ftString,false,false,false,true,'');
  FHitCodHistDebito := CreateCmDbField('HITCODHISTDEBITO',ftString,false,false,false,true,'');
  FHitCodHistCredito := CreateCmDbField('HITCODHISTCREDITO',ftString,false,false,false,true,'');
  FFlgSubEmpregDeb := CreateCmDbField('FLGSUBEMPREGDEB',ftFloat,false,false,false,false,'');
  FFlgSubEmpregCred := CreateCmDbField('FLGSUBEMPREGCRED',ftFloat,false,false,false,false,'');
end;

function TDbContabFolha.Insert: boolean;
begin
  FIdContabFolha.asFloat := GetSequence('CONTABFOLHA');
  FRecPag.asString := 'P';
  Result := inherited Insert;
end;

end.
