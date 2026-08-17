unit DCFinanSrv50;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, AppServerCFinan_TLB, StdVcl, DBTables, Db, uCtrlPadroesSrvr,
  Provider,uDataBase, uMidasUtil, uCMFileUtils, JclFileUtils, uCMClientDataSet,
  uCtrlConcBancaria, uCtrlConfDocReg, uCtrlDispFinanc, uCtrlFluxoCaixa,
  uCtrlHistPadrao, uCtrlMontaFluxo, uCtrlMovimFluxoOrc, uCtrlParamFinanc,
  uCtrlRegNIDuplicados, uCtrlTiposAplic, uCtrlTransfFundos, uCtrlTRDxCRespon,
  uCtrlMovimFinanc
  {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
  TDmCFinanSrv50 = class(TRemoteDataModule, IDmCFinanSrv50)
    DbCFinan: TDatabase;
    ssnCFinan: TSession;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure RemoteDataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    TempDir: string;
    _MessageInfo: String;
    _PadroesSrvr: TCtrlPadroesSrvr;

    CtrlConcBancaria: TCtrlConcBancaria;
    CtrlConfDocReg: TCtrlConfDocReg;
    CtrlDispFinanc: TCtrlDisponFinanc;
    CtrlFluxoCaixa: TCtrlFluxoCaixa;
    CtrlHistPadrao: TCtrlHistPadrao;
    CtrlMontaFluxo: TCtrlMontaFluxo;
    CtrlMovimFluxoOrc: TCtrlMovimFluxoOrc;
    CtrlParamFinanc: TCtrlParamFinanc;
    CtrlRegNIDuplicados: TCtrlRegNIDuplicados;
    CtrlTiposAplic: TCtrlTiposAplic;
    CtrlTransfFundos: TCtrlTransfFundos;
    CtrlTRDxCRespon: TCtrlTRDxCRespon;
    CtrlMovimFinanc: TCtrlMovimFinanc;

    procedure MensagemPadroes(sMens: string);
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
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
    function Concilia(rCodPortador: Double; dDataExtrato: TDateTime;
      ovDados: OleVariant; rIDPessoa, rIDModulo, rIDUsuario: Double;
      bUsaPlanoPatro: WordBool): WordBool; safecall;
    function AplicaMarcacoes(rIDPessoa, rIDModulo, rIDUsuario: Double;
      bUsaPlanoPatro: WordBool; ovDados: OleVariant): WordBool; safecall;
    function AtualizaDados(ovDados: OleVariant): WordBool; safecall;
    function EncerraDisponibilidade(dDataRef: TDateTime; rIDPessoa, rIDModulo,
      rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool; safecall;
    function GeraFluxoPrevisto(rSaldoInic: Double; dDataInicial,
      dDataFinal: TDateTime; bGeraAtrasados: WordBool; rIDPessoa,
      rIDModulo, rIDUsuario: Double; bUsaPlanoPatro: WordBool;
      const sTipoEmpresa: WideString): WordBool; safecall;
    function GeraFluxoReal(dDataInicial, dDataFinal: TDateTime; rIDPessoa,
      rIDModulo, rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool;
      safecall;
    function GeraFluxoOrcOrcamen(rPeriodoInicial, rPeriodoFinal, rExercicio,
      rIDPessoa, rIDModulo, rIDUsuario: Double;
      bUsaPlanoPatro: WordBool): WordBool; safecall;
    function GeraMultiFluxoOrc(dDataInicial, dDataFinal: TDateTime;
      const sFluxoOrigem, SFluxoDestino: WideString; rIDPessoa, rIDModulo,
      rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool; safecall;
    function AplicaAtualHistPad(rIDPessoa, rIDModulo,
      rIDUsuario: Double): WordBool; safecall;
    function IncluiAlteraFluxo(ovDadosMontaFluxo, ovDadosCompFluxo: OleVariant;
      rIDPessoa, rIDModulo, rIDUsuario: Double): WordBool; safecall;
    function ExcluiFluxo(ovDadosMontaFluxo, ovDadosCompFluxo: OleVariant;
      rIDPessoa, rIDModulo, rIDUsuario: Double): WordBool; safecall;
    function GravaOrdenacao(LinhasFluxo: OleVariant): WordBool; safecall;
    function AplicaAtualFluxoOrc(ovDados: OleVariant; rIDPessoa, rIDModulo,
      rIDUsuario: Double): WordBool; safecall;
    function AplicaAtualParamFinanc(ovDados: OleVariant): WordBool; safecall;
    function Regulariza(dDataRegularizacao: TDateTime; rIDPlano: Double;
      bIntegraContabil: WordBool; rIDPessoa, rIDModulo, rIDUsuario: Double;
      bUsaPlanoPatro: WordBool; ovDadosNaoIdentificados,
      ovDadosNaoConciliados: OleVariant): WordBool; safecall;
    function AplicaAtualTiposAplic(ovDados: OleVariant): WordBool; safecall;
    function AplicaAtualTRDxCRespon(ovDados: OleVariant): WordBool; safecall;
    function TransfereFundos(ovDados: OleVariant; rIDPessoa, rIDModulo,
      rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool; safecall;
    function EstornoFinanceiro(dDataEstorno, dDataDisp: TDateTime;
      var rCodLancFinanc: Double; rIDPlano: Double; bIntegraContabil,
      bRegNaoIdent: WordBool; rIDPessoa, rIDModulo, rIDUsuario: Double;
      bUsaPlanoPatro: WordBool): WordBool; safecall;
    function GeraImpostoRateio(var rImposto: Double; rIDPessoa, rIDModulo,
      rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool; safecall;
    function AplicaMarcacoesDisp(ovDados: OleVariant; rIDPessoa, rIDModulo,
      rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool; safecall;
    function GravaFinanceiro(ovDadosMovimFinanc, ovDadosRateioFinanc,
      ovDadosContab: OleVariant; bRegNaoIDent: WordBool;
      const sOperacao: WideString; rIDPlano: Double; bIntegraContabil,
      bCalcImposto: WordBool; rIDPessoa, rIDModulo, rIDUsuario: Double;
      bUsaPlanoPatro: WordBool): WordBool; safecall;
    function ExcluiFinanceiro(rCodLancFinanc, rIDPessoa, rIDModulo,
      rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool; safecall;
    function ProcessaWorkFlow(ovWorkflowUsuario, ovWorkflow,
      ovPassoWorkflow: OleVariant; Operacao: Integer): WordBool; safecall;
    function ProcessaGrupoUsu(ovDataViewAcesso, ovTabelaAcesso, ovColunaAcesso,
      ovGrupo, ovUsuario, ovPessoa, ovGrupoXUsu, ovAutoriza, ovAutorizaRpt,
      ovAutorizaMS: OleVariant; OperacaoProcessa: Integer): WordBool;
      safecall;
    function GravarReports(ovCds: OleVariant): WordBool; safecall;
    function ProcurarReports(IdReports, OrigemCm: Integer): WordBool; safecall;
    function ProcessaConfig(ovCds, ovCdsReport: OleVariant;
      Operacao: Integer): WordBool; safecall;
    function ProcessaConfigModelo(ovReports: OleVariant): WordBool; safecall;
{    function ExcluiFinanceiro(rCodLancFinanc, rIDPessoa, rIDModulo,
      rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool; safecall;}
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

procedure TDmCFinanSrv50.RemoteDataModuleCreate(Sender: TObject);
begin

   _MessageInfo := '';
   {**
     Gera um DatabaseName diferente para cada aplicação cliente conectada e
     atribui o DatabaseName para algumas queryes
   **}

   TempDir := GeraDataBaseName(Self,DbCFinan, True, ssnCFinan);
   {**
     Cria as classes de controle da mesma forma que criadas na aplicação cliente
     só que especificando o connectionSide como servidor.
     Parâmetros como o remote server, connectadab, podem ser passados como default.

     Verificar a nescessidade de eventos de mensagens diferentes para conponentes
     diferentes a criar mais de um MessageInfo, a princípio todos os Controls responde
     sempres ao mesmo MessageInfo
   **}

   _PadroesSrvr := TCtrlPadroesSrvr.Create;
   _PadroesSrvr.Initialize(DbCFinan,True,cntBde, cnsServer, nil, false, MensagemPadroes, nil,True);

   CtrlConcBancaria:=TCtrlConcBancaria.Create(0,0,0,False);
   CtrlConcBancaria.InitializeAs(_PadroesSrvr);

   CtrlConfDocReg:=TCtrlConfDocReg.Create;
   CtrlConfDocReg.InitializeAs(_PadroesSrvr);

   CtrlDispFinanc:=TCtrlDisponFinanc.Create(0,0,0,False);
   CtrlDispFinanc.InitializeAs(_PadroesSrvr);

   CtrlFluxoCaixa:=TCtrlFluxoCaixa.Create(0,0,0,False);
   CtrlFluxoCaixa.InitializeAs(_PadroesSrvr);
   
   CtrlHistPadrao:=TCtrlHistPadrao.Create;
   CtrlHistPadrao.InitializeAs(_PadroesSrvr);

   CtrlMontaFluxo:=TCtrlMontaFluxo.Create;
   CtrlMontaFluxo.InitializeAs(_PadroesSrvr);

   CtrlMovimFluxoOrc:=TCtrlMovimFluxoOrc.Create;
   CtrlMovimFluxoOrc.InitializeAs(_PadroesSrvr);

   CtrlParamFinanc:=TCtrlParamFinanc.Create;
   CtrlParamFinanc.InitializeAs(_PadroesSrvr);

   CtrlRegNIDuplicados:=TCtrlRegNIDuplicados.Create(0,0,0,False);
   CtrlRegNIDuplicados.InitializeAs(_PadroesSrvr);

   CtrlTiposAplic:=TCtrlTiposAplic.Create;
   CtrlTiposAplic.InitializeAs(_PadroesSrvr);

   CtrlTransfFundos:=TCtrlTransfFundos.Create(0,0,0,False);
   CtrlTransfFundos.InitializeAs(_PadroesSrvr);

   CtrlTRDxCRespon:=TCtrlTRDxCRespon.Create;
   CtrlTRDxCRespon.InitializeAs(_PadroesSrvr);

   CtrlMovimFinanc:=TCtrlMovimFinanc.Create(0,0,0,False);
   CtrlMovimFinanc.InitializeAs(_PadroesSrvr);
end;

procedure TDmCFinanSrv50.RemoteDataModuleDestroy(Sender: TObject);
begin
   _PadroesSrvr.Free;
   CtrlConcBancaria.Free;
   CtrlConfDocReg.Free;
   CtrlDispFinanc.Free;
   CtrlFluxoCaixa.Free;
   CtrlHistPadrao.Free;
   CtrlMontaFluxo.Free;
   CtrlMovimFluxoOrc.Free;
   CtrlParamFinanc.Free;
   CtrlRegNIDuplicados.Free;
   CtrlTiposAplic.Free;
   CtrlTransfFundos.Free;
   CtrlTRDxCRespon.Free;
   CtrlMovimFinanc.Free;

   if DbCFinan.Connected then DbCFinan.CLose;
   if ssnCFinan.Active then ssnCFinan.Close;
   if DirectoryExists(TempDir) then DelTree(TempDir);
end;

class procedure TDmCFinanSrv50.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

function TDmCFinanSrv50.MessageInfo: WideString;
begin
   Result := _MessageInfo;
end;

function TDmCFinanSrv50.ConectaDB(const UserName, PassWord,
  ServerName: WideString): WordBool;
begin
   try
      Result := _PadroesSrvr.ConectaDb(UserName, PassWord, ServerName);
      if not Result then _MessageInfo := _PadroesSrvr.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.ExecSqlAndCommit(const sSql: WideString): WordBool;
begin
   Result := _PadroesSrvr.ExecSqlAndCommit(sSql);
end;

function TDmCFinanSrv50.GetContentFile(
  const sFileName: WideString): WideString;
begin
   Result := _PadroesSrvr.GetContentFile(sFileName);
end;

function TDmCFinanSrv50.GetDadosPessoa(rIDPessoa: Double; TipoGetPessoa,
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

function TDmCFinanSrv50.GetDataPacket(const sSql: WideString): OleVariant;
begin
   Result := _PadroesSrvr.GetDataPacket(sSql);
end;

function TDmCFinanSrv50.GetDataPacketTS(lSQL: OleVariant): OleVariant;
begin
   Result := _PadroesSrvr.GetDataPacketTS(lSQL);
end;

function TDmCFinanSrv50.GravaHistSenha(
  aCdsHistSenha: OleVariant): WordBool;
begin
   Result := _PadroesSrvr.GravaHistSenha(aCdsHistSenha);
end;

function TDmCFinanSrv50.GravaLogOperacoes(dIDPessoa, dIDModulo,
  dIDUsuario: Double; const sDescOperacao: WideString): WordBool;
begin
   Result := _PadroesSrvr.GravaLogOperacoes(dIdPessoa, dIdModulo,
             dIdUsuario, sDescOperacao);
end;

function TDmCFinanSrv50.ProcessaMensagem(CdsMensagem: OleVariant;
  iOperacaoMensage, IDMensagem: Integer): WordBool;
begin
   Result := _PadroesSrvr.ProcessaMensagem(CdsMensagem, iOperacaoMensage, IdMensagem);
end;

function TDmCFinanSrv50.ProcessaPessoaAgencia(Operacao: Integer; CdsPessoa,
  CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
  CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
  CdsImagensDoc: OleVariant): WordBool;
begin
   Result := _PadroesSrvr.ProcessaPessoaAgencia(Operacao,
             CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
             CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
             CdsImagensPessoa, CdsImagensDoc)
end;

function TDmCFinanSrv50.ProcessaPessoaBanco(Operacao: Integer; CdsPessoa,
  CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
  CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
  CdsImagensDoc: OleVariant): WordBool;
begin
   Result := _PadroesSrvr.ProcessaPessoaBanco(Operacao,
             CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
             CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
             CdsImagensPessoa, CdsImagensDoc);
end;

function TDmCFinanSrv50.ProcessaPessoaCliente(Operacao: Integer; CdsPessoa,
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

function TDmCFinanSrv50.ProcessaPessoaForne(Operacao: Integer; CdsPessoa,
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

function TDmCFinanSrv50.SelDadosCli(rIDEmpresa, rIDForCli: Double;
  out ovSubTipo, ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
  ovImAgregCli, ovTipos, ovTiposCli: OleVariant): WordBool;
begin
   Result := _PadroesSrvr.SelDadosCli(rIdEmpresa, rIdForcli, ovSubTipo,
             ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
             ovImAgregCli, ovTipos, ovTiposCli);
end;

function TDmCFinanSrv50.SelDadosForne(rIDEmpresa, rIDForCli: Double;
  out ovSubTipo, ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
  ovTipoDesembForn, ovImAgregForn, ovRamoXForne: OleVariant): WordBool;
begin
   Result := _PadroesSrvr.SelDadosForne(rIdEmpresa, rIdForCli,
            ovSubTipo, ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
            ovTipoDesembForn, ovImAgregForn, ovRamoXForne);
end;

procedure TDmCFinanSrv50.MensagemPadroes(sMens: string);
begin
   _MessageInfo := sMens;
end;

function TDmCFinanSrv50.Concilia(rCodPortador: Double;
  dDataExtrato: TDateTime; ovDados: OleVariant; rIDPessoa, rIDModulo,
  rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool;
begin
   try
      CtrlConcBancaria.cdsExtrato.Close;
      CtrlConcBancaria.cdsExtrato.Data:=ovDados;

      CtrlConcBancaria.IDPessoa:=rIDPessoa;
      CtrlConcBancaria.IDModulo:=rIDModulo;
      CtrlConcBancaria.IDUsuario:=rIDUsuario;
      CtrlConcBancaria.UsaPlanoPatro:=bUsaPlanoPatro;

      Result:=CtrlConcBancaria.Concilia(rCodPortador,dDataExtrato);
      if not(Result) then _MessageInfo:=CtrlConcBancaria.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.AplicaMarcacoes(rIDPessoa, rIDModulo,
  rIDUsuario: Double; bUsaPlanoPatro: WordBool;
  ovDados: OleVariant): WordBool;
begin
   try
      CtrlConcBancaria.cdsExtrato.Close;
      CtrlConcBancaria.cdsExtrato.Data:=ovDados;
      CtrlConcBancaria.IDPessoa:=rIDPessoa;
      CtrlConcBancaria.IDModulo:=rIDModulo;
      CtrlConcBancaria.IDUsuario:=rIDUsuario;
      CtrlConcBancaria.UsaPlanoPatro:=bUsaPlanoPatro;

      Result:=CtrlConcBancaria.AplicaMarcacoes;
      if not(Result) then _MessageInfo:=CtrlConcBancaria.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.AtualizaDados(ovDados: OleVariant): WordBool;
begin
   try
      CtrlConfDocReg.CdsRelacionaNI.Close;
      CtrlConfDocReg.CdsRelacionaNI.Data:=ovDados;
      Result:=CtrlConfDocReg.AtualizaDados;
      if not(Result) then _MessageInfo:=CtrlConfDocReg.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.EncerraDisponibilidade(dDataRef: TDateTime;
  rIDPessoa, rIDModulo, rIDUsuario: Double;
  bUsaPlanoPatro: WordBool): WordBool;
begin
   try
      CtrlDispFinanc.IDPessoa:=rIDPessoa;
      CtrlDispFinanc.IDModulo:=rIDModulo;
      CtrlDispFinanc.IDUsuario:=rIDUsuario;
      CtrlDispFinanc.UsaPlanoPatro:=bUsaPlanoPatro;

      Result:=CtrlDispFinanc.EncerraDisponibilidade(dDataRef);
      if not(Result) then _MessageInfo:=CtrlDispFinanc.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.GeraFluxoPrevisto(rSaldoInic: Double; dDataInicial,
  dDataFinal: TDateTime; bGeraAtrasados: WordBool; rIDPessoa, rIDModulo,
  rIDUsuario: Double; bUsaPlanoPatro: WordBool;
  const sTipoEmpresa: WideString): WordBool;
begin
   try
      CtrlFluxoCaixa.IDPessoa:=rIDPessoa;
      CtrlFluxoCaixa.IDModulo:=rIDModulo;
      CtrlFluxoCaixa.IDUsuario:=rIDUsuario;
      CtrlFluxoCaixa.UsaPlanoPatro:=bUsaPlanoPatro;
      CtrlFluxoCaixa.PreparaCtrl;
      CtrlFluxoCaixa.TipoEmpresa:=sTipoEmpresa;

      Result:=CtrlFluxoCaixa.GeraFluxoPrevisto(rSaldoInic,dDataInicial,dDataFinal,bGeraAtrasados);
      if not(Result) then _MessageInfo:=CtrlFluxoCaixa.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.GeraFluxoReal(dDataInicial, dDataFinal: TDateTime;
  rIDPessoa, rIDModulo, rIDUsuario: Double;
  bUsaPlanoPatro: WordBool): WordBool;
begin
   try
      CtrlFluxoCaixa.IDPessoa:=rIDPessoa;
      CtrlFluxoCaixa.IDModulo:=rIDModulo;
      CtrlFluxoCaixa.IDUsuario:=rIDUsuario;
      CtrlFluxoCaixa.UsaPlanoPatro:=bUsaPlanoPatro;
      CtrlFluxoCaixa.PreparaCtrl;

      Result:=CtrlFluxoCaixa.GeraFluxoReal(dDataInicial,dDataFinal);
      if not(Result) then _MessageInfo:=CtrlFluxoCaixa.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.GeraFluxoOrcOrcamen(rPeriodoInicial, rPeriodoFinal,
  rExercicio, rIDPessoa, rIDModulo, rIDUsuario: Double;
  bUsaPlanoPatro: WordBool): WordBool;
begin
   try
      CtrlFluxoCaixa.IDPessoa:=rIDPessoa;
      CtrlFluxoCaixa.IDModulo:=rIDModulo;
      CtrlFluxoCaixa.IDUsuario:=rIDUsuario;
      CtrlFluxoCaixa.UsaPlanoPatro:=bUsaPlanoPatro;
      CtrlFluxoCaixa.PreparaCtrl;

      Result:=CtrlFluxoCaixa.GeraFluxoOrcOrcamen(rPeriodoInicial,rPeriodoFinal,rExercicio);
      if not(Result) then _MessageInfo:=CtrlFluxoCaixa.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.GeraMultiFluxoOrc(dDataInicial,
  dDataFinal: TDateTime; const sFluxoOrigem, SFluxoDestino: WideString;
  rIDPessoa, rIDModulo, rIDUsuario: Double;
  bUsaPlanoPatro: WordBool): WordBool;
begin
   try
      CtrlFluxoCaixa.IDPessoa:=rIDPessoa;
      CtrlFluxoCaixa.IDModulo:=rIDModulo;
      CtrlFluxoCaixa.IDUsuario:=rIDUsuario;
      CtrlFluxoCaixa.UsaPlanoPatro:=bUsaPlanoPatro;
      CtrlFluxoCaixa.PreparaCtrl;

      Result:=CtrlFluxoCaixa.GeraMultiFluxoOrc(dDataInicial,dDataFinal,sFluxoOrigem,SFluxoDestino);
      if not(Result) then _MessageInfo:=CtrlFluxoCaixa.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.AplicaAtualHistPad(rIDPessoa, rIDModulo,
  rIDUsuario: Double): WordBool;
begin
   try
      Result:=CtrlHistPadrao.AplicaAtualHistPad(rIDPessoa,rIDModulo,rIDUsuario);
      if not(Result) then _MessageInfo:=CtrlHistPadrao.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.IncluiAlteraFluxo(ovDadosMontaFluxo,
  ovDadosCompFluxo: OleVariant; rIDPessoa, rIDModulo,
  rIDUsuario: Double): WordBool;
begin
   try
      CtrlMontaFluxo.CdsMontaFluxo.Close;
      CtrlMontaFluxo.CdsCompFluxo.Close;
      CtrlMontaFluxo.CdsMontaFluxo.Data:=ovDadosMontaFluxo;
      CtrlMontaFluxo.CdsCompFluxo.Data:=ovDadosCompFluxo;
      Result:=CtrlMontaFluxo.IncluiAlteraFluxo(rIDPessoa,rIDModulo,rIDUsuario);
      if not(Result) then _MessageInfo:=CtrlMontaFluxo.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.ExcluiFluxo(ovDadosMontaFluxo,
  ovDadosCompFluxo: OleVariant; rIDPessoa, rIDModulo,
  rIDUsuario: Double): WordBool;
begin
   try
      CtrlMontaFluxo.CdsMontaFluxo.Close;
      CtrlMontaFluxo.CdsCompFluxo.Close;
      CtrlMontaFluxo.CdsMontaFluxo.Data:=ovDadosMontaFluxo;
      CtrlMontaFluxo.CdsCompFluxo.Data:=ovDadosCompFluxo;
      Result:=CtrlMontaFluxo.ExcluiFluxo(rIDPessoa,rIDModulo,rIDUsuario);
      if not(Result) then _MessageInfo:=CtrlMontaFluxo.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.GravaOrdenacao(LinhasFluxo: OleVariant): WordBool;
begin
   try
      Result:=CtrlMontaFluxo.GravaOrdenacao(LinhasFluxo);
      if not(Result) then _MessageInfo:=CtrlMontaFluxo.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.AplicaAtualFluxoOrc(ovDados: OleVariant; rIDPessoa,
  rIDModulo, rIDUsuario: Double): WordBool;
begin
   try
      CtrlMovimFluxoOrc.cdsFluxoOrcado.Close;
      CtrlMovimFluxoOrc.cdsFluxoOrcado.Data:=ovDados;
      Result:=CtrlMovimFluxoOrc.AplicaAtualFluxoOrc(rIDPessoa,rIDModulo,rIDUsuario);
      if not(Result) then _MessageInfo:=CtrlMovimFluxoOrc.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.AplicaAtualParamFinanc(
  ovDados: OleVariant): WordBool;
begin
   try
      CtrlParamFinanc.CdsParamFinanc.Close;
      CtrlParamFinanc.CdsParamFinanc.Data:=ovDados;
      Result:=CtrlParamFinanc.AplicaAtualParamFinanc;
      if not(Result) then _MessageInfo:=CtrlParamFinanc.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.Regulariza(dDataRegularizacao: TDateTime;
  rIDPlano: Double; bIntegraContabil: WordBool; rIDPessoa, rIDModulo,
  rIDUsuario: Double; bUsaPlanoPatro: WordBool; ovDadosNaoIdentificados,
  ovDadosNaoConciliados: OleVariant): WordBool;
begin
   try
      CtrlRegNIDuplicados.CdsNaoIdent.Close;
      CtrlRegNIDuplicados.CdsNaoConc.Close;
      CtrlRegNIDuplicados.CdsNaoIdent.Data:=ovDadosNaoIdentificados;
      CtrlRegNIDuplicados.CdsNaoConc.Data:=ovDadosNaoConciliados;
      Result:=CtrlRegNIDuplicados.Regulariza(dDataRegularizacao,rIDPlano,bIntegraContabil);
      if not(Result) then _MessageInfo:=CtrlRegNIDuplicados.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.AplicaAtualTiposAplic(
  ovDados: OleVariant): WordBool;
begin
   try
      CtrlTiposAplic.CdsTiposAplic.Close;
      CtrlTiposAplic.CdsTiposAplic.Data:=ovDados;
      Result:=CtrlTiposAplic.AplicaAtualTiposAplic;
      if not(Result) then _MessageInfo:=CtrlTiposAplic.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.AplicaAtualTRDxCRespon(
  ovDados: OleVariant): WordBool;
begin
   try
      CtrlTRDxCRespon.CdsTRDxCRespon.Close;
      CtrlTRDxCRespon.CdsTRDxCRespon.Data:=ovDados;
      Result:=CtrlTRDxCRespon.AplicaAtualTRDxCRespon;
      if not(Result) then _MessageInfo:=CtrlTRDxCRespon.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.TransfereFundos(ovDados: OleVariant; rIDPessoa,
  rIDModulo, rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool;
var
   DadosTransfAux: TDadosTransf;
begin
   try
      CtrlTransfFundos.IDPessoa:=rIDPessoa;
      CtrlTransfFundos.IDModulo:=rIDModulo;
      CtrlTransfFundos.IDUsuario:=rIDUsuario;
      CtrlTransfFundos.UsaPlanoPatro:=bUsaPlanoPatro;

      with TCMClientDataSet.Create(nil),DadosTransfAux do
      try
         Data:=ovDados;

         sPlaContaOrig:=FieldByName('PlaContaOrig').AsString;
         rPlanoOrig:=FieldByName('PlanoOrig').AsFloat;
         rCodSubContaOrig:=FieldByName('CodSubContaOrig').AsFloat;
         sCodCentroCustoOrig:=FieldByName('CodCentroCustoOrig').AsString;
         rUnidNegOrig:=FieldByName('UnidNegOrig').AsFloat;
         rCodPortadorOrig:=FieldByName('CodPortadorOrig').AsFloat;
         rMoeCodigoOrig:=FieldByName('MoeCodigoOrig').AsFloat;

         sPlaContaDest:=FieldByName('PlaContaDest').AsString;
         rPlanoDest:=FieldByName('PlanoDest').AsFloat;
         rCodSubContaDest:=FieldByName('CodSubContaDest').AsFloat;
         sCodCentroCustoDest:=FieldByName('CodCentroCustoDest').AsString;
         rUnidNegDest:=FieldByName('UnidNegDest').AsFloat;
         rCodPortadorDest:=FieldByName('CodPortadorDest').AsFloat;
         rMoeCodigoDest:=FieldByName('MoeCodigoDest').AsFloat;

         rValor:=FieldByName('Valor').AsFloat;
         sNumDoc:=FieldByName('NumDoc').AsString;
         rIDPatro:=FieldByName('IDPatro').AsFloat;
         rIDPlanoPrev:=FieldByName('IDPlanoPrev').AsFloat;
         rHistPadrao:=FieldByName('rHistPadrao').AsFloat;
         sHistorico:=FieldByName('Historico').AsString;
         sCodTipRecDes:=FieldByName('CodTipRecDes').AsString;
         dDataLanc:=FieldByName('dDataLanc').AsDateTime;

      finally
         Free;
      end;

      Result:=CtrlTransfFundos.TransfereFundos(DadosTransfAux);
      if not(Result) then _MessageInfo:=CtrlTransfFundos.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.EstornoFinanceiro(dDataEstorno,
  dDataDisp: TDateTime; var rCodLancFinanc: Double; rIDPlano: Double;
  bIntegraContabil, bRegNaoIdent: WordBool; rIDPessoa, rIDModulo,
  rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool;
begin
   try
      CtrlMovimFinanc.IDPessoa:=rIDPessoa;
      CtrlMovimFinanc.IDModulo:=rIDModulo;
      CtrlMovimFinanc.IDUsuario:=rIDUsuario;
      CtrlMovimFinanc.UsaPlanoPatro:=bUsaPlanoPatro;
      CtrlMovimFinanc.PreparaCtrl;

      Result:=CtrlMovimFinanc.EstornoFinanceiro(dDataEstorno,dDataDisp,bRegNaoIdent,rCodLancFinanc,
                                                rIDPlano,bIntegraContabil);
      if not(Result) then _MessageInfo:=CtrlMovimFinanc.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.GravaFinanceiro(ovDadosMovimFinanc,
  ovDadosRateioFinanc, ovDadosContab: OleVariant; bRegNaoIDent: WordBool;
  const sOperacao: WideString; rIDPlano: Double; bIntegraContabil,
  bCalcImposto: WordBool; rIDPessoa, rIDModulo, rIDUsuario: Double;
  bUsaPlanoPatro: WordBool): WordBool;
var
   Operacao: TOperacaoFinanc;
begin
   try
      CtrlMovimFinanc.CdsMovimFinanc.Close;
      CtrlMovimFinanc.CdsMovimFinanc.Data:=ovDadosMovimFinanc;

      CtrlMovimFinanc.CdsRateioFinanc.Close;
      CtrlMovimFinanc.CdsRateioFinanc.Data:=ovDadosRateioFinanc;

      CtrlMovimFinanc.CdsContabil.Close;
      CtrlMovimFinanc.CdsContabil.Data:=ovDadosContab;

      CtrlMovimFinanc.IDPessoa:=rIDPessoa;
      CtrlMovimFinanc.IDModulo:=rIDModulo;
      CtrlMovimFinanc.IDUsuario:=rIDUsuario;
      CtrlMovimFinanc.UsaPlanoPatro:=bUsaPlanoPatro;
      CtrlMovimFinanc.PreparaCtrl;

      if (sOperacao='I') then Operacao:=opInclusao;
      if (sOperacao='A') then Operacao:=opAlteracao;

      Result:=CtrlMovimFinanc.GravaFinanceiro(bRegNaoIdent,
                                              Operacao,
                                              rIDPlano,
                                              bIntegraContabil,
                                              bCalcImposto);

      if not(Result) then _MessageInfo:=CtrlMovimFinanc.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.ExcluiFinanceiro(rCodLancFinanc, rIDPessoa,
  rIDModulo, rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool;
begin
   try
      CtrlMovimFinanc.IDPessoa:=rIDPessoa;
      CtrlMovimFinanc.IDModulo:=rIDModulo;
      CtrlMovimFinanc.IDUsuario:=rIDUsuario;
      CtrlMovimFinanc.UsaPlanoPatro:=bUsaPlanoPatro;
      CtrlMovimFinanc.PreparaCtrl;

      Result:=CtrlMovimFinanc.ExcluiFinanceiro(rCodLancFinanc);
      if not(Result) then _MessageInfo:=CtrlMovimFinanc.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.GeraImpostoRateio(var rImposto: Double; rIDPessoa,
  rIDModulo, rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool;
begin
   try
      CtrlMovimFinanc.IDPessoa:=rIDPessoa;
      CtrlMovimFinanc.IDModulo:=rIDModulo;
      CtrlMovimFinanc.IDUsuario:=rIDUsuario;
      CtrlMovimFinanc.UsaPlanoPatro:=bUsaPlanoPatro;

      Result:=CtrlMovimFinanc.GeraImpostoRateio(rImposto);
      if not(Result) then _MessageInfo:=CtrlMovimFinanc.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.AplicaMarcacoesDisp(ovDados: OleVariant; rIDPessoa,
  rIDModulo, rIDUsuario: Double; bUsaPlanoPatro: WordBool): WordBool;
begin
   try
      CtrlDispFinanc.IDPessoa:=rIDPessoa;
      CtrlDispFinanc.IDModulo:=rIDModulo;
      CtrlDispFinanc.IDUsuario:=rIDUsuario;
      CtrlDispFinanc.UsaPlanoPatro:=bUsaPlanoPatro;

      CtrlDispFinanc.cdsLancamento.Data:=ovDados;

      Result:=CtrlDispFinanc.AplicaMarcacoesDisp;
      if not(Result) then _MessageInfo:=CtrlDispFinanc.MessageInfo;
   except
      on E:Exception do
      begin
         Result := False;
         _MessageInfo := E.Message;
      end;
   end;
end;

function TDmCFinanSrv50.ProcessaWorkFlow(ovWorkflowUsuario, ovWorkflow,
  ovPassoWorkflow: OleVariant; Operacao: Integer): WordBool;
begin
   Result := _PadroesSrvr.ProcessaWorkFlow(ovWorkflowUsuario, ovWorkflow,
             ovPassoWorkflow, oPeracao);
end;

function TDmCFinanSrv50.ProcessaGrupoUsu(ovDataViewAcesso, ovTabelaAcesso,
  ovColunaAcesso, ovGrupo, ovUsuario, ovPessoa, ovGrupoXUsu, ovAutoriza,
  ovAutorizaRpt, ovAutorizaMS: OleVariant;
  OperacaoProcessa: Integer): WordBool;
begin
   Result := _PadroesSrvr.ProcessaGrupoUsu(ovDataViewAcesso,
             ovTabelaAcesso, ovColunaAcesso, ovGrupo, ovUsuario, ovPessoa,
             ovGrupoXUsu, ovAutoriza, ovAutorizaRpt, ovAutorizaMS, OperacaoProcessa);
end;

function TDmCFinanSrv50.GravarReports(ovCds: OleVariant): WordBool;
begin
   Result := _PadroesSrvr.GravarReports(ovCds);
end;

function TDmCFinanSrv50.ProcurarReports(IdReports,
  OrigemCm: Integer): WordBool;
begin
   Result := _PadroesSrvr.ProcurarReports(IdReports, OrigemCm);
end;

function TDmCFinanSrv50.ProcessaConfig(ovCds, ovCdsReport: OleVariant;
  Operacao: Integer): WordBool;
begin
   Result := _PadroesSrvr.ProcessaConfig(ovCds, ovCdsReport, Operacao);
end;

function TDmCFinanSrv50.ProcessaConfigModelo(
  ovReports: OleVariant): WordBool;
begin
   Result := _PadroesSrvr.ProcessaConfigModelo(ovReports);
end;

initialization
  TComponentFactory.Create(ComServer, TDmCFinanSrv50,
    Class_DmCFinanSrv50, ciMultiInstance, tmApartment);
end.
