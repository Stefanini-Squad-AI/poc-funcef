{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 18/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbPacote;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbPacote = class(TCmDbObject)
  private
    FIdPacote: TCmDbField;
    FDescricao: TCmDbField;
    FTipo: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPacote: TCmDbField read FIdPacote write FIdPacote;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property Tipo: TCmDbField read FTipo write FTipo;
  end;

implementation

{ TDbPacote }

constructor TDbPacote.Create(AOwner: TCmCustomCdbObject); 
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'PACOTE';

  FIdPacote  := CreateCmDbField('IDPACOTE',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
  FTipo      := CreateCmDbField('TIPO',ftFloat,true,false,false,false,'');
end;

end.
