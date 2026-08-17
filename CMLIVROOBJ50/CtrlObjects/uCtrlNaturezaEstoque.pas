unit uCtrlNaturezaEstoque;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient;
  Type
    TCtrlNaturezaEstoque = Class(TCmControlObject)

    private
    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;
      function ListNaturezaEstoque : OleVariant;

    protected

    End;


implementation

{ TCtrlNaturezaEstoque }

{ TCtrlNaturezaEstoque }

constructor TCtrlNaturezaEstoque.Create;
begin
  inherited;

end;

destructor TCtrlNaturezaEstoque.Destroy;
begin
  inherited;

end;

procedure TCtrlNaturezaEstoque.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlNaturezaEstoque.ListNaturezaEstoque: OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT CODNATUREZA, DESCNATUREZA, ROWNUM, TO_CHAR(SYSDATE,''DDMMYYYY'') AS DATA FROM NATUREZAESTOQUE '+
          ' GROUP BY CODNATUREZA, DESCNATUREZA, ROWNUM';
  Result := GetDataPacket(Ssql);
end;

procedure TCtrlNaturezaEstoque.OnCreateAppServer;
begin
  inherited;

end;

end.
