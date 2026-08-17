unit uCtrlCliente;

interface

Uses ucmControlObject, ucmDBObject, uDbDm_cliente, uDbDm_clientextipo,
     uDbDm_tipocliente,
     DbClient, Provider, wwQuery, sysutils;

Type
  TCtrlCliente = Class(TCmControlObject)

  private
    FCliente: TDbDm_cliente;
    FClienteXTipo: TDbDm_clientextipo;
    FTipoCliente: TDbDm_tipocliente;
    FCdsCliente: TClientDataSet;
    FCdsTipoCLiente: TClientDataSet;
    FCdsClienteXTipo: TClientDataSet;
    FDspAllClienteXTipo: TDataSetProvider;
    FQryAllClienteXTipo: TwwQuery;
    procedure SetCliente(const Value: TDbDm_cliente);
    procedure SetClienteXTipo(const Value: TDbDm_clientextipo);
    procedure SetTipoCliente(const Value: TDbDm_tipocliente);
    procedure SetCdsCliente(const Value: TClientDataSet);
    procedure SetCdsClienteXTipo(const Value: TClientDataSet);
    procedure SetCdsTipoCLiente(const Value: TClientDataSet);
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
       > Client DataSet para Interface com cliente;
       > Teoricamente, para cada tela é utilizado um ClientDataSet pelo menos;
       > Um mesmo Control Object pode conter regras que serão utilizadas por várias
         interfaces e pode também fazer parte de outro Control Object
     **}
     property CdsTipoCLiente: TClientDataSet read FCdsTipoCLiente write SetCdsTipoCLiente;
     property CdsCliente: TClientDataSet read FCdsCliente write SetCdsCliente;
     property CdsClienteXTipo: TClientDataSet read FCdsClienteXTipo write SetCdsClienteXTipo;

     {**
       Objetos de Persistência da classe de controle
       >  Podem estar com escopo público caso seus atributos precisem ser acessados pela
         interface da classe de conrtole.
       > Eles já contém um Provider e um TwwQuery para utilização pela interface se
         nescessário ( recomendável ). A query da classe de persistência e montada
         dinamicamente e seu SQL é aberto sempre os campos chave na cláusula WHERE de forma
         automática. Caso queira se personalizar o SQL basta sobrescrevermos o método
         GETSQLSELECT. As procedures MONTAWHERE e GERFIELDSFORSELECT podes ser utilizadas
         pois estão no escopo PROTECTES da classe
     **}
     property TipoCliente: TDbDm_tipocliente read FTipoCliente write SetTipoCliente;
     property Cliente: TDbDm_cliente read FCliente write SetCliente;
     property ClienteXTipo: TDbDm_clientextipo read FClienteXTipo write SetClienteXTipo;

     {**
       Além da QUERYE e do DATASETPROVIDER de cada classe de persistência, podemos ter implmentados
       em nossa classe de negócio tantas QUERYES quanto nescessário, lembrando sempre que
       elas serão representadas pelos CLIENTDATASETS em nossa interface com o usuário e que,
       para cada QUERYE temos o seu respectivo DATASETPROVIDER.
       Como exemplo vamos criar uma Consulta com dados do cliente e do tipo para serem
       visualizados num GRID
     **}
      property QryAllClienteXTipo: TwwQuery read FQryAllClienteXTipo;
      property DspAllClienteXTipo: TDataSetProvider read FDspAllClienteXTipo;

     {**
       Métodos da classe de negócio.
       > O Ideal é que os métodos sejam implementados como function para que o retono
         da função defina a ação para a interface que a chamou.
       > É interessante observar que não devemos utilizar funções de mensagem ou avisos em
         tela, uma vez que isso fica por conta da interface. Todas as mensagens a serem enviadas
         a interface, seja ela de erro ou de informação devem ser atribuidaqs a propriedade
         message info, podendo na interface ser acessada pela propria propriedade ou através do
         evento OnMessageInfo da classe de controle.
       > Deve ser implementado o controle de transação de acordo com a função executada
         lembrando sempre que o processo deve ser encerrado no escopo da função e acessadas
         pelos métodos de transação da Classe de COntrole ( StartTransaction, Comit e Rollback ).
         Podemos ainda fazer uso da propriedade OpenTransaction para controlar a transação quando
         fazemos chamadas recursivas a funções ou utilizamos várias funções num mesmo escopo.
       > Todos os métodos da classe de persistência são funcões de esta também possui o
         atributo de mensagem.
       > Para atribuir os valores dos ClientDataSets para as classes de persistência podemos,
         no caso da ausência de algum procedimento especial, utilizar o método CDSTODBOBJECT
         da classe de controle.
       > Deve sempre ser feita a chamada nas funções de negócio a função da interface caso essa
         esteja sendo usada em modo cliente ( Testar ConnectionSide )
     **}

     function InsereTipoCliente: Boolean;
     function AlteraTipoCliente: Boolean;
     function ExcluiTipoCliente(Id: Int64): Boolean;

     function InsereCliente: Boolean;
     function AlteraCliente: Boolean;
     function ExcluiCliente(Id: Int64): Boolean;

     {**
       > A partir deste ponto implementar a aplicação servidora apenas com os DATASETPROVIDERS
         a serem utilizados pela tela cliente e com as associações do s objetos de controle.
         Mesmo que a sua aplicação não trabalhe acessando o servidor de aplicações, a sua
         classe de negócio precisa estar "funcionando" ao menos para te fornecer as queryes.
         Isso podia acontecer de duas formas:
            1) Se todas as classes de negócios fossem componentes visuais que, uma vez adicionados
               ao form, estariam autoaticamente "funcionando" em tempo de desenho.
            2) Se todas as classes de negócios estivessem numa aplicação servidora e, como dito
               acima, os providers associados com os CLIENTDATASETS das aplicações de negócio.
         A segunda forma é mais interessante pois futuramente teriamos que implementar a aplicação
         servidora com todas as chamadas a classe de negócio e, dessa forma, adiantamos um pouco
         o nosso trabalho implementando ao menos os DATASETPROVIDERS que utilizaremos em nossa
         aplicação.
        > Apoós essa implementação podemos implementar nossa tela CLIENTE
     **}
  end;

implementation

Uses uSistema;

{ TCtrlCliente }

function TCtrlCliente.AlteraCliente: Boolean;
begin

end;

function TCtrlCliente.AlteraTipoCliente: Boolean;
begin
  If ConnectionSide = cnsClient
   Then
  Begin
     Result := Connection.AppServer.AlteraTipoCliente(FCdsTipoCLiente.Data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           CdsToDbObject(FCdsTipoCLiente,TCMDbObject(fTipoCliente));

           Result := fTipoCliente.Update;

           if Result Then
              Commit
           Else
             Begin
                Rollback;
                MessageInfo := fTipoCliente.MessageInfo;
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

constructor TCtrlCliente.Create;
  function GetSQLAllClientexTipo: String;
  Begin
     Result := 'SELECT ' +
               '   C.IDDM_CLIENTE, C.NOMEDM_CLIENTE , T.DESCDM_TIPOCLIENTE ' +
               'FROM ' +
               '   DM_CLIENTE C, DM_TIPOCLIENTE T, DM_CLIENTEXTIPO CXT ' +
               'WHERE ' +
               '   C.IDDM_CLIENTE = CXT.IDDM_CLIENTE AND ' +
               '   T.IDDM_TIPOCLIENTE = CXT.IDDM_TIPOCLIENTE ' +
               'ORDER ' +
               '   BY C.NOMEDM_CLIENTE , T.DESCDM_TIPOCLIENTE';
  End;
begin
  inherited;
  FCliente := TDbDm_cliente.Create;
  FClienteXTipo := TDbDm_clientextipo.Create;
  FTipoCliente := TDbDm_tipocliente.Create;
  FCdsCliente := TClientDataSet.Create(nil);
  FCdsTipoCLiente := TClientDataSet.Create(nil);
  FCdsClienteXTipo := TClientDataSet.Create(nil);

  FQryAllClienteXTipo := TwwQuery.Create(nil);
  FQryAllClienteXTipo.Sql.Text := GetSQLAllClientexTipo;
  
  FDspAllClienteXTipo := TDataSetProvider.Create(nil); 
  FDspAllClienteXTipo.DataSet := FQryAllClienteXTipo;
end;

destructor TCtrlCliente.Destroy;
begin
  FCliente.Free;
  FClienteXTipo.Free;
  FTipoCliente.Free;
  FCdsCliente.Free;
  FCdsTipoCLiente.Free;
  FCdsClienteXTipo.Free;

  FDspAllClienteXTipo.DataSet := nil;
  FDspAllClienteXTipo.Free;

  FQryAllClienteXTipo.Free;

  inherited;
end;

procedure TCtrlCliente.DoChangeDataBase;
begin
  inherited;
  FCliente.DataBaseName := DataBaseName;
  FClienteXTipo.DataBaseName := DataBaseName;
  FTipoCliente.DataBaseName := DataBaseName;
  FQryAllClienteXTipo.DataBaseName := DataBaseName;
end;

function TCtrlCliente.ExcluiCliente(Id: Int64): Boolean;
begin

end;

function TCtrlCliente.ExcluiTipoCliente(Id: Int64): Boolean;
begin

end;

function TCtrlCliente.InsereCliente: Boolean;
begin

end;

function TCtrlCliente.InsereTipoCliente: Boolean;
begin
  {**
    Verifica-se o modo de trabalho da classe de negócio:
    > Se for um cliente é feita uma chamada ao método da interface da aplicação servidora
    > Se for um servidor é impleemtada o controle da transação, passagem dos campos
      do CLIENTDATASET para o DBOBJECT e chama dos métodos do DBOBJECT.
    Em ambos as situações acima é impressincível o tratamento do MESSAGEINFO e do result
    das funções utilizadas para a garantir a segurança do processo
  **}
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.InsereTipoCliente(FCdsTipoCLiente.Data);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;

           CdsToDbObject(FCdsTipoCLiente,TCMDbObject(fTipoCliente));

           Result := fTipoCliente.Insert;

           if Result Then
              Commit
           Else
             Begin
                Rollback;
                MessageInfo := fTipoCliente.MessageInfo;
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

procedure TCtrlCliente.SetCdsCliente(const Value: TClientDataSet);
begin
  FCdsCliente := Value;
end;

procedure TCtrlCliente.SetCdsClienteXTipo(const Value: TClientDataSet);
begin
  FCdsClienteXTipo := Value;
end;

procedure TCtrlCliente.SetCdsTipoCLiente(const Value: TClientDataSet);
begin
  FCdsTipoCLiente := Value;
end;

procedure TCtrlCliente.SetCliente(const Value: TDbDm_cliente);
begin
  FCliente := Value;
end;

procedure TCtrlCliente.SetClienteXTipo(const Value: TDbDm_clientextipo);
begin
  FClienteXTipo := Value;
end;

procedure TCtrlCliente.SetTipoCliente(const Value: TDbDm_tipocliente);
begin
  FTipoCliente := Value;
end;

end.
