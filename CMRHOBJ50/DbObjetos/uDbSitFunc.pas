{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/01/2002                                 }
{                                                       }
{*******************************************************}

unit uDbSitFunc;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbSitFunc = class(TCmDbObject)
  private
    FIdSitFunc: TCmDbField;
    FDescricao: TCmDbField;
    FTipoSit: TCmDbField;
    FFlgInterno: TCmDbField;
    FFlgUso: TCmDbField;
    FCodCAGED: TCmDbField;
    FCodMovFGTS: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdSitFunc: TCmDbField read FIdSitFunc write FIdSitFunc;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property TipoSit: TCmDbField read FTipoSit write FTipoSit;
    property FlgInterno: TCmDbField read FFlgInterno write FFlgInterno;
    property FlgUso: TCmDbField read FFlgUso write FFlgUso;
    property CodCAGED: TCmDbField read FCodCAGED write FCodCAGED;
    property CodMovFGTS: TCmDbField read FCodMovFGTS write FCodMovFGTS;
  end;

implementation

{ TDbSitFunc }

constructor TDbSitFunc.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'SITFUNC';

  FIdSitFunc := CreateCmDbField('IDSITFUNC',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
  FTipoSit := CreateCmDbField('TIPOSIT',ftString,true,false,false,false,'');
  FFlgInterno := CreateCmDbField('FLGINTERNO',ftString,false,false,false,false,'');
  FFlgUso := CreateCmDbField('FLGUSO',ftString,false,false,false,false,'');
  FCodCAGED := CreateCmDbField('CODCAGED',ftString,false,false,false,false,'');
  FCodMovFGTS := CreateCmDbField('CODMOVFGTS',ftString,false,false,false,false,'');
end;

end.
