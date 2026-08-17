{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marcio Motta                    }
{ Atualizado Em: 24/06/2005                             }
{                                                       }
{*******************************************************}

unit uDbFormOrcado;

interface

uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

type
  TDbFormorcado = class(TCmDbObject)

  private
    FNome               : TCmDbField;
    FIdFormOrcado       : TCmDbField;
    FDescricao          : TCmDbField;
    FBaseCalculo        : TCmDbField;
    FBaseArredondamento : TCmDbField;

    procedure SetNome(const Value: TCmDbField);
    procedure SetIdFormOrcado(const Value: TCmDbField);
    procedure SetDescricao(const Value: TCmDbField);
    procedure SetBaseCalculo(const Value: TCmDbField);
    procedure SetBaseArredondamento(const Value: TCmDbField);

  public
    property Nome: TCmDbField               read FNome               write SetNome;
    property IdFormOrcado: TCmDbField       read FIdFormOrcado       write SetIdFormOrcado;
    property Descricao: TCmDbField          read FDescricao          write SetDescricao;
    property BaseCalculo: TCmDbField        read FBaseCalculo        write SetBaseCalculo;
    property BaseArredondamento: TCmDbField read FBaseArredondamento write SetBaseArredondamento;

    constructor Create(Aowner: TCmCustomCdbObject); override;

    function Insert :Boolean; override;
  end;

implementation

{ TDbFormorcado }

constructor TDbFormorcado.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'FORMORCADO';

  fNome               := CreateCmDbField('NOME',               ftString,   False, False, False, True, 'Nome da Fórmula');
  fIdformOrcado       := CreateCmDbField('IDFORMORCADO',       ftfloat,    True,  True,  False, True, 'ID da Fórmula');
  fDescricao          := CreateCmDbField('DESCRICAO',          ftString,   False, False, False, True, 'Descrição da Fórmula');
  fBaseCalculo        := CreateCmDbField('BASECALCULO',        ftString,   False, False, False, True, 'Base de Cálculo');
  fBaseArredondamento := CreateCmDbField('BASEARREDONDAMENTO', ftString,   False, False, False, True, 'Base de Arredondamento');

  // DESCRIÇÃO DOS VALORES GRAVADOS NOS CAMPOS: BASECALCULO E BASEARREDONDAMENTO //
  // ============================================================================//
  // BASECALCULO: 'O' = Orçado    'R' = Realizado                                //
  // ============================================================================//
  // BASEARREDONDAMENTO:                                                         //
  // 1 = Duas casas decimais                                                     //
  // 2 = Centavo                                                                 //
  // 3 = Dezena                                                                  //
  // 4 = Centena                                                                 //
  // 5 = Milhar                                                                  //
  // ****************************************************************************//


end;

function TDbFormorcado.Insert: Boolean;
begin
  fIdformorcado.AsFloat := GetSequence('FORMORCADO');
  Result := Inherited Insert;
end;


procedure TDbFormorcado.SetBaseArredondamento(const Value: TCmDbField);
begin
  FBaseArredondamento := Value;
end;

procedure TDbFormorcado.SetBaseCalculo(const Value: TCmDbField);
begin
  FBaseCalculo := Value;
end;

procedure TDbFormorcado.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbFormorcado.SetIdFormOrcado(const Value: TCmDbField);
begin
  FIdFormOrcado := Value;
end;

procedure TDbFormorcado.SetNome(const Value: TCmDbField);
begin
  FNome := Value;
end;

end.



