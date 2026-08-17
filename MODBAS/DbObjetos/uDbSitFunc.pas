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
    {$IFNDEF VERSAO0505}
    constructor Create(AOwner: TCmCustomCdbObject); override;
    {$ELSE}
    constructor Create; override;
    {$ENDIF}

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

{$IFNDEF VERSAO0505}
constructor TDbSitFunc.Create(AOwner: TCmCustomCdbObject);
{$ELSE}
constructor TDbSitFunc.Create;
{$ENDIF}
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'SitFunc';

  FIdSitFunc := CreateCmDbField('IdSitFunc',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('Descricao',ftString,true,false,false,false,'');
  FTipoSit := CreateCmDbField('TipoSit',ftString,true,false,false,false,'');
  FFlgInterno := CreateCmDbField('FlgInterno',ftString,false,false,false,false,'');
  FFlgUso := CreateCmDbField('FlgUso',ftString,false,false,false,false,'');
  FCodCAGED := CreateCmDbField('CodCAGED',ftString,false,false,false,false,'');
  FCodMovFGTS := CreateCmDbField('CodMovFGTS',ftString,false,false,false,false,'');
end;

end.
