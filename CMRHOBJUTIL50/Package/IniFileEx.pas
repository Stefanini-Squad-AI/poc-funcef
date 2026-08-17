unit IniFileEx;

interface

uses Windows, IniFiles;

type
  TIniFileEx = class(TIniFile)
  public
    function ReadString(const Section, Ident, Default: string): string; override;
  end;

implementation

function TIniFileEx.ReadString(const Section, Ident, Default: string): string;
var
  Buffer: array[0..2047*3] of Char;
begin
  SetString(Result, Buffer, GetPrivateProfileString(PChar(Section),
    PChar(Ident), PChar(Default), Buffer, SizeOf(Buffer), PChar(FileName)));
end;

end.
