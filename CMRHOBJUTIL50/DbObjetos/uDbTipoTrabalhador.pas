{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 31/01/2002                                 }
{                                                       }
{*******************************************************}

unit uDbTipoTrabalhador;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbTipoTrabalhador = class(TCmDbObject)
  private
    FIdTipoTrab: TCmDbField;
    FDescricao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdTipoTrab: TCmDbField read FIdTipoTrab write FIdTipoTrab;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbTipoTrabalhador }

constructor TDbTipoTrabalhador.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TIPOTRABALHADOR';

  FIdTipoTrab := CreateCmDbField('IDTIPOTRAB',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
end;

end.

