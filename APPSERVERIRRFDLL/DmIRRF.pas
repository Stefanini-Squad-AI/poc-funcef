unit DmIRRF;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, CMIRRFSvr50_TLB, StdVcl, DBTables, Db, uDataBase, uSistema,
  uMidasUtil, uCMFileUtils, JclFileUtils,
  {
    Classes de Controle de Negócio utilizadas pela aplicação
  }
  uCtrlParamIRRF, uCtrLancIRRF, uCtrlDARF, uCtrlBuscaIOFEmprestimo,
  uCtrlBuscaIRCARCAR, uCtrlExcluirCapINSS, uCtrlGeraCapINSS,
  uCtrlGeraDarf, uCtrlGeraFolha, uCtrlInforme, uCtrlIRRFPF, uCtrlConfigRelatorio,
  uCtrlNatuRendimento, uCtrlRubricaxInforme, uCtrlTipoAltxImpostos,
  uCtrUtilLancIRRF, uCtrlRptGPS, uCtrlPadroesSrvr, uCtrllConfigRelatInforme,

  {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

type
  TDIRRF = class(TRemoteDataModule, IIRRF)
    DbIRRF: TDatabase;
    sIRRF: TSession;
    procedure RemoteDataModuleCreate(Sender: TObject);
    procedure RemoteDataModuleDestroy(Sender: TObject);
  private
    CtrlConfigRelatorio : TCtrlConfigRelatorio;
    CtrlParamIRRF : TctrlParamIRRF;
    CtrlLancIRRF : TCtrLancIRRF;
    CtrlDarf : TctrlDarf;
    CtrlBuscaIOFEmprestimo : TCtrlBuscaIOFEmprestimo;
    CtrlBuscaIRCARCAR : TCtrlBuscaIRCARCAR;
    CtrlExcluirCapINSS : TCtrlExcluirCapINSS;
    CtrlGeraCapINSS : TCtrlGeraCapINSS;
    CtrlGeraDarf : TCtrlGeraDarf;
    CtrlGeraFolha : TCtrlGeraFolha;
    CtrlInforme : TCtrlInforme;
    CtrlIRRFPF : TCtrlIRRFPF;
    CtrlNaturendimento : TctrlNaturendimento;
    CtrlRubricaxInforme : TCtrlRubricaxInforme;
    CtrlTipoAltxImpostos : TCtrlTipoAltxImpostos;
    CtrlUtilLancIRRF : TCtrUtilLancIRRF;
    CtrlRptGPS : TCtrlRptGPS;
    CtrlConfigRelatInforme : TCtrllConfigRelatInforme;


    TempDir : string;
    fMessageInfo : String;
    _PadroesSrvr: TCtrlPadroesSrvr;
    procedure OnMessageInfo(sMsg: String);
    procedure MensagemPadroes(sMens: string);
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
    function ConectaDB(const Usuario, Senha, Alias: WideString): WordBool;
      safecall;
    function AplicaAlteracoesAlterador(DataAltxImpostos: OleVariant): WordBool;
      safecall;
    function AtualizaLanc(IdDarf: Integer): WordBool; safecall;
    function AtualizaLancIRRF(IdDarf: Integer): WordBool; safecall;
    function BuscaIOF(IdEmpresa: Integer; const DataIni, DataFim,
      sNaturezaMantido: WideString; UsaPlanoPatro,
      bPrimVez: WordBool): WordBool; safecall;
    function BuscaIRRF(DataNatureza, DataInforme, DataParamIRRF: OleVariant;
      IdEmpresa: Integer; const RecPag, DataIni, DataFim: WideString;
      IdModulo: Integer; UsaPlanoPatro, SoEmpresaProp : WordBool): WordBool; safecall;
    function Deletar(IdLancIRRF: Integer; bPrincipal: WordBool): WordBool;
      safecall;
    function ExcluirCAPCAR(DataLancamentos: OleVariant; EspAcesso,
      IdUsuario: Integer): WordBool; safecall;
    function ExcluirLancamento(CodDocumento, NumLancto: Integer): WordBool;
      safecall;
    function ExcluirLancIRRF(DataLancIRRF,
      DataLancxInforme: OleVariant): WordBool; safecall;
    function GeraDArf(IdPessoa, IdModulo, IdUsuario, IdEspAcesso: Integer;
      DataRateio, DataLancamentos, DataCodigos: OleVariant; const DataIni,
      DataFim, DataVenc, Obs, Referencia: WideString;
      UsaPlanoPatro: WordBool): WordBool; safecall;
    function GeraFolha(IdEmpresa, iSistema: Integer; const sCodigoFolhaInv,
      MesCobranca, sCodigoFolhaVal, CodNatureza, sMolestiaGrava, sAcima65,
      sNaturendMantido, sLinhaInforme, sNatRendPIS: WideString;
      UsaPlanoPatro, iHistRubSal: WordBool; DataMantido: OleVariant;
      const DataIni: WideString): WordBool; safecall;
    function GetDataPacket(const Ssql: WideString): OleVariant; safecall;
    function GravaCAP(rTotalRateio, rTotalValor: Currency; const sDataLanc,
      sContaC, CentroCusto, TipoDesemb, sDataVenc: WideString; CodForINSS,
      SubConta, FormaPG, IdModulo, IdUsuario, IdPessoa, TipoDoc, EspAcesso,
      Plano: Integer): WordBool; safecall;
    function GravaCAPCAR(IdPessoa, Agrupa, CodForINSS, SubConta, FormaPG,
      IdModulo, IdUsuario, TipoDoc, EspAcesso: Integer;
      DataLancamentos: OleVariant; const CentroCusto, TipoDesemb,
      sDataVenc: WideString; Plano: Integer): WordBool; safecall;
    function GravaCAPDARF(IdPessoa, IdModulo, IcodDarf, IdUsuario,
      IdEspAcesso: Integer; const sCodNatureza, DataIni, DataFim, DataVenc,
      Obs, Referencia: WideString; rValorDarf: Currency;
      UsaPlanoPatro: WordBool): WordBool; safecall;
    function GravaNaturendimento(DataNaturendimento: OleVariant): WordBool;
      safecall;
    function GravarDarf(DataDarf: OleVariant): WordBool; safecall;
    function GravarDarfLanc(IdPessoa, IcodDarf, iLancIRRF: Integer;
      const sDataIni, sDataFim, sDataVenc, sFolha: WideString;
      DataCodigo: OleVariant): WordBool; safecall;
    function GravarDocumento(DataDocumento, DataLancamentos,
      DataRateios: OleVariant; const Operacao: WideString; EspAcesso,
      IdUsuario: Integer): WordBool; safecall;
    function GravarInforme(DataInforme: OleVariant): WordBool; safecall;
    function GravarIRRF(IdPessoa: Integer; UsaPlanoPatro: WordBool;
      ICodDocumento, IEmpresaProp, IBenef: Integer; const sCodNatureza,
      sDataLanc: WideString; rValBase, rValIRRF, rValINSS, rValPIS,
      rValRef, rPercIRRF: Currency; DataInf: OleVariant;
      var ICodLanc: Double; const sContaContabil: WideString;
      IPlano: Integer; const sFlgFolha: WideString; iIdPlanoPrev, iIdPatro,
      iIdPrograma: Integer; var bPrimVez: WordBool; iIdModulo,
      iIdMotivo: Integer; const sCodCentroCusto: WideString;
      iIdVersaoFolha, rValIOF: Integer): WordBool; safecall;
    function GravarIRRFPF(DataIRRFPF: OleVariant): WordBool; safecall;
    function GravarParamIRRF(DataParamIRRF: OleVariant): WordBool; safecall;
    function GravaRubricaxInforme(DataRubricaxInforme: OleVariant): WordBool;
      safecall;
    function IncluirLancamento(DataLancamento: OleVariant): WordBool; safecall;
    function IncluirRateio(DataRateio: OleVariant): WordBool; safecall;
    function MessageInfo: WideString; safecall;
    function PegaCountLancIRRF(IdDarf: Integer): Integer; safecall;
    function PegaId(const Tabela: WideString): Integer; safecall;

    function ExecutarSQL(const Ssql: WideString): WordBool; safecall;
    function GetDataPacketTS(Ssql: OleVariant): OleVariant; safecall;
    function GravaLogOperacoes(dIdPessoa, dIdModulo, dIdUsuario: Double;
      const sDescOperacao: WideString): WordBool; safecall;
    function ProcessaPessoaForne(Operacao: Integer; CdsPessoa, CdsPessoaFisica,
             CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess, CdsContatoPess,
             CdsTelContato, CdsContaBancaria, CdsImagensPessoa, CdsImagensDoc,
             CdsImAgregForn, CdsEmpresaForn, CdsFornXDesemb,
             CdsFornXRamo: OleVariant): WordBool; safecall;
    function ProcessaPessoaCliente(Operacao: Integer; CdsPessoa,
             CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
             CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
             CdsImagensDoc, CdsEmpresaCliente, CdsTipoRecebCli, CdsImAgregCli,
             CdsTiposCli: OleVariant): WordBool; safecall;
    function ProcessaPessoaAgencia(Operacao: Integer; CdsPessoa,
                                   CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
                                   CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
                                   CdsImagensDoc: OleVariant): WordBool; safecall;
    function ProcessaPessoaBanco(Operacao: Integer; CdsPessoa, CdsPessoaFisica,
                                 CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess, CdsContatoPess,
                                 CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
                                 CdsImagensDoc: OleVariant): WordBool; safecall;
    function ExecSqlAndCommit(const sSql: WideString): WordBool; safecall;
    function ProcessaMensagem(CdsMensagem: OleVariant; iOperacaoMensage,
                              IdMensagem: Integer): WordBool; safecall;
    function GravaHistSenha(aCdsHistSenha: OleVariant): WordBool; safecall;
    function GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa,
                            TipoPessoa: Integer; var ovPessoa, ovPessoaFisica, ovDocPessoa,
                            ovEndPess, ovTelEndPess, ovContatoPess, ovTelContato,
                            ovContaBancaria, ovImagensPessoa, ovImagensDoc, ovEstado,
                            ovNaturalidade, ovBanco, ovDocumento,
                            ovTipoDoc: OleVariant): WordBool; safecall;
    function SelDadosCli(rIdEmpresa, rIdForcli: Double; out ovSubTipo,
                          ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
                          ovImAgregCli, ovTipos, ovTiposCli: OleVariant): WordBool; safecall;
    function SelDadosForne(rIdEmpresa, rIdForcli: Double; out ovSubTipo,
                           ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
                           ovTipoDesembForn, ovImAgregForn, ovRamoXForne: OleVariant): WordBool;
                           safecall;
    function GetContentFile(const sFileName: WideString): WideString; safecall;
    function  AtualizaIRRF(IdBenef: Integer; IdModulo: Integer; const CodNatureza: WideString): WordBool; safecall;
    function  ProcessaConfig(OvCds: OleVariant; OvCdsReport: OleVariant; Operacao: Integer): WordBool; safecall;
    function ProcessaWorkFlow(ovWorkflowUsuario, ovWorkflow,
      ovPassoWorkflow: OleVariant; oPeracao: Integer): WordBool; safecall;
    function ProcessaGrupoUsu(ovDataViewAcesso, ovTabelaAcesso, ovColunaAcesso,
      ovGrupo, ovUsuario, ovPessoa, ovGrupoXUsu, ovAutoriza, ovAutorizaRpt,
      ovAutorizaMS: OleVariant; OperacaoProcessa: Integer): WordBool;
      safecall;
    function GravarReports(ovCds: OleVariant): WordBool; safecall;
    function ProcurarReports(IdReports, OrigemCm: Integer): WordBool; safecall;
    function ProcessaConfigModelo(ovReports: OleVariant): WordBool; safecall;

  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TDIRRF.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

procedure TDIRRF.RemoteDataModuleCreate(Sender: TObject);
begin
  fMessageInfo := '';
   {**
     Gera um DatabaseName diferente para cada aplicação cliente conectada e
     atribui o DatabaseName para algumas queryes
   **}

   TempDir := GeraDataBaseName(Self,DbIRRF, True, sIRRF);


   {**
     Cria as classes de controle da mesma forma que criadas na aplicação cliente
     só que especificando o connectionSide como servidor.
     Parâmetros como o remote server, connectadab, podem ser passados como default.

     Verificar a nescessidade de eventos de mensagens diferentes para conponentes
     diferentes a criar mais de um MessageInfo, a princípio todos os Controls responde
     sempres ao mesmo MessageInfo
   **}
   _PadroesSrvr := TCtrlPadroesSrvr.Create;
   _PadroesSrvr.Initialize(DbIRRF,True,cntBde, cnsServer, nil, false, MensagemPadroes, nil,True);

   CtrlParamIRRF          := TCtrlParamIRRF.Create;
   CtrlParamIRRF.InitializeAs(_PadroesSrvr);

   CtrlLancIRRF           := TCtrLancIRRF.Create;
   CtrlLancIRRF.InitializeAs(_PadroesSrvr);

   CtrlDarf               := TCtrlDARF.Create;
   CtrlDarf.InitializeAs(_PadroesSrvr);

   CtrlBuscaIOFEmprestimo := TCtrlBuscaIOFEmprestimo.create;
   CtrlBuscaIOFEmprestimo.InitializeAs(_PadroesSrvr);

   CtrlBuscaIRCARCAR      := TCtrlBuscaIRCARCAR.create;
   CtrlBuscaIRCARCAR.InitializeAs(_PadroesSrvr);

   CtrlExcluirCapINSS     := TCtrlExcluirCapINSS.create;
   CtrlExcluirCapINSS.InitializeAs(_PadroesSrvr);

   CtrlGeraCapINSS        := TCtrlGeraCapINSS.create;
   CtrlGeraCapINSS.InitializeAs(_PadroesSrvr);

   CtrlGeraDarf           := TCtrlGeraDarf.create;
   CtrlGeraDarf.InitializeAs(_PadroesSrvr);

   CtrlGeraFolha          := TCtrlGeraFolha.create;
   CtrlGeraFolha.InitializeAs(_PadroesSrvr);

   CtrlInforme            := TCtrlInforme.create;
   CtrlInforme.InitializeAs(_PadroesSrvr);

   CtrlIRRFPF             := TCtrlIRRFPF.create;
   CtrlIRRFPF.InitializeAs(_PadroesSrvr);

   CtrlNaturendimento     := TCtrlNatuRendimento.create;
   CtrlNaturendimento.InitializeAs(_PadroesSrvr);

   CtrlRubricaxInforme    := TCtrlRubricaxInforme.create;
   CtrlRubricaxInforme.InitializeAs(_PadroesSrvr);

   CtrlTipoAltxImpostos   := TCtrlTipoAltxImpostos.create;
   CtrlTipoAltxImpostos.InitializeAs(_PadroesSrvr);

   CtrlUtilLancIRRF       := TCtrUtilLancIRRF.create;
   CtrlUtilLancIRRF.InitializeAs(_PadroesSrvr);

   CtrlRptGPS            := TCtrlRptGPS.create;
   CtrlRptGPS.InitializeAs(_PadroesSrvr);

   CtrlConfigRelatInforme := TCtrllConfigRelatInforme.create;
   CtrlRptGPS.InitializeAs(_PadroesSrvr);

   CtrlConfigRelatorio    := TCtrlConfigRelatorio.create;
   CtrlConfigRelatorio.InitializeAs(_PadroesSrvr);


end;

procedure TDIRRF.RemoteDataModuleDestroy(Sender: TObject);
begin
  if DbIRRF.Connected then DbIRRF.CLose;
  if Session.Active then Session.Close;
  if DirectoryExists(TempDir) then DelTree(TempDir);
  CtrlParamIRRF.free;
  CtrlLancIRRF.free;
  CtrlDarf.free;
  CtrlBuscaIOFEmprestimo.free;
  CtrlBuscaIRCARCAR.free;
  CtrlExcluirCapINSS.free;
  CtrlGeraCapINSS.free;
  CtrlGeraDarf.free;
  CtrlGeraFolha.free;
  CtrlInforme.free;
  CtrlIRRFPF.free;
  CtrlNaturendimento.free;
  CtrlRubricaxInforme.free;
  CtrlTipoAltxImpostos.free;
  CtrlUtilLancIRRF.free;
  CtrlRptGPS.free;
  CtrlConfigRelatInforme.free;
  CtrlConfigRelatorio.free;
end;

function TDIRRF.ConectaDB(const Usuario, Senha,
                         Alias: WideString): WordBool;
begin
  Try
    Result := _PadroesSrvr.ConectaDB(Usuario, Senha, Alias);
    If Not Result Then
      fMessageInfo := _PadroesSrvr.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.GetDataPacket(const Ssql: WideString): OleVariant;
begin
  Result := _PadroesSrvr.GetDataPacket(Ssql);
end;

function TDIRRF.MessageInfo: WideString;
begin
  Result := fMessageInfo;
end;

function TDIRRF.GravarParamIRRF(DataParamIRRF: OleVariant): WordBool;
begin
  CtrlParamIRRF.CdsParamIRRF.data := DataParamIRRF;
  Try
    Result := CtrlParamIRRF.GravarParamIRRF;
    If Not Result Then
      fMessageInfo := CtrlParamIRRF.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.ExcluirLancIRRF(DataLancIRRF, DataLancxInforme: OleVariant): WordBool;
begin
  CtrlLancIRRF.CdsLancIRRF.data     := DataLancIRRF;
  CtrlLancIRRF.CdsLancxinforme.data := DataLancxInforme;
  Try
    Result := CtrlLancIRRF.ExcluirLancIRRF;
    If Not Result Then
      fMessageInfo := CtrlLancIRRF.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.Deletar(IdLancIRRF: Integer; bPrincipal: WordBool): WordBool;
begin
  Try
    Result := CtrlLancIRRF.Deletar(IdLancIRRF, bPrincipal);
    If Not Result Then
      fMessageInfo := CtrlLancIRRF.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.GravarIRRF(IdPessoa: Integer; UsaPlanoPatro: WordBool;
                          ICodDocumento, IEmpresaProp, IBenef: Integer; const sCodNatureza,
                          sDataLanc: WideString; rValBase, rValIRRF, rValINSS, rValPIS, rValRef,
                          rPercIRRF: Currency; DataInf: OleVariant; var ICodLanc: Double;
                          const sContaContabil: WideString; IPlano: Integer;
                          const sFlgFolha: WideString; iIdPlanoPrev, iIdPatro,
                          iIdPrograma: Integer; var bPrimVez: WordBool; iIdModulo,
                          iIdMotivo: Integer; const sCodCentroCusto: WideString; iIdVersaoFolha,
                          rValIOF: Integer): WordBool;
Var
  TempPrimVez : Boolean;
begin
 TempPrimVez := bPrimVez;
 Try
    Result := CtrlLancIRRF.GravaIRRF(IdPessoa, UsaPlanoPatro, ICodDocumento, IEmpresaProp,
                                   IBenef, sCodNatureza, sDataLanc, rValBase, rValIRRF, rValINSS,
                                   rValPIS, rValRef, rPercIRRF, DataInf,
                                   IcodLanc,
                                   sContaContabil,
                                   IPlano,
                                   sFlgFolha,
                                   iIdPlanoPrev,
                                   iIdPatro,
                                   iIdPrograma,
                                   TempPrimVez,
                                   iIdModulo, iIdMotivo, sCodCentroCusto, iIdVersaoFolha, rValIOF);
    If Not Result Then
      fMessageInfo := CtrlLancIRRF.MessageInfo
    else
      bPrimVez := TempPrimVez;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;


end;

function TDIRRF.GravarDarf(DataDarf: OleVariant): WordBool;
begin
  CtrlDarf.CdsDARF.Data := DataDarf;
  Try
    Result := CtrlDarf.GravarDARF;
    If Not Result Then
      fMessageInfo := CtrlDarf.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.GravarDocumento(DataDocumento, DataLancamentos,
                               DataRateios: OleVariant; const Operacao: WideString; EspAcesso,
                               IdUsuario: Integer): WordBool;
Var
  Operac : Char;
  Aux : string;
begin
  Aux    := copy(Pchar(Operacao), 1, 1);
  Operac := Aux[1];

  Try
    Result := CtrlDarf.GravarDocumento(DataDocumento, DataLancamentos, DataRateios, Operac,
                                     EspAcesso, IdUsuario);
    If Not Result Then
      fMessageInfo := CtrlDarf.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.IncluirRateio(DataRateio: OleVariant): WordBool;
begin
  Try
    Result := CtrlDarf.IncluirRateio(DataRateio);
    If Not Result Then
      fMessageInfo := CtrlDarf.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.IncluirLancamento(DataLancamento: OleVariant): WordBool;
begin
  Try
    Result := CtrlDarf.IncluirLancamento(DataLancamento);
    If Not Result Then
      fMessageInfo := CtrlDarf.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.ExcluirLancamento(CodDocumento,
                                 NumLancto: Integer): WordBool;
begin
  Try
    Result := CtrlDarf.ExcluirLancamento(CodDocumento, NumLancto);
    If Not Result Then
      fMessageInfo := CtrlDarf.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.AtualizaLancIRRF(IdDarf: Integer): WordBool;
begin
 Try
    Result := CtrlDarf.AtualizaLancIRRF(IdDarf);
    If Not Result Then
      fMessageInfo := CtrlDarf.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.AtualizaLanc(IdDarf: Integer): WordBool;
begin
  Try
    Result := CtrlDarf.AtualizaLanc(IdDarf);
    If Not Result Then
      fMessageInfo := CtrlDarf.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.PegaId(const Tabela: WideString): Integer;
begin
  Try
    Result := CtrlDarf.PegaId(Tabela);
    If  Result < 1 then
      fMessageInfo := CtrlDarf.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := -1;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.PegaCountLancIRRF(IdDarf: Integer): Integer;
begin
  Try
    Result := CtrlDarf.PegaCountLancIRRF(IdDarf);
    If Result < 1 Then
      fMessageInfo := CtrlDarf.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := -1;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.BuscaIOF(IdEmpresa: Integer; const DataIni, DataFim,
                        sNaturezaMantido: WideString; UsaPlanoPatro,
                        bPrimVez: WordBool): WordBool;
begin
  Try
    Result := CtrlBuscaIOFEmprestimo.BuscaIOF(IdEmpresa, DataIni, DataFim, sNaturezaMantido,
                                            UsaPlanoPatro, bPrimVez);
    If Not Result Then
      fMessageInfo := CtrlBuscaIOFEmprestimo.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.BuscaIRRF(DataNatureza, DataInforme,
                         DataParamIRRF: OleVariant; IdEmpresa: Integer; const RecPag, DataIni,
                         DataFim: WideString; IdModulo: Integer;
                         UsaPlanoPatro, SoEmpresaProp : WordBool): WordBool;
begin
  Try
    Result := CtrlBuscaIRCARCAR.BuscaIRRF(DataNatureza, DataInforme, DataParamIRRF, IdEmpresa, RecPag,
                                          DataIni, DataFim, IdModulo, UsaPlanoPatro, SoEmpresaProp);
    If Not Result Then
      fMessageInfo := CtrlBuscaIRCARCAR.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.ExcluirCAPCAR(DataLancamentos: OleVariant; EspAcesso,
                             IdUsuario: Integer): WordBool;
begin
  Try
    Result := CtrlExcluirCapINSS.ExcluiCAPCAR(DataLancamentos, EspAcesso, IdUsuario);
    If Not Result Then
      fMessageInfo := CtrlExcluirCapINSS.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.GravaCAPCAR(IdPessoa, Agrupa, CodForINSS, SubConta, FormaPG,
                           IdModulo, IdUsuario, TipoDoc, EspAcesso: Integer;
                           DataLancamentos: OleVariant; const CentroCusto, TipoDesemb,
                          sDataVenc: WideString; Plano: Integer): WordBool;
begin
  Try
    Result := CtrlGeraCapINSS.GravaCAPCAR(Idpessoa, Agrupa, CodForINSS, SubConta, FormaPG, IdModulo,
                                        IdUsuario, TipoDoc, EspAcesso, Plano, DataLancamentos, CentroCusto,
                                        TipoDesemb, sDAtaVenc);
    If Not Result Then
      fMessageInfo := CtrlGeraCapINSS.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.GravaCAP(rTotalRateio, rTotalValor: Currency;
                        const sDataLanc, sContaC, CentroCusto, TipoDesemb, sDataVenc: WideString;
                        CodForINSS, SubConta, FormaPG, IdModulo, IdUsuario, IdPessoa, TipoDoc,
                        EspAcesso, Plano: Integer): WordBool;
begin
  Try
    Result := CtrlGeraCapINSS.GravaCAP(rTotalRateio, rTotalValor, sDataLanc, sContaC, CentroCusto, TipoDesemb,
                                     sDataVenc, CodForINSS, SubConta, FormaPG, IdModulo, IdUsuario, IdPessoa, TipoDoc,
                                     EspAcesso, Plano);
    If Not Result Then
      fMessageInfo := CtrlGeraCapINSS.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.GeraDArf(IdPessoa, IdModulo, IdUsuario,
                        IdEspAcesso: Integer; DataRateio, DataLancamentos,
                        DataCodigos: OleVariant; const DataIni, DataFim, DataVenc, Obs,
                        Referencia: WideString; UsaPlanoPatro: WordBool): WordBool;
begin
  Try
    Result :=  CtrlGeraDarf.GeraDarf(IdPessoa, IdModulo, IdUsuario, IdEspAcesso, DataRateio,
                                   DataLancamentos, DataCodigos, DataIni, DataFim, DataVenc, Obs,
                                   Referencia, UsaPlanoPatro);
    If Not Result Then
      fMessageInfo := CtrlGeraDarf.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.GravaCAPDARF(IdPessoa, IdModulo, IcodDarf, IdUsuario,
                            IdEspAcesso: Integer; const sCodNatureza, DataIni, DataFim, DataVenc,
                            Obs, Referencia: WideString; rValorDarf: Currency;
                            UsaPlanoPatro: WordBool): WordBool;
begin
  Try
    Result := CtrlGeraDarf.GravaCAP(IdPessoa, IdModulo, IcodDarf, IdUsuario, IdEspAcesso, sCodNatureza, DataIni, DataFim, DataVenc,
                                  Obs, Referencia, rValorDarf, UsaplanoPatro);
    If Not Result Then
      fMessageInfo := CtrlGeraDarf.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.GeraFolha(IdEmpresa, iSistema: Integer;
                         const sCodigoFolhaInv, MesCobranca, sCodigoFolhaVal, CodNatureza,
                         sMolestiaGrava, sAcima65, sNaturendMantido, sLinhaInforme,
                         sNatRendPIS: WideString; UsaPlanoPatro, iHistRubSal: WordBool;
                         DataMantido: OleVariant; const DataIni: WideString): WordBool;
begin
  Try
    Result := CtrlGeraFolha.GeraFolha(IdEmpresa, iSistema, sCodigoFolhaInv, MesCobranca, DataIni, sCodigoFolhaVal,
                                    CodNatureza, sMolestiaGrava, sAcima65, sNaturendMantido, sLinhaInforme,
                                    sNatRendPIS, UsaPlanoPatro, iHistRubSal, DataMantido);
    If Not Result Then
      fMessageInfo := CtrlGeraFolha.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.GravarInforme(DataInforme: OleVariant): WordBool;
begin
  CtrlInforme.CdsInforme.data := DataInforme;
  Try
    Result := CtrlInforme.GravarInforme;
    If Not Result Then
      fMessageInfo := CtrlInforme.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.GravarIRRFPF(DataIRRFPF: OleVariant): WordBool;
begin
  CtrlIRRFPF.CdsIRRFPF.data := DataIRRFPF;
  Try
    result := CtrlIRRFPF.GravarIRRFPF;
    If Not Result Then
      fMessageInfo := CtrlIRRFPF.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.GravaNaturendimento(DataNaturendimento: OleVariant): WordBool;
begin
  CtrlNaturendimento.CdsNaturendimento.data := DataNaturendimento;
  Try
    Result := CtrlNaturendimento.GravarNaturendimento;
    If Not Result Then
      fMessageInfo := CtrlNaturendimento.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.GravaRubricaxInforme(DataRubricaxInforme: OleVariant): WordBool;
begin
  CtrlRubricaxInforme.CdsRubricaxInforme.data := DataRubricaxInforme;
  Try
    Result := CtrlRubricaxInforme.GravarRubricaxInforme;
    If Not Result Then
      fMessageInfo := CtrlRubricaxInforme.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;


function TDIRRF.AplicaAlteracoesAlterador(DataAltxImpostos: OleVariant): WordBool;
begin
  CtrlTipoAltxImpostos.CdsAltxImpostos.data := DataAltxImpostos;
  Try
    Result := CtrlTipoAltxImpostos.AplicaAlteracoesAlterador;
    If Not Result Then
      fMessageInfo := CtrlTipoAltxImpostos.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.GravarDarfLanc(IdPessoa, iCodDarf, iLancIRRF: Integer;
                              const sDataIni, sDataFim, sDataVenc, sFolha: WideString;
                              DataCodigo: OleVariant): WordBool;
begin
  Try
    Result := CtrlUtilLancIRRF.GravaDarf(IdPessoa, iCodDarf, iLancIRRF, sDataIni, sDataFim, sDataVenc,
                                       sFolha, DataCodigo);
    If Not Result Then
      fMessageInfo := CtrlUtilLancIRRF.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

function TDIRRF.GetDataPacketTS(sSql: OleVariant): OleVariant;
Begin
  Result := _PadroesSrvr.GetDataPacketTS(sSQL);
end;

function TDIRRF.ExecutarSQL(const Ssql: WideString): WordBool;
begin
  Try
    Result := CtrlRptGPS.ExecutarSQL(Ssql);
    If Not Result Then
      fMessageInfo := CtrlRptGPS.MessageInfo;
  Except
    On E:Exception Do
    Begin
      Result := False;
      fMessageInfo := E.Message;
    End;
  End;
end;

procedure TDIRRF.OnMessageInfo(sMsg: String);
begin
  fMessageInfo := sMsg;
end;

function TDIRRF.GravaLogOperacoes(dIdPessoa, dIdModulo, dIdUsuario: Double;
                                  const sDescOperacao: WideString): WordBool;
begin
    Result := _PadroesSrvr.GravaLogOperacoes(dIdPessoa, dIdModulo,
              dIdUsuario, sDescOperacao);
end;

procedure TDIRRF.MensagemPadroes(sMens: string);
begin
  fMessageInfo := sMens;
end;

function TDIRRF.ProcessaPessoaForne(Operacao: Integer; CdsPessoa,
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

function TDIRRF.ProcessaPessoaCliente(Operacao: Integer; CdsPessoa,
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

function TDIRRF.ProcessaPessoaAgencia(Operacao: Integer; CdsPessoa,
                                      CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
                                      CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
                                      CdsImagensDoc: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.ProcessaPessoaAgencia(Operacao,
            CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
            CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
            CdsImagensPessoa, CdsImagensDoc)
end;

function TDIRRF.ProcessaPessoaBanco(Operacao: Integer; CdsPessoa,
                                    CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess, CdsTelEndPess,
                                    CdsContatoPess, CdsTelContato, CdsContaBancaria, CdsImagensPessoa,
                                    CdsImagensDoc: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.ProcessaPessoaBanco(Operacao,
              CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
              CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
              CdsImagensPessoa, CdsImagensDoc);
end;

function TDIRRF.ExecSqlAndCommit(const sSql: WideString): WordBool;
begin
  Result := _PadroesSrvr.ExecSqlAndCommit(sSql);
end;

function TDIRRF.ProcessaMensagem(CdsMensagem: OleVariant; iOperacaoMensage,
                                 IdMensagem: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcessaMensagem(CdsMensagem, iOperacaoMensage, IdMensagem);
end;

function TDIRRF.GravaHistSenha(aCdsHistSenha: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.GravaHistSenha(aCdsHistSenha);
end;

function TDIRRF.GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa,
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

function TDIRRF.SelDadosCli(rIdEmpresa, rIdForcli: Double; out ovSubTipo,
                            ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg, ovImAgregCli,
                            ovTipos, ovTiposCli: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.SelDadosCli(rIdEmpresa, rIdForcli, ovSubTipo,
              ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
              ovImAgregCli, ovTipos, ovTiposCli);
end;

function TDIRRF.SelDadosForne(rIdEmpresa, rIdForcli: Double; out ovSubTipo,
                              ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne, ovTipoDesembForn,
                              ovImAgregForn, ovRamoXForne: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.SelDadosForne(rIdEmpresa, rIdForCli,
             ovSubTipo, ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
             ovTipoDesembForn, ovImAgregForn, ovRamoXForne);
end;

function TDIRRF.GetContentFile(const sFileName: WideString): WideString;
begin
  Result := _PadroesSrvr.GetContentFile(sFileName);
end;

function TDIRRF.AtualizaIRRF(IdBenef, IdModulo: Integer;
                             const CodNatureza: WideString): WordBool;
begin
  Result := CtrlConfigRelatInforme.AtualizaLancIRRF(IdBenef, IdModulo, CodNatureza);
end;

function TDIRRF.ProcessaConfig(OvCds, OvCdsReport: OleVariant;
  Operacao: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcessaConfig(ovCds, ovCdsReport, Operacao);
end;

function TDIRRF.GravarReports(ovCds: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.GravarReports(ovCds);
end;

function TDIRRF.ProcessaConfigModelo(ovReports: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.ProcessaConfigModelo(ovReports);
end;

function TDIRRF.ProcessaGrupoUsu(ovDataViewAcesso, ovTabelaAcesso,
  ovColunaAcesso, ovGrupo, ovUsuario, ovPessoa, ovGrupoXUsu, ovAutoriza,
  ovAutorizaRpt, ovAutorizaMS: OleVariant;
  OperacaoProcessa: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcessaGrupoUsu(ovDataViewAcesso,
            ovTabelaAcesso, ovColunaAcesso, ovGrupo, ovUsuario, ovPessoa,
            ovGrupoXUsu, ovAutoriza, ovAutorizaRpt, ovAutorizaMS, OperacaoProcessa);
end;

function TDIRRF.ProcessaWorkFlow(ovWorkflowUsuario, ovWorkflow,
  ovPassoWorkflow: OleVariant; oPeracao: Integer): WordBool;
begin
   Result := _PadroesSrvr.ProcessaWorkFlow(ovWorkflowUsuario, ovWorkflow,
            ovPassoWorkflow, oPeracao);
end;

function TDIRRF.ProcurarReports(IdReports, OrigemCm: Integer): WordBool;
begin
  Result := _PadroesSrvr.ProcurarReports(IdReports, OrigemCm);
end;

initialization
  TComponentFactory.Create(ComServer, TDIRRF,
    CLASS_IRRF, ciMultiInstance, tmApartment);
end.
