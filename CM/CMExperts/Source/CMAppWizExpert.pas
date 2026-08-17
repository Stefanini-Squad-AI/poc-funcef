unit CMAppWizExpert;

interface

uses
  Windows, CMRepositoryExpert, ExptIntf;

type
  TCMAppWizard = class(TCMRepositoryExpert)
  private
  protected
  public
    function GetName: string; override;
    function GetStyle: TExpertStyle; override;
    function GetComment: string; override;
    function GetGlyph: HICON; override;
    procedure Execute; override;
  end;

procedure Register;

implementation

uses
  graphics, fCMAppWiz, ShellAPI;

procedure Register;
begin

end;

{ TCMAppWizard }
procedure TCMAppWizard.Execute;
Var
  Idmodulo :Integer;
  NomeDpr :String;
  TituloApp :String;
begin
  Idmodulo := 0;
  NomeDpr := '';
  TituloApp := '';

  TfrmCMAppWiz.Execute(Idmodulo,NomeDpr,TituloApp);
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

function TCMAppWizard.GetName: string;
begin
  Result := 'Sistema Padrão CM';
end;

function TCMAppWizard.GetStyle: TExpertStyle;
begin
  Result := esProject;
end;

end.
