{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 30/08/2002                             }
{                                                       }
{*******************************************************}

unit uDBReavaliacao;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB;

Type
  TDBReavaliacao = class(TCmDbObject)

  private
    FIdmovimentacao: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdreavaliacao: TCmDbField;
    FFlgultreaval: TCmDbField;
    FDatareavaliacao: TCmDbField;
    FIdbem: TCmDbField;
    procedure SetDatareavaliacao(const Value: TCmDbField);
    procedure SetFlgultreaval(const Value: TCmDbField);
    procedure SetIdbem(const Value: TCmDbField);
    procedure SetIdmovimentacao(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdreavaliacao(const Value: TCmDbField);

  public

     Property Idreavaliacao: TCmDbField read FIdreavaliacao write SetIdreavaliacao;
     Property Idmovimentacao: TCmDbField read FIdmovimentacao write SetIdmovimentacao;
     Property Datareavaliacao: TCmDbField read FDatareavaliacao write SetDatareavaliacao;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idbem: TCmDbField read FIdbem write SetIdbem;
     Property Flgultreaval: TCmDbField read FFlgultreaval write SetFlgultreaval;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDBReavaliacao }

constructor TDBReavaliacao.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'REAVALIACAO';

   fIdreavaliacao := CreateCmDbField('IDREAVALIACAO',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdmovimentacao := CreateCmDbField('IDMOVIMENTACAO',ftfloat,False,False,False,True,'');
   fIdbem := CreateCmDbField('IDBEM',ftfloat,False,False,False,True,'');
   fFlgultreaval := CreateCmDbField('FLGULTREAVAL',ftfloat,False,False,False,False,'');
   fDatareavaliacao := CreateCmDbField('DATAREAVALIACAO',ftDateTime,False,False,False,True,'');
end;

function TDBReavaliacao.Insert: Boolean;
begin
   fIdreavaliacao.AsFloat := GetSequence('REAVALIACAO');
   Result := Inherited Insert;
end;

procedure TDBReavaliacao.SetDatareavaliacao(const Value: TCmDbField);
begin
  FDatareavaliacao := Value;
end;

procedure TDBReavaliacao.SetFlgultreaval(const Value: TCmDbField);
begin
  FFlgultreaval := Value;
end;

procedure TDBReavaliacao.SetIdbem(const Value: TCmDbField);
begin
  FIdbem := Value;
end;

procedure TDBReavaliacao.SetIdmovimentacao(const Value: TCmDbField);
begin
  FIdmovimentacao := Value;
end;

procedure TDBReavaliacao.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBReavaliacao.SetIdreavaliacao(const Value: TCmDbField);
begin
  FIdreavaliacao := Value;
end;

end.



