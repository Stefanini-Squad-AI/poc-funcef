unit uRegDados;

interface

uses Classes, DBTables, SysUtils, uRegArquivo;

Type TRegDados = Class
     SQ_CAMPO : array [1..100] of Integer;
     NR_ORDEM : array [1..100] of Integer;
     VL_CAMPO : array [1..100] of String;
Private
     FTamReg  : integer;
Public

     // Armazena o tamanho do Registro
     property TamReg : integer read FTamReg;

     //Seta valor do campo
     Procedure SetFieldValue ( codigo : Integer; ordem : Integer; Valor, Tabela, Campo: String; Beneficiario: Boolean);
     //Limpa Registro
     Procedure ClearRegDados;
     //Inicializa Reg Dados com o arquivo
     Procedure SetRegDadosArquivo ( Layout : TRegArquivo );

     Constructor Create;
     Destructor Destroy; override;

End;

implementation

//--------------------------------------------------------
//-- Constroi a Classe TRegLayout
//--------------------------------------------------------
Constructor TRegDados.Create;
Begin
  Inherited Create;
  FTamReg := 0;
End;

//--------------------------------------------------------
//-- Destroy da Classe
//--------------------------------------------------------
Destructor TRegDados.Destroy;
Begin
  Inherited Destroy;
End;

//--------------------------------------------------------
//-- Seta Valor do Campo
//--------------------------------------------------------
Procedure TRegDados.SetFieldValue ( codigo : Integer; ordem : Integer; Valor, Tabela, Campo: String; Beneficiario: Boolean);
Begin
  SQ_CAMPO[ordem] := codigo;
  NR_ORDEM[ordem] := ordem;

  if (Beneficiario) and (UpperCase(Tabela) = 'FI_DEPENDENTE') and (UpperCase(Campo) <> 'CD_TIPO_BENEF') then
    VL_CAMPO[ordem] := ''
  else
    VL_CAMPO[ordem] := Valor;

  If ordem > FTamReg Then
     FTamReg := ordem;
End;

//--------------------------------------------------------
//-- Limpa Registro
//--------------------------------------------------------
Procedure TRegDados.ClearRegDados;
Var wi : integer;
Begin
  FTamReg := 0;
  For wi := 1 to 100 Do
    Begin
      SQ_CAMPO[wi] := 0;
      NR_ORDEM[wi] := 0;
      VL_CAMPO[wi] := '';
    End;
End;

//--------------------------------------------------------
//-- Seta RegDados com o Layout do arquivo padrão
//--------------------------------------------------------
Procedure TRegDados.SetRegDadosArquivo ( Layout : TRegArquivo );
Var wi : integer;
Begin
  FTamReg := Layout.TamReg;

  If FTamReg > 100 Then
     Raise Exception.Create ('Estouro de área de memória reservada. Contacte a manutenção');

  For wi := 1 to FTamReg Do
    Begin
      SQ_CAMPO[Layout.NR_ORDEM[wi]] := Layout.SQ_CAMPO[wi];
      NR_ORDEM[Layout.NR_ORDEM[wi]] := Layout.NR_ORDEM[wi];
      VL_CAMPO[Layout.NR_ORDEM[wi]] := '';
    End;
End;

End.
