{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 25/06/2002                                 }
{                                                       }
{*******************************************************}

unit uDbLayoutXColunas;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB;

type
  TDbLayoutXColunas = class(TCmDbObject)
  private
    FTamValInfo: TCmDbField;
    FIdFavorecido: TCmDbField;
    FIdLayout: TCmDbField;
    FColValor: TCmDbField;
    FColOperacao: TCmDbField;
    FColParcelas: TCmDbField;
    FColNatureza: TCmDbField;
    FUnidNegoc: TCmDbField;
    FNumDecimais: TCmDbField;
    FPlaContaC: TCmDbField;
    FPlaContaD: TCmDbField;
    FCodTipRecDes: TCmDbField;
    FTamValor: TCmDbField;
    FCodCentroRespon: TCmDbField;
    FColOcorrencias: TCmDbField;
    FTamParcelas: TCmDbField;
    FTamOcorrencias: TCmDbField;
    FIdRegra: TCmDbField;
    FRecPag: TCmDbField;
    FColMesRef: TCmDbField;
    FCaracNatureza: TCmDbField;
    FIdRubricaDevol: TCmDbField;
    FColRubrica: TCmDbField;
    FIdRubrica: TCmDbField;
    FPlano: TCmDbField;
    FIdEmpresa: TCmDbField;
    FCodCentroCusto: TCmDbField;
    FCaracDecimal: TCmDbField;
    FColValInfo: TCmDbField;
    FTamRubrica: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdLayout: TCmDbField read FIdLayout write FIdLayout;
    property ColValor: TCmDbField read FColValor write FColValor;
    property TamValor: TCmDbField read FTamValor write FTamValor;
    property UnidNegoc: TCmDbField read FUnidNegoc write FUnidNegoc;
    property TamValInfo: TCmDbField read FTamValInfo write FTamValInfo;
    property TamRubrica: TCmDbField read FTamRubrica write FTamRubrica;
    property TamParcelas: TCmDbField read FTamParcelas write FTamParcelas;
    property TamOcorrencias: TCmDbField read FTamOcorrencias write FTamOcorrencias;
    property RecPag: TCmDbField read FRecPag write FRecPag;
    property Plano: TCmDbField read FPlano write FPlano;
    property PlaContaD: TCmDbField read FPlaContaD write FPlaContaD;
    property PlaContaC: TCmDbField read FPlaContaC write FPlaContaC;
    property NumDecimais: TCmDbField read FNumDecimais write FNumDecimais;
    property IdRubricaDevol: TCmDbField read FIdRubricaDevol write FIdRubricaDevol;
    property IdRubrica: TCmDbField read FIdRubrica write FIdRubrica;
    property IdRegra: TCmDbField read FIdRegra write FIdRegra;
    property IdFavorecido: TCmDbField read FIdFavorecido write FIdFavorecido;
    property IdEmpresa: TCmDbField read FIdEmpresa write FIdEmpresa;
    property ColValInfo: TCmDbField read FColValInfo write FColValInfo;
    property ColRubrica: TCmDbField read FColRubrica write FColRubrica;
    property ColParcelas: TCmDbField read FColParcelas write FColParcelas;
    property ColOperacao: TCmDbField read FColOperacao write FColOperacao;
    property ColOcorrencias: TCmDbField read FColOcorrencias write FColOcorrencias;
    property ColNatureza: TCmDbField read FColNatureza write FColNatureza;
    property ColMesRef: TCmDbField read FColMesRef write FColMesRef;
    property CodTipRecDes: TCmDbField read FCodTipRecDes write FCodTipRecDes;
    property CodCentroRespon: TCmDbField read FCodCentroRespon write FCodCentroRespon;
    property CodCentroCusto: TCmDbField read FCodCentroCusto write FCodCentroCusto;
    property CaracNatureza: TCmDbField read FCaracNatureza write FCaracNatureza;
    property CaracDecimal: TCmDbField read FCaracDecimal write FCaracDecimal;
  end;

implementation

{ TDbLayoutXColunas }

constructor TDbLayoutXColunas.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'LAYOUTXCOLUNAS';

  FIdLayout := CreateCmDbField('IDLAYOUT',ftFloat,true,true,false,false,'');
  FColValor := CreateCmDbField('COLVALOR',ftFloat,true,true,false,true,'');
  FTamValor := CreateCmDbField('TAMVALOR',ftFloat,true,false,false,true,'');
  FUnidNegoc := CreateCmDbField('UNIDNEGOC',ftFloat,false,false,false,true,'');
  FTamValInfo := CreateCmDbField('TAMVALINFO',ftFloat,false,false,false,true,'');
  FTamRubrica := CreateCmDbField('TAMRUBRICA',ftFloat,false,false,false,true,'');
  FTamParcelas := CreateCmDbField('TAMPARCELAS',ftFloat,false,false,false,true,'');
  FTamOcorrencias := CreateCmDbField('TAMOCORRENCIAS',ftFloat,false,false,false,true,'');
  FRecPag := CreateCmDbField('RECPAG',ftString,false,false,false,true,'');
  fPlano := CreateCmDbField('PLANO',ftFloat,false,false,false,true,'');
  FPlaContaD := CreateCmDbField('PLACONTAD',ftString,false,false,false,true,'');
  FPlaContaC := CreateCmDbField('PLACONTAC',ftString,false,false,false,true,'');
  FNumDecimais := CreateCmDbField('NUMDECIMAIS',ftFloat,false,false,false,true,'');
  FIdRubricaDevol := CreateCmDbField('IDRUBRICADEVOL',ftFloat,false,false,false,true,'');
  FIdRubrica := CreateCmDbField('IDRUBRICA',ftFloat,false,false,false,true,'');
  FIdRegra := CreateCmDbField('IDREGRA',ftFloat,false,false,false,true,'');
  FIdFavorecido := CreateCmDbField('IDFAVORECIDO',ftFloat,false,false,false,true,'');
  FIdEmpresa := CreateCmDbField('IDEMPRESA',ftFloat,false,false,false,true,'');
  FColValInfo := CreateCmDbField('COLVALINFO',ftFloat,false,false,false,true,'');
  FColRubrica := CreateCmDbField('COLRUBRICA',ftFloat,false,false,false,true,'');
  FColParcelas := CreateCmDbField('COLPARCELAS',ftFloat,false,false,false,true,'');
  FColOperacao := CreateCmDbField('COLOPERACAO',ftFloat,false,false,false,true,'');
  FColOcorrencias := CreateCmDbField('COLOCORRENCIAS',ftFloat,false,false,false,true,'');
  FColNatureza := CreateCmDbField('COLNATUREZA',ftFloat,false,false,false,true,'');
  FColMesRef := CreateCmDbField('COLMESREF',ftString,false,false,false,true,'');
  FCodTipRecDes := CreateCmDbField('CODTIPRECDES',ftString,false,false,false,true,'');
  FCodCentroRespon := CreateCmDbField('CODCENTRORESPON',ftString,false,false,false,true,'');
  FCodCentroCusto := CreateCmDbField('CODCENTROCUSTO',ftString,false,false,false,true,'');
  FCaracNatureza := CreateCmDbField('CARACNATUREZA',ftString,false,false,false,true,'');
  FCaracDecimal := CreateCmDbField('CARACDECIMAL',ftString,false,false,false,true,'');
end;

end.
