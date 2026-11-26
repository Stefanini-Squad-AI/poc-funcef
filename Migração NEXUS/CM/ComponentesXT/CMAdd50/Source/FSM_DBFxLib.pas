unit FSM_DbFxLib;

{****************************************************************************}
{*                                                                          *}
{*           ***  Biblioteca de Funções para Banco de Dados  ***            *}
{*              -----------------------------------------------             *}
{*                       Criada por Fábio S Monteiro                        *}
{*                            ©  Copyright  1999                            *}
{*                       Data de Criação:    19/Fev/1999                    *}
{*                       Ultima modificação: 14/Jan/2000                    *}
{*                                                                          *}
{*                   ***  DataBase Functions Library  ***                   *}
{*                   ----------------------------------                     *}
{*                       Created by Fábio S Monteiro                        *}
{*                            ©  Copyright  1999                            *}
{*                       Creation :     19/Feb/1999                         *}
{*                       Last Modified: 14/Jan/2000                         *}
{*                                                                          *}
{****************************************************************************}


interface

uses
  Forms, DB, DBTables, Controls, SysUtils, FSM_FxLib, FSMConsts;

type
  TSqlServer = (ssDB2, ssInterbase, ssMsSqlServer, ssOracle, ssSybase, ssJasmine,
                ssMySQL, ssInformix, ssIngres, ssSQLAnywhere);

function AnsiQuotedStrField(AValue : string; AFieldType : TFieldType; AQuote : char {$IFNDEF VER100} = '''' {$ENDIF}): string;
function CloseDataSet(DataSet: TDataSet; IfEditingPost: Boolean {$IFNDEF VER100} = True {$ENDIF}): Boolean;
procedure ConfirmQueryCancel(Qry : TQuery);
function CreateDataSetFilter(const AField : string; AValues : array of string; AFieldType : TFieldType {$IFNDEF VER100} = ftString{$ENDIF}; AStrQuote : char {$IFNDEF VER100} = '''' {$ENDIF}) : string;
function CreateSQLConditionFieldInValues(const AField : string; AValues : array of string) : string;
function GetServerDate(ADBName : string; Server : TSqlServer) : TDateTime;
function HandleEditError(DataSet: TDataSet): Boolean;
function OpenQuery(Qry: TQuery; IsRequestLive: Boolean {$IFNDEF VER100} = False {$ENDIF}): Boolean;
function RefreshQuery(Qry: TQuery; AField: string {$IFNDEF VER100} = '' {$ENDIF}): Boolean;


implementation

function AnsiQuotedStrField(AValue : string; AFieldType : TFieldType; AQuote : char {$IFNDEF VER100} = '''' {$ENDIF}): string;
begin
  if AFieldType = ftString then
    Result := AnsiQuotedStr(AValue, AQuote)
  else
    Result := AValue;
end;

function CloseDataSet(DataSet: TDataSet; IfEditingPost: Boolean {$IFNDEF VER100} = True {$ENDIF}): Boolean;
begin
  Result := True;
  with DataSet do
  begin
    if not (Active) then
      Exit;
    if (State in dsEditModes) then
      UpdateRecord;
    if Modified then
      if IfEditingPost then
        Post
      else
        Cancel;
    Close;
    if Active then
      Result := False;
  end;
end;

procedure ConfirmQueryCancel(Qry : TQuery);
begin
  if (Qry.State in dsEditModes) or (Qry.UpdatesPending) then
  begin
    if (Qry.State in dsEditModes) then
      Qry.UpdateRecord;
    if (Qry.Modified) or (Qry.UpdatesPending) then
    begin
      case MsgConfirmCancel(sConfirmPost) of
        mrYes:
        begin
          if (Qry.State in dsEditModes) then
            Qry.Post;
          if (Qry.UpdatesPending) then
            Qry.ApplyUpdates;
        end;
        mrNo: Qry.Cancel;
        else SysUtils.Abort;
      end;
    end else
      Qry.Cancel;
  end;

end;
function CreateSQLConditionFieldInValues(const AField : string; AValues : array of string) : string;
var
  I : Integer;
begin
  {$IFNDEF VER100}
  if Length(AValues) > 0 then
  {$ELSE}
  if High(AValues) > 0 then
  {$ENDIF}
  begin
    Result := AField + ' IN (' +  QuotedStr(AValues[0]);
    for I := 1 to High(AValues) do
      Result := Result + ',' + QuotedStr(AValues[I]);
    Result := Result + ') ';
  end else
    Result := ''
end;

function CreateDataSetFilter(const AField : string; AValues : array of string; AFieldType : TFieldType {$IFNDEF VER100} = ftString {$ENDIF}; AStrQuote : char {$IFNDEF VER100} = '''' {$ENDIF}) : string;
var
  I : Integer;
begin
  {$IFNDEF VER100}
  if Length(AValues) > 0 then
  {$ELSE}
  if High(AValues) > 0 then
  {$ENDIF}
  begin
    Result := '(' + AField + ' = ' +  AnsiQuotedStrField(AValues[0], AFieldType, AStrQuote) + ')';
    for I := 1 to High(AValues) do
      Result := Result + ' or (' + AField + ' = ' + AnsiQuotedStrField(AValues[I], AFieldType, AStrQuote) + ')';
  end else
    Result := ''
end;

function GetServerDate(ADBName : string; Server : TSqlServer) : TDateTime;
begin
  with TQuery.Create(Application) do
    try
      DatabaseName := ADBName;
      case Server of
        ssDB2        : SQL.Add('SELECT CURRDATE()');
        ssInterbase  : SQL.Add('SELECT CURRDATE()');
        ssMsSqlServer: SQL.Add('SELECT GETDATE()');
        ssOracle     : SQL.Add('SELECT SYSDATE FROM dual');
        ssSybase     : SQL.Add('SELECT GETDATE()');
        ssJasmine    : SQL.Add('SELECT CURRENTDATE()');
        ssMySQL      : SQL.Add('SELECT CURRENTDATE()');
        ssInformix   : SQL.Add('SELECT CURRENTDATE()');
        ssIngres     : SQL.Add('SELECT CURRENTDATE()');
        ssSQLAnywhere: SQL.Add('SELECT CURRENTDATE()');
      end;
      Open;
      Result := Fields[0].AsDateTime;
      Close;
    finally
      Free;
    end;
end;

function HandleEditError(DataSet: TDataSet): Boolean;
var
  Pnt_Bkm: TBookmark;
begin
  Result := False;
  Pnt_Bkm := DataSet.GetBookmark;
  try
    DataSet.CLOSE;
    DataSet.OPEN;
    if DataSet.BookmarkValid(Pnt_Bkm) then
    begin
      DataSet.GotoBookmark(Pnt_Bkm);
      Result := True;
    end;
  finally
    DataSet.FreeBookmark(Pnt_Bkm);
  end;
end;

function OpenQuery(Qry: TQuery; IsRequestLive: Boolean {$IFNDEF VER100} = False {$ENDIF}): Boolean;
begin
  try
    try
      if Qry.Active then
        Qry.CLOSE;
      Qry.RequestLive := IsRequestLive;
      Qry.OPEN;
    except
    end;
  finally
    Result := Qry.Active;
  end;
end;
function RefreshQuery(Qry: TQuery; AField: string {$IFNDEF VER100} = '' {$ENDIF}): Boolean;
var
  Str_SearchValue: string;
  Bol_CanSearch  : Boolean;
begin
  SCREEN.Cursor := crSQLWait;
  Result := False;
  try
    if Qry.FindField(AField) <> nil then
    begin
      Bol_CanSearch := True;
      case Qry.FieldByName(AField).DataType of
        ftInteger, ftWord,
          ftSmallint, ftAutoInc : Str_SearchValue := IntToStr(Qry.FieldByName(AField).AsInteger);
        ftFloat, ftCurrency     : Str_SearchValue := FloatToStr(Qry.FieldByName(AField).AsFloat);
        ftString                : Str_SearchValue := Qry.FieldByName(AField).AsString;
        ftDate, ftDateTime      : Str_SearchValue := DateTimeToStr(Qry.FieldByName(AField).AsDateTime);
        else Bol_CanSearch := False;
      end;
    end else
      Bol_CanSearch := False;
    Qry.DisableControls;
    Qry.CLOSE;
    Qry.OPEN;
    if Bol_CanSearch then
    begin
      if Qry.Locate(AField, Str_SearchValue,[]) then
        Result := True;
    end else
    begin
      Qry.Last;
      Result := True;
    end;
  finally
    Qry.EnableControls;
    SCREEN.Cursor := crDefault;
  end;
end;


end.

