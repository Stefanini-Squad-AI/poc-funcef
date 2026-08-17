{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugênio Frioli                  }
{ Atualizado Em: 26/07/2004                             }
{                                                       }
{*******************************************************}

unit uDbHorarioVariavel;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbHorarioVariavel = class(TCmDbObject)
  private
    FIdHorarioVariavel: TCmDbField;
    FIdPessoa: TCmDbField;
    FIdHorario: TCmDbField;
    FDataIni: TCmDbField;
    FDataFim: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdHorarioVariavel: TCmDbField read FIdHorarioVariavel write FIdHorarioVariavel;
    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property IdHorario: TCmDbField read FIdHorario write FIdHorario;
    property DataIni: TCmDbField read FDataIni write FDataIni;
    property DataFim: TCmDbField read FDataFim write FDataFim;
  end;

implementation

{ TDbHoraTrabOutroCC }

constructor TDbHorarioVariavel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'HORARIOVARIAVEL';

  FIdHorarioVariavel := CreateCmDbField('IDHORARIOVARIAVEL',ftFloat,true,true,false,true,'');
  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,false,false,true,'');
  FIdHorario := CreateCmDbField('IDHORARIO',ftFloat,true,false,false,true,'');
  FDataIni := CreateCmDbField('DATAINI',ftDateTime,true,false,false,true,'');
  FDataIni := CreateCmDbField('DATAFIM',ftDateTime,true,false,false,true,'');
end;

function TDbHorarioVariavel.Insert: boolean;
begin
  FIdHorarioVariavel.asFloat := GetSequence('HORARIOVARIAVEL');
  Result := inherited Insert;
end;

end.
