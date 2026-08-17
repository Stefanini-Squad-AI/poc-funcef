{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 26/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbTipOcMed;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbTipOcMed = class(TCmDbObject)
  private
    FCodTipoOcMed: TCmDbField;
    FDescrTipoOcMed: TCmDbField;
    FFlgTipOcor: TCmDbField;
    FAvalMin: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property CodTipoOcMed: TCmDbField read FCodTipoOcMed write FCodTipoOcMed;
    property DescrTipoOcMed: TCmDbField read FDescrTipoOcMed write FDescrTipoOcMed;
    property FlgTipOcor: TCmDbField read FFlgTipOcor write FFlgTipOcor;
    property AvalMin: TCmDbField read FAvalMin write FAvalMin;
  end;

implementation

{ TDbTipOcMed }

constructor TDbTipOcMed.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TipOcMed';

  FCodTipoOcMed := CreateCmDbField('CodTipoOcMed',ftFloat,true,true,false,false,'');
  FDescrTipoOcMed := CreateCmDbField('DescrTipoOcMed',ftString,false,false,false,false,'');
  FFlgTipOcor := CreateCmDbField('FlgTipOcor',ftFloat,false,false,false,false,'');
  FAvalMin := CreateCmDbField('AvalMin',ftFloat,false,false,false,false,'');
end;

end.
