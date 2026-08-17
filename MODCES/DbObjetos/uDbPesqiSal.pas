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

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

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

  TableName := 'PesqiSal';

  FIdPesqSalar := CreateCmDbField('IdPesqSalar',ftFloat,true,true,false,false,'');
  FNomePesqSalar := CreateCmDbField('NomePesqSalar',ftString,true,false,false,false,'');
  FDataRefPesq := CreateCmDbField('DataRefPesq',ftDateTime,false,false,false,true,'');
end;

end.
