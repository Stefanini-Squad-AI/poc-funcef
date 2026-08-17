{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Eugênio Frioli                  }
{ Criado Em: 20/03/2007                                 }
{                                                       }
{*******************************************************}

unit uDbHstProcTrab;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbHstProcTrab = class(TCmDbObject)
  private
    FIdHstProcTrab: TCmDbField;
    FNumProcTrab: TCmDbField;
    FIdTipoProc: TCmDbField;
    FIdVaraJustica: TCmDbField;
    FFlgParteAtiva: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdHstProcTrab: TCmDbField read FIdHstProcTrab write FIdHstProcTrab;
    property NumProcTrab: TCmDbField read FNumProcTrab write FNumProcTrab;
    property IdVaraJustica: TCmDbField read FIdVaraJustica write FIdVaraJustica;
    property IdTipoProc: TCmDbField read FIdTipoProc write FIdTipoProc;
    property FlgParteAtiva: TCmDbField read FFlgParteAtiva write FFlgParteAtiva;
  end;

implementation

{ TDbHstProcTrab }

constructor TDbHstProcTrab.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'HSTPROCTRAB';

  FIdHstProcTrab := CreateCmDbField('IDHSTPROCTRAB',ftFloat,false,false,false,true,'');
  FNumProcTrab := CreateCmDbField('NUMPROCTRAB',ftFloat,true,true,false,false,'');
  FIdVaraJustica := CreateCmDbField('IDVARAJUSTICA',ftFloat,false,false,false,true,'');
  FIdTipoProc := CreateCmDbField('IDTIPOPROC',ftFloat,false,false,false,true,'');
  FFlgParteAtiva := CreateCmDbField('FLGPARTEATIVA',ftFloat,false,false,false,false,'');
end;

function TDbHstProcTrab.Insert: boolean;
begin
  FIdHstProcTrab.asFloat := GetSequence('HSTPROCTRAB');
  Result := inherited Insert;
end;

end.
