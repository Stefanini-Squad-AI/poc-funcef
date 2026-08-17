{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 16/01/2002                             }
{                                                       }
{*******************************************************}

unit uDbArtxForn;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbArtxForn = class(TCmDbObject)

  private
    FCodArtigo: TCmDbField;
    FIdForCli: TCmDbField;
    procedure SetCodArtigo(const Value: TCmDbField);
    procedure SetIdForCli(const Value: TCmDbField);

  public

     Property IdForCli  : TCmDbField read FIdForCli write SetIdForCli;
     Property CodArtigo : TCmDbField read FCodArtigo write SetCodArtigo;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbArtxForn }

constructor TDbArtxForn.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'ARTXFORN';

   fIdforcli  := CreateCmDbField('IDFORCLI'  ,ftfloat,True,True,False,True,'Fornecedor');
   fCodartigo := CreateCmDbField('CODARTIGO' ,ftString,True,True,False,True,'Artigo');
end;

function TDbArtxForn.Insert: Boolean;
begin

   Result := Inherited Insert;

end;

function TDbArtxForn.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbArtxForn.SetCodArtigo(const Value: TCmDbField);
begin
  FCodArtigo := Value;
end;

procedure TDbArtxForn.SetIdForCli(const Value: TCmDbField);
begin
  FIdForCli := Value;
end;

end.



