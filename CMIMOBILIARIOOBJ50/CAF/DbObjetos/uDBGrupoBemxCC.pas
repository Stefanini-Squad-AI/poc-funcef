{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 27/02/2002                             }
{                                                       }
{*******************************************************}

unit uDBGrupoBemxCC;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDBGrupoBemxCC = class(TCmDbObject)

  private
    FCodcentrocusto: TCmDbField;
    FIdgrupo: TCmDbField;
    FIdempresa: TCmDbField;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdgrupo(const Value: TCmDbField);

  public

     Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBGrupoBemxCC }

constructor TDBGrupoBemxCC.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;
   TableName := 'GRUPOBEMXCC';
   fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,True,True,False,True,'');
   fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,True,True,False,True,'');
   fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,True,True,False,True,'');
end;

function TDBGrupoBemxCC.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBGrupoBemxCC.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBGrupoBemxCC.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDBGrupoBemxCC.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDBGrupoBemxCC.SetIdgrupo(const Value: TCmDbField);
begin
  FIdgrupo := Value;
end;

end.



