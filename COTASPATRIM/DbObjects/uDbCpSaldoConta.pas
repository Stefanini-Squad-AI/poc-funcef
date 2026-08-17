{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 30/05/2007                             }
{                                                       }
{*******************************************************}

unit uDbCpSaldoConta;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCpSaldoConta = class(TCmDbObject)

  private
    FIdcpconta: TCmDbField;
    FSaldocotas: TCmDbField;
    FDtsaldo: TCmDbField;
    FIdcpsaldoconta: TCmDbField;
    FIdcpvalorcota: TCmDbField;
    procedure SetDtsaldo(const Value: TCmDbField);
    procedure SetIdcpconta(const Value: TCmDbField);
    procedure SetIdcpsaldoconta(const Value: TCmDbField);
    procedure SetSaldocotas(const Value: TCmDbField);
    procedure SetIdcpvalorcota(const Value: TCmDbField);

  public

     Property Saldocotas: TCmDbField read FSaldocotas write SetSaldocotas;
     Property Idcpsaldoconta: TCmDbField read FIdcpsaldoconta write SetIdcpsaldoconta;
     Property Idcpconta: TCmDbField read FIdcpconta write SetIdcpconta;
     Property Dtsaldo: TCmDbField read FDtsaldo write SetDtsaldo;
     Property Idcpvalorcota: TCmDbField read FIdcpvalorcota write SetIdcpvalorcota;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCpSaldoConta }

constructor TDbCpSaldoConta.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CPSALDOCONTA';

   fSaldocotas := CreateCmDbField('SALDOCOTAS',ftfloat,True,False,False,False,'Saldo em cotas');
   fIdcpsaldoconta := CreateCmDbField('IDCPSALDOCONTA',ftfloat,True,True,False,True,'Id. Saldo da Conta');
   fIdcpconta := CreateCmDbField('IDCPCONTA',ftfloat,True,False,False,True,'Id. Conta');
   fDtsaldo := CreateCmDbField('DTSALDO',ftDateTime,True,False,False,True,'Data');
   fIdcpvalorcota := CreateCmDbField('IDCPVALORCOTA',ftfloat,True,False,False,True,'Id. Valor da Cota');
end;

function TDbCpSaldoConta.Insert: Boolean;
begin

   fIdcpsaldoconta.AsFloat := GetSequence('CPSALDOCONTA');
   Result := Inherited Insert;

end;


procedure TDbCpSaldoConta.SetDtsaldo(const Value: TCmDbField);
begin
  FDtsaldo := Value;
end;

procedure TDbCpSaldoConta.SetIdcpconta(const Value: TCmDbField);
begin
  FIdcpconta := Value;
end;

procedure TDbCpSaldoConta.SetIdcpsaldoconta(const Value: TCmDbField);
begin
  FIdcpsaldoconta := Value;
end;

procedure TDbCpSaldoConta.SetIdcpvalorcota(const Value: TCmDbField);
begin
  FIdcpvalorcota := Value;
end;

procedure TDbCpSaldoConta.SetSaldocotas(const Value: TCmDbField);
begin
  FSaldocotas := Value;
end;

end.



