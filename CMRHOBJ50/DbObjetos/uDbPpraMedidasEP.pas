{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/03/2003                             }
{                                                       }
{*******************************************************}

unit uDbPpraMedidasEP;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDbPpraMedidasEP = class(TCmDbObject)
  private
    FIdacoes: TCmDbField;
    FObservacao: TCmDbField;
    FIdaval: TCmDbField;
    FIdclassebem: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property Observacao: TCmDbField read FObservacao write FObservacao;
    property IdClasseBem: TCmDbField read FIdclassebem write FIdclassebem;
    property IdAval: TCmDbField read FIdaval write FIdaval;
    property IdAcoes: TCmDbField read FIdacoes write FIdacoes;
  end;

implementation

{ TDbPpraMedidasEP }

constructor TDbPpraMedidasEP.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'PPRAMEDIDASEP';

  FObservacao := CreateCmDbField('OBSERVACAO',ftString,false,false,false,true,'');
  FIdclassebem := CreateCmDbField('IDCLASSEBEM',ftfloat,true,true,false,true,'');
  FIdaval := CreateCmDbField('IDAVAL',ftfloat,true,true,false,true,'');
  FIdacoes := CreateCmDbField('IDACOES',ftfloat,true,true,false,true,'');
end;

end.
