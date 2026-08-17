unit uExporta;

interface

Uses DIalogs, SysUtils, Classes, DBTables, uMensagem, FAnimacao, uRegTabela, uRegArquivo, uRegArquivoVinc,
     uRegDados, Forms, ComCtrls;

Type
  TExporta = Class

    Private
      //Tratamento de Erros
      wMensagem       : TMensagem;

      //Estruturas de Importação/Exportação
      FRegArquivo     : TRegArquivo;
      FRegArquivoVinc : TRegArquivoVinc;
      FRegDados       : TRegDados;

      // Salva o Form Chamador
      FAOWner         : TComponent;

      // Arquivo Texto a ser Gravado
      FArquivoSaida   : TextFile;
      FLinhasLidas    : Integer;
      FLinhasExport   : Integer;

      //-- Armazena o número de dependentes
      FNumOcorr       : Integer;

      //-- Indicadores de Erros ou Avisos
      FErro           : Boolean;
      FAviso          : Boolean;
      //-- Armazena os Erros decorrentes da crítica
      FMensagem       : String;
      FCritica        : String; // Retorna o arquivo de critica

      //-- Consultas para selação de dados de exportação
      FQryPartic : TQuery;
      FQryAux    : TQuery;

      max_ordem: Integer; 

      //-- cria arquivo de saída para exportação
      Function CriaArquivo ( Arquivo : String ) : Boolean;
      //-- Busca e Carrega Grupo de Participantes a serem exportados
      Procedure GetParticipante ( VersaoBase : Integer; Grupos, Ordem : String );
      Procedure LoadRegDados ( Fqry : TQuery ; Tabela : String ; NumOcorr : Integer );
      //-- Busca dados das Tebelas relacionadas a Participante
      Procedure GetTabelaRelacionada ( VersaoBase : Integer; Partic : Integer; Tabela : String );


      Function GetNumCamposOcorr ( index : Integer ) : Integer;
      Function GetCampo ( Tabela : String; Atributo : String ) : String;
      Function GetCampoFormatado ( index : integer ) : String;
      Function GetCampoFormatadoFixo ( index : integer ) : String;


      Procedure SetNumOcorrDeps;

      //-- Grava Registro
      Procedure GravaRegistro;
      Function  MontaLinha : String;

    Public
      Beneficiario: Boolean;

      property Erro     : Boolean read FErro;     //Indicador de erro na exportação
      property Aviso    : Boolean read FAviso;    //Indicador de aviso na exportação
      property Mensagem : String  read FMensagem; //Mensagens de erro na exportação
      property Critica  : String  read FCritica;  //Arquivo de crítica gerado na exportação
      property NumRegsExport : Integer read FLinhasExport; //Número de Regs Exportados

      //-- Create e Destroy da Classe
      Constructor Create (AOWner : TComponent);
      Destructor Destroy; override;

      Procedure ExportaArquivo ( VersaoBase : Integer; LayoutArquivo : Integer;  Grupos : String; NomeArquivo, Ordem : String );
End;

implementation

//--------------------------------------------------------
//-- Cronstructor Classe TImporta
//--------------------------------------------------------
Constructor TExporta.Create (AOwner : TComponent);
Begin
      Inherited Create;

      wMensagem       := TMensagem.Create;
      FAOWner         := AOwner;

      FErro           := False;
      FAviso          := False;
      FMensagem       := '';
      FCritica        := '';

      FLinhasExport   := 0;

      //Define saida padrão da critica como Arquivo
      wMensagem.SetTipoSaida(Arquivo);

End;

//--------------------------------------------------------
//-- Destroy da Classe TImporta
//--------------------------------------------------------
Destructor TExporta.Destroy;
Begin
      //Libera Tipos Criados
      wMensagem.Free;
      Inherited Destroy;
End;

//--------------------------------------------------------
//-- Método de exportação de registros
//--------------------------------------------------------
Procedure TExporta.ExportaArquivo ( VersaoBase : Integer; LayoutArquivo : Integer;  Grupos : String; NomeArquivo, Ordem : String );
Begin

      // cria arquivo para exportação de dados
      If NOT CriaArquivo ( NomeArquivo ) Then
         Raise Exception.Create ('Não foi possível criar o arquivo de saída');

      //Cria Objetos para exportação
      FRegArquivo     := TRegArquivo.Create( FAOWner, LayoutArquivo );
      FRegArquivoVinc := TRegArquivoVinc.Create( FAOWner, LayoutArquivo );
      FRegDados       := TRegDados.Create;
      FQryPartic      := TQuery.Create ( FAOWner );
      FQryAux         := TQuery.Create ( FAOWner );

      //Busca Participantes para exportação
      GetParticipante ( VersaoBase, Grupos, Ordem );

      //-- Cria Form de Animação
      Application.CreateForm(TfrmAnimacao, frmAnimacao);
      frmAnimacao.SetAnimacao('Exportando dados...',FLinhasLidas,True,True,aviCopyFiles);

      //Executa laço de exportação
      While NOT FQryPartic.EOF Do
        Begin

         //Limpa Registro de armazenamento de dados
         FRegDados.ClearRegDados;

         FRegDados.SetRegDadosArquivo ( FRegArquivo );

         //Monta dados do Participante
         LoadRegDados ( FQryPartic , 'FI_PARTICIPANTE' , 1 );

         //Busca Dados da Tebela Relacionada de Tempos
         GetTabelaRelacionada ( VersaoBase, FQryPartic.FieldByName('CD_PARTIC').AsInteger, 'FI_TEMPO_PARTICIPANTE');

         //Busca Dados da Tebela Relacionada de Valores
         GetTabelaRelacionada ( VersaoBase, FQryPartic.FieldByName('CD_PARTIC').AsInteger, 'FI_VALOR_PARTICIPANTE');

         //Busca Dados da Tebela Relacionada de Benefício
//         GetTabelaRelacionada ( VersaoBase, FQryPartic.FieldByName('CD_PARTIC').AsInteger, 'FI_BENEFICIO_CONCEDIDO');
         GetTabelaRelacionada ( VersaoBase, FQryPartic.FieldByName('CD_PARTIC').AsInteger, 'FI_BENEFICIARIO');

         //Busca Dados da Tebela Relacionada de Dependente
         GetTabelaRelacionada ( VersaoBase, FQryPartic.FieldByName('CD_PARTIC').AsInteger, 'FI_DEPENDENTE');

         //Seta Numero de Ocorrência de Dependentes
         SetNumOcorrDeps;

         //Grava Registro
         GravaRegistro;

         //Lê Próximo Registro
         FQryPartic.Next;

         //Verifica Continuidade e seta ProgressBar
         if frmAnimacao.Cancel Then
            Begin
              frmAnimacao.Close;
              WMensagem.SetMsgAviso('Processamento cancelado por intervenção do usuário');
              Break;
            End;

        End;

      //Fecha query de seleção de participantes
      FQryPartic.Close;

      //Fecha arquivo de saída
      CloseFile(FArquivoSaida);

      // Verifica a ocorrência de Erros
      FErro     := WMensagem.FErro;
      FAviso    := WMensagem.FAviso;
      FMensagem := WMensagem.FMensagem;
      FCritica  := WMensagem.FCritica;

      //Libera Objetos Criados
      frmAnimacao.Close;
      frmAnimacao.Free;
      FRegDados.Free;
      FRegArquivo.Free;
      FRegArquivoVinc.Free;
      FQryPartic.Free;
      FQryAux.Free;

End;

//-------------------------------------------------------------
//-- Método Criar o arquivo de exportação dos dados
//-------------------------------------------------------------
Function TExporta.CriaArquivo ( Arquivo : String ) : Boolean;
Begin
      Try
        AssignFile(FArquivoSaida, Arquivo);
        Rewrite(FArquivoSaida);
        Result := True
      Except on E: Exception do
       begin
         Result := False;
         MessageDlg('Erro ao criar arquivo: ' + #13#10 + E.Message, mtError, [mbOk], 0);
       end;
      End;
End;

//-------------------------------------------------------------
//-- Método para selecionar os participantes a serem exportados
//-------------------------------------------------------------
Procedure TExporta.GetParticipante ( VersaoBase : Integer; Grupos, Ordem : String );
Begin
      With FQryPartic Do
        Begin
          DataBaseName := 'BaseDados';
          SQL.Clear;
          SQL.Add('SELECT FI_PARTICIPANTE.*');
          SQL.Add('FROM FI_PARTICIPANTE, FI_GRUPO_EXPORT_PARTIC');
          SQL.Add('WHERE FI_PARTICIPANTE.CD_VERSAO = FI_GRUPO_EXPORT_PARTIC.CD_VERSAO');
          SQL.Add('  AND FI_PARTICIPANTE.CD_PARTIC = FI_GRUPO_EXPORT_PARTIC.CD_PARTIC');
          SQL.Add('  AND FI_PARTICIPANTE.CD_VERSAO = ' + inttostr(VersaoBase));
          SQL.Add('  AND FI_GRUPO_EXPORT_PARTIC.CD_GRUPO_PARTIC IN (' + Grupos + ')');

          if Trim(Ordem) <> '' then
            SQL.Add('ORDER BY ' + Ordem);

          Open;
          If IsEmpty Then
             Begin
               FLinhasLidas := 0;
               Close;
             End
          Else
             FLinhasLidas := RecordCount;
        End;
End;

//---------------------------------------------------------------
//-- Método para carregar os registros no Reg de Exportação
//---------------------------------------------------------------
Procedure TExporta.LoadRegDados ( Fqry : TQuery ; Tabela : String ; NumOcorr : Integer );
var   wi      : integer;
      wCodigo : integer;
      wOrdem  : integer;
      wCampo  : Variant;
Begin
     if FRegArquivoVinc.TamReg > 100 then
       exit;

      For wi := 1 to FRegArquivoVinc.TamReg Do
        Begin
           If FRegArquivoVinc.NO_TABELA[wi] = Tabela Then
              Begin
                wCodigo := FRegArquivoVinc.SQ_CAMPO[wi];

                max_ordem := wOrdem; 

                if NumOcorr > 1 then
                  wOrdem  := FRegArquivoVinc.NR_ORDEM[wi] + NumOcorr * GetNumCamposOcorr(FRegArquivoVinc.NR_ORDEM[wi])
                else
                  wOrdem  := FRegArquivoVinc.NR_ORDEM[wi]; 

                if max_ordem > wOrdem then 
                 wOrdem := max_ordem + 1;



                If FRegArquivoVinc.VL_ATRIBUIDO[wi] = '' Then
                   Begin
                     wCampo := Fqry.FieldByName(FRegArquivoVinc.NO_ATRIBUTO_TABELA[wi]).AsString;
                     FRegDados.SetFieldValue ( wCodigo, wOrdem , wCampo, Tabela, FRegArquivoVinc.NO_ATRIBUTO_TABELA[wi], Beneficiario);
                   End
                Else
                  If FRegArquivoVinc.VL_ATRIBUIDO[wi] = GetCampo ( Tabela , FRegArquivoVinc.NO_ATRIBUTO_TABELA[wi] ) Then
                     Begin
                       If FRegArquivoVinc.VL_ARQUIVO[wi] = '' Then
                          WCampo := Fqry.FieldByName(FRegArquivoVinc.NO_ATRIBUTO_TABELA[wi]).AsString
                       Else
                          WCampo := FRegArquivoVinc.VL_ARQUIVO[wi];
                       FRegDados.SetFieldValue ( wCodigo, wOrdem , wCampo, Tabela, FRegArquivoVinc.NO_ATRIBUTO_TABELA[wi], Beneficiario);
                     End;
              End;
        End;
End;


//-------------------------------------------------------------
//-- Retorna número de campos vinculados ao campo a que o campo
//-- atual eventualmente possa estar vinculado.
//-- Se o campo atual não está vinculado ao nenhum - retorna 0
//-------------------------------------------------------------
Function TExporta.GetNumCamposOcorr ( index : Integer ) : Integer;
Var wi : Integer;
Begin
  Result := 0;
  For wi := 1 to FRegArquivo.TamReg Do
    If FRegArquivo.SQ_CAMPO[wi] = FRegArquivo.SQ_CAMPO_MASTER[index] Then
       Result := FRegArquivo.NR_CAMPOS_OCORRENCIA[wi];
End;

//-------------------------------------------------------------
//-- Seta o numero de dependentes
//-------------------------------------------------------------
Procedure TExporta.SetNumOcorrDeps;
Var wi : Integer;
Begin
  For wi := 1 to FRegArquivo.TamReg Do
    If FRegArquivo.NR_CAMPOS_OCORRENCIA[wi] > 0 Then
       FRegDados.SetFieldValue ( FRegArquivo.SQ_CAMPO[wi], FRegArquivo.NR_ORDEM[wi] , inttostr(FNumOcorr), '',  '', Beneficiario);
End;

//-------------------------------------------------------------
//-- Retorna Chave Estrangeira
//-------------------------------------------------------------
Function TExporta.GetCampo ( Tabela : String; Atributo : String ) : String;
Begin

     Result := '';

     If Tabela = 'FI_PARTICIPANTE' Then
        Result := FQryPartic.FieldByName(Atributo).AsString
     Else
     If Tabela = 'FI_TEMPO_PARTICIPANTE' Then
        Result := FQryAux.FieldByName('CD_TIPO_TEMPO').AsString
     ELSE
     If Tabela = 'FI_VALOR_PARTICIPANTE' Then
        Result := FQryAux.FieldByName('CD_TIPO_VALOR').AsString
     ELSE
     If Tabela = 'FI_DEPENDENTE' Then
        Result := FQryAux.FieldByName(Atributo).AsString;

End;

//-------------------------------------------------------------
//-- Método para buscar dados das tabelas relacionadas a Participante
//-------------------------------------------------------------
Procedure TExporta.GetTabelaRelacionada ( VersaoBase : Integer; Partic : Integer; Tabela : String );
Begin
      FNumOcorr := 0;

      With FQryAux Do
        Begin
          DataBaseName := 'BaseDados';
          SQL.Clear;

          If (Tabela = 'FI_TEMPO_PARTICIPANTE') then     // ClaudioR(REFER) - 14/8/2006 - tabela não possui PK
             SQL.Add('SELECT DISTINCT * FROM ' + Tabela)
          ELSE
             SQL.Add('SELECT * FROM ' + Tabela);

          SQL.Add('WHERE CD_VERSAO = ' + inttostr(VersaoBase));
          SQL.Add('  AND CD_PARTIC = ' + inttostr(Partic));

          Open;
          If IsEmpty Then
             Close
          Else
            Begin
              While NOT FQryAux.EOF Do
                Begin
                  If (Tabela = 'FI_DEPENDENTE') then
                   begin
                     if (FQryAux.FieldByName('CD_PARTIC').asInteger <> FQryAux.FieldByName('CD_DEPENDENTE').asInteger) Then
                      Begin
                        Beneficiario := False;
                        FNumOcorr := FNumOcorr + 1;
                        LoadRegDados ( FQryAux , Tabela , FNumOcorr )
                      End
                     else
                      begin
                        Beneficiario := True;
                        LoadRegDados ( FQryAux , Tabela , 1 );
                      end;  
                   end
                  Else
                     LoadRegDados ( FQryAux , Tabela , 1 );
                  FQryAux.Next;
                End;
              FQryAux.Close;
            End;
        End;
End;

//---------------------------------------------------------------
//-- Método para gravar o registro
//---------------------------------------------------------------
Procedure TExporta.GravaRegistro;
Begin

     WriteLn( FArquivoSaida, MontaLinha );
     FLinhasExport := FLinhasExport + 1;
     frmAnimacao.SetProgressBar(FLinhasExport);

End;

//---------------------------------------------------------------
//-- Monta Linha para gravação
//---------------------------------------------------------------
Function TExporta.MontaLinha : String;
var  wLinha  : String;
     wCampos : Integer;
     wi      : Integer;
Begin
     wLinha  := '';
     wCampos := FRegArquivo.TamReg;

     If wCampos < FRegDados.TamReg Then
        wCampos := FRegDados.TamReg;

     For wi := 1 to wCampos Do
       Begin

         If FRegDados.VL_CAMPO[wi] <> '' Then
            FRegDados.VL_CAMPO[wi] := GetCampoFormatado ( wi );

         If FRegArquivo.TipoArquivo = 'F' Then //Trata campos de tamanho Fixo
            FRegDados.VL_CAMPO[wi] := GetCampoFormatadoFixo ( wi )
         Else
            If wi > 1 Then
               wLinha := wLinha + FRegArquivo.TipoDelimitador;

         If FRegArquivo.Qualificador = 'N' Then
            wLinha := wLinha + FRegDados.VL_CAMPO[wi]
         Else
            wLinha := wLinha + FRegArquivo.Qualificador + FRegDados.VL_CAMPO[wi] + FRegArquivo.Qualificador;

       End;
     Result := wLinha;

End;

//---------------------------------------------------------------
//-- Formata Campo
//---------------------------------------------------------------
Function TExporta.GetCampoFormatado ( index : integer ) : String;
Var wCampo         : String;
    wpos           : integer;
    wi             : integer;
    wSeparadorData : String;
    WDia           : Word;
    WMes           : Word;
    WAno           : Word;
    WData          : TDateTime;
Begin

     wCampo := FRegDados.VL_CAMPO[index];

     // Formata campo numérico Decinal
     If FRegArquivo.TP_ATRIBUTO[FRegDados.SQ_CAMPO[index]] = 'F' Then
        Begin

           // Formata Separador de Casas Decimais
           wpos := pos(FRegArquivo.DS_SIMBOLO_DECIMAL[FRegDados.SQ_CAMPO[index]],wCampo);
           If wpos = 0 Then //Não encontrou o delimitador de decimais
              Begin
                wCampo := wCampo + FRegArquivo.DS_SIMBOLO_DECIMAL[FRegDados.SQ_CAMPO[index]];
                For wi := 1 to FRegArquivo.NR_DECIMAL[FRegDados.SQ_CAMPO[index]] Do
                    wCampo := wCampo + '0';
              End
           Else          //Encontrou o delimitador de decimais
              Begin
                wpos := wpos + FRegArquivo.NR_DECIMAL[FRegDados.SQ_CAMPO[index]];
                If wpos > Length(wCampo) Then
                   For wi := Length(wCampo) to wpos-1 do
                       wCampo := wCampo + '0'
                Else
                   wCampo := Copy ( wCampo, 1, wpos );
              End;

           // Formata Separador de Inteiros

        End;

     // Formata campo Data
     If FRegArquivo.TP_ATRIBUTO[FRegDados.SQ_CAMPO[index]] = 'D' Then
        Begin

          // Busca Separador da máscara
          If pos('/',FRegArquivo.DS_MASCARA_DATA[FRegDados.SQ_CAMPO[index]]) > 0 Then
             wSeparadorData := '/'
          Else
          If pos('-',FRegArquivo.DS_MASCARA_DATA[FRegDados.SQ_CAMPO[index]]) > 0 Then
             wSeparadorData := '-'
          Else
          If pos('.',FRegArquivo.DS_MASCARA_DATA[FRegDados.SQ_CAMPO[index]]) > 0 Then
             wSeparadorData := '.'
          Else
             wSeparadorData := '';

          // Converte data para tratamento
          WData := strtodate(wCampo);
          DecodeDate(WData, WAno, WMes, WDia);

          //Monta Data
          If wdia < 10 Then
             wCampo := '0' + inttostr(wDia)
          Else
             wCampo := inttostr(wDia);

          If wMes < 10 Then
             wCampo := wCampo + wSeparadorData + '0' + inttostr(wMes)
          Else
             wCampo := wCampo + wSeparadorData + inttostr(wMes);

          If wAno < 10 Then
             wCampo := wCampo + wSeparadorData + '0' + inttostr(wAno)
          Else
             wCampo := wCampo + wSeparadorData + inttostr(wAno);

        End;

     //Seta Resultado da Função
     Result := wCampo;

End;

//---------------------------------------------------------------
//-- Formata Campo de Tamanho Fixo
//---------------------------------------------------------------
Function TExporta.GetCampoFormatadoFixo ( index : integer ) : String;
Var wCampo : String;
    wi     : integer;
Begin
    wCampo := FRegDados.VL_CAMPO[index];
    Result := wCampo;

    //Verifica se tamanho já é compatível com o campo
    If FRegArquivo.NR_TAM_CAMPO[FRegDados.SQ_CAMPO[index]] = length(wCampo) Then
       Exit
    Else
       If FRegArquivo.NR_TAM_CAMPO[FRegDados.SQ_CAMPO[index]] < length(wCampo) Then
          Begin
            wMensagem.SetMsgAviso ('Campo ' + FRegArquivo.NO_CAMPO_ARQUIVO[FRegDados.SQ_CAMPO[index]] + ' incompatível com o tamnaho definido no layout.');
            Exit;
          End;

    // Trata Campo Alfanumérico ou data
    If (FRegArquivo.TP_ATRIBUTO[FRegDados.SQ_CAMPO[index]] = 'A')
    or (FRegArquivo.TP_ATRIBUTO[FRegDados.SQ_CAMPO[index]] = 'D') Then
       Begin
         For wi := length(wCampo) to FRegArquivo.NR_TAM_CAMPO[FRegDados.SQ_CAMPO[index]] - 1 Do
             wCampo := wcampo + ' ';
       End;

    // Trata Campo Numérico ou Ponto Flutuante
    If (FRegArquivo.TP_ATRIBUTO[FRegDados.SQ_CAMPO[index]] = 'N')
    or (FRegArquivo.TP_ATRIBUTO[FRegDados.SQ_CAMPO[index]] = 'F') Then
       Begin
         For wi := length(wCampo) to FRegArquivo.NR_TAM_CAMPO[FRegDados.SQ_CAMPO[index]] - 1 Do
             wCampo := '0' + wcampo;
       End;

    Result := wCampo;

End;


end.
