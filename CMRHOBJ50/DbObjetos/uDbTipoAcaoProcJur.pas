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

    function Insert: boolean; override;

    property IdTipoAcao: TCmDbField read FIdTipoAcao write FIdTipoAcao;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbTipoAcaoProcJur }

constructor TDbTipoAcaoProcJur.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TIPOACAOPROCJUR';

  FIdTipoAcao := CreateCmDbField('IDTIPOACAO',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
end;

function TDbTipoAcaoProcJur.Insert: boolean;
begin
  FIdTipoAcao.asFloat := GetSequence('TIPOACAOPROCJUR');
  Result := inherited Insert;
end;

end.
