{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 01/04/2003                                 }
{                                                       }
{*******************************************************}

unit uDbLongCmpTabGener;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbLongCmpTabGener = class(TCmDbObject)
  private
    FDescricao: TCmDbField;
    FIdTabela: TCmDbField;
    FIdCampo: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdTabela: TCmDbField read FIdTabela write FIdTabela;
    property IdCampo: TCmDbField read FIdCampo write FIdCampo;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbLongCmpTabGener }

constructor TDbLongCmpTabGener.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'LONGCMPTABGENER';

  FIdTabela := CreateCmDbField('IDTABELA',ftFloat,true,true,false,true,'');
  FIdCampo := CreateCmDbField('IDCAMPO',ftFloat,true,true,false,true,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,false,false,false,true,'');
end;

end.
