{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 13/03/2002                             }
{                                                       }
{*******************************************************}

unit uDbSCItemOC;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbSCItemOC = class(TCmDbObject)

  private
    FIdItemOC: TCmDbField;
    FNumSolCompra: TCmDbField;
    FIdItemSoli: TCmDbField;
    procedure SetIdItemOC(const Value: TCmDbField);
    procedure SetIdItemSoli(const Value: TCmDbField);
    procedure SetNumSolCompra(const Value: TCmDbField);

  public

     Property NumSolCompra : TCmDbField read FNumSolCompra write SetNumSolCompra;
     Property IdItemSoli   : TCmDbField read FIdItemSoli write SetIdItemSoli;
     Property IdItemOC     : TCmDbField read FIdItemOC write SetIdItemOC;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbSCItemOC }

constructor TDbSCItemOC.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'SCITEMOC';

  fNumsolcompra := CreateCmDbField('NUMSOLCOMPRA',ftfloat,True,True,False,True,'');
  fIditemsoli   := CreateCmDbField('IDITEMSOLI'  ,ftfloat,True,True,False,True,'');
  fIditemoc     := CreateCmDbField('IDITEMOC'    ,ftfloat,True,True,False,True,'');
end;

function TDbSCItemOC.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbSCItemOC.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbSCItemOC.SetIdItemOC(const Value: TCmDbField);
begin
  FIdItemOC := Value;
end;

procedure TDbSCItemOC.SetIdItemSoli(const Value: TCmDbField);
begin
  FIdItemSoli := Value;
end;

procedure TDbSCItemOC.SetNumSolCompra(const Value: TCmDbField);
begin
  FNumSolCompra := Value;
end;

end.



