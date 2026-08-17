{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 13/02/2006                             }
{                                                       }
{*******************************************************}

unit uDb_TelEndPess;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDb_TelEndPess = class(TCmDbObject)

  private
    FDdi: TCmDbField;
    FTipo: TCmDbField;
    FIdendereco: TCmDbField;
    FDdd: TCmDbField;
    FColuna: TCmDbField;
    FNumero: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    FIdtelefone: TCmDbField;
    FTrguserinclusao: TCmDbField;
    procedure SetColuna(const Value: TCmDbField);
    procedure SetDdd(const Value: TCmDbField);
    procedure SetDdi(const Value: TCmDbField);
    procedure SetIdendereco(const Value: TCmDbField);
    procedure SetIdtelefone(const Value: TCmDbField);
    procedure SetNumero(const Value: TCmDbField);
    procedure SetTipo(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);

  public

     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Tipo: TCmDbField read FTipo write SetTipo;
     Property Numero: TCmDbField read FNumero write SetNumero;
     Property Idtelefone: TCmDbField read FIdtelefone write SetIdtelefone;
     Property Idendereco: TCmDbField read FIdendereco write SetIdendereco;
     Property Ddi: TCmDbField read FDdi write SetDdi;
     Property Ddd: TCmDbField read FDdd write SetDdd;
     Property Coluna: TCmDbField read FColuna write SetColuna;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDb_TelEndPess }

constructor TDb_TelEndPess.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TELENDPESS';

   fTipo := CreateCmDbField('TIPO',ftString,False,False,False,True,'Tipo');
   fNumero := CreateCmDbField('NUMERO',ftString,False,False,False,True,'Número');
   fIdtelefone := CreateCmDbField('IDTELEFONE',ftfloat,True,True,False,True,'Id. Telefone');
   fIdendereco := CreateCmDbField('IDENDERECO',ftfloat,False,False,False,True,'Id. Endereço');
   fDdi := CreateCmDbField('DDI',ftString,False,False,False,True,'DDI');
   fDdd := CreateCmDbField('DDD',ftString,False,False,False,True,'DDD');
   fColuna := CreateCmDbField('COLUNA',ftString,False,False,False,True,'Coluna');
end;

function TDb_TelEndPess.Insert: Boolean;
begin

   fIdtelefone.AsFloat := GetSequence('TELENDPESS');
   Result := Inherited Insert;

end;


procedure TDb_TelEndPess.SetColuna(const Value: TCmDbField);
begin
  FColuna := Value;
end;

procedure TDb_TelEndPess.SetDdd(const Value: TCmDbField);
begin
  FDdd := Value;
end;

procedure TDb_TelEndPess.SetDdi(const Value: TCmDbField);
begin
  FDdi := Value;
end;

procedure TDb_TelEndPess.SetIdendereco(const Value: TCmDbField);
begin
  FIdendereco := Value;
end;

procedure TDb_TelEndPess.SetIdtelefone(const Value: TCmDbField);
begin
  FIdtelefone := Value;
end;

procedure TDb_TelEndPess.SetNumero(const Value: TCmDbField);
begin
  FNumero := Value;
end;

procedure TDb_TelEndPess.SetTipo(const Value: TCmDbField);
begin
  FTipo := Value;
end;

procedure TDb_TelEndPess.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDb_TelEndPess.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



