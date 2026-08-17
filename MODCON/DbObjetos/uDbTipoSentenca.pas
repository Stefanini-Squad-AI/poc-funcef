{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 14/01/2002                                 }
{                                                       }
{*******************************************************}

unit uDbTipoSentenca;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbTipoSentenca = class(TCmDbObject)
  private
    FCodTipoSent: TCmDbField;
    FDescricao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property CodTipoSent: TCmDbField read FCodTipoSent write FCodTipoSent;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbTipoSentenca }

constructor TDbTipoSentenca.Create(AOwner: TCmCustomCdbObject); 
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TipoSentenca';

  FCodTipoSent := CreateCmDbField('CodTipoSent',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('Descricao',ftString,true,false,false,false,'');
end;

end.
