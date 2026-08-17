{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 31/01/2002                                 }
{                                                       }
{*******************************************************}

unit uDbHoraTrab;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbHoraTrab = class(TCmDbObject)
  private
    FIdHorario: TCmDbField;
    FNomeHorario: TCmDbField;
    FFlgTipoHorario: TCmDbField;
    FJornadaMensal: TCmDbField;
    FHorasServico: TCmDbField;
    FHorasFolga1: TCmDbField;
    FHorasFolga2: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdHorario: TCmDbField read FIdHorario write FIdHorario;
    property NomeHorario: TCmDbField read FNomeHorario write FNomeHorario;
    property FlgTipoHorario: TCmDbField read FFlgTipoHorario write FFlgTipoHorario;
    property JornadaMensal: TCmDbField read FJornadaMensal write FJornadaMensal;
    property HorasServico: TCmDbField read FHorasServico write FHorasServico;
    property HorasFolga1: TCmDbField read FHorasFolga1 write FHorasFolga1;
    property HorasFolga2: TCmDbField read FHorasFolga2 write FHorasFolga2;
  end;

implementation

{ TDbHoraTrab }

constructor TDbHoraTrab.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'HORATRAB';

  FIdHorario := CreateCmDbField('IDHORARIO',ftFloat,true,true,false,false,'');
  FNomeHorario := CreateCmDbField('NOMEHORARIO',ftString,true,false,false,false,'');
  FFlgTipoHorario := CreateCmDbField('FLGTIPOHORARIO',ftFloat,true,false,false,false,'');
  FJornadaMensal := CreateCmDbField('JORNADAMENSAL',ftFloat,false,false,false,true,'');
  FHorasServico := CreateCmDbField('HORASSERVICO',ftFloat,false,false,false,true,'');
  FHorasFolga1 := CreateCmDbField('HORASFOLGA1',ftFloat,false,false,false,true,'');
  FHorasFolga2 := CreateCmDbField('HORASFOLGA2',ftFloat,false,false,false,true,'');
end;

end.
