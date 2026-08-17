{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 14/12/2001                                 }
{                                                       }
{*******************************************************}

unit uDbGrpObjProcJur;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbGrpObjProcJur = class(TCmDbObject)
  private
    FIdGrupoObjeto: TCmDbField;
    FDescricao: TCmDbField;
    FClasseObj: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdGrupoObjeto: TCmDbField read FIdGrupoObjeto write FIdGrupoObjeto;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property ClasseObj: TCmDbField read FClasseObj write FClasseObj;
  end;

implementation

{ TDbGrpObjProcJur }

constructor TDbGrpObjProcJur.Create(AOwner: TCmCustomCdbObject); 
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'GRPOBJPROCJUR';

  FIdGrupoObjeto := CreateCmDbField('IDGRUPOOBJETO',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
  FClasseObj := CreateCmDbField('CLASSEOBJ',ftString,true,false,false,false,'');
end;

end.
