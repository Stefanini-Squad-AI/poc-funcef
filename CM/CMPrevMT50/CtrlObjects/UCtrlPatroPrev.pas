unit UCtrlPatroPrev;

interface

Uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet,
     {$IFDEF VERSAO0505} uComum, uSistema, {$ELSE} uCMTypes, {$ENDIF}
     uDbPatro, uCtrlPatro;

Type

  TCtrlPatroPrev = class(TCtrlPatro)
  private
    FCdsPatro: TCMClientDataSet;
    FDbPatro: TDbPatro;

  protected

    procedure DoChangeDataBase; Override;

  public

    function ListaPatro : OleVariant;
    function SelecionaPatro( iIdPatro : Integer ) : OleVariant;
    function ExistePatro   ( iIdPatro : Integer ) : Boolean;

  published

end;

implementation

{ TCtrlPatroPrev }

procedure TCtrlPatroPrev.DoChangeDataBase;
begin
  inherited;
  FDbPatro.DataBaseName := Self.DataBaseName;
end;


function TCtrlPatroPrev.SelecionaPatro( iIdPatro : Integer): OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.SelecionaPatro( iIdPatro );
  end else begin
    FDbPatro.IdPessoa.AsInteger := iIdPatro;
    Result := GetDataPacket( FDbPatro.SSqlSelect );
  end;
end;


function TCtrlPatroPrev.ExistePatro(iIdPatro: Integer): Boolean;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.OutraSelecionaPadrao;
  end else begin
    FDbPatro.IdPessoa.AsInteger := iIdPatro;
    FCdsPatro.Data := GetDataPacket( FDbPatro.SSqlSelect );
    Result := Not FCdsPatro.IsEmpty;
  end;
end;

function TCtrlPatroPrev.ListaPatro: OleVariant;
begin
  if ConnectionSide = cnsclient then begin
    Result := Connection.AppServer.ListaPatro;
  end else begin
    Result := GetDataPacket( 'SELECT PAT.IDPESSOA, PES.NOME '+
                             'FROM PESSOA PES, PATRO PAT '+
                             'WHERE PAT.IDPESSOA = PES.IDPESSOA '+
                             'ORDER BY PES.NOME ' );
  end;
end;

end.

