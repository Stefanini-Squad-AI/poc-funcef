unit uCtrlSituacaoTribTab;

interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient;
  Type
    TCtrlSituacaoTribTab = Class(TCmControlObject)

    private

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      {Lista as situações tributárias da tabela b do manual do Sintegra}
      function ListSituacaoTribTabB(Situacao : integer) : OleVariant;

    protected

    End;


implementation

{ TCtrlSituacaoTribTab }

constructor TCtrlSituacaoTribTab.Create;
begin
  inherited;

end;

destructor TCtrlSituacaoTribTab.Destroy;
begin
  inherited;

end;

procedure TCtrlSituacaoTribTab.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlSituacaoTribTab.ListSituacaoTribTabB(Situacao: integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT SITUACAOTRIB, DESCSITUACAOTRIB '+
          '  FROM SITUACAOTRIBTABB ';
  if Situacao <> -1 then
     Ssql := Ssql + ' WHERE SITUACAOTRIB = '+intTostr(Situacao) + ' '+
                    ' ORDER BY DESCSITUACAOTRIB'
  else
     Ssql := Ssql + ' ORDER BY DESCSITUACAOTRIB';
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlSituacaoTribTab.OnCreateAppServer;
begin
  inherited;

end;

end.
 