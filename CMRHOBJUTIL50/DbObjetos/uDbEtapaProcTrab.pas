{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 14/11/2002                                 }
{                                                       }
{*******************************************************}

unit uDbEtapaProcTrab;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbEtapaProcTrab = class(TCmDbObject)
  private
    FObservEtapa: TCmDbField;
    FCodTipoRecurso: TCmDbField;
    FNumSeq: TCmDbField;
    FNumProcTrab: TCmDbField;
    FAssunto: TCmDbField;
    FValorRec: TCmDbField;
    FDataRealOcor: TCmDbField;
    FDataPrevOcorr: TCmDbField;
    FIdImagem: TCmDbField;
    FFlgValorAbate: TCmDbField;
    FIndPenhora: TCmDbField;
    FIdBem: TCmDbField;
    FIdPessoa: TCmDbField;
    FIdImovel: TCmDbField;
    FIdConjunto: TCmDbField;
    FIdInvestimento: TCmDbField;
    FValor: TCmDbField;
    FIndValor: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property NumProcTrab: TCmDbField read FNumProcTrab write FNumProcTrab;
    property NumSeq: TCmDbField read FNumSeq write FNumSeq;
    property DataPrevOcorr: TCmDbField read FDataPrevOcorr write FDataPrevOcorr;
    property DataRealOcor: TCmDbField read FDataRealOcor write FDataRealOcor;
    property Assunto: TCmDbField read FAssunto write FAssunto;
    property CodTipoRecurso: TCmDbField read FCodTipoRecurso write FCodTipoRecurso;
    property IdImagem: TCmDbField read FIdImagem write FIdImagem;
    property ValorRec: TCmDbField read FValorRec write FValorRec;
    property ObservEtapa: TCmDbField read FObservEtapa write FObservEtapa;
    property FlgValorAbate: TCmDbField read FFlgValorAbate write FFlgValorAbate;
    property IndPenhora: TCmDbField read FIndPenhora write FIndPenhora;
    property IdBem: TCmDbField read FIdBem write FIdBem;
    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property IdImovel: TCmDbField read FIdImovel write FIdImovel;
    property IdConjunto: TCmDbField read FIdConjunto write FIdConjunto;
    property IdInvestimento: TCmDbField read FIdInvestimento write FIdInvestimento;
    property Valor: TCmDbField read FValor write FValor;
    property IndValor: TCmDbField read FIndValor write FIndValor;
  end;

implementation

{ TDbEtapaProcTrab }

constructor TDbEtapaProcTrab.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'ETAPAPROCTRAB';

  FNumProcTrab := CreateCmDbField('NUMPROCTRAB',ftFloat,true,true,false,true,'');
  FNumSeq := CreateCmDbField('NUMSEQ',ftFloat,true,true,false,true,'');
  FDataPrevOcorr := CreateCmDbField('DATAPREVOCORR',ftDateTime,false,false,false,true,'');
  FDataRealOcor := CreateCmDbField('DATAREALOCOR',ftDateTime,false,false,false,true,'',-1,true);
  FAssunto := CreateCmDbField('ASSUNTO',ftString,true,false,false,true,'');
  FCodTipoRecurso := CreateCmDbField('CODTIPORECURSO',ftFloat,false,false,false,true,'');
  FIdImagem := CreateCmDbField('IDIMAGEM',ftFloat,false,false,false,true,'');
  FValorRec := CreateCmDbField('VALORREC',ftFloat,false,false,false,false,'');
  FObservEtapa := CreateCmDbField('OBSERVETAPA',ftBlob,false,false,false,true,'');
  FFlgValorAbate := CreateCmDbField('FLGVALORABATE',ftFloat,false,false,false,false,'');
  FIndPenhora := CreateCmDbField('INDPENHORA',ftFloat,false,false,false,false,'');
  FIdBem := CreateCmDbField('IDBEM',ftFloat,false,false,false,true,'');
  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,false,false,false,true,'');
  FIdImovel := CreateCmDbField('IDIMOVEL',ftFloat,false,false,false,true,'');
  FIdConjunto := CreateCmDbField('IDCONJUNTO',ftFloat,false,false,false,true,'');
  FIdInvestimento := CreateCmDbField('IDINVESTIMENTO',ftFloat,false,false,false,true,'');
  FValor := CreateCmDbField('VALOR',ftFloat,false,false,false,false,'');
  FIndValor := CreateCmDbField('INDVALOR',ftFloat,false,false,false,false,'');
end;

end.
