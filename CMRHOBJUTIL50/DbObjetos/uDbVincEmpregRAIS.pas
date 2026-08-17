{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbVincEmpregRAIS;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbVincEmpregRAIS = class(TCmDbObject)
  private
    FIdVincEmpreg: TCmDbField;
    FDescricao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdVincEmpreg: TCmDbField read FIdVincEmpreg write FIdVincEmpreg;
    property Descricao: TCmDbField read FDescricao write FDescricao;
  end;

implementation

{ TDbVincEmpregRAIS }

constructor TDbVincEmpregRAIS.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'VINCEMPREGRAIS';

  FIdVincEmpreg := CreateCmDbField('IDVINCEMPREG',ftFloat,true,true,false,false,'');
  FDescricao := CreateCmDbField('DESCRICAO',ftString,true,false,false,false,'');
end;

end.
