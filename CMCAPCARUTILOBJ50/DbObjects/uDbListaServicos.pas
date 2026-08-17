unit uDbListaServicos; 
 
interface 

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDbListaServicos = class(TCmDbObject)

  private
    FCodigo: TCmDbField;
    FIdServico: TCmDbField;
    FCodNaturezaREINF: TCmDbField;
    FDescricao: TCmDbField;
    FNome: TCmDbField;
    procedure SetCodigo(const Value: TCmDbField);
    procedure SetCodNaturezaREINF(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdServico(const Value: TCmDbField);
    procedure SetNome(const Value: TCmDbField);

  public
    constructor Create(Aowner: TCmCustomCdbObject); override;
    function Insert: Boolean; override;
    function LoadFromDB: Boolean; override;
    property IdServico: TCmDbField read FIdServico write SetIdServico;
    property Codigo: TCmDbField read FCodigo write SetCodigo;
    property Nome: TCmDbField read FNome write SetNome;
    property Descricao: TCmDbField read FDescricao write SetDescricao;
    property CodNaturezaREINF: TCmDbField read FCodNaturezaREINF write SetCodNaturezaREINF;

  end;

implementation

{ TDbListaServicos }

constructor TDbListaServicos.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'LISTA_SERVICOS';

  FIdServico := CreateCmDbField('IDSERVICO', ftFloat, True, True, False, False, '', -1, False);
  FCodigo := CreateCmDbField('CODIGO', ftString, False, False, False, False, '', -1, False);
  FNome := CreateCmDbField('NOME', ftString, False, False, False, False, '', -1, False);
  FDescricao := CreateCmDbField('DESCRICAO', ftString, False, False, False, False, '', -1, False);
  FCodNaturezaREINF := CreateCmDbField('CODNATUREZAREINF', ftFloat, False, False, False, False, '', -1, False); 
end;

function TDbListaServicos.Insert: Boolean;
begin
  FIdServico.AsFloat := GetSequence('LISTA_SERVICOS');
  Result := Inherited Insert;
end;

function TDbListaServicos.LoadFromDB: Boolean;
begin
  Result := inherited LoadFromDB;
end;

procedure TDbListaServicos.SetCodigo(const Value: TCmDbField);
begin
  FCodigo := Value;
end;

procedure TDbListaServicos.SetCodNaturezaREINF(const Value: TCmDbField);
begin
  FCodNaturezaREINF := Value;
end;

procedure TDbListaServicos.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbListaServicos.SetIdServico(const Value: TCmDbField);
begin
  FIdServico := Value;
end;

procedure TDbListaServicos.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

end.
