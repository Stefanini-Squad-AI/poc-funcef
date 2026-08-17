{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 16/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbSituacao;

interface

Uses uCmDbObject, uSistema, DB, uCmCustomCdbObject;

Type
  TDbSituacao = class(TCmDbObject)

  private
    FDescsituacao: TCmDbField;
    FIdsituacao: TCmDbField;
    procedure SetDescsituacao(const Value: TCmDbField);
    procedure SetIdsituacao(const Value: TCmDbField);

  public

     Property Idsituacao: TCmDbField read FIdsituacao write SetIdsituacao;
     Property Descsituacao: TCmDbField read FDescsituacao write SetDescsituacao;

     Constructor Create(Aowner: TCmCustomCdbObject) ; Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbSituacao }

constructor TDbSituacao.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'SITUACAO';

   fIdsituacao := CreateCmDbField('IDSITUACAO',ftfloat,True,True,False,True,'');
   fDescsituacao := CreateCmDbField('DESCSITUACAO',ftString,False,False,False,True,'');
end;

function TDbSituacao.Insert: Boolean;
begin
   fIdSituacao.AsFloat := GetSequence('SITUACAO');
   Result := Inherited Insert;
end;

function TDbSituacao.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbSituacao.SetDescsituacao(const Value: TCmDbField);
begin
  FDescsituacao := Value;
end;

procedure TDbSituacao.SetIdsituacao(const Value: TCmDbField);
begin
  FIdsituacao := Value;
end;

end.



