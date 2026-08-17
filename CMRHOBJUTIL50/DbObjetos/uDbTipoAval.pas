{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbTipoAval;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbTipoAval = class(TCmDbObject)
  private
    FCodTipoAval: TCmDbField;
    FDescrTipoAval: TCmDbField;
    FFlgTipoAval: TCmDbField;    
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property CodTipoAval: TCmDbField read FCodTipoAval write FCodTipoAval;
    property DescrTipoAval: TCmDbField read FDescrTipoAval write FDescrTipoAval;
    property FlgTipoAval: TCmDbField read FFlgTipoAval write FFlgTipoAval;
  end;

implementation

{ TDbTipoAval }

constructor TDbTipoAval.Create(AOwner: TCmCustomCdbObject); 
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TIPOAVAL';

  FCodTipoAval := CreateCmDbField('CODTIPOAVAL',ftFloat,true,true,false,false,'');
  FDescrTipoAval := CreateCmDbField('DESCRTIPOAVAL',ftString,false,false,false,false,'');
  FFlgTipoAval := CreateCmDbField('FLGTIPOAVAL',ftFloat,true,false,false,false,'');
end;

end.
