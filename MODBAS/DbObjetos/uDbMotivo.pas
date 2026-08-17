{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 04/12/2001                                 }
{                                                       }
{*******************************************************}

unit uDbMotivo;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbMotivo = class(TCmDbObject)
  private
    FIdMotivo: TCmDbField;
    FDescricao: TCmDbField;
    FGrupoMotivo: TCmDbField;
    FIdMovContrCAGED: TCmDbField;
    FFlgTipo: TCmDbField;
    FMotivoFGTS: TCmDbField;
    FMotivoRAIS: TCmDbField;
    FObservacao: TCmDbField;
  public
    {$IFNDEF VERSAO0505}
    constructor Create(AOwner: TCmCustomCdbObject); override;
    {$ELSE}
    constructor Create; override;
    {$ENDIF}

    property IdMotivo: TCmDbField read FIdMotivo write FIdMotivo;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property GrupoMotivo: TCmDbField read FGrupoMotivo write FGrupoMotivo;
    property IdMovContrCAGED: TCmDbField read FIdMovContrCAGED write FIdMovContrCAGED;
    property FlgTipo: TCmDbField read FFlgTipo write FFlgTipo;
    property MotivoRAIS: TCmDbField read FMotivoRAIS write FMotivoRAIS;
    property MotivoFGTS: TCmDbField read FMotivoFGTS write FMotivoFGTS;
    property Observacao: TCmDbField read FObservacao write FObservacao;
  end;

implementation

{ TDbMotivo }

{$IFNDEF VERSAO0505}
constructor TDbMotivo.Create(AOwner: TCmCustomCdbObject);
{$ELSE}
constructor TDbMotivo.Create;
{$ENDIF}
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'Motivo';

  FIdMotivo := CreateCmDbField('IdMotivo',ftFloat,true,true,false,true,'');
  FDescricao := CreateCmDbField('Descricao',ftString,true,false,false,false,'');
  FGrupoMotivo := CreateCmDbField('GrupoMotivo',ftString,false,false,false,true,'');
  FIdMovContrCAGED := CreateCmDbField('IdMovContrCAGED',ftFloat,false,false,false,true,'');
  FFlgTipo := CreateCmDbField('FlgTipo',ftString,false,false,false,true,'');
  FMotivoRAIS := CreateCmDbField('MotivoRAIS',ftString,false,false,false,true,'');
  FMotivoFGTS := CreateCmDbField('MotivoFGTS',ftString,false,false,false,true,'');
  FObservacao := CreateCmDbField('Observacao',ftString,false,false,false,true,'');
end;

end.
