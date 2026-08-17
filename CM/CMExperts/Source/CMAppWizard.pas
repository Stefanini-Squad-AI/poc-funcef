unit CMAppWizard;

interface

procedure Register;

implementation

uses
  Windows, ToolsAPI, graphics, fCMAppWiz, ShellAPI, SysUtils, CMAppWizConsts,
  FileCtrl, FSM_FxLib, classes, dialogs;

const
  ProjectPath = 'C:\ProjetosCM5\%s\Fontes\';

type
  TCMAppWizard = class(TNotifierObject, IOTAProjectWizard, IOTARepositoryWizard, IOTAWizard)
  public
    procedure Execute;
    function GetIDString: string;
    function GetState: TWizardState;
    function GetName: string;
    // IOTARepositoryWizard
    function GetAuthor: string;
    function GetComment: string;
    function GetPage: string;
    function GetGlyph: HICON;
  end;

  TCMProjectCreator = class(TInterfacedObject, IOTACreator, IOTAProjectCreator)
  private
    FIdModulo: Integer;
    FNomeDPR: string;
    FTitulo: string;
  public
    constructor Create(IdModulo: Integer; const NomeDPR, Titulo: string);
    // IOTACreator
    function GetCreatorType: string;
    function GetExisting: Boolean;
    function GetFileSystem: string;
    function GetOwner: IOTAModule;
    function GetUnnamed: Boolean;
    // IOTAProjectCreator
    function GetFileName: string;
    function GetOptionFileName: string;
    function GetShowSource: Boolean;
    procedure NewDefaultModule;
    function NewOptionSource(const ProjectName: string): IOTAFile;
    procedure NewProjectResource(const Project: IOTAProject);
    function NewProjectSource(const ProjectName: string): IOTAFile;
  end;

  TCMAppSourceFile = class(TInterfacedObject, IOTAFile)
  private
    FSource: string;
  public
    function GetSource: string;
    function GetAge: TDateTime;
    constructor Create(IdModulo: Integer; const NomeDPR, Titulo: string);
  end;

procedure Register;
begin
  RegisterPackageWizard(TCMAppWizard.Create);
end;

{ TCMAppWizard }
procedure TCMAppWizard.Execute;
var
  DirProjeto, NomeDPR, NomeDPRExt, Titulo : string;
  IdModulo : Integer;
  i : TFileExtension;
begin
  if TfrmCMAppWiz.Execute(IDModulo, NomeDPR, Titulo) then
  begin
    DirProjeto := Format(ProjectPath, [NomeDPR]);

    If Not DirectoryExists(Copy(DirProjeto,1, Length(DirProjeto) - 7) + 'Dcu') Then
       ForceDirectories(Copy(DirProjeto,1, Length(DirProjeto) - 7) + 'Dcu');


    NomeDPRExt := NomeDPR + '.dpr';


    if FileExists(DirProjeto + NomeDPRExt) then
      if MsgConfirm('Já Existe um projeto com o nome ' + NomeDPR + #13#10 +
                    'Deseja sobrescreve-lo ?') <> idYes then
      begin
        Exit;
      end;
    if not ForceDirectories(DirProjeto) then
    begin
      MsgError('Não foi possível criar o diretório ' + DirProjeto);
      Exit;
    end;
    with TStringList.Create do
      try
        for i := Low(TFileExtension) to High(TFileExtension) do
        begin
          Text := StringReplace(CMProjectFiles[i], '%DPRNAME%', NomeDPR, [rfReplaceAll]);
          Text := StringReplace(Text, '%NOMEMODULO%', NomeDPR, [rfReplaceAll]);
          Text := StringReplace(Text, '%IDMODULO%', IntToStr(IdModulo), [rfReplaceAll]);
          Text := StringReplace(Text, '%TITULO%', Titulo, [rfReplaceAll]);
          SaveToFile(DirProjeto + StringReplace(CMProjectFilesName[i], '%DPRNAME%', NomeDPR, [rfReplaceAll]));
        end;
      finally
        Free;
      end;
    ((BorlandIDEServices as IOTAModuleServices).CreateModule(TCMProjectCreator.Create(IDModulo, NomeDPR, Titulo))).Save(False, True);
  end;
end;

function TCMAppWizard.GetAuthor: string;
begin
  Result := 'CM Soluções Informática';
end;

function TCMAppWizard.GetComment: string;
begin
  Result := 'Cria um novo Sistema no Padrão CM Soluções';
end;

function TCMAppWizard.GetGlyph: HICON;
begin
  try
    Result := ExtractIcon(HINSTANCE, 'CMExperts.bpl', 9);
  except
    Result := 0;
  end;
end;

function TCMAppWizard.GetIDString: string;
begin
  Result := 'cmsolucoes.' + ClassName;
end;

function TCMAppWizard.GetName: string;
begin
  Result := 'Aplicação Padrão CM';
end;

function TCMAppWizard.GetPage: string;
begin
  Result := 'CM Soluções';
end;

function TCMAppWizard.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

{ TCMProjectCreator }
constructor TCMProjectCreator.Create(IdModulo: Integer; const NomeDPR, Titulo: string);
begin
  inherited Create;
  FIdModulo := IdModulo;
  FNomeDPR := NomeDPR;
  FTitulo := Titulo;
end;

function TCMProjectCreator.GetCreatorType: string;
begin
  Result := sApplication;
end;

function TCMProjectCreator.GetExisting: Boolean;
begin
  Result := False;
end;

function TCMProjectCreator.GetFileName: string;
begin
  Result := Format(ProjectPath, [FNomeDPR]) + FNomeDPR + '.dpr';
end;

function TCMProjectCreator.GetFileSystem: string;
begin
  Result := '';
end;

function TCMProjectCreator.GetOptionFileName: string;
begin
  Result := '';
end;

function TCMProjectCreator.GetOwner: IOTAModule;
begin
  Result := nil;
end;

function TCMProjectCreator.GetShowSource: Boolean;
begin
  Result := True;
end;

function TCMProjectCreator.GetUnnamed: Boolean;
begin
  Result := True;
end;

procedure TCMProjectCreator.NewDefaultModule;
begin
end;

function TCMProjectCreator.NewOptionSource(
  const ProjectName: string): IOTAFile;
begin
  Result := nil;
end;

procedure TCMProjectCreator.NewProjectResource(const Project: IOTAProject);
begin

end;

function TCMProjectCreator.NewProjectSource(
  const ProjectName: string): IOTAFile;
begin
  Result := TCMAppSourceFile.Create(FIdModulo, FNomeDPR, FTitulo);
end;

{ TCMAppSourceFile }
constructor TCMAppSourceFile.Create(IdModulo: Integer; const NomeDPR,
  Titulo: string);
begin
  FSource := StringReplace(FileDpr, '%DPRNAME%', NomeDPR, [rfReplaceAll]);
  FSource := StringReplace(FSource, '%NOMEMODULO%', NomeDPR, [rfReplaceAll]);
  FSource := StringReplace(FSource, '%IDMODULO%', IntToStr(IdModulo), [rfReplaceAll]);
  FSource := StringReplace(FSource, '%TITULO%', Titulo, [rfReplaceAll]);
  inherited Create;
end;

function TCMAppSourceFile.GetAge: TDateTime;
begin
  Result := -1;
end;

function TCMAppSourceFile.GetSource: string;
begin
  Result := FSource;
end;

end.
