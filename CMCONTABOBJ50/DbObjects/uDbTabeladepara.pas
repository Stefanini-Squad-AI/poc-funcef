{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Veronica Almeida                }
{ Atualizado Em: 19/08/2002                             }
{                                                       }
{*******************************************************}

unit uDbTabeladepara;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTabeladepara = class(TCmDbObject)

  private
    FIdtabelaref: TCmDbField;
    FIdtabeladepara: TCmDbField;
    FNometabela: TCmDbField;
    FNomecampoplano: TCmDbField;
    procedure SetIdtabeladepara(const Value: TCmDbField);
    procedure SetIdtabelaref(const Value: TCmDbField);
    procedure SetNomecampoplano(const Value: TCmDbField);
    procedure SetNometabela(const Value: TCmDbField);

  public

     Property Nometabela: TCmDbField read FNometabela write SetNometabela;
     Property Nomecampoplano: TCmDbField read FNomecampoplano write SetNomecampoplano;
     Property Idtabelaref: TCmDbField read FIdtabelaref write SetIdtabelaref;
     Property Idtabeladepara: TCmDbField read FIdtabeladepara write SetIdtabeladepara;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTabeladepara }

constructor TDbTabeladepara.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TABELADEPARA';

   fNometabela     := CreateCmDbField('NOMETABELA',ftString,False,False,False,True,'');
   fNomecampoplano := CreateCmDbField('NOMECAMPOPLANO',ftString,False,False,False,True,'');
   fIdtabelaref    := CreateCmDbField('IDTABELAREF',ftfloat,False,False,False,True,'');
   fIdtabeladepara := CreateCmDbField('IDTABELADEPARA',ftfloat,True,True,False,True,'');
end;

function TDbTabeladepara.Insert: Boolean;
begin

   fIdtabeladepara.AsFloat := GetSequence('TABELADEPARA');
   Result := Inherited Insert;

end;


procedure TDbTabeladepara.SetIdtabeladepara(const Value: TCmDbField);
begin
  FIdtabeladepara := Value;
end;

procedure TDbTabeladepara.SetIdtabelaref(const Value: TCmDbField);
begin
  FIdtabelaref := Value;
end;

procedure TDbTabeladepara.SetNomecampoplano(const Value: TCmDbField);
begin
  FNomecampoplano := Value;
end;

procedure TDbTabeladepara.SetNometabela(const Value: TCmDbField);
begin
  FNometabela := Value;
end;

end.



