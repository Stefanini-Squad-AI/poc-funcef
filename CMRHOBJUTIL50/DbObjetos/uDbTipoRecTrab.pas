{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 14/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbTipoRecTrab;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbTipoRecTrab = class(TCmDbObject)
  private
    FCodTipoRecurso: TCmDbField;
    FDescricao: TCmDbField;
    FValorHonor: TCmDbField;
    FFlgPenhora: TCmDbField;
    FFlgEncerramento: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property CodTipoRecurso: TCmDbField read FCodTipoRecurso write FCodTipoRecurso;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property ValorHonor: TCmDbField read FValorHonor write FValorHonor;
    property FlgPenhora: TCmDbField read FFlgPenhora write FFlgPenhora;
    property FlgEncerramento: TCmDbField read FFlgEncerramento write FFlgEncerramento;
  end;

implementation

{ TDbTipoRecTrab }

constructor TDbTipoRecTrab.Create(AOwner: TCmCustomCdbObject); 
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TIPORECTRAB';

  FCodTipoRecurso := CreateCmDbField('CODTIPORECURSO',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
  FValorHonor := CreateCmDbField('VALORHONOR',ftFloat,false,false,false,true,'');
  FFlgPenhora := CreateCmDbField('FLGPENHORA',ftFloat,false,false,false,false,'');
  FFlgEncerramento := CreateCmDbField('FLGENCERRAMENTO',ftFloat,false,false,false,false,'');
end;

end.
