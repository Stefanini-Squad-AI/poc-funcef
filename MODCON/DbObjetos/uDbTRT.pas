{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbTRT;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbTRT = class(TCmDbObject)
  private
    FRegiaoTRT: TCmDbField;
    FCodigoTRT: TCmDbField;
    FDescricao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property CodigoTRT: TCmDbField read FCodigoTRT write FCodigoTRT;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property RegiaoTRT: TCmDbField read FRegiaoTRT write FRegiaoTRT;
  end;

implementation

{ TDbTRT }

constructor TDbTRT.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TRT';

  FCodigoTRT := CreateCmDbField('CodigoTRT',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('Descricao',ftString,true,false,false,false,'');
  FRegiaoTRT := CreateCmDbField('RegiaoTRT',ftFloat,false,false,false,false,'');
end;

end.
