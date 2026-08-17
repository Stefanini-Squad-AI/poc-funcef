unit FSM_DelphiLib;

{****************************************************************************}
{*                                                                          *}
{*    ***  Biblioteca de Configuração e Informações sobre o Delphi  ***     *}
{*                     ---------------------------                          *}
{*                     Criada por Fábio S Monteiro                          *}
{*                          ©  Copyright  1999                              *}
{*                     Data de Criação:    07/Out/1999                      *}
{*                     Ultima modificação: 10/Out/1999                      *}
{*                                                                          *}
{*              ***  Delphi's Config and Info Library ***                   *}
{*                     ---------------------------                          *}
{*                     Created by Fábio S Monteiro                          *}
{*                          ©  Copyright  1999                              *}
{*                     Creation :     07/Oct/1999                           *}
{*                     Last Modified: 10/Oct/1999                           *}
{*                                                                          *}
{****************************************************************************}

interface

uses
  Windows, Classes;

{$I FSM.inc}

type
  TFSMDelphiInfo = record
    Version : string;
    IntVersion : Integer;
    FloatVersion : Single;
    StrVersion : string;
    BuildNumber : Integer;
    ExePath : string;
    RootDir : string;
    BinDir  : string;
    LibSearchPath : string;
  end;

  {$IFNDEF FSM4}
   PFSMDelphiInfo = ^TFSMDelphiInfo;
  {$ENDIF}

procedure AddLibSearchPath(const DelphiIndex : Integer; APath: string);
procedure AddPackage(const DelphiIndex : Integer; APath, ADesc: string);
procedure RemovePackage(const DelphiIndex : Integer; AFileName: string);

const
  sHKEY_DELPHI_ROOT = '\Software\Borland\Delphi\';
  DMacro = '$(DELPHI)';

var
{$IFDEF FSM4}
  FSMDelphiInformations : array of TFSMDelphiInfo;
{$ELSE}
  FSMDelphiInformations : TList;
{$ENDIF}

implementation

uses
  Registry, SysUtils, FSM_WINAPILIB, FSM_FxLib;

function TranslateDelphiPath(const APath, DRoot : string; PutMacroBack : Boolean{$IFDEF FSM4} = False{$ENDIF}): string;
var
  PosBackSlash : integer;
begin
  Result := APath;
  PosBackSlash := Pos('\\', Result);
  while PosBackSlash > 0 do
  begin
    Delete(Result, PosBackSlash, 1);
    PosBackSlash := Pos('\\', Result);
  end;
  if PutMacroBack then
    Result := StrExchange(Result, DRoot, DMacro)
  else
    Result := StrExchange(Result, DMacro, DRoot);
end;


function FillFSMDelphiInfo(var AFSMDelphiInfo : TFSMDelphiInfo): Boolean;
var
  TmpStr : string;
begin
  Result := True;
  with TRegistry.Create, AFSMDelphiInfo do
    try
      RootKey := HKEY_LOCAL_MACHINE;
      {$IFDEF FSM4}
        if OpenKeyReadOnly(sHKEY_DELPHI_ROOT + AFSMDelphiInfo.Version) then
      {$ELSE}
        if OpenKey(sHKEY_DELPHI_ROOT + AFSMDelphiInfo.Version, False) then
      {$ENDIF}
      begin
        if ValueExists('RootDir') then
          RootDir := ReadString('RootDir')
        else
          Result := False;
        try
          FloatVersion := StrToFloatS(AFSMDelphiInfo.Version);
        except
          FloatVersion := -1.0;
          Result := False;
        end;
        IntVersion := Trunc(FloatVersion);
        TmpStr := 'Delphi '+ IntToStr(IntVersion);
        if ValueExists(TmpStr) then
          ExePath := TranslateDelphiPath(ReadString(TmpStr), AFSMDelphiInfo.RootDir{$IFNDEF FSM4}, False{$ENDIF})
        else
        begin
          TmpStr := 'App';
          if ValueExists(TmpStr) then
            ExePath := TranslateDelphiPath(ReadString(TmpStr), AFSMDelphiInfo.RootDir{$IFNDEF FSM4}, False{$ENDIF})
          else
          begin
            TmpStr := 'Delphi ' + FloatToStrf(FloatVersion, ffNumber, 10, 1);
            if ValueExists(TmpStr) then
              ExePath := TranslateDelphiPath(ReadString(TmpStr), AFSMDelphiInfo.RootDir{$IFNDEF FSM4}, False{$ENDIF})
            else
              Result := False;
          end;
        end;
        if not(FileExists(ExePath)) then
          Result := False;
        if Result then
        begin
          StrVersion := 'Delphi ' + FloatToStrf(FloatVersion, ffNumber, 10, 1) +
                        ' (Build ' + Copy(GetFileVersion(ExePath), 5, MaxInt) + ')';
          BuildNumber := StrToInt(StrExchange(Copy(GetFileVersion(ExePath), 5, MaxInt), '.',''));
        end;
        BinDir := ExtractFileDir(ExePath);
        if IntVersion >= 4 then
          TmpStr := 'Search Path'
        else
          TmpStr := 'SearchPath';
        RootKey := HKEY_CURRENT_USER;
      {$IFDEF FSM4}
        if OpenKeyReadOnly(sHKEY_DELPHI_ROOT + AFSMDelphiInfo.Version + '\Library') then
      {$ELSE}
        if OpenKey(sHKEY_DELPHI_ROOT + AFSMDelphiInfo.Version + '\Library', False) then
      {$ENDIF}
        begin
          LibSearchPath := ReadString(TmpStr);
        end else
          Result := False;
      end;
    finally
      Free;
    end;
end;

procedure InitFSMDelphiInformations;
var
  Reg : TRegistry;
  i, LastIn   : Integer;
  TempVers : TStrings;
  {$IFDEF FSM4}
  TmpFSMDelphiInfo : TFSMDelphiInfo;
  {$ELSE}
  TmpFSMDelphiInfo : PFSMDelphiInfo;
  {$ENDIF}
begin
  Reg := TRegistry.Create;
  TempVers := TStringList.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    LastIn := 0;
    {$IFDEF FSM4}
      if Reg.OpenKeyReadOnly(sHKEY_DELPHI_ROOT) then
    {$ELSE}
      if Reg.OpenKey(sHKEY_DELPHI_ROOT, False) then
    {$ENDIF}
    begin
      Reg.GetKeyNames(TempVers);
      {$IFDEF FSM4}
        SetLength(FSMDelphiInformations, TempVers.Count);
      {$ELSE}
        FSMDelphiInformations := TList.Create;
      {$ENDIF}
      for i := 0 to Pred(TempVers.Count) do
      begin
       {$IFDEF FSM4}
        TmpFSMDelphiInfo.Version := TempVers.Strings[i];
        if FillFSMDelphiInfo(TmpFSMDelphiInfo) then
        begin
          FSMDelphiInformations[LastIn] := TmpFSMDelphiInfo;
          Inc(LastIn);
        end;
      {$ELSE}
        New(TmpFSMDelphiInfo);
        TmpFSMDelphiInfo^.Version := TempVers.Strings[i];
        if FillFSMDelphiInfo(TmpFSMDelphiInfo^) then
          FSMDelphiInformations.Add(TmpFSMDelphiInfo);
      {$ENDIF}
      end;
    end;
    {$IFDEF FSM4}
      SetLength(FSMDelphiInformations, LastIn);
    {$ELSE}
      FSMDelphiInformations.Pack;
    {$ENDIF}
  finally
    Reg.Free;
    TempVers.Free;
  end;
end;

{    Public Procedures and Functions    }
procedure AddLibSearchPath(const DelphiIndex : Integer; APath: string);
var
  TempPath : string;
begin
  {$IFDEF FSM4}
  TempPath := Trim(FSMDelphiInformations[DelphiIndex].LibSearchPath);
  {$ELSE}
  TempPath := Trim(PFSMDelphiInfo(FSMDelphiInformations.Items[DelphiIndex])^.LibSearchPath);
  {$ENDIF}
  if TempPath[Length(TempPath)] <> ';' then
    TempPath := TempPath + ';' + Trim(APath)
  else
    TempPath := TempPath + Trim(APath);
  with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      {$IFDEF FSM4}
      if OpenKey(sHKEY_DELPHI_ROOT + FSMDelphiInformations[DelphiIndex].Version + '\Library', False) then
      {$ELSE}
      if OpenKey(sHKEY_DELPHI_ROOT + PFSMDelphiInfo(FSMDelphiInformations.Items[DelphiIndex])^.Version + '\Library', False) then
      {$ENDIF}
      begin
        {$IFDEF FSM4}
        if FSMDelphiInformations[DelphiIndex].IntVersion >= 4 then
        {$ELSE}
        if PFSMDelphiInfo(FSMDelphiInformations.Items[DelphiIndex])^.IntVersion >= 4 then
        {$ENDIF}
        begin
          {$IFDEF FSM4}
          TempPath := TranslateDelphiPath(TempPath, FSMDelphiInformations[DelphiIndex].RootDir, True);
          {$ELSE}
          TempPath := TranslateDelphiPath(TempPath, PFSMDelphiInfo(FSMDelphiInformations.Items[DelphiIndex])^.RootDir, True);
          {$ENDIF}
          WriteString('Search Path', TempPath);
        end else
        begin
          {$IFDEF FSM4}
          TempPath := TranslateDelphiPath(TempPath, FSMDelphiInformations[DelphiIndex].RootDir);
          {$ELSE}
          TempPath := TranslateDelphiPath(TempPath, PFSMDelphiInfo(FSMDelphiInformations.Items[DelphiIndex])^.RootDir, False);
          {$ENDIF}
          WriteString('SearchPath', TempPath);
        end;
        CloseKey;
      end;
    finally
      Free;
    end;
  {$IFDEF FSM4}
  FSMDelphiInformations[DelphiIndex].LibSearchPath := TempPath;
  {$ELSE}
  PFSMDelphiInfo(FSMDelphiInformations.Items[DelphiIndex])^.LibSearchPath := TempPath;
  {$ENDIF}
end;

procedure AddPackage(const DelphiIndex : Integer; APath, ADesc: string);
begin
  if (DelphiIndex < 0) or (DelphiIndex >= {$IFDEF FSM4}Length(FSMDelphiInformations)
                          {$ELSE} FSMDelphiInformations.Count {$ENDIF}) then Exit;
  RemovePackage(DelphiIndex, APath);
  with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      {$IFDEF FSM4}
      if OpenKey(sHKEY_DELPHI_ROOT + FSMDelphiInformations[DelphiIndex].Version + '\Known Packages', True) then
      {$ELSE}
      if OpenKey(sHKEY_DELPHI_ROOT + PFSMDelphiInfo(FSMDelphiInformations.Items[DelphiIndex])^.Version + '\Known Packages', True) then
      {$ENDIF}
      begin
        WriteString(APath, ADesc);
        CloseKey;
      end
    finally
      Free;
    end;
end;

procedure RemovePackage(const DelphiIndex : Integer; AFileName: string);
var
  TempPkgs : TStrings;
  i        : Integer;
  InstaledFile, FileToRemove: string;
begin
  TempPkgs := TStringList.Create;
  with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      {$IFDEF FSM4}
      if OpenKey(sHKEY_DELPHI_ROOT + FSMDelphiInformations[DelphiIndex].Version + '\Known Packages', False) then
      {$ELSE}
      if OpenKey(sHKEY_DELPHI_ROOT + PFSMDelphiInfo(FSMDelphiInformations.Items[DelphiIndex])^.Version + '\Known Packages', False) then
      {$ENDIF}
      begin
        FileToRemove := ExtractFileName(AFileName);
        GetValueNames(TempPkgs);
        for i := 0 to Pred(TempPkgs.Count) do
        begin
          InstaledFile := ExtractFileName(TempPkgs[i]);
          if CompareText(FileToRemove, InstaledFile) = 0 then
          begin
            DeleteValue(TempPkgs[i]);
            Break;
          end;
        end;
        CloseKey;
      end;
      {$IFDEF FSM4}
      if OpenKey(sHKEY_DELPHI_ROOT + FSMDelphiInformations[DelphiIndex].Version + '\Disabled Packages', False) then
      {$ELSE}
      if OpenKey(sHKEY_DELPHI_ROOT + PFSMDelphiInfo(FSMDelphiInformations.Items[DelphiIndex])^.Version + '\Disabled Packages', False) then
      {$ENDIF}
      begin
        FileToRemove := ExtractFileName(AFileName);
        GetValueNames(TempPkgs);
        for i := 0 to Pred(TempPkgs.Count) do
        begin
          InstaledFile := ExtractFileName(TempPkgs[i]);
          if CompareText(FileToRemove, InstaledFile) = 0 then
          begin
            DeleteValue(TempPkgs[i]);
            Break;
          end;
        end;
        CloseKey;
      end
   finally
     Free;
     TempPkgs.Free;
   end;
end;


initialization
  InitFSMDelphiInformations;

finalization
{$IFDEF FSM4}
  SetLength(FSMDelphiInformations, 0);
{$ELSE}
  FSMDelphiInformations.Free;
{$ENDIF}

end.

