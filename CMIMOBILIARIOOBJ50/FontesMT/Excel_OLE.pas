(******************************************************************************)                                                                                //
(*               Classe para Trabalhar com Arquivos EXCEL                     *)
(*               Analista: Marcio Motta                                       *)
(*               Início  : 22/03/2004                                         *)
(*               Término : 24/04/2004                                         *)
(******************************************************************************)

unit Excel_OLE;

interface

uses
  Windows, ComObj;

type
  TExcel = class
  private
    FApplication : variant;

  public
    property Aplicativo : variant read FApplication;
    constructor Create(const Visivel: boolean = False);
    destructor Destroy; override;

    procedure AbrirArquivo(const Caminho : string; Visivel : boolean = False);
    procedure NovoArquivo;
    procedure Salvar;
    procedure SalvarComo(const Caminho : string; Senha : string = '');
    procedure Visualizar;
    procedure EnviaValor(const Coluna, Linha : integer; Conteudo : string);
    function  BuscarValor(const Coluna, Linha : integer): string;
    procedure DesprotegerCelulas(Area : string);
    procedure ProtegerPlanilha(const Senha : string = '');
    procedure OcultarColuna(Coluna : integer);
    procedure OcultarLinha(Linha : integer);
    procedure ExibirColuna(Coluna : integer);
    procedure ExibirLinha(Linha : integer);
    procedure EnviarFormula(const Coluna, Linha: integer; const Formula : string);
    function  UltimaLinha: integer;
    function  UltimaColuna: integer;
    function  LetraColuna(Num : integer) : string;
    procedure Selecionar(Area:string);

  end;

implementation

{ TExcel }

constructor TExcel.Create (const Visivel : boolean = False);
begin
  // Se o Excel não estiver aberto, abre o Excel
  FApplication := CreateOleObject('Excel.Application');
  FApplication.Visible := Visivel;
end;

destructor TExcel.Destroy;
begin
  // Fecha o Excel
  FApplication.Quit;
  inherited;
end;

procedure TExcel.AbrirArquivo(const Caminho : string; Visivel : boolean = False);
begin
  // Abre uma nova Pasta de Trabalho
  FApplication.WorkBooks.Open(Caminho);
  FApplication.Visible := Visivel;
end;

procedure TExcel.NovoArquivo;
begin
  // Adiciona uma Nova Pasta de Trabalho
  FApplication.WorkBooks.Add
end;

procedure TExcel.SalvarComo(const Caminho: string; Senha: string = '');
begin
  // Salva o arquivo Excel
  FApplication.ActiveWorkBook.SaveAs(FileName:=Caminho, Password:=Senha, WriteResPassword:=Senha);
end;

procedure TExcel.Visualizar;
begin
  // Coloca Visível o Excel atualmente aberto
  FApplication.Visible := True;
end;

function TExcel.BuscarValor(const Coluna, Linha: integer): string;
begin
  // Busca valor na Célula
  Result := FApplication.Cells[Linha, Coluna].Value;
end;

procedure TExcel.EnviaValor(const Coluna, Linha: integer; Conteudo: string);
begin
  // Insere conteúdo na Célula
  FApplication.Cells[Linha, Coluna].Value := Conteudo;
end;

procedure TExcel.DesprotegerCelulas(Area: string);
begin
  // Destrava-Desprotege uma célula ou área passada como parâmetro
  FApplication.Range[Area].Locked := False;
end;

procedure TExcel.ProtegerPlanilha(const Senha: string = '');
begin
// Protege a Planilha ativa permitindo alterações somente
// nas células destravadas/desprotegidas
  FApplication.ActiveSheet.Protect(Password:=Senha);
end;

procedure TExcel.OcultarColuna(Coluna: integer);
begin
  // Oculta uma Coluna na Planilha ativa
  FApplication.Columns[Coluna].Hidden := True;
end;

procedure TExcel.OcultarLinha(Linha: integer);
begin
  // Oculta uma Linha na Planilha ativa
  FApplication.Rows[Linha].Hidden := True;
end;

procedure TExcel.ExibirColuna(Coluna: integer);
begin
  // Exibe uma Coluna oculta na Planilha ativa
  FApplication.Columns[Coluna].Hidden := False;
end;

procedure TExcel.ExibirLinha(Linha: integer);
begin
  // Exibe uma Linha oculta na Planilha ativa
  FApplication.Rows[Linha].Hidden := False;
end;

procedure TExcel.EnviarFormula(const Coluna, Linha: integer; const Formula: string);
begin
  // Envia uma Formula para a célula
  FApplication.Cells[Linha, Coluna].Formula := Formula;
end;

function TExcel.UltimaLinha: integer;
begin
  // Verifica a Última Linha que contenha dados
  Result := FApplication.ActiveSheet.UsedRange.Rows.Count;
end;

function TExcel.UltimaColuna: integer;
begin
  // Verifica a Última coluna que contenha dados
  Result := FApplication.ActiveSheet.UsedRange.Columns.Count;
end;

function TExcel.LetraColuna(Num: integer): string;
begin
  // Troca o número recebido por uma Letra correspondente a coluna do Excel
  case Num of
     1: Result := 'A';     27: Result := 'AA';     53: Result := 'BA';
     2: Result := 'B';     28: Result := 'AB';     54: Result := 'BB';
     3: Result := 'C';     29: Result := 'AC';     55: Result := 'BC';
     4: Result := 'D';     30: Result := 'AD';     56: Result := 'BD';
     5: Result := 'E';     31: Result := 'AE';     57: Result := 'BE';
     6: Result := 'F';     32: Result := 'AF';     58: Result := 'BF';
     7: Result := 'G';     33: Result := 'AG';     59: Result := 'BG';
     8: Result := 'H';     34: Result := 'AH';     60: Result := 'BH';
     9: Result := 'I';     35: Result := 'AI';     61: Result := 'BI';
    10: Result := 'J';     36: Result := 'AJ';     62: Result := 'BJ';
    11: Result := 'K';     37: Result := 'AK';     63: Result := 'BK';
    12: Result := 'L';     38: Result := 'AL';     64: Result := 'BL';
    13: Result := 'M';     39: Result := 'AM';     65: Result := 'BM';
    14: Result := 'N';     40: Result := 'AN';     66: Result := 'BN';
    15: Result := 'O';     41: Result := 'AO';     67: Result := 'BO';
    16: Result := 'P';     42: Result := 'AP';     68: Result := 'BP';
    17: Result := 'Q';     43: Result := 'AQ';     69: Result := 'BQ';
    18: Result := 'R';     44: Result := 'AR';     70: Result := 'BR';
    19: Result := 'S';     45: Result := 'AS';     71: Result := 'BS';
    20: Result := 'T';     46: Result := 'AT';     72: Result := 'BT';
    21: Result := 'U';     47: Result := 'AU';     73: Result := 'BU';
    22: Result := 'V';     48: Result := 'AV';     74: Result := 'BV';
    23: Result := 'W';     49: Result := 'AW';     75: Result := 'BW';
    24: Result := 'X';     50: Result := 'AX';     76: Result := 'BX';
    25: Result := 'Y';     51: Result := 'AY';     77: Result := 'BY';
    26: Result := 'Z';     52: Result := 'AZ';     78: Result := 'BZ';
  else
    Result := 'Erro';
  end;
end;

procedure TExcel.Salvar;
begin
  FApplication.Save;
end;

procedure TExcel.Selecionar(Area:string);
begin
  FApplication.ActiveSheet.Range[Area].Select;
end;


end.
