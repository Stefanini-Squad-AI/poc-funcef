{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 07/12/2001                                 }
{                                                       }
{*******************************************************}

unit uDbProfiss;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbProfiss = class(TCmDbObject)
  private
    FIdProfiss: TCmDbField;
    FDescricao: TCmDbField;
  public
    {$IFNDEF VERSAO0505}
    constructor Create(AOwner: TCmCustomCdbObject); override;
    {$ELSE}
    constructor Create; override;
    {$ENDIF}

    property IdProfiss: TCmDbField read FIdProfiss write FIdProfiss;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbProfiss }

{$IFNDEF VERSAO0505}
constructor TDbProfiss.Create(AOwner: TCmCustomCdbObject);
{$ELSE}
constructor TDbProfiss.Create;
{$ENDIF}
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'PROFISS';

  FIdProfiss := CreateCmDbField('IDPROFISS',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
end;

end.
