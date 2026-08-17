unit DCmModBenSvr50;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr, DBClient, DBTables,
  Db, CmModBenSvr50_TLB, StdVcl, uDatabase, uMidasUtil, uCMTypes, uCmFileUtils, JCLFileUtils,
  uCtrlPadroesSrvr, uCtrlPadroes, uCtrlProvDesc, uCtrlTipoBenSal, uCtrlRubricaIndiv,
  uCtrlIncRubrica;

type
  TDmCmModBenSvr50 = class(TRemoteDataModule, IDmCmModBenSvr50)
    dbModBen: TDatabase;
    ssnModBen: TSession;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure RemoteDataModuleDestroy(Sender: TObject);
  private
    TempDir: string;
    _MessageInfo: string;
    _PadroesSrvr: TCtrlPadroesSrvr;

    FCtrlProvDesc: TCtrlProvDesc;
    FCtrlTipoBenSal: TCtrlTipoBenSal;
    FCtrlRubricaIndiv: TCtrlRubricaIndiv;
    FCtrlIncRubrica: TCtrlIncRubrica;

    procedure MensagemPadroes(Msg: string);
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function ConectaDB(const UserName, PassWord, ServerName: WideString): WordBool; safecall;
    function GetDataPacket(const sSql: WideString): OleVariant; safecall;
    function GravaLogOperacoes(dIdPessoa, dIdModulo, dIdUsuario: Double;
      const sDescOperacao: WideString): WordBool; safecall;
    function MessageInfo: WideString; safecall;
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
    function ExecSqlAndCommit(const sSql: WideString): WordBool; safecall;
    function GetContentFile(const sFileName: WideString): WideString; safecall;
    function GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa,
      TipoPessoa: Integer; var ovPessoa, ovPessoaFisica, ovDocPessoa,
      ovEndPess, ovTelEndPess, ovContatoPess, ovTelContato,
      ovContaBancaria, ovImagensPessoa, ovImagensDoc, ovEstado,
      ovNaturalidade, ovBanco, ovDocumento,
      ovTipoDoc: OleVariant): WordBool; safecall;
    function GetDataPacketTS(lSQL: OleVariant): OleVariant; safecall;
    function GravaHistSenha(aCdsHistSenha: OleVariant): WordBool; safecall;
    function ProcessaMensagem(CdsMensagem: OleVariant; iOperacaoMensage,
      IdMensagem: Integer): WordBool; safecall;
    function SelDadosCli(rIdEmpresa, rIdForcli: Double; out ovSubTipo,
      ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
      ovImAgregCli, ovTipos, ovTiposCli: OleVariant): WordBool; safecall;
    function SelDadosForne(rIdEmpresa, rIdForcli: Double; out ovSubTipo,
      ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
      ovTipoDesembForn, ovImAgregForn, ovRamoXForne: OleVariant): WordBool; safecall;

    function GravarProvento(ovDados: OleVariant): WordBool; safecall;
    function AlterarTipoRubricaEmpresa(Visivel: WordBool; IdEmpresa: Integer): WordBool; safecall;
    function GravarRubricaEmpresa(Operacao: Integer; IdProvento: Double;
      IdEmpresa: Integer; const TipoRubrica, CodProvDesc,
      DescrProvDesc: WideString): WordBool; safecall;
    function GravarTipoBenSal(ovDados: OleVariant): WordBool; safecall;
    function GravarRubricaIndiv(ovDados: OleVariant): WordBool; safecall;
    function ProcessarInclusaoBeneficios(ovDados: OleVariant): WordBool;
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
  end;

implementation

uses uFuncoesUteisRH;

{$R *.DFM}

procedure TDmCmModBenSvr50.RemoteDataModuleCreate(Sender: TObject);
begin
  _MessageInfo := '';
  {**
    Gera um DatabaseName diferente para cada aplicação cliente conectada e
    atribui o DatabaseName para algumas queryes
  **}

  TempDir := GeraDataBaseName(Self, dbModBen, true, ssnModBen);
  {**
    Cria as classes de controle da mesma forma que criadas na aplicação cliente
    só que especificando o connectionSide como servidor.
    Parâmetros como o remote server, connectadab, podem ser passados como default.

    Verificar a nescessidade de eventos de mensagens diferentes para conponentes
    diferentes a criar mais de um MessageInfo, a princípio todos os Controls responde
    sempres ao mesmo MessageInfo
  **}
  _PadroesSrvr := TCtrlPadroesSrvr.Create;
  _PadroesSrvr.Initialize(dbModBen, true, cntBde, cnsServer, nil, false, MensagemPadroes, nil, true);

  FCtrlProvDesc := TCtrlProvDesc.Create;
  FCtrlProvDesc.InitializeAs(_PadroesSrvr);

  FCtrlTipoBenSal := TCtrlTipoBenSal.Create;
  FCtrlTipoBenSal.InitializeAs(_PadroesSrvr);

  FCtrlRubricaIndiv := TCtrlRubricaIndiv.Create;
  FCtrlRubricaIndiv.InitializeAs(_PadroesSrvr);

  FCtrlIncRubrica := TCtrlIncRubrica.Create;
  FCtrlIncRubrica.InitializeAs(_PadroesSrvr);
end;

procedure TDmCmModBenSvr50.RemoteDataModuleDestroy(Sender: TObject);
begin
  FreeAndNil(_PadroesSrvr);

  FreeAndNil(FCtrlProvDesc);
  FreeAndNil(FCtrlTipoBenSal);
  FreeAndNil(FCtrlRubricaIndiv);
  FreeAndNil(FCtrlIncRubrica);
end;

class procedure TDmCmModBenSvr50.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

function TDmCmModBenSvr50.ConectaDB(const UserName, PassWord,
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
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCmModBenSvr50.GetDataPacket(const sSql: WideString): OleVariant;
begin
  Result := _PadroesSrvr.GetDataPacket(sSql);
end;

function TDmCmModBenSvr50.GravaLogOperacoes(dIdPessoa, dIdModulo,
  dIdUsuario: Double; const sDescOperacao: WideString): WordBool;
begin
  Result := _PadroesSrvr.GravaLogOperacoes(dIdPessoa, dIdModulo, dIdUsuario, sDescOperacao);
end;

function TDmCmModBenSvr50.MessageInfo: WideString;
begin
  Result := _MessageInfo;
end;

function TDmCmModBenSvr50.ProcessaPessoaAgencia(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.ProcessaPessoaAgencia(Operacao, CdsPessoa, CdsPessoaFisica,
    CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess, CdsContatoPess, CdsTelContato,
    CdsContaBancaria, CdsImagensPessoa, CdsImagensDoc);
end;

function TDmCmModBenSvr50.ProcessaPessoaBanco(Operacao: Integer; CdsPessoa,
  CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
  CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
  CdsImagensDoc: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.ProcessaPessoaBanco(Operacao, CdsPessoa, CdsPessoaFisica,
    CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess, CdsContatoPess, CdsTelContato,
    CdsContaBancaria, CdsImagensPessoa, CdsImagensDoc);
end;

function TDmCmModBenSvr50.ProcessaPessoaCliente(Operacao: Integer;
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

function TDmCmModBenSvr50.ProcessaPessoaForne(Operacao: Integer; CdsPessoa,
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

function TDmCmModBenSvr50.ExecSqlAndCommit(const sSql: WideString): WordBool;
begin
  Result := _PadroesSrvr.ExecSqlAndCommit(sSql);
end;

function TDmCmModBenSvr50.GetContentFile(const sFileName: WideString): WideString;
begin
  Result := _PadroesSrvr.GetContentFile(sFileName);
end;

function TDmCmModBenSvr50.GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa,
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

function TDmCmModBenSvr50.GetDataPacketTS(lSQL: OleVariant): OleVariant;
begin
  Result := _PadroesSrvr.GetDataPacketTS(lSQL);
end;

function TDmCmModBenSvr50.GravaHistSenha(aCdsHistSenha: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.GravaHistSenha(aCdsHistSenha);
end;

function TDmCmModBenSvr50.ProcessaMensagem(CdsMensagem: OleVariant;
  iOperacaoMensage, IdMensagem: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcessaMensagem(CdsMensagem, iOperacaoMensage, IdMensagem);
end;

function TDmCmModBenSvr50.SelDadosCli(rIdEmpresa, rIdForcli: Double;
  out ovSubTipo, ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
  ovImAgregCli, ovTipos, ovTiposCli: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.SelDadosCli(rIdEmpresa, rIdForcli, ovSubTipo, ovEmpresaCliente,
    ovTipoReceb, ovTipoRecebCli, ovImAgreg, ovImAgregCli, ovTipos, ovTiposCli);
end;

function TDmCmModBenSvr50.SelDadosForne(rIdEmpresa, rIdForcli: Double;
  out ovSubTipo, ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
  ovTipoDesembForn, ovImAgregForn, ovRamoXForne: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.SelDadosForne(rIdEmpresa, rIdForCli, ovSubTipo, ovEmpresaForne,
    ovTipoDesemb, ovImAgreg, ovRamoForne, ovTipoDesembForn, ovImAgregForn, ovRamoXForne);
end;

procedure TDmCmModBenSvr50.MensagemPadroes(Msg: string);
begin
  _MessageInfo := Msg;
end;

function TDmCmModBenSvr50.GravarReports(ovCds: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.GravarReports(ovCds);
end;

function TDmCmModBenSvr50.ProcessaConfig(ovCds, ovCdsReport: OleVariant;
  Operacao: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcessaConfig(ovCds, ovCdsReport, Operacao);
end;

function TDmCmModBenSvr50.ProcessaConfigModelo(ovReports: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.ProcessaConfigModelo(ovReports);
end;

function TDmCmModBenSvr50.ProcessaGrupoUsu(ovDataViewAcesso,
  ovTabelaAcesso, ovColunaAcesso, ovGrupo, ovUsuario, ovPessoa,
  ovGrupoXUsu, ovAutoriza, ovAutorizaRpt, ovAutorizaMS: OleVariant;
  OperacaoProcessa: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcessaGrupoUsu(ovDataViewAcesso, ovTabelaAcesso, ovColunaAcesso,
    ovGrupo, ovUsuario, ovPessoa, ovGrupoXUsu, ovAutoriza, ovAutorizaRpt, ovAutorizaMS,
    OperacaoProcessa);
end;

function TDmCmModBenSvr50.ProcessaWorkFlow(ovWorkflowUsuario, ovWorkflow,
  ovPassoWorkflow: OleVariant; Operacao: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcessaWorkFlow(ovWorkflowUsuario, ovWorkflow, ovPassoWorkflow,
    oPeracao);
end;

function TDmCmModBenSvr50.ProcurarReports(IdReports, OrigemCm: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcurarReports(IdReports, OrigemCm);
end;

function TDmCmModBenSvr50.GravarProvento(ovDados: OleVariant): WordBool;
begin
  try
    FCtrlProvDesc.Cds.Data := ovDados;
    Result := FCtrlProvDesc.GravarProvento;
    if not(Result) then
      _MessageInfo := FCtrlProvDesc.MessageInfo;
  except
    on E: Exception do
    begin
      Result := false;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCmModBenSvr50.AlterarTipoRubricaEmpresa(Visivel: WordBool; IdEmpresa: Integer): WordBool;
begin
  try
    Result := FCtrlProvDesc.AlterarTipoRubricaEmpresa(Visivel, IdEmpresa);
    if not(Result) then
      _MessageInfo := FCtrlProvDesc.MessageInfo;
  except
    on E: Exception do
    begin
      Result := false;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCmModBenSvr50.GravarRubricaEmpresa(Operacao: Integer;
  IdProvento: Double; IdEmpresa: Integer; const TipoRubrica, CodProvDesc,
  DescrProvDesc: WideString): WordBool;
begin
  try
    Result := FCtrlProvDesc.GravarRubricaEmpresa(TOperacaoDataSet(Operacao), IdProvento,
      IdEmpresa, TipoRubrica, CodProvDesc, DescrProvDesc);
    if not(Result) then
      _MessageInfo := FCtrlProvDesc.MessageInfo;
  except
    on E: Exception do
    begin
      Result := false;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCmModBenSvr50.GravarTipoBenSal(ovDados: OleVariant): WordBool;
begin
  try
    FCtrlTipoBenSal.CdsTipoBenSal.Data := ovDados;
    Result := FCtrlTipoBenSal.GravarTipoBenSal;
    if not(Result) then
      _MessageInfo := FCtrlTipoBenSal.MessageInfo;
  except
    on E: Exception do
    begin
      Result := false;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCmModBenSvr50.GravarRubricaIndiv(ovDados: OleVariant): WordBool;
begin
  try
    FCtrlRubricaIndiv.CdsRubricaIndiv.Data := ovDados;
    Result := FCtrlRubricaIndiv.GravarRubricaIndiv;
    if not(Result) then
      _MessageInfo := FCtrlRubricaIndiv.MessageInfo;
  except
    on E: Exception do
    begin
      Result := false;
      _MessageInfo := E.Message;
    end;
  end;
end;

function TDmCmModBenSvr50.ProcessarInclusaoBeneficios(ovDados: OleVariant): WordBool;
begin
  try
    FCtrlIncRubrica.CdsPrincipal.Data := ovDados;
    Result := FCtrlIncRubrica.ProcessarInclusaoBeneficios;
    if not(Result) then
      _MessageInfo := FCtrlIncRubrica.MessageInfo;
  except
    on E: Exception do
    begin
      Result := false;
      _MessageInfo := E.Message;
    end;
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TDmCmModBenSvr50, Class_DmCmModBenSvr50,
    ciMultiInstance, tmApartment);
end.
