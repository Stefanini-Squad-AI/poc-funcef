{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 11/03/2002                                 }
{                                                       }
{*******************************************************}

unit uDbSindicato;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbSindicato = class(TCmDbObject)
  private
    FIdPessoa: TCmDbField;
    FRegistroMt: TCmDbField;
    FMesContribuicao: TCmDbField;
    FMesBase: TCmDbField;
    FPisoSalarial: TCmDbField;
    FMoeCodigo: TCmDbField;
  public
    {$IFNDEF VERSAO0505}
    constructor Create(AOwner: TCmCustomCdbObject); override;
    {$ELSE}
    constructor Create; override;
    {$ENDIF}

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property RegistroMt: TCmDbField read FRegistroMt write FRegistroMt;
    property MesBase: TCmDbField read FMesBase write FMesBase;
    property MesContribuicao: TCmDbField read FMesContribuicao write FMesContribuicao;
    property PisoSalarial: TCmDbField read FPisoSalarial write FPisoSalarial;
    property MoeCodigo: TCmDbField read FMoeCodigo write FMoeCodigo;
  end;

implementation

{ TDbSindicato }

{$IFNDEF VERSAO0505}
constructor TDbSindicato.Create(AOwner: TCmCustomCdbObject);
{$ELSE}
constructor TDbSindicato.Create;
{$ENDIF}
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'Sindicato';

  FIdPessoa := CreateCmDbField('IdPessoa',ftFloat,true,true,false,false,'');
  FRegistroMt := CreateCmDbField('RegistroMt',ftString,false,false,false,true,'');
  FMesBase := CreateCmDbField('MesBase',ftFloat,false,false,false,true,'');
  FMesContribuicao := CreateCmDbField('MesContribuicao',ftFloat,false,false,false,true,'');
  FPisoSalarial := CreateCmDbField('PisoSalarial',ftFloat,false,false,false,true,'');
  FMoeCodigo := CreateCmDbField('MoeCodigo',ftFloat,false,false,false,true,'');
end;

end.
