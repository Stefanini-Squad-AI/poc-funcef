{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 23/10/2002                             }
{                                                       }
{*******************************************************}

unit uDbLancPrevPerImob;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbLancPrevPerImob = class(TCmDbObject)

  private
    FIdlancprevimob: TCmDbField;
    FVlrdia: TCmDbField;
    FIdlancprevcontimo: TCmDbField;
    procedure SetIdlancprevcontimo(const Value: TCmDbField);
    procedure SetIdlancprevimob(const Value: TCmDbField);
    procedure SetVlrdia(const Value: TCmDbField);

  public

     Property Vlrdia: TCmDbField read FVlrdia write SetVlrdia;
     Property Idlancprevimob: TCmDbField read FIdlancprevimob write SetIdlancprevimob;
     Property Idlancprevcontimo: TCmDbField read FIdlancprevcontimo write SetIdlancprevcontimo;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbLancPrevPerImob }

constructor TDbLancPrevPerImob.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LANCPREVPERIMOB';

   fVlrdia := CreateCmDbField('VLRDIA',ftfloat,False,False,False,True,'');
   fIdlancprevimob := CreateCmDbField('IDLANCPREVIMOB',ftfloat,True,True,False,True,'');
   fIdlancprevcontimo := CreateCmDbField('IDLANCPREVCONTIMO',ftfloat,True,True,False,True,'');
end;

function TDbLancPrevPerImob.Insert: Boolean;
begin
   Result := Inherited Insert;
end;


procedure TDbLancPrevPerImob.SetIdlancprevcontimo(const Value: TCmDbField);
begin
  FIdlancprevcontimo := Value;
end;

procedure TDbLancPrevPerImob.SetIdlancprevimob(const Value: TCmDbField);
begin
  FIdlancprevimob := Value;
end;

procedure TDbLancPrevPerImob.SetVlrdia(const Value: TCmDbField);
begin
  FVlrdia := Value;
end;

end.



