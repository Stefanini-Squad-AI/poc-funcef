{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 03/06/2002                                 }
{                                                       }
{*******************************************************}

unit uDbFatorAvalCurso;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbFatorAvalCurso = class(TCmDbObject)
  private
    FIdFatorAval: TCmDbField;
    FDescricao: TCmDbField;
    FFlgAvalCurso: TCmDbField;
    FIndAplicacao: TCmDbField;
    FObservacao: TCmDbField;
    FIdEscalaConceitos: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdFatorAval: TCmDbField read FIdFatorAval write FIdFatorAval;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property FlgAvalCurso: TCmDbField read FFlgAvalCurso write FFlgAvalCurso;
    property IndAplicacao: TCmDbField read FIndAplicacao write FIndAplicacao;
    property Observacao: TCmDbField read FObservacao write FObservacao;
    property IdEscalaConceitos: TCmDbField read FIdEscalaConceitos write FIdEscalaConceitos;
  end;

implementation

{ TDbFatorAvalCurso }

constructor TDbFatorAvalCurso.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'FATORAVALCURSO';

  FIdFatorAval := CreateCmDbField('IDFATORAVAL',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,true,'');
  FFlgAvalCurso := CreateCmDbField('FLGAVALCURSO',ftInteger,false,false,false,false,'');
  FIndAplicacao := CreateCmDbField('INDAPLICACAO',ftInteger,false,false,false,false,'');
  FObservacao := CreateCmDbField('OBSERVACAO',ftString,false,false,false,true,'');
  IdEscalaConceitos := CreateCmDbField('IDESCALACONCEITOS',ftFloat,false,false,false,true,'');
end;

function TDbFatorAvalCurso.Insert: boolean;
begin
  FIdFatorAval.asFloat := GetSequence('FATORAVALCURSO');
  Result := inherited Insert;
end;

end.
