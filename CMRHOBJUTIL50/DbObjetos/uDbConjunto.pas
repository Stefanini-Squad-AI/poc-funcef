{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 01/04/2003                             }
{                                                       }
{*******************************************************}

unit uDbConjunto;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDbConjunto = class(TCmDbObject)

  private
    FIdresponsavel: TCmDbField;
    FDescconjunto: TCmDbField;
    FDisponivel: TCmDbField;
    FIdpessoa: TCmDbField;
    FAlugado: TCmDbField;
    FIdconjunto: TCmDbField;
    FIdlocalizacao: TCmDbField;
    procedure SetAlugado(const Value: TCmDbField);
    procedure SetDescconjunto(const Value: TCmDbField);
    procedure SetDisponivel(const Value: TCmDbField);
    procedure SetIdconjunto(const Value: TCmDbField);
    procedure SetIdlocalizacao(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdresponsavel(const Value: TCmDbField);

  public

     Property Idresponsavel: TCmDbField read FIdresponsavel write SetIdresponsavel;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idlocalizacao: TCmDbField read FIdlocalizacao write SetIdlocalizacao;
     Property Idconjunto: TCmDbField read FIdconjunto write SetIdconjunto;
     Property Disponivel: TCmDbField read FDisponivel write SetDisponivel;
     Property Descconjunto: TCmDbField read FDescconjunto write SetDescconjunto;
     Property Alugado: TCmDbField read FAlugado write SetAlugado;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbConjunto }

constructor TDbConjunto.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONJUNTO';

   fIdresponsavel := CreateCmDbField('IDRESPONSAVEL',ftfloat,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdlocalizacao := CreateCmDbField('IDLOCALIZACAO',ftfloat,True,False,False,True,'');
   fIdconjunto := CreateCmDbField('IDCONJUNTO',ftfloat,True,True,False,True,'');
   fDisponivel := CreateCmDbField('DISPONIVEL',ftfloat,True,False,False,True,'');
   fDescconjunto := CreateCmDbField('DESCCONJUNTO',ftString,True,False,False,True,'');
   fAlugado := CreateCmDbField('ALUGADO',ftfloat,True,False,False,True,'');
end;

function TDbConjunto.Insert: Boolean;
begin

   fIdconjunto.AsFloat := GetSequence('CONJUNTO');
   Result := Inherited Insert;

end;


procedure TDbConjunto.SetAlugado(const Value: TCmDbField);
begin
  FAlugado := Value;
end;

procedure TDbConjunto.SetDescconjunto(const Value: TCmDbField);
begin
  FDescconjunto := Value;
end;

procedure TDbConjunto.SetDisponivel(const Value: TCmDbField);
begin
  FDisponivel := Value;
end;

procedure TDbConjunto.SetIdconjunto(const Value: TCmDbField);
begin
  FIdconjunto := Value;
end;

procedure TDbConjunto.SetIdlocalizacao(const Value: TCmDbField);
begin
  FIdlocalizacao := Value;
end;

procedure TDbConjunto.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbConjunto.SetIdresponsavel(const Value: TCmDbField);
begin
  FIdresponsavel := Value;
end;

end.



