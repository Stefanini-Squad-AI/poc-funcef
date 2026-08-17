unit uModulo;

interface

const
  // Modelos de Catracas
  RODBEL_RBC_2801 = '0101';
  RODBEL_RBC_2801_PARALELA = '0201';
  PASSO_CA1M = '0201';
  TOPDATA_INNER = '0301';

  // Tipos de identificação da Pessoa
  IDENTIF_TECLADO = 0;
  IDENTIF_LEITOR_SEM_CATRACA = 1;
  IDENTIF_LEITOR_COM_CATRACA = 2;
  IDENTIF_BIOMETRICA = 3;

  // Tipos de Liberação de passagem
  ASSIST_SEM_CATRACA = 0;
  ASSIST_COM_CATRACA = 1;
  AUTOM_COM_CATRACA = 2;
  AUTOM_SEM_CATRACA = 3;

type
  TModulo = class
  private
    FIdEstacaoEcesso: double;
    FIndIdentificacao, FIndLiberacao, FIndEntraSai: integer;
    FEstacao, FTipoEstacao, FMarcaCatraca, FModeloCatraca, FPortaCatraca: string;
    FVeSalario: boolean;
  public
    property IdEstacaoEcesso: double read FIdEstacaoEcesso write FIdEstacaoEcesso;
    property IndIdentificacao: integer read FIndIdentificacao write FIndIdentificacao;
    property IndLiberacao: integer read FIndLiberacao write FIndLiberacao;
    property IndEntraSai: integer read FIndEntraSai write FIndEntraSai;
    property Estacao: string read FEstacao write FEstacao;
    property TipoEstacao: string read FTipoEstacao write FTipoEstacao;
    property MarcaCatraca: string read FMarcaCatraca write FMarcaCatraca;
    property ModeloCatraca: string read FModeloCatraca write FModeloCatraca;
    property PortaCatraca: string read FPortaCatraca write FPortaCatraca;
    property VeSalario: boolean read FVeSalario write FVeSalario;
  end;

var
  Modulo: TModulo;

implementation

end.
