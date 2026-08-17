unit uDbCtrlSaldoFDO;

// Alterações:
{--------------------------------------------------------------------------------------------------
Nº SIG......: 94320
Data........: 11/12/2019
Responsável.: edilaine
Descrição...: Criação da Integração Orçamentária para sistema web
-----------------------------------------------------------------------------------------------------}

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
   TDbCtrlSaldoFDO = class(TCmDbObject)
   private
    FIdpessoa: TCmDbField;
    FUnidNegoc: TCmDbField;
    FSaldo: TCmDbField;
    FPlanoConta: TCmDbField;
    FPlano: TCmDbField;
    FModulos: TCmDbField;
    FAnoRef: TCmDbField;
    procedure SetIdPessoa(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPlanoConta(const Value: TCmDbField);
    procedure SetSaldo(const Value: TCmDbField);
    procedure SetUnidNegoc(const Value: TCmDbField);
    procedure SetModulos(const Value: TCmDbField);
    procedure SetAnoRef(const Value: TCmDbField);

   protected

   public
     Property ANOREF : TCmDbField read FAnoRef write SetAnoRef;
     Property PLANO : TCmDbField read FPlano write SetPlano;
     Property PLACONTA : TCmDbField read FPlanoConta write SetPlanoConta;
     Property UNIDNEGOC : TCmDbField read FUnidNegoc write SetUnidNegoc;
     Property IDPESSOA : TCmDbField read FIdpessoa write SetIdPessoa;
     Property SALDO : TCmDbField read FSaldo write SetSaldo;
     Property MODULOS : TCmDbField read FModulos write SetModulos;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
   end;

implementation

{ TDbCampodeparaCC }

constructor TDbCtrlSaldoFDO.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CTRLSALDOFDO';

   FAnoRef     := CreateCmDbField('ANOREFERENCIA',ftString,true,true,False,True,'');
   FPlano      := CreateCmDbField('PLANO',ftString,true,true,False,True,'');
   FPlanoConta := CreateCmDbField('PLACONTA',ftString,true,true,False,True,'');
   FUnidNegoc  := CreateCmDbField('UNIDNEGOC',ftfloat,True,True,False,True,'');
   FIdpessoa   := CreateCmDbField('IDPESSOA',ftfloat,false,false,False,True,'');
   FSaldo      := CreateCmDbField('SALDO',ftfloat,false,false,False,True,'');
   FModulos    := CreateCmDbField('MODULOS',ftString,false,false,False,True,'');
end;


function TDbCtrlSaldoFDO.Insert: Boolean;
begin
  Result := Inherited Insert;
end;

procedure TDbCtrlSaldoFDO.SetAnoRef(const Value: TCmDbField);
begin
  FAnoRef := Value;
end;

procedure TDbCtrlSaldoFDO.SetIdPessoa(const Value: TCmDbField);
begin
  FIdPessoa := Value;
end;

procedure TDbCtrlSaldoFDO.SetModulos(const Value: TCmDbField);
begin
  FModulos := Value;
end;

procedure TDbCtrlSaldoFDO.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbCtrlSaldoFDO.SetPlanoConta(const Value: TCmDbField);
begin
  FPlanoConta := Value;
end;

procedure TDbCtrlSaldoFDO.SetSaldo(const Value: TCmDbField);
begin
  FSaldo := Value;
end;

procedure TDbCtrlSaldoFDO.SetUnidNegoc(const Value: TCmDbField);
begin
  FUnidNegoc := Value;
end;

end.
 