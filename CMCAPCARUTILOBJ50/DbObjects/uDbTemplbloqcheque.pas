{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 09/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbTemplbloqcheque;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbTemplbloqcheque = class(TCmDbObject)

  private
    FCodbloqche: TCmDbField;
    FFlgimpcondensado: TCmDbField;
    FNumbloqsalto: TCmDbField;
    FLayout: TCmDbField;
    FNumlinhassalto: TCmDbField;
    procedure SetCodbloqche(const Value: TCmDbField);
    procedure SetFlgimpcondensado(const Value: TCmDbField);
    procedure SetLayout(const Value: TCmDbField);
    procedure SetNumbloqsalto(const Value: TCmDbField);
    procedure SetNumlinhassalto(const Value: TCmDbField);

  public

     Property Numlinhassalto: TCmDbField read FNumlinhassalto write SetNumlinhassalto;
     Property Numbloqsalto: TCmDbField read FNumbloqsalto write SetNumbloqsalto;
     Property Layout: TCmDbField read FLayout write SetLayout;
     Property Flgimpcondensado: TCmDbField read FFlgimpcondensado write SetFlgimpcondensado;
     Property Codbloqche: TCmDbField read FCodbloqche write SetCodbloqche;

     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTemplbloqcheque }

constructor TDbTemplbloqcheque.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TEMPLBLOQCHEQUE';

   fNumlinhassalto := CreateCmDbField('NUMLINHASSALTO',ftfloat,False,False,False,True,'');
   fNumbloqsalto := CreateCmDbField('NUMBLOQSALTO',ftfloat,False,False,False,True,'');
   fLayout := CreateCmDbField('LAYOUT',ftString,False,False,False,True,'');
   fFlgimpcondensado := CreateCmDbField('FLGIMPCONDENSADO',ftString,False,False,False,True,'');
   fCodbloqche := CreateCmDbField('CODBLOQCHE',ftfloat,True,True,False,True,'');
end;

function TDbTemplbloqcheque.Insert: Boolean;
begin

   fCodbloqche.AsFloat := GetSequence('TEMPLBLOQCHEQUE');
   Result := Inherited Insert;

end;

function TDbTemplbloqcheque.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbTemplbloqcheque.SetCodbloqche(const Value: TCmDbField);
begin
  FCodbloqche := Value;
end;

procedure TDbTemplbloqcheque.SetFlgimpcondensado(const Value: TCmDbField);
begin
  FFlgimpcondensado := Value;
end;

procedure TDbTemplbloqcheque.SetLayout(const Value: TCmDbField);
begin
  FLayout := Value;
end;

procedure TDbTemplbloqcheque.SetNumbloqsalto(const Value: TCmDbField);
begin
  FNumbloqsalto := Value;
end;

procedure TDbTemplbloqcheque.SetNumlinhassalto(const Value: TCmDbField);
begin
  FNumlinhassalto := Value;
end;

end.



