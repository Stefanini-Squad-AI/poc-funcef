unit UFuncoesdeImpressao;

interface

uses Dialogs, SysUtils, printers, graphics, forms, dbtables, wintypes, lzExpand,
     DbiProcs, DbiTypes,db, WinProcs,USistema;

type TFuncoesdeImpressao = Class(TObject)

Private

Public

  {Imcrementa Linha, usado para impressoras não matriciais, driver não genérico}
procedure IncLinha(var linha:Integer;inumLinhas: Real);

  {Imcrementa Coluna, usado para impressoras não matriciais, driver não genérico}
procedure IncColuna(var Coluna:Integer;inumColunas: Real);

  {Imprime o Nome da Empresa e o Titulo do Relatorio}
function  Cabecalho(titulo:string):integer;

  {Imprime a Data,Hora da Impressão + Numero da Página + Sistema}
function  Rodape(colmax:Integer):integer;

 {Altera a Fonte do Texto a ser impresso}
procedure Mudafonte(Nome:string;Tamanho:integer;Cor:Tcolor;Estilo:TFontStyles;pPitch:TFontPitch);

  {Centraliza o texto na área de impressão}
Function  Center(s1,s2:string):Integer;

 {Retorna a Posição em Pixel, do texto em Relação a área de Impressão}
function  Right(s:string;pos:Integer):Integer;

  {Economiza linhas de Código!!!!!!!}
procedure Imprime(col,lin:Integer;texto:String);

  {Alinha a Direita}
Function AD(S:string; T:Integer):String;

  {Espaços em branco}
Function Spc (QTD:Integer):String;

  {ainha a esquerda}
Function AE(S:string; T:Integer):String;

  {alinha a direita precedido de zeros}
Function ZD(S:string; T:Integer):String;

  {alinha a direita seguido de zeros}
Function ZE(S:string; T:Integer):String;

Function PassaTraco(Col,Lin:Integer):Integer;

end;

var FuncoesdeImpressao : TFuncoesdeImpressao;

const
  FonteTitulo:string='Ms Sans Serif';
  fonteSinistro:string='Ms Sans Serif';
  FonteDetalhe:String='Ms Sans Serif';
  MargemEsquerda:Byte=10;


implementation


procedure TFuncoesdeImpressao.Imprime(col,lin:Integer;texto:String);
begin
  printer.canvas.textout(col,lin,texto);
end;

function TFuncoesdeImpressao.Right(s:string;pos:Integer):Integer;
begin
 Result := Pos - Printer.Canvas.TextWidth(s);
end;


procedure TFuncoesdeImpressao.Mudafonte(Nome:string;Tamanho:integer;Cor:Tcolor;Estilo:TFontStyles;pPitch:TFontPitch);
begin
  with printer.canvas.font do begin
    name:=nome;
    size:=Tamanho;
    Color:=Cor;
    Style:=Estilo;
    Pitch:=pPitch;
  End;
end;

function TFuncoesdeImpressao.Cabecalho(titulo:String):Integer;
var
  col,
  lin:Integer;
  tamatual:Integer;
  corAtual:TColor;
  estiloAtual:TFontStyles;
  fonteAtual:String;
  PitchAtual:TFontPitch;
begin
  tamatual:=Printer.Canvas.Font.Size;
  corAtual:=Printer.Canvas.Font.Color;
  estiloAtual:=Printer.Canvas.Font.Style;
  fonteAtual:=Printer.Canvas.Font.Name;
  PitchAtual:=Printer.Canvas.Font.Pitch;
  MudaFonte(fontetitulo,14,clBlack,[fsBold],fpDefault);
  Lin:=10;
  Col:=( printer.PageWidth-Printer.Canvas.TextWidth(trim(Sistema.NomeEmpresa)) )div 2;
  printer.Canvas.Textout(Col,Lin,trim(Sistema.NomeEmpresa));

  IncLinha(lin,2);
  Col:=( printer.PageWidth-Printer.Canvas.TextWidth(Titulo) )div 2;
  printer.Canvas.Textout(Col,Lin,Titulo);
  IncLinha(lin,2);

  Result:=Lin;
  MudaFonte(fonteatual,tamatual,coratual,estiloatual,PitchAtual);
end;

function TFuncoesdeImpressao.Rodape(ColMax:Integer):Integer;
var
  col,
  lin:Integer;
  tamatual:Integer;
  corAtual:TColor;
  estiloAtual:TFontStyles;
  fonteAtual:String;
  PitchAtual:TFontPitch;
begin
  tamatual:=Printer.Canvas.Font.Size;
  corAtual:=Printer.Canvas.Font.Color;
  estiloAtual:=Printer.Canvas.Font.Style;
  fonteAtual:=Printer.Canvas.Font.Name;
  PitchAtual:=Printer.Canvas.Font.Pitch;
  MudaFonte(fontetitulo,8,clBlack,[fsBold],fpDefault);
  Lin:=Printer.PageHeight-150;
  //
  lin:=PassaTraco(colmax,lin);
  //
  // Módulo
  col:=10;
  Printer.Canvas.textOut(Col,Lin,Sistema.NomeModulo);
  // Página
  Col:=Center('','Pág. '+trim(IntToStr(Printer.PageNumber)));
  Printer.Canvas.textOUt(Col,Lin,'Pág. '+trim(IntToStr(Printer.PageNumber)));
  //Data Hora
  col:=Printer.PageWidth-Printer.Canvas.TextWidth(DateTimeTostr(Now))-10;
  Printer.Canvas.textOut(Col,Lin,DateTimeTostr(Now));
  Result:=Lin;
  MudaFonte(fonteatual,tamatual,coratual,estiloatual,PitchAtual);
end;

procedure TFuncoesdeImpressao.IncLinha(var Linha:Integer;inumLinhas: Real);
Begin
  Linha:=Linha+ round(abs(printer.Canvas.font.height * iNumLinhas));
End;

procedure TFuncoesdeImpressao.IncColuna(var Coluna:Integer;inumColunas: Real);
Begin
  Coluna:=Coluna + round(abs(Printer.Canvas.TextWidth('S') * iNumColunas));
End;


Function TFuncoesdeImpressao.Center(s1,s2:string):Integer;
begin
  result:=(Printer.PageWidth - Printer.Canvas.textWidth(s2)) div 2;
end;


Function TFuncoesdeImpressao.AD(S:string; T:Integer):String;
var temp:string;
    cont:Integer;
Begin
     temp := s;
     for cont:=1 to t - length(s) do
     temp:=' '+temp;
     result := temp;
end;

Function TFuncoesdeImpressao.AE(S:string; T:Integer):String;
var temp:string;
    cont:Integer;
Begin
     temp := s;
     for cont:=1 to t - length(s) do
     temp:=temp+' ';
     result := temp;
end;

Function TFuncoesdeImpressao.Spc (QTD:Integer):String;
var cont: Integer;
    t:string;
begin
   t:=' ';
   for cont:=1 to qtd do
   t:=t+' ';
   result := t;
end;

Function TFuncoesdeImpressao.ZD(S:string; T:Integer):String;
var temp:string;
    cont:Integer;
Begin
     temp := s;
     for cont:=1 to t - length(s) do
     temp:=' '+temp;
     result := temp;
end;

Function TFuncoesdeImpressao.ZE(S:string; T:Integer):String;
var temp:string;
    cont:Integer;
Begin
     temp := s;
     for cont:=1 to t - length(s) do
     temp:=temp+' ';
     result := temp;
end;

Function TFuncoesdeImpressao.PassaTraco(Col,Lin:Integer):Integer;
var sTexto:String;
Begin
  sTexto:='';
  for col:=10 to Printer.PageWidth do
  Begin
     sTexto:=sTexto+#95;
  end;
  IncLinha(lin,1);
  Printer.Canvas.textOut(10,Lin,sTexto);
  IncLinha(lin,2);
  result:=lin;
end;

end.
