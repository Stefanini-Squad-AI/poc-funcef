unit uRegArquivo;

interface

uses Classes, DBTables, SysUtils;

Type TRegArquivo = Class
     SQ_CAMPO                : array [1..50] of Integer;
     NO_CAMPO_ARQUIVO        : array [1..50] of String;
     NR_ORDEM                : array [1..50] of Integer;
     NR_TAM_CAMPO            : array [1..50] of Integer;
     TP_ATRIBUTO             : array [1..50] of String;
     DS_SIMBOLO_DECIMAL      : array [1..50] of String;
     NR_DECIMAL              : array [1..50] of Integer;
     DS_SIMBOLO_AGRUPADOR    : array [1..50] of String;
     DS_MASCARA_DATA         : array [1..50] of String;
     SQ_CAMPO_MASTER         : array [1..50] of Integer;
     IR_RELATORIO_CRITICA    : array [1..50] of String;
     NR_CAMPOS_OCORRENCIA    : array [1..50] of integer;

Private

     FTamReg           : integer;
     FTipoArquivo      : String;
     FTipoDelimitador  : Variant;
     FOutroDelimitador : Variant;
     FQualificador     : Variant;

     Fqry : TQuery;

     Procedure SetPropriedades ( Layout : Integer );
     Procedure GetLayout ( Layout : Integer );
     procedure SetGrupoOcorrencia;
Public

     // Armazena o tamanho do Registro
     property TamReg           : integer read FTamReg;
     // Armazena o Tipo do Arquivo
     property TipoArquivo      : String read FTipoArquivo;
     // Armazena o Tipo do Delimitador de campos, se existir, ou null.
     property TipoDelimitador  : Variant read FTipoDelimitador;
     // Armazena o outro delimitador, se existir, ou null.
     property OutroDelimitador : Variant read FOutroDelimitador;
     // Armazena o qualificador de texto, se existir, ou null.
     property Qualificador     : Variant read FQualificador;


     Constructor Create (AOWner : TComponent; Layout : integer);
     Destructor Destroy; override;
End;


implementation

//--------------------------------------------------------
//-- Constroi a Classe TRegLayout
//--------------------------------------------------------
Constructor TRegArquivo.Create (AOwner : TComponent; Layout : integer);
Begin

  Inherited Create;

  //-- Cria Query de Trabalho
  Fqry := TQuery.Create(AOwner);
  Fqry.DataBaseName := 'BaseDados';

  //-- Seta Propriedades da Classe
  SetPropriedades ( Layout );

  //-- Carrega Layout
  GetLayout( Layout );

End;

//--------------------------------------------------------
//-- Destroy da Classe
//--------------------------------------------------------
Destructor TRegArquivo.Destroy;
Begin
  Fqry.Free;
  Inherited Destroy;
End;

//--------------------------------------------------------
//-- Seta Propriedades da Classe
//--------------------------------------------------------
Procedure TRegArquivo.SetPropriedades ( Layout : Integer );
Begin

  //-- Carrega Atributos do Lay-out
  Fqry.SQL.Clear;
  Fqry.SQL.Add ('SELECT TP_ARQUIVO, TP_DELIMITADOR_CAMPO, DS_OUTRO_DELIMITADOR, TP_QUALIFICADOR_TEXTO');
  Fqry.SQL.Add ('FROM   FI_ARQUIVO');
  Fqry.SQL.Add ('WHERE  CD_ARQUIVO = ' + inttostr( Layout ));
  Fqry.Open;
  if Fqry.eof Then
     Begin
       Fqry.Close;
       Raise Exception.Create ('Definições do Lay-out não encontrado');
     End
  Else
     Begin
       FTipoArquivo      := Fqry.FieldByName('TP_ARQUIVO').AsString;
       FTipoDelimitador  := Fqry.FieldByName('TP_DELIMITADOR_CAMPO').Value;
       FOutroDelimitador := Fqry.FieldByName('DS_OUTRO_DELIMITADOR').Value;
       FQualificador     := Fqry.FieldByName('TP_QUALIFICADOR_TEXTO').Value;

       //Trara Tipo de Delimitador
       If FTipoDelimitador <> Null Then
          Begin
            if FTipoDelimitador  = 'V' Then
               FTipoDelimitador := ','
            Else
            if FTipoDelimitador  = 'P' Then
               FTipoDelimitador := ';'
            Else
            if FTipoDelimitador  = 'E' Then
               FTipoDelimitador := ' '
            Else
            if FTipoDelimitador  = 'T' Then
               FTipoDelimitador := ^T
            Else
            if FTipoDelimitador  = 'O' Then
               FTipoDelimitador := FOutroDelimitador
            Else
               Raise Exception.Create ('Tipo de delimitador definido inválido');
          End;

       //Trara Tipo de Qualificador
       if FQualificador  <> Null Then
          Begin
            if FQualificador  = 'A' Then
               FQualificador := '"'
            Else
            if FQualificador  = 'P' Then
               FQualificador := #39
            Else
            if FQualificador  <> 'N' Then
               Raise Exception.Create ('Tipo de qualificador de texto inválido');
          End;
     End;
  Fqry.Close;
End;

//---------------------------------------------------------------
//-- Carrega Layout
//---------------------------------------------------------------
Procedure TRegArquivo.GetLayout ( Layout : Integer );
Var WI : Integer;
Begin

  //-- Lê Estrutura do Layout
  Fqry.SQL.Clear;
  Fqry.SQL.Add ('SELECT NR_ORDEM,CD_ARQUIVO,SQ_CAMPO,NO_CAMPO_ARQUIVO,NR_TAM_CAMPO,');
  Fqry.SQL.Add ('TP_ATRIBUTO,DS_SIMBOLO_DECIMAL,NR_DECIMAL,DS_SIMBOLO_AGRUPADOR,');
  Fqry.SQL.Add ('DS_MASCARA_DATA,CD_ARQUIVO_MASTER,SQ_CAMPO_MASTER,');
  Fqry.SQL.Add ('IR_RELATORIO_OCORRENCIA');
  Fqry.SQL.Add ('FROM FI_LAYOUT_ARQUIVO');
  Fqry.SQL.Add ('WHERE CD_ARQUIVO = ' + inttostr( Layout ));
  Fqry.SQL.Add ('ORDER BY NR_ORDEM');
  Fqry.Open;
  if Fqry.eof Then
     Begin
       Fqry.Close;
       Raise Exception.Create ('Lay-out de arquivo não encontrado');
     End
  Else
     Begin
       //Armazena dados relativos ao Layout
       FTamReg := Fqry.RecordCount;
       //Carrega Layout
       WI := 1;
       While not Fqry.Eof do
         Begin
           Try
           SQ_CAMPO[WI]             := Fqry.FieldByName('SQ_CAMPO').AsInteger;
           NO_CAMPO_ARQUIVO[WI]     := Fqry.FieldByName('NO_CAMPO_ARQUIVO').AsString;
           NR_ORDEM[WI]             := Fqry.FieldByName('NR_ORDEM').AsInteger;
           NR_TAM_CAMPO[WI]         := Fqry.FieldByName('NR_TAM_CAMPO').AsInteger;
           TP_ATRIBUTO[WI]          := Fqry.FieldByName('TP_ATRIBUTO').AsString;
           DS_SIMBOLO_DECIMAL[WI]   := Fqry.FieldByName('DS_SIMBOLO_DECIMAL').AsString;
           NR_DECIMAL[WI]           := Fqry.FieldByName('NR_DECIMAL').AsInteger;
           DS_SIMBOLO_AGRUPADOR[WI] := Fqry.FieldByName('DS_SIMBOLO_AGRUPADOR').AsString;
           DS_MASCARA_DATA[WI]      := Fqry.FieldByName('DS_MASCARA_DATA').AsString;
           SQ_CAMPO_MASTER[WI]      := Fqry.FieldByName('SQ_CAMPO_MASTER').AsInteger;
           IR_RELATORIO_CRITICA[WI] := Fqry.FieldByName('IR_RELATORIO_OCORRENCIA').AsString;
           NR_CAMPOS_OCORRENCIA[WI] := 0;
           Fqry.Next;
           WI := WI + 1;
           Except End;
         End;
       Fqry.Close;
     End;

     SetGrupoOcorrencia;

End;

//---------------------------------------------------------------
//-- Rotina que Seta quais tipos são grupos de Ocorrências
//---------------------------------------------------------------
procedure TRegArquivo.SetGrupoOcorrencia;
Var WI1 : Integer;
    WI2 : Integer;
Begin
  For WI1 := 1 to FTamReg Do
    For WI2 := 1 to FTamReg Do
      If SQ_CAMPO[WI1] = SQ_CAMPO_MASTER[WI2] Then
         NR_CAMPOS_OCORRENCIA[WI1] := NR_CAMPOS_OCORRENCIA[WI1] + 1;
End;


end.
