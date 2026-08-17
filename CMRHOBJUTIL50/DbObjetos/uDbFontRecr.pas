{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 14/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbFontRecr;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbFontRecr = class(TCmDbObject)
  private
    FIdFontRecr: TCmDbField;
    FDescricao: TCmDbField;
    FObservacao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdFontRecr: TCmDbField read FIdFontRecr write FIdFontRecr;
    property Descricao: TCmDbField read FDescricao write FDescricao;
    property Observacao: TCmDbField read FObservacao write FObservacao;
  end;

implementation

{ TDbFontRecr }

constructor TDbFontRecr.Create(AOwner: TCmCustomCdbObject); 
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'FONTRECR';

  FIdFontRecr := CreateCmDbField('IDFONTRECR',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
  FObservacao := CreateCmDbField('OBSERVACAO',ftString,true,false,false,false,'');
end;

end.
