unit RdAlmoxarifado;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, SvrAlmoxarifado_TLB, StdVcl, Db, DBTables, Wwquery, Provider,
  uCtrlAlmox, uSistema, dialogs, uMidasUtil;

type
  TRdmAlmoxarifado = class(TRemoteDataModule, IRdmAlmoxarifado)
    DspUnCusteio: TDataSetProvider;
    qryUnCusteio: TwwQuery;
    qryUnCusteioCODCUSTEIO: TFloatField;
    qryUnCusteioDESCCUSTEIO: TStringField;
    qryUnCusteioUCCONTABIL: TStringField;
    qryCentroCusto: TwwQuery;
    qryCentroCustoNOME: TStringField;
    qryCentroCustoCODCENTROCUSTO: TStringField;
    DspCentroCusto: TDataSetProvider;
    Dsp: TDataSetProvider;
    qry: TwwQuery;
    qryCODALMOXARIFADO: TFloatField;
    qryCODCUSTEIO: TFloatField;
    qryIDPESSOA: TFloatField;
    qryCODCENTROCUSTO: TStringField;
    qryIDEMPRESA: TFloatField;
    qryDESCALMOX: TStringField;
    qryPRINCIPSECUND: TStringField;
    qryCONTABIL: TStringField;
    DbSvrAlmoxarifado: TDatabase;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure RemoteDataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    CtrlAlmox : TCtrlAlmox;
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    //
    //Início da Implementação dos Métodos da Classe de Negócio.
    //Os métodos da classe de negócio devem ser implementados com os
    //mesmos parâmetros na interface e com os DATA´s equivalentes aos CLIENTDATASET
    //da classe de negócio ( se o método implementado acessar tal informação ).
    function Alterar(CdsAlmox: OleVariant): WordBool; safecall;
    function Deletar(iIdAlmox: Double): WordBool; safecall;
    function Inserir(CdsAlmox: OleVariant): WordBool; safecall;
    //Fim da Implementação dos Métodos da Classe de Negócio
    //
    //Implementação Obrigatória do método de solicitação de mensagem a aplicação servidora
    function MessageInfo: WideString; safecall;
    //Implementação Obrigatória do método de Conexão do DataBase da aplicação servidora
    function ConectaDb(const UserName, PassWord,
      ServerName: WideString): WordBool; safecall;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TRdmAlmoxarifado.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

procedure TRdmAlmoxarifado.RemoteDataModuleCreate(Sender: TObject);
begin
  //Gera um DatabaseName diferente para cada aplicação cliente conectada e
  //atribui o DatabaseName para algumas queryes
  GeraDataBaseName(Self,DbSvrAlmoxarifado);

  CtrlAlmox := TCtrlAlmox.Create;
  //DataBase para conexão
  CtrlAlmox.DataBase := DbSvrAlmoxarifado;
  //Indica se o controle de transação é feito pela classe de negócio
  CtrlAlmox.OpenTransaction := True;
  //Tipo de conexão
  CtrlAlmox.DbConnectionType := cntBDE;
  //Para Trabalhar local
  CtrlAlmox.ConnetionSide := cnsServer;
end;

procedure TRdmAlmoxarifado.RemoteDataModuleDestroy(Sender: TObject);
begin
  //Destroi a classe de negócios
  CtrlAlmox.Free;
  //Fecha o DataBase
  DbSvrAlmoxarifado.Close;
end;

function TRdmAlmoxarifado.Alterar(CdsAlmox: OleVariant): WordBool;
begin
  //Atribui o DATA do ClientDataSet para a classe de negócio
  CtrlAlmox.cdsAlmox.Data := CdsAlmox;
  //Executa o método de alteração da classe de negócio e atribui o result da interface
  Result := CtrlAlmox.Alterar;
end;

function TRdmAlmoxarifado.Deletar(iIdAlmox: Double): WordBool;
begin
  //Executa o método de exclusão da classe de negócio e atribui o result da
  //interface.
  Result := CtrlAlmox.Deletar(iIdAlmox);
end;

function TRdmAlmoxarifado.Inserir(CdsAlmox: OleVariant): WordBool;
begin
  //Atribui o DATA do ClientDataSet para a classe de negócio
  CtrlAlmox.cdsAlmox.Data := CdsAlmox;
  //Executa o método de alteração da classe de negócio e atribui o result da interface
  Result := CtrlAlmox.Inserir;
end;

function TRdmAlmoxarifado.MessageInfo: WideString;
begin
  //Retorna o MessageInfo da classe de negócio para a Interface da aplicação servidora
  Result := CtrlAlmox.MessageInfo;
end;

function TRdmAlmoxarifado.ConectaDb(const UserName, PassWord,
  ServerName: WideString): WordBool;
begin
  //Abre a conexão do DataBase do Remote Data Module (RDM)
  //de acordo com parâmetros da aplicação cliente
  Result := CtrlAlmox.ConectaDb(UserName, PassWord, ServerName);
end;

initialization
  TComponentFactory.Create(ComServer, TRdmAlmoxarifado,
    Class_RdmAlmoxarifado, ciMultiInstance, tmApartment);
end.
