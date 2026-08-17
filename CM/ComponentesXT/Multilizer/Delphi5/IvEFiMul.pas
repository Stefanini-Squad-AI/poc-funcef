unit IvEFiMul;

interface

uses
  Classes, IvAMulti, IvFiMult;

type
  TIvEmbeddedDictionary = class(TIvFileDictionary)
  public
    constructor Create(owner: TComponent); override;

  published
    property Storage default ivsEmbedded;
  end;

implementation

constructor TIvEmbeddedDictionary.Create(owner: TComponent);
begin
  inherited Create(owner);
  FStorage := ivsEmbedded;
end;

end.

