{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/03/2003                             }
{                                                       }
{*******************************************************}

unit uDbPpraAgenteAval;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDbPpraAgenteAval = class(TCmDbObject)
  private
    FIdpprameioprop: TCmDbField;
    FObservacao: TCmDbField;
    FIdpprameiocont: TCmDbField;
    FIdagenterisco: TCmDbField;
    FIdaval: TCmDbField;
    FIndperiodo: TCmDbField;
    FGraduacao: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property Graduacao: TCmDbField read FGraduacao write FGraduacao;
    property Observacao: TCmDbField read FObservacao write FObservacao;
    property IndPeriodo: TCmDbField read FIndperiodo write FIndperiodo;
    property IdPpraMeioProp: TCmDbField read FIdpprameioprop write FIdpprameioprop;
    property IdPpraMeioCont: TCmDbField read FIdpprameiocont write FIdpprameiocont;
    property IdAval: TCmDbField read FIdaval write FIdaval;
    property IdAgenteRisco: TCmDbField read FIdagenterisco write FIdagenterisco;
  end;

implementation

{ TDbPpraAgenteAval }

constructor TDbPpraAgenteAval.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'PPRAAGENTEAVAL';

  FObservacao := CreateCmDbField('OBSERVACAO',ftString,false,false,false,true,'');
  FIndperiodo := CreateCmDbField('INDPERIODO',ftFloat,false,false,false,true,'');
  FGraduacao  := CreateCmDbField('GRADUACAO',ftFloat,false,false,false,true,'');
  FIdpprameioprop := CreateCmDbField('IDPPRAMEIOPROP',ftFloat,false,false,false,true,'');
  FIdpprameiocont := CreateCmDbField('IDPPRAMEIOCONT',ftFloat,false,false,false,true,'');
  FIdaval := CreateCmDbField('IDAVAL',ftFloat,true,true,false,true,'');
  FIdagenterisco := CreateCmDbField('IDAGENTERISCO',ftFloat,true,true,false,true,'');
end;

end.
