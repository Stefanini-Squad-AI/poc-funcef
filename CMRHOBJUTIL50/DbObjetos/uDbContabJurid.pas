{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 29/10/2002                                 }
{                                                       }
{*******************************************************}

unit uDbContabJurid;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbContabJurid = class(TCmDbObject)
  private
    FIndPrincipal: TCmDbField;
    FIndMateria: TCmDbField;
    FIdContabJurid: TCmDbField;
    FIdPlano2: TCmDbField;
    FIdPlano1: TCmDbField;
    FContaCredito: TCmDbField;
    FContaDebito: TCmDbField;
    FCodTipoObjeto: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdContabJurid: TCmDbField read FIdContabJurid write FIdContabJurid;
    property CodTipoObjeto: TCmDbField read FCodTipoObjeto write FCodTipoObjeto;
    property ContaDebito: TCmDbField read FContaDebito write FContaDebito;
    property ContaCredito: TCmDbField read FContaCredito write FContaCredito;
    property IndPrincipal: TCmDbField read FIndPrincipal write FIndPrincipal;
    property IndMateria: TCmDbField read FIndMateria write FIndMateria;
    property IdPlano1: TCmDbField read FIdPlano1 write FIdPlano1;
    property IdPlano2: TCmDbField read FIdPlano2 write FIdPlano2;
  end;

implementation

{ TDbContabJurid }

constructor TDbContabJurid.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'CONTABJURID';

  FIdContabJurid := CreateCmDbField('IDCONTABJURID',ftFloat,true,true,false,true,'');
  FCodTipoObjeto := CreateCmDbField('CODTIPOOBJETO',ftFloat,true,false,false,true,'');
  FContaDebito := CreateCmDbField('CONTADEBITO',ftString,false,false,false,true,'');
  FContaCredito := CreateCmDbField('CONTACREDITO',ftString,false,false,false,true,'');
  FIndPrincipal := CreateCmDbField('INDPRINCIPAL',ftFloat,false,false,false,false,'');
  FIndMateria := CreateCmDbField('INDMATERIA',ftFloat,false,false,false,false,'');
  FIdPlano1 := CreateCmDbField('IDPLANO1',ftFloat,false,false,false,true,'');
  FIdPlano2 := CreateCmDbField('IDPLANO2',ftFloat,false,false,false,true,'');
end;

function TDbContabJurid.Insert: boolean;
begin
  FIdContabJurid.asFloat := GetSequence('CONTABJURID');
  Result := inherited Insert;
end;

end.
