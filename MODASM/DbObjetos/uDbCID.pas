{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/02/2002                                 }
{                                                       }
{*******************************************************}

unit uDbCID;

interface

uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

type
  TDbCID = class(TCmDbObject)
  private
    FCodCID: TCmDbField;
    FDescrCID: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property CodCID: TCmDbField read FCodCID write FCodCID;    
    property DescrCID: TCmDbField read FDescrCID write FDescrCID;
  end;

implementation

{ TDbCID }

constructor TDbCID.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'CID';

  FCodCID := CreateCmDbField('CodCID',ftString,true,true,false,false,'');
  FDescrCID := CreateCmDbField('DescrCID',ftString,true,false,false,false,'');
end;

end.
