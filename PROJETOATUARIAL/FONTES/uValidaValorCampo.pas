{===============================================================================
Unit    :  uValidaValorCampo
Form    :

Autor   : Paulo André M. de Carvalho
Empresa : Fórmula Informática Ltda.

Data    : 13/05/1999

Objetivo: Veificar se o valor atribuído a um campo da Base de dados é um valor
          válido

Propriedades Publicadas:

Métodos Públicos:

      ValorCampoValido : Retorna True se Valor é valido para o campo
                         Retorna False se valor é inválido para o campo

Manutenção:

   Data       Responsável      Descrição
----------    -----------      -------------------------------------------------
================================================================================}
unit uValidaValorCampo;

interface

Uses DBTables,Classes,SysUtils,uMensagem,DB;

Var WMensagem : TMensagem;

Type
  TValidaValorCampo = Class

    Private
      // Query para a carga do arquivo
      Fqry : TQuery;

      // Lê Definições do Atributo
      Procedure LeCampo ( Tabela : String; Atributo : String );
      // Verifica Validade do Atributo do Tipo Alfanumérico
      Function  CriticaAlfa ( Tam : Integer; Valor : String ) : Boolean;
      // Verifica Validade do Atributo do Tipo Numérico Inteiro
      Function  CriticaNumInt ( Valor : String ) : Boolean;
      // Verifica Validade do Atributo do Tipo Numérico Decimal
      Function  CriticaNumFloat ( Valor : String ) : Boolean;
      // Verifica Validade do Atributo do Tipo Data
      Function  CriticaData ( Valor : String ) : Boolean;

    Public
      //-- Indicadores de Erros ou Avisos
      FErro     : Boolean;
      FAviso    : Boolean;
      FMensagem : String; // Armazena os Erros decorrentes da crítica

      //-- Create e Destroy da Classe
      Constructor Create;
      Destructor Destroy; override;
      //-- Valida Valor do Atributo
      Function Valor_Campo_Valido    ( AOwner : TComponent; Tabela : String; Atributo : String ; Valor : String ) : Boolean;
      Function Valor_Definido_Valido ( Tipo   : String; Tamanho  : Integer; Valor : String ) : Boolean;

End;

implementation

//--------------------------------------------------------
//-- Cronstructor Classe TValidaArquivo
//--------------------------------------------------------
Constructor TValidaValorCampo.Create;
Begin
     Inherited Create;
     WMensagem := TMensagem.Create;
End;

//--------------------------------------------------------
//-- Destroy da Classe TValidaArquivo
//--------------------------------------------------------
Destructor TValidaValorCampo.Destroy;
Begin
     WMensagem.Free;
     Inherited Destroy;
End;

//--------------------------------------------------------------------
//-- Valor_Campo_Valido
//----------------------------------------------------------------------//
//-- Função Publicada.
//--
//-- Parâmetros que requer
//--   Tabela   - Tabela que contém o campo.
//--   Atributo - Atributo - nome do campo na Tabela
//--   Valor    - Valor que se deseja atribuir ao campo para validação
//-- Parâmetros Retorna
//--   True     - Valor atribuído é válido para o campo
//--   False    - Valor atribuído não é válido para o campo
//--
//----------------------------------------------------------------------//
Function TValidaValorCampo.Valor_Campo_Valido (AOwner : TComponent; Tabela : String; Atributo : String; Valor : String ) : Boolean;
Begin

  Fqry      := TQuery.Create(AOwner);

  //-- Inicializa Variáveis de controle de Erro
  FErro     := False;
  FAviso    := False;
  FMensagem := '';

  LeCampo ( Tabela , Atributo );
  if (Fqry.FieldByName('TP_ATRIBUTO').AsString = 'A')
  or (Fqry.FieldByName('TP_ATRIBUTO').AsString = 'M') Then
     Result := CriticaAlfa ( Fqry.FieldByName('NR_TAM_ATRIBUTO_TABELA').AsInteger , Valor )
  Else
     if Fqry.FieldByName('TP_ATRIBUTO').AsString = 'N' Then
        Result := CriticaNumInt ( Valor )
     Else
        if Fqry.FieldByName('TP_ATRIBUTO').AsString = 'F' Then
           Result := CriticaNumFloat ( Valor )
        Else
           if Fqry.FieldByName('TP_ATRIBUTO').AsString = 'D' Then
              Result := CriticaData ( Valor )
           Else
              Raise Exception.Create ('Erro - Tipo de atributo inválido');
  Fqry.Close;

  //-- Seta Ocorrência de Erros
  FErro     := WMensagem.FErro;
  FAviso    := WMensagem.FAviso;
  FMensagem := WMensagem.FMensagem;

  Fqry.Free;

End;

//---------------------------------------------------------------
//-- Rotina que Lê as Definições do Atributo para efetuar a critica
//---------------------------------------------------------------
Procedure TValidaValorCampo.LeCampo (Tabela : String; Atributo : String);
Begin
     Fqry.DataBaseName := 'BaseDados';
     Fqry.SQL.Clear;
     Fqry.SQL.Add ('SELECT TP_ATRIBUTO, NR_TAM_ATRIBUTO_TABELA');
     Fqry.SQL.Add ('FROM FI_ATRIBUTO_TABELA');
     Fqry.SQL.Add ('Where NO_TABELA = ' + #39 + Tabela + #39);
     Fqry.SQL.Add ('AND   NO_ATRIBUTO_TABELA = ' + #39 + Atributo + #39);
     Fqry.Open;
End;

//--------------------------------------------------------------------
//-- Valor_Definido_Valido
//----------------------------------------------------------------------//
//-- Função Publicada.
//--
//-- Parâmetros que requer
//--   Tipo     - Tipo do campo ( A - Alfanumérico, N - Numérico inteiro, F - Numerico decimal, M - Memo, D - Data ) .
//--   Tamanho  - Tamanho do campo
//--   Valor    - Valor que se deseja atribuir ao campo para validação
//-- Parâmetros Retorna
//--   True     - Valor atribuído é válido para o campo
//--   False    - Valor atribuído não é válido para o campo
//--
//----------------------------------------------------------------------//
Function TValidaValorCampo.Valor_Definido_Valido ( Tipo : String; Tamanho : Integer; Valor : String ) : Boolean;
Begin
  //-- Inicializa Variáveis de controle de Erro
  FErro     := False;
  FAviso    := False;
  FMensagem := '';

  if (Tipo = 'A')
  or (Tipo = 'M') Then
     Result := CriticaAlfa ( Tamanho , Valor )
  Else
     if Tipo = 'N' Then
        Result := CriticaNumInt ( Valor )
     Else
        if Tipo = 'F' Then
           Result := CriticaNumFloat ( Valor )
        Else
           if Tipo = 'D' Then
              Result := CriticaData ( Valor )
           Else
              Raise Exception.Create ('Erro - Tipo de atributo inválido');

  //-- Seta Ocorrência de Erros
  FErro     := WMensagem.FErro;
  FAviso    := WMensagem.FAviso;
  FMensagem := WMensagem.FMensagem;
End;

//---------------------------------------------------------------
//-- Rotina que valida atributo do Tipo Alfanumérico
//---------------------------------------------------------------
Function TValidaValorCampo.CriticaAlfa ( Tam : Integer; Valor : String ) : Boolean;
Begin
  if Length(Valor) > Tam Then
     Begin
       Result := False;
       WMensagem.FErro := True;
       WMensagem.SetMsgErro('Valor incompatível com a natureza do campo;');
     End
  Else
     Result := True;
End;

//---------------------------------------------------------------
//-- Rotina que valida atributo do Tipo Numérico Inteiro
//---------------------------------------------------------------
Function TValidaValorCampo.CriticaNumInt ( Valor : String ) : Boolean;
Begin

  Try
    StrToInt(Valor);
    Result := True;
  Except
    Result := False;
    WMensagem.FErro := True;
    WMensagem.SetMsgErro('Valor incompatível com a natureza do campo;');
  End;

End;

//---------------------------------------------------------------
//-- Rotina que valida atributo do Tipo Numérico Float
//---------------------------------------------------------------
Function TValidaValorCampo.CriticaNumFloat ( Valor : String ) : Boolean;
Begin

  Try
    StrToFloat(Valor);
    Result := True;
  Except
    Result := False;
    WMensagem.FErro := True;
    WMensagem.SetMsgErro('Valor incompatível com a natureza do campo;');
  End;

End;

//---------------------------------------------------------------
//-- Rotina que valida atributo do Tipo Data
//---------------------------------------------------------------
Function TValidaValorCampo.CriticaData ( Valor : String ) : Boolean;
Begin
     Try
       Begin
         if (Trim(Valor) = 'NULL') then
           Try Except End
         else if Trim(Valor) <> '' then
           StrtoDate ( Valor );
         Result := True;
       End;
     Except
       Begin
         Result := False;
         WMensagem.FErro := True;
         WMensagem.SetMsgErro('Valor incompatível com a natureza do campo;');
       End;
     End;
End;
end.
