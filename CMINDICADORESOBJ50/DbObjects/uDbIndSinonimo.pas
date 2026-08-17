{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 01/04/2004                             }
{                                                       }
{*******************************************************}

unit uDbIndSinonimo;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbIndSinonimo = class(TCmDbObject)

  private
    FIdindicador: TCmDbField;
    FIdsinonimo: TCmDbField;
    FSinonimo: TCmDbField;
    procedure SetIdindicador(const Value: TCmDbField);
    procedure SetIdsinonimo(const Value: TCmDbField);
    procedure SetSinonimo(const Value: TCmDbField);

  public

     Property Sinonimo: TCmDbField read FSinonimo write SetSinonimo;
     Property Idsinonimo: TCmDbField read FIdsinonimo write SetIdsinonimo;
     Property Idindicador: TCmDbField read FIdindicador write SetIdindicador;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbIndSinonimo }

constructor TDbIndSinonimo.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INDSINONIMO';

  fSinonimo := CreateCmDbField('SINONIMO',ftString,False,False,False,True,'Sinônimo');
  fIdsinonimo := CreateCmDbField('IDSINONIMO',ftfloat,True,True,False,True,'ID Sinônimo');
  fIdindicador := CreateCmDbField('IDINDICADOR',ftfloat,False,False,False,True,'ID Indicador');
end;

function TDbIndSinonimo.Insert: Boolean;
begin
  fIdsinonimo.AsFloat := GetSequence('INDSINONIMO');
  Result := Inherited Insert;
end;


procedure TDbIndSinonimo.SetIdindicador(const Value: TCmDbField);
begin
  FIdindicador := Value;
end;

procedure TDbIndSinonimo.SetIdsinonimo(const Value: TCmDbField);
begin
  FIdsinonimo := Value;
end;

procedure TDbIndSinonimo.SetSinonimo(const Value: TCmDbField);
begin
  FSinonimo := Value;
end;

end.



