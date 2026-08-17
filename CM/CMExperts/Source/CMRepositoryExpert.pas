unit CMRepositoryExpert;

interface

uses
  Windows, CMExpert, ToolIntf, ExptIntf;

type
  TCMRepositoryExpert = class(TCMExpert)
  private
  protected
    procedure DoClick(Sender: TIMenuItemIntf); override;
  public
    function GetStyle: TExpertStyle; override;
    procedure Execute; override;
  end;

implementation

{ TCMRepositoryExpert }

procedure TCMRepositoryExpert.DoClick(Sender: TIMenuItemIntf);
begin
end;

procedure TCMRepositoryExpert.Execute;
begin
end;

function TCMRepositoryExpert.GetStyle: TExpertStyle;
begin
  Result := esForm;
end;

end.
