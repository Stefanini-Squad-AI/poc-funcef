{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{ - Funções para conversão de tipos para OleVariant e   }
{   vice-versa                                          }
{ - Funções para conversão de DataSets para XML e       }
{   vice-versa                                          }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}

unit uMidasUtil;

interface

Uses Classes, SysUtils, Db, DbTables, Math, Windows, DbClient, Forms, FileCtrl,
     JclFileUtils;

   {Converte um arquivo para variant}
   function FileToVariant(FileName: String): OleVariant;
   {Converte um TStrings para variant}
   function StringlistToVariant(aStrlist: TStrings): OleVariant;
   {Converte um Stream para variant}
   function StreamToVariant(Stream: TStream): OleVariant;
   {Converte um variant gerado pela filetovariant para um arquivo}
   procedure VariantToFile(FileName: String; var AVariant: OleVariant);
   {Converte um variant gerado pela StringListToVarian para um TStrings}
   procedure VariantToStringlist(const Data: OleVariant; aStrlist: TStrings);
   {Converte um variant gerado pela VariantToStream para um Stream}
   procedure VariantToStream(const Data: OleVariant; Stream: TStream);

   {Converte um DataSet para um XML File}
   procedure DatasetToXML(Dataset: TDataset; FileName: string);
   {Converte um DataSet para um VarArray}
   procedure DatasetToVarArray(ADataset: TDataset; var varResultSet: OleVariant);

   procedure XmlToCds(sXml: String; Cds: TClientDataSet);
   function  CdsToXmlString(Cds: TClientDataSet): String;

   {Faz um "Close Open" nos ClientDataSets passados como parâmetros}
   procedure RefreshCDS(aCds: array of TClientdataSet);
   {Verifica para cada ClientDataset do array se o mesmo está ativo, fecha, limpa o endereçamento do mesmo caso esteja
    associado a outro controle e destroy o mesmo}
   procedure FreeCds(cds: array of TClientDataSet);
   {"Appenda" os registros do CdsOrigem no CdsDestino e apaga o registro origem de acordo com
    o parâmetro DeleteSource.
    Os ClientDataSets devem possuir os mesmos Campos e na mesma ordem}
   Procedure CopyCdsRecord( CdsOrigem, CdsDestino: TClientDataSet; DeleteSource: Boolean = True);
   {Faz um loop apagando todos os registros do(s) clientdataset(s) passados como
    parâmetros}
   procedure EmptyCds(cds: array of TClientDataSet);
   {Grava para arquivo o Data dos ClientDataSets do form ou datamodulo passados como parâmetro.
    O parâmetro itagToSave permite que somente os ClientDataSetDiferenciados pelo valor da
    propriedade TAG sejam gravados. Caso o valor seja 0, todos os clientdatasets da tela serão
    gravados.
    O parâmetro fmt defise se o arquivo gerado é um Xml ou um MyBase.
    Os arquivos são gerados numa subpasta a pasta de execução chamada CdsData e tem o nome
    composto do nomedoform.clientdatasets.xml ou nomedoform.clientdatasets.cds}
   procedure SaveCDSFromScreen( Compo: TComponent; iTagToSave: Integer; fmt: TDataPacketFormat);
   {retorna o datapacket do clientdataset passado como parâmetro sem os metadados
    retornados no datapacket de origem
   }
   function CopyClientDataSet(cds : TClientDataSet): OleVariant;
   function XmlToOleVariant(sXml: String): OleVariant;

implementation

var
  SourceBuffer: PChar;

function XmlToOleVariant(sXml: String): OleVariant;
Var
  Cds: TClientDataSet; 
begin
  Result := null;
  
  Cds := TClientDataSet.Create(nil);
  Try
     XmlToCds(sXml, Cds);
     Result := Cds.Data;
  finally
     Cds.Free;
  end;
end;  

procedure XmlToCds(sXml: String; Cds: TClientDataSet);
Var
  Xml: TStringStream;
begin
  Xml := TStringStream.Create(sXml);
  try
    Xml.Position := 0;
    Cds.LoadFromStream(Xml);
  finally
    Xml.Free;
  end;
end;

function  CdsToXmlString(Cds: TClientDataSet): String;
Var
  Xml: TStringStream;
  sXml: String;
  X: Integer;
begin
  result := '';
  Xml := TStringStream.Create('');
  Try
    Cds.SaveToStream(Xml, dfXml);
    sXml := Xml.DataString;

    for x:=Length(sXml) downto 1 do
       if ( x < Length(sXml)) And
          ( sXml[x] = '>' ) then
             insert(#13, sXml, x + 1 );

    Result := sXml;
  finally
    Xml.Free;
  end;
end;

function FileToVariant(FileName: String): OleVariant;
var
  AStream: TFileStream;
  MyBuffer: Pointer;
begin
  AStream:=TFileStream.create(FileName,fmOpenRead);
  try
    aStream.Seek(0, soFromBeginning);
    Result:=VarArraycreate([0, AStream.size-1], VarByte);
    MyBuffer:=VarArrayLock(Result);
    AStream.ReadBuffer(MyBuffer^, AStream.Size);
    VarArrayUnlock(Result);
  finally
    AStream.Free;
  end;
end;

procedure VariantToFile(FileName: String; var AVariant: OleVariant);
var
  AStream: TFileStream;
  MyBuffer: Pointer;
  Size: Integer;
begin
  AStream:=TFileStream.create(FileName,fmCreate);
  try
    aStream.Seek(0, soFromBeginning);
    Size:=VarArrayHighBound(AVariant,1)+VarArrayLowBound(AVariant,1)+1;
    MyBuffer:=VarArrayLock(AVariant);
    AStream.WriteBuffer(MyBuffer^, Size);
    VarArrayUnlock(AVariant);
  finally
    AStream.Free;
  end;
end;

procedure VariantToStream(const Data: OleVariant; Stream: TStream); 
var 
  p: Pointer; 
begin 
  p := VarArrayLock(Data); 
  try 
    Stream.Write(p^, VarArrayHighBound(Data,1) + 1);  //assuming low bound = 0 
  finally 
    VarArrayUnlock(Data); 
  end; 
end; 

function StreamToVariant(Stream: TStream): OleVariant; 
var 
  p: Pointer; 
begin 
  Result := VarArrayCreate([0, Stream.Size - 1], varByte); 
  p := VarArrayLock(Result); 
  try 
    Stream.Position := 0;  //start from beginning of stream 
    Stream.Read(p^, Stream.Size); 
  finally 
    VarArrayUnlock(Result); 
  end; 
end; 

function StringlistToVariant(aStrlist: TStrings): OleVariant;
var
  hStream: TStream;
begin
  hStream := TMemoryStream.Create;
  try
    aStrList.SaveToStream(hStream);
    hStream.Seek(0,soFromBeginning);
    Result := StreamToVariant(hStream);
  finally
    hStream.Free;
  end;
end;

procedure VariantToStringlist(const Data: OleVariant; aStrlist: TStrings);
var
  hStream: TStream;
begin
  hStream := TMemoryStream.Create;
  try
    VariantToStream(Data,hStream);
    hStream.Seek(0,soFromBeginning);
    aStrList.LoadFromStream(hStream);
  finally
    hStream.Free;
  end;
end;

procedure DatasetToVarArray(ADataset : TDataset; var varResultSet: OleVariant);
var
  m : Integer;
  nRecords, nColumns, nCurRec : Integer;
begin
  nRecords := -1;
  nColumns := -1;

  try
    { Create the array... }
    { Set size to 0..m-1 where m equals the number of columns. }
    { nColumns := Max(0, ADataset.FieldCount-1);}
    nColumns := Max(0, ADataset.FieldCount);

    { Each item is an array of size (0..n) where n equals the }
    { number of records.}
    { Entry 0 is where we store the column name. }

    nRecords := Max(0, ADataset.RecordCount);

    varResultSet := VarArrayCreate([0, nColumns, 0, nRecords],
                                   varVariant);

   {Adiciona valores a primeira celula - indice 0,0 - que indica o nº total de colunas e linhas do array}                                   
    varResultSet[0, 0] := 'C' + IntToStr(nColumns) + 'R' + IntToStr(nRecords);

    for m := 1 to nColumns do
      varResultSet[m, 0] := ADataset.Fields[m-1].DisplayLabel;

    { Populate from result set. }
    ADataset.First;
    nCurRec := 1; { Current record number. }
    while not ADataset.Eof do begin
      { Put in field values. }

      {Adiciona valores a primeira coluna - indice 0 - que indica o nº do registro}
      varResultSet[0, nCurRec] := nCurRec; 

      for m := 1 to nColumns do
        varResultSet[m, nCurRec] := ADataset.Fields[m-1].Value;

      ADataset.Next; 
      Inc(nCurRec);
    end; 
  except 
    on E: Exception do 
      raise Exception.Create('DatasetToVarArray() - ' +
                              IntToStr(nRecords) + 
                             ' rec,'+IntToStr(nColumns) 
                             +'cols,'+E.Message); 
  end; 
end;

procedure WriteString(Stream: TFileStream; s: string);
begin
  StrPCopy(SourceBuffer, s);
  Stream.Write(SourceBuffer[0], StrLen(SourceBuffer));
end;

procedure WriteFileBegin(Stream: TFileStream; Dataset: TDataset);

  function XMLFieldType(fld: TField): string;
  begin 
    case fld.DataType of 
      ftString: Result := '"string" WIDTH="' + IntToStr(fld.Size) + '"'; 
      ftSmallint: Result := '"i4"'; //?? 
      ftInteger: Result := '"i4"'; 
      ftWord: Result := '"i4"'; //?? 
      ftBoolean: Result := '"boolean"'; 
      ftAutoInc: Result := '"i4" SUBTYPE="Autoinc"'; 
      ftFloat: Result := '"r8"'; 
      ftCurrency: Result := '"r8" SUBTYPE="Money"'; 
      ftBCD: Result := '"r8"'; //?? 
      ftDate: Result := '"date"'; 
      ftTime: Result := '"time"'; //?? 
      ftDateTime: Result := '"datetime"'; 
    else 
    end;
    if fld.Required then 
      Result := Result + ' required="true"'; 
    if fld.Readonly then 
      Result := Result + ' readonly="true"'; 
  end; 

var 
  i: Integer; 
begin 
  WriteString(Stream, '''+>''');
  WriteString(Stream, '');

  {write th metadata}
  with Dataset do 
    for i := 0 to FieldCount-1 do
    begin 
      WriteString(Stream, ''); 
    end; 
  WriteString(Stream, ''); 
  WriteString(Stream, ''); 
  WriteString(Stream, ''); 
end; 

procedure WriteFileEnd(Stream: TFileStream); 
begin 
  WriteString(Stream, ''); 
end; 

procedure WriteRowStart(Stream: TFileStream; IsAddedTitle: Boolean); 
begin 
  if not IsAddedTitle then 
    WriteString(Stream, 'end');
end;

procedure WriteRowEnd(Stream: TFileStream; IsAddedTitle: Boolean);
begin 
  if not IsAddedTitle then 
    WriteString(Stream, '/>'); 
end; 

procedure WriteData(Stream: TFileStream; fld: TField; AString: ShortString); 
begin 
  if Assigned(fld) and (AString <> '') then 
    WriteString(Stream, ' ' + fld.FieldName + '="' + AString + '"'); 
end; 

function GetFieldStr(Field: TField): string; 

  function GetDig(i, j: Word): string;
  begin
    Result := IntToStr(i); 
    while (Length(Result) < j) do 
      Result := '0' + Result; 
  end; 

var Hour, Min, Sec, MSec: Word; 
begin 
  case Field.DataType of 
    ftBoolean: Result := UpperCase(Field.AsString); 
    ftDate: Result := FormatDateTime('yyyymmdd', Field.AsDateTime); 
    ftTime: Result := FormatDateTime('hhnnss', Field.AsDateTime); 
    ftDateTime: begin 
                  Result := FormatDateTime('yyyymmdd', Field.AsDateTime); 
                  DecodeTime(Field.AsDateTime, Hour, Min, Sec, MSec); 
                  if (Hour <> 0) or (Min <> 0) or (Sec <> 0) or (MSec <> 0) then 
                    Result := Result + 'T' + GetDig(Hour, 2) + ':' + GetDig(Min, 2) + ':' + GetDig(Sec, 2) + GetDig(MSec, 3); 
                end; 
  else 
    Result := Field.AsString; 
  end;
end; 

procedure DatasetToXML(Dataset: TDataset; FileName: string);
var
  Stream: TFileStream;
  bkmark: TBookmark;
  i: Integer;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  SourceBuffer := StrAlloc(1024);
  WriteFileBegin(Stream, Dataset);

  with DataSet do
  begin 
    DisableControls; 
    bkmark := GetBookmark; 
    First; 

    {write a title row} 
    WriteRowStart(Stream, True); 
    for i := 0 to FieldCount-1 do
      WriteData(Stream, nil, Fields[i].DisplayLabel); 
    {write the end of row} 
    WriteRowEnd(Stream, True);

    while (not EOF) do 
    begin 
      WriteRowStart(Stream, False);
      for i := 0 to FieldCount-1 do
        WriteData(Stream, Fields[i], GetFieldStr(Fields[i]));
      {write the end of row}
      WriteRowEnd(Stream, False);

      Next;
    end;

    GotoBookmark(bkmark);
    EnableControls;
  end;

  WriteFileEnd(Stream);
  Stream.Free;
  StrDispose(SourceBuffer);
end;

procedure RefreshCDS(aCds: array of TClientdataSet);
Var
  X: Integer;
Begin
  For X:=0 To High(aCds) Do
  Begin
    aCds[x].Close;
    aCds[x].Open;
  End;
End;

procedure FreeCds(cds: array of TClientDataSet);
Var
   x : Integer;
begin
    For x := 0 To high( cds ) Do
      Begin
          If cds[x].Active Then cds[x].Close;
          If Assigned(cds[x]) Then cds[x] := nil;
          cds[x].Free;
      End;
end;

Procedure CopyCdsRecord( CdsOrigem, CdsDestino: TClientDataSet; DeleteSource: Boolean = True);
Var
  x : Integer;
Begin
   CdsDestino.Append;
   For x := 0 To CdsOrigem.FieldCount -1 Do
      CdsDestino.Fields[x].Value := CdsOrigem.Fields[x].Value;
   CdsDestino.Post;

   If DeleteSource Then CdsOrigem.Delete;
End;

procedure EmptyCds(cds: array of TClientDataSet);
Var
   x : Integer;
   bControlsEnable: Boolean;
begin
    bControlsEnable := False;
    
    For x := 0 To high( cds ) Do
      With cds[x] Do
      Begin
        Try
          bControlsEnable := Not ControlsDisabled;

          If bControlsEnable Then DisableControls;

          First;
          While Not Eof Do Delete;

          If bControlsEnable Then EnableControls;
        Except
          If bControlsEnable Then EnableControls;
          Raise;
        End;
      End;
end;

procedure SaveCDSFromScreen( Compo: TComponent; iTagToSave: Integer; fmt: TDataPacketFormat);
Var
  X: Integer;
  bPastaCriada: Boolean;
  sPathData, sExtensao: String;
begin
  bPastaCriada := false;
  sPathData := PathAddSeparator(ExtractFilePath(Application.ExeName)) + 'CdsData';
  Case fmt of
    dfBinary: sExtensao := '.cds';
    dfXML: sExtensao := '.xml';
  End;
  
  For X:=0 to (Compo.ComponentCount - 1) do
  begin
      if (Compo.Components[x] is TClientDataSet) And
         ((iTagToSave = 0) Or (Compo.Tag = iTagToSave)) And
         (TClientDataSet(Compo.Components[x]).Active) then
      begin
         if not bPastaCriada then
         begin
            if not DirectoryExists(sPathData) then ForceDirectories(sPathData);
            bPastaCriada := True;

            sPathData := PathAddSeparator(sPathData);
         end;

         TClientDataSet(Compo.Components[x]).SaveToFile(sPathData + Compo.Name + '.' + Compo.Components[x].Name + sExtensao, fmt);
      end;
  end;
end;

function CopyClientDataSet(cds : TClientDataSet): OleVariant;
var
  CdsLocalAux : TClientDataset;
  i : integer;
begin
  CdsLocalAux := TClientDataset.Create(nil);
  try

    for i := 0 to Cds.fieldCount - 1 do
      CdsLocalAux.FieldDefs.Add(Cds.Fields[i].FieldName, Cds.Fields[i].DataType,
                                Cds.Fields[i].Size, Cds.Fields[i].Required);

    CdsLocalAux.CreateDataSet;

    CdsLocalAux.Open;
    Cds.First;
    while not Cds.Eof do
    begin
      CdsLocalAux.Insert;
      for i := 0 to Cds.fieldCount - 1 do
        CdsLocalAux.Fields[i].Value := Cds.Fields[i].Value;
      CdsLocalAux.Post;
      Cds.Next;
    end;

  finally
    Result := CdsLocalAux.Data;
    CdsLocalAux.Free;
  end;
end;


end.

