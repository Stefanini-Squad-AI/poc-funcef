unit uImporta;

interface

Uses Forms,DBTables,Classes,SysUtils,DB,uGlobal,uFuncGerais,
     uMensagem, FAnimacao, Controls, ComCtrls , Windows;

Type TRegLayout = Class
     CD_ARQUIVO              : array [1..150] of Integer;
     SQ_CAMPO                : array [1..150] of Integer;
     NO_CAMPO_ARQUIVO        : array [1..150] of String;
     NR_TAM_CAMPO            : array [1..150] of Variant;
     TP_ATRIBUTO             : array [1..150] of String;
     DS_SIMBOLO_DECIMAL      : array [1..150] of Variant;
     NR_DECIMAL              : array [1..150] of Variant;
     DS_SIMBOLO_AGRUPADOR    : array [1..150] of Variant;
     DS_MASCARA_DATA         : array [1..150] of Variant;
     CD_ARQUIVO_MASTER       : array [1..150] of Variant;
     SQ_CAMPO_MASTER         : array [1..150] of Variant;
     IR_RELATORIO_OCORRENCIA : array [1..150] of String;
     SE_GRUPO_OCORRENCIA     : array [1..150] of Variant;
End;

Type TRegVincCampo = Class
     CD_ARQUIVO              : array [1..150] of Integer;
     SQ_CAMPO                : array [1..150] of Integer;
     NO_TABELA               : array [1..150] of String;
     NO_ATRIBUTO_TABELA      : array [1..150] of String;
     NR_OCORRENCIA           : array [1..150] of Integer;
     VL_CAMPO                : array [1..150] of Variant;
     VL_ARQUIVO_CONV         : array [1..150] of Variant;
     VL_ATRIBUIDO            : array [1..150] of Variant;
     SE_GRAVADO              : array [1..150] of Boolean;
End;

Type TRegCamposTab = Class
     NO_TABELA               : array [1..170] of String;
     NO_ATRIBUTO_TABELA      : array [1..170] of String;
     IR_E_CHAVE              : array [1..170] of String;
     IR_E_FK                 : array [1..170] of String;
     TP_ATRIBUTO             : array [1..170] of String;
     VL_CAMPO                : array [1..170] of Variant;
End;

Type TRegArquivo = Class
     SQ_CAMPO                : array [1..150] of Integer;
     NO_CAMPO_ARQUIVO        : array [1..150] of String;
     NR_OCORRENCIA           : array [1..150] of Integer;
     VL_CAMPO                : array [1..150] of Variant;
End;

Type
  TImporta = Class

    Private
      //Tratamento de Erros
      WMensagem      : TMensagem;
      // Variável que armazena a Chave Sequencial
      FChave         : Integer;
      // Salva o Form Chamador
      FAOWner        : TComponent;
      // Arquivo Texto a ser Lido
      FArqTexto      : TextFile;
      // Ordem de importação de Tabelas do Sistema
      FOrdemImport   : TStringList;
      // Query para a carga do arquivo
      Fqry           : TQuery;
      // Controle de Ocorrência Gravada
      // Armzena a ocorrência que esta sendo gravada
      // Número de vezes que a tabela esta sendo gravada
      // começando de zero. Passada por Referência
      FOcorr         : Integer;

      // Atributos do Lay-out
      FRegLayout   : TRegLayout;
      FTamLayout   : Integer;
      F_TP_ARQUIVO : String;
      F_TP_DELIMITADOR_CAMPO  : Variant;
      F_DS_OUTRO_DELIMITADOR  : Variant;
      F_TP_QUALIFICADOR_TEXTO : Variant;

      //Variáveis de valor padrão atribuídos aos campos
      FRegVincCampo  : TRegVincCampo;
      FTamVincCampo  : Integer;

      //Variáveis de valor padrão atribuídos aos campos
      FRegCamposTab  : TRegCamposTab;
      FTamCamposTab  : Integer;

      //Variáveis do Arquivo Texto
      FRegArquivo    : TRegArquivo;
      FTamArquivo    : Integer;
      FTotLinhas     : Word;
      FLinhaAtual    : Word;
      FLinhaArquivo  : String;
      FLinhaOriginal : String;

      // Carrega Ordem de inclusão de tabelas dos Sistema
      Procedure GetOrdemImportacao;
      // Carrega Campos das tebelas
      Procedure GetCamposTabelas;
      // Carrega dados do arquivo a ser validado
      procedure GetLayout ( Layout : Integer );
      // Seta se determinado campo é Grupo de Ocorrência
      procedure SetGrupoOcorrencia;
      // Carrega Vinculação de Campos Layout
      procedure GetVincCampo ( Layout : Integer );
      // Seta dados referentes aos grupos de ocorrência
      Procedure GetDadosGrupoOcorr ( WILay : Integer; WIArq : Integer; Var WNumOcorr : Integer; Var WNumCampos : Integer; Var WTamOcorr : Integer );
      // Verifica se pode abrir para Leitura e inicializa w_tot_linhas
      Function GetArquivoTexto ( NomeDiretorio : String ; NomeArquivo : String ; const ArqTexto : TextFile ) : Boolean;
      // Inicia a importação do Arquivo
      Procedure ImportaArqTexto ( const ArqTexto : TextFile );
      // Critica Linha lida
      Function  SeLinhaArquivoOk ( Linha : String ) : Boolean;
      // Inicia animação de Importação
      procedure IniciaAnimacao;
      // Termina animação de Omportação
      procedure TerminaAnimacao;
      // Estrutura Registro lido do Arquivo
      procedure MontaRegArquivo;
      // Carrega Campo do Arquivo e Redimensiona Linha Lida
      Procedure CarregaCampo ( WILay : Integer ; WIArq : Integer ; WContOcorr : Integer ; WTamOcorr : Integer );
      // Formata Campos do Registro Lido
      Function FormataCampoArquivo : Boolean;
      // Formata um campo específico do Arquivo
      Function FormataCampo ( WILay : Integer ; WIArq : Integer ) : Boolean;
      // Elimina caracteres indesejáveis
      Function EliminaCaracter ( Campo : String ; Caracter : String ) : String;
      // Trata Separador de Decimais
      Function TrocaSeparadorDecimal ( Campo : String ; OldCaracter : String ; NewCaracter : Char ) : String;
      //-- Seta Número de casas Decimais do campo
      Function SetCasasDecimais ( Campo : String ; Numero : Integer ) : String;


      // Carrega Valores do FRegArquivo para FRegCampoVinc
      Procedure SetValorCampoVinc;
      // Grava RegArquivo nas Tabelas do Sistema
      Procedure GravaTabelaSistema;
      // Seta os campos da Tabela a partir de FRegArquivo
      Function SetValorCamposTabela ( Tabela : String ) : Boolean;
      // Limpa Valores atribuidos a todas as tabelas
      Procedure  LimpaCamposTabela;
      // Seta valor do campo em FRegCamposTab
      Function SetValorCampo ( WITab : Integer ; WIVinc : Integer ) : Boolean;
      // Seta campo convertendo valores
      Function SetValorCampoConver ( WITab : Integer ; WIVinc : Integer ) : Boolean;
      // Seta Campo FK
      Function SetValorFK ( WITab : Integer ; WIVinc : Integer ) : Boolean;

      // Grava RegArquivo nas Tabelas do Sistema
      Function GravaTabela ( SQL : String ; Tabela : String ) : Boolean;
      // Monta Campos que usuário informou que devem sair no relatório
      Function  GetCabecErro : String;
      //Monta SQL do Insert
      Function MontaSQL ( Tabela : String ) : String;
      // Busca próxima Chave
      Function GetNextKey : Integer;
      // Limpa campos vinculados - FRegVincCampo
      Procedure LimpaCampoVinculado;
      // Busca e Seta valor dos campos Chave
      Procedure GetValorChave ( Ind : Integer );

    Public
      //-- Indicadores de Erros ou Avisos
      FErro        : Boolean;
      FAviso       : Boolean;
      //-- Armazena os Erros decorrentes da crítica
      FMensagem    : String;
      FCritica     : String; // Retorna o arquivo de critica

      //-- Armazena os Erros decorrentes da crítica
      FNumRegsImpot: Variant;

      //-- Create e Destroy da Classe
      Constructor Create (AOWner : TComponent);
      Destructor Destroy; override;

      Procedure ImportaArquivo ( LayoutArquivo : Integer;  NomeDiretorio : String ; NomeArquivo : String );
End;

implementation

uses uValidaValorCampo, DBaseDados;

//--------------------------------------------------------
//-- Cronstructor Classe TImporta
//--------------------------------------------------------
Constructor TImporta.Create (AOwner : TComponent);
Begin
     Inherited Create;
     //Criação de Tipos
     Fqry           := TQuery.Create(AOwner);
     FRegLayout     := TRegLayout.Create;
     FRegVincCampo  := TRegVincCampo.Create;
     FRegCamposTab  := TRegCamposTab.Create;
     FOrdemImport   := TStringList.Create;
     WMensagem      := TMensagem.Create;

     //Inicialização de Propriedades
     FAOwner        := AOwner;
     FErro          := False;
     FAviso         := False;
     FMensagem      := '';
     FCritica       := '';

     //Inicializa Chave de Gravação
     FChave  := 0;
     FOcorr  := 0;

     //Seta FNumRegs = Null - Importação de Todo o arquivo
     FNumRegsImpot := Null;
     
     //Define saida padrão da critica como Arquivo
     WMensagem.SetTipoSaida(Arquivo);
End;

//--------------------------------------------------------
//-- Destroy da Classe TImporta
//--------------------------------------------------------
Destructor TImporta.Destroy;
Begin
     //Libera Tipos Criados
     Fqry.Free;
     FRegLayout.Free;
     FRegVincCampo.Free;
     FRegCamposTab.Free;
     FOrdemImport.Free;
     WMensagem.Free;
     Inherited Destroy;
End;

//---------------------------------------------------------------
//-- Rotina que Importa dados do arquivo
//---------------------------------------------------------------
Procedure TImporta.ImportaArquivo ( LayoutArquivo : Integer;  NomeDiretorio : String ; NomeArquivo : String );
Begin
  //Carrega FOrdemImport-TStringList com a ordem de importação das tabelas
  GetOrdemImportacao;

  //Carrega FRegCamposTab-Reg com os campos das tabelas disponíveis
  GetCamposTabelas;

  //Carrega FRegLayout-Reg para Leitura do Arquivo
  GetLayout ( LayoutArquivo );

  //Carrega vinculação de campos do Layout
  GetVincCampo ( LayoutArquivo );

  // Verifica disponibilidade do Arquivo Texto
  If GetArquivoTexto ( NomeDiretorio, NomeArquivo , FArqTexto ) Then
     // Importa Arquivo
     ImportaArqTexto ( FArqTexto )
  Else
     WMensagem.SetMsgErro('Não foi possível abrir o arquivo especificado;');

  // Verifica a ocorrência de Erros
  FErro     := WMensagem.FErro;
  FAviso    := WMensagem.FAviso;
  FMensagem := WMensagem.FMensagem;
  FCritica  := WMensagem.FCritica;
End;

//---------------------------------------------------------------
//-- Seta ordem de importação das Tabelas do Sistema
//---------------------------------------------------------------
Procedure TImporta.GetOrdemImportacao;
Begin
  //-- Lê ordem de importação
  Fqry.DataBaseName := 'BaseDados';
  Fqry.SQL.Clear;
  Fqry.SQL.Add ('SELECT NO_TABELA FROM FI_TABELA');
  Fqry.SQL.Add ('WHERE SQ_ATUALIZACAO IS NOT NULL');
  Fqry.SQL.Add ('ORDER BY SQ_ATUALIZACAO');
  Fqry.Open;
  if Fqry.eof Then
     Begin
       Fqry.Close;
       Raise Exception.Create ('Não foi estabelecida ordem de importação para as tabelas do Sistema');
     End
  Else
     Begin
       While not Fqry.EOF Do
         Begin
           FOrdemImport.Add ( Fqry.FieldByName('NO_TABELA').AsString );
           Fqry.Next
         End;
       FOrdemImport.Add ('');
       Fqry.Close;
     End;
End;
//---------------------------------------------------------------
//-- Lê Campos das tabelas dos Sist. para montagem do Insert
//---------------------------------------------------------------
procedure TImporta.GetCamposTabelas;
Var WI : Integer;
Begin
  //-- Lê campos das Tabelas
  Fqry.DataBaseName := 'BaseDados';
  Fqry.SQL.Clear;
  Fqry.SQL.Add ('SELECT DISTINCT A.NO_TABELA, A.NO_ATRIBUTO_TABELA,');
  Fqry.SQL.Add ('DECODE(B.NO_ATRIBUTO_TABELA,NULL,' + #39 + 'N' + #39 + ',' + #39 + 'S' + #39 + ') IR_E_CHAVE,');
  Fqry.SQL.Add ('DECODE(C.NO_ATRIBUTO_TABELA,NULL,' + #39 + 'N' + #39 + ',' + #39 + 'S' + #39 + ') IR_E_FK,');
  Fqry.SQL.Add ('A.TP_ATRIBUTO');
  Fqry.SQL.Add ('FROM FI_ATRIBUTO_TABELA A, FI_PK_TABELA B, FI_FK_TABELA C');
  Fqry.SQL.Add ('WHERE A.NO_TABELA = B.NO_TABELA (+)');
  Fqry.SQL.Add ('AND A.NO_ATRIBUTO_TABELA = B.NO_ATRIBUTO_TABELA (+)');
  Fqry.SQL.Add ('AND A.NO_TABELA = C.NO_TABELA (+)');
  Fqry.SQL.Add ('AND A.NO_ATRIBUTO_TABELA = C.NO_ATRIBUTO_TABELA (+)');
  Fqry.SQL.Add ('AND A.NO_TABELA IN');
  Fqry.SQL.Add ('   ( SELECT DISTINCT D.NO_TABELA FROM FI_ATRIBUTO_TABELA D');
  Fqry.SQL.Add ('      WHERE D.CD_GRUPO IS NOT NULL )');
  Fqry.SQL.Add ('ORDER BY 1,2');
  Fqry.Open;
  if Fqry.eof Then
     Begin
       Fqry.Close;
       Raise Exception.Create ('Não foram encontradas as definições das tabelas. Problema de instalação do Software;');
     End
 Else
     Begin
       FTamCamposTab := Fqry.RecordCount;
       //-- Carrega array de vinculacao padrão
       WI := 1;
       While not Fqry.Eof do
         Begin
           FRegCamposTab.NO_TABELA[WI]          := Fqry.FieldByName('NO_TABELA').AsString;
           FRegCamposTab.NO_ATRIBUTO_TABELA[WI] := Fqry.FieldByName('NO_ATRIBUTO_TABELA').AsString;
           FRegCamposTab.IR_E_CHAVE[WI]         := Fqry.FieldByName('IR_E_CHAVE').AsString;
           FRegCamposTab.IR_E_FK[WI]            := Fqry.FieldByName('IR_E_FK').AsString;
           FRegCamposTab.TP_ATRIBUTO[WI]        := Fqry.FieldByName('TP_ATRIBUTO').AsString;
           FRegCamposTab.VL_CAMPO[WI]           := Null;
           Fqry.Next;
           WI := WI + 1;
         End;
       Fqry.Close;
    End;
End;

//---------------------------------------------------------------
//-- Rotina que Carrega Lay-out de arquivo para validação
//---------------------------------------------------------------
Procedure TImporta.GetLayout ( Layout : Integer );
Var WI : Integer;
Begin
  //-- Seta Banco
  Fqry.DataBaseName := 'BaseDados';

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
       F_TP_ARQUIVO            := Fqry.FieldByName('TP_ARQUIVO').AsString;
       F_TP_DELIMITADOR_CAMPO  := Fqry.FieldByName('TP_DELIMITADOR_CAMPO').Value;
       F_DS_OUTRO_DELIMITADOR  := Fqry.FieldByName('DS_OUTRO_DELIMITADOR').Value;
       F_TP_QUALIFICADOR_TEXTO := Fqry.FieldByName('TP_QUALIFICADOR_TEXTO').Value;

       //Trara Tipo de Delimitador
       If F_TP_DELIMITADOR_CAMPO <> Null Then
          Begin
            if F_TP_DELIMITADOR_CAMPO  = 'V' Then
               F_TP_DELIMITADOR_CAMPO := ','
            Else
            if F_TP_DELIMITADOR_CAMPO  = 'P' Then
               F_TP_DELIMITADOR_CAMPO := ';'
            Else
            if F_TP_DELIMITADOR_CAMPO  = 'E' Then
               F_TP_DELIMITADOR_CAMPO := ' '
            Else
            if F_TP_DELIMITADOR_CAMPO  = 'T' Then
               F_TP_DELIMITADOR_CAMPO := ^T
            Else
            if F_TP_DELIMITADOR_CAMPO  = 'O' Then
               F_TP_DELIMITADOR_CAMPO := F_DS_OUTRO_DELIMITADOR
            Else
               Raise Exception.Create ('Tipo de delimitador definido inválido');
          End;

       //Trara Tipo de Qualificador
       if F_TP_QUALIFICADOR_TEXTO  <> Null Then
          Begin
            if F_TP_QUALIFICADOR_TEXTO  = 'A' Then
               F_TP_QUALIFICADOR_TEXTO := '"'
            Else
            if F_TP_QUALIFICADOR_TEXTO  = 'P' Then
               F_TP_QUALIFICADOR_TEXTO := #39
            Else
            if F_TP_QUALIFICADOR_TEXTO  <> 'N' Then
               Raise Exception.Create ('Tipo de qualificador de texto inválido');
          End;
     End;
  Fqry.Close;

  //-- Lê Estrutura do Layout
  Fqry.SQL.Clear;
  Fqry.SQL.Add ('SELECT CD_ARQUIVO,SQ_CAMPO,NO_CAMPO_ARQUIVO,NR_TAM_CAMPO,');
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
       FTamLayout    := Fqry.RecordCount;
       //Carrega Layout
       WI := 1;
       While not Fqry.Eof do
         Begin
           FRegLayout.CD_ARQUIVO[WI]              := Fqry.FieldByName('CD_ARQUIVO').AsInteger;
           FRegLayout.SQ_CAMPO[WI]                := Fqry.FieldByName('SQ_CAMPO').AsInteger;
           FRegLayout.NO_CAMPO_ARQUIVO[WI]        := Fqry.FieldByName('NO_CAMPO_ARQUIVO').AsString;
           FRegLayout.NR_TAM_CAMPO[WI]            := Fqry.FieldByName('NR_TAM_CAMPO').Value;
           FRegLayout.TP_ATRIBUTO[WI]             := Fqry.FieldByName('TP_ATRIBUTO').AsString;
           FRegLayout.DS_SIMBOLO_DECIMAL[WI]      := Fqry.FieldByName('DS_SIMBOLO_DECIMAL').Value;
           FRegLayout.NR_DECIMAL[WI]              := Fqry.FieldByName('NR_DECIMAL').Value;
           FRegLayout.DS_SIMBOLO_AGRUPADOR[WI]    := Fqry.FieldByName('DS_SIMBOLO_AGRUPADOR').Value;
           FRegLayout.DS_MASCARA_DATA[WI]         := Fqry.FieldByName('DS_MASCARA_DATA').Value;
           FRegLayout.CD_ARQUIVO_MASTER[WI]       := Fqry.FieldByName('CD_ARQUIVO_MASTER').Value;
           FRegLayout.SQ_CAMPO_MASTER[WI]         := Fqry.FieldByName('SQ_CAMPO_MASTER').Value;
           FRegLayout.IR_RELATORIO_OCORRENCIA[WI] := Fqry.FieldByName('IR_RELATORIO_OCORRENCIA').AsString;
           FRegLayout.SE_GRUPO_OCORRENCIA[WI]     := Null;
           Fqry.Next;
           WI := WI + 1;
         End;
       Fqry.Close;
     End;

     SetGrupoOcorrencia
End;

//---------------------------------------------------------------
//-- Rotina que Seta quais tipos são grupos de Ocorrências
//---------------------------------------------------------------
procedure TImporta.SetGrupoOcorrencia;
Var WI1 : Integer;
    WI2 : Integer;
Begin

  For WI1 := 1 to FTamLayout Do
    For WI2 := 1 to FTamLayout Do
      If  (FRegLayout.CD_ARQUIVO[WI1] = FRegLayout.CD_ARQUIVO_MASTER[WI2])
      and (FRegLayout.SQ_CAMPO[WI1]   = FRegLayout.SQ_CAMPO_MASTER[WI2]) Then
           FRegLayout.SE_GRUPO_OCORRENCIA[WI1] := 'S';

End;


//---------------------------------------------------------------
//-- Carrega vinculação de Campos do Layout
//---------------------------------------------------------------
procedure TImporta.GetVincCampo ( Layout : Integer );
Var WI : Integer;
Begin
  //-- Lê vinculação de Campos
  Fqry.DataBaseName := 'BaseDados';
  Fqry.SQL.Clear;
  Fqry.SQL.Add ('SELECT A.NO_TABELA,A.NO_ATRIBUTO_TABELA,A.CD_ARQUIVO,A.SQ_CAMPO,');
  Fqry.SQL.Add ('B.VL_ARQUIVO,B.VL_ATRIBUIDO');
  Fqry.SQL.Add ('FROM FI_LAYOUT_ARQUIVO_TABELA A, FI_LAYOUT_ARQUIVO_TABELA_VALOR B');
  Fqry.SQL.Add ('WHERE A.NO_TABELA = B.NO_TABELA (+)');
  Fqry.SQL.Add ('  AND A.NO_ATRIBUTO_TABELA = B.NO_ATRIBUTO_TABELA (+)');
  Fqry.SQL.Add ('  AND A.CD_ARQUIVO = B.CD_ARQUIVO (+)');
  Fqry.SQL.Add ('  AND A.SQ_CAMPO = B.SQ_CAMPO (+)');
  Fqry.SQL.Add ('  AND A.CD_ARQUIVO = ' + inttostr( Layout));
  Fqry.Open;
  if Fqry.eof Then
     Begin
       Fqry.Close;
       Raise Exception.Create ('Não foi estabelecida nehuma vinculação entre os campos do Layout e os campos do sistema;');
     End
  Else
     Begin
       FTamVincCampo := Fqry.RecordCount;
       //--Carrega array de vinculação de campos
       WI := 1;
       While not Fqry.Eof do
         Begin
           FRegVincCampo.CD_ARQUIVO[WI]         := Fqry.FieldByName('CD_ARQUIVO').AsInteger;
           FRegVincCampo.SQ_CAMPO[WI]           := Fqry.FieldByName('SQ_CAMPO').AsInteger;
           FRegVincCampo.NO_TABELA[WI]          := Fqry.FieldByName('NO_TABELA').AsString;
           FRegVincCampo.NO_ATRIBUTO_TABELA[WI] := Fqry.FieldByName('NO_ATRIBUTO_TABELA').AsString;
           FRegVincCampo.NR_OCORRENCIA[WI]      := 0;
           FRegVincCampo.VL_CAMPO[WI]           := Null;
           FRegVincCampo.VL_ARQUIVO_CONV[WI]    := Fqry.FieldByName('VL_ARQUIVO').Value;
           FRegVincCampo.VL_ATRIBUIDO[WI]       := Fqry.FieldByName('VL_ATRIBUIDO').Value;
           FRegVincCampo.SE_GRAVADO[WI]         := False;
           Fqry.Next;
           WI := WI + 1;
         End;
       Fqry.Close;
     End;
End;

//---------------------------------------------------------------
//-- Tenta Abrir arquivo e inicializa w_tot_linhas
//---------------------------------------------------------------
Function TImporta.GetArquivoTexto ( NomeDiretorio : String ; NomeArquivo : String ; const ArqTexto : TextFile ) : Boolean;
Var W_ExtArq  : String;
    W_Arquivo : String;
Begin

  W_ExtArq  := uppercase(ExtractFileExt(NomeArquivo));
  if NomeDiretorio[length(Trim(NomeDiretorio))] = '\' then
    W_Arquivo := Trim(NomeDiretorio) + Trim(NomeArquivo)
  else
    W_Arquivo := Trim(NomeDiretorio) + '\' + Trim(NomeArquivo);

  if  W_ExtArq = '.TXT' then
      Begin
        AssignFile (ArqTexto, W_Arquivo);
        FTotLinhas := Linhastxt(ArqTexto); // FuncGerais - Conta Linhas do arquivo
        Reset(ArqTexto); // Abre arquivo para leitura
        Result := True;
      End
  Else
      Result := False;
End;
//---------------------------------------------------------------
//---------------------------------------------------------------
//-- Efetua Importação
//---------------------------------------------------------------
//---------------------------------------------------------------
Procedure TImporta.ImportaArqTexto ( const ArqTexto : TextFile );
Begin
  //Seta número de linhas a serem importadas
  If FNumRegsImpot = Null Then
     FNumRegsImpot := FTotLinhas
  Else
     FTotLinhas := FNumRegsImpot;

  //Inicia Importação
  IniciaAnimacao;
  FLinhaAtual := 0;

  while (not EOF(ArqTexto))
    AND (FLinhaAtual <= FNumRegsImpot) Do
    Begin

      FRegArquivo := TRegArquivo.Create; //Cria Reg Arquivo



      if frmAnimacao.Cancel Then
         Begin
          TerminaAnimacao;
           WMensagem.SetMsgAviso('Processamento cancelado por intervenção do usuário');
           Exit;
         End;

      //Lê Arquivo Texto e Incrementa Animação
      readln( ArqTexto, FLinhaArquivo ); // Lê Arquivo
      FLinhaOriginal := FLinhaArquivo;   // Salva a linha lida para eventual mensagem de erro
      FLinhaAtual    := FLinhaAtual + 1;
      frmAnimacao.SetProgressBar(FLinhaAtual);

      if SeLinhaArquivoOk ( FLinhaArquivo ) Then
         Begin
           MontaRegArquivo;            // Monta Registro lido do Arquivo

           If FormataCampoArquivo Then // Formatou campos sem Erro
              GravaTabelaSistema;      // Grava as tabelas dos Sistema
         End;

      FRegArquivo.Free;           // Destroi RegArquivo

    end;

  TerminaAnimacao;

end;


//---------------------------------------------------------------
//-- Instancia frmAnimacao de Importação
//---------------------------------------------------------------
procedure TImporta.IniciaAnimacao;
Begin
  //-- Cria Form de Animação
  Application.CreateForm(TfrmAnimacao, frmAnimacao);
  frmAnimacao.SetAnimacao('Importando dados...',FTotLinhas,True,True,aviCopyFiles);
End;

//---------------------------------------------------------------
//-- Destroy frmAnimação
//---------------------------------------------------------------
procedure TImporta.TerminaAnimacao;
Begin
  frmAnimacao.Close;
  frmAnimacao.Free;
End;

//---------------------------------------------------------------
//-- Instancia frmAnimacao de Importação
//---------------------------------------------------------------
Function TImporta.SeLinhaArquivoOk ( Linha : String ) : Boolean;
Begin

  Result := False;

  If F_TP_ARQUIVO = 'F' Then
     Begin
       Result := True;
       Exit;
     End;

  If Pos(F_TP_DELIMITADOR_CAMPO,FLinhaArquivo) <= 0 Then
     Begin
       WMensagem.SetMsgErro('Delimitador [' + F_TP_DELIMITADOR_CAMPO + '] não encontrado: ' + Linha);
       Exit;
     End;

  //Verifica Qualificador de Texto
  If F_TP_QUALIFICADOR_TEXTO <> 'N' Then
     Begin
       If Pos(F_TP_QUALIFICADOR_TEXTO,FLinhaArquivo) <= 0 Then
          Begin
            WMensagem.SetMsgErro('Qualificador de Texto (' + F_TP_QUALIFICADOR_TEXTO + ') não encontrado: ' + Linha);
            Exit;
          End;
     End;

  Result := True;

End;

//---------------------------------------------------------------
//-- Monta Registro lidos do Arquivo
//---------------------------------------------------------------
Procedure TImporta.MontaRegArquivo;
Var WILay      : Integer; //Indexador do Layout
    WIArq      : Integer; //Indexador do Arquivo

    WNumOcorr  : Integer; // Número de ocorrências do Grupo
    WNumCampos : Integer; // Numero de Campos dentro do Grupo de ocorrências
    WTamOcorr  : Integer; // Soma dos tamnahos dos campos do Grupo de ocôrrências

    WContOcorr : Integer; // Conta o número da ocorrência que está sendo lida
    WContCamposOcorr : Integer; //Conta os campos de ocorrência já carregados

Begin
  // Dimensiona arquivo para receber campos da linha lida
  FTamArquivo := FTamLayout;

  // Inicializa campos do RegArquivo
  For WIArq := 1 to FTamArquivo Do
      FRegArquivo.VL_CAMPO[WIArq] := Null;

  // Inicializa variáveis indexadoras de FRegLayout e FRegArquivo
  WILay := 1;
  WIArq := 1;

  //Inicializa contadores
  WContOcorr := 0;       // Conta a ocorrência que esta sendo lida
  WContCamposOcorr := 0; // Conta o campo da ocorrência que esta sendo lido

  // Carrega Linha Lida
  While (WIArq <= FTamArquivo)
    AND (FLinhaArquivo <> '') Do
    Begin
      //Carrega Campo
      CarregaCampo ( WILay , WIArq , WContOcorr , WTamOcorr);

      //Verifica se Grupo de Ocorrência
      If FRegLayout.SE_GRUPO_OCORRENCIA[WILay] = 'S' Then
         Begin
           GetDadosGrupoOcorr (WILay,WIArq,WNumOcorr,WNumCampos,WTamOcorr);
           WContOcorr := 0; //O primeiro Grupo de Ocorr é zero - Sem deslocamento de posição inicial
           WContCamposOcorr := 0;
           // Recalcula o tamanho do arquivo em função do número de ocorrências
          FTamArquivo := FTamArquivo - WNumCampos + (WNumOcorr * WNumCampos);
         End
      Else
         Begin
           if FRegLayout.SQ_CAMPO_MASTER[WILay] <> Null Then
              Begin
                WContCamposOcorr := WContCamposOcorr + 1;
                If WContCamposOcorr = WNumCampos Then
                   Begin
                     WILay := WILay - WNumCampos;
                     WContCamposOcorr := 0;
                     //Incrementa um no contador de Grupo de Ocorrências
                     //pora deslocar as posição inicial do próximo grupo
                     WContOcorr := WContOcorr + 1;
                   End;
              End;
         End;
      // Incrementa Indexadores do Arquivo e Layout
      WIArq := WIArq + 1;
      WILay := WILay + 1;
    End;
End;

//---------------------------------------------------------------
//-- Carrega Campo da linha lida para FRegArquivo
//---------------------------------------------------------------
Procedure TImporta.CarregaCampo ( WILay : Integer ; WIArq : Integer ; WContOcorr : Integer ; WTamOcorr : Integer );
Var WTam : Integer;
    WPos : Integer;
Begin

  FRegArquivo.SQ_CAMPO[WIArq]         := FRegLayout.SQ_CAMPO[WILay];
  FRegArquivo.NO_CAMPO_ARQUIVO[WIArq] := FRegLayout.NO_CAMPO_ARQUIVO[WILay];
  FRegArquivo.NR_OCORRENCIA[WIArq]    := WContOcorr;

  //Seta Posição inicial como 1, pois as parcelas lidas vão sendo eliminadas da linha
  WPos := 1;

  //----------------------------------------------------------------------------
  //Dimensiona posições WPos e WTam para cópia do valor do campo
  //----------------------------------------------------------------------------
  If F_TP_ARQUIVO = 'F' Then                   // Arquivo de Tamanho Fixo
     WTam := FRegLayout.NR_TAM_CAMPO[WILay]
  ELSE
     If F_TP_QUALIFICADOR_TEXTO = 'N' Then     // Arquivo Delimitado sem Qualificador de Texto
        Begin
         //Calcula tamanho do segmento a ser lido
         if Pos(F_TP_DELIMITADOR_CAMPO, FLinhaArquivo) > 0 Then
            WTam := Pos(F_TP_DELIMITADOR_CAMPO, FLinhaArquivo) - 1
         Else
            WTam := Length(FLinhaArquivo);
         //Seta Valor do Tamanho Calculado
         FRegLayout.NR_TAM_CAMPO[WILay] := WTam;
       End
     Else                                      // Arquivo Delimitado com Qualificador de Texto
       Begin
         If Pos(F_TP_QUALIFICADOR_TEXTO, FLinhaArquivo) > 0 Then
            WPos := Pos(F_TP_QUALIFICADOR_TEXTO, FLinhaArquivo) + 1;

         For WTam := 1 to Length(FLinhaArquivo) Do
             If  (FLinhaArquivo[Wtam]   = F_TP_QUALIFICADOR_TEXTO)
             AND (FLinhaArquivo[Wtam+1] = F_TP_DELIMITADOR_CAMPO) Then
                 Break;
         WTam := WTam - 2;
         //Seta Valor do Tamanho Calculado
         FRegLayout.NR_TAM_CAMPO[WILay] := WTam;
       End;


  //----------------------------------------------------------------------------
  //Atribui Valor do Campo
  //----------------------------------------------------------------------------
  If WPos > Length(FLinhaArquivo) Then
     FRegArquivo.VL_CAMPO[WIArq]      := Null // Ex: Não há dependentes
  Else
     If WTam > 0 Then
        FRegArquivo.VL_CAMPO[WIArq]   := Copy(FLinhaArquivo,WPos,WTam)
     Else
        FRegArquivo.VL_CAMPO[WIArq]   := Null;

  //----------------------------------------------------------------------------
  //Redimensiona Posição inicial e tamanho de acordo com o tipo de arquivo para
  //corte da linha
  //----------------------------------------------------------------------------
  If F_TP_ARQUIVO = 'F' Then               // Arquivo de Tamanho Fixo
     WPos := WTam + 1
  Else
     If F_TP_QUALIFICADOR_TEXTO = 'N' Then // Arquivo Delimitado sem Qualificador de Texto
        Begin
          WPos := WTam + 2;
          WTam := WTam + 1;
        End
     Else
        Begin                             // Arquivo Delimitado com Qualificador de Texto
          WPos := WTam + 4;
          WTam := WTam + 3;
        End;
    
  //----------------------------------------------------------------------------
  //Redimensiona a Linha, excluindo o segmento lido
  //----------------------------------------------------------------------------
  if WTam = Length(FLinhaArquivo) Then
     FLinhaArquivo := ''
  Else
     FLinhaArquivo := Copy(FLinhaArquivo,WPos,Length(FLinhaArquivo)-WTam);

End;

//-----------------------------------------------------------------------
//-- Seta dados do grupo de Ocorrência
//-- WNumOcorr  - Número de Ocorrências do Grupo
//-- WNumCampos - Número de Campos existentes no Grupo de Ocorrência
//-- WTamGrupo  - Tamanho do Grupo de Ocorrência. Soma dos tamanhos de todos os campos do Grupo
//------------------------------------------------------------------------
Procedure TImporta.GetDadosGrupoOcorr ( WILay : Integer; WIArq : Integer; Var WNumOcorr : Integer; Var WNumCampos : Integer; Var WTamOcorr : Integer );
Var WI : Integer;
Begin
  // Inicializa variável Local
  WI := 1;
  //Inicializa variáveis passadas por Referência
  WNumOcorr  := 0;
  WNumCampos := 0;
  WTamOcorr  := 0;
  //-----------------------------------------------
  //Seta Numero de Ocorrências do Grupo - WNumOcorr
  //-----------------------------------------------
  Try
    WNumOcorr := strtoint(FRegArquivo.VL_CAMPO[WIArq])
  Except
    WMensagem.SetMsgErro('Erro na conversão do número de ocorrências: ' + FLinhaOriginal);
    Exit;
  End;
  //-----------------------------------------------
  //Seta WNumCampos e Se Arq. Fixo WTamGrupo
  //-----------------------------------------------
  While WI <= FTamLayout Do
    Begin
      if FRegLayout.SQ_CAMPO_MASTER[WI] = FRegLayout.SQ_CAMPO[WILay] Then
         Begin
           WNumCampos := WNumCampos + 1;
           if F_TP_ARQUIVO = 'F' Then
              WTamOcorr  := WTamOcorr + FRegLayout.NR_TAM_CAMPO[WI];
         End;
      WI := WI + 1;
    End;
End;

//-----------------------------------------------------------------------
//-- Formata campos do Arquivo
//-----------------------------------------------------------------------
Function TImporta.FormataCampoArquivo : Boolean;
Var WILay : Integer;
    WIArq : Integer;
Begin
    //-- Seta Resultado
    Result := True;

    // Formata Campos do Registro, Fazendo algumas conversões
    For WILay := 1 to FTamLayout Do
        For WIArq := 1 to FTamArquivo Do
            If  (FReglayout.SQ_CAMPO[WILay] = FRegArquivo.SQ_CAMPO[WIArq])
            AND (FRegArquivo.VL_CAMPO[WIArq] <> Null) Then
                If NOT FormataCampo ( WILay , WIArq ) Then
                   Result := False;
End;

//-----------------------------------------------------------------------
//-- Formata Campo específico do Arquivo
//-----------------------------------------------------------------------
Function TImporta.FormataCampo ( WILay : Integer ; WIArq : Integer ) : Boolean;
Var wValidaCampo   : TValidaValorCampo;
    wDataFormatada : String;
Begin
  //--Seta retorno da Função
  Result := True;

  //--Trata Separadores de Inteiros
  if FRegLayout.DS_SIMBOLO_AGRUPADOR[WILay] <> Null Then
     FRegArquivo.VL_CAMPO[WIArq] :=
     EliminaCaracter ( FRegArquivo.VL_CAMPO[WIArq] , FRegLayout.DS_SIMBOLO_AGRUPADOR[WILay] );

  //--Trata Símbolo Decimal
  if  (FRegLayout.DS_SIMBOLO_DECIMAL[WILay] <> Null)
  AND (FRegLayout.DS_SIMBOLO_DECIMAL[WILay] <>  ',') Then
       FRegArquivo.VL_CAMPO[WIArq] :=
       TrocaSeparadorDecimal ( FRegArquivo.VL_CAMPO[WIArq] , FRegLayout.DS_SIMBOLO_DECIMAL[WILay] , ',');

  //--Trata Separadores de Decimais e Num casas Decimais
  if  (FRegLayout.NR_DECIMAL[WILay] <> Null)
  AND (FRegLayout.NR_DECIMAL[WILay]  >    0)
{Para setar as casas decimais somente se o Valor não possuir Separador}
  AND ((pos('.', FRegArquivo.VL_CAMPO[WIArq]) <= 0) and
       (pos(',', FRegArquivo.VL_CAMPO[WIArq]) <= 0)) Then
      FRegArquivo.VL_CAMPO[WIArq] :=
      SetCasasDecimais ( FRegArquivo.VL_CAMPO[WIArq] , FRegLayout.NR_DECIMAL[WILay] );

  //--Trata Máscaras de Datas
  if FRegLayout.DS_MASCARA_DATA[WILay] <> Null Then
     Begin
       wDataFormatada := Formata_Data(FRegArquivo.VL_CAMPO[WIArq],FRegLayout.DS_MASCARA_DATA[WILay]);
       If wDataFormatada <> '' Then
          FRegArquivo.VL_CAMPO[WIArq] := wDataFormatada
  else
          FRegArquivo.VL_CAMPO[WIArq] := 'NULL';
     End;

  //-- Valida campo Formatado
  wValidaCampo := TValidaValorCampo.Create;
  wValidaCampo.Valor_Definido_Valido(FRegLayout.TP_ATRIBUTO[WILay],FRegLayout.NR_TAM_CAMPO[WILay],FRegArquivo.VL_CAMPO[WIArq]);
  If wValidaCampo.FErro Then
     Begin
       WMensagem.SetMsgErro ('Linha: ' + FLinhaOriginal);
       WMensagem.SetMsgErro ('Campo "' + FRegLayout.NO_CAMPO_ARQUIVO[WILay] + '" com conteúdo inválido: ' + FRegArquivo.VL_CAMPO[WIArq]);
       Result := False;
     End;
  wValidaCampo.Free;

End;

//-----------------------------------------------------------------------
//-- Elimina Caracteres indesejáveis da String
//-----------------------------------------------------------------------
Function TImporta.EliminaCaracter ( Campo : String ; Caracter : String ) : String;
Var WCampo    : String;
begin
   WCampo := Campo;
   While Pos( Caracter, WCampo ) > 0 Do
     If Pos(Caracter,WCampo) = Length(WCampo) Then
        Wcampo := Copy(WCampo,1,Pos(Caracter,WCampo)-1)
     Else
        WCampo := Copy(WCampo,1,Pos(Caracter,WCampo)-1) +
                  Copy(WCampo,Pos(Caracter,WCampo)+1,Length(WCampo)-Pos(Caracter,WCampo));
   Result := WCampo;
End;

//-----------------------------------------------------------------------
//-- Troca separador decimal por vírgula
//-----------------------------------------------------------------------
Function TImporta.TrocaSeparadorDecimal ( Campo : String ; OldCaracter : String ; NewCaracter : Char ) : String;
Var WCampo  : String;
begin
   WCampo := Campo;
   While Pos( OldCaracter, WCampo ) > 0 Do
     WCampo[Pos( OldCaracter, WCampo )] := NewCaracter;
   Result := WCampo;
End;

//-----------------------------------------------------------------------
//-- Seta Número de casas Decimais do campo
//-----------------------------------------------------------------------
Function TImporta.SetCasasDecimais ( Campo : String ; Numero : Integer ) : String;
begin
   Result := Copy(Campo,1,Length(Campo)-Numero) +
             ',' +
             Copy(Campo,Length(Campo)-Numero+1,Length(Campo));
End;

//---------------------------------------------------------------
//---------------------------------------------------------------
//-- Grava TABELAS para o registro Lido
//---------------------------------------------------------------
//---------------------------------------------------------------
Procedure TImporta.GravaTabelaSistema;
Var WI      : Integer;
    WErro   : Boolean;
Begin

  // Busca valor da Chave
  If FChave = 0 Then
     FChave := GetNextKey
  Else
     FChave := FChave + 1;

  // Limpa campos vinculados - FRegVincCampo
  LimpaCampoVinculado;

  // Limpa indicador de ocorrência a ser Gravada
  FOcorr := 0;
  // Atualiza Tabelas
  WI := 0;
  WErro := False;
  // Enquanto houver tabelas - Processa gravação
  While (FOrdemImport[WI] <> '')
    AND (not WErro) Do
    Begin
      //Enquanto FRegArquivo tiver valores para a tabela
      While SetValorCamposTabela ( FOrdemImport[WI] ) Do
        Begin
          If GravaTabela ( MontaSQL(FOrdemImport[WI]) , FOrdemImport[WI] ) Then
        End;
     //Incrementa contador de Tabelas
     WI := WI + 1;
    End;
End;

//---------------------------------------------------------------
//-- Busca Próxima Chave
//---------------------------------------------------------------
Function TImporta.GetNextKey : Integer;
Begin
     Fqry.DataBaseName := 'BaseDados';
     Fqry.SQL.Clear;
     Fqry.SQL.Add('SELECT MAX(CD_PARTIC) CODIGO FROM FI_PARTICIPANTE');
     Fqry.SQL.Add('WHERE CD_VERSAO = ' + inttostr(WG_CD_VERSAO));
     Fqry.Open;
     Result := Fqry.FieldByName('CODIGO').AsInteger + 1;
     Fqry.Close;
End;

//---------------------------------------------------------------
//-- Limpa campos Vinculados - FRegVincCampo
//---------------------------------------------------------------
Procedure TImporta.LimpaCampoVinculado;
Var WI : Integer;
Begin

  For WI := 1 to FTamVincCampo Do
      Begin
        FRegVincCampo.SE_GRAVADO[WI] := False;
        FRegVincCampo.VL_CAMPO[WI]   := Null;
      End;

End;

//---------------------------------------------------------------
//-- Esta rotina verifica a possibilidade de atualizar os campos
//-- da tabela selecionada com os valores disponíveis em FRegVincCampo
//-- Se não for possível setar nenhum valor é porque todos os valores
//-- de FRegVincCampo já foram gravados ou não existe nenhum valor
//-- disponível.
//-- Os valores de FRegVincCampo são sempre atualizados no início, a fim
//-- de que possam ser tratados os possíveis níveis de ocorrência existentes
//---------------------------------------------------------------
Function TImporta.SetValorCamposTabela ( Tabela : String ) : Boolean;
Var WITab      : Integer;
    WIVinc     : Integer;
Begin
  // Inicializa Campos Vinculados em FRegVincCampo a partir do registro
  // lido, carregando os campos ainda não carregados (Ocorrência)
  SetValorCampoVinc;

  // Inicia Rotina
  Result := False;
  WITab  := 1;
  LimpaCamposTabela;
  While WITab <= FTamCamposTab Do
    Begin
      If FRegCamposTab.NO_TABELA[WITab] = Tabela Then
        Begin
          WIVinc := 1;
          While WIVinc <= FTamVincCampo Do
            Begin
              If  (FRegCamposTab.NO_TABELA[WITab] = FRegVincCampo.NO_TABELA[WIVinc])
              AND (FRegCamposTab.NO_ATRIBUTO_TABELA[WITab] = FRegVincCampo.NO_ATRIBUTO_TABELA[WIVinc])
              AND (FRegCamposTab.VL_CAMPO[WITab] = Null)
              AND (FRegVincCampo.VL_CAMPO[WIVinc] <> Null)
              AND (not FRegVincCampo.SE_GRAVADO[WIVinc]) Then
                  Begin
                    If SetValorCampo ( WITab , WIVinc ) Then
                       Result := True;
                  End;
              WIVinc := WIVinc + 1;
            End;
        End;
      WITab := WITab + 1;
    End;
End;

//---------------------------------------------------------------
//-- Carrega Valores do FRegArquivo para FRegCampoVinc
//---------------------------------------------------------------
Procedure TImporta.SetValorCampoVinc;
Var WIArq  : Integer;
    WIVinc : Integer;
Begin

  For WIArq := 1 to FTamArquivo Do
      For WIVinc := 1 to FTamVincCampo Do
          If  (FRegArquivo.SQ_CAMPO[WIArq] = FRegVincCampo.SQ_CAMPO[WIVinc])
          AND (FRegArquivo.VL_CAMPO[WIArq] <> Null) Then
             Begin
               If FRegArquivo.NR_OCORRENCIA[WIArq] = 0 Then
                  Begin
                    If NOT FRegVincCampo.SE_GRAVADO[WIVinc] Then
                       Begin
                         FRegVincCampo.NR_OCORRENCIA[WIVinc] := FRegArquivo.NR_OCORRENCIA[WIArq];
                         FRegVincCampo.VL_CAMPO[WIVinc]      := FRegArquivo.VL_CAMPO[WIArq];
                         FRegVincCampo.SE_GRAVADO[WIVinc]    := False;
                       End
                  End
               Else
                  Begin
                    If  (FRegVincCampo.SE_GRAVADO[WIVinc])
                    AND (FRegArquivo.NR_OCORRENCIA[WIArq] > FRegVincCampo.NR_OCORRENCIA[WIVinc]) Then
                       Begin
                         FRegVincCampo.NR_OCORRENCIA[WIVinc] := FRegArquivo.NR_OCORRENCIA[WIArq];
                         FRegVincCampo.VL_CAMPO[WIVinc]      := FRegArquivo.VL_CAMPO[WIArq];
                         FRegVincCampo.SE_GRAVADO[WIVinc]    := False;
                       End;
                  End;
             End;

End;

//---------------------------------------------------------------
//-- Limpa os Valores anteriormente atribuídos aos campos da Tabela
//---------------------------------------------------------------
Procedure TImporta.LimpaCamposTabela;
Var WI : Integer;
Begin
  For WI := 1 to FTamCamposTab Do
      FRegCamposTab.VL_CAMPO[WI] := Null;
End;

//---------------------------------------------------------------
//-- Grava Tabela Específica
//---------------------------------------------------------------
Function TImporta.GravaTabela ( SQL : String ; Tabela : String ) : Boolean;
Var WErro : String;
Begin
     Result := True;

     Fqry.DataBaseName := 'BaseDados';
     Fqry.SQL.Clear;
     Fqry.SQL.Add( SQL );

     Try
       dtmBaseDados.dbBaseDados.StartTransaction;
       Fqry.ExecSQL;
       dtmBaseDados.dbBaseDados.Commit;
     Except
       on E: Exception do
          Begin
            dtmBaseDados.dbBaseDados.RollBack;
            WMensagem.SetBlankLine(1);
            WErro := 'Campos Chave    : ' + GetCabecErro + #13#10;
            WErro := WErro + 'Mensagem do Banco      : ' + E.Message + #13#10;
            WErro := WErro + 'Na gravação da Tabela  : ' + Tabela + #13#10;
            WErro := WErro + 'Linha do arquivo       : ' + FLinhaOriginal + #13#10;
            WErro := WErro + 'Comando de inserção    : ' + SQL;
            WMensagem.SetMsgErro ( WErro );  // Mostra Mensagem de Erro
            Result := False;
         End;
     End;
End;

//---------------------------------------------------------------------
//-- Carrega Valores dos campos a partir do FRegArquivo e FRegVoncCampo
//---------------------------------------------------------------------
Function TImporta.SetValorCampo ( WITab : Integer ; WIVinc : Integer ) : Boolean;
Var WI     : Integer;
Begin

   Result := False;

   If FRegVincCampo.VL_ATRIBUIDO[WIVinc] = Null Then
      Begin
        If FRegVincCampo.VL_ARQUIVO_CONV[WIVinc] = Null Then
           Begin            // Atribuição Direta
             FRegCamposTab.VL_CAMPO[WITab] := FRegVincCampo.VL_CAMPO[WIVinc];
             Result := True;
           End
        Else
           Result := False; // Situação não permitida pelo atualizador de Lay-out
      End
   Else
      Begin
        //Se o compo estabelece conversão
        If SetValorCampoConver ( WITab , WIVinc ) Then
           Result := True;

        // Campo Lookup
        IF  (FRegcamposTab.IR_E_FK[WITab] = 'N')
        AND (not SetValorFK ( WITab , WIVinc ) ) Then
            Result := False
        Else
            //Campo Lookup FK ou com valores de FK setados
            Begin
              If FRegVincCampo.VL_ARQUIVO_CONV[WIVinc] = Null Then
                //Atribuição direta de valores
                Begin
                  FRegCamposTab.VL_CAMPO[WITab] := FRegVincCampo.VL_CAMPO[WIVinc];
                  Result := True;
                End
              Else
               //Se o compo estabelece conversão
                If SetValorCampoConver ( WITab , WIVinc ) Then
                   Result := True;
            End;
      End;

  //-- Se consegui atribuir, seta valores de conversão como gravados
  For WI := 1 to FTamVincCampo Do
      IF  (FRegVincCampo.SQ_CAMPO[WI]           = FRegVincCampo.SQ_CAMPO[WIVinc])
      AND (FRegVincCampo.NO_TABELA[WI]          = FRegVincCampo.NO_TABELA[WIVinc])
      AND (FRegVincCampo.NO_ATRIBUTO_TABELA[WI] = FRegVincCampo.NO_ATRIBUTO_TABELA[WIVinc])
      AND (FRegVincCampo.NR_OCORRENCIA[WI]      = FRegVincCampo.NR_OCORRENCIA[WIVinc]) Then
          Begin
            FRegVincCampo.SE_GRAVADO[WI] := True;
            FOcorr := FRegVincCampo.NR_OCORRENCIA[WI];
          End;

 End;

//---------------------------------------------------------------
//-- Seta Valores dos campos Fk
//---------------------------------------------------------------
Function TImporta.SetValorFK ( WITab : Integer ; WIVinc : Integer ) : Boolean;
Var WI : Integer;
Begin
  Result := False;
  For WI := 1 to FTamCamposTab Do
    Begin
      If  (FRegCamposTab.NO_TABELA[WI] = FRegCamposTab.NO_TABELA[WITab])
      AND (FRegCamposTab.IR_E_FK[WI] = 'S' ) Then
          If (FRegCamposTab.VL_CAMPO[WI] = Null) Then
             Begin
               FRegCamposTab.VL_CAMPO[WI] := FRegVincCampo.VL_ATRIBUIDO[WIVinc];
               Result := True;
             End
          Else
             Begin
               If FRegCamposTab.VL_CAMPO[WI] = FRegVincCampo.VL_ATRIBUIDO[WIVinc] Then
                  Result := True
               Else
                  Result := False;
             End;
    End;
End;

//---------------------------------------------------------------------
//-- Seta Campo com Conversão
//---------------------------------------------------------------------
Function TImporta.SetValorCampoConver ( WITab : Integer ; WIVinc : Integer ) : Boolean;
Var WI : Integer;
Begin
  Result := False;
  For WI := 1 to FTamVincCampo Do
      Begin
        IF  (FRegVincCampo.NO_TABELA[WI] = FRegVincCampo.NO_TABELA[WIVinc])
        AND (FRegVincCampo.NO_ATRIBUTO_TABELA[WI] = FRegVincCampo.NO_ATRIBUTO_TABELA[WIVinc]) Then
            Begin
              If  (FRegVincCampo.VL_ARQUIVO_CONV[WI] = FRegVincCampo.VL_CAMPO[WIVinc])
              AND (FRegVincCampo.VL_ATRIBUIDO[WI] <> Null ) Then
                  Begin
                    FRegCamposTab.VL_CAMPO[WITab] := FRegVincCampo.VL_ATRIBUIDO[WI];
                    Result := True;
                  End;

              If  (FRegVincCampo.VL_ARQUIVO_CONV[WI] = Null)
              AND (Result = False) Then
                  Begin
                    FRegCamposTab.VL_CAMPO[WITab] := FRegVincCampo.VL_ATRIBUIDO[WI];
                    Result := True;
                  End;
          End;
      End;
End;

//---------------------------------------------------------------
//-- Constroi Insert
//---------------------------------------------------------------
Function TImporta.MontaSQL ( Tabela : String ) : String;
Var SQLParte1 : String;
    SQLParte2 : String;
    WICamp    : Integer;
    matricula, sexo,
    tipo_beneficio, grau_dependencia,
    nascimento: String;
Begin

  SQLParte1 := '';
  SQLParte2 := '';
  tipo_beneficio := '';

  For WICamp := 1 to FTamCamposTab Do
    Begin
      If FRegCamposTab.NO_TABELA[WICamp] = Tabela Then
         Begin
           //Seta Insert Campos
           If SQLParte1 = '' Then
              SQLParte1 := FRegCamposTab.NO_ATRIBUTO_TABELA[WICamp]
           Else
              SQLParte1 := SQLParte1 + ',' + FRegCamposTab.NO_ATRIBUTO_TABELA[WICamp];

           //Trata atribuição de valores para as Chaves
           If (FRegCamposTab.IR_E_CHAVE[WICamp] = 'S')
           OR (FRegCamposTab.IR_E_FK[WICamp]    = 'S') Then
              GetValorChave ( WICamp );

           //Trata atribuição de valores para as FKs
           If FRegCamposTab.VL_CAMPO[WICamp] = Null Then
              Begin
                If SQLParte2 = '' Then
                   SQLParte2 := 'Null'
                Else
                   SQLParte2 := SQLParte2 + ',' + 'Null';
              End
           Else
              Begin
                {Armazena os campos de Beneficiários}
                if FRegCamposTab.NO_TABELA[WICamp] = 'FI_DEPENDENTE' then
                 begin
                   if FRegCamposTab.NO_ATRIBUTO_TABELA[WICamp] = 'NR_MATRICULA' then
                     matricula := FRegCamposTab.VL_CAMPO[WICamp]
                   Else if FRegCamposTab.NO_ATRIBUTO_TABELA[WICamp] = 'IR_SEXO' then
                     sexo := FRegCamposTab.VL_CAMPO[WICamp]
                   Else if FRegCamposTab.NO_ATRIBUTO_TABELA[WICamp] = 'DT_NASC' then
                     nascimento := FRegCamposTab.VL_CAMPO[WICamp]
                   Else if FRegCamposTab.NO_ATRIBUTO_TABELA[WICamp] = 'CD_GRAU_DEPENDENCIA' then
                     grau_dependencia := FRegCamposTab.VL_CAMPO[WICamp]
                   Else if FRegCamposTab.NO_ATRIBUTO_TABELA[WICamp] = 'CD_TIPO_BENEF' then
                     tipo_beneficio := FRegCamposTab.VL_CAMPO[WICamp];
                 end;



                 // Campos Alfa / Memo
                If (FRegCamposTab.TP_ATRIBUTO[WICamp] = 'A')
                OR (FRegCamposTab.TP_ATRIBUTO[WICamp] = 'M') Then
                   Begin
                     If SQLParte2 = '' Then
                        SQLParte2 := #39 + FRegCamposTab.VL_CAMPO[WICamp] + #39
                     Else
                        SQLParte2 := SQLParte2 + ',' + #39 + FRegCamposTab.VL_CAMPO[WICamp] + #39
                   End
                Else
                // Campos Data
                If FRegCamposTab.TP_ATRIBUTO[WICamp] = 'D' Then
                   Begin
                     {Salvar datas em branco como Nulas}
                     if Trim(FRegCamposTab.VL_CAMPO[WICamp]) = '' then
                      begin
                        if SQLParte2 = '' then
                          SQLParte2 := 'Null'
                        else
                          SQLParte2 := SQLParte2 + ',' + 'Null';
                      end


                     Else If SQLParte2 = '' Then
                        SQLParte2 :=  'TO_DATE(' + #39 + FRegCamposTab.VL_CAMPO[WICamp] + #39
                     Else
                        SQLParte2 := SQLParte2 + ',TO_DATE(' + #39 + FRegCamposTab.VL_CAMPO[WICamp] + #39;

                     {Salvar datas em branco como Nulas}
		     if Trim(FRegCamposTab.VL_CAMPO[WICamp]) <> '' then

                      If (Length(FRegCamposTab.VL_CAMPO[WICamp]) > 8) Then
                         SQLParte2 := SQLParte2 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')'
                      Else
                         SQLParte2 := SQLParte2 + ',' + #39 + 'DD/MM/YY' + #39 + ')';
                   End
                Else
                // Campos Numérico
                If FRegCamposTab.TP_ATRIBUTO[WICamp] = 'N' Then
                   Begin
                     If SQLParte2 = '' Then
                        SQLParte2 := FRegCamposTab.VL_CAMPO[WICamp]
                     Else
                        SQLParte2 := SQLParte2 + ',' + FRegCamposTab.VL_CAMPO[WICamp]
                   End
                Else
                // Campos Float
                If FRegCamposTab.TP_ATRIBUTO[WICamp] = 'F' Then
                   Begin
                     If SQLParte2 = '' Then
                        SQLParte2 := TrocaSeparadorDecimal(FRegCamposTab.VL_CAMPO[WICamp],',','.')
                     Else
                        SQLParte2 := SQLParte2 + ',' + TrocaSeparadorDecimal(FRegCamposTab.VL_CAMPO[WICamp],',','.')
                   End
                Else
                   Raise Exception.Create ('Tipo de Campo inválido');

             End;
         End;
    End;

  If Trim(tipo_beneficio) <> '' then
   begin
     if Trim(matricula) = '' then
       matricula := 'NULL';
     if Trim(grau_dependencia) = '' then
       grau_dependencia := 'NULL';
     if Trim(sexo) = '' then
       sexo := 'NULL';
     if Trim(nascimento) = '' then
       nascimento := 'NULL';

     Result := 'INSERT INTO FI_DEPENDENTE ( CD_PARTIC, CD_DEPENDENTE, CD_VERSAO, ' +
               ' CD_TIPO_BENEF  ) VALUES (' +
               IntToStr(FChave) + ', ' + IntToStr(FOcorr + 1) + ', ' + IntToStr(WG_CD_VERSAO) + ', ' +
               tipo_beneficio + ' ) '

   end
  Else
    Result := 'INSERT INTO ' +
               Tabela + ' (' + SQLParte1 + ')' +
              ' VALUES ' + '(' + SQLParte2 + ')';

End;

//---------------------------------------------------------------
//-- Seta Valores dos campos Chave
//---------------------------------------------------------------
Procedure TImporta.GetValorChave ( Ind : Integer );
Begin
     If FRegCamposTab.NO_ATRIBUTO_TABELA[Ind] = 'CD_VERSAO' Then
        FRegCamposTab.VL_CAMPO[Ind] := inttostr(WG_CD_VERSAO)
     Else
     If FRegCamposTab.NO_ATRIBUTO_TABELA[Ind] = 'CD_PARTIC' Then
        FRegCamposTab.VL_CAMPO[Ind] := inttostr(FChave)
     Else
     If FRegCamposTab.NO_ATRIBUTO_TABELA[Ind] = 'CD_PESSOA_ENTID' Then
        FRegCamposTab.VL_CAMPO[Ind] := inttostr(WG_CD_PESSOA_ENTID)
     Else
     If FRegCamposTab.NO_ATRIBUTO_TABELA[Ind] = 'CD_PESSOA_PATROC' Then
        FRegCamposTab.VL_CAMPO[Ind] := inttostr(WG_CD_PESSOA_PATROC)
     Else
     If FRegCamposTab.NO_ATRIBUTO_TABELA[Ind] = 'CD_PLANO' Then
        FRegCamposTab.VL_CAMPO[Ind] := inttostr(WG_CD_PLANO)
     Else
     If FRegCamposTab.NO_ATRIBUTO_TABELA[Ind] = 'CD_DEPENDENTE' Then
        FRegCamposTab.VL_CAMPO[Ind] := inttostr(FOcorr + 1);
End;

//---------------------------------------------------------------
//-- Grava Mensagem de Erro
//---------------------------------------------------------------
Function TImporta.GetCabecErro : String;
Var WILay  : Integer;
    WIVinc : Integer;
    wCabec : String;
Begin
    wCabec := '';
    //Monta Linha linha identificadora definida pelo usuário
    For WILay := 1 to FTamLayout Do
      If FRegLayout.IR_RELATORIO_OCORRENCIA[WILay] = 'S' Then
         For WIVinc := 1 to FTamVincCampo Do
             If FRegLayout.SQ_CAMPO[WILay] = FRegVincCampo.SQ_CAMPO[WIVinc] Then
                Begin
                  If FRegVincCampo.VL_CAMPO[WIVinc] = Null Then
                     wCabec := wCabec + FRegLayout.NO_CAMPO_ARQUIVO[WILay] + ': Nulo; '
                  Else
                     wCabec := wCabec + FRegLayout.NO_CAMPO_ARQUIVO[WILay] +
                               ': ' + FRegVincCampo.VL_CAMPO[WIVinc] + '; ';
                  Break;
                End;

    Result := wCabec;
End;


end.
