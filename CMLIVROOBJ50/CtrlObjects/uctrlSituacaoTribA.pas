unit uctrlSituacaoTribA;

interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient;
  Type
    TCtrlSituacaoTribTabA = Class(TCmControlObject)

    private

    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      {Lista as situações tributárias da tabela b do manual do Sintegra}
      function ListSituacaoTribTabA(Situacao : integer) : OleVariant;

    protected

    End;


implementation

{ TCtrlSituacaoTribTabA }

constructor TCtrlSituacaoTribTabA.Create;
begin
  inherited;

end;

destructor TCtrlSituacaoTribTabA.Destroy;
begin
  inherited;

end;

procedure TCtrlSituacaoTribTabA.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlSituacaoTribTabA.ListSituacaoTribTabA(Situacao: integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT SITUACAOTRIB, DESCSITUACAOTRIB '+
          '  FROM SITUACAOTRIBTABA ';
  if Situacao <> -1 then
     Ssql := Ssql + ' WHERE SITUACAOTRIBA = '+intTostr(Situacao) + ' '+
                    ' ORDER BY DESCRICAO'
  else
     Ssql := Ssql + ' ORDER BY DESCRICAO';
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlSituacaoTribTabA.OnCreateAppServer;
begin
  inherited;

end;

end.

