{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 07/05/2004                             }
{                                                       }
{*******************************************************}

unit uDBBemCotacao;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDBBemCotacao = class(TCmDbObject)

  private
    FIdbemcotacao: TCmDbField;
    FValorcotacao: TCmDbField;
    FIdbem: TCmDbField;
    FIdpessoa: TCmDbField;
    FDatacotacao: TCmDbField;
    procedure SetDatacotacao(const Value: TCmDbField);
    procedure SetIdbem(const Value: TCmDbField);
    procedure SetIdbemcotacao(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetValorcotacao(const Value: TCmDbField);

  public

     Property Idbem: TCmDbField read FIdbem write SetIdbem;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idbemcotacao: TCmDbField read FIdbemcotacao write SetIdbemcotacao;
     Property Datacotacao: TCmDbField read FDatacotacao write SetDatacotacao;
     Property Valorcotacao: TCmDbField read FValorcotacao write SetValorcotacao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBBemCotacao }

constructor TDBBemCotacao.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'BEMCOTACAO';

   fValorcotacao := CreateCmDbField('VALORCOTACAO',ftfloat,False,False,False,False,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,False,'');
   fIdbemcotacao := CreateCmDbField('IDBEMCOTACAO',ftfloat,True,True,False,False,'');
   fIdbem := CreateCmDbField('IDBEM',ftfloat,True,True,False,False,'');
   fDatacotacao := CreateCmDbField('DATACOTACAO',ftDateTime,False,False,False,True,'');
end;

function TDBBemCotacao.Insert: Boolean;
begin
   fIdbemcotacao.AsFloat := GetSequence('BEMCOTACAO');
   Result := Inherited Insert;
end;

procedure TDBBemCotacao.SetDatacotacao(const Value: TCmDbField);
begin
  FDatacotacao := Value;
end;

procedure TDBBemCotacao.SetIdbem(const Value: TCmDbField);
begin
  FIdbem := Value;
end;

procedure TDBBemCotacao.SetIdbemcotacao(const Value: TCmDbField);
begin
  FIdbemcotacao := Value;
end;

procedure TDBBemCotacao.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBBemCotacao.SetValorcotacao(const Value: TCmDbField);
begin
  FValorcotacao := Value;
end;

end.

