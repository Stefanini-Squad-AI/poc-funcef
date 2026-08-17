unit DmLivro;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, CMLivroSvr50_TLB, StdVcl, DBTables, Db, Provider,
  uDataBase, uMidasUtil, uCMFileUtils, JclFileUtils,
  {
    Classes de Controle de Negócio utilizadas pela aplicação
  }
  uCtrlCiap, uCtrlClasfisc, uCtrlModeloNF, uCtrlEquipamentoECF,
  uCtrlTermolivro, uCtrlTipoagrexImpostos, uCtrlTipoAltxImpostos, uCtrlGeraCapPis,
  uCtrlGeraCap, uCtrlGeraCiap, uCtrlParamLivro, uCtrlGeraEntrada, uCtrlApuracaoPIS,
  uCtrlGeraLivroISS, uCtrlGeraLivroISSdoVHF, uCtrlLivroICMS, uCtrlApuICMS,
  uCtrlPadroesSrvr, uCtrlGeraLivroPISdoVHF, uCtrlGeraPisSaidaVHL,

  {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

type
  TLivro = class(TRemoteDataModule, ILivro)
    sLivro: TSession;
    DbLivro: TDatabase;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure RemoteDataModuleDestroy(Sender: TObject);
  private
    {
      Classes de Controle de Negócio utilizadas pela aplicação
    }
    CtrlApuICMS : TCtrlApuICMS;
    CtrlCiap : TCtrlCiap;
    CtrlClasFisc : TCtrlClasfisc;
    CtrlModeloNF : TCtrlModeloNF;
    CtrlEquipamentoECF : TCtrlEquipamentoECF;
    CtrlTermoLivro : TCtrlTermolivro;
    ctrlTipoAgrexImpostos : TCtrlTipoagrexImpostos;
    CtrlTipoAltxImpostos : TCtrlTipoAltxImpostos;
    CtrlGeraCap : TCtrlGeraCap;
    CtrlGeraCiap : TCtrlGeraCiap;
    CtrlParamLivro : TCtrlParamLivro;
    CtrlGeraEntrada : TCtrlGeraEntrada;
    CtrlLivroISS : TCtrlGeraLivroISS;
    CtrlGeraLivroISSdoVHF : TCtrlGeraLivroISSdoVHF;
    CtrlLivroIcms : TCtrlLivroICMS;
    CtrlApuracaoPis : TCtrlApuracaoPIS;
    CtrlGeraLivroPis : TCtrlGeraCApPis;
    CtrlGeraLivroPisVHF : TCtrlGeraLivroPISdoVHF;
    CtrlGeraLivroPisVHL : TCtrlGeraPisSaidaVhl;

    TempDir: string;
    _MessageInfo: String;
    _PadroesSrvr: TCtrlPadroesSrvr;
    procedure MensagemPadroes(sMens: string);

  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function MessageInfo: WideString; safecall;
    function InserirCiap(CdsCiap: OleVariant): WordBool; safecall;
    function AlteraCiap(CdsCiap: OleVariant): WordBool; safecall;
    function AlterarClasFisc(CdsClasFisc: OleVariant): WordBool; safecall;
    function AlterarEquipamentoECF(CdsEquipamentoECF: OleVariant): WordBool;
      safecall;
    function AlterarModeloNF(CdsModeloNF: OleVariant): WordBool; safecall;
    function AlterarParamLivro(CdsParamLivro: OleVariant): WordBool; safecall;
    function AlterarTermoLivro(CdsTermoLivro: OleVariant): WordBool; safecall;
    function AplicaAlteracoesAlterador(Cds: OleVariant): WordBool; safecall;
    function AplicaAlteracoesTipoAgre(CdsAltxImpostos: OleVariant): WordBool;
      safecall;
    function ExcluirCiap(CdsCiap: OleVariant): WordBool; safecall;
    function ExcluirClasFisc(CdsClasFisc: OleVariant): WordBool; safecall;
    function ExcluirEquipamentoECF(CdsEquipamentoECF: OleVariant): WordBool;
      safecall;
    function ExcluirModeloNF(CdsModeloNF: OleVariant): WordBool; safecall;
    function ExcluirParamLivro(CdsParamLivro: OleVariant): WordBool; safecall;
    function ExcluirTermoLivro(CdsTermoLivro: OleVariant): WordBool; safecall;
    function GeraCiap(CdsBem: OleVariant; IdPessoa: Integer): WordBool;
      safecall;
    function GeraLivro(CdsLancamentos: OleVariant; IdEmpresa: Integer;
      const CodModelo, CodFiscal: WideString): WordBool; safecall;
    function GeraLivroEntrada(CdsRecebeNF: OleVariant; const ModeloNFEntra,
      ModeloNFFrete, ModeloNFDevol: WideString;
      IdPessoa: Integer): WordBool; safecall;
    function GeraLivroISS(CdsNotaVHL: OleVariant; IdEmpresa,
      IdHotel: Integer): WordBool; safecall;
    function InserirClasFisc(CdsClasFisc: OleVariant): OleVariant; safecall;
    function InserirEquipamentoECF(CdsEquipamentoECF: OleVariant): WordBool;
      safecall;
    function InserirModeloNF(CdsModeloNF: OleVariant): WordBool; safecall;
    function InserirParamLivro(CdsParamLivro: OleVariant): WordBool; safecall;
    function InserirTermoLivro(CdsTermoLivro: OleVariant): WordBool; safecall;
    function AplicaAlteracoes(Cds: OleVariant): WordBool; safecall;
    function ExcluirLivro(CdsLivro, CdsLivroDetalhe: OleVariant): WordBool;
      safecall;
    function GeraLivroISSVHF(CdsNotaFront: OleVariant; IdEmpresa,
      IdHotel: Integer): WordBool; safecall;
    function GravaParamApuracao(Data: OleVariant): WordBool; safecall;
    function GravarLivro(CdsLivro, CdsLivroDetalhe: OleVariant): WordBool;
      safecall;
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
    function PegaIdAltxImposto: Double; safecall;
    function ProcessaWorkFlow(ovWorkflowUsuario, ovWorkflow,
      ovPassoWorkflow: OleVariant; Operacao: Integer): WordBool; safecall;
    function GravarReports(ovCds: OleVariant): WordBool; safecall;
    function ProcessaConfig(ovCds, ovCdsReport: OleVariant;
      Operacao: Integer): WordBool; safecall;
    function ProcessaConfigModelo(ovReports: OleVariant): WordBool; safecall;
    function ProcessaGrupoUsu(ovDataViewAcesso, ovTabelaAcesso, ovColunaAcesso,
      ovGrupo, ovUsuario, ovPessoa, ovGrupoXUsu, ovAutoriza, ovAutorizaRpt,
      ovAutorizaMS: OleVariant; OperacaoProcessa: Integer): WordBool;
      safecall;
    function ProcurarReports(IdReports, OrigemCm: Integer): WordBool; safecall;
    function GravarApuracaoPis(DataApuracaoPis: OleVariant): WordBool;
      safecall;
    function GeraLivroPis(DataLancamentos: OleVariant; IdEmpresa: Integer;
      const CodModelo: WideString): WordBool; safecall;
    function GeraLivroPisVHF(DataNotaFront: OleVariant; IdEmpresa,
      IdHotel: Integer): WordBool; safecall;
    function GeraPisSaidaVHL(DataNotaVHL: OleVariant; IdEmpresa,
      IdHotel: Integer): WordBool; safecall;

  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TLivro.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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


function TLivro.AlteraCiap(CdsCiap: OleVariant): WordBool;
begin
  Try
    CtrlCiap.CdsCiap.data := CdsCiap;
    Result := CtrlCiap.AlteraCiap;
    If Not Result Then
      _MessageInfo := CtrlCiap.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.ExcluirCiap(CdsCiap: OleVariant): WordBool;
begin
  Try
    CtrlCiap.CdsCiap.data := CdsCiap;
    Result := CtrlCiap.ExcluirCiap;
    If Not Result Then
      _MessageInfo := CtrlCiap.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.InserirCiap(CdsCiap: OleVariant): WordBool;
begin
  Try
    CtrlCiap.CdsCiap.data := CdsCiap;
    Result := CtrlCiap.InserirCiap;
    If Not Result Then
      _MessageInfo := CtrlCiap.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.MessageInfo: WideString;
begin
  Result := _MessageInfo;
end;

procedure TLivro.RemoteDataModuleCreate(Sender: TObject);
begin
   _MessageInfo := '';
   {**
     Gera um DatabaseName diferente para cada aplicação cliente conectada e
     atribui o DatabaseName para algumas queryes
   **}

   TempDir := GeraDataBaseName(Self,DbLivro, True, sLivro);
   {**
     Cria as classes de controle da mesma forma que criadas na aplicação cliente
     só que especificando o connectionSide como servidor.
     Parâmetros como o remote server, connectadab, podem ser passados como default.

     Verificar a nescessidade de eventos de mensagens diferentes para conponentes
     diferentes a criar mais de um MessageInfo, a princípio todos os Controls responde
     sempres ao mesmo MessageInfo
   **}

   _PadroesSrvr := TCtrlPadroesSrvr.Create;
   _PadroesSrvr.Initialize(DbLivro,True,cntBde, cnsServer, nil, false, MensagemPadroes, nil,True);

   CtrlTermoLivro := TCtrlTermolivro.Create;
   CtrlTermoLivro.InitializeAs(_PadroesSrvr);

   CtrlCiap := TCtrlCiap.Create;
   CtrlCiap.InitializeAs(_PadroesSrvr);

   CtrlClasFisc := TCtrlClasfisc.Create;
   CtrlClasFisc.InitializeAs(_PadroesSrvr);

   CtrlModeloNF := TCtrlModeloNF.Create;
   CtrlModeloNF.InitializeAs(_PadroesSrvr);

   CtrlEquipamentoECF := TCtrlEquipamentoECF.Create;
   CtrlEquipamentoECF.InitializeAs(_PadroesSrvr);

   ctrlTipoAgrexImpostos := TCtrlTipoagrexImpostos.Create;
   ctrlTipoAgrexImpostos.InitializeAs(_PadroesSrvr);

   CtrlTipoAltxImpostos := TCtrlTipoAltxImpostos.Create;
   CtrlTipoAltxImpostos.InitializeAs(_PadroesSrvr);

   CtrlGeraCap := TCtrlGeraCap.Create;
   CtrlGeraCap.InitializeAs(_PadroesSrvr);

   CtrlGeraCiap := TCtrlGeraCiap.create;
   CtrlGeraCiap.InitializeAs(_PadroesSrvr);

   CtrlParamLivro := TCtrlParamLivro.create;
   CtrlParamLivro.InitializeAs(_PadroesSrvr);

   CtrlGeraEntrada := TCtrlGeraEntrada.create;
   CtrlGeraEntrada.InitializeAs(_PadroesSrvr);

   CtrlLivroISS := TCtrlGeraLivroISS.create;
   CtrlLivroISS.InitializeAs(_PadroesSrvr);

   CtrlGeraLivroISSdoVHF := TCtrlGeraLivroISSdoVHF.create;
   CtrlGeraLivroISSdoVHF.InitializeAs(_PadroesSrvr);

   CtrlLivroIcms := TCtrlLivroICMS.create;
   CtrlLivroIcms.InitializeAs(_PadroesSrvr);

   CtrlApuICMS := TCtrlApuICMS.create;
   CtrlApuICMS.InitializeAs(_PadroesSrvr);

   CtrlApuracaoPis := TCtrlApuracaoPIS.create;
   CtrlApuracaoPis.InitializeAs(_PadroesSrvr);

   CtrlGeraLivroPis := TCtrlGeraCApPis.create;
   CtrlGeraLivroPis.InitializeAs(_PadroesSrvr);

   CtrlGeraLivroPisVHF := TCtrlGeraLivroPISdoVHF.create;
   CtrlGeraLivroPisVHF.InitializeAs(_PadroesSrvr);

   CtrlGeraLivroPisVHL := TCtrlGeraPisSaidaVhl.create;
   CtrlGeraLivroPisVHL.InitializeAs(_PadroesSrvr);
end;

function TLivro.InserirClasFisc(CdsClasFisc: OleVariant): OleVariant;
begin
  Try
    CtrlClasFisc.CdsClasfisc.data := CdsClasFisc;
    Result := CtrlClasFisc.InserirClasfisc;
    _MessageInfo := CtrlClasFisc.MessageInfo;
  Except
    On E:Exception Do
      _MessageInfo := E.Message;
  End;
end;

function TLivro.AlterarClasFisc(CdsClasFisc: OleVariant): WordBool;
begin
  Try
    CtrlClasFisc.CdsClasfisc.data := CdsClasFisc;
    Result := CtrlClasFisc.AlterarClasfisc;
    If Not Result Then
      _MessageInfo := CtrlClasFisc.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.ExcluirClasFisc(CdsClasFisc: OleVariant): WordBool;
begin
  Try
    CtrlClasFisc.CdsClasfisc.data := CdsClasFisc;
    Result := CtrlClasFisc.ExcluirClasfisc;
    If Not Result Then
      _MessageInfo := CtrlClasFisc.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.AlterarModeloNF(CdsModeloNF: OleVariant): WordBool;
begin
  Try
    CtrlModeloNF.CdsModeloNF.data := CdsModeloNF;
    Result := CtrlModeloNF.AlterarModeloNF;
    If Not Result Then
      _MessageInfo := CtrlModeloNF.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.ExcluirModeloNF(CdsModeloNF: OleVariant): WordBool;
begin
  Try
    CtrlModeloNF.CdsModeloNF.data := CdsModeloNF;
    Result := CtrlModeloNF.ExcluirModeloNF;
    If Not Result Then
      _MessageInfo := CtrlModeloNF.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.InserirModeloNF(CdsModeloNF: OleVariant): WordBool;
begin
  Try
    CtrlModeloNF.CdsModeloNF.data := CdsModeloNF;
    Result := CtrlModeloNF.InserirModeloNF;
    If Not Result Then
      _MessageInfo := CtrlModeloNF.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.AlterarEquipamentoECF(CdsEquipamentoECF: OleVariant): WordBool;
begin
  Try
    CtrlEquipamentoECF.CdsEquipamentoECF.data := CdsEquipamentoECF;
    Result := CtrlEquipamentoECF.AlterarEquipamentoECF;
    If Not Result Then
      _MessageInfo := CtrlEquipamentoECF.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.ExcluirEquipamentoECF(cdsEquipamentoECF: OleVariant): WordBool;
begin
  Try
    CtrlEquipamentoECF.CdsEquipamentoECF.data := CdsEquipamentoECF;
    Result := CtrlEquipamentoECF.ExcluirEquipamentoECF;
    If Not Result Then
      _MessageInfo := CtrlEquipamentoECF.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.InserirEquipamentoECF(CdsEquipamentoECF: OleVariant): WordBool;
begin
  Try
    CtrlEquipamentoECF.CdsEquipamentoECF.data := CdsEquipamentoECF;
    Result := CtrlEquipamentoECF.InserirEquipamentoECF;
    If Not Result Then
      _MessageInfo := CtrlEquipamentoECF.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.AlterarTermoLivro(CdsTermoLivro: OleVariant): WordBool;
begin
  Try
    CtrlTermoLivro.CdsTermolivro.data := CdsTermoLivro;
    Result := CtrlTermoLivro.AlterarTermoLivro;
    If Not Result Then
      _MessageInfo := CtrlTermoLivro.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.ExcluirTermoLivro(cdsTermoLivro: OleVariant): WordBool;
begin
  Try
    CtrlTermoLivro.CdsTermolivro.data := cdsTermoLivro;
    Result := CtrlTermoLivro.ExcluirTermoLivro;
    If Not Result Then
      _MessageInfo := CtrlTermoLivro.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.InserirTermoLivro(CdsTermoLivro: OleVariant): WordBool;
begin
  Try
    CtrlTermoLivro.CdsTermolivro.data := CdsTermoLivro;
    Result := CtrlTermoLivro.ExcluirTermoLivro;
    If Not Result Then
      _MessageInfo := CtrlTermoLivro.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.AplicaAlteracoesAlterador(Cds: OleVariant): WordBool;
begin
  Try
    CtrlTipoAltxImpostos.CdsAltxImpostos.data := Cds;
    Result := CtrlTipoAltxImpostos.AplicaAlteracoesAlterador;
    If Not Result Then
      _MessageInfo := CtrlTipoAltxImpostos.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.GeraLivro(CdsLancamentos: OleVariant;
                                  IdEmpresa: Integer; const CodModelo,
                                  CodFiscal: WideString): WordBool;
begin
  Try
    Result := CtrlGeraCap.GeraLivro(CdsLancamentos, IdEmpresa, CodModelo, CodFiscal);
    If Not Result Then
      _MessageInfo := CtrlGeraCap.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

procedure TLivro.RemoteDataModuleDestroy(Sender: TObject);
begin
  CtrlApuICMS.free;
  CtrlCiap.free;
  CtrlClasFisc.free;
  CtrlModeloNF.free;
  CtrlEquipamentoECF.free;
  CtrlTermoLivro.free;
  ctrlTipoAgrexImpostos.free;
  CtrlTipoAltxImpostos.free;
  CtrlGeraCap.free;
  CtrlGeraCiap.free;
  CtrlParamLivro.free;
  CtrlGeraEntrada.free;
  CtrlLivroISS.free;
  CtrlGeraLivroISSdoVHF.free;
  CtrlLivroIcms.free;
  _PadroesSrvr.Free;
  
  if DbLivro.Connected then DbLivro.CLose;
  if sLivro.Active then sLivro.Close;
  if DirectoryExists(TempDir) then DelTree(TempDir);
end;

function TLivro.AplicaAlteracoesTipoAgre(CdsAltxImpostos: OleVariant): WordBool;
begin
  Try
    ctrlTipoAgrexImpostos.CdsAltxImpostos.data := CdsAltxImpostos;
    Result := ctrlTipoAgrexImpostos.AplicaAlteracoesTipoAgre;
    If Not Result Then
      _MessageInfo := ctrlTipoAgrexImpostos.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.GeraCiap(CdsBem: OleVariant;
                                 IdPessoa: Integer): WordBool;
begin
  Try
    Result := CtrlGeraCiap.GeraCiap(CdsBem, IdPessoa);
    If Not Result Then
      _MessageInfo := CtrlGeraCiap.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.AlterarParamLivro(CdsParamLivro: OleVariant): WordBool;
begin
  Try
    CtrlParamLivro.CdsParamLivro.data := CdsParamLivro;
    Result := CtrlParamLivro.AlterarParamLivro;
    If Not Result Then
      _MessageInfo := CtrlParamLivro.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.ExcluirParamLivro(CdsParamLivro: OleVariant): WordBool;
begin
  Try
    CtrlParamLivro.CdsParamLivro.data := CdsParamLivro;
    Result := CtrlParamLivro.ExcluirParamLivro;
    If Not Result Then
      _MessageInfo := CtrlParamLivro.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.InserirParamLivro(CdsParamLivro: OleVariant): WordBool;
begin
  Try
    CtrlParamLivro.CdsParamLivro.data := CdsParamLivro;
    Result := CtrlParamLivro.InserirParamLivro;
    If Not Result Then
      _MessageInfo := CtrlParamLivro.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.GeraLivroEntrada(CdsRecebeNF: OleVariant;
                                         const ModeloNFEntra, ModeloNFFrete, ModeloNFDevol: WideString;
                                         IdPessoa: Integer): WordBool;
begin
  Try
    Result := CtrlGeraEntrada.GeraLivroEntrada(CdsRecebeNF, ModeloNFEntra, ModeloNFFrete, ModeloNFDevol, IdPessoa);
    If Not Result Then
      _MessageInfo := CtrlGeraEntrada.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.GeraLivroISS(CdsNotaVHL: OleVariant; IdEmpresa,
                                     IdHotel: Integer): WordBool;
begin
  Try
    Result := CtrlLivroISS.GeraLivroISS(CdsNotaVHL, IdEmpresa, IdHotel);
    If Not Result Then
      _MessageInfo := CtrlLivroISS.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.GeraLivroISSVHF(CdsNotaFront: OleVariant;
                                        IdEmpresa, IdHotel: Integer): WordBool;
begin
  Try
    Result := CtrlGeraLivroISSdoVHF.GeraLivroISSVHF(CdsNotaFront, IdEmpresa, IdHotel);
    If Not Result Then
      _MessageInfo := CtrlGeraLivroISSdoVHF.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.GravarLivro(CdsLivro, CdsLivroDetalhe: OleVariant): WordBool;
begin
  Try
    CtrlLivroIcms.CdsNflivro.data := CdsLivro;
    CtrlLivroIcms.CdsNflivroDetalhe.data := CdsLivroDetalhe;
    Result := CtrlLivroIcms.GravarLivro;
    If Not Result Then
      _MessageInfo := CtrlLivroIcms.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.ExcluirLivro(CdsLivro, CdsLivroDetalhe: OleVariant): WordBool;
begin
  Try
    CtrlLivroIcms.CdsNflivro.data := CdsLivro;
    CtrlLivroIcms.CdsNflivroDetalhe.data := CdsLivroDetalhe;
    Result := CtrlLivroIcms.ExcluirLivro;
    If Not Result Then
      _MessageInfo := CtrlLivroIcms.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.AplicaAlteracoes(Cds: OleVariant): WordBool;
begin
  Try
    Result := CtrlLivroIcms.AplicaAlteracoes(cds);
    If Not Result Then
      _MessageInfo := CtrlLivroIcms.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.GravaParamApuracao(Data: OleVariant): WordBool;
begin
  Try
    Result := CtrlApuICMS.GravaParamApuracao(Data);
    If Not Result Then
      _MessageInfo := CtrlApuICMS.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.ConectaDB(const UserName, PassWord,
  ServerName: WideString): WordBool;
begin
  Try
    Result := _PadroesSrvr.ConectaDb(UserName, PassWord, ServerName);
    If Not Result Then _MessageInfo := _PadroesSrvr.MessageInfo;
  Except
    On E:Exception Do
    Begin
       Result := False;
       _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.GravaLogOperacoes(dIdPessoa, dIdModulo,
  dIdUsuario: Double; const sDescOperacao: WideString): WordBool;
begin
    Result := _PadroesSrvr.GravaLogOperacoes(dIdPessoa, dIdModulo,
            dIdUsuario, sDescOperacao);
end;

function TLivro.GetDataPacket(
  const sSql: WideString): OleVariant;
begin
    Result := _PadroesSrvr.GetDataPacket(sSql);
end;

function TLivro.ProcessaPessoaAgencia(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.ProcessaPessoaAgencia(Operacao,
            CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
            CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
            CdsImagensPessoa, CdsImagensDoc)
end;

function TLivro.ProcessaPessoaBanco(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.ProcessaPessoaBanco(Operacao,
              CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
              CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
              CdsImagensPessoa, CdsImagensDoc);
end;

function TLivro.ProcessaPessoaCliente(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc, CdsEmpresaCliente, CdsTipoRecebCli,
  CdsImAgregCli, CdsTiposCli: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.ProcessaPessoaCliente(Operacao,
              CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
              CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
              CdsImagensPessoa, CdsImagensDoc, CdsEmpresaCliente, CdsTipoRecebCli,
              CdsImAgregCli, CdsTiposCli)
end;

function TLivro.ProcessaPessoaForne(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc, CdsImAgregForn, CdsEmpresaForn,
  CdsFornXDesemb, CdsFornXRamo: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.ProcessaPessoaForne(Operacao,
              CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
              CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
              CdsImagensPessoa, CdsImagensDoc, CdsImAgregForn, CdsEmpresaForn,
              CdsFornXDesemb, CdsFornXRamo);
end;

function TLivro.ExecSqlAndCommit(
  const sSql: WideString): WordBool;
begin
    Result := _PadroesSrvr.ExecSqlAndCommit(sSql);
end;

function TLivro.ProcessaMensagem(CdsMensagem: OleVariant;
  iOperacaoMensage, IdMensagem: Integer): WordBool;
begin
    Result := _PadroesSrvr.ProcessaMensagem(CdsMensagem, iOperacaoMensage, IdMensagem);
end;

function TLivro.GravaHistSenha(
  aCdsHistSenha: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.GravaHistSenha(aCdsHistSenha);
end;

function TLivro.GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa,
  TipoPessoa: Integer; var ovPessoa, ovPessoaFisica, ovDocPessoa,
  ovEndPess, ovTelEndPess, ovContatoPess, ovTelContato,
  ovContaBancaria, ovImagensPessoa, ovImagensDoc, ovEstado,
  ovNaturalidade, ovBanco, ovDocumento,
  ovTipoDoc: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.GetDadosPessoa(rIdPessoa, TipoGetPessoa,
             TipoPessoa, ovPessoa, ovPessoaFisica, ovDocPessoa,
             ovEndPess, ovTelEndPess, ovContatoPess, ovTelContato,
             ovContaBancaria, ovImagensPessoa, ovImagensDoc, ovEstado,
             ovNaturalidade, ovBanco, ovDocumento,
             ovTipoDoc);
end;

function TLivro.SelDadosCli(rIdEmpresa, rIdForcli: Double;
  out ovSubTipo, ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
  ovImAgregCli, ovTipos, ovTiposCli: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.SelDadosCli(rIdEmpresa, rIdForcli, ovSubTipo,
              ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
              ovImAgregCli, ovTipos, ovTiposCli);
end;

function TLivro.SelDadosForne(rIdEmpresa, rIdForCli: Double;
  out ovSubTipo, ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
  ovTipoDesembForn, ovImAgregForn, ovRamoXForne: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.SelDadosForne(rIdEmpresa, rIdForCli,
             ovSubTipo, ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
             ovTipoDesembForn, ovImAgregForn, ovRamoXForne);
end;

function TLivro.GetDataPacketTS(lSQL: OleVariant): OleVariant;
begin
    Result := _PadroesSrvr.GetDataPacketTS(lSQL);
end;

function TLivro.GetContentFile(
  const sFileName: WideString): WideString;
begin
    Result := _PadroesSrvr.GetContentFile(sFileName);
end;

procedure TLivro.MensagemPadroes(sMens: string);
begin
    _MessageInfo := sMens;
end;


function TLivro.PegaIdAltxImposto: Double;
begin
  try
    Result := ctrlTipoAgrexImpostos.PegaIdAltXImposto;
  Except
    On E:Exception Do
    Begin
       Result := 0;
       _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.ProcessaWorkFlow(ovWorkflowUsuario, ovWorkflow,
  ovPassoWorkflow: OleVariant; Operacao: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcessaWorkFlow(ovWorkflowUsuario, ovWorkflow,
            ovPassoWorkflow, oPeracao);
end;

function TLivro.GravarReports(ovCds: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.GravarReports(ovCds);
end;

function TLivro.ProcessaConfig(ovCds, ovCdsReport: OleVariant;
  Operacao: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcessaConfig(ovCds, ovCdsReport, Operacao);
end;

function TLivro.ProcessaConfigModelo(ovReports: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.ProcessaConfigModelo(ovReports);
end;

function TLivro.ProcessaGrupoUsu(ovDataViewAcesso, ovTabelaAcesso,
  ovColunaAcesso, ovGrupo, ovUsuario, ovPessoa, ovGrupoXUsu, ovAutoriza,
  ovAutorizaRpt, ovAutorizaMS: OleVariant;
  OperacaoProcessa: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcessaGrupoUsu(ovDataViewAcesso,
            ovTabelaAcesso, ovColunaAcesso, ovGrupo, ovUsuario, ovPessoa,
            ovGrupoXUsu, ovAutoriza, ovAutorizaRpt, ovAutorizaMS, OperacaoProcessa);
end;

function TLivro.ProcurarReports(IdReports, OrigemCm: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcurarReports(IdReports, OrigemCm);
end;

function TLivro.GravarApuracaoPis(DataApuracaoPis: OleVariant): WordBool;
begin
  Try
    CtrlApuracaoPis.CdsApuracaoPIS.data := DataApuracaoPis;
    Result := CtrlApuracaoPis.GravarApuracaoPIS;
    If Not Result Then
      _MessageInfo := CtrlApuracaoPis.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;

end;

function TLivro.GeraLivroPis(DataLancamentos: OleVariant;
  IdEmpresa: Integer; const CodModelo: WideString): WordBool;
begin
  Try
    Result := CtrlGeraLivroPis.GeraLivroPis(DataLancamentos, IdEmpresa, CodModelo);
    If Not Result Then
      _MessageInfo := CtrlGeraLivroPis.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.GeraLivroPisVHF(DataNotaFront: OleVariant; IdEmpresa,
  IdHotel: Integer): WordBool;
begin
  Try
    Result := CtrlGeraLivroPisVHF.GeraLivroPISVHF(DataNotaFront, IdEmpresa, IdHotel);
    If Not Result Then
      _MessageInfo := CtrlGeraLivroPisVHF.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

function TLivro.GeraPisSaidaVHL(DataNotaVHL: OleVariant; IdEmpresa,
  IdHotel: Integer): WordBool;
begin
  Try
    Result := CtrlGeraLivroPisVHL.GeraPisSaidaVhl(DataNotaVHL, IdEmpresa, IdHotel);
    If Not Result Then
      _MessageInfo := CtrlGeraLivroPisVHL.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      _MessageInfo := E.Message;
    End;
  End;
end;

initialization
  TComponentFactory.Create(ComServer, TLivro,
    Class_Livro, ciMultiInstance, tmApartment);
end.
