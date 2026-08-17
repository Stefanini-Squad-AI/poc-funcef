{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbTipoProcesso;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbTipoProcesso = class(TCmDbObject)
  private
    FIdTipoProc: TCmDbField;
    FNomeTipoProc: TCmDbField;
    FProcFixo: TCmDbField;
    FFlgExigeCCusto: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdTipoProc: TCmDbField read FIdTipoProc write FIdTipoProc;
    property NomeTipoProc: TCmDbField read FNomeTipoProc write FNomeTipoProc;
    property ProcFixo: TCmDbField read FProcFixo write FProcFixo;
    property FlgExigeCCusto: TCmDbField read FFlgExigeCCusto write FFlgExigeCCusto;
  end;

implementation

{ TDbTipoProcesso }

constructor TDbTipoProcesso.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TIPOPROCESSO';

  FIdTipoProc := CreateCmDbField('IDTIPOPROC',ftFloat,true,true,false,false,'');
  FNomeTipoProc := CreateCmDbField('NOMETIPOPROC',ftString,true,false,false,false,'');
  FProcFixo := CreateCmDbField('PROCFIXO',ftFloat,false,false,false,false,'');
  FFlgExigeCCusto := CreateCmDbField('FLGEXIGECCUSTO',ftFloat,false,false,false,false,'');
end;

function TDbTipoProcesso.Insert: boolean;
begin
  FIdTipoProc.asFloat := GetSequence('TIPOPROCESSO');
  Result := inherited Insert;
end;

end.
