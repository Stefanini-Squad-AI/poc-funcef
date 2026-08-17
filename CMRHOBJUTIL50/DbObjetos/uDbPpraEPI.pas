{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/03/2003                             }
{                                                       }
{*******************************************************}

unit uDbPpraEPI;

interface

uses uCmCustomCdbObject, uCmDbObject, DB;

type
  TDbPpraEPI = class(TCmDbObject)

  private
    FIdbem: TCmDbField;
    FDataentrega: TCmDbField;
    FIdfunc: TCmDbField;
    FIdpessoa: TCmDbField;
    FDataretorno: TCmDbField;
    FIdPpraEpi: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdPessoa: TCmDbField read FIdpessoa write FIdpessoa;
    property IdFunc: TCmDbField read FIdfunc write FIdfunc;
    property IdBem: TCmDbField read FIdbem write FIdbem;
    property DataRetorno: TCmDbField read FDataretorno write FDataretorno;
    property DataEntrega: TCmDbField read FDataentrega write FDataentrega;
    property IdPpraEpi: TCmDbField read FIdPpraEpi write FIdPpraEpi;
  end;

implementation

{ TDbPpraEPI }

constructor TDbPpraEPI.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'PPRAEPI';

  FIdPpraEpi := CreateCmDbField('IDPPRAEPI',ftFloat,true,true,false,true,'');
  FIdpessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,true,'');
  FIdbem := CreateCmDbField('IDBEM',ftFloat,true,true,false,true,'');
  FIdfunc := CreateCmDbField('IDFUNC',ftFloat,false,false,false,true,'');
  FDataretorno := CreateCmDbField('DATARETORNO',ftDateTime,false,false,false,true,'');
  FDataentrega := CreateCmDbField('DATAENTREGA',ftDateTime,false,false,false,true,'');
end;

function TDbPpraEPI.Insert: boolean;
begin
  FIdPpraEpi.asFloat := GetSequence('PPRAEPI');
  Result := inherited Insert;
end;

end.
