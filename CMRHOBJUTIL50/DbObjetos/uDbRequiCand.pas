{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 16/12/2002                                 }
{                                                       }
{*******************************************************}

unit uDbRequiCand;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbRequiCand = class(TCmDbObject)
  private
    FFlgAprovado: TCmDbField;
    FIdPessoa: TCmDbField;
    FNumReq: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property NumReq: TCmDbField read FNumReq write FNumReq;
    property FlgAprovado: TCmDbField read FFlgAprovado write FFlgAprovado;
  end;

implementation

{ TDbRequiCand }

constructor TDbRequiCand.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'REQUICAND';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,true,'');
  FNumReq := CreateCmDbField('NUMREQ',ftFloat,true,true,false,true,'');
  FFlgAprovado := CreateCmDbField('FLGAPROVADO',ftFloat,false,false,false,false,'');
end;

end.
