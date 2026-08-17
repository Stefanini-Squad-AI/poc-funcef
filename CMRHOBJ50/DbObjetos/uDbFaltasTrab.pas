{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 16/09/2002                                 }
{                                                       }
{*******************************************************}

unit uDbFaltasTrab;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbFaltasTrab = class(TCmDbObject)
  private
    FDataFalta: TCmDbField;
    FIdPessoa: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property DataFalta: TCmDbField read FDataFalta write FDataFalta;
  end;

implementation

{ TDbFaltasTrab }

constructor TDbFaltasTrab.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'FALTASTRAB';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,false,'');
  FDataFalta := CreateCmDbField('DATAFALTA',ftDateTime,true,true,false,true,'');
end;

end.
