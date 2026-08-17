{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 24/06/2002                                 }
{                                                       }
{*******************************************************}

unit uDbHstAval;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbHstAval = class(TCmDbObject)
  private
    FDataPlan: TCmDbField;
    FIdPessoa: TCmDbField;
    FNumSeq: TCmDbField;
    FMetas: TCmDbField;
    FObservAval: TCmDbField;
    FLimitacoes: TCmDbField;
    FDataReal: TCmDbField;
    FCodTipoAval: TCmDbField;
    FAvaliador: TCmDbField;
    FAvaliacao: TCmDbField;
    FFortes: TCmDbField;
    FResumo: TCmDbField;
    FFracos: TCmDbField;
    FComent: TCmDbField;
    FMedidas: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property NumSeq: TCmDbField read FNumSeq write FNumSeq;
    property Resumo: TCmDbField read FResumo write FResumo;
    property ObservAval: TCmDbField read FObservAval write FObservAval;
    property Metas: TCmDbField read FMetas write FMetas;
    property Medidas: TCmDbField read FMedidas write FMedidas;
    property Limitacoes: TCmDbField read FLimitacoes write FLimitacoes;
    property Fracos: TCmDbField read FFracos write FFracos;
    property Fortes: TCmDbField read FFortes write FFortes;
    property DataReal: TCmDbField read FDataReal write FDataReal;
    property DataPlan: TCmDbField read FDataPlan write FDataPlan;
    property Coment: TCmDbField read FComent write FComent;
    property CodTipoAval: TCmDbField read FCodTipoAval write FCodTipoAval;
    property Avaliador: TCmDbField read FAvaliador write FAvaliador;
    property Avaliacao: TCmDbField read FAvaliacao write FAvaliacao;
  end;

implementation

{ TDbHstAval }

constructor TDbHstAval.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'HSTAVAL';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,false,'');
  FNumSeq := CreateCmDbField('NUMSEQ',ftFloat,true,true,false,false,'');
  FResumo := CreateCmDbField('RESUMO',ftString,false,false,false,true,'');
  FObservAval := CreateCmDbField('OBSERVAVAL',ftString,false,false,false,true,'');
  FMetas := CreateCmDbField('METAS',ftString,false,false,false,true,'');
  FMedidas := CreateCmDbField('MEDIDAS',ftString,false,false,false,true,'');
  FLimitacoes := CreateCmDbField('LIMITACOES',ftString,false,false,false,true,'');
  FFracos := CreateCmDbField('FRACOS',ftString,false,false,false,true,'');
  FFortes := CreateCmDbField('FORTES',ftString,false,false,false,true,'');
  FDataReal := CreateCmDbField('DATAREAL',ftDateTime,false,false,false,false,'');
  FDataPlan := CreateCmDbField('DATAPLAN',ftDateTime,false,false,false,false,'');
  FComent := CreateCmDbField('COMENT',ftBlob,false,false,false,false,'');
  FCodTipoAval := CreateCmDbField('CODTIPOAVAL',ftFloat,true,true,false,false,'');
  FAvaliador := CreateCmDbField('AVALIADOR',ftString,false,false,false,true,'');
  FAvaliacao := CreateCmDbField('AVALIACAO',ftFloat,false,false,false,false,'');
end;

end.
