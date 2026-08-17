//--------------------------------------------------------------------------------
//Nº SIG......: 113136
//Data........: 04/07/2022
//Responsável.: Cássio Florencio Rovaroto 
//Descrição...: Implementação da provisão de custos de imóveis.
//--------------------------------------------------------------------------------
unit uDbProvisaoImovel;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbProvisaoImovel = class(TCmDbObject)
    private
    FVigenciaInicio: TCmDbField;
    FVigenciaFim: TCmDbField;
    FPercentual: TCmDbField;
    FFlgAtivo: TCmDbField;
    FIdImovel: TCmDbField;
    FIdProvisaoImovel: TCmDbField;
    procedure SetFlgAtivo(const Value: TCmDbField);
    procedure SetIdImovel(const Value: TCmDbField);
    procedure SetIdProvisaoImovel(const Value: TCmDbField);
    procedure SetPercentual(const Value: TCmDbField);
    procedure SetVigenciaFim(const Value: TCmDbField);
    procedure SetVigenciaInicio(const Value: TCmDbField);

    public
      property IdProvisaoImovel: TCmDbField read FIdProvisaoImovel write SetIdProvisaoImovel;
      property IdImovel: TCmDbField read FIdImovel write SetIdImovel;
      property Percentual: TCmDbField read FPercentual write SetPercentual;
      property VigenciaInicio: TCmDbField read FVigenciaInicio write SetVigenciaInicio;
      property VigenciaFim: TCmDbField read FVigenciaFim write SetVigenciaFim;
      property FlgAtivo: TCmDbField read FFlgAtivo write SetFlgAtivo;

      Constructor Create(Aowner: TCmCustomCdbObject); Override;
      function Insert :Boolean; Override;
  end;

implementation

{ TDbProvisaoImovel }

constructor TDbProvisaoImovel.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;
  _UpdateKeyFields := True;

  TableName := 'PROVISAOIMOVEL';

  FIdProvisaoImovel := CreateCmDbField('IDPROVISAOIMOVEL', ftFloat, True, True, False, True, '');
  FIdImovel := CreateCmDbField('IDIMOVEL', ftFloat, True, False, False, False, '');
  FPercentual := CreateCmDbField('PERCENTUAL', ftFloat, True, False, False, False, '');
  FVigenciaInicio := CreateCmDbField('VIGENCIA_INICIO', ftDateTime, False, False, False, True, '');
  FVigenciaFim :=    CreateCmDbField('VIGENCIA_FIM',    ftDateTime, False, False, False, True, '');
  FFlgAtivo := CreateCmDbField('FLGATIVO', ftString, False, False, False, False, '');

end;

function TDbProvisaoImovel.Insert: Boolean;
begin
  FIdProvisaoImovel.AsFloat := GetSequence('PROVISAOIMOVEL');
  Result := Inherited Insert;
end;

procedure TDbProvisaoImovel.SetFlgAtivo(const Value: TCmDbField);
begin
  FFlgAtivo := Value;
end;

procedure TDbProvisaoImovel.SetIdImovel(const Value: TCmDbField);
begin
  FIdImovel := Value;
end;

procedure TDbProvisaoImovel.SetIdProvisaoImovel(const Value: TCmDbField);
begin
  FIdProvisaoImovel := Value;
end;

procedure TDbProvisaoImovel.SetPercentual(const Value: TCmDbField);
begin
  FPercentual := Value;
end;

procedure TDbProvisaoImovel.SetVigenciaFim(const Value: TCmDbField);
begin
  FVigenciaFim := Value;
end;

procedure TDbProvisaoImovel.SetVigenciaInicio(const Value: TCmDbField);
begin
  FVigenciaInicio := Value;
end;

end.
