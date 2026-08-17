{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Atualizado Em: 08/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbGrInstr;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbGrInstr = class(TCmDbObject)
  private
    FIdGrInstr: TCmDbField;
    FDescricao: TCmDbField;
    FCodRAIS: TCmDbField;
  public
    {$IFNDEF VERSAO0505}
    constructor Create(AOwner: TCmCustomCdbObject); override;
    {$ELSE}
    constructor Create; override;
    {$ENDIF}

    property IdGrInstr: TCmDbField read FIdGrInstr write FIdGrInstr;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property CodRAIS: TCmDbField read FCodRAIS write FCodRAIS;
  end;

implementation

uses uFuncoesUteis;

{ TDbGrInstr }

{$IFNDEF VERSAO0505}
constructor TDbGrInstr.Create(AOwner: TCmCustomCdbObject);
{$ELSE}
constructor TDbGrInstr.Create;
{$ENDIF}
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'GrInstr';

  FIdGrInstr := CreateCmDbField('IdGrInstr',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('Descricao',ftString,true,false,false,false,'');
  FCodRAIS := CreateCmDbField('CodRAIS',ftString,false,false,false,false,'');
end;

end.
