{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 09/01/2004                             }
{                                                       }
{*******************************************************}

unit uDbRetInssOutros;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRetInssOutros = class(TCmDbObject)

  private
    FAnomes: TCmDbField;
    FVlretido: TCmDbField;
    FIdpessoa: TCmDbField;
    procedure SetAnomes(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetVlretido(const Value: TCmDbField);

  public

     Property Vlretido: TCmDbField read FVlretido write SetVlretido;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Anomes: TCmDbField read FAnomes write SetAnomes;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbRetInssOutros }

constructor TDbRetInssOutros.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RETINSSOUTROS';

  fVlretido := CreateCmDbField('VLRETIDO',ftfloat,False,False,False,False,'Valor Retido');
  fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'Fornecedor');
  fAnomes   := CreateCmDbField('ANOMES',ftString,True,True,False,True,'Mês');
end;

procedure TDbRetInssOutros.SetAnomes(const Value: TCmDbField);
begin
  FAnomes := Value;
end;

procedure TDbRetInssOutros.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbRetInssOutros.SetVlretido(const Value: TCmDbField);
begin
  FVlretido := Value;
end;

end.



