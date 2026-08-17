unit uHTMLTable;

interface

uses
  Classes;

type

  //Classe de colunas HTML
  THTMLColumn = class
  private
    FMinWidth: integer;
    FTitle: String;
    FContent: String;
    FAlign: String;
    procedure SetMinWidth(const Value: integer);
    procedure SetTitle(const Value: String);
    procedure SetAlign(const Value: String);
    procedure SetContent(const Value: String);

  protected

  public
    //Construtor da classe. Parâmetros: título e largua mínima (em %)
    constructor Create( iTitle : String; iMinWidth : integer );

    //Título
    property Title : String read FTitle write SetTitle;

    //Largura mínima (em %)
    property MinWidth : integer read FMinWidth write SetMinWidth;

    //Conteúdo da coluna
    property Content : String read FContent write SetContent;

    //Alinhamento da coluna
    property Align : String read FAlign write SetAlign;
  end;


  //Classe de tabelas HTML
  THTMLTable = class
  private

    function GetHTMLColumns(Index: integer): THTMLColumn;
    procedure SetHTMLColumns(Index: integer; const Value: THTMLColumn);

  protected

  public

    property HTMLColumns[Index : integer] : THTMLColumn read GetHTMLColumns write SetHTMLColumns;

  end;


implementation

{ THTMLColumn }

constructor THTMLColumn.Create( iTitle : String; iMinWidth : integer );
begin
  inherited Create;
  FTitle    := iTitle;
  FMinWidth := iMinWidth;
end;

procedure THTMLColumn.SetAlign(const Value: String);
begin
  FAlign := Value;
end;

procedure THTMLColumn.SetContent(const Value: String);
begin
  FContent := Value;
end;

procedure THTMLColumn.SetMinWidth(const Value: integer);
begin
  FMinWidth := Value;
end;

procedure THTMLColumn.SetTitle(const Value: String);
begin
  FTitle := Value;
end;

{ THTMLTable }

{ THTMLTable }

function THTMLTable.GetHTMLColumns(Index: integer): THTMLColumn;
begin

end;

procedure THTMLTable.SetHTMLColumns(Index: integer;
  const Value: THTMLColumn);
begin

end;

end.
