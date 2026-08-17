{
Rotina............: Destroy, OpenCdsInDesign
N. Sol.............: 103843
N. Kintana......: 464129
Data...............: 02/02/2009
Responsável...: Ricardo Alves
Descrição........: Modificado código para que os objetos sejam corretamente liberados
					da memória após sua utilização.
}

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
//andre tavares pendência 16523 descomentei alguns trechos código para fazer funcionar o parâmetro em tempo de design
{*******************************************************}
unit uCmSqlParams;

interface

Uses Classes, SysUtils, Db, DbClient, uCmCustomCdbObject;

Type
  TOnFormartParam = procedure(sParamName, sOldValue: String; var sNewValue: String) of object;

  TSqlParam = Class(TPersistent)
  private

    FAsInteger: LongInt;
    FAsFloat: Double;
    FAsString: String;
    FName: TComponentName;
    FAsDateTime: TDateTime;
    FDataType: TFieldType;
    FAsTime: TDateTime;
    FAsDate: TDateTime;
    FValue: String;
    FOwner: TComponent;
    fIndex: Integer;
    FText: String;
    procedure SetAsDateTime(const Value: TDateTime);
    procedure SetAsFloat(const Value: Double);
    procedure SetAsInteger(const Value: LongInt);
    procedure SetAsString(const Value: String);
    procedure SetAsDate(const Value: TDateTime);
    procedure SetAsTime(const Value: TDateTime);
    procedure SetOwner(const Value: TComponent);

    procedure ReplaceSetAs;

  protected

  public
     Constructor Create;
     Destructor Destroy; Override;

     property AsString: String read FAsString write SetAsString;
     property AsFloat: Double read FAsFloat write SetAsFloat;
     property AsDateTime: TDateTime read FAsDateTime write SetAsDateTime;
     property AsInteger: LongInt read FAsInteger write SetAsInteger;
     property AsDate: TDateTime read FAsDate write SetAsDate;
     property AsTime: TDateTime read FAsTime write SetAsTime;
     property Owner: TComponent read FOwner write SetOwner;

     property Value: String read FValue;
     property Text: String read FText;
     procedure Clear;
     procedure ClearLine;
  published
     property Name: TComponentName read FName;
     property DataType: TFieldType read FDataType;
     property Index: Integer read fIndex;

  end;

  TCMSqlParams = Class(TComponent)

  private

    _iLengthSQL: Integer;
    _UpdateParams: Boolean;
    _ListSqlParam: TList;
    _SqlOriginal: TStrings;
    _SqlChanged: TStrings;
    FSQL: TStrings;
    FOnFormartParam: TOnFormartParam;
    FClientDataSet: TClientDataSet;
    FPrepared: Boolean;
    FControlObject: TCmCustomCdbObject;
    procedure SetSQL(const Value: TStrings);
    function GetSQLChanged: String;
    procedure SetOnFormartParam(const Value: TOnFormartParam);
    procedure SetClientDataSet(const Value: TClientDataSet);
    procedure SetPrepared(const Value: Boolean);
    procedure OpenCdsInDesign;
    function GetParams(i: Integer): TSqlParam;
    function GetParamsInDesign: Boolean;
    procedure SetControlObject(const Value: TCmCustomCdbObject);
    function ParseSQL(sSQL: String; DoCreate: Boolean): String;

  protected
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure ChangeSQL(Sender: TObject);

  public
     Constructor Create(Aowner: TComponent); Override;
     Destructor Destroy; Override;

     procedure UnPrepare;
     procedure Prepare;
     procedure Open;

     function ParamByName(sNomeParam: String): TSqlParam;
     function Data: OleVariant;
     function ParamCount: Integer;
     function ParamExists(sNomeParam: String): Boolean;

     property SQLChanged: String read GetSQLChanged;
     property Prepared: Boolean read FPrepared write SetPrepared;
     property Params[i: Integer]: TSqlParam read GetParams;
     property ControlObject: TCmCustomCdbObject read FControlObject write SetControlObject;

  published
     property SQL: TStrings read FSQL write SetSQL;
     property OnFormartParam: TOnFormartParam read FOnFormartParam write SetOnFormartParam;
     property ClientDataSet: TClientDataSet read FClientDataSet write SetClientDataSet;

  end;

implementation

Uses JclStrings, wwQuery, provider, fGetParams, Windows, Forms, uCtrlPadroes,
     uCMControlObject;

{ TCMSqlParams }

constructor TCMSqlParams.Create(Aowner: TComponent);
begin
  inherited;
  _iLengthSQL := 0;
  _UpdateParams := False;

  _SqlOriginal := TStringList.Create;
  _SqlChanged := TStringList.Create;
  
  FSQL := TStringList.Create;


  TStringList(FSQL).OnChange := ChangeSQL;

  _ListSqlParam := TList.Create;
  FPrepared := False;
end;

function TCMSqlParams.Data: OleVariant;
Var
   sSql: String;
begin
   sSql := GetSQLChanged;
   If _iLengthSQL > 1000 Then
   Begin
     _SqlChanged.Text := sSql;
     If FControlObject <> nil Then
       Result := TCMControlObject(FControlObject).GetDataPacket(_SqlChanged)
     Else
       Result := Padroes.GetDataPacket(_SqlChanged);
   End
   Else
   Begin
     If FControlObject <> nil Then
       Result := TCMControlObject(FControlObject).GetDataPacket(sSql)
     Else
       Result := Padroes.GetDataPacket(sSql);
   End;
end;

destructor TCMSqlParams.Destroy;
begin
  // Ricardo A. SOL: 103843 KTN: 464129
  FreeAndNil( FSQL );
  FreeAndNil( _SqlOriginal );
  FreeAndNil( _SqlChanged );

  _ListSqlParam.Clear;
  FreeAndNil( _ListSqlParam );
  inherited;
end;

function TCMSqlParams.GetParams(i: Integer): TSqlParam;
begin
   Result := TSqlParam(_ListSqlParam[i]);
end;

function TCMSqlParams.ParseSQL(sSQL: String; DoCreate: Boolean): String;
const
  aLiterals = ['''', '"', '`'];
var
  pcValue, pcCurPos, pcStartPos: PChar;
  cCurChar: Char;
  bLiteral: Boolean;
  bEmbeddedLiteral: Boolean;
  sName, sFormatedParam, sNewParam, sAuxSql: string;
  aSqlParam: TSqlParam;
  iIndex, iPosChange, iTamChange: Integer;

  function NameDelimiter: Boolean;
  begin
    Result := cCurChar in [' ', ',', ';', ')', #13, #10];
  end;

  function IsLiteral: Boolean;
  begin
    Result := cCurChar in aLiterals;
  end;

  function StripLiterals(Buffer: PChar): string;
  var
    Len: Word;
    TempBuf: PChar;

    procedure StripChar;
    begin
      if TempBuf^ in aLiterals then
        Sysutils.StrMove(TempBuf, TempBuf + 1, Len - 1);
      if TempBuf[StrLen(TempBuf) - 1] in aLiterals then
        TempBuf[StrLen(TempBuf) - 1] := #0;
    end;

  begin
    Len := StrLen(Buffer) + 1;
    TempBuf := AllocMem(Len);
    Result := '';
    try
      StrCopy(TempBuf, Buffer);
      StripChar;
      Result := StrPas(TempBuf);
    finally
      FreeMem(TempBuf, Len);
    end;
  end;

begin
  Result := sSQL;
  sAuxSql := PChar(Result);
  pcValue := PChar(Result);
  iIndex := 0;

  if DoCreate then _ListSqlParam.Clear;

  pcCurPos := pcValue;
  bLiteral := False;
  bEmbeddedLiteral := False;

  repeat

    while (pcCurPos^ in LeadBytes) do Inc(pcCurPos, 2);
    cCurChar := pcCurPos^;

    if (cCurChar = ':') and not bLiteral and ((pcCurPos + 1)^ <> ':') then
    begin
      pcStartPos := pcCurPos;
      while (cCurChar <> #0) and (bLiteral or not NameDelimiter) do
      begin
        Inc(pcCurPos);

        while (pcCurPos^ in LeadBytes) do Inc(pcCurPos, 2);
        cCurChar := pcCurPos^;
        if IsLiteral then
        begin
          bLiteral := bLiteral xor True;
          if pcCurPos = pcStartPos + 1 then bEmbeddedLiteral := True;
        end;
      end;
      pcCurPos^ := #0;
      if bEmbeddedLiteral then
      begin
        sName := StripLiterals(pcStartPos + 1);
        bEmbeddedLiteral := False;
      end
      else sName := StrPas(pcStartPos + 1);

      {**
         O Parser pode ser chamado em duas situações: No prepare e no
         Change dos parâmetros pelos valores sendo que no Prepare ele
         sempre cria os parâmetros ( DoCreate = True ).
      **}
      if DoCreate then
      Begin
        aSqlParam := TSqlParam.Create;

        aSqlParam.Owner := Self;
        aSqlParam.fIndex := iIndex;
        aSqlParam.fName := sName;
        _ListSqlParam.Add(aSqlParam);

        inc(iIndex);
      End
      Else
      Begin
        iPosChange := Pos(':' + sName, sAuxSql);
        iTamChange := Length(':' + sName);

        Delete(sAuxSql, iPosChange , iTamChange);

        sFormatedParam := parambyName(sName).Value;
        sNewParam := '';

        If Assigned(FOnFormartParam) Then FOnFormartParam(sName, parambyName(sName).Text, sNewParam);

        If Trim(sNewParam) <> '' Then sFormatedParam := sNewParam;

        Insert(sFormatedParam, sAuxSql, iPosChange);
      End;

      pcCurPos^ := cCurChar;
      pcStartPos^ := '?';
      Inc(pcStartPos);
      SysUtils.StrMove(pcStartPos, pcCurPos, StrLen(pcCurPos) + 1);
      pcCurPos := pcStartPos;
    end
    else if (cCurChar = ':') and not bLiteral and ((pcCurPos + 1)^ = ':') then
      SysUtils.StrMove(pcCurPos, pcCurPos + 1, StrLen(pcCurPos) + 1)
    else if IsLiteral then bLiteral := bLiteral xor True;

    Inc(pcCurPos);
  until cCurChar = #0;

  if Not DoCreate then  Result := sAuxSql;
end;

function TCMSqlParams.GetSQLChanged: String;
begin

  If (csDesigning in ComponentState)
     Then
  Begin
     If Not GetParamsInDesign then Abort;

     Result := FSQL.GetText;
  End;


  Result := ParseSQL(FSQL.Text, False);
end;

procedure TCMSqlParams.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);

  if (aComponent = FClientDataSet) and (Operation = opRemove) then
      FClientDataSet := nil;
end;

procedure TCMSqlParams.Open;
Var
   sSql: String;
begin
  If (csDesigning in ComponentState) Or ((Padroes = Nil) And (FControlObject = nil)) Then
     OpenCdsInDesign
  Else
  Begin
     sSql := GetSQLChanged;
     If _iLengthSQL > 1000 Then
     Begin
       _SqlChanged.Text := sSql;
       If FControlObject <> nil Then
         ClientDataSet.Data := TCMControlObject(FControlObject).GetDataPacket(_SqlChanged)
       Else
         ClientDataSet.Data := Padroes.GetDataPacket(_SqlChanged);
     End
     Else
     Begin
       If FControlObject <> nil Then
         ClientDataSet.Data := TCMControlObject(FControlObject).GetDataPacket(sSql)
       Else
         ClientDataSet.Data := Padroes.GetDataPacket(sSql);
     End;
  End;
end;

function TCMSqlParams.GetParamsInDesign: Boolean;
Var
  X: Integer;
Begin
   FPrepared := False;
   Prepare;

   If _ListSqlParam.Count > 0 Then
   Begin
     With TFrmGetParams.Create(Application) Do
        Try
           Cds.Open;
           Cds.EmptyDataSet;

           For X := 0 To _ListSqlParam.Count - 1 Do
           Begin
              Cds.Append;
              CdsNOMEPARAM.AsString := TSqlParam(_ListSqlParam[x]).fName;
              CdsTIPOPARAM.AsString := '0';
              Cds.Post;
           end;

           Cds.First;

           If (ShowModal = idOk) Then
           Begin
              Result := True;
              Cds.First;

              For X := 0 To _ListSqlParam.Count - 1 Do
              Begin
                 If CdsNULO.AsString = 'S' Then
                    Params[x].Clear
                 Else
                   Case CdsTIPOPARAM.AsInteger of
                    0: Params[x].AsString := CdsVALORPARAM.AsString;
                    1: Params[x].AsFloat := CdsVALORPARAM.AsFloat;
                    2: Params[x].AsInteger := CdsVALORPARAM.AsInteger;
                    3: Params[x].AsDate := StrToDate(CdsVALORPARAM.AsString);
                    4: Params[x].AsDateTime := StrToDateTime(CdsVALORPARAM.AsString);
                    5: Params[x].AsTime := StrToTime(CdsVALORPARAM.AsString);
                   End;
                   
                 Cds.Next;
              end;
           End
           Else
              Result := False;
        finally
           Free;
        End;
   End
   Else
     Result := True;
End;


procedure TCMSqlParams.OpenCdsInDesign;
Var
  lQry: TwwQuery;
  lDsp: TDatasetProvider;
  lCds: TClientDataSet;
begin
   // Ricardo A. SOL: 103843 KTN: 464129
   lQry := TwwQuery.Create(nil);
   lDsp := TDatasetProvider.Create(nil);
   lCds := TClientDataSet.Create(nil);
   try

     lQry.DatabaseName := 'BaseDados';
     lQry.Sql.Text := GetSQLChanged;

     lDsp.DataSet := lQry;
     lQry.Prepare();

     lCds.SetProvider( lDsp );

     lCds.Open;

     ClientDataSet.Data := lCds.Data;

     lCds.Close;
     lQry.UnPrepare();
   finally
     lCds.ProviderName := '';
     lDsp.DataSet := nil;
     FreeAndNil( lCds );
     FreeAndNil( lDsp );
     FreeAndNil( lQry );
   end;
end;

function TCMSqlParams.ParamByName(sNomeParam: String): TSqlParam;
Var
  X: Integer;
  bfound: Boolean;
begin                                                                
  Result := nil;

  bfound := False;

  For X:=0 To _ListSqlParam.Count - 1 Do
    If UpperCase(TSqlParam(_ListSqlParam[X]).fName) = UpperCase(sNomeParam) Then
    Begin
       bfound := True;
       Result := TSqlParam(_ListSqlParam[X]);
       break;
    End;

  If Not bfound Then
  Begin
     FPrepared := False;
     Raise Exception.Create('Parâmetro não implementado');
  End;
end;

procedure TCMSqlParams.Prepare;

begin
  If Not FPrepared Then
  Begin
    ParseSQL(FSQL.Text, True);
    FPrepared := True;
  End;

  
end;

procedure TCMSqlParams.SetClientDataSet(const Value: TClientDataSet);
begin
  FClientDataSet := Value;
end;

procedure TCMSqlParams.SetOnFormartParam(const Value: TOnFormartParam);
begin
  FOnFormartParam := Value;
end;

procedure TCMSqlParams.SetPrepared(const Value: Boolean);
begin
  FPrepared := Value;
end;

procedure TCMSqlParams.SetSql(const Value: TStrings);
begin
  if FSQL.Text <> Value.Text then
  begin
    FPrepared := False;

    FSQL.BeginUpdate;
    try
      FSQL.Assign(Value);
    finally
      FSQL.EndUpdate;
    end;

    _iLengthSQL := Length(FSQL.Text)
  End;
End;

function TCMSqlParams.ParamCount: Integer;
begin
  If Not Prepared Then Prepare;
  Result := _ListSqlParam.Count;
end;

function TCMSqlParams.ParamExists(sNomeParam: String): Boolean;
Var
  X: Integer;
begin
  Result := False;

  If Not Prepared Then Prepare;

  For X:= 0 To _ListSqlParam.Count - 1 Do
     If UpperCase(TSqlParam(_ListSqlParam[x]).Name) = UpperCase(sNomeParam) Then
     Begin
       Result := True;
       Break;
     End;
end;

procedure TCMSqlParams.ChangeSQL(Sender: TObject);
begin
   FPrepared := False;

   If Not (csDesigning in ComponentState) Then
   Begin
      If _SqlOriginal.Count = 0 Then
        Try
           _SqlOriginal.BeginUpdate;
           _SqlOriginal.Assign(FSQL);
        finally
           _SqlOriginal.EndUpdate;
        end;
   End;
end;

procedure TCMSqlParams.UnPrepare;
begin
   If Not (csDesigning in ComponentState) Then FSQL.Assign(_SqlOriginal);
end;

procedure TCMSqlParams.SetControlObject(const Value: TCmCustomCdbObject);
begin
  FControlObject := Value;
end;

{ TSqlParam }

procedure TSqlParam.Clear;
begin
  FValue := 'null';
  FText := '';
end;

procedure TSqlParam.ClearLine;
Var
  X: Integer;
begin
  For X := (TCMSqlParams(Owner).FSQL.Count - 1) DownTo 0 Do
     If Pos(UpperCase(':' + FName),UpperCase(TCMSqlParams(Owner).FSQL[X])) > 0 Then
     Begin
        TCMSqlParams(Owner).FPrepared := false;
        TCMSqlParams(Owner).FSQL.Delete(X);
     End;

  If Not TCMSqlParams(Owner).FPrepared Then TCMSqlParams(Owner).Prepare;
end;

constructor TSqlParam.Create;
begin
  inherited;
  FValue := 'null';
  FText := '';
end;

destructor TSqlParam.Destroy;
begin
  inherited;
end;

procedure TSqlParam.ReplaceSetAs;
Var
  X: Integer;
begin
  If Not TCMSqlParams(Owner)._UpdateParams Then
   Try
     TCMSqlParams(Owner)._UpdateParams := True;

     For X:=0 To TCMSqlParams(Owner)._ListSqlParam.Count - 1 Do
         If (Self.Index <> TSqlParam(TCMSqlParams(Owner)._ListSqlParam[x]).Index) And
            (UpperCase(Self.Name) = UpperCase(TSqlParam(TCMSqlParams(Owner)._ListSqlParam[x]).Name)) Then
            Case Self.DataType of
              ftTime: TSqlParam(TCMSqlParams(Owner)._ListSqlParam[x]).AsTime := Self.AsTime;
              ftString: TSqlParam(TCMSqlParams(Owner)._ListSqlParam[x]).AsString := Self.AsString;
              ftInteger: TSqlParam(TCMSqlParams(Owner)._ListSqlParam[x]).AsInteger := Self.AsInteger;
              ftFloat: TSqlParam(TCMSqlParams(Owner)._ListSqlParam[x]).AsFloat := Self.AsFloat;
              ftDateTime: TSqlParam(TCMSqlParams(Owner)._ListSqlParam[x]).AsDateTime := Self.AsDateTime;
              ftDate: TSqlParam(TCMSqlParams(Owner)._ListSqlParam[x]).AsDate := Self.AsDate;
            End;
   finally
     TCMSqlParams(Owner)._UpdateParams := False;
   end;
end;

procedure TSqlParam.SetAsDate(const Value: TDateTime);
begin
  FAsDate := Value;
  fDataType := ftDate;
  fValue := 'TO_DATE(' + QuotedStr(DateToStr(Value)) + ',' + QuotedStr('DD/MM/YYYY') + ')';
  fText := DateToStr(Value);
  
  ReplaceSetAs;
end;

procedure TSqlParam.SetAsDateTime(const Value: TDateTime);
begin
  FAsDateTime := Value;
  fDataType := ftDateTime;
  fValue := 'TO_DATE(' + QuotedStr(DateTimeToStr(Value)) + ',' + QuotedStr('DD/MM/YYYY HH:MI:SS') + ')';
  fText := DateTimeToStr(Value);

  ReplaceSetAs;
end;

procedure TSqlParam.SetAsFloat(const Value: Double);
Var
  sdc: Char;
begin
  FAsFloat := Value;
  fDataType := ftFloat;

  sdc := DecimalSeparator;
  Try
    DecimalSeparator := '.';
    fValue := FloatToStr(Value);
    fText := FloatToStr(Value);
  finally
    DecimalSeparator := sdc;
  End;

  ReplaceSetAs;
end;

procedure TSqlParam.SetAsInteger(const Value: LongInt);
begin
  FAsInteger := Value;
  fDataType := ftInteger;
  fValue := IntToStr(Value);
  fText := IntToStr(Value);

  ReplaceSetAs;
end;

procedure TSqlParam.SetAsString(const Value: String);
begin
  FAsString := Value;
  fDataType := ftString;
  fValue := QuotedStr(Value);
  fText := Value;

  ReplaceSetAs;
end;

procedure TSqlParam.SetAsTime(const Value: TDateTime);
begin
  FAsTime := Value;
  fDataType := ftTime;
  fValue := 'TO_DATE(' + QuotedStr(TimeToStr(Value)) + ',' + QuotedStr('HH:MI:SS') + ')';
  fText := TimeToStr(Value);

  ReplaceSetAs;  
end;

procedure TSqlParam.SetOwner(const Value: TComponent);
begin
  FOwner := Value;
end;

end.
