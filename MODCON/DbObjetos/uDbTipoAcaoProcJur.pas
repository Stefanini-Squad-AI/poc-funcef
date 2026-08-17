{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbTipoAcaoProcJur;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbTipoAcaoProcJur = class(TCmDbObject)
  private
    FIdTipoAcao: TCmDbField;
    FDescricao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdTipoAcao: TCmDbField read FIdTipoAcao write FIdTipoAcao;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbTipoAcaoProcJur }

constructor TDbTipoAcaoProcJur.Create(AOwner: TCmCustomCdbObject); 
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TipoAcaoProcJur';

  FIdTipoAcao := CreateCmDbField('IdTipoAcao',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('Descricao',ftString,true,false,false,false,'');
end;

end.
