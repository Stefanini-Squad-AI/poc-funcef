{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ Analista Responsável: Igor Maffei Libonati Maia       }
{ Atualizado Em: 10/11/2001                             }
{                                                       }
{*******************************************************}

unit uDbConver;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbConver = class(TCmDbObject)

  private
    FCodMedida: TCmDbField;
    FCodProduto: TCmDbField;
    FFator: TCmDbField;
    procedure SetCodMedida(const Value: TCmDbField);
    procedure SetCodProduto(const Value: TCmDbField);
    procedure SetFator(const Value: TCmDbField);

  public
     Property Fator      : TCmDbField read FFator write SetFator;
     Property CodProduto : TCmDbField read FCodProduto write SetCodProduto;
     Property CodMedida  : TCmDbField read FCodMedida write SetCodMedida;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function Update :Boolean; Override;
     Function Delete :Boolean; Override;     
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbConver }

constructor TDbConver.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONVER';

 fCodproduto := CreateCmDbField('CODPRODUTO',ftString,False,True);
 fCodmedida  := CreateCmDbField('CODMEDIDA',ftString,False,True);
 fFator      := CreateCmDbField('FATOR',ftfloat,True,False);
end;

function TDbConver.Delete: Boolean;
begin
   Result := Inherited Delete;
end;

function TDbConver.Insert: Boolean;
begin
   Result := Inherited Insert;

end;

function TDbConver.LoadFromDb: Boolean;
begin
   Result := Inherited LoadFromDb;

end;

procedure TDbConver.SetCodMedida(const Value: TCmDbField);
begin
  FCodMedida := Value;
end;

procedure TDbConver.SetCodProduto(const Value: TCmDbField);
begin
  FCodProduto := Value;
end;

procedure TDbConver.SetFator(const Value: TCmDbField);
begin
  FFator := Value;
end;

function TDbConver.Update: Boolean;
begin
   Result := Inherited Update;
end;

end.



