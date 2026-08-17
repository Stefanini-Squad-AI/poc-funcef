{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcio Motta                    }
{ Atualizado Em: 08/04/2004                             }
{                                                       }
{*******************************************************}

unit uDbIndLayOutxInd;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbIndLayOutxInd = class(TCmDbObject)

  private
    FIdlayoutimp: TCmDbField;
    FPosindicador: TCmDbField;
    FIdindicador: TCmDbField;
    procedure SetIdindicador(const Value: TCmDbField);
    procedure SetIdlayoutimp(const Value: TCmDbField);
    procedure SetPosindicador(const Value: TCmDbField);

  public

    Property Posindicador : TCmDbField read FPosindicador write SetPosindicador;
    Property Idlayoutimp  : TCmDbField read FIdlayoutimp  write SetIdlayoutimp;
    Property Idindicador  : TCmDbField read FIdindicador  write SetIdindicador;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
  End;

implementation

{ TDbIndLayOutxInd }

constructor TDbIndLayOutxInd.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INDLAYOUTXIND';

  fPosindicador := CreateCmDbField('POSINDICADOR',ftfloat,False,False,False,True,'');
  fIdlayoutimp  := CreateCmDbField('IDLAYOUTIMP',ftfloat,True,True,False,True,'');
  fIdindicador  := CreateCmDbField('IDINDICADOR',ftfloat,True,True,False,True,'');
end;

function TDbIndLayOutxInd.Insert: Boolean;
begin
  Result := Inherited Insert;
end;


procedure TDbIndLayOutxInd.SetIdindicador(const Value: TCmDbField);
begin
  FIdindicador := Value;
end;

procedure TDbIndLayOutxInd.SetIdlayoutimp(const Value: TCmDbField);
begin
  FIdlayoutimp := Value;
end;

procedure TDbIndLayOutxInd.SetPosindicador(const Value: TCmDbField);
begin
  FPosindicador := Value;
end;


end.



