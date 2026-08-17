{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Atualizado Em: 19/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbTipoObjProcTrab;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbTipoObjProcTrab = class(TCmDbObject)
  private
    FDescricao: TCmDbField;
    FIdGrupoObjeto: TCmDbField;
    FClasseObj: TCmDbField;
    FIdProvento: TCmDbField;
    FFlgProvDesc: TCmDbField;
    FCodTipoObjeto: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property CodTipoObjeto: TCmDbField read FCodTipoObjeto write FCodTipoObjeto;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property IdProvento: TCmDbField read FIdProvento write FIdProvento;
    property IdGrupoObjeto: TCmDbField read FIdGrupoObjeto write FIdGrupoObjeto;
    property FlgProvDesc: TCmDbField read FFlgProvDesc write FFlgProvDesc;
    property ClasseObj: TCmDbField read FClasseObj write FClasseObj;
  end;

implementation

{ TDbTipoObjProcTrab }

constructor TDbTipoObjProcTrab.Create(AOwner: TCmCustomCdbObject); 
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TipoObjProcTrab';

  FCodTipoObjeto := CreateCmDbField('CodTipoObjeto',ftFloat,true,true,false,false,'');  
  FDescricao := CreateCmDbField('Descricao',ftString,true,false,false,false,'');
  FIdProvento := CreateCmDbField('IdProvento',ftFloat,false,false,false,true,'');
  FIdGrupoObjeto := CreateCmDbField('IdGrupoObjeto',ftFloat,false,false,false,true,'');
  FFlgProvDesc := CreateCmDbField('FlgProvDesc',ftFloat,false,false,false,false,'');
  FClasseObj := CreateCmDbField('ClasseObj',ftString,false,false,false,false,'');
end;

end.
