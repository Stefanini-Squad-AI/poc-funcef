{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 27/03/2002                                 }
{                                                       }
{*******************************************************}

unit uDbRubricaXPess;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbRubricaXPess = class(TCmDbObject)
  private
    FIdRubrica: TCmDbField;
    FIdPessoa: TCmDbField;
    FCodProvDesc: TCmDbField;
    FDescrProvDesc: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdRubrica: TCmDbField read FIdRubrica write FIdRubrica;
    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property CodProvDesc: TCmDbField read FCodProvDesc write FCodProvDesc;
    property DescrProvDesc: TCmDbField read FDescrProvDesc write FDescrProvDesc;
  end;

implementation

{ TDbRubricaXPess }

constructor TDbRubricaXPess.Create(AOwner: TCmCustomCdbObject); 
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'RUBRICAXPESS';

  FIdRubrica := CreateCmDbField('IDRUBRICA',ftFloat,true,true,false,false,'');
  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,false,'');
  FCodProvDesc := CreateCmDbField('CODPROVDESC',ftString,false,false,false,false,'');
  FDescrProvDesc := CreateCmDbField('DESCRPROVDESC',ftString,false,false,false,false,'');
end;

end.
