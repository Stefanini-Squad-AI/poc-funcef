unit fPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, FileCtrl, ExtCtrls, ComCtrls, JclFileUtils, jclShell, TlHelp32, Registry, PsAPI,
  Gauges, jpeg, Menus, JclSysInfo, shellApi;



CONST
  CaptionMensagem = 'Atualizador de versões do Planus -  Getif/COSIS';
  FDirVersaoPadrao : string = '\\ALTARF\totalprev\cmsolucoes\executaveis\bin\';
  FDirBplPadrao : string = 'C:\cmsolucoes\executaveis\bpl';

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    LblAguarde: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LblAtu: TLabel;
    LblExec: TLabel;
    LblBpl: TLabel;
    Bevel1: TBevel;
    GgProgress: TGauge;
    Image1: TImage;
    btnFinalizar: TBitBtn;
    flExe: TFileListBox;
    btnForcarEncerramento: TSpeedButton;
    lblProcAbertos: TLabel;
    mmProcAbertos: TMemo;
    tmVerificaProcessos: TTimer;
    btnIgnoreFile: TButton;
    procedure btnFinalizarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmVerificaProcessosTimer(Sender: TObject);
    procedure btnForcarEncerramentoClick(Sender: TObject);
    procedure btnIgnoreFileClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FDirVersao,
    FDirExe,
    FDirBpl,
    FNomeArquivoLog : string;
    lstBplAtualizacao, lstProcessosAbertos : TStringList;
    Registry: TRegistry;
    FStandAlone, FIgnoreFile, FRequerReinicio : boolean;
    procedure CopiaBPLs;
    procedure AtuVersao;
    function MenorData( Arq1, Arq2 : TFileName) : integer;
    Procedure IncProgressBar(sFileName:String);
    function GetDirVersao : string;
    function GetDirBPL : string;
    function GetDirExe : string;
    procedure RemoveBplsSys;
    procedure MataProcesso(sNomeProcesso : string);
    function cmGetSysPath: String;
  public
    { Public declarations }
    procedure Executa;
    function ProcessExists(exeFileName: string): Boolean;
    function SetListaBPLs(lst : TStringList) : boolean;
    procedure VerificaProcessosAbertos;
    procedure InsereProcessoLista(sNomeProcesso : string);
    procedure RemoveProcessoLista(sNomeProcesso : string);
    procedure MostraProcessosAbertos(show : boolean);
    procedure AtualizaAtu;
    function PegaVersaoAtual : string;
    procedure GravaLog(sLog : string; bResetLog : boolean = false);
    procedure MostraArquivoLog;
    function RestartWindows(RebootParam : LongWord) : boolean;
    procedure BroadcastChange;
    procedure RegistraValor(root : dword; caminho : string; chave : string; valor : string; forcarBroadCast : boolean = false);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.DFM}

Uses fProcessosAbertos;

procedure TfrmPrincipal.Executa;

begin
     FIgnoreFile := false;
     lstBplAtualizacao := TStringList.Create;
     lstProcessosAbertos := TStringList.Create;

     FStandAlone := ParamStr(2) = '';

     FDirVersao  := GetDirVersao;

     if FStandAlone then
     begin
        FDirExe := ExtractFilePath(ParamStr(0));
        if UpperCase(Copy(FDirExe, 1, 9)) = '\\ALTARF\' then
        begin
           showMessage('Este aplicativo não pode ser executado a partir do servidor de atualização!' + chr(13) + 'A aplicação será encerrada.');
           Application.Terminate;
           halt(0);
        end;

        FNomeArquivoLog :=  'LogAtuVersao_' + FormatDateTime('YYYYMMDD_HHMMSS', Now) + '.txt';
        GravaLog('Processo stand-alone iniciado');
     end
     else
     begin
        FDirExe := extractfilepath(ParamStr(2));
        FNomeArquivoLog :=  'LogAtuVersao.txt';
        GravaLog('Processo iniciado pelo Planus: ' + ParamStr(2), true);
     end;

     FDirBpl  := GetDirBpl;

     GravaLog('Caminho do atualizador: ' + ParamStr(0));
     GravaLog('Caminho local dos executáveis: ' + FDirExe);
     GravaLog('Diretório de versão: ' + FDirVersao);
     GravaLog('Diretório das BPLs: ' + FDirBpl);


     SetListaBPLs(lstBplAtualizacao);

     LblAtu.Caption := FDirVersao;
     LblAtu.Hint := LblAtu.Caption;
     LblExec.Caption := FDirExe;
     LblExec.Hint := LblExec.Caption;
     LblBpl.Caption := FDirBpl;
     LblBpl.Hint := LblBpl.Caption;

     LblAguarde.Caption := 'Iniciando...';

     GgProgress.MinValue := 0;

     flExe.Directory := FDirExe;
     GgProgress.MaxValue := flexe.Items.Count + lstBplAtualizacao.Count + 35;
     GgProgress.Progress := 0;

     Application.ProcessMessages;
     LblAguarde.Caption := 'Verificando BPLs nas pastas de sistema...';
     GravaLog('Verificando BPLs nas pastas de sistema');
     RemoveBplsSys;

     if not DirectoryExists(FDirExe + '..\ALT\') then
        if CreateDir(FDirExe + '..\ALT\') then
            GravaLog('Pasta ' + FDirExe + '..\ALT\ criada')
        else
            GravaLog('Falha ao criar a pasta ' + FDirExe + '..\ALT\');


     if not DirectoryExists(FDirExe + '..\HELP\') then
        if CreateDir(FDirExe + '..\HELP\') then
            GravaLog('Pasta ' + FDirExe + '..\HELP\ criada')
        else
            GravaLog('Falha ao criar a pasta ' + FDirExe + '..\HELP\');

     LblAguarde.Caption := 'Aguarde. Verificando arquivos abertos...';

     GravaLog('Iniciando a verificação dos processos abertos');

     VerificaProcessosAbertos;

     if mmProcAbertos.Lines.Count = 0 then
     begin
        MostraProcessosAbertos(false);
        GravaLog('Nenhum processo aberto, iniciando atualização');
        AtuVersao;
     end
     else
     begin
        GravaLog('Existem processos abertos, iniciando o timer de monitoramento');
        MostraProcessosAbertos(true);
        tmVerificaProcessos.Enabled := true;
        Application.ProcessMessages;
     end;

end;

procedure TfrmPrincipal.AtuVersao;
var
    lFim : boolean;
    i, FileHandle : integer;
    sArq : string;
    fArquivoNaoEncontrado : boolean;

begin
     fArquivoNaoEncontrado := false;
     LblAguarde.Caption := 'Aguarde. Copiando Arquivos...';
     GravaLog('Verificando arquivos a serem copiados');

     for i := 0 to flexe.Items.Count-1 do
     begin
          IncProgressBar(flExe.Items[i]);

          if not FileExists(FDirVersao + flExe.Items[i]) then
          begin
             fArquivoNaoEncontrado := true;
             GravaLog('O arquivo ' + FDirVersao + flExe.Items[i] + ' não foi encontrado no servidor de atualizações');
          end
          else if not FileExists(FDirExe + flExe.Items[i]) then
          begin
             fArquivoNaoEncontrado := true;
             GravaLog('O arquivo ' + FDirExe + flExe.Items[i] + ' não foi encontrado na pasta local');
          end
          else
          begin
               //Verifica se existe atualização para o AtuVersao
               if MenorData(FDirVersao + extractfilename(ParamStr(0)), FDirExe + extractfilename(ParamStr(0))) > 0 then
               begin
                 GravaLog('Versão do atualizador requer atualização.');
                 GravaLog('Data da versão em uso: ' + DateTimeToStr(FileDateToDateTime(fileage(FDirExe + extractfilename(ParamStr(0))))));
                 GravaLog('Data da versão de produção: ' + DateTimeToStr(FileDateToDateTime(fileage(FDirVersao + extractfilename(ParamStr(0))))));
                  AtualizaAtu;
               end;

               if (uppercase(flExe.Items[i]) <> uppercase(extractfilename(ParamStr(0)))) and (MenorData(FDirVersao + flExe.Items[i], FDirExe + flExe.Items[i]) > 0) then
               begin
                    lFim := false;
                    while not lFim do
                    begin
                         try
                            //Tenta realizar a atualização do arquivo, caso não seja possível, aguarda o encerramento do processo
                            while (not FIgnoreFile) and (not CopyFile(PChar(FDirVersao + flExe.Items[i]), PChar(FDirExe + flExe.Items[i]), false)) do
                            begin
                              GravaLog('Falha ao atualizar. Aguardando encerramento do aplicativo ' + flExe.Items[i]);
                              btnIgnoreFile.Visible := true;
                              LblAguarde.Caption := flExe.Items[i] + ' - Aguardando encerramento do aplicativo...';
                              Application.ProcessMessages;
                              sleep(5000);
                            end;

                            if FIgnoreFile then
                            begin
                                GravaLog(flExe.Items[i] + ' ignorado pelo usuário');
                                FIgnoreFile := false;
                            end
                            else
                                GravaLog(flExe.Items[i] + ' atualizado');

                            btnIgnoreFile.Visible := false;

                            FileHandle := FileOpen(FDirExe + flExe.Items[i], fmOpenWrite);
                            FileSetDate(FileHandle, FileAge(FDirVersao + flExe.Items[i]));
                            FileClose(FileHandle);

                            sArq := Copy(flExe.Items[i],1,length(flExe.Items[i])-3) + 'alt';
                            if FileExists(FDirVersao + '..\ALT\' + sArq) then
                               if CopyFile(PChar(FDirVersao + '..\ALT\' + sArq), PChar(FDirExe + '..\ALT\' + sArq), false) then
                                  GravaLog(sArq + ' atualizado')
                               else
                                  GravaLog('Falha ao atualizar ' + sArq + ' no caminho ' + FDirExe + '..\ALT\');

                            sArq := Copy(flExe.Items[i],1,length(flExe.Items[i])-3) + 'hlp';
                            if FileExists(FDirVersao + '..\HELP\' + sArq) then
                               if CopyFile(PChar(FDirVersao + '..\HELP\' + sArq), PChar(FDirExe + '..\HELP\' + sArq), false) then
                                  GravaLog(sArq + ' atualizado')
                               else
                                  GravaLog('Falha ao atualizar ' + sArq + ' no caminho ' + FDirExe + '..\HELP\');


                            sArq := Copy(flExe.Items[i],1,length(flExe.Items[i])-3) + 'cnt';
                            if FileExists(FDirVersao + '..\HELP\' + sArq) then
                               if CopyFile(PChar(FDirVersao + '..\HELP\' + sArq), PChar(FDirExe + '..\HELP\' + sArq), false) then
                                  GravaLog(sArq + ' atualizado')
                               else
                                  GravaLog('Falha ao atualizar ' + sArq + ' no caminho ' + FDirExe + '..\HELP\');

                            lFim := true;
                         except
                                GravaLog('Falha ao atualizar ' + sArq + ' no caminho ' + FDirExe + '..\HELP\');

                         end;
                    end;
               end;
          end;
     end;

     if fArquivoNaoEncontrado then
        Application.MessageBox(Pchar('Um ou mais arquivos não foram encontrados no caminho de atualização. Favor verificar o arquivo de log.'), CaptionMensagem, Mb_Ok + Mb_IconStop);


     if not FileExists(FDirExe + 'cmtraduz.mld') then
     begin
          IncProgressBar('cmtraduz.mld');

          if not FileExists(FDirVersao + '..\lib\cmtraduz.mld') then
          begin
//             Application.MessageBox(Pchar('O arquivo cmtraduz.mld não foi encontrado no servidor de atualização'),CaptionMensagem,Mb_Ok + Mb_IconStop);
             GravaLog('cmtraduz.mld não encontrado na pasta Lib do servidor de atualização: ' + FDirVersao + '..\lib\');
          end
          else
              GravaLog('cmtraduz.mld atualizado');
              CopyFile(PChar(FDirVersao + 'cmtraduz.mld'), PChar(FDirExe + 'cmtraduz.mld'), false);
     end;

     CopiaBPLs;

     LblAguarde.Caption := 'Registrando bibliotecas...';
     Application.ProcessMessages;

     if ShellExec('regsvr32','msscript.ocx', '', SW_HIDE) then
         GravaLog('Biblioteca msscript.ocx registrada')
     else
         GravaLog('Falha ao registrar biblioteca ');

     if ShellExec('regsvr32','vcfi32.ocx', '', SW_HIDE) then
         GravaLog('Biblioteca vcfi32.ocx registrada')
     else
         GravaLog('Falha ao registrar biblioteca vcfi32.ocx');

     if ShellExec('regsvr32','vcf132.ocx', '', SW_HIDE) then
         GravaLog('Biblioteca vcfi32.ocx registrada')
     else
         GravaLog('Falha ao registrar biblioteca vcfi32.ocx');

     LblAguarde.Caption := 'Bibliotecas registradas';

     GravaLog('Processo finalizado');
     btnFinalizar.Visible := true;
     LblAguarde.Caption := 'Processo de atualização finalizado.';

     if not FStandAlone and not FRequerReinicio then
     begin
        Application.Terminate;
        GravaLog('O múdulo ' + ExtractFileName(ParamStr(2)) + ' será iniciado');
//        ShellExec(ParamStr(2), '' ,'', SW_SHOWNORMAL);
        ShellExecute(0, nil, pchar(ParamStr(2)), nil,nil, SW_SHOWNORMAL);
        GravaLog('Aplicação finalizada!');
        halt(0);
     end;

     if FRequerReinicio then
     begin
        GravaLog('Reinicialização requerida');
        if Application.MessageBox(Pchar('A variável de ambiente CMBPLPath foi atualizada e requer reinicialização do sistema operacional.' + chr(13) + 'Deseja reiniciar agora?'), CaptionMensagem, MB_YESNO + MB_ICONQUESTION) = mrYes then
        begin
           GravaLog('O sistema será reiniciado.');
           RestartWindows(EWX_REBOOT or EWX_FORCE);
        end
        else
           GravaLog('O usuário optou por reiniciar posteriormente.');
     end;


end;


procedure TfrmPrincipal.CopiaBPLs;
var FileHandle : integer;
    i : integer;
    LstFile :TStrings;
begin
     LstFile := TStringList.Create;

     Try
        BuildFileList(FDirVersao + '..\lib\*.bpl', faAnyFile, LstFile);

        For i:=0 To LstFile.Count - 1 Do
        Begin
             IncProgressBar(lstFile[i]);

             try
                if (MenorData(FDirVersao + '..\lib\' + lstFile[i], FDirBpl + lstFile[i]) > 0) then
                begin
                     while (not FIgnoreFile) and (not CopyFile(PChar(FDirVersao + '..\lib\' + lstFile[i]), PChar(FDirBpl + lstFile[i]), false)) do
                     begin
                        GravaLog('Falha ao atualizar ' + lstFile[i]);
                        btnIgnoreFile.Visible := true;
                        LblAguarde.Caption := lstFile[i] + ' - Aguardando encerramento da biblioteca...';
                        Application.ProcessMessages;
                        sleep(5000);
                     end;

                     if FIgnoreFile then
                     begin
                        GravaLog(lstFile[i] + ' ignorada pelo usuário');
                        FIgnoreFile := false;
                     end
                     else
                        GravaLog(lstFile[i] + ' atualizada');

                     btnIgnoreFile.Visible := false;

                     FileHandle := FileOpen(FDirBpl + lstFile[i], fmOpenWrite);
                     FileSetDate(FileHandle, FileAge(FDirVersao + '..\lib\' + lstFile[i]));
                     FileClose(FileHandle);
                end;
             except
                   raise;
             end;
        end;

        BuildFileList(FDirVersao + '..\lib\*.dll',faAnyFile, LstFile);

        For i:=0 To LstFile.Count - 1 Do
        Begin
             IncProgressBar(lstFile[i]);

             try
                if (MenorData(FDirVersao + '..\lib\' + lstFile[i], FDirBpl + lstFile[i]) > 0) then
                begin
                     while (not FIgnoreFile) and (not CopyFile(PChar(FDirVersao + '..\lib\'+ lstFile[i]), PChar(FDirBpl + lstFile[i]), false)) do
                     begin
                        GravaLog('Falha ao atualizar ' + lstFile[i]);
                        btnIgnoreFile.Visible := true;
                        LblAguarde.Caption := lstFile[i] + ' - Aguardando encerramento da biblioteca...';
                        Application.ProcessMessages;
                        sleep(5000);
                     end;

                     if FIgnoreFile then
                     begin
                        GravaLog(lstFile[i] + ' ignorada pelo usuário');
                        FIgnoreFile := false;
                     end
                     else
                        GravaLog(lstFile[i] + ' atualizada');

                     btnIgnoreFile.Visible := false;

                     FileHandle := FileOpen(FDirBpl+lstFile[i], fmOpenWrite);
                     FileSetDate(FileHandle, FileAge(FDirVersao + '..\lib\' + lstFile[i]));
                     FileClose(FileHandle);
                end;
             except
                   raise;
             end;
        end;

        BuildFileList(FDirVersao + '..\lib\*.ocx',faAnyFile, LstFile);

        For i:=0 To LstFile.Count - 1 Do
        Begin
             IncProgressBar(lstFile[i]);

             try
                if (MenorData(FDirVersao +'..\lib\' + lstFile[i], FDirBpl + lstFile[i]) > 0) then
                begin
                     while (not FIgnoreFile) and (not CopyFile(PChar(FDirVersao +'..\lib\' + lstFile[i]), PChar(FDirBpl + lstFile[i]), false)) do
                     begin
                        GravaLog('Falha ao atualizar ' + lstFile[i]);
                        btnIgnoreFile.Visible := true;
                        LblAguarde.Caption := lstFile[i] + ' - Aguardando encerramento da biblioteca...';
                        Application.ProcessMessages;
                        sleep(5000);
                     end;

                     if FIgnoreFile then
                     begin
                        GravaLog(lstFile[i] + ' ignorada pelo usuário');
                        FIgnoreFile := false;
                     end
                     else
                        GravaLog(lstFile[i] + ' atualizada');

                     btnIgnoreFile.Visible := false;
                     
                     FileHandle := FileOpen(FDirBpl + lstFile[i], fmOpenWrite);
                     FileSetDate(FileHandle, FileAge(FDirVersao + '..\lib\' + lstFile[ i]));
                     FileClose(FileHandle);
                end;
             except
                   raise;
             end;
        end;

        IncProgressBar('CmCompo.Alt');

        if FileExists(FDirVersao + '..\ALT\' + 'CMCOMPO.ALT') then
           if CopyFile(PChar(FDirVersao + '..\ALT\' + 'CMCOMPO.ALT'), PChar(FDirExe + '..\ALT\CMCOMPO.ALT'), false) then
             GravaLog('CMCOMPO.ALT atualizado')
           else
             GravaLog('Falha ao atualizar CMCOMPO.ALT');

        IncProgressBar('Regra.Alt');

        if FileExists(FDirVersao + '..\ALT\REGRA.ALT') then
           if CopyFile(PChar(FDirVersao + '..\ALT\REGRA.ALT'), PChar(FDirExe + '..\ALT\REGRA.ALT'), false) then
             GravaLog('REGRA.ALT atualizado.')
           else
             GravaLog('Falha ao atualizar REGRA.ALT');

        IncProgressBar('CobrCm.Alt');

        if FileExists(FDirVersao + '..\ALT\COBRCM.ALT') then
           if CopyFile(PChar(FDirVersao + '..\ALT\COBRCM.ALT'), PChar(FDirExe + '..\ALT\COBRCM.ALT'), false) then
             GravaLog('COBRCM.ALT atualizado.')
           else
             GravaLog('Falha ao atualizar COBRCM.ALT');

        IncProgressBar('CmBack.Alt');

        if FileExists(FDirVersao + '..\ALT\CMBACK.ALT') then
           if CopyFile(PChar(FDirVersao + '..\ALT\CMBACK.ALT'), PChar(FDirExe + '..\ALT\CMBACK.ALT'), false) then
             GravaLog('CMBACK.ALT atualizado.')
           else
             GravaLog('Falha ao atualizar CMBACK.ALT');

        IncProgressBar('Aguarde...');
        LstFile.free;
     except
        LstFile.free;
        Raise;
     end;
end;

Procedure TfrmPrincipal.IncProgressBar(sFileName:String);
Begin
     GgProgress.Progress := GgProgress.Progress + 1;
     Application.ProcessMessages;
     LblAguarde.Caption := sFileName;
     Application.ProcessMessages;
End;

function TfrmPrincipal.cmGetSysPath: String;
var
  lpPath: PChar;
begin
  lpPath := nil;
  try
    GetMem(lpPath, MAX_PATH);
    GetSystemDirectory(lpPath, MAX_PATH);
    Result := StrPas(lpPath);
  finally
    FreeMem(lpPath);
  end;

  GravaLog('As BPLs serão armazenadas na pasta de sistema : ' + result);
end;

procedure TfrmPrincipal.btnFinalizarClick(Sender: TObject);
begin
   GravaLog('Aplicativo finalizado pelo usuário') ;
   close;
end;

function TfrmPrincipal.MenorData( Arq1, Arq2 : TFileName) : integer;
var Data1, Data2 : string;
    Age1, Age2 : integer;
begin
   Age1 := FileAge(Arq1);
   Age2 := FileAge(Arq2);
   if (Age1 < 0) and (Age2 > 0) then
      Result := -1
   else if (Age1 >= 0) and (Age2 < 0) then
      Result := 1
   else  if (Age1 < 0) and (Age2 < 0) then
      Result := 0
   else
   begin
      Data1 := FormatDateTime('yyyymmddhhmm', FileDateToDateTime(Age1));
      Data2 := FormatDateTime('yyyymmddhhmm', FileDateToDateTime(Age2));

      if Data1 < Data2 then
         Result := -1
      else if Data1 > Data2 then
         Result := 1
      else
         Result := 0;
   end;
end;

function TfrmPrincipal.processExists(exeFileName: string): Boolean;

var
   ContinueLoop: BOOL;
   FSnapshotHandle: THandle;
   FProcessEntry32: TProcessEntry32;
begin
   FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
   FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
   ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
   Result := False;

   while Integer(ContinueLoop) <> 0 do
   begin
   if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName)) or
        (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName))) then
    begin
      Result := True;
    end;
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;

  CloseHandle(FSnapshotHandle);
end;

function TfrmPrincipal.GetDirVersao : string;
begin
   if ParamStr(1) <> '' then
      result := extractfilepath(ParamStr(1))
   else
   begin
      Registry := TRegistry.Create;
      Registry.RootKey := HKEY_CURRENT_USER;

      with Registry do
      begin
        OpenKey('Software\CM', True);
        Result := ReadString('Diretorio Versao');

        if Result = '' then
           WriteString('Diretorio Versao', FDirVersaoPadrao)
        else
           if Copy(Result,Length(Result),1) <> '\' then
              Result := Result + '\';
        CloseKey;
      end;

      Registry.free;
   end;

end;

procedure TfrmPrincipal.RegistraValor(root : dword; caminho : string; chave : string; valor : string; forcarBroadCast : boolean = false);
begin
   Registry := TRegistry.Create;
   Registry.RootKey := root;

   with Registry do
   begin
      OpenKey(caminho, True);
      WriteString(chave, valor);
      CloseKey;
      GravaLog('A chave de registro ' + caminho + ' \' + chave + ' foi criada com o valor ' + valor);
   end;

   Registry.free;

end;


function TfrmPrincipal.GetDirBPL : string;
var PathBPL : string;
begin
   if not GetEnvironmentVar('CMBplPath', PathBPL, true ) then
   begin
     GravaLog('Variável de ambiente CMBPLPath não encontrada');
     RegistraValor(HKEY_LOCAL_MACHINE, 'SYSTEM\CurrentControlSet\Control\Session Manager\Environment', 'CMDBPLPATH',  FDirBplPadrao);
//     SetEnvironmentVar('CMBplPath', FDirBplPadrao);
     BroadcastChange;
     PathBPL := FDirBplPadrao;
   end;

   if not DirectoryExists(PathBPL) then
   begin
      CreateDir(PathBPL);
      GravaLog('A pasta  ' + PathBPL + ' não foi encontrada e foi criada');
   end;

   result := PathAddSeparator(PathBPL);
end;

function TfrmPrincipal.GetDirExe : string;
begin
   if ParamStr(2) <> '' then
      result := extractfilepath(ParamStr(2))
   else
      result := ExtractFilePath(ParamStr(0));

   GravaLog('Diretório dos executáveis:' + result);
end;


function TfrmPrincipal.SetListaBPLs(lst : TStringList) : boolean;
Var
   SearchFile: TSearchRec;
   FindResult: Integer;
begin
   FindResult := FindFirst(fDirVersao + '..\lib\*.bpl', faArchive, SearchFile);
   try
      While FindResult = 0 do
      begin
        Application.ProcessMessages;
        lst.Add(SearchFile.Name);
        FindResult := FindNext(SearchFile);
      end;
   finally
      FindClose(SearchFile);
   end;

   FindResult := FindFirst(fDirVersao + '..\lib\*.dll', faArchive, SearchFile);
   try
      While FindResult = 0 do
      begin
        Application.ProcessMessages;
        lst.Add(SearchFile.Name);
        FindResult := FindNext(SearchFile);
      end;
   finally
      FindClose(SearchFile);
   end;

   FindResult := FindFirst(fDirVersao + '..\lib\*.ocx', faArchive, SearchFile);
   try
      While FindResult = 0 do
      begin
        Application.ProcessMessages;
        lst.Add(SearchFile.Name);
        FindResult := FindNext(SearchFile);
      end;
   finally
      FindClose(SearchFile);
   end;

   result := lst.count > 0;

   if result then
       GravaLog('Lista de BPLs criada, ' + inttostr(lst.Count) + ' arquivos encontrados')
   else
       GravaLog('Atenção!! Nenhuma BPL encontrada no caminho de atualização das bibliotecas:' + fDirVersao + '..\lib\');

end;


procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  frmPrincipal.Caption := CaptionMensagem + ' ver. ' + PegaVersaoAtual;
  Panel1.Color := rgb(19,30,43);
  GgProgress.BackColor := rgb(39,50,63);
  MostraProcessosAbertos(false);
end;

procedure TfrmPrincipal.tmVerificaProcessosTimer(Sender: TObject);
begin
  GravaLog('Verificando processos abertos');

  VerificaProcessosAbertos;
  Application.ProcessMessages;

  if mmProcAbertos.Lines.Count = 0 then
  begin
     GravaLog('Nenhum pocesso em execução');
     tmVerificaProcessos.Enabled := false;
     MostraProcessosAbertos(false);
     AtuVersao;
  end
  else
     GravaLog('Foram encontrados ' + inttostr(mmProcAbertos.Lines.Count) + ' processos abertos');

end;

procedure TfrmPrincipal.VerificaProcessosAbertos;
var
  i : integer;
begin
   //Verifica executáveis
   for i := 0 to flExe.Items.Count -1 do
   begin

     if uppercase(flExe.Items[i]) <> uppercase(ExtractFileName(ParamStr(0))) then
        if frmPrincipal.ProcessExists(flExe.Items[i]) then
           InsereProcessoLista(flExe.Items[i])
        else
           RemoveProcessoLista(flExe.Items[i]);
   end;

   //Verifica Bibliotecas
   for i := 0 to lstBplAtualizacao.Count -1 do
      if frmPrincipal.ProcessExists(lstBplAtualizacao.Strings[i]) then
        InsereProcessoLista(lstBplAtualizacao.Strings[i])
      else
        RemoveProcessoLista(lstBplAtualizacao.Strings[i]);
end;

procedure TfrmPrincipal.InsereProcessoLista(sNomeProcesso: string);
begin
  if mmProcAbertos.Lines.IndexOf(sNomeProcesso) = -1 then
  begin
     GravaLog('Aguardando encerramento do processo: ' + sNomeProcesso);
     mmProcAbertos.Lines.Add(sNomeProcesso);
  end;
end;

procedure TfrmPrincipal.RemoveProcessoLista(sNomeProcesso: string);
begin
  if mmProcAbertos.Lines.IndexOf(sNomeProcesso) > -1 then
  begin
     mmProcAbertos.Lines.Delete(mmProcAbertos.Lines.IndexOf(sNomeProcesso));
     GravaLog(sNomeProcesso + ' finalizado');
  end;
end;

procedure TfrmPrincipal.MostraProcessosAbertos(show : boolean);
begin
   btnForcarEncerramento.Visible := show;
   mmProcAbertos.Visible := show;
   lblProcAbertos.Visible := show;
   if show then
   begin
     frmPrincipal.Height := 340;
     btnIgnoreFile.Visible := false;
   end
   else
     frmPrincipal.Height := 240;

end;

procedure TfrmPrincipal.MataProcesso(sNomeProcesso: string);
const
   PROCESS_TERMINATE = $0001;
var
   ContinueLoop: BOOL;
   FSnapshotHandle: THandle;
   FProcessEntry32: TProcessEntry32;
begin
    FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
    ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

    while Integer(ContinueLoop) <> 0 do
    begin
        if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(sNomeProcesso)) or
            (UpperCase(FProcessEntry32.szExeFile) = UpperCase(sNomeProcesso))) then
        begin
             GravaLog('Forçando o desligamento do processo: ' + UpperCase(sNomeProcesso));
             if not TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0), FProcessEntry32.th32ProcessID), 0) then
                GravaLog('A tentativa de finalizar o processo ' + sNomeProcesso + ' falhou');
        end;
        ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
    end;

    CloseHandle(FSnapshotHandle);
end;

procedure TfrmPrincipal.btnForcarEncerramentoClick(Sender: TObject);
var i : integer;
begin
  if Application.MessageBox(Pchar('Forçar o desligamento das tarefas abertas pode ocasionar perda das informações que ainda não foram gravadas no banco de dados. Deseja continuar?'), CaptionMensagem, MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
     GravaLog('Iniciada tentativa de forçar desligamento de processos');

     LblAguarde.Caption := 'Encerrando processos abertos...';
     for i := 0 to mmProcAbertos.Lines.Count do
     begin
        MataProcesso(mmProcAbertos.Lines.Strings[i]);
     end;
  end;

end;

procedure TfrmPrincipal.btnIgnoreFileClick(Sender: TObject);
begin
   FIgnoreFile := true;
   Application.ProcessMessages;
end;

procedure TfrmPrincipal.AtualizaAtu;
var
  ExeName, BackFile : string;
begin
  GravaLog('Iniciando atualização do AtuVersão');

  ExeName := FDirExe + extractfilename(ParamStr(0));
  BackFile := ChangeFileExt(ExeName,'.old');

  if FileExists(BackFile) then
    if DeleteFile(BackFile) then
       GravaLog('arquivo .old excluído')
    else
       GravaLog('Não foi possível excluir arquivo .old');

  if RenameFile(PChar(ExeName), BackFile) then
      GravaLog('Executável do atualizador renomeado para AtuVersaoCM.old')
  else
      GravaLog('Não foi possível renomear o executável do atualizador');

  if CopyFile(Pchar(FDirVersao + extractfilename(ExeName)), PChar(FDirExe + extractfilename(ExeName)), false) then
      GravaLog('AtuVersão atualizado')
  else
      GravaLog('Não foi possível copiar a nova versão do atualizador para a pasta local (' + FDirExe + extractfilename(ExeName) + ')');

  GravaLog('O atualizador será foi iniciado em novo processo');

  WinExec(Pchar(Application.ExeName + ' ' + ParamStr(1) + ' ' + ParamStr(2))  , sw_ShowNormal);
  GravaLog('Encerrando a aplicação atual');

  Application.Terminate;
  Halt(0);
end;

procedure TFrmPrincipal.RemoveBplsSys;
var i, nCountSys, nCountSys64, nCountSysdeletados, nCountSys64Deletados : integer;
begin
  nCountSys := 0;
  nCountSys64 := 0;
  nCountSysDeletados := 0;
  nCountSys64Deletados := 0;

 if DirectoryExists('C:\Windows\SysWOW64') then
 begin
    GravaLog('Verificando arquivos da pasta C:\Windows\SysWOW64 para exclusão');

    for i := 0 to lstBplAtualizacao.Count -1 do
        if (uppercase(copy(lstBplAtualizacao.Strings[i], 1, 2)) = 'CM') and FileExists('C:\Windows\SysWOW64\' + lstBplAtualizacao.Strings[i]) then
        begin
            nCountSys64 := nCountSys64 + 1;
            if DeleteFile('C:\Windows\SysWOW64\' + lstBplAtualizacao.Strings[i]) then
            begin
                GravaLog(lstBplAtualizacao.Strings[i] + ' excluído');
                nCountSys64Deletados := nCountSys64Deletados + 1;
            end
            else
                GravaLog('Não foi possível excluir o arquivo ' + lstBplAtualizacao.Strings[i]);
        end;
    GravaLog('Total de arquivos encontrados em C:\Windows\SysWOW64\: ' + inttostr(nCountSys64));
    GravaLog('Total de arquivos exlcuídos em C:\Windows\SysWOW64\: ' + inttostr(nCountSys64Deletados));
 end;

 GravaLog('Verificando arquivos da pasta C:\Windows\Ssystem32 para exclusão');

 for i := 0 to lstBplAtualizacao.Count -1 do
    if (uppercase(copy(lstBplAtualizacao.Strings[i], 1, 2)) = 'CM') and FileExists('C:\Windows\System32\' + lstBplAtualizacao.Strings[i]) then
    begin
        nCountSys := nCountSys + 1;
        if DeleteFile('C:\Windows\System32\' + lstBplAtualizacao.Strings[i]) then
        begin
            GravaLog(lstBplAtualizacao.Strings[i] + ' excluído');
            nCountSysDeletados := nCountSysDeletados + 1;
        end
        else
           GravaLog('Não foi possível excluir o arquivo ' + lstBplAtualizacao.Strings[i]);
    end;
    GravaLog('Total de arquivos encontrados em C:\Windows\System32\: ' + inttostr(nCountSys));
    GravaLog('Total de arquivos exlcuídos em C:\Windows\System32\: ' + inttostr(nCountSysDeletados));
end;

function TfrmPrincipal.PegaVersaoAtual: string;
var
  VerInfoSize: DWORD;
  VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
  Dummy: DWORD;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    Result := IntToStr(dwFileVersionMS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
    Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
    Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
//  GravaLog('Versão atual do aplicativo: ' + result);
end;

procedure TfrmPrincipal.BroadcastChange;
var
    lParam, wParam : Integer;
    Buf     : Array[0..10] of Char;
    aResult : Cardinal;
begin
     Buf := 'Environment';
     wParam := 0;
     lParam := Integer(@Buf[0]);

//WM_SETTINGCHANGE
     SendMessageTimeout(HWND_BROADCAST , WM_SETTINGCHANGE , wParam, lParam, SMTO_ABORTIFHUNG, 10000, aResult);

     if aResult <> 0 then
     begin
        GravaLog('Não foi possível enviar mensagem broadcast para o sistema. O Windows precisa ser reiniciado manualmente para que as variáveis de ambiente sejam atualizadas');
        FRequerReinicio := true;
     end
     else
          GravaLog('As variáveis de ambiente foram atualizadas via Broadcast Message');

end;

procedure TfrmPrincipal.GravaLog(sLog : string; bResetLog : boolean = false);
var
  arqLog : TextFile;
begin
  if not DirectoryExists(FDirExe + '\LogAtuVersao') then
    CreateDir(FDirExe + '\LogAtuVersao');

  AssignFile(arqLog, FDirExe + '\LogAtuVersao\' + FNomeArquivoLog);
  if not FileExists(FDirExe + '\LogAtuVersao\' + FNomeArquivoLog) or bResetLog then
      ReWrite(arqLog)
  else
      append(arqLog);

  WriteLn(arqLog, datetimetostr(Now) + char(9) + sLog);
  CloseFile(arqLog);
end;




procedure TfrmPrincipal.MostraArquivoLog;
var
  arqLog : TextFile;
  sLinha : string;
begin
  AssignFile(arqLog, FDirExe + '\LogAtuVersao\' + 'LogAtuVersao.txt');
  Reset(arqLog);

  while not Eof(arqLog) do
    ReadLn(arqLog, sLinha);

  CloseFile(arqLog);
end;



function TfrmPrincipal.RestartWindows(RebootParam: LongWord): boolean;
var
  TTokenHd: THandle; 
  TTokenPvg: TTokenPrivileges;
  cbtpPrevious: DWORD; 
  rTTokenPvg: TTokenPrivileges;
  pcbtpPreviousRequired: DWORD; 
  tpResult: Boolean;
const 
  SE_SHUTDOWN_NAME = 'SeShutdownPrivilege'; 
begin 
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin 
    tpResult := OpenProcessToken(GetCurrentProcess(), 
      TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY,
      TTokenHd);
    if tpResult then
    begin
      tpResult := LookupPrivilegeValue(nil, SE_SHUTDOWN_NAME, TTokenPvg.Privileges[0].Luid);
      TTokenPvg.PrivilegeCount := 1;
      TTokenPvg.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
      cbtpPrevious := SizeOf(rTTokenPvg);
      pcbtpPreviousRequired := 0;
      if tpResult then
        Windows.AdjustTokenPrivileges(TTokenHd,
                                      False, 
                                      TTokenPvg,
                                      cbtpPrevious,
                                      rTTokenPvg, 
                                      pcbtpPreviousRequired); 
    end; 
  end;
  Result := ExitWindowsEx(RebootParam, 0); 
end;

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  freeandNil(tmVerificaProcessos);
  freeandnil(frmPrincipal);
  freeandnil(lstBplAtualizacao);
  freeandnil(lstProcessosAbertos);
  Application.Terminate;
end;

end.
