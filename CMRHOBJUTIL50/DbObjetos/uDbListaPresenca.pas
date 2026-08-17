{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 30/12/2002                                 }
{                                                       }
{*******************************************************}

unit uDbListaPresenca;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbListaPresenca = class(TCmDbObject)
  private
    FIdPessoa: TCmDbField;
    FIdCurso: TCmDbField;
    FNumSeq: TCmDbField;
    FDataPresenca: TCmDbField;
    FFlgSemAula: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property IdCurso: TCmDbField read FIdCurso write FIdCurso;
    property NumSeq: TCmDbField read FNumSeq write FNumSeq;
    property DataPresenca: TCmDbField read FDataPresenca write FDataPresenca;
    property FlgSemAula: TCmDbField read FFlgSemAula write FFlgSemAula;
  end;

implementation

{ TDbListaPresenca }

constructor TDbListaPresenca.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'LISTAPRESENCA';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,true,'');
  FNumSeq := CreateCmDbField('NUMSEQ',ftFloat,true,true,false,true,'');
  FIdCurso := CreateCmDbField('IDCURSO',ftFloat,true,true,false,true,'');
  FDataPresenca := CreateCmDbField('DATAPRESENCA',ftDateTime,true,true,false,true,'');
  FFlgSemAula := CreateCmDbField('FLGSEMAULA',ftFloat,false,false,false,false,'');
end;

end.
