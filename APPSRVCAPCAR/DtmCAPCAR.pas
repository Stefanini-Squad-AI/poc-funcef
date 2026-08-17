unit DtmCAPCAR;

interface

uses
  {Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, AppServerCFinan_TLB, StdVcl, DBTables, Db;}
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, CMCapCarSvr50_TLB, StdVcl, DBTables, Db, uCtrlPadroesSrvr,
  Provider, uDataBase, uMidasUtil, uCMFileUtils, JclFileUtils,
  {**
    Classes de Controle de Negócio utilizadas pela aplicação
  **}
  uCtrlRamoxdesemb, uCtrlCheques, uCtrlTipoclixreceb, uCtrlReimprBloq,
  uCtrlMensagensCnab, uCtrlDocxCobranca, uCtrlClasfisxtipoagre,
  uCtrlClasfisclifor, uCtrlTiprecdesxtipagre, uCtrlAltxccxprgxconta,
  uCtrlConfigbarras, uCtrlCodigoscnab, uCtrlConfigbloquete, uCtrlConfigCheque,
  uCtrlFormaRecPag, uCtrlIntBancoXPortForm, uCtrlModeloscnab, uCtrlParamCap,
  uCtrlPortadorconta, uCtrlPortadorforma, uCtrlTemplbloqcheque,
  uCtrlTemplcheque, uCtrlTipcustagregconta, uCtrlTipoagre, uCtrlTipoalterador,
  uCtrlTipodocrecpag, uCtrlTipofatxclasfis, uCtrlTipordcorresp,
  uCtrlTipoRecebDesemb, uCtrlAlteraVenc, uCtrlConfigFatNotaRecibo, uCtrlTipordxccxconta
{$IFNDEF VERSAO0505}, uCMTypes{$ENDIF};

type
  TDmCapCarSrv50 = class(TRemoteDataModule, IDmCapCarSrv50)
    ssnCapCar: TSession;
    DbCapCar: TDatabase;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure RemoteDataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    TempDir: string;
    _MessageInfo: string;
    _PadroesSrvr: TCtrlPadroesSrvr;

    CtrlRamoxdesemb: TCtrlRamoxdesemb;
    CtrlCheques: TCtrlCheques;
    CtrlTipoclixreceb: TCtrlTipoclixreceb;
    CtrlReimprBloq: TCtrlReimprBloq;
    CtrlMensagensCnab: TCtrlMensagensCnab;
    CtrlDocxCobranca: TCtrlDocxCobranca;
    CtrlClasfisxtipoagre: TCtrlClasfisxtipoagre;
    CtrlClasfisclifor: TCtrlClasfisclifor;
    CtrlTiprecdesxtipagre: TCtrlTiprecdesxtipagre;
    CtrlAltxccxprgxconta: TCtrlAltxccxprgxconta;
    CtrlConfigbarras: TCtrlConfigbarras;
    CtrlCodigoscnab: TCtrlCodigoscnab;
    CtrlConfigbloquete: TCtrlConfigbloquete;
    CtrlConfigCheque: TCtrlConfigCheque;
    CtrlFormaRecPag: TCtrlFormaRecPag;
    CtrlIntBancoXPortForm: TCtrlIntBancoXPortForm;
    CtrlModeloscnab: TCtrlModeloscnab;
    CtrlParamCap: TCtrlParamCap;
    CtrlPortadorconta: TCtrlPortadorconta;
    CtrlPortadorforma: TCtrlPortadorforma;
    CtrlTemplbloqcheque: TCtrlTemplbloqcheque;
    CtrlTemplcheque: TCtrlTemplcheque;
    CtrlTipcustagregconta: TCtrlTipcustagregconta;
    CtrlTipoagre: TCtrlTipoagre;
    CtrlTipoalterador: TCtrlTipoalterador;
    CtrlTipodocrecpag: TCtrlTipodocrecpag;
    CtrlTipofatxclasfis: TCtrlTipofatxclasfis;
    CtrlTipordcorresp: TCtrlTipordcorresp;
    CtrlTipoRecebDesemb: TCtrlTipoRecebDesemb;
    CtrlAlteraVenc: TCtrlAlteraVenc;
    CtrlConfigFatNotaRecibo: TCtrlConfigFatNotaRecibo;
    CtrlTipordxccxconta: TCtrlTipordxccxconta;

    procedure MensagemPadroes(sMens: string);
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID:
      string); override;
    function MessageInfo: WideString; safecall;
    function ConectaDB(const UserName, PassWord,
      ServerName: WideString): WordBool; safecall;
    function ExecSqlAndCommit(const sSql: WideString): WordBool; safecall;
    function GetContentFile(const sFileName: WideString): WideString; safecall;
    function GetDadosPessoa(rIDPessoa: Double; TipoGetPessoa,
      TipoPessoa: Integer; var ovPessoa, ovPessoaFisica, ovDocPessoa,
      ovEndPess, ovTelEndPess, ovContatoPess, ovTelContato,
      ovContaBancaria, ovImagensPessoa, ovImagensDoc, ovEstado,
      ovNaturalidade, ovBanco, ovDocumento,
      ovTipoDoc: OleVariant): WordBool; safecall;
    function GetDataPacket(const sSql: WideString): OleVariant; safecall;
    function GetDataPacketTS(lSQL: OleVariant): OleVariant; safecall;
    function GravaHistSenha(aCdsHistSenha: OleVariant): WordBool; safecall;
    function GravaLogOperacoes(dIDPessoa, dIDModulo, dIDUsuario: Double;
      const sDescOperacao: WideString): WordBool; safecall;
    function ProcessaMensagem(CdsMensagem: OleVariant; iOperacaoMensage,
      IDMensagem: Integer): WordBool; safecall;
    function ProcessaPessoaAgencia(Operacao: Integer; CdsPessoa,
      CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
      CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
      CdsImagensDoc: OleVariant): WordBool; safecall;
    function ProcessaPessoaBanco(Operacao: Integer; CdsPessoa, CdsPessoaFisica,
      CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
      CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
      CdsImagensDoc: OleVariant): WordBool; safecall;
    function ProcessaPessoaCliente(Operacao: Integer; CdsPessoa,
      CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
      CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
      CdsImagensDoc, CdsEmpresaCliente, CdsTipoRecebCli, CdsImAgregCli,
      CdsTiposCli: OleVariant): WordBool; safecall;
    function ProcessaPessoaForne(Operacao: Integer; CdsPessoa, CdsPessoaFisica,
      CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess, CdsContatoPess,
      CdsTelContato, CdsContaBancaria, CdsImagensPessoa, CdsImagensDoc,
      CdsImAgregForn, CdsEmpresaForn, CdsFornXDesemb,
      CdsFornXRamo: OleVariant): WordBool; safecall;
    function SelDadosCli(rIDEmpresa, rIDForCli: Double; out ovSubTipo,
      ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
      ovImAgregCli, ovTipos, ovTiposCli: OleVariant): WordBool; safecall;
    function SelDadosForne(rIDEmpresa, rIDForCli: Double; out ovSubTipo,
      ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
      ovTipoDesembForn, ovImAgregForn, ovRamoXForne: OleVariant): WordBool;
      safecall;
    function Gravarcheques(Cds: OleVariant): WordBool; safecall;
    function GravarRamoxdesemb(Cds: OleVariant): WordBool; safecall;
    function GravarTipoclixreceb(Cds: OleVariant): WordBool; safecall;
    function GravarReimprBloq(Cds: OleVariant;
      pLimpaNossoNumero: WordBool): WordBool; safecall;
    function GravarMensagensCnab(fcodDocumento, PageIndex: Integer;
      const Mens0, Mens1, Mens2, Mens3, Mens4, Mens5, Mens6, Mens7,
      Mens8: WideString; OvBloq: OleVariant; bDeleta: WordBool): WordBool;
      safecall;
    function DeletaMensagens(CodDocumento: Double): WordBool; safecall;
    function GravarDocxCobranca(DocPendentes, DocAssoc: OleVariant;
      const sIdConta: WideString; ApagaExistentes,
      Mensagens: WordBool): WordBool; safecall;
    function GravarClasfisxtipoagre(Cds: OleVariant): WordBool; safecall;
    function GravarClasfisclifor(Cds: OleVariant): WordBool; safecall;
    function GravarTiprecdesxtipagre(Cds: OleVariant): WordBool; safecall;
    function GravarAltxccxprgxconta(Cds: OleVariant): WordBool; safecall;
    function GravarAltccprgconta_Aplica(Cds: OleVariant): WordBool; safecall;
    function GravarConfigbarras(Cds: OleVariant): WordBool; safecall;
    function GravarCodigoscnab(Cds: OleVariant): WordBool; safecall;
    function GravarConfigbloquete(Cds: OleVariant): WordBool; safecall;
    function GravarConfigCheque(Cds: OleVariant): WordBool; safecall;
    function GravarFormaRecPag(Cds: OleVariant): WordBool; safecall;
    function GravarIntBancoXPortForm(Cds: OleVariant): WordBool; safecall;
    function GravarModeloscnab(Cds: OleVariant): WordBool; safecall;
    function GravaRelatorio(Cds: OleVariant): WordBool; safecall;
    function GravaParamCap(Cds: OleVariant): WordBool; safecall;
    function GravarPortadorconta(Cds: OleVariant): WordBool; safecall;
    function GravarPortadorforma(Cds: OleVariant): WordBool; safecall;
    function GravarTemplbloqcheque(Cds, Cds2: OleVariant): WordBool; safecall;
    function ExcluirTemplbloqcheque(Cds, Cds2: OleVariant): WordBool; safecall;
    function GravarTemplcheque(Cds, Cds2: OleVariant): WordBool; safecall;
    function ExcluirTemplcheque(Cds, Cds2: OleVariant): WordBool; safecall;
    function GravarTipcustagregconta(Cds: OleVariant): WordBool; safecall;
    function GravarTipoagre(Cds: OleVariant): WordBool; safecall;
    function GravarTipoalterador(Cds: OleVariant): WordBool; safecall;
    function GravarTipodocrecpag(Cds: OleVariant): WordBool; safecall;
    function GravarTipofatxclasfis(Cds: OleVariant): WordBool; safecall;
    function GravarTipordcorresp(Cds: OleVariant): WordBool; safecall;
    function GravarTipoRecebDesemb(Cds: OleVariant): WordBool; safecall;
    function AlteraVencimento(Cod: Integer; Data: TDateTime): WordBool;
      safecall;
    procedure ConfigFatNotaReciboProcessaCds(Cds: OleVariant); safecall;
    function GravarTipordxccxconta(Cds: OleVariant): WordBool; safecall;
    function GravarTipordxccxconta_aplica(Cds: OleVariant): WordBool; safecall;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TDmCapCarSrv50.RemoteDataModuleCreate(Sender: TObject);
begin
  _MessageInfo := '';
  {**
    Gera um DatabaseName diferente para cada aplicação cliente conectada e
    atribui o DatabaseName para algumas queryes
  **}

  TempDir := GeraDataBaseName(Self, DbCApCar, True, ssnCapCar);
  {**
    Cria as classes de controle da mesma forma que criadas na aplicação cliente
    só que especificando o connectionSide como servidor.
    Parâmetros como o remote server, connectadab, podem ser passados como default.

    Verificar a nescessidade de eventos de mensagens diferentes para conponentes
    diferentes a criar mais de um MessageInfo, a princípio todos os Controls responde
    sempres ao mesmo MessageInfo
  **}

  _PadroesSrvr := TCtrlPadroesSrvr.Create;
  _PadroesSrvr.Initialize(DbCapCar, True, cntBde, cnsServer, nil, false,
    MensagemPadroes, nil, True);

  CtrlRamoxdesemb := TCtrlRamoxdesemb.Create;
  CtrlRamoxdesemb.InitializeAs(_PadroesSrvr);

  CtrlCheques := TCtrlCheques.Create;
  CtrlCheques.InitializeAs(_PadroesSrvr);

  CtrlTipoclixreceb := TCtrlTipoclixreceb.Create;
  CtrlTipoclixreceb.InitializeAs(_PadroesSrvr);

  CtrlReimprBloq := TCtrlReimprBloq.Create;
  CtrlReimprBloq.InitializeAs(_PadroesSrvr);

  CtrlMensagensCnab := TCtrlMensagensCnab.Create;
  CtrlMensagensCnab.InitializeAs(_PadroesSrvr);

  CtrlDocxCobranca := TCtrlDocxCobranca.Create;
  CtrlDocxCobranca.InitializeAs(_PadroesSrvr);

  CtrlClasfisxtipoagre := TCtrlClasfisxtipoagre.Create;
  CtrlClasfisxtipoagre.InitializeAs(_PadroesSrvr);

  CtrlClasfisclifor := TCtrlClasfisclifor.Create;
  CtrlClasfisclifor.InitializeAs(_PadroesSrvr);

  CtrlTiprecdesxtipagre := TCtrlTiprecdesxtipagre.Create;
  CtrlTiprecdesxtipagre.InitializeAs(_PadroesSrvr);

  CtrlAltxccxprgxconta := TCtrlAltxccxprgxconta.Create;
  CtrlAltxccxprgxconta.InitializeAs(_PadroesSrvr);

  CtrlConfigbarras := TCtrlConfigbarras.Create;
  CtrlConfigbarras.InitializeAs(_PadroesSrvr);

  CtrlCodigoscnab := TCtrlCodigoscnab.Create;
  CtrlCodigoscnab.InitializeAs(_PadroesSrvr);

  CtrlConfigbloquete := TCtrlConfigbloquete.Create;
  CtrlConfigbloquete.InitializeAs(_PadroesSrvr);

  CtrlConfigCheque := TCtrlConfigCheque.Create;
  CtrlConfigCheque.InitializeAs(_PadroesSrvr);

  CtrlFormaRecPag := TCtrlFormaRecPag.Create;
  CtrlFormaRecPag.InitializeAs(_PadroesSrvr);

  CtrlIntBancoXPortForm := TCtrlIntBancoXPortForm.Create;
  CtrlIntBancoXPortForm.InitializeAs(_PadroesSrvr);

  CtrlModeloscnab := TCtrlModeloscnab.Create;
  CtrlModeloscnab.InitializeAs(_PadroesSrvr);

  CtrlParamCap := TCtrlParamCap.Create;
  CtrlParamCap.InitializeAs(_PadroesSrvr);

  CtrlPortadorconta := TCtrlPortadorconta.Create;
  CtrlPortadorconta.InitializeAs(_PadroesSrvr);

  CtrlPortadorforma := TCtrlPortadorforma.Create;
  CtrlPortadorforma.InitializeAs(_PadroesSrvr);

  CtrlTemplbloqcheque := TCtrlTemplbloqcheque.Create;
  CtrlTemplbloqcheque.InitializeAs(_PadroesSrvr);

  CtrlTemplcheque := TCtrlTemplcheque.Create;
  CtrlTemplcheque.InitializeAs(_PadroesSrvr);

  CtrlTipcustagregconta := TCtrlTipcustagregconta.Create;
  CtrlTipcustagregconta.InitializeAs(_PadroesSrvr);

  CtrlTipoagre := TCtrlTipoagre.Create;
  CtrlTipoagre.InitializeAs(_PadroesSrvr);

  CtrlTipoalterador := TCtrlTipoalterador.Create;
  CtrlTipoalterador.InitializeAs(_PadroesSrvr);

  CtrlTipodocrecpag := TCtrlTipodocrecpag.Create;
  CtrlTipodocrecpag.InitializeAs(_PadroesSrvr);

  CtrlTipofatxclasfis := TCtrlTipofatxclasfis.Create;
  CtrlTipofatxclasfis.InitializeAs(_PadroesSrvr);

  CtrlTipordcorresp := TCtrlTipordcorresp.Create;
  CtrlTipordcorresp.InitializeAs(_PadroesSrvr);

  CtrlTipoRecebDesemb := TCtrlTipoRecebDesemb.Create;
  CtrlTipoRecebDesemb.InitializeAs(_PadroesSrvr);

  CtrlAlteraVenc := TCtrlAlteraVenc.Create;
  CtrlAlteraVenc.InitializeAs(_PadroesSrvr);

  CtrlConfigFatNotaRecibo := TCtrlConfigFatNotaRecibo.Create;
  CtrlConfigFatNotaRecibo.InitializeAs(_PadroesSrvr);

  CtrlTipordxccxconta := TCtrlTipordxccxconta.Create;
  CtrlTipordxccxconta.InitializeAs(_PadroesSrvr);

end;

procedure TDmCapCarSrv50.RemoteDataModuleDestroy(Sender: TObject);
begin
  _PadroesSrvr.Free;

  if DbCapCar.Connected then
    DbCapCar.CLose;
  if ssnCapCar.Active then
    ssnCapCar.Close;
  if DirectoryExists(TempDir) then
    DelTree(TempDir);
end;

class procedure TDmCapCarSrv50.UpdateRegistry(Register: Boolean; const ClassID,
  ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end
  else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

function TDmCapCarSrv50.MessageInfo: WideString;
begin
  Result := _MessageInfo;
end;

function TDmCapCarSrv50.ConectaDB(const UserName, PassWord,
  ServerName: WideString): WordBool;
begin
  try
    Result := _PadroesSrvr.ConectaDb(UserName, PassWord, ServerName);
    if not Result then
      _MessageInfo := _PadroesSrvr.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.ExecSqlAndCommit(const sSql: WideString): WordBool;
begin
  Result := _PadroesSrvr.ExecSqlAndCommit(sSql);
end;

function TDmCapCarSrv50.GetContentFile(
  const sFileName: WideString): WideString;
begin
  Result := _PadroesSrvr.GetContentFile(sFileName);
end;

function TDmCapCarSrv50.GetDadosPessoa(rIDPessoa: Double; TipoGetPessoa,
  TipoPessoa: Integer; var ovPessoa, ovPessoaFisica, ovDocPessoa,
  ovEndPess, ovTelEndPess, ovContatoPess, ovTelContato, ovContaBancaria,
  ovImagensPessoa, ovImagensDoc, ovEstado, ovNaturalidade, ovBanco,
  ovDocumento, ovTipoDoc: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.GetDadosPessoa(rIdPessoa, TipoGetPessoa,
    TipoPessoa, ovPessoa, ovPessoaFisica, ovDocPessoa,
    ovEndPess, ovTelEndPess, ovContatoPess, ovTelContato,
    ovContaBancaria, ovImagensPessoa, ovImagensDoc, ovEstado,
    ovNaturalidade, ovBanco, ovDocumento,
    ovTipoDoc);
end;

function TDmCapCarSrv50.GetDataPacket(const sSql: WideString): OleVariant;
begin
  Result := _PadroesSrvr.GetDataPacket(sSql);
end;

function TDmCapCarSrv50.GetDataPacketTS(lSQL: OleVariant): OleVariant;
begin
  Result := _PadroesSrvr.GetDataPacketTS(lSQL);
end;

function TDmCapCarSrv50.GravaHistSenha(
  aCdsHistSenha: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.GravaHistSenha(aCdsHistSenha);
end;

function TDmCapCarSrv50.GravaLogOperacoes(dIDPessoa, dIDModulo,
  dIDUsuario: Double; const sDescOperacao: WideString): WordBool;
begin
  Result := _PadroesSrvr.GravaLogOperacoes(dIdPessoa, dIdModulo,
    dIdUsuario, sDescOperacao);
end;

function TDmCapCarSrv50.ProcessaMensagem(CdsMensagem: OleVariant;
  iOperacaoMensage, IDMensagem: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcessaMensagem(CdsMensagem, iOperacaoMensage,
    IdMensagem);
end;

function TDmCapCarSrv50.ProcessaPessoaAgencia(Operacao: Integer; CdsPessoa,
  CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
  CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
  CdsImagensDoc: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.ProcessaPessoaAgencia(Operacao,
    CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
    CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
    CdsImagensPessoa, CdsImagensDoc)
end;

function TDmCapCarSrv50.ProcessaPessoaBanco(Operacao: Integer; CdsPessoa,
  CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
  CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
  CdsImagensDoc: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.ProcessaPessoaBanco(Operacao,
    CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
    CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
    CdsImagensPessoa, CdsImagensDoc);
end;

function TDmCapCarSrv50.ProcessaPessoaCliente(Operacao: Integer; CdsPessoa,
  CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
  CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
  CdsImagensDoc, CdsEmpresaCliente, CdsTipoRecebCli, CdsImAgregCli,
  CdsTiposCli: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.ProcessaPessoaCliente(Operacao,
    CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
    CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
    CdsImagensPessoa, CdsImagensDoc, CdsEmpresaCliente, CdsTipoRecebCli,
    CdsImAgregCli, CdsTiposCli)
end;

function TDmCapCarSrv50.ProcessaPessoaForne(Operacao: Integer; CdsPessoa,
  CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
  CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
  CdsImagensDoc, CdsImAgregForn, CdsEmpresaForn, CdsFornXDesemb,
  CdsFornXRamo: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.ProcessaPessoaForne(Operacao,
    CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
    CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
    CdsImagensPessoa, CdsImagensDoc, CdsImAgregForn, CdsEmpresaForn,
    CdsFornXDesemb, CdsFornXRamo);
end;

function TDmCapCarSrv50.SelDadosCli(rIDEmpresa, rIDForCli: Double;
  out ovSubTipo, ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
  ovImAgregCli, ovTipos, ovTiposCli: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.SelDadosCli(rIdEmpresa, rIdForcli, ovSubTipo,
    ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
    ovImAgregCli, ovTipos, ovTiposCli);
end;

function TDmCapCarSrv50.SelDadosForne(rIDEmpresa, rIDForCli: Double;
  out ovSubTipo, ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
  ovTipoDesembForn, ovImAgregForn, ovRamoXForne: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.SelDadosForne(rIdEmpresa, rIdForCli,
    ovSubTipo, ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
    ovTipoDesembForn, ovImAgregForn, ovRamoXForne);
end;

procedure TDmCapCarSrv50.MensagemPadroes(sMens: string);
begin
  _MessageInfo := sMens;
end;

function TDmCapCarSrv50.Gravarcheques(Cds: OleVariant): WordBool;
begin
  try
    CtrlCheques.cds.Data := Cds;
    result := CtrlCheques.Gravarcheques;
    if not Result then
      _MessageInfo := CtrlCheques.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarRamoxdesemb(Cds: OleVariant): WordBool;
begin
  try
    CtrlRamoxdesemb.cds.Data := Cds;
    result := CtrlRamoxdesemb.GravarRamoxdesemb;
    if not Result then
      _MessageInfo := CtrlRamoxdesemb.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarTipoclixreceb(Cds: OleVariant): WordBool;
begin
  try
    CtrlTipoclixreceb.cds.Data := Cds;
    result := CtrlTipoclixreceb.GravarTipoclixreceb;
    if not Result then
      _MessageInfo := CtrlTipoclixreceb.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarReimprBloq(Cds: OleVariant;
  pLimpaNossoNumero: WordBool): WordBool;
begin
  try
    result := CtrlReimprBloq.ConfirmaOperacao(Cds, pLimpaNossoNumero);
    if not Result then
      _MessageInfo := CtrlReimprBloq.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarMensagensCnab(fcodDocumento,
  PageIndex: Integer; const Mens0, Mens1, Mens2, Mens3, Mens4, Mens5,
  Mens6, Mens7, Mens8: WideString; OvBloq: OleVariant;
  bDeleta: WordBool): WordBool;
begin
  try
    result := CtrlMensagensCnab.ConfirmaOperacao(fcodDocumento, PageIndex,
      Mens0, Mens1, Mens2, Mens3, Mens4, Mens5, Mens6, Mens7, Mens8, OvBloq,
      bDeleta);
    if not Result then
      _MessageInfo := CtrlMensagensCnab.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.DeletaMensagens(CodDocumento: Double): WordBool;
begin
  try
    result := CtrlMensagensCnab.DeletaMensagens(codDocumento);
    if not Result then
      _MessageInfo := CtrlMensagensCnab.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarDocxCobranca(DocPendentes,
  DocAssoc: OleVariant; const sIdConta: WideString; ApagaExistentes,
  Mensagens: WordBool): WordBool;
begin
  try
    result := CtrlDocxCobranca.ConfirmaOperacao(DocPendentes, DocAssoc,
      sIdConta, ApagaExistentes, Mensagens);
    if not Result then
      _MessageInfo := CtrlDocxCobranca.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarClasfisxtipoagre(Cds: OleVariant): WordBool;
begin
  try
    CtrlClasfisxtipoagre.cds.Data := Cds;
    result := CtrlClasfisxtipoagre.GravarClasfisxtipoagre;
    if not Result then
      _MessageInfo := CtrlClasfisxtipoagre.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarClasfisclifor(Cds: OleVariant): WordBool;
begin
  try
    CtrlClasfisclifor.cds.Data := Cds;
    result := CtrlClasfisclifor.GravarClasfisclifor;
    if not Result then
      _MessageInfo := CtrlClasfisclifor.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarTiprecdesxtipagre(Cds: OleVariant): WordBool;
begin
  try
    CtrlTiprecdesxtipagre.cds.Data := Cds;
    result := CtrlTiprecdesxtipagre.GravarTiprecdesxtipagre;
    if not Result then
      _MessageInfo := CtrlTiprecdesxtipagre.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarAltxccxprgxconta(Cds: OleVariant): WordBool;
begin
  try
    CtrlAltxccxprgxconta.cds.Data := Cds;
    result := CtrlAltxccxprgxconta.GravarAltxccxprgxconta;
    if not Result then
      _MessageInfo := CtrlAltxccxprgxconta.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarAltccprgconta_Aplica(
  Cds: OleVariant): WordBool;
begin
  try
    result := CtrlAltxccxprgxconta.AplicaAlteracoes(Cds);
    if not Result then
      _MessageInfo := CtrlAltxccxprgxconta.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarConfigbarras(Cds: OleVariant): WordBool;
begin
  try
    CtrlConfigbarras.cds.Data := Cds;
    result := CtrlConfigbarras.GravarConfigbarras;
    if not Result then
      _MessageInfo := CtrlConfigbarras.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarCodigoscnab(Cds: OleVariant): WordBool;
begin
  try
    CtrlCodigoscnab.cds.Data := Cds;
    result := CtrlCodigoscnab.GravarCodigoscnab;
    if not Result then
      _MessageInfo := CtrlCodigoscnab.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarConfigbloquete(Cds: OleVariant): WordBool;
begin
  try
    CtrlConfigbloquete.cds.Data := Cds;
    result := CtrlConfigbloquete.GravarConfigbloquete;
    if not Result then
      _MessageInfo := CtrlConfigbloquete.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarConfigCheque(Cds: OleVariant): WordBool;
begin
  try
    CtrlConfigCheque.cds.Data := Cds;
    result := CtrlConfigCheque.GravarConfigCheque;
    if not Result then
      _MessageInfo := CtrlConfigCheque.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarFormaRecPag(Cds: OleVariant): WordBool;
begin
  try
    CtrlFormaRecPag.cds.Data := Cds;
    result := CtrlFormaRecPag.GravarFormaRecPag;
    if not Result then
      _MessageInfo := CtrlFormaRecPag.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarIntBancoXPortForm(Cds: OleVariant): WordBool;
begin
  try
    CtrlIntBancoXPortForm.cds.Data := Cds;
    result := CtrlIntBancoXPortForm.GravarIntBancoXPortForm;
    if not Result then
      _MessageInfo := CtrlIntBancoXPortForm.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarModeloscnab(Cds: OleVariant): WordBool;
begin
  try
    CtrlModeloscnab.cds.Data := Cds;
    result := CtrlModeloscnab.GravarModeloscnab;
    if not Result then
      _MessageInfo := CtrlModeloscnab.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravaRelatorio(Cds: OleVariant): WordBool;
begin
  try
    CtrlParamCap._cdsRel.Data := Cds;
    result := CtrlParamCap.GravaRelatorio;
    if not Result then
      _MessageInfo := CtrlParamCap.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravaParamCap(Cds: OleVariant): WordBool;
begin
  try
    CtrlParamCap._cds.Data := Cds;
    result := CtrlParamCap.GravaParamCap;
    if not Result then
      _MessageInfo := CtrlParamCap.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarPortadorconta(Cds: OleVariant): WordBool;
begin
  try
    CtrlPortadorconta.Cds.Data := Cds;
    result := CtrlPortadorconta.GravarPortadorconta;
    if not Result then
      _MessageInfo := CtrlPortadorconta.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarPortadorforma(Cds: OleVariant): WordBool;
begin
  try
    CtrlPortadorforma.Cds.Data := Cds;
    result := CtrlPortadorforma.GravarPortadorforma;
    if not Result then
      _MessageInfo := CtrlPortadorforma.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarTemplbloqcheque(Cds,
  Cds2: OleVariant): WordBool;
begin
  try
    CtrlTemplbloqcheque.Cds.Data := Cds;
    CtrlTemplbloqcheque.cdsConfigbloquete.Data := Cds2;
    result := CtrlTemplbloqcheque.GravarTemplbloqcheque;
    if not Result then
      _MessageInfo := CtrlTemplbloqcheque.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.ExcluirTemplbloqcheque(Cds,
  Cds2: OleVariant): WordBool;
begin
  try
    CtrlTemplbloqcheque.Cds.Data := Cds;
    CtrlTemplbloqcheque.cdsConfigbloquete.Data := Cds2;
    result := CtrlTemplbloqcheque.ExcluirTemplbloqcheque;
    if not Result then
      _MessageInfo := CtrlTemplbloqcheque.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarTemplcheque(Cds, Cds2: OleVariant): WordBool;
begin
  try
    CtrlTemplcheque.Cds.Data := Cds;
    CtrlTemplcheque.cdsConfigCheque.Data := Cds2;
    result := CtrlTemplcheque.GravarTemplcheque;
    if not Result then
      _MessageInfo := CtrlTemplcheque.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.ExcluirTemplcheque(Cds,
  Cds2: OleVariant): WordBool;
begin
  try
    CtrlTemplcheque.Cds.Data := Cds;
    CtrlTemplcheque.cdsConfigCheque.Data := Cds2;
    result := CtrlTemplcheque.ExcluirTemplcheque;
    if not Result then
      _MessageInfo := CtrlTemplcheque.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarTipcustagregconta(Cds: OleVariant): WordBool;
begin
  try
    CtrlTipcustagregconta.Cds.Data := Cds;
    result := CtrlTipcustagregconta.GravarTipcustagregconta;
    if not Result then
      _MessageInfo := CtrlTipcustagregconta.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarTipoagre(Cds: OleVariant): WordBool;
begin
  try
    CtrlTipoagre.Cds.Data := Cds;
    result := CtrlTipoagre.GravarTipoagre;
    if not Result then
      _MessageInfo := CtrlTipoagre.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarTipoalterador(Cds: OleVariant): WordBool;
begin
  try
    CtrlTipoalterador.Cds.Data := Cds;
    result := CtrlTipoalterador.GravarTipoalterador;
    if not Result then
      _MessageInfo := CtrlTipoalterador.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarTipodocrecpag(Cds: OleVariant): WordBool;
begin
  try
    CtrlTipodocrecpag.Cds.Data := Cds;
    result := CtrlTipodocrecpag.GravarTipodocrecpag;
    if not Result then
      _MessageInfo := CtrlTipodocrecpag.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarTipofatxclasfis(Cds: OleVariant): WordBool;
begin
  try
    CtrlTipofatxclasfis.Cds.Data := Cds;
    result := CtrlTipofatxclasfis.GravarTipofatxclasfis;
    if not Result then
      _MessageInfo := CtrlTipofatxclasfis.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarTipordcorresp(Cds: OleVariant): WordBool;
begin
  try
    CtrlTipordcorresp.Cds.Data := Cds;
    result := CtrlTipordcorresp.GravarTipordcorresp;
    if not Result then
      _MessageInfo := CtrlTipordcorresp.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarTipoRecebDesemb(Cds: OleVariant): WordBool;
begin
  try
    CtrlTipoRecebDesemb.Cds.Data := Cds;
    result := CtrlTipoRecebDesemb.GravarTipoRecebDesemb;
    if not Result then
      _MessageInfo := CtrlTipoRecebDesemb.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.AlteraVencimento(Cod: Integer;
  Data: TDateTime): WordBool;
begin
  try
    result := CtrlAlteraVenc.AlteraVencimento(Cod, Data);
    if not Result then
      _MessageInfo := CtrlAlteraVenc.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

procedure TDmCapCarSrv50.ConfigFatNotaReciboProcessaCds(Cds: OleVariant);
begin
{  try
    CtrlConfigFatNotaRecibo.processaCds AlteraVencimento(Cod, Data);
    if not Result then
      _MessageInfo := CtrlAlteraVenc.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;}
end;

function TDmCapCarSrv50.GravarTipordxccxconta(Cds: OleVariant): WordBool;
begin
  try
    CtrlTipordxccxconta.Cds.Data := Cds;
    result := CtrlTipordxccxconta.GravarTipordxccxconta;
    if not Result then
      _MessageInfo := CtrlTipordxccxconta.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCapCarSrv50.GravarTipordxccxconta_aplica(
  Cds: OleVariant): WordBool;
begin
  try
    result := CtrlTipordxccxconta.AplicaAlteracoes(Cds);
    if not Result then
      _MessageInfo := CtrlTipordxccxconta.MessageInfo;
  except
    on E: Exception do
    begin
      Result := False;
      _MessageInfo := E.Message;
    end;
  end;
end;

initialization

  TComponentFactory.Create(ComServer, TDmCapCarSrv50,
    Class_DmCapCarSrv50, ciMultiInstance, tmApartment);
end.

