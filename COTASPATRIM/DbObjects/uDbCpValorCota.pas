{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 10/05/2007                             }
{                                                       }
{*******************************************************}

unit uDbCpValorCota;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbCpValorCota = class(TCmDbObject)

  private
    FIdcpativo: TCmDbField;
    FDtcota: TCmDbField;
    FIdcpvaldiv: TCmDbField;
    FIdcpvalorcota: TCmDbField;
    FMotivorec: TCmDbField;
    FValor: TCmDbField;
    FFlgstatus: TCmDbField;
    FIdregra: TCmDbField;
    FIdprocesso: TCmDbField;
    FDtcalculo: TCmDbField;
    FQueryentrada: TCmDbField;
    FIdusuario: TCmDbField;
    FNrsldaplicado: TCmDbField;
    FNrentrrent: TCmDbField;
    FNrsaidarent: TCmDbField;
    FNrsaldoantcta: TCmDbField;
    FNrsaidainvest: TCmDbField;
    FNrsaldoatucta: TCmDbField;
    FNrsldativoant: TCmDbField;
    FNrentrinvest: TCmDbField;
    procedure SetDtcota(const Value: TCmDbField);
    procedure SetFlgstatus(const Value: TCmDbField);
    procedure SetIdcpativo(const Value: TCmDbField);
    procedure SetIdcpvaldiv(const Value: TCmDbField);
    procedure SetIdcpvalorcota(const Value: TCmDbField);
    procedure SetIdprocesso(const Value: TCmDbField);
    procedure SetIdregra(const Value: TCmDbField);
    procedure SetMotivorec(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);
    procedure SetDtcalculo(const Value: TCmDbField);
    procedure SetQueryentrada(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetNrentrinvest(const Value: TCmDbField);
    procedure SetNrentrrent(const Value: TCmDbField);
    procedure SetNrsaidainvest(const Value: TCmDbField);
    procedure SetNrsaidarent(const Value: TCmDbField);
    procedure SetNrsaldoantcta(const Value: TCmDbField);
    procedure SetNrsaldoatucta(const Value: TCmDbField);
    procedure SetNrsldaplicado(const Value: TCmDbField);
    procedure SetNrsldativoant(const Value: TCmDbField);

  public

     Property Valor: TCmDbField read FValor write SetValor;
     Property Motivorec: TCmDbField read FMotivorec write SetMotivorec;
     Property Idregra: TCmDbField read FIdregra write SetIdregra;
     Property Idprocesso: TCmDbField read FIdprocesso write SetIdprocesso;
     Property Idcpvalorcota: TCmDbField read FIdcpvalorcota write SetIdcpvalorcota;
     Property Idcpvaldiv: TCmDbField read FIdcpvaldiv write SetIdcpvaldiv;
     Property Idcpativo: TCmDbField read FIdcpativo write SetIdcpativo;
     Property Flgstatus: TCmDbField read FFlgstatus write SetFlgstatus;
     Property Dtcota: TCmDbField read FDtcota write SetDtcota;
     Property Dtcalculo: TCmDbField read FDtcalculo write SetDtcalculo;
     Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
     Property Queryentrada: TCmDbField read FQueryentrada write SetQueryentrada;
     Property Nrsldaplicado: TCmDbField read FNrsldaplicado write SetNrsldaplicado;
     Property Nrsldativoant: TCmDbField read FNrsldativoant write SetNrsldativoant;
     Property Nrsaidainvest: TCmDbField read FNrsaidainvest write SetNrsaidainvest;
     Property Nrentrinvest: TCmDbField read FNrentrinvest write SetNrentrinvest;
     Property Nrsaldoantcta: TCmDbField read FNrsaldoantcta write SetNrsaldoantcta;
     Property Nrsaldoatucta: TCmDbField read FNrsaldoatucta write SetNrsaldoatucta;
     Property Nrentrrent: TCmDbField read FNrentrrent write SetNrentrrent;
     Property Nrsaidarent: TCmDbField read FNrsaidarent write SetNrsaidarent;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;
  End;

implementation

{ TDbCpValorCota }

constructor TDbCpValorCota.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CPVALORCOTA';

   fValor := CreateCmDbField('VALOR',ftfloat,True,False,False,False,'Valor da cota');
   fMotivorec := CreateCmDbField('MOTIVOREC',ftString,False,False,False,True,'Motivo do recálculo');
   fIdregra := CreateCmDbField('IDREGRA',ftfloat,False,False,False,True,'Id. regra');
   fIdprocesso := CreateCmDbField('IDPROCESSO',ftfloat,False,False,False,True,'Id. processo');
   fIdcpvalorcota := CreateCmDbField('IDCPVALORCOTA',ftfloat,True,True,False,True,'Id. valor da cota');
   fIdcpvaldiv := CreateCmDbField('IDCPVALDIV',ftfloat,False,False,False,True,'Id. cota divulgada');
   fIdcpativo := CreateCmDbField('IDCPATIVO',ftfloat,True,False,False,True,'Id. ativo');
   fFlgstatus := CreateCmDbField('FLGSTATUS',ftString,True,False,False,True,'Situação');
   fDtcota := CreateCmDbField('DTCOTA',ftDateTime,True,False,False,True,'Data da cota');
   fDtcalculo := CreateCmDbField('DTCALCULO',ftDateTime,True,False,False,True,'Data do cálculo');
   fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,True,False,False,True,'Id. Usuário');
   fQueryentrada := CreateCmDbField('QUERYENTRADA',ftString,False,False,False,True,'Query de entrada');
   fNrsldaplicado := CreateCmDbField('NRSLDAPLICADO',ftString,False,False,False,True,'Saldo aplicado');
   fNrsldativoant := CreateCmDbField('NRSLDATIVOANT',ftString,False,False,False,True,'Saldo anterior do ativo');
   fNrsaidainvest := CreateCmDbField('NRSAIDAINVEST',ftString,False,False,False,True,'Saída da conta de investimentos');
   fNrentrinvest := CreateCmDbField('NRENTRINVEST',ftString,False,False,False,True,'Entrada na conta de investimentos');
   fNrsaldoantcta := CreateCmDbField('NRSALDOANTCTA',ftString,False,False,False,True,'Saldo anterior da conta corrente');
   fNrsaldoatucta := CreateCmDbField('NRSALDOATUCTA',ftString,False,False,False,True,'Saldo atual da conta corrente');
   fNrentrrent := CreateCmDbField('NRENTRRENT',ftString,False,False,False,True,'Situação');
   fNrsaidarent := CreateCmDbField('NRSAIDARENT',ftString,False,False,False,True,'Situação');
end;

procedure TDbCpValorCota.SetDtcalculo(const Value: TCmDbField);
begin
  FDtcalculo := Value;
end;

procedure TDbCpValorCota.SetDtcota(const Value: TCmDbField);
begin
  FDtcota := Value;
end;

procedure TDbCpValorCota.SetFlgstatus(const Value: TCmDbField);
begin
  FFlgstatus := Value;
end;

procedure TDbCpValorCota.SetIdcpativo(const Value: TCmDbField);
begin
  FIdcpativo := Value;
end;

procedure TDbCpValorCota.SetIdcpvaldiv(const Value: TCmDbField);
begin
  FIdcpvaldiv := Value;
end;

procedure TDbCpValorCota.SetIdcpvalorcota(const Value: TCmDbField);
begin
  FIdcpvalorcota := Value;
end;

procedure TDbCpValorCota.SetIdprocesso(const Value: TCmDbField);
begin
  FIdprocesso := Value;
end;

procedure TDbCpValorCota.SetIdregra(const Value: TCmDbField);
begin
  FIdregra := Value;
end;

procedure TDbCpValorCota.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbCpValorCota.SetMotivorec(const Value: TCmDbField);
begin
  FMotivorec := Value;
end;

procedure TDbCpValorCota.SetNrentrinvest(const Value: TCmDbField);
begin
  FNrentrinvest := Value;
end;

procedure TDbCpValorCota.SetNrentrrent(const Value: TCmDbField);
begin
  FNrentrrent := Value;
end;

procedure TDbCpValorCota.SetNrsaidainvest(const Value: TCmDbField);
begin
  FNrsaidainvest := Value;
end;

procedure TDbCpValorCota.SetNrsaidarent(const Value: TCmDbField);
begin
  FNrsaidarent := Value;
end;

procedure TDbCpValorCota.SetNrsaldoantcta(const Value: TCmDbField);
begin
  FNrsaldoantcta := Value;
end;

procedure TDbCpValorCota.SetNrsaldoatucta(const Value: TCmDbField);
begin
  FNrsaldoatucta := Value;
end;

procedure TDbCpValorCota.SetNrsldaplicado(const Value: TCmDbField);
begin
  FNrsldaplicado := Value;
end;

procedure TDbCpValorCota.SetNrsldativoant(const Value: TCmDbField);
begin
  FNrsldativoant := Value;
end;

procedure TDbCpValorCota.SetQueryentrada(const Value: TCmDbField);
begin
  FQueryentrada := Value;
end;

procedure TDbCpValorCota.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;

end.



