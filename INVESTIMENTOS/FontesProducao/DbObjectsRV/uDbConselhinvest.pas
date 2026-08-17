//*****************************************************************************
// Data	     : 14/03/2006
// Código    :
// Pendencia : 20704
// SOL       : 36184
// Motivo(S) : Implementação da CdsConselhInvest e suas funções
//*****************************************************************************

unit uDbConselhinvest;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbConselhinvest = class(TCmDbObject)

  private
    FDesconselinvest: TCmDbField;
    FIdconselhinvest: TCmDbField;
    procedure SetDesconselinvest(const Value: TCmDbField);
    procedure SetIdconselhinvest(const Value: TCmDbField);

  public

     Property Idconselhinvest: TCmDbField read FIdconselhinvest write SetIdconselhinvest;
     Property Desconselinvest: TCmDbField read FDesconselinvest write SetDesconselinvest;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbConselhinvest }

constructor TDbConselhinvest.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONSELHINVEST';

   fIdconselhinvest := CreateCmDbField('IDCONSELHINVEST',ftfloat,True,True,False,True,'');
   fDesconselinvest := CreateCmDbField('DESCONSELINVEST',ftString,False,False,False,True,'');
end;

function TDbConselhinvest.Insert: Boolean;
begin

   Result := Inherited Insert;

end;


procedure TDbConselhinvest.SetDesconselinvest(const Value: TCmDbField);
begin
  FDesconselinvest := Value;
end;

procedure TDbConselhinvest.SetIdconselhinvest(const Value: TCmDbField);
begin
  FIdconselhinvest := Value;
end;

end.



