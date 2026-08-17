unit uResource;

interface

uses
  // delphiDabbler Stream Library
  Windows, classes, SysUtils, 
  PJResWriterStreams, ExeImage, rxtypes;

  Type
  TBplResult = record
    BPL: String;
    Data: TDateTime;
    Caminho: String;
    Descricao: String;
    ModuleName: string;
    Versao: string;
  end;

  TCMResourceManager = class(TComponent)
  private
    FVersao: String;
    FProjectName: String;
    FPathExe: string;
    FPathBpl: string;
    cOwner: TComponent;
    FExeName: String;
    FResName: String;
    FMensErro: string;

    function AtualizaDiretivaCompilacao(const sArquivo: String; const sNomeResource: string): boolean;
    procedure CreateResourceFile(DataFile, ResFile: string; ResID: PChar);
    function GetVersao: String;
    procedure SeProjectName(const Value: String);
    procedure SeString(const Value: String);
    procedure SetPathBpl(const Value: string);
    procedure SetPathExe(const Value: string);

    procedure LoadResources(ResList: TResourceList; var sversao: string);
    procedure SetExeName(const Value: String);
    procedure SetResName(const Value: String);
    procedure SetMensErro(const Value: string);

  protected

  published
      property ProjectName: String read FProjectName write SeString;
      property ExeName: String read FExeName write SetExeName;
      property Versao: String read GetVersao Write FVersao;
      property PathExe: string read FPathExe write SetPathExe;
      property PathBpl: string read FPathBpl write SetPathBpl;
  public
       Constructor Create(AOwner: TComponent); Override;
       Destructor Destroy; Override;

       function  CriarResorce: boolean;
       procedure ObterNomeExecutavel;
       procedure ObterVersao;

       function BplsAssociadas(const iIndice: integer): TBplResult;
       function RetornaBplsAssociadas: Integer;

       property ResName: String read FResName write SetResName;
       property MensErro: string read FMensErro write SetMensErro;

  end;

procedure Register;

implementation

var
  aBplResult: array of TBplResult;

procedure Register;
begin
  RegisterComponents('CM Additional', [TCMResourceManager]);
end;

procedure TCMResourceManager.CreateResourceFile(
  DataFile, ResFile: string;  // file names
  ResID: PChar              // id of resource
);
  {Creates resource file ResFile with ResID as indentifier from contents of
  DataFile}
var
  FS: TFileStream;                    // input file stream
  ResFileWriter: TPJResWriterStream;  // handles writing resource file
  ResDataWriter: TPJResDataStream;    // handles writing data within res file
begin
  // Intialise variables
  ResFileWriter := nil;
  ResDataWriter := nil;
  // Create inout file stream to rtf file we're embedding in resource file
  FS := TFileStream.Create(DataFile, fmOpenRead);
  try
    // Create resource file writer:
    //   this object handles formatting of resource file, using wrapped file
    //   stream to handle actual file output
    //   here we demostrate how to create wrapped file on fly and close it
    //   automatically
    ResFileWriter := TPJResWriterStream.Create(
      TFileStream.Create(ResFile, fmCreate),   // file stream used to write file
      True      // means wrapped TFileStream is freed when this stream destroyed
    );
    // Create resource data writer:
    //   this object handles layout of resource data section within file - the
    //   wrapped res file writer handles placing of this resource within
    //   resource file
    //   here we demonstrate wrapping a stream that we will free manually
    ResDataWriter := TPJResDataStream.Create(
      ResId,          // id of resource being created
      RT_RCDATA,      // resource is user defined data
      ResFileWriter,  // resource file writer used to handle res file structure
      False           // we don't free res file writer when this object is freed
    );
    // Copy source file into resource
    ResDataWriter.CopyFrom(FS, FS.Size);
  finally
    // Free streams we are handling ourselves
    ResDataWriter.Free;
    ResFileWriter.Free;
    FS.Free;
  end;
end;


function TCMResourceManager.AtualizaDiretivaCompilacao( const sArquivo: String; const sNomeResource: string): boolean;
var
  aProjeto: TStringList;
  sDiretiva: string;
  iIndex: integer;
  bSalva : boolean;
begin
  Result := True;
  aProjeto := TStringList.Create;
  try
    try
      sDiretiva := '{$R ' + AnsiUpperCase(sNomeResource) + '}';
      aProjeto.LoadFromFile(sArquivo);

      //Procurar se a diretiva já foi informada
      iIndex := aProjeto.IndexOf( sDiretiva );
      if iIndex = -1 then
      begin
        iIndex := aProjeto.IndexOf ('{$R *.RES}');
        if iIndex <> -1 then
        begin
          aProjeto.Insert (iIndex+1, sDiretiva);
          bSalva := True;
        end;
      end;

      if Pos( '{$R ''' + AnsiUpperCase(sNomeResource) + '''}', aProjeto.Text ) > 0 then
      begin
        aProjeto.Text := StringReplace( aProjeto.Text, '{$R ''' + AnsiUpperCase(sNomeResource) + '''}', '', [rfReplaceAll] );
        bSalva := True;
      end;

      if bSalva then
        aProjeto.SaveToFile (sArquivo);

    except
      on e:Exception do begin
        FMensErro := e.Message;
        Result := False;
      end;
    end;

  finally
    aProjeto.Free;
  end;

end;


function TCMResourceManager.CriarResorce: boolean;
var
  sNomeBase, sPath, sArquivoTxt: string;
  i: integer;
  aVersao: TStrings;
begin

  sPath := ExtractFilePath(FProjectName);

  sNomeBase := ExtractFileName(FProjectName);
  i := pos('.', sNomeBase);
  sNomeBase := copy(sNomeBase, 1, i-1);


  aVersao := TStringList.Create;
  aVersao.Add ('versao='  + FVersao);

  sArquivoTxt := sPath + sNomeBase + '_RES.txt';
  FResName := sPath + sNomeBase + '_RES.res';

  aVersao.SaveToFile(sArquivoTxt);

  // Create resource file containing the rtf file, with id of 100
  CreateResourceFile(sArquivoTxt, FResName, PChar('CMResource'));
  // Show a message to say we've done

  sNomeBase := sNomeBase + '_RES.RES';

  sNomeBase := trim( StringReplace( sNomeBase, '''', '', [rfReplaceAll] ) );

  Result := AtualizaDiretivaCompilacao(FProjectName, sNomeBase);
end;

function TCMResourceManager.GetVersao: String;
begin
  Result := FVersao;
end;

procedure TCMResourceManager.SeProjectName(const Value: String);
begin
  FProjectName := Value;
end;

constructor TCMResourceManager.Create(AOwner: TComponent);
begin
  inherited;
  cOwner       := AOwner;
  FVersao      := '';
  FProjectName := '';
  FExeName     := '';
  FResName     := '';
  FMensErro    := '';
  FPathExe     := 'C:\ProjetosCM5\Bin\';
  FPathBpl     := 'C:\ProjetosCM5\CM\Packages\';
end;

destructor TCMResourceManager.Destroy;
begin
  inherited;

end;

procedure TCMResourceManager.SeString(const Value: String);
begin
  FProjectName := Value;
end;

procedure TCMResourceManager.LoadResources(ResList: TResourceList; var sversao: string);
var
  I: Integer;
begin
  if sversao <> '' then exit;
  for I := 0 to ResList.Count - 1 do begin
    if ResList[i].Name = 'CMResource' then begin
      sversao := PChar(ResList[i].RawData);
      exit;
    end;
    if ResList[i].IsList then
      LoadResources(ResList[i].List, sversao);
  end;

end;


procedure TCMResourceManager.ObterVersao;
var
  FExeFile: TExeImage;
  i: integer;
  sVersao, sNomeExecutavel: string;
  aVersao: TStringList;
begin
  aVersao  := TStringList.Create;
  FExeFile := TExeImage.CreateImage(cOwner, FExeName);
  try
    sVersao := '';
    LoadResources (FExeFile.Resources, sVersao);
    aVersao.Text := sVersao;
    FVersao := aVersao.Values['versao'];
  finally
    aVersao.Free;
    FExeFile.Free;
  end
end;

procedure TCMResourceManager.ObterNomeExecutavel;
var
  sArquivo, sNome, sPath, sExt: string;
  i: integer;
begin
  sNome := ExtractFileName(FProjectName);
  i := pos('.', sNome);
  sNome := copy (sNome, 1, i-1);

  sExt := ExtractFileExt(FProjectName);
  if AnsiUpperCase(sExt) = '.DPK' then begin
    sExt := '.BPL';
    sPath := FPathBpl;
  end else begin
    sExt := '.EXE';
    sPath := FPathExe;
  end;

  FExeName := sPath + sNome + sExt;
end;


procedure TCMResourceManager.SetPathBpl(const Value: string);
begin
  FPathBpl := Value;
end;

procedure TCMResourceManager.SetPathExe(const Value: string);
begin
  FPathExe := Value;
end;

procedure TCMResourceManager.SetExeName(const Value: String);
begin
  FExeName := Value;
end;

procedure TCMResourceManager.SetResName(const Value: String);
begin
  FResName := Value;
end;

procedure TCMResourceManager.SetMensErro(const Value: string);
begin
  FMensErro := Value;
end;

function TCMResourceManager.BplsAssociadas(const iIndice: integer): TBplResult;
begin
  Result := aBplResult[iIndice];
end;

function ForEachModule (HInstance: Longint; Data: Pointer): Boolean;
var
  Flags, i, iNumOcorr: Integer;
  ModuleName, ModuleDesc: string;
  sModulo, sPath, sExtensao: string;
  dData: TDateTime;
begin
  SetLength (ModuleName, 200);
  GetModuleFileName (HInstance, PChar (ModuleName), Length (ModuleName));
  ModuleName := PChar (ModuleName); // fixup

  sModulo := ExtractFileName(ModuleName);
  i := pos('.', sModulo);
  if i >0  then
    sModulo := copy(sModulo, 1, i-1);
  sPath := ExtractFilePath(ModuleName);

  if AnsiUpperCase(copy(sModulo,1,2)) = 'CM' then
  begin

    // get description and add fixed nodes
    ModuleDesc := GetPackageDescription (PChar (ModuleName));
    dData := FileDateToDateTime( FileAge(ModuleName));

    iNumOcorr := length(aBplResult) + 1;
    SetLength(aBplResult, iNumOcorr);
    aBplResult[iNumOcorr - 1].BPL := sModulo;
    aBplResult[iNumOcorr - 1].Caminho := sPath;
    aBplResult[iNumOcorr - 1].Data := dData;
    aBplResult[iNumOcorr - 1].Descricao := ModuleDesc;
    aBplResult[iNumOcorr - 1].ModuleName := ModuleName;  // utilizado para pegar a versão
  end;
  Result := True;
end;


function TCMResourceManager.RetornaBplsAssociadas: Integer;
var
  i:integer;
begin
  SetLength (aBplResult, 0);
  EnumModules(ForEachModule, nil);

  for i:=0 to length (abplresult) - 1 do begin
    FExeName := aBplResult[i].ModuleName;
    ObterVersao;
    aBplResult[i].Versao := FVersao;
  end;

  Result := length (abplresult);
end;

end.
