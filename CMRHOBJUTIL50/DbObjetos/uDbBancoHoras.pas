{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Eugênio Frioli                  }
{ Criado Em: 14/01/2004                                 }
{                                                       }
{*******************************************************}

unit uDbBancoHoras;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbBancoHoras = class(TCmDbObject)
  private
    FIdBancoHoras: TCmDbField;
    FIdPessoa: TCmDbField;
    FDataBancoHoras: TCmDbField;
    FValBancoHoras: TCmDbField;
    FSitBancoHoras: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    function Insert: boolean; override;

    property IdBancoHoras: TCmDbField read FIdBancoHoras write FIdBancoHoras;
    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property DataBancoHoras: TCmDbField read FDataBancoHoras write FDataBancoHoras;
    property ValBancoHoras: TCmDbField read FValBancoHoras write FValBancoHoras;
    property SitBancoHoras: TCmDbField read FSitBancoHoras write FSitBancoHoras;
  end;

implementation

{ TDbBancoHoras }

constructor TDbBancoHoras.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'BANCOHORAS';

  FIdBancoHoras := CreateCmDbField('IDBANCOHORAS',ftFloat,true,true,false,false,'');
  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,false,false,false,true,'');
  FDataBancoHoras := CreateCmDbField('DATABANCOHORAS',ftDateTime,false,false,false,true,'');
  FValBancoHoras := CreateCmDbField('VALBANCOHORAS',ftFloat,false,false,false,false,'');
  FSitBancoHoras := CreateCmDbField('SITBANCOHORAS',ftFloat,false,false,false,false,'');
end;

function TDbBancoHoras.Insert: boolean;
begin
  FIdBancoHoras.asFloat := GetSequence('BANCOHORAS');
  Result := inherited Insert;
end;

end.
