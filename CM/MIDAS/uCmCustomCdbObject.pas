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
unit uCmCustomCdbObject;

interface

uses Classes, SysUtils, Db, uCMTypes, wwQuery, AdoDb, uCMSql50;

Type
  TOnMessageInfo = Procedure (sMessageInfo :string) Of Object;

  ECmDbObjectError = Class(Exception);
  ECmControlObjectError = Class(Exception);

  {Classe acestral para impementação de DbObjects e ControlObjects}
  TCmCustomCdbObject = Class

  private
    FDbConnectionType: TDbConnectionType;
    FOnMessageInfo: TOnMessageInfo;
    FConnectionSide: TConnectionSide;
    FDbAdoConnection: TADOConnection;
    fMessageInfo: String;
    procedure SetDbConnectionType(const Value: TDbConnectionType);
    procedure SetOnMessageInfo(const Value: TOnMessageInfo);
    procedure SetConnectionSide(const Value: TConnectionSide);
    procedure SetMessageInfo(const Value: String);
    function GetMessageInfo: String;
  protected
    {Query Genérica}
    _SessionName: String;
    FDataBaseName :string;
    fIsAppServer: Boolean;

    //procedure DoSetConnectionSide; Virtual;

    //procedure DoSetConnectionType; Virtual;

    function GetDataBaseName: String; Virtual;

    procedure SetDataBaseName(const Value: String); Virtual;
    {Procedure executada quando é associado um AdoConnection a instância da classe}
    procedure SetDbAdoConnection(const Value: TADOConnection); Virtual;
    {Método semelhante ao LeUltRegistro onde o Sufixo é o nome da Tabela associada ao
     Sequence}
    function GetSequence(Sufixo :string) :Cardinal; Virtual;
  public
    Constructor Create; Dynamic;

    Destructor Destroy; Override;                             


    {Tipo de conexão com o banco de dados
     Tipo declarado na uSistema.
     TDbConnectionType = (cntBDE, cntADO, cntIB, cntDOA).}
    property DbConnectionType :TDbConnectionType read FDbConnectionType write SetDbConnectionType;
    {DataBase name ou ConnectionString ultilizada para os DataSets da classe de negócio}
    property DataBaseName :String read GetDataBaseName write SetDataBaseName;
    {String para troca de mensagem com o solicitante do serviço}
    property MessageInfo :String read GetMessageInfo write SetMessageInfo;
    {Indica se o controlador esta sendo instanciado pela aplicação cliente ou servidora
     Tipo declarado na uSistema.
     TConnectionSide = (cnsServer, cnsClient)}
    property ConnectionSide :TConnectionSide read FConnectionSide write SetConnectionSide;
    {Evento Disparado qdo é atribuido o MessageInfo pelo método SetMessageInfo}
    Property OnMessageInfo :TOnMessageInfo read FOnMessageInfo write SetOnMessageInfo;
    {Ado Connetion para conexão via ADO}
    property DbAdoConnection :TADOConnection read FDbAdoConnection write SetDbAdoConnection;
    {Indica se a classe foi instanciada pela aplicação cliente ou pela servidora}
    property IsAppServer: Boolean read fIsAppServer;
  End;

implementation

{ TCmCustomCdbObject }

Uses uDataBase, uCmDbObject, uCmControlObject, DbClient, uCmFileUtils;

constructor TCmCustomCdbObject.Create;
begin
  _SessionName := '';
  fIsAppServer := false;

  fMessageInfo := '';
  FDbConnectionType := cntBde;
  FConnectionSide := cnsServer;
  FDataBaseName := '';
  FDbAdoConnection := nil;
end;

destructor TCmCustomCdbObject.Destroy;
begin
  inherited;
end;

function TCmCustomCdbObject.GetDataBaseName: String;
begin
  Result := FDataBaseName;
end;

procedure TCmCustomCdbObject.SetDbAdoConnection(const Value: TADOConnection);
begin
  FDbAdoConnection := Value;
end;

procedure TCmCustomCdbObject.SetConnectionSide(const Value: TConnectionSide);
begin
  FConnectionSide := Value;

  //DoSetConnectionSide;
end;

procedure TCmCustomCdbObject.SetDataBaseName(const Value: String);
begin
  FDataBaseName := Value;
end;

procedure TCmCustomCdbObject.SetDbConnectionType(
  const Value: TDbConnectionType);
begin
  FDbConnectionType := Value;
  //DoSetConnectionType;
end;

procedure TCmCustomCdbObject.SetMessageInfo(const Value: String);
begin                                                                    
  fMessageInfo := Value;

  If Trim(Value) <> '' Then                                        
     If Assigned(fOnMessageInfo) Then fOnMessageInfo(Value);
end;

procedure TCmCustomCdbObject.SetOnMessageInfo(const Value: TOnMessageInfo);
begin
  FOnMessageInfo := Value;
end;

function TCmCustomCdbObject.GetSequence(Sufixo: string): Cardinal;
Var
  sSQL: String;
  bAdo: Boolean;
begin
//   CMDebugToFile('Buscando Sequence','c:\LogCm.Log');
   Try
   if Self is TCmDbObject then
      bAdo := (TCmControlObject(TCmDbObject(Self).Owner).DbConnectionType =  cntAdo)
   Else
      bAdo := (TCmControlObject(Self).DbConnectionType =  cntAdo);
   Except
      bAdo := False;
   end;

  if bAdo then
  begin
//     CMDebugToFile('Buscando Sequence Como ADO - 1','c:\LogCm.Log');
     sSQL := 'SELECT SEQ' + Sufixo + '.NEXTVAL FROM DUAL';

     With TClientDataSet.Create(nil) do
       Try
         if Self is TCmDbObject then
            Data := TCmControlObject(TCmDbObject(Self).Owner).GetDataPacket(sSQL)
         Else
            Data := TCmControlObject(Self).GetDataPacket(sSQL);

         Result := Fields[0].AsInteger;

         Close;
         Free;
       Except
//         CMDebugToFile('Erro Ao Buscar Sequence Como ADO - 1','c:\LogCm.Log');
         Free;
         Raise;
       End;
//    CMDebugToFile('Buscando Sequence Como ADO - 2','c:\LogCm.Log');
  end
  else
  Begin
//     CMDebugToFile('Buscando Sequence Como BDE - 1','c:\LogCm.Log');
     Case iTipoBD_Padrao of
     0: Result := LeUltRegistro(Sufixo, false, fdatabasename, DriverOracle, _SessionName);
     1: Result := LeUltRegistro(Sufixo, false, fdatabasename, DriverDB2, _SessionName);
     2: Result := LeUltRegistro(Sufixo, false, fdatabasename, DriverSQL, _SessionName);
     3: Result := LeUltRegistro(Sufixo, false, fdatabasename, DriverSQLODBC, _SessionName);
     4: Result := LeUltRegistro(Sufixo, false, fdatabasename, DriverPGODBC, _SessionName);
     Else
        Result := LeUltRegistro(Sufixo, false, fdatabasename, DriverOracle, _SessionName);
     End;
//     CMDebugToFile('Buscando Sequence Como BDE - 2','c:\LogCm.Log');     
  End;
end;

function TCmCustomCdbObject.GetMessageInfo: String;
Begin
  Result := fMessageInfo;
End;

end.
