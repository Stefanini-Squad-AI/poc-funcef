{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 02/12/2002                                 }
{                                                       }
{*******************************************************}

unit uDbAvalCurso;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDbAvalCurso = class(TCmDbObject)
  private
    FAvalCurso: TCmDbField;
    FNumSeq: TCmDbField;
    FIdFatorAval: TCmDbField;
    FIdCurso: TCmDbField;
    FIdPessoa: TCmDbField;
    FObservacao: TCmDbField;
    FFlgCursoAluno: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property IdFatorAval: TCmDbField read FIdFatorAval write FIdFatorAval;
    property IdCurso: TCmDbField read FIdCurso write FIdCurso;
    property NumSeq: TCmDbField read FNumSeq write FNumSeq;
    property AvalCurso: TCmDbField read FAvalCurso write FAvalCurso;
    property Observacao: TCmDbField read FObservacao write FObservacao;
    property FlgCursoAluno: TCmDbField read FFlgCursoAluno write FFlgCursoAluno;
  end;

implementation

{ TDbAvalCurso }

constructor TDbAvalCurso.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'AVALCURSO';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,true,'');
  FIdFatorAval := CreateCmDbField('IDFATORAVAL',ftFloat,true,true,false,true,'');
  FIdCurso := CreateCmDbField('IDCURSO',ftFloat,true,true,false,true,'');
  FNumSeq := CreateCmDbField('NUMSEQ',ftFloat,true,true,false,true,'');
  FAvalCurso := CreateCmDbField('AVALCURSO',ftFloat,false,false,false,false,'');
  FFlgCursoAluno := CreateCmDbField('FLGCURSOALUNO',ftFloat,false,false,false,false,'');
  FObservacao := CreateCmDbField('OBSERVACAO',ftString,false,false,false,true,'');
end;

end.
