unit uDbFluxoCota;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbFluxoCota = class(TCmDbObject)

  private
    FIdfluxocota: TCmDbField;
    FIdcotacotacao: TCmDbField;
    FHistorico: TCmDbField;
    FValor: TCmDbField;
    FFlgcota: TCmDbField;
    procedure SetIdfluxocota(const Value: TCmDbField);
    procedure SetIdcotacotacao(const Value: TCmDbField);
    procedure SetHistorico(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);
    procedure SetFlgcota(const Value: TCmDbField);

  public

     Property Idfluxocota: TCmDbField read FIdfluxocota write SetIdfluxocota;
     Property Idcotacotacao: TCmDbField read FIdcotacotacao write SetIdcotacotacao;
     Property Historico: TCmDbField read FHistorico write SetHistorico;
     Property Valor: TCmDbField read FValor write SetValor;
     Property Flgcota: TCmDbField read FFlgcota write SetFlgcota;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbFluxoCota }

constructor TDbFluxoCota.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'FLUXOCOTA';

   fIdfluxocota := CreateCmDbField('IDFLUXOCOTA',ftfloat,True,True,False,True,'Identificador do Fluxo');
   fIdcotacotacao := CreateCmDbField('IDCOTACOTACAO',ftfloat,True,False,False,True,'Identificador da Cota');
   fHistorico := CreateCmDbField('HISTORICO',ftString,True,False,False,True,'Histórico');
   fValor := CreateCmDbField('VALOR',ftfloat,True,False,False,True,'Valor');
   fFlgcota := CreateCmDbField('FLGCOTA',ftString,True,False,False,True,'Cotiza / Rentabiliza');
end;

function TDbFluxoCota.Insert: Boolean;
begin

   fIdfluxocota.AsFloat := GetSequence('FLUXOCOTA');
   Result := Inherited Insert;

end;


procedure TDbFluxoCota.SetIdfluxocota(const Value: TCmDbField);
begin
  FIdfluxocota := Value;
end;

procedure TDbFluxoCota.SetIdcotacotacao(const Value: TCmDbField);
begin
  FIdcotacotacao := Value;
end;

procedure TDbFluxoCota.SetHistorico(const Value: TCmDbField);
begin
  FHistorico := Value;
end;

procedure TDbFluxoCota.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;

procedure TDbFluxoCota.SetFlgcota(const Value: TCmDbField);
begin
  FFlgcota := Value;
end;

end.



