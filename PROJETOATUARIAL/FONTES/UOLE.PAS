unit UOLE;

interface

uses SysUtils,DB,DBTables,ComObj,Dialogs;

type
  TOLEObject = class(TObject)
  private
     qry : TDataSet;
     salvar: boolean;
     arquivo: string;
     fNome_Pasta:String;
     function GetCell(i,j:integer):string;
     function GetLetra(valor:integer):string;
  public
     constructor Create(query: TDataSet);
     procedure CallExcel;
     procedure SetSalvar(vsalvar: boolean);
     procedure SetArquivo(varquivo: string);

     property Nome_Pasta:String read fNome_Pasta write fNome_Pasta;
  end;

implementation

constructor TOLEObject.Create(query: TDataSet);
begin
   qry := query;
   salvar := false;
   arquivo := 'C:\Planilha.xls';
   fNome_Pasta := '';
end;

procedure TOLEObject.SetSalvar(vsalvar: boolean);
begin
   salvar := vsalvar;
end;

procedure TOLEObject.SetArquivo(varquivo: string);
begin
   arquivo := varquivo;
end;

procedure TOLEObject.CallExcel;
var Ole: Variant;
    coluna, formato_antigo: string;
    largura: integer;
    i,j : integer;
begin
   formato_antigo := ShortDateFormat;
   ShortDateFormat := 'mm/dd/YYYY';
   Ole := CreateOLEObject('Excel.Application');

   Ole.Visible := true;
   Ole.WorkBooks.add(1);

   If fNome_Pasta <> '' Then
      OLE.ActiveSheet.Name := Nome_Pasta;

   For j := 0 to qry.Fieldcount-1 do
   Begin
      coluna := GetLetra(j+1);

      If qry.Fields[j].DisplayWidth > length(qry.Fields[j].FieldName) then
         largura := qry.Fields[j].DisplayWidth
      Else
         largura := length(qry.Fields[j].FieldName);

      OLE.ActiveSheet.Columns[coluna].ColumnWidth := largura;

      OLE.ActiveSheet.Range[GetCell(0,j)].Value := qry.Fields[j].FieldName;
   End;

   qry.first;
   i := 1;

   While not qry.EOF do
   Begin
      For j := 0 to qry.Fieldcount-1 do
      Begin
         OLE.ActiveSheet.Range[GetCell(i,j)].Value := qry.Fields[j].asstring;
      End;
      i := i + 1;
      qry.next;
   End;

   If salvar then
   Begin
      Try
         OLE.ActiveWorkbook.SaveAs(arquivo);
      Except
         showMessage('Não foi possível salvar os dados no Excel');
      End;
   End;
   ShortDateFormat := formato_antigo;
end;

function TOLEObject.GetLetra(valor:integer):string;
var aux : string;
    resto: integer;
    resultado : integer;
begin
   aux := '';

   If (valor mod 26) = 0 then
   Begin
      resto := 26;                     
      resultado := (valor div 26) - 1; 
   End
   Else
   Begin
      resto := valor mod 26;
      resultado := valor div 26;
   End;

   If resultado <> 0 then
      aux := aux + GetLetra(resultado) + CHR(ORD('A') + resto - 1)
   Else
      aux := aux + CHR(ORD('A')+ resto - 1);
   result := aux;
end;

function TOLEObject.GetCell(i,j:integer):string;
var aux : string;
begin
   aux := GetLetra(j+1) + inttostr(i+1);
   result := aux;
end;

end.
