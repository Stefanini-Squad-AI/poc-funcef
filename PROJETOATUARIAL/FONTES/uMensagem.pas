{**************************************************************
Componente:  Mensagem

Autor     : Paulo André M. de Carvalho

Data      : 13/05/1999

Objetivo: Propriciar uma maneira de acumular mensagens de erros e
          avisos para mostrar ao usuário

Propriedades Publicadas:

      FErro (R)     : Propriedade que indica se houve erros (True) ou
                       não (False);

      FAviso (R)    : Propriedade que indica a existência de avisos (True)
                      ou não (False)

      FMensagem (R) : Retorna uma String com as mensagens e os avisos

Métodos Publicos:
      Create            : Cria uma instância da classe TMensagem.

      Destroy           : Destroi a instância ativa da classe TMensagem.


      SetMsgErro        : Seta Mensagem de erro recenebdo o texto da Mensagem

      SetMsgAviso       : Seta Avisos recebendo o texto do aviso

      SetTipoSaida      : Seta o Tipo de saida. Só pode receber os parâmetros
                          "Video" e "Arquivo". Se receber "Video" as mensagens
                          de erro serão setadas na propriedade FMensagem. Se
                          receber "Arquivo" as mensagens serão gravadas em um
                          arquivo .TXT, cujo diretório e nome estarão em
                          FArquivo. O Default é "Video"
****************************************************************}
unit uMensagem;

interface

Uses Classes,SysUtils;

Type
  TTipoSaida = (Video, Arquivo);

Type
  TMensagem = Class

    Private
      FMsgErro : String;
      FMsgAviso: String;
      FTipoSaida    : TTipoSaida;
      FArquivoSaida : TextFile;

      // String List para armazenar as Mensagens de Erro
      FErroList : TStringList;

      // String List para armazenar os Avisos
      FAvisoList : TStringList;

      //-- Rotinas que verificam se existe e Setam erros e avisos nas Listas
      Function ExisteMsgErro ( Msg : String ) : Boolean;
      Function ExisteMsgAviso( Msg : String ) : Boolean;

      Procedure CriaArquivo; // CriaArquivo de Ocorrências
    Public

      //-- Propriedades da Class
      FErro     : Boolean; // Ocorrência de Erros
      FAviso    : Boolean; // Ocorrência de warnings
      FMensagem : String;  // Mensagem relativa a Erros e Warnings
      FCritica  : String;  // Contém o arquivo com as críticas

      //-- Create e Destroy da Classe
      Constructor Create;
      Destructor Destroy; override;

      //-- Rotina que seta mensagens de Erro
      Procedure SetMsgErro   ( Msg : String );       // Seta Erro
      Procedure SetMsgAviso  ( Msg : String );       // Seta Aviso
      Procedure SetBlankLine ( Num : Integer) ;      // Imprime Linha em Branco
      Procedure SetTipoSaida ( value : TTipoSaida ); // Seta Tipo Saida
End;

implementation

//--------------------------------------------------------
//-- Cronstructor Classe
//--------------------------------------------------------
Constructor TMensagem.Create;
Begin
     Inherited Create;
     FErroList  := TStringList.Create;
     FAvisoList := TStringList.Create;

     FErro      := False;
     FAviso     := False;
     FMensagem  := '';
     FCritica   := '';

     FMsgErro  := '';
     FMsgAviso := '';

     SetTipoSaida ( Video );
End;

//--------------------------------------------------------
//-- Destroy da Classe
//--------------------------------------------------------
Destructor TMensagem.Destroy;
Begin
     FErroList.Free;
     FAvisoList.Free;

     if FTipoSaida = Arquivo Then
        CloseFile(FArquivoSaida);

     Inherited Destroy;
End;

Procedure TMensagem.SetMsgErro  ( Msg : String );
Begin
     if not ExisteMsgErro(Msg) Then
        Begin
          if FTipoSaida = Arquivo Then
             Begin
               WriteLn(FArquivoSaida,'Erro : ' + Msg);
               FErro := True;
             End
          Else
             Begin
               if FErro Then
                  FMsgErro := FMsgErro + Msg + #13
               Else
                  Begin
                    FMsgErro := 'Erro(s):' + #13 + #13;
                    FMsgErro := FMsgErro + Msg + #13;
                    FErro := True;
                  End;
               FMensagem := FMsgErro + FMsgAviso;
             End;
        End;
End;

Procedure TMensagem.SetMsgAviso ( Msg : String );
Begin
     if not ExisteMsgAviso(Msg) Then
        Begin
          if FTipoSaida = Arquivo Then
             Begin
               WriteLn(FArquivoSaida,'Aviso: ' + Msg);
               FErro := True;
             End
          Else
             Begin
               if FAviso Then
                  FMsgAviso := FMsgAviso + Msg + #13
               Else
                  Begin
                    FMsgAviso := #13 + 'Aviso(s):' + #13 + #13;
                    FMsgAviso := FMsgAviso + Msg + #13;
                    FAviso := True;
                  End;
               FMensagem := FMsgErro + FMsgAviso
             End;
        End;
End;

Procedure TMensagem.SetBlankLine ( Num : Integer) ;
Var wi : Integer;
Begin
  For wi := 1 to Num Do
    if FTipoSaida = Arquivo Then
       WriteLn(FArquivoSaida,'')
    Else
       FMensagem := FMensagem + #13;
End;

Procedure TMensagem.SetTipoSaida ( value : TTipoSaida );
Begin
  FTipoSaida := value;
  if FTipoSaida = Arquivo Then
     CriaArquivo;
End;

Function TMensagem.ExisteMsgErro ( Msg : String ) : Boolean;
Begin
     if FErroList.IndexOf(Msg) = -1 Then
        Begin
          FErroList.Add(Msg);
          Result := False;
        End
     Else
        Result := True;
End;

Function TMensagem.ExisteMsgAviso( Msg : String ) : Boolean;
Begin
     if FAvisoList.IndexOf(Msg) = -1 Then
        Begin
          FAvisoList.Add(Msg);
          Result := False;
        End
     Else
        Result := True;
End;

Procedure TMensagem.CriaArquivo;
Begin
  FCritica := copy(ParamStr(0), 1, Length(ParamStr(0)) - 7) + 'CRITICA.TXT';
  AssignFile(FArquivoSaida, FCritica);
  Rewrite(FArquivoSaida);
  WriteLn(FArquivoSaida,'Relatório de Ocorrências gerado em ' + DateTimeToStr(Now));
  WriteLn(FArquivoSaida,'');
End;

end.
