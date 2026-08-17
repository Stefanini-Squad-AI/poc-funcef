{**************************************************************
Componente:  VarCalc

Autor     : Paulo André M. de Carvalho

Data      : 14/04/1999

Objetivo: Proporcionar a estruturação das variáveis necessárias à
          validação da expressão e ao cálculo e propor metodos para
          manipula-las.

Propriedades Publicadas:

      Fvariavel (R/W)     : StringList que contém a lista de variáveis
                            pré-definidas.

      Fvalor (R/W)        : StringList que contém o valor das variáveis
                            pré-definidas.

      Fvalor_default(R/W) : StringList que contém o valor defaults das
                            variáveis, caso seja necessário atualiza-las
                            novamente com o valor original.

      Ftabua (R/W)        : Indica se a variável é de tábua ou não. Atributo
                            necessário para criticar se a variável pode ser
                            indexada

Métodos Publicos:
      Create            : Cria uma instância da classe TVarList.

      Destroy           : Destroi a instância ativa da classe TVarList.


      SetVarValue       : Altera o valor de uma variável na lista de valores
                          ou, caso ela não exista, inclui a variável na lista
                          de variáveis e seu valor na lista de valores.
                          Recebe o nome da variável e o valor.

      GetVarValue       : Recupera o Valor de uma variável. Recebe o nome da
                          variável e retorna o valor correspondente. Retirna
                          Null caso esta variável não exista.

      SetDefaultValue   : Altera todos os valores da Lista Fvalor para os
                          valores default da Lista Fvalor_default.

****************************************************************}
unit uVarCalc;

interface

Uses DBTables,Classes,SysUtils, uFuncGerais;

Type
  TVarCalc = Class

    Private
      // Query para a carga das variáveis do Banco na Lista
      Fqry_var : TQuery;

      //-- Rotina que Carrega Lista de Variáveis
      Procedure FillVarList;

    Public

      //-- Listas que armazenam as Variáveis e seus valores
      Fvariavel      : TStringList;
      Fvalor         : TStringList;
      Fvalor_default : TStringList;
      Ftabua         : TStringList;

      //-- Create e Destroy da Classe
      Constructor Create (AOWner : TComponent);
      Destructor Destroy; override;

      //-- Rotina que inclui ou altera variáveis e seus valores na Lista
      Procedure SetVarValue (Variavel : String; Valor : Extended);

      //-- Rotina que recupera valores de variáveis da Lista
      Function GetVarValue (Variavel : String) : Variant;

      //-- Atualiza as variáveis da Lista com os valores defaults
      Procedure SetDefaultValue;

End;

implementation

//--------------------------------------------------------
//-- Cronstructor Classe
//--------------------------------------------------------
Constructor TVarCalc.Create (AOwner : TComponent);
Begin
     Inherited Create;
     Fvariavel      := TStringList.Create;
     Fvalor         := TStringList.Create;
     Fvalor_default := TStringList.Create;
     Ftabua         := TStringList.Create;

     Fqry_var       := TQuery.Create(AOwner);

     //-- Rotina que Carrega Lista de Variáveis com valor default
     FillVarList;
End;

//--------------------------------------------------------
//-- Destroy da Classe
//--------------------------------------------------------
Destructor TVarCalc.Destroy;
Begin
     Fvariavel.Free;
     Fvalor.Free;
     Fvalor_default.Free;
     Ftabua.Free;
     Fqry_var.Free;
     Inherited Destroy;
End;

//---------------------------------------------------------------
//-- Rotina que Carrega a Lista de variáveis
//---------------------------------------------------------------
Procedure TVarCalc.FillVarList;
Begin

     Fqry_var.DataBaseName := 'BaseDados';
     Fqry_var.SQL.Clear;
     Fqry_var.SQL.Add ('Select NO_VARIAVEL,VL_DEFAULT,IR_TABUA FROM FI_VARIAVEL');
     Fqry_var.Open;
     While not Fqry_var.EOF Do
       Begin
         // Atualiza Nome, Valor e Valor default
         SetVarValue(Fqry_var.FieldByname('NO_VARIAVEL').AsString,Fqry_var.FieldByname('VL_DEFAULT').AsFloat);
         // Atualiza se variável é de Tábua
         Ftabua.Add(Fqry_var.FieldByname('IR_TABUA').AsString);
         Fqry_var.Next;
       End;
     Fqry_var.Close;;

End;

//------------------------------------------------------------------//
//-- Rotina que inclui ou altera variáveis e seus valores na Lista
//------------------------------------------------------------------//
Procedure TVarCalc.SetVarValue (Variavel : String; Valor : Extended);
Var WI : Integer;
Begin

     WI := Get_String_Index(Fvariavel, Variavel);

     If WI = -1 Then // Se não encontrou inclui variável na Lista
        Begin
          Fvariavel.Add(Variavel);
          Fvalor.Add(Floattostr(Valor));
          Fvalor_default.Add(Floattostr(Valor));// Inclui 1º Valor como Default
        End
     Else              // Senão altera valor da variável
        Begin
          Fvariavel[WI] := Variavel;
          Fvalor[WI] := Floattostr(Valor);
        End;
End;

//------------------------------------------------------------------//
//-- Rotina que recupera valores de variáveis da Lista
//------------------------------------------------------------------//
Function TVarCalc.GetVarValue (Variavel : String) : Variant;
Var WInd : Integer;
Begin
     WInd := Get_String_Index(Fvariavel,Variavel);

     If WInd = -1 Then
        Result := Null
     Else
        Result := strtoFloat(Fvalor[WInd]);
End;

//------------------------------------------------------------------//
//-- Atualiza as variáveis da Lista com os valores defaults
//------------------------------------------------------------------//
Procedure TVarCalc.SetDefaultValue;
Var WInd : Integer;
Begin
     For WInd := 0 To Fvariavel.Count - 1 do
       Fvalor[WInd] := Fvalor_default[WInd];
End;

end.
