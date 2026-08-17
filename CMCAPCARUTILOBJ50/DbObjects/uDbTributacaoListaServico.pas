unit uDbTributacaoListaServico; 
 
interface 

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDbTributacaoListaServico = class(TCmDbObject)

  private
    FCodAlterador: TCmDbField;
    FAliquota: TCmDbField;
    FIdServico: TCmDbField;
    FTipoTributo: TCmDbField;
    FIdTribListServico: TCmDbField;
    FPerTributo: TCmDbField;
    procedure SetAliquota(const Value: TCmDbField);
    procedure SetCodAlterador(const Value: TCmDbField);
    procedure SetIdServico(const Value: TCmDbField);
    procedure SetIdTribListServico(const Value: TCmDbField);
    procedure SetTipoTributo(const Value: TCmDbField);
    procedure SetPerTributo(const Value: TCmDbField);

  public
    constructor Create(Aowner: TCmCustomCdbObject); override;
    function Insert: Boolean; override;
    property IdTribListServico: TCmDbField read FIdTribListServico write SetIdTribListServico;
    property IdServico: TCmDbField read FIdServico write SetIdServico;
    property CodAlterador: TCmDbField read FCodAlterador write SetCodAlterador;
    property TipoTributo: TCmDbField read FTipoTributo write SetTipoTributo;
    property Aliquota: TCmDbField read FAliquota write SetAliquota;
    property PerTributo: TCmDbField read FPerTributo write SetPerTributo;
  end;

implementation

{ TDbTributacaoListaServico }

constructor TDbTributacaoListaServico.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;

  ErrorIfNoRowsAffected := False;

  TableName := 'TRIBUTACAO_LISTA_SERVICOS';

  FIdTribListServico := CreateCmDbField('IDTRIBLISTSERVICO', ftFloat, True, True, False, False, '', -1, False);
  FIdServico := CreateCmDbField('IDSERVICO', ftFloat, False, False, False, False, '', -1, False);
  FCodAlterador := CreateCmDbField('CODALTERADOR', ftFloat, False, False, False, False, '', -1, False);
  FTipoTributo := CreateCmDbField('TIPOTRIBUTO', ftFloat, False, False, False, False, '', -1, False);
  FAliquota := CreateCmDbField('ALIQUOTA', ftFloat, False, False, False, False, '', -1, False);
  FPerTributo := CreateCmDbField('PERTRIBUTO', ftFloat, False, False, False, False, '', -1, False);
end;

function TDbTributacaoListaServico.Insert: Boolean;
begin
  FIdTribListServico.AsFloat := GetSequence('TRIBUTACAO_LISTA_SERVICOS');
  Result := Inherited Insert;
end;

procedure TDbTributacaoListaServico.SetAliquota(const Value: TCmDbField);
begin
  FAliquota := Value;
end;

procedure TDbTributacaoListaServico.SetCodAlterador(
  const Value: TCmDbField);
begin
  FCodAlterador := Value;
end;

procedure TDbTributacaoListaServico.SetIdServico(const Value: TCmDbField);
begin
  FIdServico := Value;
end;

procedure TDbTributacaoListaServico.SetIdTribListServico(
  const Value: TCmDbField);
begin
  FIdTribListServico := Value;
end;

procedure TDbTributacaoListaServico.SetPerTributo(const Value: TCmDbField);
begin
  FPerTributo := Value;
end;

procedure TDbTributacaoListaServico.SetTipoTributo(
  const Value: TCmDbField);
begin
  FTipoTributo := Value;
end;

end.
