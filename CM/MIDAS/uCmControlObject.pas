{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit uCmControlObject;

{ Alex 08/12/05
  Implementados métodos: CreateDataSetParams e OpenDataSetParams
}

{ 14/02/05 Alex Pereira - Pend: 18640
 Alterar a forma de execução da query, com a query abaixo dava erro
insert into LANCAMENTO
(IDSEGREGACRITER,DATASEGREGACRITER,IDSEGREGACONTR,UNIDNEGOC,TIPCODIGO,PLNCODIGO,PLANO,PLACONTA,LOTETRANSMISSAO,LACVALOR,
LACVALOFICIAL,LACVALHIST,LACVALGEREN2,LACVALGEREN1,LACVALGERENCIAL,LACTIPO,LACTIPCONVOFICIAL,LACTIPCONVGEREN2,LACTIPCONVGEREN1,
LACTIPCONVGER,LACORIGEMAPLIC,LACNUMLAN,LACNUMDOC,LACHIST5,LACHIST4,LACHIST3,LACHIST2,LACHIST1,LACDEBCRE,LACATOUTMOEDA,
IDUSUARIOINCLUSAO,IDPLANOPREV,IDPESSOA,IDPATRO,IDMODULO,IDEMPRESA,IDELEMDEMONSTRAT,HITCODHIST,CODSUBCONTA,CODCENTROCUSTO)
values (null,null,null,170,'03',186905,4,'521403',null,ROUND(24.98,2),ROUND(0,2),ROUND(0,2),ROUND(0,2),ROUND(0,2),ROUND(0,2),
'2','D','D','D','D','',42,'20050131','',
'ICRO CAMERA E 1 MONITOR " DE 14P',
'CIRCUITO INTERNO DE TV COMPOSTO DE: 01 M','5169',
'Depreciação do Custo de Aquisição','D','N',3,9,1,127094,7,1,null,'',null,'0116'

o erro acontecia pelo " ou pelo : , retirando um dos dois funcionava
Colocada a propiedade paramchek do twwquery para false.
O sistema estava confundindo o caracter : como um parâmetro
}


interface

Uses
     Classes, SysUtils, Db, dbtables, mconnect,
     uCmCustomCdbObject, DbClient, uCmDbObject, ADODb, provider, uCMTypes,
     uCripto, wwQuery, uMensErro, DBaseDados, uMidasUtil, uCMFileUtils, Windows,
     uCMThreadProgresso, DControlObject;

{$I CmMsgConst.Inc}

Type
  {Classe para implementação de objetos de controle de negócio }
  {Classe para implementação de objetos de controle de negócio.
   Os Control objects se comportam como Gerenciadores de vários DbObjects.
   Neles são implementados todos os procedimentos referentes a regra de negócio do serviço
   que está sendo solicitado.
   A idéia é que para cada 'Form' ou 'Tela' tenhamos um ControlObject com para que todos os procedimentos
   executados por este 'Form' ou 'Tela' este disponível como um serviço a ser executádo.}
  TProgresso = Procedure ( vParams: Array of Variant ) of object;

  TCmControlObject = Class(TCmCustomCdbObject)
  private
     _bQryCreated: Boolean;
     _QryAdo, _lADODataSet: TADOQuery;
     _QryBde, _lBDEDataSet: TwwQuery;
    _DtmControlObject: TDtmControlObject;
    _CMThreadProgresso: TCMThreadProgresso;
    _lCds: TClientDataSet;
    _Id: Integer;
    FDataBase: TDataBase;
    FConnection: TDispatchConnection;
    FOpenTransaction: Boolean;
    FDllName: String;
    FProgresso: TProgresso;
    fProgressFileName : String;
    FPrepareDataPacket: boolean;
    procedure SetDataBase(const Value: TDataBase);
    procedure SetConnection(const Value: TDispatchConnection);
    procedure SetOpenTransaction(const Value: Boolean);
    procedure SetDllName(const Value: String);
    procedure SetProgresso(const Value: TProgresso);
    procedure GravaLogErro(sMensagem, Sql: String);

    procedure PrepareSQL(Sql: String);
    procedure SetPrepareDataPacket(const Value: boolean);
  protected
    {Client data set para manipulado internamente pela classe}
    _lDataSet: TDataSet;
    _Cds: TClientDataSet;

    _BdeDataSet: TwwQuery;

    {Este evento nos permite efetuar processamentos relativos as nossas regras de negócio no
     momento da execução do ApllyCds. Ele nos permite acessar o ClientDataSet que esta sendo
     aplicado ( aCds ), a Tabela que está sendo atualizada pelo DbObject ( sTableName),
     o tipo de atualização ( CdsState: TUpdateStatus = (usUnmodified, usModified, usInserted, usDeleted))
     e podemos ainda cancelar a atualização através da Var Accept no caso de alguma inconsistência nos dados a serem tratados.}

    procedure OpenDataSet(sSql: String);

    // alex novos métodos que tratam prepare da query
    function CreateDataSetParams(sSQL: String; ParamNames: Array of String; ParamTypes: array of TFieldType): TDataSet;
    procedure OpenDataSetParams(Ds: TDataSet; ParamNames: Array of String; ParamValues: Variant);


    procedure OnApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Var Accept: Boolean); Virtual;

    procedure DoProgresso(vParams: Array Of Variant);

    procedure AfterInitialize; Virtual;

    procedure AfterApplyCdsRecord(aCds: TClientDataSet; Const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean); Virtual;

    {Procedure executada qdo o DataBase é atribuido ao Controle
     Este procedimento deve ser sobrescrito a fim de que possamos atribuir aos nossos DataSets o
     mesmo DataBaseName ( no caso da BDE ) ou o mesmo ConnectionStrin ( no caso de ADO ) do componente de conexão utilizado em nosso ControlObject.}
    procedure DoChangeDataBase; Virtual;

    {Procedure executada quando o tipo de coneção é atribuida ao Objeto}
    //procedure DoSetConnection; Virtual;

    function GetDataBaseName: String;  Override;
    {Procedure a ser subrescrita para implementação de testes da validação da classe de controle}
    function DoValidaDados: Boolean; Virtual;
    {Move os campos do ClientDataSet da aplicação cliente para o objeto de persistência}
    procedure CdsToDbObject(Cds: TClientDataSet; DbObject: TCmDbObject);

    {Confirma a atualização do DbObject quando este deve ser persistido a partir de um recordset com
     mais de um registro.
     Ideal para cadastros do tipo Grid ou Mestre-Detalhe.
     Os parâmetros KeyFieldParent e KeyField são utilizados em cadastros Mestre-Detalhe quando a nescessidade
     de atualização de campos do detalha em função do mestre.
     Esta atualização é sempre executada na inserção e pode ser executada no update de acordo como o ChangeKeyIfUpdate}
    function ApplyCds(aCds: TClientDataSet; aDbObject: TCmDbObject; KeyFieldParent: Array of TCmDbField; KeyField: Array of TCmDbField;
    ChangeKeyIfUpdate: Boolean = False): Boolean;

    {Evento a ser executa no initialize da classe de controle quando o parâmetro IsAppServer
    for TRUE.
    Deve ser sobrescrito para que objetos a serem utilizados apenas pela aplicação servidora
    possam ser instanciados}
    procedure OnCreateAppServer; Virtual;

    procedure SetFieldValue(afield: TCmDbField; rValue: Double); Overload;
    procedure SetFieldValue(afield: TCmDbField; sValue: String); Overload;
    procedure SetFieldValue(afield: TCmDbField; iValue: Integer); Overload;
    procedure SetFieldValue(afield: TCmDbField; dValue: TDateTime); Overload;

  public
    {Contrutor da Classe}
    Constructor Create; Override;

    {Abre o SQL passado como parâmetro e retorna o DataPacket para ser utilizado por um ClientDataSet}
    function GetDataPacket(Sql: String): OleVariant; OverLoad;
    function GetDataPacket(lSql: TStrings): OleVariant; OverLoad;
    procedure GetDataPacket(aCds: TClientDataset; Sql: String); OverLoad;
    procedure GetDataPacket(aCds: TClientDataset; lSql: TStrings); OverLoad;

    function GetNextID: Integer;

    procedure InitializeAs(aSourceCtrl :TCmControlObject);


    { DAVID - 13/08/2003
      Criado parâmetro que setará a propriedade PrepareDataPacket, criada para resolver
      o problema com ADO (detectado no Auto-Atendimento]) que exibe a mensagem:
      "Either BOF or EOF is True, or the current record has been deleted."}
    {Método para inicialização dos atributos da classe}
    procedure Initialize(pDataBase: TDataBase;
    pOpenTransaction: Boolean; pDbConnectionType: TDbConnectionType = cntBde;
    pConnectionSide: TConnectionSide = cnsServer; pRemoteServer: TDispatchConnection = nil;
    bConnectaDB: Boolean = False; eOnMessage: TOnMessageInfo = nil;
    pADOConnection: TADOConnection = nil; pIsAppServer: Boolean = false;
    bPrepareDataPacket : Boolean = false );

    Destructor Destroy; Override;

    {Verifica se o Database está em transação e incia caso não esteja
    A transacao do control object é controlada pela propriedade OpenTransaction uma vez que podemos ter vários ControlObjects agregados ao um ControlObjects, nessa casso o ControlObject  agregador será responsável pela transação.}
    procedure StartTransaction;
    {Verifica se o Database está em transação e da um "commit" o processo
    A transacao do control object é controlada pela propriedade OpenTransaction uma vez que podemos ter vários ControlObjects agregados ao um ControlObjects, nessa casso o ControlObject  agregador será responsável pela transação.}
    procedure Commit;
    {Verifica se o Database está em transação e da um "rollback" o processo
    A transacao do control object é controlada pela propriedade OpenTransaction uma vez que podemos ter vários ControlObjects agregados ao um ControlObjects, nessa casso o ControlObject  agregador será responsável pela transação.}
    procedure Rollback;
    {Encerra a conexão ativa e abre um anova conexão com o usuário e senha passadoa
    o alias e selecionado a partir o .ini da aplicação
    As strings de usuário e senha são passadas encriptadas ( Two_Fish ) com chave de 128 bits e
    decriptadas no momento da atribuiçõa a conexão}
    function ConectaDb(UserName, PassWord, ServerName :String) :Boolean;
    {Disponibiliza os métodos do connection para o controlador independente do tipo de
    conexão ( DCOM, Socket, Web ou CORBA) ultilizada qdo a operação do controlador for no
    cliente}
    //andré tavares - pendência 20654 - 18/11/2005
    //Indica se há uma transação em andamento
    function InTransaction: boolean;

    property Connection :TDispatchConnection read FConnection write SetConnection;
    {Data base ultilizado para conexão}
    property DataBase :TDataBase read FDataBase write SetDataBase;
    {DataBaseName do DataBase controlador do objeto}
    property DataBaseName :String read GetDataBaseName;
    {Indica se o controle de transação é aplicado pela classe}
    property OpenTransaction :Boolean read FOpenTransaction write SetOpenTransaction;
    {Nome da dll que contem a classe de negócio}
    property DllName :String read FDllName write SetDllName;
    {Método para validação da classe de controle - Ver DoValidaDados}
    function ValidaDados:Boolean;


    { DAVID - 13/08/2003
      Criada propriedade que controla se o método GetDataPacket irá abrir a query
      antes de abrir o ClientDataSet. Propriedade criada para resolver o problema
      com ADO (detectado no Auto-Atendimento]) que exibe a mensagem:
      "Either BOF or EOF is True, or the current record has been deleted."}
    property PrepareDataPacket : boolean read FPrepareDataPacket write SetPrepareDataPacket;

    procedure CreateThreadProgresso;
    procedure FreeThreadProgresso;
    Property Progresso: TProgresso read FProgresso write SetProgresso;
    Property ProgressFileName: String read fProgressFileName;

    {Executa a instrução SQL passada como parâmetro e retorna o erro caso ocorra no MESSAGEINFO.
     A função ferifica se a instrução alterou alguma registro e trata o retorno de acordo com
     o parâmetro ErrorIfNoRowsAffected tembém no MESSAGEINFO}
    function ExecSQL(Sql: String; ErrorIfNoRowsAffected: Boolean = false): Boolean;
  End;

implementation

Uses uCMSQL50, uSistema;

{ TCmControlObject }

procedure TCmControlObject.Commit;
begin
   If FOpenTransaction Then
     case DbConnectionType of
       cntBDE: {If FDataBase.InTransaction Then} FDataBase.Commit;
       cntADO: {If DbAdoConnection.InTransaction Then} DbAdoConnection.CommitTrans;
     End;
end;

function TCmControlObject.ConectaDb(UserName, PassWord, ServerName: String): Boolean;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ConectaDB(UserName,  Password, ServerName);
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
   Try
      MessageInfo := '';

      with FDataBase Do
      Begin
        If Trim(UserName) = '' Then Raise ECmControlObjectError.Create(CMsgUserEmpty);
        If Trim(PassWord) = '' Then Raise ECmControlObjectError.Create(CMsgPasswordEmpty);

        {$I CmDecript.Inc}

        If Not Connected Then Open;

        Result := True;
      End;
   except
      On E:Exception Do
      Begin
        Result := False;
        MessageInfo := FormatErrorMessage(Self,E,CMsgErrorConnectDB);
      End;
   End;
end;

constructor TCmControlObject.Create;
begin
  Inherited;
  _bQryCreated := False;

  fProgressFileName := 'C:\' + IntToStr(GetTickCount) + '.TMP';
  _CMThreadProgressFileName := fProgressFileName;

  _Id := 0;

  _Cds := TClientDataSet.Create(nil);
  _lCds := TClientDataSet.Create(nil);

  MessageInfo := '';
  FOpenTransaction := True;

  _DtmControlObject := TDtmControlObject.Create(nil);  
end;
                                                                  
destructor TCmControlObject.Destroy;                      
begin
  If (ConnectionSide = CnsServer) Then
  Begin
     If (_lDataSet <> nil) Then
     Begin
       If _lDataSet.Active Then _lDataSet.CLose;
       _lDataSet.Free;
     End;

     Case DbConnectionType of
       cntBDE: If _bQryCreated Then _QryBde.Free;
       cntADO: If _bQryCreated Then _QryAdo.Free;
     End;
  End;

  If _lCds.Active Then _lCds.CLose;
  _lCds.Free;

  If _Cds.Active Then _Cds.CLose;
  _Cds.Free;

  _DtmControlObject.Free;
  
  inherited Destroy;
end;

procedure TCmControlObject.Rollback;
begin
  If FOpenTransaction Then
     case DbConnectionType of
       cntBDE: {If FDataBase.InTransaction Then} FDataBase.Rollback;
       cntADO: {If DbAdoConnection.InTransaction Then} DbAdoConnection.RollbackTrans;
     End;
end;

procedure TCmControlObject.SetConnection(const Value: TDispatchConnection);
begin
  FConnection := Value;
  //DoSetConnection;
end;


procedure TCmControlObject.SetDataBase(const Value: TDataBase);
begin
  FDataBase := Value;

  If Value = nil Then
    FDataBaseName := ''
  Else
    FDataBaseName := FDataBase.DatabaseName;

  DoChangeDataBase;
end;

procedure TCmControlObject.StartTransaction;
begin
  If FOpenTransaction Then
     case DbConnectionType of
       cntBDE: {If Not FDataBase.InTransaction Then} FDataBase.StartTransaction;
       cntADO: {If Not DbAdoConnection.InTransaction Then} DbAdoConnection.BeginTrans;
     End;
end;

function TCmControlObject.GetDataBaseName: String;
begin
   Result := FDataBase.DatabaseName;
end;

procedure TCmControlObject.DoChangeDataBase;
begin
  _SessionName := DataBase.SessionName;
end;

procedure TCmControlObject.SetOpenTransaction(const Value: Boolean);
begin
  FOpenTransaction := Value;
end;

procedure TCmControlObject.SetDllName(const Value: String);
begin
  FDllName := Value;
end;

function TCmControlObject.ValidaDados: Boolean;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ValidaDados;
     MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Result := DoValidaDados;
end;

function TCmControlObject.DoValidaDados: Boolean;
begin
  Result := True; 
end;

procedure TCmControlObject.CdsToDbObject(Cds: TClientDataSet;
  DbObject: TCmDbObject);
Var
  x : Integer;
begin
   DbObject.Clear;

   for x := 0  To Pred( DbObject.FieldCount ) Do
      If Cds.Fields.FindField(DbObject.Fields[x].ColumName) <> nil Then
      Begin
        If DbObject.FieldByName(DbObject.Fields[x].ColumName).DataType = FtDateTime Then
           DbObject.FieldByName(DbObject.Fields[x].ColumName).AsDateTime := Cds.Fields.FieldByName(DbObject.Fields[x].ColumName).AsDateTime
        Else
           DbObject.FieldByName(DbObject.Fields[x].ColumName).Value := Cds.Fields.FieldByName(DbObject.Fields[x].ColumName).Value;

        If (Cds.Fields.FieldByName(DbObject.Fields[x].ColumName).OldValue = null) And
           (DbObject.FieldByName(DbObject.Fields[x].ColumName).DataType = FtDateTime) Then
           DbObject.FieldByName(DbObject.Fields[x].ColumName).OldValue := 0
        ELse
           DbObject.FieldByName(DbObject.Fields[x].ColumName).OldValue := Cds.Fields.FieldByName(DbObject.Fields[x].ColumName).OldValue;
      End;
end;

{
procedure TCmControlObject.SetProvider(oCds: TClientdataSet;
  oDsp: TDataSetProvider; sRemoteProviderName: String);
begin
  If ConnectionSide = CnsServer Then
     oCds.SetProvider(oDsp)
  Else
  Begin
     oCds.RemoteServer := Connection;
     oCds.ProviderName := sRemoteProviderName;
  End;
end;
}

{
procedure TCmControlObject.DoSetConnection;
begin

end;
}

procedure TCmControlObject.Initialize(pDataBase: TDataBase;
    pOpenTransaction: Boolean; pDbConnectionType: TDbConnectionType = cntBde;
    pConnectionSide: TConnectionSide = cnsServer; pRemoteServer: TDispatchConnection = nil;
    bConnectaDB: Boolean = False; eOnMessage: TOnMessageInfo = nil;
    pADOConnection: TADOConnection = nil; pIsAppServer: Boolean = false;
    bPrepareDataPacket : Boolean = false );

    function SenhaUsuarioDb: String;
    begin
      {$I CmCriptSenha.Inc}
    end;

    function UsuarioDb: String;
    begin
      {$I CmCriptUsuario.Inc}
    end;

    function AliasDB: String;
    begin
      {$I CmCriptAlias.Inc}
    end;

begin

  { DAVID - 13/08/2003
    Seta a propriedade PrepareDataPacket, criada para resolver
    o problema com ADO (detectado no Auto-Atendimento]) que exibe a mensagem:
    "Either BOF or EOF is True, or the current record has been deleted."}
  PrepareDataPacket := bPrepareDataPacket;

  //CMDebugToFile('> 1.3.1');
  Case pDbConnectionType of
    cntBDE:  DataBase := pDataBase;
    cntAdo:  DbAdoConnection := pADOConnection;
  End;

  {
  If pADOConnection = nil Then
     DataBase := pDataBase
  Else
     DbAdoConnection := pADOConnection;
  }

  fIsAppServer := pIsAppServer;

  //CMDebugToFile('> 1.3.2');
  If IsAppServer Then OnCreateAppServer;

  //Indica se o controle de tra-++-.o é feito pela classe de negócio
  OpenTransaction := pOpenTransaction;
  //Tipo de conexão
  //CMDebugToFile('> 1.3.3');
  DbConnectionType := pDbConnectionType;
  //Forma de trabalho da classe de negócios
  //CMDebugToFile('> 1.3.4');
  ConnectionSide := pConnectionSide;

  //CMDebugToFile('> 1.3.5');
  If (pConnectionSide = cnsClient) Then
  Begin
    //Conecção com a aplicação servidora
    Connection := pRemoteServer;
    //Abre a Conexão com a aplicação servidora
    If Not Connection.Connected Then
    Begin
       Connection.Open;
       bConnectaDB := True;
    End;

    If bConnectaDB Then
       //Abre conexão do DataBaseRemoto com o Banco de acordo com a conexão do sistema local
       If Not ConectaDb(UsuarioDB,SenhaUsuarioDB,AliasDB) Then
          Raise ECmControlObjectError.Create(MessageInfo);
  End;

  //CMDebugToFile('> 1.3.6');
  If Assigned(eOnMessage) Then OnMessageInfo := eOnMessage;
  //CMDebugToFile('> 1.3.7');
  AfterInitialize;
  //CMDebugToFile('> 1.3.8');  
end;

function TCmControlObject.ApplyCds(aCds: TClientDataSet;
  aDbObject: TCmDbObject; KeyFieldParent: Array of TCmDbField; KeyField: Array of TCmDbField;
  ChangeKeyIfUpdate: Boolean = False): Boolean;
Var
  Y, iNumKeyFields: Integer;
  AcceptApply: Boolean;
  CdsState: TUpdateStatus;
  bFiltered: Boolean;
begin
   Result := True;
   bFiltered := aCds.Filtered;
   Try
      {**
       Vamos varrer o cds pelo tipo do Kind do update
       e passar a operação correta para a classe de persistencia
       se não fosse feito assim não conseguiriamos deletar os
       os grupos excluidos
      **}
      iNumKeyFields := High(KeyFieldParent);

      {**
        Processa a exclusão usando STATUSFILTER.
        É utilizado um ClientDataSet Auxiliar pois quanto o Cds é filtrado
        o status filter deixa de funcionar mas o conteúdo do Data Packet fica
        inalterado
      **}
      If _lCds.Active Then _lCds.Close;

      If aCds.State In [DsEdit, DsInsert] Then aCds.Post;
      _lCds.Data := aCds.Data;

      _lCds.StatusFilter := [usDeleted];
      _lCds.First;

      While Not _lCds.Eof Do
      Begin
         CdsState := usDeleted;

         AcceptApply := True;

         OnApplyCdsRecord(_lCds, aDbObject.TableName, CdsState, AcceptApply);

         If AcceptApply Then
         Begin
           CdsToDbObject( _lCds, aDbObject);

           Result := aDbObject.Delete;

           If Not Result Then
             Raise Exception.Create(aDbObject.MessageInfo);
         End;

         AfterApplyCdsRecord(_lCds, aDbObject.TableName, CdsState, AcceptApply);

         _lCds.Next;
      End;

      _lCds.StatusFilter := [];
      If (_lCds.ChangeCount > 0) Then _lCds.CancelUpdates;
      _lCds.Close;
      {Fim do processamento da exclusão}

      //If aCds.State In [DsEdit, DsInsert] Then aCds.Post;
      aCds.DisableControls;
      aCds.Filtered := False;
      aCds.First;

      While Not aCds.Eof Do
      Begin
         {**
           No Caso de Insert, verifica se existem campos passados como chave a serem
           associados num relacionamento mestre-detalhe.
           No caso de update, a atribuição dos campos chaves vai depender do parâmetro
           ChangeKeyIfUpdate
         **}

         CdsState := aCds.UpdateStatus;

         If CdsState In [usInserted, usModified] Then
         Begin
            AcceptApply := True;

            OnApplyCdsRecord(aCds, aDbObject.TableName, CdsState, AcceptApply);

            If AcceptApply Then
            Begin
              CdsToDbObject( aCds, aDbObject);

              If (iNumKeyFields > -1) And
                 ((CdsState = usInserted) Or (ChangeKeyIfUpdate And (CdsState = usModified))) Then
                 For Y := 0 To iNumKeyFields Do
                 Begin
                    Case KeyFieldParent[y].DataType Of
                    ftString:
                       KeyField[y].AsString := KeyFieldParent[y].AsString;
                    ftSmallint, ftInteger, ftWord:
                       KeyField[y].AsInteger := KeyFieldParent[y].AsInteger;
                    ftFloat, ftCurrency, ftBCD:
                       KeyField[y].AsFloat := KeyFieldParent[y].AsFloat;
                    ftDate, ftDateTime:
                       KeyField[y].AsDateTime := KeyFieldParent[y].AsDateTime;
                    Else
                       KeyField[y].Value := KeyFieldParent[y].Value;
                    End;
                 End;

              Case CdsState of

                usInserted: Result := aDbObject.Insert;
                usModified: Result := aDbObject.Update;
              End;

              If Not Result Then
                Raise Exception.Create(aDbObject.MessageInfo);
            End;

            AfterApplyCdsRecord(aCds, aDbObject.TableName, CdsState, AcceptApply);
         End
         Else
           CdsToDbObject( aCds, aDbObject);

         aCds.Next;
      End;

      aCds.First;

      aCds.Filtered := bFiltered;
      aCds.EnableControls;
   except
      If _lCds.Active Then
         _lCds.StatusFilter := [];

      aCds.Filtered := bFiltered;

      If aCds.Active Then
         aCds.StatusFilter := [];

      aCds.EnableControls;
      Raise;
   End;
end;

function TCmControlObject.GetDataPacket(Sql: String): OleVariant;
begin
  If ConnectionSide = cnsClient Then
     Result := Connection.AppServer.GetDataPacket(Sql)
  Else
  Begin
     Try
       PrepareSQL(Sql);

       { DAVID - 13/08/2003
         Função alterada para testar a propriedade PrepareDataPacket e, com base no
         teste, abrir ou não a query antes do ClientDataSet. Implementação feita para
         resolver o problema com ADO (detectado no Auto-Atendimento]) que exibe a mensagem:
         "Either BOF or EOF is True, or the current record has been deleted."}
       if PrepareDataPacket then
       begin
         Case DbConnectionType of
           cntBDE : _QryBde.Open;
           cntADO : _QryADO.Open;
         end;
       end;

       _DtmControlObject.Cds.Open;

       Result := _DtmControlObject.Cds.Data;

       _DtmControlObject.Cds.Close;

       { DAVID - 13/08/2003
         Função alterada para testar a propriedade PrepareDataPacket e, com base no
         teste, abrir ou não a query antes do ClientDataSet. Implementação feita para
         resolver o problema com ADO (detectado no Auto-Atendimento]) que exibe a mensagem:
         "Either BOF or EOF is True, or the current record has been deleted."}
       if PrepareDataPacket then
       begin
         Case DbConnectionType of
           cntBDE : _QryBde.Close;
           cntADO : _QryADO.Close;
         end;
       end;

     Except
       On E:Exception Do
       Begin
          GravaLogErro(E.Message, Sql);
          MessageInfo := E.Message;

          If _DtmControlObject.Cds.Active Then _DtmControlObject.Cds.Close;
       End;
     End;
  End;
end;

procedure TCmControlObject.OnApplyCdsRecord(aCds: TClientDataSet;
  const sTableName: String; CdsState: TUpdateStatus; var Accept: Boolean);
begin

end;

function TCmControlObject.ExecSQL(Sql: String;
  ErrorIfNoRowsAffected: Boolean = false): Boolean;
begin
  Result := True;

  PrepareSQL(Sql);

  Try
    Case DbConnectionType of
      cntBDE:
      Begin
         _QryBde.ExecSql;

         If ErrorIfNoRowsAffected Then
            Result := (_QryBde.RowsAffected <> 0);
      End;
      cntADO:
      Begin
         _QryAdo.ExecSQL;

         If ErrorIfNoRowsAffected Then
            Result := (_QryAdo.RowsAffected <> 0);
      End;
    End;

    If Not Result Then
      MessageInfo := 'A instrução executada não modificou registros no Banco de Dados. Verifique';
  Except
    On E:Exception Do
    Begin
      Result := False;
      GravaLogErro(E.Message, Sql);
      MessageInfo := E.Message;
    End;
  End;
end;

function TCmControlObject.GetNextID: Integer;
begin
   Inc(_Id);
   Result := _Id * -1;
end;

procedure TCmControlObject.AfterApplyCdsRecord(aCds: TClientDataSet;
  const sTableName: String; CdsState: TUpdateStatus; Accept: Boolean);
begin

end;

procedure TCmControlObject.OnCreateAppServer;
begin
   
end;


procedure TCmControlObject.GetDataPacket(aCds: TClientDataset;
  Sql: String);
begin
  Try
    aCds.Data := GetDataPacket(Sql);
  Except
    On E:Exception Do
    Begin
      GravaLogErro(E.Message, Sql);
      MessageInfo := E.Message;
    End;
  End;
end;


procedure TCmControlObject.InitializeAs(aSourceCtrl: TCmControlObject);
Var
  bConnectaDB: Boolean;
  
    function SenhaUsuarioDb: String;
    begin
      {$I CmCriptSenha.Inc}
    end;

    function UsuarioDb: String;
    begin
      {$I CmCriptUsuario.Inc}
    end;

    function AliasDB: String;
    begin
      {$I CmCriptAlias.Inc}
    end;
begin

  { DAVID - 13/08/2003
    Seta a propriedade PrepareDataPacket, criada para resolver
    o problema com ADO (detectado no Auto-Atendimento]) que exibe a mensagem:
    "Either BOF or EOF is True, or the current record has been deleted."}
  PrepareDataPacket := aSourceCtrl.PrepareDataPacket;

  bConnectaDB := False;

  Case aSourceCtrl.DbConnectionType of
    cntBDE:  DataBase := aSourceCtrl.DataBase;
    cntAdo:  DbAdoConnection := aSourceCtrl.DbAdoConnection;
  End;

  fIsAppServer := aSourceCtrl.IsAppServer;

  If IsAppServer Then OnCreateAppServer;

  //Indica se o controle de tra-++-.o é feito pela classe de negócio
  OpenTransaction := aSourceCtrl.OpenTransaction;
  //Tipo de conexão
  DbConnectionType := aSourceCtrl.DbConnectionType;
  //Forma de trabalho da classe de negócios
  ConnectionSide := aSourceCtrl.ConnectionSide;

  If (ConnectionSide = cnsClient) Then
  Begin
    //Conecção com a aplicação servidora
    Connection := aSourceCtrl.Connection;
    //Abre a Conexão com a aplicação servidora
    If Not Connection.Connected Then
    Begin
       Connection.Open;
       bConnectaDB := True;
    End;

    If bConnectaDB Then
       //Abre conexão do DataBaseRemoto com o Banco de acordo com a conexão do sistema local
       If Not ConectaDb(UsuarioDB,SenhaUsuarioDB,AliasDB) Then
          Raise ECmControlObjectError.Create(MessageInfo);
  End;

  If Assigned(aSourceCtrl.OnMessageInfo) Then
     OnMessageInfo := aSourceCtrl.OnMessageInfo;

  AfterInitialize;
end;

procedure TCmControlObject.PrepareSQL(Sql: String);
begin
   Case DbConnectionType of
     cntBDE:
       Begin
         If Not _bQryCreated Then
         Begin
           _QryBde := TwwQuery.Create(nil);
           _QryBde.DatabaseName := DataBaseName;
           _QryBde.SessionName := DataBase.SessionName;

           // Alex 14/02/2005 18640
           _QryBde.ParamCheck := false;

           _DtmControlObject.Dsp.DataSet := _QryBde;
           _bQryCreated := True;
         End;

         _QryBde.Sql.Text := Sql;
       End;
     cntADO:
       Begin
         If Not _bQryCreated Then
         Begin
           _QryAdo := TADOQuery.Create(nil);
           _QryAdo.EnableBCD := False;

           { DAVID - 30/09/2003
             Alterada a propriedade "LockType" da ADOQuery para resolver o
             problema ocorrido com queries que retornam datasets nulos. }
           _QryAdo.LockType := ltReadOnly;

           _QryADO.Connection := DbAdoConnection;
           _DtmControlObject.Dsp.DataSet := _QryADO;
           _bQryCreated := True;
         End;

         _QryADO.Sql.Text := Sql;
         ConverteSQL(_QryADO.Sql);
       End;
   End;
end;

function TCmControlObject.GetDataPacket(lSql: TStrings): OleVariant;
begin
  Try
    If ConnectionSide = cnsClient Then
       Result := Connection.AppServer.GetDataPacketTs(StringlistToVariant(lSql))
    Else
       Result := GetDataPacket(lSql.Text);
  Except
    On E:Exception Do
    Begin
      GravaLogErro(E.Message, lSql.Text);
      MessageInfo := E.Message;
    End;
  End;
end;

procedure TCmControlObject.GetDataPacket(aCds: TClientDataset;
  lSql: TStrings);
begin
  Try
    aCds.Data := GetDataPacket(lSql);
  Except
    On E:Exception Do
    Begin
      GravaLogErro(E.Message, lSql.Text);
      MessageInfo := E.Message;
    End;
  End;
end;

procedure TCmControlObject.SetFieldValue(afield: TCmDbField;
  sValue: String);
begin
  If Trim(sValue) = '' Then
     afield.Clear
  Else
     afield.AsString := Trim(sValue);
end;

procedure TCmControlObject.SetFieldValue(afield: TCmDbField;
  rValue: Double);
begin
  If rValue <= 0 Then
     afield.Clear
  Else
     afield.AsFloat := rValue;
end;

procedure TCmControlObject.SetFieldValue(afield: TCmDbField;
  dValue: TDateTime);
begin
  If dValue <= 0 Then
     afield.Clear
  Else
     afield.AsDateTime := dValue;
end;

procedure TCmControlObject.SetFieldValue(afield: TCmDbField;
  iValue: Integer);
begin
  If iValue <= 0 Then
     afield.Clear
  Else
     afield.AsInteger := iValue;
end;

procedure TCmControlObject.AfterInitialize;
begin
   If ConnectionSide = CnsServer Then
   Begin
      Case DbConnectionType of
        cntBDE:
          Begin
             If _lDataSet = nil Then _lDataSet := TwwQuery.Create(nil);
             TwwQuery(_lDataSet).DatabaseName := DataBaseName;
             TwwQuery(_lDataSet).SessionName := DataBase.SessionName;
          End;
        cntADO:
          Begin
             If _lDataSet = nil Then _lDataSet := TAdoQuery.Create(nil);
             TAdoQuery(_lDataSet).EnableBCD := False;
             TAdoQuery(_lDataSet).Connection := DbAdoConnection;
          End;
      End;
   End;
end;

procedure TCmControlObject.SetProgresso(const Value: TProgresso);
begin
  FProgresso := Value;
end;

procedure TCmControlObject.DoProgresso( vParams: Array Of Variant );
Var
  lFile: TextFile;
  iNumParams, X: Integer;
begin
   If IsAppServer Then
   Begin
      iNumParams := high(vParams);

      If iNumParams > 1 Then
         Try
           {$I-}
           AssignFile(lFile, vParams[0]);
           FileMode := 1;

           Rewrite(lFile);

           For X:= 1 To iNumParams Do
              Writeln(lFile,vParams[X]);

           CloseFile(lFile);

         Except
           If FileExists(vParams[0]) Then CloseFile(lFile);
           {$I+}
         End;
   End
   Else
     If Assigned(FProgresso) Then FProgresso( vParams );
end;


procedure TCmControlObject.CreateThreadProgresso;
begin
   If (ConnectionSide = CnsClient) And
      (Assigned(fProgresso)) Then
   Begin
      _CMThreadProgresso := TCMThreadProgresso.Create(false);
      _CMThreadProgresso.ProgressoThread := Progresso;
   End;
end;

procedure TCmControlObject.FreeThreadProgresso;
begin
   If (ConnectionSide = CnsClient) And
      (Assigned(fProgresso)) Then
      _CMThreadProgresso.Terminate;
end;

procedure TCmControlObject.GravaLogErro(sMensagem, Sql: String);
Var
  wAno, wMes, wDia: Word;
  sNomeArquivo, sAno, sMes, sDia: String;
begin
   Try
     DecodeDate(Date, wAno, wMes, wDia);
     SDia := IntToStr(wDia);
     SMes := IntToStr(wMes);
     SAno := IntToStr(wAno);
     If Length(SDia) = 1 Then SDia := '0' + SDia;
     If Length(SMes) = 1 Then SMes := '0' + SMes;
     If Length(SAno) > 2 Then SAno := Copy(Sano,Length(Sano)-1,2);
     sNomeArquivo := 'C:\SQLError' + Sdia+Smes+Sano + '.log';

     Try
       CMDebugToFile('Usuario: ' + DataBase.Params.Values['USER NAME'] + (#13 + #10) +
                      sMensagem + (#13+#10) +  Sql, sNomeArquivo);
     Except
       CMDebugToFile(sMensagem + (#13+#10) +  Sql, sNomeArquivo);
     End;
   Except

   End;
end;

procedure TCmControlObject.OpenDataSet(sSql: String);
begin
   If ConnectionSide = CnsServer Then
   Begin
      Case DbConnectionType of
        cntBDE:
          Begin
             If TwwQuery(_lDataSet).Active Then TwwQuery(_lDataSet).Close;
             TwwQuery(_lDataSet).Sql.Text := sSql;
             TwwQuery(_lDataSet).Open;
          End;
        cntADO:
          Begin
             If TAdoQuery(_lDataSet).Active Then TAdoQuery(_lDataSet).Close;
             TAdoQuery(_lDataSet).Sql.Text := sSql;
             ConverteSQL(TAdoQuery(_lDataSet).Sql);
             TAdoQuery(_lDataSet).Open;
          End;
      End;
   End
   Else
      Raise Exception.Create('O Método OpenDataSet só pode ser utilizado em funções do tipo Servidor');
end;

procedure TCmControlObject.SetPrepareDataPacket(const Value: boolean);
begin
  FPrepareDataPacket := Value;
end;

// início - andré tavares - pendência 20654 - 18/11/2005
//Indica se há uma transação em andamento
function TCmControlObject.InTransaction: boolean;
begin
  if DbConnectionType = cntBDE then
    Result := DataBase.InTransaction
  else
    Result := DbAdoConnection.InTransaction;
end;
// fim - andré tavares



function TCmControlObject.CreateDataSetParams(sSQL: String;
  ParamNames: array of String; ParamTypes: array of TFieldType): TDataSet;
Var
  X: Integer;
begin
  case DbConnectionType  of
    cntBDE :
    begin
      if _lBDEDataSet <> nil then
      begin
        if _lBDEDataSet.Active then _lBDEDataSet.Close;
        _lBDEDataSet := nil;
      end;

      _lBDEDataSet := TwwQuery.Create(nil);
      _lBDEDataSet.DatabaseName := DataBaseName;
      _lBDEDataSet.SessionName := DataBase.SessionName;
      _lBDEDataSet.SQL.Text := sSQL;

      for x:=0 to High(ParamNames) do
        _lBDEDataSet.ParamByName(ParamNames[x]).DataType := ParamTypes[x];

      result := _lBDEDataSet;

      _lBDEDataSet := nil;
    end;
    cntADO :
    begin
      if _lADODataSet <> nil then                   
      begin
        if _lADODataSet.Active then _lADODataSet.Close;
        _lADODataSet := nil;
      end;

      _lADODataSet := TADOQuery.Create(DbAdoConnection);
      _lADODataSet.EnableBCD := false;
      _lADODataSet.Connection := DbAdoConnection;
      _lADODataSet.SQL.Text := sSQL;

      for x:=0 to High(ParamNames) do
        _lADODataSet.Parameters.ParamByName(ParamNames[x]).DataType := ParamTypes[x];

      result := _lADODataSet;

      _lADODataSet := nil;
    end;
  end;
end;

procedure TCmControlObject.OpenDataSetParams(Ds: TDataSet;
  ParamNames: array of String; ParamValues: Variant);
Var
  i: Integer;
  wAno, wMes, wDia, wHora, wMinuto, wSegundo, wMileSegundo: Word;
  sSQL, sDescLog: String;

  function VarIsType(const V: Variant; Tipo: Integer): Boolean;
  begin
    result := (VarType(V) = Tipo);
  end;
begin
  case DbConnectionType  of
    cntBDE:
    begin
      sSQL := TwwQuery(Ds).SQL.Text;
      if TwwQuery(Ds).Active then TwwQuery(Ds).Close;
      if not TwwQuery(Ds).Prepared then TwwQuery(Ds).Prepare;
    end;
    cntADO :
    begin
      sSQL := TADOQuery(Ds).SQL.Text;
      if TADOQuery(Ds).Active then TADOQuery(Ds).Close;
      if not TADOQuery(Ds).Prepared then TADOQuery(Ds).Prepared := True;
    end;
  end;

  for i:=0 to High(ParamNames) do
  begin
    if (
        (VarIsNull(ParamValues[i])) or
        (VarIsType(ParamValues[i],varSingle) and (VarAsType(ParamValues[i],varSingle) = 0)) or
        (VarIsType(ParamValues[i],varDouble) and (VarAsType(ParamValues[i],varDouble) = 0)) or
        (VarIsType(ParamValues[i],varString) and (VarAsType(ParamValues[i],varString) = '')) or
        (VarIsType(ParamValues[i],varDate) and (VarAsType(ParamValues[i],varDate) = 0)) or
        (VarIsType(ParamValues[i],varInteger) and (VarAsType(ParamValues[i],varInteger) = 0)) or
        (VarIsType(ParamValues[i],varSmallint) and (VarAsType(ParamValues[i],varSmallint) = 0)) 
       ) then
    begin
       case DbConnectionType  of
        cntBDE : TwwQuery(Ds).ParamByName(ParamNames[i]).Clear;
        cntADO : TADOQuery(Ds).Parameters.ParamByName(ParamNames[i]).Value := null;
       end;
    end
    else
      case VarType(ParamValues[i]) of
        varDate:
        begin
          case DbConnectionType  of
           cntBDE : TwwQuery(Ds).ParamByName(ParamNames[i]).AsDateTime := VarToDateTime(ParamValues[i]);
           cntADO : TADOQuery(Ds).Parameters.ParamByName(ParamNames[i]).Value := VarToDateTime(ParamValues[i]);
          end;
        end;
        varOleStr,
        varString:
        begin
          case DbConnectionType  of
           cntBDE : TwwQuery(Ds).ParamByName(ParamNames[i]).AsString := VarToStr(ParamValues[i]);
           cntADO : TADOQuery(Ds).Parameters.ParamByName(ParamNames[i]).Value := VarToStr(ParamValues[i]);
          end;
        end;
        varInteger,
        varSmallint:
        begin
          case DbConnectionType  of
           cntBDE : TwwQuery(Ds).ParamByName(ParamNames[i]).AsInteger :=  VarAsType(ParamValues[i],VarType(ParamValues[i]));
           cntADO : TADOQuery(Ds).Parameters.ParamByName(ParamNames[i]).Value :=  VarAsType(ParamValues[i],VarType(ParamValues[i]));
          end;
        end;
        varSingle,
        varDouble:
        begin
          case DbConnectionType  of
           cntBDE : TwwQuery(Ds).ParamByName(ParamNames[i]).AsFloat := VarAsType(ParamValues[i],varDouble);
           cntADO : TADOQuery(Ds).Parameters.ParamByName(ParamNames[i]).Value := VarAsType(ParamValues[i],varDouble);
          end;
        end;
      end;
  end;

  Ds.Open;
end;

end.



