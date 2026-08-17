unit uDbDespesaOrcxCCusto;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDbDespesaxCCusto = class(TCmDbObject)

  private
    FIdDespesaOrc: TCmDbField;
    FCodCentroCusto: TCmDbField;
    FIdEmpresa: TCmDbField;
    procedure SetCodCentroCusto(const Value: TCmDbField);
    procedure SetIdDespesaOrc(const Value: TCmDbField);
    procedure SetIdEmpresa(const Value: TCmDbField);

  protected

  public
     Property IdDespesaOrc : TCmDbField read FIdDespesaOrc write SetIdDespesaOrc;
     Property CodCentroCusto : TCmDbField read FCodCentroCusto write SetCodCentroCusto;
     Property IdEmpresa : TCmDbField read FIdEmpresa write SetIdEmpresa;

     Constructor Create( Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;

end;


implementation

{ TDbDespesaxCCusto }

constructor TDbDespesaxCCusto.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;

  ErrorIfNoRowsAffected := False;

  TableName := 'DESPESAORCXCCUSTO';

  fIdDespesaOrc   := CreateCmDbField( 'IDDESPESAORC',   ftfloat,  True,  True,  False, True, 'Id da Despesa Orçamentária');
  fCodCentroCusto := CreateCmDbField( 'CODCENTROCUSTO', ftString, False, False, False, True, 'Codigo Centro de Custo');
  fIdEmpresa      := CreateCmDbField( 'IDEMPRESA',      ftfloat,  True,  True,  False, True, 'Id da Empresa ao qual o centro de custo se refere');
end;

function TDbDespesaxCCusto.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDbDespesaxCCusto.LoadFromDb: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbDespesaxCCusto.SetCodCentroCusto(const Value: TCmDbField);
begin
  FCodCentroCusto := Value;
end;

procedure TDbDespesaxCCusto.SetIdDespesaOrc(const Value: TCmDbField);
begin
  FIdDespesaOrc := Value;
end;

procedure TDbDespesaxCCusto.SetIdEmpresa(const Value: TCmDbField);
begin
  FIdEmpresa := Value;
end;

end.
 