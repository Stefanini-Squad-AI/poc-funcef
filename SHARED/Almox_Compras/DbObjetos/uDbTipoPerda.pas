{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Igor Maia                       }
{ Atualizado Em: 07/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbTipoPerda;

interface

Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbTipoPerda = class(TCmDbObject)

  private
    FConsumo: TCmDbField;
    FDescTipoPerda: TCmDbField;
    FIdTipoPerda: TCmDbField;
    procedure SetConsumo(const Value: TCmDbField);
    procedure SetDescTipoPerda(const Value: TCmDbField);
    procedure SetIdTipoPerda(const Value: TCmDbField);

  public

     Property IdTipoPerda    : TCmDbField read FIdTipoPerda write SetIdTipoPerda;
     Property DescTipoPerda  : TCmDbField read FDescTipoPerda write SetDescTipoPerda;
     Property Consumo        : TCmDbField read FConsumo write SetConsumo;

     Constructor Create(aOwner : TCmCustomCdbObject ); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTipoPerda }

constructor TDbTipoPerda.Create(aOwner : TCmCustomCdbObject );
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPOPERDA';

   fIdtipoperda   := CreateCmDbField('IDTIPOPERDA',ftfloat,True,True,False,True,'');
   fDesctipoperda := CreateCmDbField('DESCTIPOPERDA',ftString,True,False,False,True,'');
   fConsumo       := CreateCmDbField('CONSUMO',ftString,False,False,False,True,'');
end;

function TDbTipoPerda.Insert: Boolean;
begin

   fIdtipoperda.AsFloat := GetSequence('TIPOPERDA');
   Result := Inherited Insert;

end;

function TDbTipoPerda.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbTipoPerda.SetConsumo(const Value: TCmDbField);
begin
  FConsumo := Value;
end;

procedure TDbTipoPerda.SetDescTipoPerda(const Value: TCmDbField);
begin
  FDescTipoPerda := Value;
end;

procedure TDbTipoPerda.SetIdTipoPerda(const Value: TCmDbField);
begin
  FIdTipoPerda := Value;
end;

end.



