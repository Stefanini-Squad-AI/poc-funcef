{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 18/03/2002                             }
{                                                       }
{*******************************************************}

unit uDBTipoMovimentacao;

interface
Uses uCmDbObject, uSistema, DB, uDataBase;

Type
  TDBTipoMovimentacao = class(TCmDbObject)

  private
    FIdcontab: TCmDbField;
    FDesctipomovimentacao: TCmDbField;
    FIdtipomovimentacao: TCmDbField;
    FLancamento: TCmDbField;
    procedure SetDesctipomovimentacao(const Value: TCmDbField);
    procedure SetIdcontab(const Value: TCmDbField);
    procedure SetIdtipomovimentacao(const Value: TCmDbField);
    procedure SetLancamento(const Value: TCmDbField);

  public

    Property Lancamento: TCmDbField read FLancamento write SetLancamento;
    Property Idtipomovimentacao: TCmDbField read FIdtipomovimentacao write SetIdtipomovimentacao;
    Property Idcontab: TCmDbField read FIdcontab write SetIdcontab;
    Property Desctipomovimentacao: TCmDbField read FDesctipomovimentacao write SetDesctipomovimentacao;

    Constructor Create; Override;

    Function Insert :Boolean; Override;
    Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBTipoMovimentacao }

constructor TDBTipoMovimentacao.Create;
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'TIPOMOVIMENTACAO';

   fLancamento := CreateCmDbField('LANCAMENTO',ftString,False,False,False,False,'');
   fIdtipomovimentacao := CreateCmDbField('IDTIPOMOVIMENTACAO',ftfloat,True,True,False,True,'');
   fIdcontab := CreateCmDbField('IDCONTAB',ftfloat,False,False,False,False,'');
   fDesctipomovimentacao := CreateCmDbField('DESCTIPOMOVIMENTACAO',ftString,True,False,False,False,'');
end;

function TDBTipoMovimentacao.Insert: Boolean;
begin
   fIdtipomovimentacao.AsFloat := GetSequence('TIPOMOVIMENTACAO');
   Result := Inherited Insert;
end;

function TDBTipoMovimentacao.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBTipoMovimentacao.SetDesctipomovimentacao(const Value: TCmDbField);
begin
   FDesctipomovimentacao := Value;
end;

procedure TDBTipoMovimentacao.SetIdcontab(const Value: TCmDbField);
begin
   FIdcontab := Value;
end;

procedure TDBTipoMovimentacao.SetIdtipomovimentacao(const Value: TCmDbField);
begin
   FIdtipomovimentacao := Value;
end;

procedure TDBTipoMovimentacao.SetLancamento(const Value: TCmDbField);
begin
   FLancamento := Value;
end;

end.



