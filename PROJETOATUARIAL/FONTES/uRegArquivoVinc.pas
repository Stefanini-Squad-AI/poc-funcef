unit uRegArquivoVinc;

interface

uses Classes, DBTables, SysUtils;

//***RCM 09/11/2001   - alterado tam. dos Arrays de 50 p/ 100
Type TRegArquivoVinc = Class
     SQ_CAMPO           : array [1..100] of Integer;
     NR_ORDEM           : array [1..100] of Integer;
     NO_TABELA          : array [1..100] of String;
     NO_ATRIBUTO_TABELA : array [1..100] of String;
     VL_ARQUIVO         : array [1..100] of String;
     VL_ATRIBUIDO       : array [1..100] of String;
Private
    FTamReg : integer;
    Fqry    : TQuery;

    Procedure GetLayoutVinc ( Layout : Integer );
Public

     // Armazena o tamanho do Registro
     property TamReg: integer read FTamReg;

     Constructor Create (AOWner : TComponent; Layout : integer);
     Destructor Destroy; override;
End;


implementation

//--------------------------------------------------------
//-- Constroi a Classe TRegLayout
//--------------------------------------------------------
Constructor TRegArquivoVinc.Create (AOwner : TComponent; Layout : integer);
Begin

  Inherited Create;

  //-- Cria Query de Trabalho
  Fqry := TQuery.Create(AOwner);
  Fqry.DataBaseName := 'BaseDados';

  //-- Carrega Layout
  GetLayoutVinc( Layout );

End;

//--------------------------------------------------------
//-- Destroy da Classe
//--------------------------------------------------------
Destructor TRegArquivoVinc.Destroy;
Begin
  Fqry.Free;
  Inherited Destroy;
End;

//---------------------------------------------------------------
//-- Carrega vinculação de Campos do Layout
//---------------------------------------------------------------
procedure TRegArquivoVinc.GetLayoutVinc ( Layout : Integer );
Var WI : Integer;
Begin
  //-- Lê vinculação de Campos
  Fqry.SQL.Clear;
  Fqry.SQL.Add ('SELECT A.NR_ORDEM, B.SQ_CAMPO, B.NO_TABELA, B.NO_ATRIBUTO_TABELA,');
  Fqry.SQL.Add ('B.CD_ARQUIVO, C.VL_ARQUIVO,C.VL_ATRIBUIDO');
  Fqry.SQL.Add ('FROM  FI_LAYOUT_ARQUIVO A,');
  Fqry.SQL.Add ('FI_LAYOUT_ARQUIVO_TABELA B, FI_LAYOUT_ARQUIVO_TABELA_VALOR C');
  Fqry.SQL.Add ('WHERE A.CD_ARQUIVO = B.CD_ARQUIVO');
  Fqry.SQL.Add ('  AND A.SQ_CAMPO   = B.SQ_CAMPO');
  Fqry.SQL.Add ('  AND B.NO_TABELA  = C.NO_TABELA (+)');
  Fqry.SQL.Add ('  AND B.NO_ATRIBUTO_TABELA = C.NO_ATRIBUTO_TABELA (+)');
  Fqry.SQL.Add ('  AND B.CD_ARQUIVO = C.CD_ARQUIVO (+)');
  Fqry.SQL.Add ('  AND B.SQ_CAMPO   = C.SQ_CAMPO (+)');
  Fqry.SQL.Add ('  AND A.CD_ARQUIVO = ' + inttostr( Layout));
  Fqry.SQL.Add ('ORDER BY A.NR_ORDEM');
  Fqry.Open;
  if Fqry.eof Then
     Begin
       Fqry.Close;
       Raise Exception.Create ('Não foi estabelecida nehuma vinculação entre os campos do Layout e os campos do sistema;');
     End
  Else
     Begin
       FTamReg := Fqry.RecordCount;

       //--Carrega array de vinculação de campos
       WI := 1;
       While not Fqry.Eof do
         Begin
           SQ_CAMPO[WI]           := Fqry.FieldByName('SQ_CAMPO').AsInteger;
           NR_ORDEM[WI]           := Fqry.FieldByName('NR_ORDEM').AsInteger;
           NO_TABELA[WI]          := Fqry.FieldByName('NO_TABELA').AsString;
           NO_ATRIBUTO_TABELA[WI] := Fqry.FieldByName('NO_ATRIBUTO_TABELA').AsString;
           VL_ARQUIVO[WI]         := Fqry.FieldByName('VL_ARQUIVO').AsString;
           VL_ATRIBUIDO[WI]       := Fqry.FieldByName('VL_ATRIBUIDO').AsString;
           Fqry.Next;
           WI := WI + 1;
         End;
       Fqry.Close;
     End;
End;



end.
