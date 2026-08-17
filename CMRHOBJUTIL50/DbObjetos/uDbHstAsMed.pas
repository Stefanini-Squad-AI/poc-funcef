{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 30/09/2002                                 }
{                                                       }
{*******************************************************}

unit uDbHstAsMed;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB;

type
  TDbHstAsMed = class(TCmDbObject)
  private
    FDataReal: TCmDbField;
    FExaminador: TCmDbField;
    FAvaliacao: TCmDbField;
    FIdExaminador: TCmDbField;
    FDataPlan: TCmDbField;
    FNumSeq: TCmDbField;
    FCodCID: TCmDbField;
    FObservacao: TCmDbField;
    FIdPessoa: TCmDbField;
    FLicenca: TCmDbField;
    FCodTipoOcMed: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property CodTipoOcMed: TCmDbField read FCodTipoOcMed write FCodTipoOcMed;
    property NumSeq: TCmDbField read FNumSeq write FNumSeq;
    property IdExaminador: TCmDbField read FIdExaminador write FIdExaminador;
    property Examinador: TCmDbField read FExaminador write FExaminador;
    property DataReal: TCmDbField read FDataReal write FDataReal;
    property DataPlan: TCmDbField read FDataPlan write FDataPlan;
    property CodCID: TCmDbField read FCodCID write FCodCID;
    property Licenca: TCmDbField read FLicenca write FLicenca;
    property Avaliacao: TCmDbField read FAvaliacao write FAvaliacao;
    property Observacao: TCmDbField read FObservacao write FObservacao;
  end;

implementation

{ TDbHstAsMed }

constructor TDbHstAsMed.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'HSTASMED';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,true,'');
  FCodTipoOcMed := CreateCmDbField('CODTIPOOCMED',ftFloat,true,true,false,true,'');
  FNumSeq := CreateCmDbField('NUMSEQ',ftFloat,true,true,false,true,'');
  FIdExaminador := CreateCmDbField('IDEXAMINADOR',ftFloat,false,false,false,true,'');
  FExaminador := CreateCmDbField('EXAMINADOR',ftString,false,false,false,true,'');
  FDataPlan := CreateCmDbField('DATAPLAN',ftDateTime,false,false,false,true,'',-1,true);
  FDataReal := CreateCmDbField('DATAREAL',ftDateTime,false,false,false,true,'');
  FCodCID := CreateCmDbField('CODCID',ftString,false,false,false,true,'');
  FAvaliacao := CreateCmDbField('AVALIACAO',ftFloat,false,false,false,true,'');
  FLicenca := CreateCmDbField('LICENCA',ftFloat,false,false,false,true,'');
  FObservacao := CreateCmDbField('OBSERVACAO',ftBlob,false,false,false,true,'');
end;

end.
