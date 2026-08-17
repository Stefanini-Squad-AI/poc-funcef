{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 07/03/2003                                 }
{                                                       }
{*******************************************************}

unit uDbValTabGener;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbValTabGener = class(TCmDbObject)
  private
    FNumLinha: TCmDbField;
    FCodTabela: TCmDbField;
    FCodCampo: TCmDbField;
    FValor: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property NumLinha: TCmDbField read FNumLinha write FNumLinha;
    property CodTabela: TCmDbField read FCodTabela write FCodTabela;
    property CodCampo: TCmDbField read FCodCampo write FCodCampo;
    property Valor: TCmDbField read FValor write FValor;
  end;

implementation

{ TDbValTabGener }

constructor TDbValTabGener.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'VALTABGENER';

  FNumLinha := CreateCmDbField('NUMLINHA',ftFloat,true,true,false,true,'');
  FCodTabela := CreateCmDbField('CODTABELA',ftString,true,true,false,true,'');
  FCodCampo := CreateCmDbField('CODCAMPO',ftString,true,true,false,true,'');
  FValor := CreateCmDbField('VALOR',ftString,false,false,false,true,'');
end;

end.
