unit uDbCotaMovim;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

Type
  TDbCotaMovim = class(TCmDbObject)

  private
    FData: TCmDbField;
    FPrevreal: TCmDbField;
    FEntradasaida: TCmDbField;
    FFlgultimo: TCmDbField;
    FObservacao: TCmDbField;
    FValor: TCmDbField;
    FIdcota: TCmDbField;
    FIdcotamovim: TCmDbField;
    FFlgconciliado: TCmDbField;
    FIdcotatipooper: TCmDbField;
    procedure SetData(const Value: TCmDbField);
    procedure SetEntradasaida(const Value: TCmDbField);
    procedure SetFlgconciliado(const Value: TCmDbField);
    procedure SetFlgultimo(const Value: TCmDbField);
    procedure SetIdcota(const Value: TCmDbField);
    procedure SetIdcotamovim(const Value: TCmDbField);
    procedure SetIdcotatipooper(const Value: TCmDbField);
    procedure SetObservacao(const Value: TCmDbField);
    procedure SetPrevreal(const Value: TCmDbField);
    procedure SetValor(const Value: TCmDbField);

  public

     Property Valor: TCmDbField read FValor write SetValor;
     Property Prevreal: TCmDbField read FPrevreal write SetPrevreal;
     Property Observacao: TCmDbField read FObservacao write SetObservacao;
     Property Idcotatipooper: TCmDbField read FIdcotatipooper write SetIdcotatipooper;
     Property Idcotamovim: TCmDbField read FIdcotamovim write SetIdcotamovim;
     Property Idcota: TCmDbField read FIdcota write SetIdcota;
     Property Flgultimo: TCmDbField read FFlgultimo write SetFlgultimo;
     Property Flgconciliado: TCmDbField read FFlgconciliado write SetFlgconciliado;
     Property Entradasaida: TCmDbField read FEntradasaida write SetEntradasaida;
     Property Data: TCmDbField read FData write SetData;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbCotaMovim }

constructor TDbCotaMovim.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'COTAMOVIM';

   fValor := CreateCmDbField('VALOR',ftfloat,False,False,False,True,'Valor');
   fPrevreal := CreateCmDbField('PREVREAL',ftString,False,False,False,True,'');
   fObservacao := CreateCmDbField('OBSERVACAO',ftString,False,False,False,True,'');
   fIdcotatipooper := CreateCmDbField('IDCOTATIPOOPER',ftfloat,True,False,True,True,'Tipo Operação');
   fIdcotamovim := CreateCmDbField('IDCOTAMOVIM',ftfloat,True,True,False,True,'');
   fIdcota := CreateCmDbField('IDCOTA',ftfloat,True,False,False,True,'Cota');
   fFlgultimo := CreateCmDbField('FLGULTIMO',ftString,False,False,False,True,'');
   fFlgconciliado := CreateCmDbField('FLGCONCILIADO',ftString,False,False,False,True,'');
   fEntradasaida := CreateCmDbField('ENTRADASAIDA',ftString,False,False,False,True,'');
   fData := CreateCmDbField('DATA',ftDateTime,True,False,False,True,'Data');
end;

function TDbCotaMovim.Insert: Boolean;
begin

   fIdcotamovim.AsFloat := GetSequence('COTAMOVIM');
   Result := Inherited Insert;

end;


procedure TDbCotaMovim.SetData(const Value: TCmDbField);
begin
  FData := Value;
end;

procedure TDbCotaMovim.SetEntradasaida(const Value: TCmDbField);
begin
  FEntradasaida := Value;
end;

procedure TDbCotaMovim.SetFlgconciliado(const Value: TCmDbField);
begin
  FFlgconciliado := Value;
end;

procedure TDbCotaMovim.SetFlgultimo(const Value: TCmDbField);
begin
  FFlgultimo := Value;
end;

procedure TDbCotaMovim.SetIdcota(const Value: TCmDbField);
begin
  FIdcota := Value;
end;

procedure TDbCotaMovim.SetIdcotamovim(const Value: TCmDbField);
begin
  FIdcotamovim := Value;
end;

procedure TDbCotaMovim.SetIdcotatipooper(const Value: TCmDbField);
begin
  FIdcotatipooper := Value;
end;

procedure TDbCotaMovim.SetObservacao(const Value: TCmDbField);
begin
  FObservacao := Value;
end;

procedure TDbCotaMovim.SetPrevreal(const Value: TCmDbField);
begin
  FPrevreal := Value;
end;

procedure TDbCotaMovim.SetValor(const Value: TCmDbField);
begin
  FValor := Value;
end;

end.



