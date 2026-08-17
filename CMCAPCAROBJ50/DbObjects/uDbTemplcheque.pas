{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 09/04/2002                             }
{                                                       }
{*******************************************************}

unit uDbTemplcheque;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbTemplcheque = class(TCmDbObject)

  private
    FNumchqsalto: TCmDbField;
    FIdtemplcheque: TCmDbField;
    FQtdedigitosano: TCmDbField;
    FNumlinhassalto: TCmDbField;
    FFlgimpcondensado: TCmDbField;
    FLayout: TCmDbField;
    procedure SetFlgimpcondensado(const Value: TCmDbField);
    procedure SetIdtemplcheque(const Value: TCmDbField);
    procedure SetLayout(const Value: TCmDbField);
    procedure SetNumchqsalto(const Value: TCmDbField);
    procedure SetNumlinhassalto(const Value: TCmDbField);
    procedure SetQtdedigitosano(const Value: TCmDbField);

  public

     Property Qtdedigitosano: TCmDbField read FQtdedigitosano write SetQtdedigitosano;
     Property Numlinhassalto: TCmDbField read FNumlinhassalto write SetNumlinhassalto;
     Property Numchqsalto: TCmDbField read FNumchqsalto write SetNumchqsalto;
     Property Layout: TCmDbField read FLayout write SetLayout;
     Property Idtemplcheque: TCmDbField read FIdtemplcheque write SetIdtemplcheque;
     Property Flgimpcondensado: TCmDbField read FFlgimpcondensado write SetFlgimpcondensado;

     Constructor Create(owner : TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTemplcheque }

constructor TDbTemplcheque.Create(owner : TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TEMPLCHEQUE';

   fQtdedigitosano := CreateCmDbField('QTDEDIGITOSANO',ftString,False,False,False,True,'');
   fNumlinhassalto := CreateCmDbField('NUMLINHASSALTO',ftfloat,False,False,False,True,'');
   fNumchqsalto := CreateCmDbField('NUMCHQSALTO',ftfloat,False,False,False,True,'');
   fLayout := CreateCmDbField('LAYOUT',ftString,False,False,False,True,'');
   fIdtemplcheque := CreateCmDbField('IDTEMPLCHEQUE',ftfloat,True,True,False,True,'');
   fFlgimpcondensado := CreateCmDbField('FLGIMPCONDENSADO',ftString,False,False,False,True,'');
end;

function TDbTemplcheque.Insert: Boolean;
begin

   fIdtemplcheque.AsFloat := GetSequence('TEMPLCHEQUE');
   Result := Inherited Insert;

end;

function TDbTemplcheque.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbTemplcheque.SetFlgimpcondensado(const Value: TCmDbField);
begin
  FFlgimpcondensado := Value;
end;

procedure TDbTemplcheque.SetIdtemplcheque(const Value: TCmDbField);
begin
  FIdtemplcheque := Value;
end;

procedure TDbTemplcheque.SetLayout(const Value: TCmDbField);
begin
  FLayout := Value;
end;

procedure TDbTemplcheque.SetNumchqsalto(const Value: TCmDbField);
begin
  FNumchqsalto := Value;
end;

procedure TDbTemplcheque.SetNumlinhassalto(const Value: TCmDbField);
begin
  FNumlinhassalto := Value;
end;

procedure TDbTemplcheque.SetQtdedigitosano(const Value: TCmDbField);
begin
  FQtdedigitosano := Value;
end;

end.



