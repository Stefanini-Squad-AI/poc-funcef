{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 10/07/2002                                 }
{                                                       }
{*******************************************************}

unit uDbDependente;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB;

type
  TDbDependente = class(TCmDbObject)
  private
    FIdPessoa: TCmDbField;
    FFlgDesignado: TCmDbField;
    FIdSitDependente: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property IdSitDependente: TCmDbField read FIdSitDependente write FIdSitDependente;
    property FlgDesignado: TCmDbField read FFlgDesignado write FFlgDesignado;
  end;

implementation

{ TDbDependente }

constructor TDbDependente.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'DEPENDENTE';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,false,'');
  FIdSitDependente := CreateCmDbField('IDSITDEPENDENTE',ftString,false,false,false,true,'');
  FFlgDesignado := CreateCmDbField('FLGDESIGNADO',ftFloat,false,false,false,false,'');
end;

end.
