unit DCmModAvaSvr50;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr, DBClient, DBTables,
  Db, CmModAvaSvr50_TLB, StdVcl, uDatabase, uMidasUtil, uCMTypes, uCmFileUtils, JCLFileUtils,
  uCtrlPadroesSrvr, uCtrlPadroes, uCtrlCargo, uCtrlGrupFunc, uCtrlGrupoFatorAval,
  uCtrlFatorAval, uCtrlPesoFatGrp, uCtrlTipAval, uCtrlRegAval, uCtrlRegDesemp;

type
  TDmCmModAvaSvr50 = class(TRemoteDataModule, IDmCmModAvaSvr50)
    dbModAva: TDatabase;
    ssnModAva: TSession;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure RemoteDataModuleDestroy(Sender: TObject);
  private
    TempDir: string;
    _MessageInfo: string;
    _PadroesSrvr: TCtrlPadroesSrvr;

    FCtrlCargo: TCtrlCargo;
    FCtrlGrupFunc: TCtrlGrupFunc;
    FCtrlGrupoFatorAval: TCtrlGrupoFatorAval;
    FCtrlFatorAval: TCtrlFatorAval;
    FCtrlPesoFatGrp: TCtrlPesoFatGrp;
    FCtrlTipAval: TCtrlTipAval;
    FCtrlRegAval: TCtrlRegAval;
    FCtrlRegDesemp: TCtrlRegDesemp;

    procedure MensagemPadroes(Msg: string);
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function ConectaDB(const UserName, PassWord,
      ServerName: WideString): WordBool; safecall;
    function ExecSqlAndCommit(const sSql: WideString): WordBool; safecall;
    function GetContentFile(const sFileName: WideString): WideString; safecall;
    function GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa,
      TipoPessoa: Integer; var ovPessoa, ovPessoaFisica, ovDocPessoa,
      ovEndPess, ovTelEndPess, ovContatoPess, ovTelContato,
      ovContaBancaria, ovImagensPessoa, ovImagensDoc, ovEstado,
      ovNaturalidade, ovBanco, ovDocumento,
      ovTipoDoc: OleVariant): WordBool; safecall;
    function GetDataPacket(const sSql: WideString): OleVariant; safecall;
    function GetDataPacketTS(lSQL: OleVariant): OleVariant; safecall;
    function GravaHistSenha(aCdsHistSenha: OleVariant): WordBool; safecall;
    function GravaLogOperacoes(dIdPessoa, dIdModulo, dIdUsuario: Double;
      const sDescOperacao: WideString): WordBool; safecall;
    function MessageInfo: WideString; safecall;
    function ProcessaMensagem(CdsMensagem: OleVariant; iOperacaoMensage,
      IdMensagem: Integer): WordBool; safecall;
    function ProcessaPessoaAgencia(Operacao: Integer; CdsPessoa,
      CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
      CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
      CdsImagensDoc: OleVariant): WordBool; safecall;
    function ProcessaPessoaBanco(Operacao: Integer; CdsPessoa, CdsPessoaFisica,
      CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess, CdsContatoPess,
      CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
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
    function SelDadosCli(rIdEmpresa, rIdForcli: Double; out ovSubTipo,
      ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
      ovImAgregCli, ovTipos, ovTiposCli: OleVariant): WordBool; safecall;
    function SelDadosForne(rIdEmpresa, rIdForcli: Double; out ovSubTipo,
      ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
      ovTipoDesembForn, ovImAgregForn, ovRamoXForne: OleVariant): WordBool;
      safecall;
    function GravarReports(ovCds: OleVariant): WordBool; safecall;
    function ProcessaConfig(ovCds, ovCdsReport: OleVariant;
      Operacao: Integer): WordBool; safecall;
    function ProcessaConfigModelo(ovReports: OleVariant): WordBool; safecall;
    function ProcessaGrupoUsu(ovDataViewAcesso, ovTabelaAcesso, ovColunaAcesso,
      ovGrupo, ovUsuario, ovPessoa, ovGrupoXUsu, ovAutoriza, ovAutorizaRpt,
      ovAutorizaMS: OleVariant; OperacaoProcessa: Integer): WordBool;
      safecall;
    function ProcessaWorkFlow(ovWorkflowUsuario, ovWorkflow,
      ovPassoWorkflow: OleVariant; Operacao: Integer): WordBool; safecall;
    function ProcurarReports(IdReports, OrigemCm: Integer): WordBool; safecall;
    function GravarCargo(ovDados: OleVariant): WordBool; safecall;
    function GravarGrupoFunc(ovDados: OleVariant): WordBool; safecall;
    function GravarGrupoFatorAval(ovDados: OleVariant): WordBool; safecall;
    function GravarFatorAval(ovDados: OleVariant): WordBool; safecall;
    function GravarPesoXFator(ovDados: OleVariant): WordBool; safecall;
    function GravarTipoAval(ovDados: OleVariant): WordBool; safecall;
    function GravarRegAval(ovDados: OleVariant): WordBool; safecall;
    function GravarRegDesemp(ovDados: OleVariant): WordBool; safecall;
  end;

implementation

{$R *.DFM}

procedure TDmCmModAvaSvr50.RemoteDataModuleCreate(Sender: TObject);
begin
  _MessageInfo := '';
  {**
    Gera um DatabaseName diferente para cada aplicação cliente conectada e
    atribui o DatabaseName para algumas queryes
  **}

  TempDir := GeraDataBaseName(Self, dbModAva, true, ssnModAva);
  {**
    Cria as classes de controle da mesma forma que criadas na aplicação cliente
    só que especificando o connectionSide como servidor.
    Parâmetros como o remote server, connectadab, podem ser passados como default.

    Verificar a nescessidade de eventos de mensagens diferentes para conponentes
    diferentes a criar mais de um MessageInfo, a princípio todos os Controls responde
    sempres ao mesmo MessageInfo
  **}
  _PadroesSrvr := TCtrlPadroesSrvr.Create;
  _PadroesSrvr.Initialize(dbModAva, true, cntBde, cnsServer, nil, false, MensagemPadroes, nil, true);

  FCtrlCargo := TCtrlCargo.Create;
  FCtrlCargo.InitializeAs(_PadroesSrvr);

  FCtrlGrupFunc := TCtrlGrupFunc.Create;
  FCtrlGrupFunc.InitializeAs(_PadroesSrvr);

  FCtrlGrupoFatorAval := TCtrlGrupoFatorAval.Create;
  FCtrlGrupoFatorAval.InitializeAs(_PadroesSrvr);

  FCtrlFatorAval := TCtrlFatorAval.Create;
  FCtrlFatorAval.InitializeAs(_PadroesSrvr);

  FCtrlPesoFatGrp := TCtrlPesoFatGrp.Create;
  FCtrlPesoFatGrp.InitializeAs(_PadroesSrvr);

  FCtrlTipAval := TCtrlTipAval.Create;
  FCtrlTipAval.InitializeAs(_PadroesSrvr);

  FCtrlRegAval := TCtrlRegAval.Create;
  FCtrlRegAval.InitializeAs(_PadroesSrvr);

  FCtrlRegDesemp := TCtrlRegDesemp.Create;
  FCtrlRegDesemp.InitializeAs(_PadroesSrvr);
end;

procedure TDmCmModAvaSvr50.RemoteDataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(_PadroesSrvr);

  FreeAndNil(FCtrlCargo);
  FreeAndNil(FCtrlGrupFunc);
  FreeAndNil(FCtrlGrupoFatorAval);
  FreeAndNil(FCtrlFatorAval);
  FreeAndNil(FCtrlPesoFatGrp);
  FreeAndNil(FCtrlTipAval);
  FreeAndNil(FCtrlRegAval);
  FreeAndNil(FCtrlRegDesemp);
end;

class procedure TDmCmModAvaSvr50.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

function TDmCmModAvaSvr50.ConectaDB(const UserName, PassWord,
  ServerName: WideString): WordBool;
begin
  try
    Result := _PadroesSrvr.ConectaDb(UserName, PassWord, ServerName);
    if not(Result) then
      _MessageInfo := _PadroesSrvr.MessageInfo;
  except
    on E:Exception do
    begin
       Result := False;
       _MessageInfo := E.message;
    end;
  end;
end;

function TDmCmModAvaSvr50.GetDataPacket(const sSql: WideString): OleVariant;
begin
  Result := _PadroesSrvr.GetDataPacket(sSql);
end;

function TDmCmModAvaSvr50.GravaLogOperacoes(dIdPessoa, dIdModulo,
  dIdUsuario: Double; const sDescOperacao: WideString): WordBool;
begin
  Result := _PadroesSrvr.GravaLogOperacoes(dIdPessoa, dIdModulo, dIdUsuario, sDescOperacao);
end;

function TDmCmModAvaSvr50.MessageInfo: WideString;
begin
  Result := _MessageInfo;
end;

function TDmCmModAvaSvr50.ProcessaPessoaAgencia(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.ProcessaPessoaAgencia(Operacao, CdsPessoa, CdsPessoaFisica,
    CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess, CdsContatoPess, CdsTelContato,
    CdsContaBancaria, CdsImagensPessoa, CdsImagensDoc);
end;

function TDmCmModAvaSvr50.ProcessaPessoaBanco(Operacao: Integer; CdsPessoa,
  CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
  CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
  CdsImagensDoc: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.ProcessaPessoaBanco(Operacao, CdsPessoa, CdsPessoaFisica,
    CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess, CdsContatoPess, CdsTelContato,
    CdsContaBancaria, CdsImagensPessoa, CdsImagensDoc);
end;

function TDmCmModAvaSvr50.ProcessaPessoaCliente(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc, CdsEmpresaCliente, CdsTipoRecebCli,
  CdsImAgregCli, CdsTiposCli: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.ProcessaPessoaCliente(Operacao, CdsPessoa, CdsPessoaFisica,
    CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess, CdsContatoPess, CdsTelContato,
    CdsContaBancaria, CdsImagensPessoa, CdsImagensDoc, CdsEmpresaCliente, CdsTipoRecebCli,
    CdsImAgregCli, CdsTiposCli);
end;

function TDmCmModAvaSvr50.ProcessaPessoaForne(Operacao: Integer; CdsPessoa,
  CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
  CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
  CdsImagensDoc, CdsImAgregForn, CdsEmpresaForn, CdsFornXDesemb,
  CdsFornXRamo: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.ProcessaPessoaForne(Operacao, CdsPessoa, CdsPessoaFisica,
    CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess, CdsContatoPess, CdsTelContato,
    CdsContaBancaria, CdsImagensPessoa, CdsImagensDoc, CdsImAgregForn, CdsEmpresaForn,
    CdsFornXDesemb, CdsFornXRamo);
end;

function TDmCmModAvaSvr50.ExecSqlAndCommit(const sSql: WideString): WordBool;
begin
  Result := _PadroesSrvr.ExecSqlAndCommit(sSql);
end;

function TDmCmModAvaSvr50.GetContentFile(const sFileName: WideString): WideString;
begin
  Result := _PadroesSrvr.GetContentFile(sFileName);
end;

function TDmCmModAvaSvr50.GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa,
  TipoPessoa: Integer; var ovPessoa, ovPessoaFisica, ovDocPessoa,
  ovEndPess, ovTelEndPess, ovContatoPess, ovTelContato, ovContaBancaria,
  ovImagensPessoa, ovImagensDoc, ovEstado, ovNaturalidade, ovBanco,
  ovDocumento, ovTipoDoc: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.GetDadosPessoa(rIdPessoa, TipoGetPessoa, TipoPessoa, ovPessoa,
    ovPessoaFisica, ovDocPessoa, ovEndPess, ovTelEndPess, ovContatoPess, ovTelContato,
    ovContaBancaria, ovImagensPessoa, ovImagensDoc, ovEstado, ovNaturalidade, ovBanco,
    ovDocumento, ovTipoDoc);
end;

function TDmCmModAvaSvr50.GetDataPacketTS(lSQL: OleVariant): OleVariant;
begin
  Result := _PadroesSrvr.GetDataPacketTS(lSQL);
end;

function TDmCmModAvaSvr50.GravaHistSenha(aCdsHistSenha: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.GravaHistSenha(aCdsHistSenha);
end;

function TDmCmModAvaSvr50.ProcessaMensagem(CdsMensagem: OleVariant;
  iOperacaoMensage, IdMensagem: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcessaMensagem(CdsMensagem, iOperacaoMensage, IdMensagem);
end;

function TDmCmModAvaSvr50.SelDadosCli(rIdEmpresa, rIdForcli: Double;
  out ovSubTipo, ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
  ovImAgregCli, ovTipos, ovTiposCli: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.SelDadosCli(rIdEmpresa, rIdForcli, ovSubTipo, ovEmpresaCliente,
    ovTipoReceb, ovTipoRecebCli, ovImAgreg, ovImAgregCli, ovTipos, ovTiposCli);
end;

function TDmCmModAvaSvr50.SelDadosForne(rIdEmpresa, rIdForcli: Double;
  out ovSubTipo, ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
  ovTipoDesembForn, ovImAgregForn, ovRamoXForne: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.SelDadosForne(rIdEmpresa, rIdForCli, ovSubTipo, ovEmpresaForne,
    ovTipoDesemb, ovImAgreg, ovRamoForne, ovTipoDesembForn, ovImAgregForn, ovRamoXForne);
end;

procedure TDmCmModAvaSvr50.MensagemPadroes(Msg: string);
begin
  _MessageInfo := Msg;
end;

function TDmCmModAvaSvr50.GravarReports(ovCds: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.GravarReports(ovCds);
end;

function TDmCmModAvaSvr50.ProcessaConfig(ovCds, ovCdsReport: OleVariant;
  Operacao: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcessaConfig(ovCds, ovCdsReport, Operacao);
end;

function TDmCmModAvaSvr50.ProcessaConfigModelo(ovReports: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.ProcessaConfigModelo(ovReports);
end;

function TDmCmModAvaSvr50.ProcessaGrupoUsu(ovDataViewAcesso,
  ovTabelaAcesso, ovColunaAcesso, ovGrupo, ovUsuario, ovPessoa,
  ovGrupoXUsu, ovAutoriza, ovAutorizaRpt, ovAutorizaMS: OleVariant;
  OperacaoProcessa: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcessaGrupoUsu(ovDataViewAcesso, ovTabelaAcesso, ovColunaAcesso,
    ovGrupo, ovUsuario, ovPessoa, ovGrupoXUsu, ovAutoriza, ovAutorizaRpt, ovAutorizaMS,
    OperacaoProcessa);
end;

function TDmCmModAvaSvr50.ProcessaWorkFlow(ovWorkflowUsuario, ovWorkflow,
  ovPassoWorkflow: OleVariant; Operacao: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcessaWorkFlow(ovWorkflowUsuario, ovWorkflow, ovPassoWorkflow,
    oPeracao);
end;

function TDmCmModAvaSvr50.ProcurarReports(IdReports, OrigemCm: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcurarReports(IdReports, OrigemCm);
end;

function TDmCmModAvaSvr50.GravarCargo(ovDados: OleVariant): WordBool;
begin
  try
    FCtrlCargo.CdsCargo.Data := ovDados;
    Result := FCtrlCargo.GravarCargo;
    if not(Result) then
      _MessageInfo := FCtrlCargo.MessageInfo;
  except
    on E: Exception do
    begin
      Result := false;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCmModAvaSvr50.GravarGrupoFunc(ovDados: OleVariant): WordBool;
begin
  try
    FCtrlGrupFunc.Cds.Data := ovDados;
    Result := FCtrlGrupFunc.GravarGrupoFunc;
    if not(Result) then
      _MessageInfo := FCtrlGrupFunc.MessageInfo;
  except
    on E: Exception do
    begin
      Result := false;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCmModAvaSvr50.GravarGrupoFatorAval(ovDados: OleVariant): WordBool;
begin
  try
    FCtrlGrupoFatorAval.Cds.Data := ovDados;
    Result := FCtrlGrupoFatorAval.GravarGrupoFatorAval;
    if not(Result) then
      _MessageInfo := FCtrlGrupoFatorAval.MessageInfo;
  except
    on E: Exception do
    begin
      Result := false;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCmModAvaSvr50.GravarFatorAval(ovDados: OleVariant): WordBool;
begin
  try
    FCtrlFatorAval.Cds.Data := ovDados;
    Result := FCtrlFatorAval.GravarFatorAval;
    if not(Result) then
      _MessageInfo := FCtrlFatorAval.MessageInfo;
  except
    on E: Exception do
    begin
      Result := false;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCmModAvaSvr50.GravarPesoXFator(ovDados: OleVariant): WordBool;
begin
  try
    FCtrlPesoFatGrp.CdsDet.Data := ovDados;
    Result := FCtrlPesoFatGrp.GravarPesoXFator;
    if not(Result) then
      _MessageInfo := FCtrlPesoFatGrp.MessageInfo;
  except
    on E: Exception do
    begin
      Result := false;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCmModAvaSvr50.GravarTipoAval(ovDados: OleVariant): WordBool;
begin
  try
    FCtrlTipAval.Cds.Data := ovDados;
    Result := FCtrlTipAval.GravarTipoAval;
    if not(Result) then
      _MessageInfo := FCtrlTipAval.MessageInfo;
  except
    on E: Exception do
    begin
      Result := false;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCmModAvaSvr50.GravarRegAval(ovDados: OleVariant): WordBool;
begin
  try
    FCtrlRegAval.CdsHstAval.Data := ovDados;
    Result := FCtrlRegAval.GravarRegAval;
    if not(Result) then
      _MessageInfo := FCtrlRegAval.MessageInfo;
  except
    on E: Exception do
    begin
      Result := false;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCmModAvaSvr50.GravarRegDesemp(ovDados: OleVariant): WordBool;
begin
  try
    FCtrlRegDesemp.CdsHstDesemp.Data := ovDados;
    Result := FCtrlRegDesemp.GravarRegDesemp;
    if not(Result) then
      _MessageInfo := FCtrlRegDesemp.MessageInfo;
  except
    on E: Exception do
    begin
      Result := false;
      _MessageInfo := E.Message;
    end;
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TDmCmModAvaSvr50,
    Class_DmCmModAvaSvr50, ciMultiInstance, tmApartment);
end.
