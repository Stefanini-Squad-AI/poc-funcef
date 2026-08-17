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

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbTipoRecTrab = class(TCmDbObject)
  private
    FCodTipoRecurso: TCmDbField;
    FDescricao: TCmDbField;
    FValorHonor: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property CodTipoRecurso: TCmDbField read FCodTipoRecurso write FCodTipoRecurso;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property ValorHonor: TCmDbField read FValorHonor write FValorHonor;
  end;

implementation

{ TDbTipoRecTrab }

constructor TDbTipoRecTrab.Create(AOwner: TCmCustomCdbObject); 
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TipoRecTrab';

  FCodTipoRecurso := CreateCmDbField('CodTipoRecurso',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('Descricao',ftString,true,false,false,false,'');
  FValorHonor := CreateCmDbField('ValorHonor',ftFloat,false,false,false,true,'');
end;

end.
