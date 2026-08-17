{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 17/07/2002                             }
{                                                       }
{*******************************************************}

unit uDbRegra;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB;

type
  TDbRegra = class(TCmDbObject)
  private
    FDescricaoregra: TCmDbField;
    FIdtiporegra: TCmDbField;
    FIdregra: TCmDbField;
    FPublicada: TCmDbField;
    FNomeregra: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property Publicada: TCmDbField read FPublicada write FPublicada;
    property NomeRegra: TCmDbField read FNomeregra write FNomeregra;
    property IdTipoRegra: TCmDbField read FIdtiporegra write FIdtiporegra;
    property IdRegra: TCmDbField read FIdregra write FIdregra;
    property DescricaoRegra: TCmDbField read FDescricaoregra write FDescricaoregra;
  end;

implementation

{ TDbRegra }

constructor TDbRegra.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'REGRA';

  FPublicada := CreateCmDbField('PUBLICADA',ftFloat,false,false,false,true,'');
  FNomeregra := CreateCmDbField('NOMEREGRA',ftString,false,false,false,true,'');
  FIdtiporegra := CreateCmDbField('IDTIPOREGRA',ftFloat,true,false,false,true,'');
  FIdregra := CreateCmDbField('IDREGRA',ftFloat,true,true,false,true,'');
  FDescricaoregra := CreateCmDbField('DESCRICAOREGRA',ftBlob,false,false,false,true,'');
end;

function TDbRegra.Insert: boolean;
begin
  FIdregra.asFloat := GetSequence('REGRA');
  Result := inherited Insert;
end;

end.
