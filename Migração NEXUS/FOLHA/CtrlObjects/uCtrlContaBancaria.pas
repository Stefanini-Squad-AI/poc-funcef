unit uCtrlContaBancaria;

interface

Uses ucmControlObject, ucmDBObject, uDbBanco, uDbAgenciaBancaria,
     uDbContaBancaria, DbClient, Provider, wwQuery, sysutils;

Type
  TCtrlContaBancaria = Class(TCmControlObject)

  private
    FBanco: TDbBanco;
    FAgenciaBancaria: TDbAgenciaBancaria;
    FContaBancaria: TDbContaBancaria;
    FCdsBanco: TClientDataSet;
    FCdsAgenciaBancaria: TClientDataSet;
    FCdsContaBancaria: TClientDataSet;
    procedure SetBanco(const Value: TDbBanco);
    procedure SetAgenciaBancaria(const Value: TDbAgenciaBancaria);
    procedure SetContaBancaria(const Value: TDbContaBancaria);
    procedure SetCdsBanco(const Value: TClientDataSet);
    procedure SetCdsAgenciaBancaria(const Value: TClientDataSet);
    procedure SetCdsContaBancaria(const Value: TClientDataSet);
    {**
      Esta procedure é sobrescrita para garantir que os objetos de persistência
      acessem o mesmo database que o objeto de controle ou qualquer dataset implementado
      na classe de controle
    **}
    procedure DoChangeDataBase; Override;
  protected
  public
    Constructor Create; Override;
    Destructor Destroy; Override;
    {**
      > Client DataSet para Interface com Banco;
      > Teoricamente, para cada tela é utilizado um ClientDataSet pelo menos;
      > Um mesmo Control Object pode conter regras que serão utilizadas por várias
        interfaces e pode também fazer parte de outro Control Object
    **}
    property CdsContaBancaria: TClientDataSet read FCdsContaBancaria write SetCdsContaBancaria;
    property CdsBanco: TClientDataSet read FCdsBanco write SetCdsBanco;
    property CdsAgenciaBancaria: TClientDataSet read FCdsAgenciaBancaria write SetCdsAgenciaBancaria;
    property ContaBancaria: TDbContaBancaria read FContaBancaria write SetContaBancaria;
    property Banco: TDbBanco read FBanco write SetBanco;
    property AgenciaBancaria: TDbAgenciaBancaria read FAgenciaBancaria write SetAgenciaBancaria;
    function InsereContaBancaria: Boolean;
    function AlteraContaBancaria: Boolean;
    function ExcluiContaBancaria(Id: Int64): Boolean;
  end;

implementation

Uses uSistema;

{ TCtrlContaBancaria }

function TCtrlContaBancaria.AlteraContaBancaria: Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
    Result:=Connection.AppServer.AlteraContaBancaria(FCdsContaBancaria.Data);
    if not Result then
      MessageInfo:=Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      CdsToDbObject(FCdsContaBancaria, TCMDbObject(fContaBancaria));
      Result:=fContaBancaria.Update;
      if Result then
        Commit
      else
      begin
        Rollback;
        MessageInfo:=fContaBancaria.MessageInfo;
      end;
    except
      on E:Exception do
      begin
        Rollback;
        Result:=False;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

constructor TCtrlContaBancaria.Create;

  function GetSQLAllAgenciaBancaria: String;
  Begin
     Result := 'SELECT ' +
               '   C.IDDM_Banco, C.NOMEDM_Banco , T.DESCDM_ContaBancaria ' +
               'FROM ' +
               '   DM_Banco C, DM_ContaBancaria T, DM_AgenciaBancaria CXT ' +
               'WHERE ' +
               '   C.IDDM_Banco = CXT.IDDM_Banco AND ' +
               '   T.IDDM_ContaBancaria = CXT.IDDM_ContaBancaria ' +
               'ORDER ' +
               '   BY C.NOMEDM_Banco , T.DESCDM_ContaBancaria';
  End;

begin
  inherited;
  fBanco:=TDbBanco.Create;
  fAgenciaBancaria:=TDbAgenciaBancaria.Create;
  fContaBancaria:=TDbContaBancaria.Create;
  fCdsBanco:=TClientDataSet.Create(nil);
  fCdsContaBancaria:=TClientDataSet.Create(nil);
  fCdsAgenciaBancaria:=TClientDataSet.Create(nil);

  FQryAllAgenciaBancaria := TwwQuery.Create(nil);
  FQryAllAgenciaBancaria.Sql.Text := GetSQLAllAgenciaBancaria;

  FDspAllAgenciaBancaria := TDataSetProvider.Create(nil);
  FDspAllAgenciaBancaria.DataSet := FQryAllAgenciaBancaria;
end;

destructor TCtrlContaBancaria.Destroy;
begin
  FBanco.Free;
  FAgenciaBancaria.Free;
  FContaBancaria.Free;
  FCdsBanco.Free;
  FCdsContaBancaria.Free;
  FCdsAgenciaBancaria.Free;

  FDspAllAgenciaBancaria.DataSet := nil;
  FDspAllAgenciaBancaria.Free;

  FQryAllAgenciaBancaria.Free;

  inherited;
end;

procedure TCtrlContaBancaria.DoChangeDataBase;
begin
  inherited;
  FBanco.DataBaseName := DataBaseName;
  FAgenciaBancaria.DataBaseName := DataBaseName;
  FContaBancaria.DataBaseName := DataBaseName;
  FQryAllAgenciaBancaria.DataBaseName := DataBaseName;
end;

function TCtrlContaBancaria.ExcluiBanco(Id: Int64): Boolean;
begin

end;

function TCtrlContaBancaria.ExcluiContaBancaria(Id: Int64): Boolean;
begin

end;

function TCtrlContaBancaria.InsereBanco: Boolean;
begin

end;

function TCtrlContaBancaria.InsereContaBancaria: Boolean;
begin
  {**
    Verifica-se o modo de trabalho da classe de negócio:
    > Se for um Banco é feita uma chamada ao método da interface da aplicação servidora
    > Se for um servidor é impleemtada o controle da transação, passagem dos campos
      do CLIENTDATASET para o DBOBJECT e chama dos métodos do DBOBJECT.
    Em ambos as situações acima é impressincível o tratamento do MESSAGEINFO e do result
    das funções utilizadas para a garantir a segurança do processo
  **}
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.InsereContaBancaria(FCdsContaBancaria.Data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           CdsToDbObject(FCdsContaBancaria,TCMDbObject(fContaBancaria));

           Result := fContaBancaria.Insert;

           if Result Then
              Commit
           Else
             Begin
                Rollback;
                MessageInfo := fContaBancaria.MessageInfo;
             End;
        except
           On E:Exception Do
           Begin
              Rollback;
              Result := False;
              MessageInfo := E.Message;
           End;
        End;
     End;
end;

procedure TCtrlContaBancaria.SetCdsBanco(const Value: TClientDataSet);
begin
  FCdsBanco := Value;
end;

procedure TCtrlContaBancaria.SetCdsAgenciaBancaria(const Value: TClientDataSet);
begin
  FCdsAgenciaBancaria := Value;
end;

procedure TCtrlContaBancaria.SetCdsContaBancaria(const Value: TClientDataSet);
begin
  FCdsContaBancaria := Value;
end;

procedure TCtrlContaBancaria.SetBanco(const Value: TDbDm_Banco);
begin
  FBanco := Value;
end;

procedure TCtrlContaBancaria.SetAgenciaBancaria(const Value: TDbDm_AgenciaBancaria);
begin
  FAgenciaBancaria := Value;
end;

procedure TCtrlContaBancaria.SetContaBancaria(const Value: TDbDm_ContaBancaria);
begin
  FContaBancaria := Value;
end;

end.
