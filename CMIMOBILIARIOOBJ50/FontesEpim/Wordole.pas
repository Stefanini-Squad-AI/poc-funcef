unit WordOle;

interface

uses
  Windows, Word_TLB;

type
  // Classe para facilitar chamada ao Word. Usa early biding e possui métodos
  // para as coisas mais comuns. Permite abrir apenas um documento por vez
  TWord = class
  private
    FApplication: _Application;
    FDoc: Document;
  public
    constructor Create;
    destructor Destroy; override;
    // Muda diretório corrente
    procedure MudaDir(const Dir: string);
    // Abre um documento
    procedure Abre(const Nome: string);
    // Salva com outro nome
    procedure SalvaComo(const Nome: string);
    // Fecha o documento
    procedure Fecha;
    // Imprime com as opções default
    procedure Imprime;
    // Substitui texto
    procedure Substitui(const TextoVelho, TextoNovo: string);
    // Retorna objetos para permitir manipulações além das feitas pela classe
    property Application: _Application read FApplication;
    property Doc: Document read FDoc;
  end;

var
  vOptional, vFalse, vTrue: OleVariant;

implementation

constructor TWord.Create;
begin
  inherited;
  // Cria objeto associado ao Word
  FApplication := CoApplication.Create;
end;

destructor TWord.Destroy;
begin
  // Fecha o Word
  FApplication.Quit(vFalse, vFalse, vFalse);
  inherited;
end;

procedure TWord.MudaDir(const Dir: string);
begin
  FApplication.ChangeFileOpenDirectory(Dir);
end;

procedure TWord.Abre(const Nome: string);
var
  vNome: OleVariant;
begin
  vNome := Nome;
  FDoc := FApplication.Documents.Open(vNome, vOptional, vOptional, vOptional,
    vOptional, vOptional, vOptional, vOptional, vOptional, vOptional);
end;

procedure TWord.SalvaComo(const Nome: string);
var
  vNome: OleVariant;
begin
  vNome := Nome;
  Doc.SaveAs(vNome, vOptional, vOptional, vOptional, vOptional, vOptional,
    vOptional, vOptional, vOptional, vOptional, vOptional);
end;

procedure TWord.Fecha;
begin
  FDoc.Close(vFalse, vFalse, vFalse);
end;

procedure TWord.Imprime;
begin
  Doc.PrintOut(vFalse, vOptional, vOptional, vOptional, vOptional,
    vOptional, vOptional, vOptional, vOptional, vOptional, vOptional,
    vOptional, vOptional, vOptional);
end;

procedure TWord.Substitui(const TextoVelho, TextoNovo: string);
var
  vTextoVelho, vTextoNovo: OleVariant;
begin
  vTextoVelho := TextoVelho;
  vTextoNovo := TextoNovo;
  Doc.Content.Find.Execute(vTextoVelho, vFalse, vFalse, vFalse, vFalse,
    vFalse, vTrue, vOptional, vOptional, vTextoNovo, vOptional);
end;


initialization
  // Inicializa variáveis globais
  vTrue := true;
  vFalse := false;
  TVarData(vOptional).VType := varERROR;
  TVarData(vOptional).VInteger := DISP_E_PARAMNOTFOUND;
end.


