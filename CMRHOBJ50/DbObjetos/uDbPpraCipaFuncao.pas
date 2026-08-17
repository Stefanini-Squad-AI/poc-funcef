{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/03/2003                             }
{                                                       }
{*******************************************************}

unit uDbPpraCipaFuncao;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDbPpraCipaFuncao = class(TCmDbObject)
  private
    FIdcipafuncao: TCmDbField;
    FDescricao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdCipaFuncao: TCmDbField read FIdcipafuncao write FIdcipafuncao;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbPpraCipaFuncao }

constructor TDbPpraCipaFuncao.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'PPRACIPAFUNCAO';

  FIdcipafuncao := CreateCmDbField('IDCIPAFUNCAO',ftFloat,true,true,false,true,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,false,false,false,true,'');
end;

function TDbPpraCipaFuncao.Insert: boolean;
begin
  FIdcipafuncao.asFloat := GetSequence('PPRACIPAFUNCAO');
  Result := inherited Insert;
end;

end.
