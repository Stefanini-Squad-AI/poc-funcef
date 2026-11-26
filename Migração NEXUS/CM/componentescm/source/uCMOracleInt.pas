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
unit uCMOracleInt;

interface

uses
  Classes, Windows, SysUtils, Registry, FSM_WINAPILib , FSM_FxLib;

Type
  TCMOracleInt = class

  public
     class function GetOCIVersion: Integer;
     class function GetTnsNamesPath: string;
     class procedure AddAlias(const name, Host, PORT, Sid: string; Overrite: Boolean);
  End;

implementation

class function TCMOracleInt.GetOCIVersion: Integer;
var
  OciDll, OracleHome, strVer, S: string; 
  I                            : Integer;
begin
  with TRegistry.Create do
    try
      RootKey := HKEY_LOCAL_MACHINE;
      {$IFDEF VER130}
      OpenKeyReadOnly('SOFTWARE\ORACLE');
      {$ELSE}
      OpenKey('SOFTWARE\ORACLE', False);
      {$ENDIF}
      OracleHome := IncludeTrailingBackslash(ReadString('ORACLE_HOME'));
      if OracleHome = '\' then
        {$IFDEF VER130}
        if OpenKeyReadOnly('All_Homes') then
          {$ELSE}
          if OpenKey('All_Homes', False) then
            {$ENDIF}
          begin
            S := ReadString('LAST_HOME');
            if S = '' then
              S := '0';
            CloseKey;
            {$IFDEF VER130}
            if OpenKeyReadOnly('SOFTWARE\ORACLE\Home' + S) then
              {$ELSE}
              if OpenKey('SOFTWARE\ORACLE\Home' + S, False) then
                {$ENDIF}
                OracleHome := IncludeTrailingBackslash(ReadString('ORACLE_HOME'));
          end else
          begin
            Result := -1;
            Exit;
          end;
      OciDll := ReadString('ORAOCI');
      if OciDll = '' then
        OciDll := OracleHome + 'Bin\OCI.DLL';
      // single case, than things differs - 8.0.3
      if not FileExists(OciDll) then
        OciDll := OracleHome + 'Bin\ORA803.DLL';
      CloseKey;
    finally
      Free;
    end;
  strVer := GetFileVersion(OciDll);
  Result := 0;
  for I := 1 to Length(strVer) do
    if (strVer[I] in ['0'..'9']) and ((Result * 10) < 1000) then
      Result := (Result * 10) + StrToInt(strVer[I]);
end;

class function TCMOracleInt.GetTnsNamesPath: string;
var
  S: string;
begin
  with TRegistry.Create do
    try
      RootKey := HKEY_LOCAL_MACHINE;
      {$IFDEF VER130}
      OpenKeyReadOnly('SOFTWARE\ORACLE');
      {$ELSE}
      OpenKey('SOFTWARE\ORACLE', False);
      {$ENDIF}
      Result := ReadString('NET80');
      if Result = '' then
        Result := ReadString('NET20');
      if Result = '' then
        Result := ReadString('ORACLE_HOME');
      if Result = '' then
      begin
        {$IFDEF VER130}
        if OpenKeyReadOnly('All_Homes') then
          {$ELSE}
          if OpenKey('All_Homes', False) then
            {$ENDIF}
          begin
            S := ReadString('LAST_HOME');
            if S = '' then
              S := '0';
            CloseKey;
            {$IFDEF VER130}
            if OpenKeyReadOnly('SOFTWARE\ORACLE\Home' + S) then
              {$ELSE}
              if OpenKey('SOFTWARE\ORACLE\Home' + S, False) then
                {$ENDIF}
                Result := ReadString('ORACLE_HOME') + '\network';
          end else
            Result := '';
      end else
        if GetOCIVersion >= 810 then
          Result := Result + '\network';
      
      Result := Result + '\admin\tnsnames.ora';
      CloseKey;
    finally
      Free;
    end;
end;

class procedure TCMOracleInt.AddAlias(const name, Host, PORT, Sid: string; Overrite: Boolean);
var
  sFileTnsName  : string;
  iLinhaAlias, X: Integer;
  lFileTnsName :Tstrings;
begin
  sFileTnsName := GetTnsNamesPath;
  lFileTnsName := TStringList.Create;
  with lFileTnsName do
    try
      if FileExists(sFileTnsName) then
      begin
        LOADFROMFILE(sFileTnsName);

        iLinhaAlias := -1;

        for X := 0 to Count - 1 do
          if Pos(UpperCase(name) + '.WORLD',UpperCase(lFileTnsName[X])) <> 0 then
          begin
            iLinhaAlias := X;
            break;
          end;

        if (iLinhaAlias < 0) or Overrite then
        begin
          if (iLinhaAlias > 0) And Overrite then
          begin
            repeat
              Delete(iLinhaAlias);
            until ((Count = (iLinhaAlias)) Or (Pos('.WORLD',UpperCase(lFileTnsName[iLinhaAlias])) > 0));
          end;

          Append('');
          Append(UpperCase(name) + '.WORLD =');
          Append('  (DESCRIPTION =');
          Append('    (ADDRESS = (PROTOCOL = TCP)(HOST = ' + UpperCase(Host) + ')(PORT = ' + UpperCase(PORT) + '))');
          Append('    (CONNECT_DATA = (SID = ' + UpperCase(Sid) + '))');
          Append('  )        ');
          SaveToFile(sFileTnsName);
        end
      end
      else
      begin
        MsgError('Não foi possível definir a conexão padrão com o Banco de Dados!'#13#10'Arquivo TnsNames.ora não encontrado.'#13#10'Este aplicativo será encerrado!');
        Halt;
      end;
    finally
      Free;
    end;
end;

end.

