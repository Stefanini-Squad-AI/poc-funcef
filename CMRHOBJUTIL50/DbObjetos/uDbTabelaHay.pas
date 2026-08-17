{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Atualizado Em: 26/11/2002                             }
{                                                       }
{*******************************************************}

unit uDbTabelaHay;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbTabelaHay = class(TCmDbObject)
  private
    FIdTabelaHay: TCmDbField;
    FLimite: TCmDbField;
    FMultiplicador: TCmDbField;
    FParcela: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdTabelaHay: TCmDbField read FIdTabelaHay write FIdTabelaHay;
    property Parcela: TCmDbField read FParcela write FParcela;
    property Multiplicador: TCmDbField read FMultiplicador write FMultiplicador;
    property Limite: TCmDbField read FLimite write FLimite;
  end;

implementation

{ TDbTabelaHay }

constructor TDbTabelaHay.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'TABELAHAY';

  FIdTabelaHay := CreateCmDbField('IDTABELAHAY',ftfloat,true,true,false,true,'');
  FParcela := CreateCmDbField('PARCELA',ftFloat,false,false,false,false,'');
  FMultiplicador := CreateCmDbField('MULTIPLICADOR',ftFloat,false,false,false,false,'');
  FLimite := CreateCmDbField('LIMITE',ftFloat,false,false,false,false,'');
end;

function TDbTabelaHay.Insert: boolean;
begin
  FIdTabelaHay.asFloat := GetSequence('TABELAHAY');
  Result := inherited Insert;
end;

end.
