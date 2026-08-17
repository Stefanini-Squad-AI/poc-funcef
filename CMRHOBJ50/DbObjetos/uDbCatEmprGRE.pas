{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 04/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbCatEmprGRE;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbCatEmprGRE = class(TCmDbObject)
  private
    FIdCatEmprGRE: TCmDbField;
    FDescricao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdCatEmprGRE: TCmDbField read FIdCatEmprGRE write FIdCatEmprGRE;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbCatEmprGRE }

constructor TDbCatEmprGRE.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'CatEmprGRE';

  FIdCatEmprGRE := CreateCmDbField('IdCatEmprGRE',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('Descricao',ftString,true,false,false,false,'');
end;

end.
