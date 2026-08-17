{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 07/03/2003                                 }
{                                                       }
{*******************************************************}

unit uDbCampoTabGener;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbCampoTabGener = class(TCmDbObject)
  private
    FCodCampo: TCmDbField;
    FDescricao: TCmDbField;
    FCodTabela: TCmDbField;
    FIdTipoDado: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property CodTabela: TCmDbField read FCodTabela write FCodTabela;
    property CodCampo: TCmDbField read FCodCampo write FCodCampo;
    property IdTipoDado: TCmDbField read FIdTipoDado write FIdTipoDado;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbCampoTabGener }

constructor TDbCampoTabGener.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'CAMPOTABGENER';

  FCodTabela := CreateCmDbField('CODTABELA',ftString,true,true,false,true,'');
  FCodCampo := CreateCmDbField('CODCAMPO',ftString,true,true,false,true,'');
  FIdTipoDado := CreateCmDbField('IDTIPODADO',ftFloat,false,false,false,true,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,false,false,false,true,'');
end;

end.
