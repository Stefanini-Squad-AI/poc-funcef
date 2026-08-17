unit CMModuleCreator;

interface

uses
  ToolsAPI;
  
type
  TCMModuleCreator = class(TInterfacedObject, IOTACreator, IOTAModuleCreator)
  private
    FAncestorName: string;
  public                                       
    constructor Create(const AncestorName: string);
    // IOTACreator
    function GetCreatorType: string;
    function GetExisting: Boolean;
    function GetFileSystem: string;
    function GetOwner: IOTAModule;
    function GetUnnamed: Boolean;
    // IOTAModuleCreator
    function GetAncestorName: string;
    function GetImplFileName: string;
    function GetIntfFileName: string;
    function GetFormName: string;
    function GetMainForm: Boolean;
    function GetShowForm: Boolean;
    function GetShowSource: Boolean;
    function NewFormFile(const FormIdent, AncestorIdent: string): IOTAFile;
    function NewImplSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    function NewIntfSource(const ModuleIdent, FormIdent, AncestorIdent: string): IOTAFile;
    procedure FormCreated(const FormEditor: IOTAFormEditor);
  end;

implementation

{ TCMModuleCreator }

constructor TCMModuleCreator.Create(const AncestorName: string);
begin
  inherited Create;
  FAncestorName := AncestorName;
end;

procedure TCMModuleCreator.FormCreated(const FormEditor: IOTAFormEditor);
begin
//
end;

function TCMModuleCreator.GetAncestorName: string;
begin
  Result := FAncestorName;
end;

function TCMModuleCreator.GetCreatorType: string;
begin
  Result := sForm;
end;

function TCMModuleCreator.GetExisting: Boolean;
begin
  Result := False;
end;

function TCMModuleCreator.GetFileSystem: string;
begin
  Result := '';
end;

function TCMModuleCreator.GetFormName: string;
begin
  Result := '';
end;

function TCMModuleCreator.GetImplFileName: string;
begin
  Result := '';
end;

function TCMModuleCreator.GetIntfFileName: string;
begin
  Result := '';
end;

function TCMModuleCreator.GetMainForm: Boolean;
begin
  Result := False;
end;

function TCMModuleCreator.GetOwner: IOTAModule;
begin
  Result := nil;
end;

function TCMModuleCreator.GetShowForm: Boolean;
begin
  Result := True;
end;

function TCMModuleCreator.GetShowSource: Boolean;
begin
  Result := True;
end;

function TCMModuleCreator.GetUnnamed: Boolean;
begin
  Result := True;
end;

function TCMModuleCreator.NewFormFile(const FormIdent,
  AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

function TCMModuleCreator.NewImplSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

function TCMModuleCreator.NewIntfSource(const ModuleIdent, FormIdent,
  AncestorIdent: string): IOTAFile;
begin
  Result := nil;
end;

end.
