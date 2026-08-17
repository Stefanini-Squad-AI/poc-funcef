unit uDbRadInstProcesso;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbRadInstProcesso = class(TCmDbObject)

  private
    FIdprocesso: TCmDbField;
    FDatafimprocesso: TCmDbField;
    FObs: TCmDbField;
    FDatafimprev: TCmDbField;
    FIdusuario: TCmDbField;
    FDatainiprocesso: TCmDbField;
    FFlgversaorad: TCmDbField;
    FIdempresa: TCmDbField;
    FFlgok: TCmDbField;
    FIdradtipoproc: TCmDbField;
    procedure SetDatafimprev(const Value: TCmDbField);
    procedure SetDatafimprocesso(const Value: TCmDbField);
    procedure SetDatainiprocesso(const Value: TCmDbField);
    procedure SetFlgok(const Value: TCmDbField);
    procedure SetFlgversaorad(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdprocesso(const Value: TCmDbField);
    procedure SetIdradtipoproc(const Value: TCmDbField);
    procedure SetIdusuario(const Value: TCmDbField);
    procedure SetObs(const Value: TCmDbField);

  public

    Property Idprocesso: TCmDbField read FIdprocesso write SetIdprocesso;
    Property Idradtipoproc: TCmDbField read FIdradtipoproc write SetIdradtipoproc;
    Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
    Property Idusuario: TCmDbField read FIdusuario write SetIdusuario;
    Property Flgok: TCmDbField read FFlgok write SetFlgok;
    Property Datainiprocesso: TCmDbField read FDatainiprocesso write SetDatainiprocesso;
    Property Datafimprocesso: TCmDbField read FDatafimprocesso write SetDatafimprocesso;
    Property Datafimprev: TCmDbField read FDatafimprev write SetDatafimprev;
    Property Obs: TCmDbField read FObs write SetObs;
    Property Flgversaorad: TCmDbField read FFlgversaorad write SetFlgversaorad;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert :Boolean; Override;
  End;

implementation

{ TDbRadInstProcesso }

constructor TDbRadInstProcesso.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'RADINSTPROCESSO';

  fIdprocesso := CreateCmDbField('IDPROCESSO',ftfloat,True,True,False,True,'Id. Processo');
  fIdradtipoproc := CreateCmDbField('IDRADTIPOPROC',ftfloat,False,False,False,True,'Id. Tipo de Processo');
  fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'Id. Empresa');
  fIdusuario := CreateCmDbField('IDUSUARIO',ftfloat,False,False,False,True,'Id. Responsável');
  fFlgok := CreateCmDbField('FLGOK',ftString,False,False,False,True,'Situação');
  fDatainiprocesso := CreateCmDbField('DATAINIPROCESSO',ftDateTime,False,False,False,True,'Data de Início do Processo');
  fDatafimprocesso := CreateCmDbField('DATAFIMPROCESSO',ftDateTime,False,False,False,True,'Data de Término do Processo');
  fDatafimprev := CreateCmDbField('DATAFIMPREV',ftDateTime,False,False,False,True,'Data Prev Término do Processo');
  fObs := CreateCmDbField('OBS',ftString,False,False,False,True,'Observação');
  fFlgversaorad := CreateCmDbField('FLGVERSAORAD',ftString,False,False,False,True,'Versão do RAD');
end;

function TDbRadInstProcesso.Insert: Boolean;
begin
  fIdprocesso.AsFloat := GetSequence('RADINSTPROCESSO');
  Result := Inherited Insert;
end;


procedure TDbRadInstProcesso.SetDatafimprev(const Value: TCmDbField);
begin
  FDatafimprev := Value;
end;

procedure TDbRadInstProcesso.SetDatafimprocesso(const Value: TCmDbField);
begin
  FDatafimprocesso := Value;
end;

procedure TDbRadInstProcesso.SetDatainiprocesso(const Value: TCmDbField);
begin
  FDatainiprocesso := Value;
end;

procedure TDbRadInstProcesso.SetFlgok(const Value: TCmDbField);
begin
  FFlgok := Value;
end;

procedure TDbRadInstProcesso.SetFlgversaorad(const Value: TCmDbField);
begin
  FFlgversaorad := Value;
end;

procedure TDbRadInstProcesso.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbRadInstProcesso.SetIdprocesso(const Value: TCmDbField);
begin
  FIdprocesso := Value;
end;

procedure TDbRadInstProcesso.SetIdradtipoproc(const Value: TCmDbField);
begin
  FIdradtipoproc := Value;
end;

procedure TDbRadInstProcesso.SetIdusuario(const Value: TCmDbField);
begin
  FIdusuario := Value;
end;

procedure TDbRadInstProcesso.SetObs(const Value: TCmDbField);
begin
  FObs := Value;
end;

end.



