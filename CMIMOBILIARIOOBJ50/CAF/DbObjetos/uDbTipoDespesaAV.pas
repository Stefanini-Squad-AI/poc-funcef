{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 21/02/2002                             }
{                                                       }
{*******************************************************}

unit uDBTipoDespesaAV;

interface

Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDBTipoDespesaAV = class(TCmDbObject)

  private
    FDestipodespesa: TCmDbField;
    FIdtipodespesa: TCmDbField;
    procedure SetDestipodespesa(const Value: TCmDbField);
    procedure SetIdtipodespesa(const Value: TCmDbField);

  public

     Property Idtipodespesa: TCmDbField read FIdtipodespesa write SetIdtipodespesa;
     Property Destipodespesa: TCmDbField read FDestipodespesa write SetDestipodespesa;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBTipoDespesaAV }

constructor TDBTipoDespesaAV.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'TIPODESPESAAV';

   fIdtipodespesa := CreateCmDbField('IDTIPODESPESA',ftfloat,True,True,False,True,'');
   fDestipodespesa := CreateCmDbField('DESTIPODESPESA',ftString,False,False,False,True,'');
end;

function TDBTipoDespesaAV.Insert: Boolean;
begin
   fIdtipodespesa.AsFloat := GetSequence('TIPODESPESAAV');
   Result := Inherited Insert;
end;

function TDBTipoDespesaAV.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBTipoDespesaAV.SetDestipodespesa(const Value: TCmDbField);
begin
  FDestipodespesa := Value;
end;

procedure TDBTipoDespesaAV.SetIdtipodespesa(const Value: TCmDbField);
begin
  FIdtipodespesa := Value;
end;

end.



