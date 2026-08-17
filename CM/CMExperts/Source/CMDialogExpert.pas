unit CMDialogExpert;

interface

uses
  CMRepositoryExpert, Windows;

type
  TCMDialogExpert = class(TCMRepositoryExpert)
  private
  protected
  public
    function GetName: string; override;
    function GetComment: string; override;
    function GetGlyph: HICON; override;
    procedure Execute; override;
  end;

procedure Register;

implementation

uses
  ExptIntf, toolintf, editintf, ShellAPI;

procedure Register;
begin
end;

{ TCMDialogExpert }

procedure TCMDialogExpert.Execute;
var
  modi: TIModuleInterface;
begin
  if ToolServices <> nil then
  begin
    ToolServices.CreateModule('Teste', nil, nil, [cmAddToProject, cmShowForm, cmUnNamed, cmNewForm, cmMarkModified]);
  end;
end;

function TCMDialogExpert.GetComment: string;
begin
  Result := 'Cria um novo Form OKCancela';
end;

function TCMDialogExpert.GetGlyph: HICON;
begin
  try
    Result := ExtractIcon(HINSTANCE, 'CMExperts.bpl', 1);
  except
    Result := 0;
  end;
end;

function TCMDialogExpert.GetName: string;
begin
  Result := 'Form OkCancela';
end;

end.
 