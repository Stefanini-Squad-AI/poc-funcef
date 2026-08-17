unit CMOTAFile;

interface

uses
  ToolsAPI;

type
  TCMOTAFile = class(TInterfacedObject, IOTAFile)
  private
    FSource: string;
  public
    function GetSource: string;
    function GetAge: TDateTime;
    constructor Create(const Source: string);
  end;

implementation

{ TCMOTAFile }
constructor TCMOTAFile.Create(const Source: string);
begin
  FSource := Source;
end;

function TCMOTAFile.GetAge: TDateTime;
begin
  Result := -1;
end;

function TCMOTAFile.GetSource: string;
begin
  Result := FSource;
end;

end.
