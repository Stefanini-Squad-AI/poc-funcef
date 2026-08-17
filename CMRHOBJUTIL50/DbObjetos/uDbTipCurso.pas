{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbTipCurso;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbTipCurso = class(TCmDbObject)
  private
    FIdTipoCurso: TCmDbField;
    FDescricao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdTipoCurso: TCmDbField read FIdTipoCurso write FIdTipoCurso;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbTipCurso }

constructor TDbTipCurso.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TIPCURSO';

  FIdTipoCurso := CreateCmDbField('IDTIPOCURSO',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
end;

end.
