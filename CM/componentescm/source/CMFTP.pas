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
unit CMFTP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdFTP;

type
  TCMFTP = class(TIdFTP)
  private
  protected
  public
    function PutFile(const ASourceFile: string): Boolean;
    function Connect: Boolean; reintroduce;
    function Disconnect: Boolean; reintroduce;
  published
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('CM Standard', [TCMFTP]);
end;

{ TCMFTP }

function TCMFTP.Connect: Boolean;
begin
  inherited Connect;
  Result := Connected;
end;

function TCMFTP.Disconnect: Boolean;
begin
  inherited Disconnect;
  Result := not Connected;
end;

function TCMFTP.PutFile(const ASourceFile: string): Boolean;
var
  LocalFileSize, RemoteFileSize: Integer;
  LocalFile: THandle;
  sDir : string;
begin
  Result := False;
  LocalFile := INVALID_HANDLE_VALUE;
  Put(ASourceFile, ExtractFileName(ASourceFile));
  if FileExists(ASourceFile) then
    LocalFile := CreateFile(PChar(ASourceFile), GENERIC_READ, FILE_SHARE_DELETE
                   or FILE_SHARE_READ or FILE_SHARE_WRITE, nil,
                   OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL or FILE_FLAG_SEQUENTIAL_SCAN, 0);
  if LocalFile <> INVALID_HANDLE_VALUE then
  begin
    LocalFileSize := GetFileSize(LocalFile, nil);
    sDir := RetrieveCurrentDir;
    if (Trim(sDir) <> '') and (AnsiLastChar(sDir)^ <> '/') then
      sDir := sDir + '/';
    RemoteFileSize := Size(sDir + ExtractFileName(ASourceFile));
    Result := Abs(RemoteFileSize - LocalFileSize) < 5;
    CloseHandle(LocalFile);
  end;
end;

end.
