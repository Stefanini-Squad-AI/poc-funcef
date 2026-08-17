unit IdDiscardServer;

interface

{
2000-Apr-22: J Peter Mugass
  Ported to Indy
1999-Apr-13
  Final Version
2000-JAN-13 MTL
  Moved to new Palette Scheme (Winshoes Servers)
Original Author: Ozz Nixon
}

uses
  Classes,
  IdTCPServer;

Type
  TIdDISCARDServer = class ( TIdTCPServer )
  protected
    function DoExecute ( Thread : TIdPeerThread ): boolean; override;
  public
    constructor Create ( AOwner : TComponent) ; override;
  published
  end;

implementation

uses
  IdGlobal,
  SysUtils;

constructor TIdDISCARDServer.Create ( AOwner : TComponent );
begin
  inherited;
  DefaultPort := IdPORT_DISCARD;
end;

function TIdDISCARDServer.DoExecute ( Thread : TIdPeerThread ) : boolean;
begin
  result := true;
  with Thread.Connection do begin
    while Connected do begin
      {discard it}
      RemoveXBytesFromBuffer(CurrentReadBufferSize);
    end;
  end;
end; {doExecute}

end.