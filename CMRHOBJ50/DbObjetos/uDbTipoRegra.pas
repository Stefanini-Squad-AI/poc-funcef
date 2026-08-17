{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 20/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbTipoRegra;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbTipoRegra = class(TCmDbObject)
  private
    FIdTipoRegra: TCmDbField;
    FDescRegra: TCmDbField;
    FIdGrupoRegra: TCmDbField;
    FSqlRegra: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdTipoRegra: TCmDbField read FIdTipoRegra write FIdTipoRegra;
    property DescRegra: TCmDbField read FDescRegra write FDescRegra;
    property IdGrupoRegra: TCmDbField read FIdGrupoRegra write FIdGrupoRegra;
    property SqlRegra: TCmDbField read FSqlRegra write FSqlRegra;
  end;

implementation

{ TDbTipoRegra }

constructor TDbTipoRegra.Create(AOwner: TCmCustomCdbObject); 
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TIPOREGRA';

  FIdTipoRegra := CreateCmDbField('IDTIPOREGRA',ftFloat,true,true,false,false,'');
  FDescRegra := CreateCmDbField('DESCREGRA',ftString,false,false,false,true,'');
  FIdGrupoRegra := CreateCmDbField('IDGRUPOREGRA',ftFloat,false,false,false,true,'');
  FSqlRegra := CreateCmDbField('SQLREGRA',ftBlob,false,false,false,true,'');
end;

function TDbTipoRegra.Insert: boolean;
begin
  FIdTipoRegra.asFloat := GetSequence('TIPOREGRA');  
  Result := inherited Insert;
end;

end.
