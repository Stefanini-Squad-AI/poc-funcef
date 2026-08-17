{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 18/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbDiaExtraTrab;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbDiaExtraTrab = class(TCmDbObject)
  private
    FDiaTrab: TCmDbField;
    FIdPessoa: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdPessoa: TCmDbField read FIdPessoa write FIdPessoa;
    property DiaTrab: TCmDbField read FDiaTrab write FDiaTrab;
  end;

implementation

{ TDbDiaExtraTrab }

constructor TDbDiaExtraTrab.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'DIAEXTRATRAB';

  FIdPessoa := CreateCmDbField('IDPESSOA',ftFloat,true,true,false,false,'');
  FDiaTrab := CreateCmDbField('DIATRAB',ftDateTime,true,true,false,true,'');
end;

end.
