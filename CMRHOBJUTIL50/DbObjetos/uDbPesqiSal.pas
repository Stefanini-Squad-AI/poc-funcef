{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 07/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbPesqiSal;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB;

type
  TDbPesqiSal = class(TCmDbObject)
  private
    FIdPesqSalar: TCmDbField;
    FNomePesqSalar: TCmDbField;
    FDataRefPesq: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPesqSalar: TCmDbField read FIdPesqSalar write FIdPesqSalar;
    property NomePesqSalar: TCmDbField read FNomePesqSalar write FNomePesqSalar;
    property DataRefPesq: TCmDbField read FDataRefPesq write FDataRefPesq;
  end;

implementation

{ TDbPesqiSal }

constructor TDbPesqiSal.Create(AOwner: TCmCustomCdbObject);  
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'PESQISAL';

  FIdPesqSalar := CreateCmDbField('IDPESQSALAR',ftFloat,true,true,false,false,'');
  FNomePesqSalar := CreateCmDbField('NOMEPESQSALAR',ftString,true,false,false,false,'');
  FDataRefPesq := CreateCmDbField('DATAREFPESQ',ftDateTime,false,false,false,true,'');
end;

end.
