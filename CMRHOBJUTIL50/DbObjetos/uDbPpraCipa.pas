{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/03/2003                             }
{                                                       }
{*******************************************************}

unit uDbPpraCipa;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbPpraCipa = class(TCmDbObject)
  private
    FIdPpraCipa: TCmDbField;
    FDescricao: TCmDbField;
    FNumPessCipa: TCmDbField;
    FIndCipa: TCmDbField;
    FIdEstab: TCmDbField;
    FIdEmpresa: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property NumPessCipa: TCmDbField read FNumPessCipa write FNumPessCipa;
    property IndCipa: TCmDbField read FIndCipa write FIndCipa;
    property IdPpraCipa: TCmDbField read FIdPpraCipa write FIdPpraCipa;
    property IdEstab: TCmDbField read FIdEstab write FIdEstab;
    property IdEmpresa: TCmDbField read FIdEmpresa write FIdEmpresa;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbPpraCipa }

constructor TDbPpraCipa.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'PPRACIPA';

  FNumPessCipa := CreateCmDbField('NUMPESSCIPA',ftFloat,false,false,false,true,'');
  FIndCipa := CreateCmDbField('INDCIPA',ftString,false,false,false,true,'');
  FIdPpraCipa := CreateCmDbField('IDPPRACIPA',ftFloat,true,true,false,true,'');
  FIdEstab := CreateCmDbField('IDESTAB',ftFloat,false,false,false,true,'');
  FIdEmpresa := CreateCmDbField('IDEMPRESA',ftFloat,false,false,false,true,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,false,false,false,true,'');
end;

function TDbPpraCipa.Insert: boolean;
begin
  FIdPpraCipa.asFloat := GetSequence('PPRACIPA');
  Result := inherited Insert;
end;

end.
