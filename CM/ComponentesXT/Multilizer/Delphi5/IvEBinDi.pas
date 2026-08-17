unit IvEBinDi;

interface

uses
  Classes, IvAMulti, IvBinDic;

type
  TIvEmbeddedBinaryDictionary = class(TIvBinaryDictionary)
  public
    constructor Create(owner: TComponent); override;

  published
    property Storage default ivsEmbedded;
  end;

implementation

constructor TIvEmbeddedBinaryDictionary.Create(owner: TComponent);
begin
  inherited Create(owner);
  FStorage := ivsEmbedded;
end;

end.

