{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 01/02/2001                                 }
{                                                       }
{*******************************************************}

unit uDbSegAcidTrab;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbSegAcidTrab = class(TCmDbObject)
  private
    FIdSegAcidTrab: TCmDbField;
    FDescricao: TCmDbField;
    FPercsegacidtrab: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdSegAcidTrab: TCmDbField read FIdSegAcidTrab write FIdSegAcidTrab;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property PercSegAcidTrab: TCmDbField read FPercsegacidtrab write FPercsegacidtrab;
  end;

implementation

{ TDbSegAcidTrab }

constructor TDbSegAcidTrab.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'SEGACIDTRAB';

  FIdsegacidtrab := CreateCmDbField('IDSEGACIDTRAB',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
  FPercsegacidtrab := CreateCmDbField('PERCSEGACIDTRAB',ftFloat,true,false,false,false,'');
end;

end.
