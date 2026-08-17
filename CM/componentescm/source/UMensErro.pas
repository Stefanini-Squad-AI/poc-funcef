{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
{
//***************************************************************************************************
//Alteração  : LerMensDBErro
//Nº SIG.....: 84924
//Data.......: 17/04/2019
//Responsável: Andre Imakawa
//Descrição..: Tratamento para exibir mensagem tratada no banco de dados
//***************************************************************************************************
}
unit UMensErro;

interface

uses SysUtils, Dialogs, Forms, StdCtrls, DB, DBTables, Controls, Classes, uCMDialogs,
     iVDictio;

{Registro utilizado para armazenar tradução das mensagens de erro}
type TRecMensagem = Record
                          Codigo : integer;
                          Mensagem:string
                    end;

{Le mensagem de erro da string table }
function LerMensagem(Numero : Integer): string;

{Exibe caixa de dialogo padrão}
function MsgDlg(const Msg: String; const Caption: String; AType: TMsgDlgType;
                Buttons: TMsgDlgButtons; HelpCtx: Longint): TModalResult;

{Mostra erros da IDAPI }
procedure MostrarErro(E : Exception);
{Grava o arquivo CMLogErro}
procedure GravarLogErro(Erro : Exception);
{Trata a execssão gerada pela aplicação e gera o log de erro}
procedure LogErro(Erro : Exception);

{Verifica na execção se o erro é do servidor de banco de dados ou da BDE}
function LerMensDBErro(e : EDBEngineError):string;
{Verifiaca se o erro é da da BDE ou do servidor de banco de dados}
function ErroNativo(CodigoErro : integer) : string;
{Verifica se a mensagem de erro está traduzida}
function AchaMensagem(a : array of TRecMensagem; Codigo:integer) : string;

{Formata Mensagem de erro com informações da classe que gerou o erro, a classe do erro e a mensagem, cada informação numa linha }
function FormatErrorMessage(Owner :TObject; E: Exception; sMsg :String) :String;
{solução proposta para tratar erro quando um comando DML é executado na HSTBENEFBFCIARIO e RUBRICAINDIV}
procedure TratarErro(Erro : String);

implementation

uses uSistema, uMensBDE, uMensOracle, CmErroDialiog, uDataBase, uCMTypes;

function LerMensagem(Numero : Integer): string;
begin
     Result := LoadStr(Numero);
end;

function MsgDlg(const Msg: String; const Caption: String; AType: TMsgDlgType;
                Buttons: TMsgDlgButtons; HelpCtx: Longint): TModalResult;
begin
  {Chama MsgDlgPos com a posição default.}
  Result := uCMDialogs.MsgDlg(Translate(Msg), Translate(Caption), AType, Buttons, HelpCtx);
end;

procedure MostrarErro(E : Exception);
var
   MsgErro : string;

begin
   With TCmErroDialiog.Create(Application) Do
     Try
        if E is EDBEngineError then
           begin
                MsgErro := LerMensDBErro(EDBEngineError(E));
                MsgDlg(MsgErro, 'Atualização de dados', mtError,[mbOk,mbHelp],0);
           end
        else
        Begin
             ErrorMesage.Add(Translate('Erro: '));
             ErrorMesage.Add(E.ClassName + ' -  '+ E.Message);
             ErrorMesage.Add(Translate('Endereço: ') + Format('%p',[ExceptAddr]));
             Execute;
        End;

        LogErro(E);
     finally
        Free;
     end;
end;

procedure GravarLogErro(Erro : Exception);
var
   ArqLog : Text;
   F, i   : integer;
   Desc   : TStringList;
   DirApp : String;
begin
     DirApp   := ExtractFilePath(Application.ExeName);
     Assign(ArqLog, DirApp + '\LOGERR.TXT');
     try
        Append(ArqLog);
     Except
         Try
            ReWrite(ArqLog)
         Except
            On E:Exception Do
            Begin
               MsgDlg('Erro ao gravar log da operação.' + (#13+#10) + E.Message,'Aviso',mtError,[mbOk],0);
               Exit;
            End;
         End;
     end;

     Writeln(ArqLog,'_______________________________________________________________');

     { Hora e Dia }
     Writeln(ArqLog,Translate('Data: '),FormatDateTime('dd/mm/yyyy',Date),Translate(' - Hora: '),FormatDateTime('hh:mm:ss'{ivlm},Time));
     Writeln(ArqLog,Translate('Endereço: '), Format('%p',[ExceptAddr]));

     if (Erro is EDBEngineError)
     then with (Erro as EDBEngineError) do
     begin
          Writeln(ArqLog,Translate('Lista de erros do BDE: '));
          For F := 0 to ErrorCount - 1 do
          begin
               Writeln(ArqLog,'     ',F + 1,Translate(' - Mensagem: '),Errors[F].Message);
               Writeln(ArqLog,'     ',Translate('Código do Erro: '),Errors[F].ErrorCode);
               Writeln(ArqLog,'     ',Translate('SubCódigo: '),Errors[F].SubCode);
               Writeln(ArqLog,'     ',Translate('Categoria: '),Errors[F].Category);
               Writeln(ArqLog);
          end
     end
     else { Mostra a Mensagem de Erro }
          Writeln(ArqLog,Translate('Mensagem de Erro: '), Erro.Message);

     { Apresenta a lista de janelas abertas }
     Writeln(ArqLog);
     Writeln(ArqLog, Translate('Janelas abertas no momento do erro:'));
     with Application.MainForm do
      for i := 0 to MDIChildCount do
         Writeln(ArqLog, '   '{ivlm} + MDIChildren[i].Caption);

     { Pede a descrição da operação que estava sendo feita }
     Desc := TStringList.Create;
     try
     finally
        Desc.Free;
     end;
     Writeln(ArqLog);     // Pula uma linha
     Close(ArqLog);     { Fecha o Arquivo de Erros }
end;

procedure LogErro(Erro : Exception);
var
   ArqLog : Text;
   F, i   : integer;
begin
     Assign(ArqLog, 'CMLogErro.TXT');
     try
        Append(ArqLog);
     Except
         Try
            ReWrite(ArqLog)
         Except
            On E:Exception Do
            Begin
               MsgDlg('Erro ao gravar log da operação.' + (#13+#10) + E.Message,'Aviso',mtError,[mbOk],0);
               Exit;
            End;
         End;
     end;

     Writeln(ArqLog,'_______________________________________________________________');

     Writeln(ArqLog,Translate('Módulo: '),  Sistema.NomeModulo, Translate('| Em: '), FormatDateTime('dd/mm/yyyy'{ivlm},Date),' - '{ivlm},FormatDateTime('hh:mm:ss'{ivlm},Time));
     Writeln(ArqLog,Translate('Endereço: '), Format('%p',[ExceptAddr]));
     Writeln(ArqLog);

     if Erro is EDBEngineError then
     begin
          with (Erro as EDBEngineError) do
          begin
               Writeln(ArqLog,Translate('Lista de erros do BDE: '));
               For F := 0 to ErrorCount - 1 do
               begin
                    Writeln(ArqLog,' ',F + 1,Translate(Translate(' - Mensagem : ')),Errors[F].Message);
                    Writeln(ArqLog,'     ',Translate(Translate('Código   : ')),Errors[F].ErrorCode);
                    Writeln(ArqLog,'     ',Translate(Translate('SubCódigo: ')),Errors[F].SubCode);
                    Writeln(ArqLog,'     ',Translate(Translate('Categoria: ')),Errors[F].Category);
                    Writeln(ArqLog);
               end;
          end;
     end
     else
     begin
          Writeln(ArqLog,Translate('Erro: '),Erro.ClassName + ' - '+Erro.Message);

     end;

     { Apresenta a lista de janelas abertas }
     Writeln(ArqLog);
     Writeln(ArqLog, Translate('Janelas abertas no momento do erro:'));
     with Application.MainForm do
      for i := 0 to MDIChildCount do
         Writeln(ArqLog, '   ' + MDIChildren[i].Caption);

     Writeln(ArqLog);     // Pula uma linha
     Close(ArqLog);     { Fecha o Arquivo de Erros }
end;

function LerMensDBErro(e : EDBEngineError):string;
var i ,
    iErroNativo,
    iPos        : integer;
    sTrataRaise,
    Msg         : String;
begin
     sTrataRaise := '';
     i := 0;
     iErroNativo := 0;
     while (i < e.ErrorCount) and (iErroNativo = 0) do
     begin
          iErroNativo := e.Errors[i].NativeError;
          Inc(i);
     end;

     //if iErroNativo > 0 then                                                          // Andre Imakawa - SIG 84924
     if (iErroNativo > 0) or ((iErroNativo <= -20500) and (iErroNativo > -20599)) then  // Andre Imakawa - SIG 84924
     begin
          Result := ErroNativo(iErroNativo);
          if Result = '' then Begin
             Result := Translate('Mensagem não traduzida - ') + Sistema.DriverServidor+#10#13+e.Errors[i-1].Message;

             iPos := pos('#',Result);

             sTrataRaise := Copy(Result,iPos + 1,length(Result)-1);

             iPos := pos('#',sTrataRaise);

             Msg := Copy(sTrataRaise,iPos + 1, length(Result)-1);

             sTrataRaise := Copy(sTrataRaise,1,iPos - 1);

             iPos := pos('#',Msg);

             Msg := Copy(Msg, 1, iPos-1);

             if Trim(sTrataRaise) = 'PR_VALIDA000001' then begin
                Result := Msg;
             end;
          end;
     end
     else
     begin
          if e.Errors[0].ErrorCode = 11972 then  // Custom Constraint
             Result := e.Errors[1].Message
          else
              Result := AchaMensagem(ListaBDE, e.Errors[0].ErrorCode);
          if Result = '' then
             Result := Translate('Mensagem não traduzida - BDE ')+IntToStr(e.Errors[0].ErrorCode)+#10#13+e.Errors[0].Message;
     end;
end;

function ErroNativo(CodigoErro : integer) : string;
begin
     if Sistema.DriverServidor = DriverOracle then
        Result := AchaMensagem(ListaOracle, CodigoErro);
end;

function AchaMensagem(a : array of TRecMensagem; Codigo:integer) : string;
var i : integer;
    lAchou : boolean;
begin
     i := 0;
     lAchou := false;
     while (a[i].Codigo <> 0) and (not lAchou) do
     begin
          if Codigo = a[i].Codigo then
          begin
               lAchou := true;
               Result := a[i].Mensagem;
          end;
          Inc(i);
     end;
     if not lAchou then
        Result := '';
end;

function FormatErrorMessage(Owner :TObject; E: Exception; sMsg :String) :String;
Begin
  Result := Owner.ClassName + ' : ' + E.ClassName + (#13+#10) + sMsg + (#13+#10) +  E.Message;
End;

//KTN 767861 - SOL 132659
procedure TratarErro(Erro : String);
var
    iPos        : integer;
    sTrataRaise,
    Msg, Mensagem : String;
begin
    Mensagem := 'Mensagem não traduzida - ' + Sistema.DriverServidor +#10#13+ Erro;

    iPos := pos('#',Mensagem);

    sTrataRaise := Copy(Mensagem,iPos + 1,length(Mensagem)-1);

    iPos := pos('#',sTrataRaise);

    Msg := Copy(sTrataRaise,iPos + 1, length(Mensagem)-1);

    sTrataRaise := Copy(sTrataRaise,1,iPos - 1);

    iPos := pos('#',Msg);

    Msg := Copy(Msg, 1, iPos-1);

    if Trim(sTrataRaise) = 'PR_VALIDA000001' then begin
        Mensagem := Msg;    
        MsgDlg(Msg,'Erro',mtError,[mbOk],0);
	Abort;
    end;
end;
//KTN 767861 - SOL 132659

end.


