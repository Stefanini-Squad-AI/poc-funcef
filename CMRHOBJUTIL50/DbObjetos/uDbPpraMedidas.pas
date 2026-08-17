{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/03/2003                             }
{                                                       }
{*******************************************************}

unit uDbPpraMedidas;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbPpraMedidas = class(TCmDbObject)

  private
    FDataplan: TCmDbField;
    FDatareal: TCmDbField;
    FIdacoes: TCmDbField;
    FIdaval: TCmDbField;
    FIdClasseBem: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdAval: TCmDbField read FIdaval write FIdaval;
    property IdAcoes: TCmDbField read FIdacoes write FIdacoes;
    property DataReal: TCmDbField read FDatareal write FDatareal;
    property DataPlan: TCmDbField read FDataplan write FDataplan;
    property IdClasseBem: TCmDbField read FIdClasseBem write FIdClasseBem;
  end;

implementation

{ TDbPpraMedidas }

constructor TDbPpraMedidas.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'PPRAMEDIDAS';

  FIdaval := CreateCmDbField('IDAVAL',ftFloat,true,true,false,true,'');
  FIdacoes := CreateCmDbField('IDACOES',ftFloat,true,true,false,true,'');
  FDatareal := CreateCmDbField('DATAREAL',ftDateTime,false,false,false,true,'');
  FDataplan := CreateCmDbField('DATAPLAN',ftDateTime,false,false,false,true,'');
  FIdClasseBem := CreateCmDbField('IDCLASSEBEM',ftFloat,false,false,false,true,'');
end;

end.
