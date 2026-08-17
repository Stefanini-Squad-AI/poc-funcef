unit DAlmoxComprasSrvr50;

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, StdVcl, DBTables, Db, CMAlmoxComprasSrvr50_TLB, uMidasUtil,
  uCtrlPadroesSrvr, uDataBase, uCmTypes, FileCtrl, jclFileUtils,
  uCtrlProcessoCompra, uCtrlAlmoxCompra, uCtrlAlteraCustoMed,
  uCtrlArtigo, uCtrlArtxForn, uCtrlAtualizaMovimento,
  uCtrlBaixaPerda, uCtrlComprador, uCtrlContratoProd,
  uCtrlCotacao, uCtrlDataRepresa, uCtrlGrupoProd,
  uCtrlImplantaSaldo, uCtrlIntegracaoContabil,uCtrlInventario,
  uCtrlLocalizacao,uCtrlMudaUnid,uCtrlNotaFiscal,uCtrlOrdemCompra,
  uCtrlPremiGestEstoque, uCtrlAlmox, uCtrlProdCasa,
  uCtrlRecebMerc, uCtrlReqManual, uCtrlReqMat, uCtrlSCPrePronta,
  uCtrlSoliCompra, uCtrlTamanho, UCtrlTermoInventario,
  uCtrlTipoAgregado, uCtrlTipoPerda, uCtrlCor,uCtrlUnCusteio,
  uCtrlUnMedida ;
type
  TDtmAlmoxComprasSrvr50 = class(TRemoteDataModule, IDtmAlmoxComprasSrvr50)
    DbAlmoxCompras: TDatabase;
    SsnAlmoxCompras: TSession;
    procedure RemoteDataModuleDestroy(Sender: TObject);
    procedure RemoteDataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    _TempDir        : String;
    _MessageInfo    : String;

    _PadroesSrvr        : TCtrlPadroesSrvr;
    _ProcessoCompra     : TCtrlProcessoCompra;
    _AlmoxCompra        : TCtrlAlmoxCompra;
    _AlteraCustoMed     : TCtrlAlteraCustoMed;
    _Artigo             : TCtrlArtigo;
    _ArtxForn           : TCtrlArtxForn;
    _AtualizaMovimento  : TCtrlAtualizaMovimento;
    _BaixaPerda         : TCtrlBaixaPerda;
    _Comprador          : TCtrlComprador;
    _ContratoProd       : TCtrlContratoProd;
    _Cotacao            : TCtrlCotacao;
    _DataRepresa        : TCtrlDataRepresa;
    _GrupoProd          : TCtrlGrupoProd;
    _ImplantaSaldo      : TCtrlImplantaSaldo;
    _IntegracaoContabil : TCtrlIntegracaoContabil;
    _Inventario         : TCtrlInventario;
    _Localizacao        : TCtrlLocalizacao;
    _MudaUnid           : TCtrlMudaUnid;
    _NotaFiscal         : TCtrlNotaFiscal;
    _OrdemCompra        : TCtrlOrdemCompra;
    _PremiGestEstoque   : TCtrlPremiGestEstoque;
    _Almox              : TCtrlAlmox;
    _ProdCasa           : TCtrlProdCasa;
    _RecebMerc          : TCtrlRecebMerc;
    _ReqManual          : TCtrlReqManual;
    _ReqMat             : TCtrlReqMat;
    _SCPrePronta        : TCtrlSCPrePronta;
    _SoliCompra         : TCtrlSoliCompra;
    _Tamanho            : TCtrlTamanho;
    _TermoInventario    : TCtrlTermoInventario;
    _TipoAgregado       : TCtrlTipoAgregado;
    _TipoPerda          : TCtrlTipoPerda;
    _Cor                : TCtrlCor;
    _UnCusteio          : TCtrlUnCusteio;
    _UnMedida           : TCtrlUnMedida;

    procedure MensagemPadroes(sMens: string);
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
    function ExcluirProcessoCompra(CdsProcecsso,
      CdsItemSoli: OleVariant): WordBool; safecall;
    function GravarProcessoCompra(CdsProcesso, CdsItemSoli, CdsCotacao,
      CdsNovoForn: OleVariant): WordBool; safecall;
    function GravaParalmox(Cds, CdsParamRel: OleVariant): WordBool; safecall;
    function GravaParamCompras(Cds: OleVariant): WordBool; safecall;
    function PreparaAssinatura(IdPessoa, IdModulo: Double): Word; safecall;
    function AlteraCusto(IdPessoa: Integer; Valor: Double; CodCusteio,
      CodAlmoxOrigem: Integer; const CodArtigo, CodMedida: WideString;
      Data: TDateTime; const NumDocumento, CentroCusto: WideString;
      UnidNegoc: Integer): WordBool; safecall;
    function GravarArtigo(Tipo: Integer; CdsArtigo, CdsArtxContaxCC, CdsConver,
      CdsImpostos, CdsProdutos, CdsCorTamanho: OleVariant): WordBool;
      safecall;
    function ExcluirArtigo(CdsArtigo: OleVariant): WordBool; safecall;
    function ExisteMedida(const CodMedida: WideString;
      CdsConver: OleVariant): WordBool; safecall;
    function AtribuirArtigo(Cds: OleVariant): WordBool; safecall;
    function AtualizaMovimento(IdPessoa: Integer; const CodArtigo: WideString;
      Data: TDateTime): WordBool; safecall;
    function RealizaBaixa(IdTipoPerda, IdPessoa: Integer; Valor, Qtde: Double;
      CodCusteio, CodAlmoxOrigem: Integer; const CodArtigo,
      CodMedida: WideString; Data: TDateTime; const NumDocumento,
      CentroCusto: WideString; UnidNegoc: Integer): WordBool; safecall;
    function AtribuirGrupos(IdComprador: Double; Cds: OleVariant): WordBool;
      safecall;
    function GravarContratoProd(Cds: OleVariant): WordBool; safecall;
    function CalculaSumario(CodProcesso: Double): WordBool; safecall;
    function GravarCotacao(CdsCotacao, CdsPrazoEntrega, CdsPrazoPagto,
      CdsValorAgreg, CdsValorAgregTela: OleVariant): WordBool; safecall;
    function GravaStatus(CodProcesso, IdProcxArt, Proposta, IdForCli: Double;
      const Status, Justificativa: WideString): WordBool; safecall;
    function ProcessaSelecao(CdsSuamario: OleVariant): WordBool; safecall;
    function ProcessaStatus(CodProcesso: Double): WordBool; safecall;
    function ValidaDadosCotacao(CdsCotacao, CdsPrazoEntrega, CdsPrazoPgto,
      CdsValorAgreg: OleVariant): WordBool; safecall;
    function AtualizaDataRepresa(IdPessoa: Integer; Data: TDateTime;
      const Bilhete: WideString): WordBool; safecall;
    function AtribuiUsuxGrupo(Cds: OleVariant): WordBool; safecall;
    function GravaGrupoProd(Cds: OleVariant): WordBool; safecall;
    function ImplantarSaldo(IdPessoa: Integer; Qtde, Valor: Double; CodCusteio,
      CodAlmoxOrigem: Integer; const CodArtigo, CodMedida,
      CentroCusto: WideString; UnidNegoc: Integer;
      ValUltCompra: Double): WordBool; safecall;
    function ExcluirItegrarcao(IdPessoa: Integer; Data: TDateTime;
      UsaPlanoPrev: WordBool; IdModulo, IdUsuario: Integer;
      const Bilhete: WideString): WordBool; safecall;
    function IntegrarContab(IdPessoa: Integer; DataIni, DataFim: TDateTime;
      ContabilizaTransf, UsaPlanoPrev: WordBool; IdModulo, IdUsuario,
      IdPatro, IdPlanoPrev: Integer; const Bilhete: WideString): WordBool;
      safecall;
    function AbreInventario(Cds: OleVariant;
      const CodGrupoProd: WideString): Double; safecall;
    function AtualizaSaldo(IdInventario, UnidNegoc: Integer): WordBool;
      safecall;
    function ExcluirInventario(Cds: OleVariant): WordBool; safecall;
    function GeraDiferencas(IdInventario: Integer): WordBool; safecall;
    function GravarContagem(CdsContagem: OleVariant): WordBool; safecall;
    function ImportArqInvent(IdInvetario: Integer;
      Arquivo: OleVariant): WordBool; safecall;
    function GravarLocalizacao(Cds: OleVariant): WordBool; safecall;
    function ConverterUnidade(const CodArtigo, CodProduto, CodUnVelha,
      CodUnNova, Bilhete: WideString): WordBool; safecall;
    function ExcluirNotaFiscal(CdsNota, CdsItemNota, CdsAgregItemNota,
      CdsAgregNota: OleVariant): WordBool; safecall;
    function GravarNotaFiscal(CdsNota, CdsItemNota, CdsAgregItemNota,
      CdsAgregNota: OleVariant): WordBool; safecall;
    function ExcluirOrdemCompra(CdsOC, CdsItemOC, CdsPrazoPgtoOC,
      CdsPrazoEntregaOC, CdsSCIItemOC, CdsAgregItemOC,
      CdsAgregTotOC: OleVariant): WordBool; safecall;
    function CancelaItemOC(IdItemOC: Double; temCotacao: WordBool;
      CodProcesso: Double): WordBool; safecall;
    function CancelaOC(NumOC: Double): WordBool; safecall;
    function GravarPremiGestEstoque(Cds: OleVariant): WordBool; safecall;
    function GravarAlmox(CdsAlmox: OleVariant): WordBool; safecall;
    function ExcluirAlmox(CdsAlmox: OleVariant): WordBool; safecall;
    function AssociaAlmoxTransf(CdsAlmox: OleVariant): WordBool; safecall;
    function AtribuirAlmoxarifado(Cds: OleVariant): WordBool; safecall;
    function BaixaProdCasa(TipoBaixa, IdPessoa: Integer; Valor, Qtde: Double;
      CodAlmoxOrigem: Integer; const CodArtigo, CodMedida: WideString;
      Data: TDateTime; const NumDocumento: WideString; UnidNegoc,
      CodAlmoxTransf: Integer; const CodArtigoElab,
      CodMedidaElab: WideString): WordBool; safecall;
    function ExcluirRecebMerc( IdNFRecebDevol : Double ): WordBool; safecall;
    function GravarRecebMerc(IdPessoa: Integer; UsaPlanoPrev, IntegraCAP,
      IntegraContab: WordBool; IdModulo, IdUsuario, IdPatro,
      IdPlanoPrev: Double; ERecebimentoComOC: WordBool; CdsNota,
      CdsItemNota, CdsAgregItemNota, CdsAgregNota: OleVariant): WordBool;
      safecall;
    function BaixarMaterial(TipoBaixa, IdPessoa: Integer; Cds,
      CdsItem: OleVariant): WordBool; safecall;
    function GravarReqMat(Valor: Double; const Grupo: WideString; Cds,
      CdsItem: OleVariant): WordBool; safecall;
    function AtenderReqCad(IdPessoa: Integer; QtdeAtendida: Double;
      DataAtendimento: TDateTime; IdAtendente: Double;
      DeixaRestoPendente: WordBool; CdsItem: OleVariant): WordBool;
      safecall;
    function EstornarReqCad(CdsItem: OleVariant): WordBool; safecall;
    function ConfirmaAtendimento(IdItemEntrega, IdUsuario: Double;
      Data: TDateTime; CdsItem: OleVariant): WordBool; safecall;
    function DevolveAtendimento(IdPessoa: Integer; IdUsuario: Double;
      Data: TDateTime; CdsItem: OleVariant): WordBool; safecall;
    function ExcluirSCPrePronta(Cds, CdsItem: OleVariant): WordBool; safecall;
    function GravarSCPrePronta(Cds, CdsItem: OleVariant): WordBool; safecall;
    function AtribuirComprador(Operacao: Integer; IdItemSoli,
      IdComprador: Double): WordBool; safecall;
    function GravarSoliCompra(Valor: Double; const Grupo: WideString; Cds,
      CdsItem: OleVariant): WordBool; safecall;
    function ExcluirSoliCompra(Cds, CdsItem: OleVariant): WordBool; safecall;
    function AplicaOperacaoTamanho(Cds: OleVariant): WordBool; safecall;
    function AplicaOperacaoTermoInventario(Cds: OleVariant): WordBool;
      safecall;
    function ExcluirTipoAgregado(Cds, CdsContab: OleVariant): WordBool;
      safecall;
    function GravarTipoAgregado(Cds, CdsContab: OleVariant): WordBool;
      safecall;
    function AplicaOperacaoTipoPerda(Cds: OleVariant): WordBool; safecall;
    function GravarUnCusteio(Cds: OleVariant): WordBool; safecall;
    function ExcluirUnCusteio(Cds: OleVariant): WordBool; safecall;
    function AplicaOperacaoCor(Cds: OleVariant): WordBool; safecall;
    function AplicaOperacaoUnMedida(Cds: OleVariant): WordBool; safecall;  function IDtmAlmoxComprasSrvr50.ExcluirRecebMerc = IDtmAlmoxComprasSrvr50_ExcluirRecebMerc;
    function IDtmAlmoxComprasSrvr50_ExcluirRecebMerc(
      IdNFRecebDevol: Double): WordBool; safecall;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TDtmAlmoxComprasSrvr50.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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

function TDtmAlmoxComprasSrvr50.MessageInfo: WideString;
begin
  Result := _MessageInfo;
end;

function TDtmAlmoxComprasSrvr50.ConectaDB(const UserName, PassWord,
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

function TDtmAlmoxComprasSrvr50.GravaLogOperacoes(dIdPessoa, dIdModulo,
  dIdUsuario: Double; const sDescOperacao: WideString): WordBool;
begin
    Result := _PadroesSrvr.GravaLogOperacoes(dIdPessoa, dIdModulo,
            dIdUsuario, sDescOperacao);
end;

function TDtmAlmoxComprasSrvr50.GetDataPacket(
  const sSql: WideString): OleVariant;
begin
    Result := _PadroesSrvr.GetDataPacket(sSql);
end;

function TDtmAlmoxComprasSrvr50.ProcessaPessoaAgencia(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc: OleVariant): WordBool;
begin
  Result := _PadroesSrvr.ProcessaPessoaAgencia(Operacao,
            CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
            CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
            CdsImagensPessoa, CdsImagensDoc)
end;

function TDtmAlmoxComprasSrvr50.ProcessaPessoaBanco(Operacao: Integer;
  CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
  CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
  CdsImagensPessoa, CdsImagensDoc: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.ProcessaPessoaBanco(Operacao,
              CdsPessoa, CdsPessoaFisica, CdsDocPessoa, CdsSubTipo, CdsEndPess,
              CdsTelEndPess, CdsContatoPess, CdsTelContato, CdsContaBancaria,
              CdsImagensPessoa, CdsImagensDoc);
end;

function TDtmAlmoxComprasSrvr50.ProcessaPessoaCliente(Operacao: Integer;
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

function TDtmAlmoxComprasSrvr50.ProcessaPessoaForne(Operacao: Integer;
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

function TDtmAlmoxComprasSrvr50.ExecSqlAndCommit(
  const sSql: WideString): WordBool;
begin
    Result := _PadroesSrvr.ExecSqlAndCommit(sSql);
end;

function TDtmAlmoxComprasSrvr50.ProcessaMensagem(CdsMensagem: OleVariant;
  iOperacaoMensage, IdMensagem: Integer): WordBool;
begin
    Result := _PadroesSrvr.ProcessaMensagem(CdsMensagem, iOperacaoMensage, IdMensagem);
end;

function TDtmAlmoxComprasSrvr50.GravaHistSenha(
  aCdsHistSenha: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.GravaHistSenha(aCdsHistSenha);
end;

function TDtmAlmoxComprasSrvr50.GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa,
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

function TDtmAlmoxComprasSrvr50.SelDadosCli(rIdEmpresa, rIdForcli: Double;
  out ovSubTipo, ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
  ovImAgregCli, ovTipos, ovTiposCli: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.SelDadosCli(rIdEmpresa, rIdForcli, ovSubTipo,
              ovEmpresaCliente, ovTipoReceb, ovTipoRecebCli, ovImAgreg,
              ovImAgregCli, ovTipos, ovTiposCli);
end;

function TDtmAlmoxComprasSrvr50.SelDadosForne(rIdEmpresa, rIdForCli: Double;
  out ovSubTipo, ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
  ovTipoDesembForn, ovImAgregForn, ovRamoXForne: OleVariant): WordBool;
begin
    Result := _PadroesSrvr.SelDadosForne(rIdEmpresa, rIdForCli,
             ovSubTipo, ovEmpresaForne, ovTipoDesemb, ovImAgreg, ovRamoForne,
             ovTipoDesembForn, ovImAgregForn, ovRamoXForne);
end;

function TDtmAlmoxComprasSrvr50.GetDataPacketTS(lSQL: OleVariant): OleVariant;
begin
    Result := _PadroesSrvr.GetDataPacketTS(lSQL);
end;

function TDtmAlmoxComprasSrvr50.GetContentFile(
  const sFileName: WideString): WideString;
begin
    Result := _PadroesSrvr.GetContentFile(sFileName);
end;

procedure TDtmAlmoxComprasSrvr50.MensagemPadroes(sMens: string);
begin
    _MessageInfo := sMens;
end;

procedure TDtmAlmoxComprasSrvr50.RemoteDataModuleDestroy(Sender: TObject);
begin
  If DbAlmoxCompras.Connected Then
     DbAlmoxCompras.CLose;

  If SsnAlmoxCompras.Active Then
     SsnAlmoxCompras.Close;

  If DirectoryExists(_TempDir) Then DelTree(_TempDir);

  _PadroesSrvr.Free;
  _ProcessoCompra.Free;
  _AlmoxCompra.Free;
  _AlteraCustoMed.Free;
  _Artigo.Free;
  _ArtxForn.Free;
  _AtualizaMovimento.Free;
  _BaixaPerda.Free;
  _Comprador.Free;
  _ContratoProd.Free;
  _Cotacao.Free;
  _DataRepresa.Free;
  _GrupoProd.Free;
  _ImplantaSaldo.Free;
  _IntegracaoContabil.Free;
  _Inventario.Free;
  _Localizacao.Free;
  _MudaUnid.Free;
  _NotaFiscal.Free;
  _OrdemCompra.Free;
  _PremiGestEstoque.Free;
  _Almox.Free;
  _ProdCasa.Free;
  _RecebMerc.Free;              
  _ReqManual.Free;              
  _ReqMat.Free;                 
  _SCPrePronta.Free;            
  _SoliCompra.Free;             
  _Tamanho.Free;                
  _TermoInventario.Free;        
  _TipoAgregado.Free;           
  _TipoPerda.Free;              
  _Cor.Free;                    
  _UnCusteio.Free;              
  _UnMedida.Free;                
end;

procedure TDtmAlmoxComprasSrvr50.RemoteDataModuleCreate(Sender: TObject);
begin

  _TempDir := GeraDataBaseName(self,DbAlmoxCompras, True, SsnAlmoxCompras);

  _PadroesSrvr := TCtrlPadroesSrvr.Create;
  _PadroesSrvr.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _ProcessoCompra := TCtrlProcessoCompra.Create;
  _ProcessoCompra.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _AlmoxCompra := TCtrlAlmoxCompra.Create;
  _AlmoxCompra.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _AlteraCustoMed := TCtrlAlteraCustoMed.Create;
  _AlteraCustoMed.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _Artigo := TCtrlArtigo.Create;
  _Artigo.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _ArtxForn := TCtrlArtxForn.Create;
  _ArtxForn.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _AtualizaMovimento := TCtrlAtualizaMovimento.Create;
  _AtualizaMovimento.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _BaixaPerda := TCtrlBaixaPerda.Create;
  _BaixaPerda.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _Comprador := TCtrlComprador.Create;
  _Comprador.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _ContratoProd := TCtrlContratoProd.Create;
  _ContratoProd.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _Cotacao := TCtrlCotacao.Create;
  _Cotacao.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _DataRepresa := TCtrlDataRepresa.Create;
  _DataRepresa.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _GrupoProd := TCtrlGrupoProd.Create;
  _GrupoProd.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _ImplantaSaldo := TCtrlImplantaSaldo.Create;
  _ImplantaSaldo.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _IntegracaoContabil := TCtrlIntegracaoContabil.Create;
  _IntegracaoContabil.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _Inventario := TCtrlInventario.Create;
  _Inventario.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _Localizacao := TCtrlLocalizacao.Create;
  _Localizacao.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _MudaUnid := TCtrlMudaUnid.Create;
  _MudaUnid.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _NotaFiscal := TCtrlNotaFiscal.Create;
  _NotaFiscal.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _OrdemCompra := TCtrlOrdemCompra.Create;
  _OrdemCompra.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _PremiGestEstoque := TCtrlPremiGestEstoque.Create;
  _PremiGestEstoque.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _Almox := TCtrlAlmox.Create;
  _Almox.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _ProdCasa := TCtrlProdCasa.Create;
  _ProdCasa.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _RecebMerc := TCtrlRecebMerc.Create;
  _RecebMerc.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _ReqManual := TCtrlReqManual.Create;
  _ReqManual.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _ReqMat := TCtrlReqMat.Create;
  _ReqMat.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _SCPrePronta := TCtrlSCPrePronta.Create;
  _SCPrePronta.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _SoliCompra := TCtrlSoliCompra.Create;
  _SoliCompra.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _Tamanho := TCtrlTamanho.Create;
  _Tamanho.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _TermoInventario := TCtrlTermoInventario.Create;
  _TermoInventario.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _TipoAgregado := TCtrlTipoAgregado.Create;
  _TipoAgregado.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _TipoPerda := TCtrlTipoPerda.Create;
  _TipoPerda.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _Cor  := TCtrlCor.Create;
  _Cor.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _UnCusteio := TCtrlUnCusteio.Create;
  _UnCusteio.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);

  _UnMedida  := TCtrlUnMedida.Create;
  _UnMedida.Initialize(DbAlmoxCompras, True, cntBde, CnsServer, nil, false, MensagemPadroes, nil, True);
end;

function TDtmAlmoxComprasSrvr50.ExcluirProcessoCompra(CdsProcecsso,
  CdsItemSoli: OleVariant): WordBool;
begin
   Try
      _ProcessoCompra.cdsItemSoli.Data := CdsItemSoli;
      _ProcessoCompra.cdsProcesso.Data := CdsProcecsso;

      Result := _ProcessoCompra.Excluir;
      If Not Result  Then _MessageInfo := _ProcessoCompra.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.GravarProcessoCompra(CdsProcesso, CdsItemSoli,
  CdsCotacao, CdsNovoForn: OleVariant): WordBool;
begin
   Try
      _ProcessoCompra.cdsProcesso.Data := CdsProcesso;
      _ProcessoCompra.cdsItemSoli.Data := CdsItemSoli;
      _ProcessoCompra.cdsCotacao.Data  := CdsCotacao;
      _ProcessoCompra.cdsNovoForn.Data := CdsNovoForn;

      Result := _ProcessoCompra.Gravar;
      If Not Result  Then _MessageInfo := _ProcessoCompra.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.GravaParalmox(Cds,
  CdsParamRel: OleVariant): WordBool;
begin
   Try
      _AlmoxCompra.Cds.Data := Cds;
      _AlmoxCompra.CdsParamRel.Data := CdsParamRel;

      Result := _AlmoxCompra.GravaParalmox;
      If Not Result  Then _MessageInfo := _AlmoxCompra.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.GravaParamCompras(Cds: OleVariant): WordBool;
begin
   Try
      _AlmoxCompra.Cds.Data := Cds;

      Result := _AlmoxCompra.GravaParamCompras;
      If Not Result  Then _MessageInfo := _AlmoxCompra.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.PreparaAssinatura(IdPessoa,
  IdModulo: Double): Word;
begin
   Try
      _AlmoxCompra.PreparaAssinatura(IdPessoa, IdModulo);
      _MessageInfo := _AlmoxCompra.MessageInfo;

   Except
      On E:Exception Do
      Begin
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.AlteraCusto(IdPessoa: Integer; Valor: Double;
  CodCusteio, CodAlmoxOrigem: Integer; const CodArtigo,
  CodMedida: WideString; Data: TDateTime; const NumDocumento,
  CentroCusto: WideString; UnidNegoc: Integer): WordBool;
begin
   Try
      Result := _AlteraCustoMed.AlteraCusto(IdPessoa,Valor,CodCusteio,CodAlmoxOrigem,CodArtigo,CodMedida,
                                            Data,NumDocumento,CentroCusto,UnidNegoc);

      If Not Result Then _MessageInfo := _AlteraCustoMed.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.GravarArtigo(Tipo: Integer; CdsArtigo,
  CdsArtxContaxCC, CdsConver, CdsImpostos, CdsProdutos,
  CdsCorTamanho: OleVariant): WordBool;
begin
   Try
      _Artigo.cdsArtigo.Data       := CdsArtigo;
      _Artigo.cdsArtxContaxCC.Data := CdsArtxContaxCC;
      _Artigo.cdsConver.Data       := cdsConver;
      _Artigo.cdsImpostos.Data     := cdsImpostos;
      _Artigo.cdsProduto.Data      := cdsProdutos;
      _Artigo.cdsCorTamanho.Data   := cdsCorTamanho;

      Result := _Artigo.Gravar(TTipoArtigo(Tipo));

      If Not Result Then _MessageInfo := _Artigo.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.ExcluirArtigo(CdsArtigo: OleVariant): WordBool;
begin
   Try
      _Artigo.cdsArtigo.Data := CdsArtigo;

      Result := _Artigo.Excluir;

      If Not Result Then _MessageInfo := _Artigo.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.ExisteMedida(const CodMedida: WideString;
  CdsConver: OleVariant): WordBool;
begin
   Try
      _Artigo.cdsConver.Data := CdsConver;

      Result := _Artigo.ExisteMedida( CodMedida );

      If Not Result Then _MessageInfo := _Artigo.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.AtribuirArtigo(Cds: OleVariant): WordBool;
begin
   Try
      _ArtxForn.Cds.Data := Cds;

      Result := _ArtxForn.AtribuirArtigo;

      If Not Result Then _MessageInfo := _ArtxForn.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.AtualizaMovimento(IdPessoa: Integer;
  const CodArtigo: WideString; Data: TDateTime): WordBool;
begin
   Try
      Result := _AtualizaMovimento.Atualizar( IdPessoa,CodArtigo,Data);
      If Not Result Then _MessageInfo := _AtualizaMovimento.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.RealizaBaixa(IdTipoPerda, IdPessoa: Integer;
  Valor, Qtde: Double; CodCusteio, CodAlmoxOrigem: Integer;
  const CodArtigo, CodMedida: WideString; Data: TDateTime;
  const NumDocumento, CentroCusto: WideString;
  UnidNegoc: Integer): WordBool;
begin
   Try
      Result := _BaixaPerda.RealizaBaixa( IdTipoPerda,IdPessoa,Valor,Qtde,CodCusteio,CodAlmoxOrigem,CodArtigo,CodMedida,
                                          Data,NumDocumento,CentroCusto,UnidNegoc);
                                          
      If Not Result Then _MessageInfo := _BaixaPerda.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.AtribuirGrupos(IdComprador: Double;
  Cds: OleVariant): WordBool;
begin
   Try
      _Comprador.cds.Data := Cds;
      Result := _Comprador.AtribuirGrupos( IdComprador );

      If Not Result Then _MessageInfo := _Comprador.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.GravarContratoProd(
  Cds: OleVariant): WordBool;
begin
   Try
      _ContratoProd.cds.Data := Cds;
      Result := _ContratoProd.Gravar;

      If Not Result Then _MessageInfo := _ContratoProd.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.CalculaSumario(
  CodProcesso: Double): WordBool;
begin
   Try
      Result := _Cotacao.CalculaSumario( CodProcesso );

      If Not Result Then _MessageInfo := _Cotacao.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.GravarCotacao(CdsCotacao, CdsPrazoEntrega,
  CdsPrazoPagto, CdsValorAgreg, CdsValorAgregTela: OleVariant): WordBool;
begin
   Try
      _Cotacao.cdsCotacao.Data        := CdsCotacao;
      _Cotacao.cdsPrazoEntrega.Data   := CdsPrazoEntrega;
      _Cotacao.cdsPrazoPgto.Data      := CdsPrazoPagto;
      _Cotacao.cdsValorAgreg.Data     := CdsValorAgreg;
      _Cotacao.cdsValorAgregTela.Data := CdsValorAgregTela;

      Result := _Cotacao.Gravar;

      If Not Result Then _MessageInfo := _Cotacao.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.GravaStatus(CodProcesso, IdProcxArt,
  Proposta, IdForCli: Double; const Status,
  Justificativa: WideString): WordBool;
begin
   Try
      Result := _Cotacao.GravaStatus(CodProcesso,IdProcxArt,Proposta,IdForCli, Status,Justificativa );

      If Not Result Then _MessageInfo := _Cotacao.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;


end;

function TDtmAlmoxComprasSrvr50.ProcessaSelecao(
  CdsSuamario: OleVariant): WordBool;
begin
   Try
      _Cotacao.cdsSumario.Data := CdsSuamario;

      Result := _Cotacao.ProcessaSelecao;

      If Not Result Then _MessageInfo := _Cotacao.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.ProcessaStatus(
  CodProcesso: Double): WordBool;
begin
   Try
      Result := _Cotacao.ProcessaStatus( CodProcesso );

      If Not Result Then _MessageInfo := _Cotacao.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.ValidaDadosCotacao(CdsCotacao,
  CdsPrazoEntrega, CdsPrazoPgto, CdsValorAgreg: OleVariant): WordBool;
begin
   Try
      _Cotacao.cdsCotacao.Data      := CdsCotacao;
      _Cotacao.cdsPrazoEntrega.Data := CdsPrazoEntrega;
      _Cotacao.cdsPrazoPgto.Data    := CdsPrazoPgto;
      _Cotacao.cdsValorAgreg.Data   := CdsValorAgreg;

      Result := _Cotacao.ValidaDadosCotacao;

      If Not Result Then _MessageInfo := _Cotacao.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.AtualizaDataRepresa(IdPessoa: Integer;
  Data: TDateTime; const Bilhete: WideString): WordBool;
begin
   Try
      Result := _DataRepresa.AtualizaDataRepresa(IdPessoa, Data, Bilhete);

      If Not Result Then _MessageInfo := _DataRepresa.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.AtribuiUsuxGrupo(
  Cds: OleVariant): WordBool;
begin
   Try
      _GrupoProd.cds.Data := Cds;
      Result := _GrupoProd.AtribuiUsuxGrupo;

      If Not Result Then _MessageInfo := _GrupoProd.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.GravaGrupoProd(Cds: OleVariant): WordBool;
begin
   Try
      _GrupoProd.cds.Data := Cds;
      Result := _GrupoProd.Grava;

      If Not Result Then _MessageInfo := _GrupoProd.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.ImplantarSaldo(IdPessoa: Integer; Qtde,
  Valor: Double; CodCusteio, CodAlmoxOrigem: Integer; const CodArtigo,
  CodMedida, CentroCusto: WideString; UnidNegoc: Integer;
  ValUltCompra: Double): WordBool;
begin
   Try
      Result := _ImplantaSaldo.ImplantarSaldo(IdPessoa,Qtde,Valor,
                                              CodCusteio,CodAlmoxOrigem,
                                              CodArtigo,CodMedida,
                                              CentroCusto,UnidNegoc,ValUltCompra );

      If Not Result Then _MessageInfo := _ImplantaSaldo.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.ExcluirItegrarcao(IdPessoa: Integer;
  Data: TDateTime; UsaPlanoPrev: WordBool; IdModulo, IdUsuario: Integer;
  const Bilhete: WideString): WordBool;
begin
   Try
      Result := _IntegracaoContabil.ExcluirItegrarcao(IdPessoa, Data,
                                                      UsaPlanoPrev, IdModulo,
                                                      IdUsuario, Bilhete );

      If Not Result Then _MessageInfo := _IntegracaoContabil.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.IntegrarContab(IdPessoa: Integer; DataIni,
  DataFim: TDateTime; ContabilizaTransf, UsaPlanoPrev: WordBool; IdModulo,
  IdUsuario, IdPatro, IdPlanoPrev: Integer;
  const Bilhete: WideString): WordBool;
begin
   Try
      Result := _IntegracaoContabil.Integrar(IdPessoa, DataIni, DataFim,
                                             ContabilizaTransf,UsaPlanoPrev,
                                             IdModulo, IdUsuario, IdPatro,
                                             IdPlanoPrev, Bilhete );

      If Not Result Then _MessageInfo := _IntegracaoContabil.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.AbreInventario(Cds: OleVariant;
  const CodGrupoProd: WideString): Double;
begin
   Try
      _Inventario.cds.Data := Cds;

      Result := _Inventario.AbreInventario(CodGrupoProd);

      If Result < 0 Then _MessageInfo := _Inventario.MessageInfo;

   Except
      On E:Exception Do
      Begin
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.AtualizaSaldo(IdInventario,
  UnidNegoc: Integer): WordBool;
begin
   Try
      Result := _Inventario.AtualizaSaldo( IdInventario, UnidNegoc );

      If Not Result Then _MessageInfo := _Inventario.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.ExcluirInventario(
  Cds: OleVariant): WordBool;
begin
   Try
      _Inventario.cds.Data := Cds;

      Result := _Inventario.ExcluirInventario;

      If Not Result Then _MessageInfo := _Inventario.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.GeraDiferencas(
  IdInventario: Integer): WordBool;
begin
   Try
      Result := _Inventario.GeraDiferencas(IdInventario);

      If Not Result Then _MessageInfo := _Inventario.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.GravarContagem(
  CdsContagem: OleVariant): WordBool;
begin
   Try
      _Inventario.cdsContagem.Data := CdsContagem;

      Result := _Inventario.GravarContagem;

      If Not Result Then _MessageInfo := _Inventario.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.ImportArqInvent(IdInvetario: Integer;
  Arquivo: OleVariant): WordBool;
Var
   StrArquivo : TStringList;
begin
   StrArquivo := TStringList.Create;
   Try
      Try
         VariantToStringlist(Arquivo,StrArquivo);

         Result := _Inventario.ImportArqInvent( IdInvetario, StrArquivo );

         If Not Result Then _MessageInfo := _Inventario.MessageInfo;

      Except
         On E:Exception Do
         Begin
            Result := False;
            _MessageInfo := E.Message;
         End;
      End;
   Finally
      StrArquivo.Free;
   End;
end;

function TDtmAlmoxComprasSrvr50.GravarLocalizacao(
  Cds: OleVariant): WordBool;
begin
   Try
      _Localizacao.cds.Data := Cds;

      Result := _Localizacao.Gravar;

      If Not Result Then _MessageInfo := _Localizacao.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.ConverterUnidade(const CodArtigo,
  CodProduto, CodUnVelha, CodUnNova, Bilhete: WideString): WordBool;
begin
  Try
      Result := _MudaUnid.ConverterUnidade(CodArtigo, CodProduto, CodUnVelha,
                                           CodUnNova, Bilhete );

      If Not Result Then _MessageInfo := _MudaUnid.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.ExcluirNotaFiscal(CdsNota, CdsItemNota,
  CdsAgregItemNota, CdsAgregNota: OleVariant): WordBool;
begin
  Try
     _NotaFiscal.cdsNota.Data          := CdsNota;
     _NotaFiscal.cdsItemNota.Data      := CdsItemNota;
     _NotaFiscal.cdsAgregItemNota.Data := CdsAgregItemNota;
     _NotaFiscal.cdsAgregNota.Data     := CdsAgregNota;

     Result := _NotaFiscal.Excluir;

     If Not Result Then _MessageInfo := _NotaFiscal.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.GravarNotaFiscal(CdsNota, CdsItemNota,
  CdsAgregItemNota, CdsAgregNota: OleVariant): WordBool;
begin
  Try
     _NotaFiscal.cdsNota.Data          := CdsNota;
     _NotaFiscal.cdsItemNota.Data      := CdsItemNota;
     _NotaFiscal.cdsAgregItemNota.Data := CdsAgregItemNota;
     _NotaFiscal.cdsAgregNota.Data     := CdsAgregNota;

     Result := _NotaFiscal.Gravar;

     If Not Result Then _MessageInfo := _NotaFiscal.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.ExcluirOrdemCompra(CdsOC, CdsItemOC,
  CdsPrazoPgtoOC, CdsPrazoEntregaOC, CdsSCIItemOC, CdsAgregItemOC,
  CdsAgregTotOC: OleVariant): WordBool;
begin
   Try
      _OrdemCompra.cdsOC.Data             := CdsOC;
      _OrdemCompra.cdsItemOC.Data         := CdsItemOC;
      _OrdemCompra.cdsPrazoPgtoOC.Data    := CdsPrazoPgtoOC;
      _OrdemCompra.cdsPrazoEntregaOC.Data := CdsPrazoEntregaOC;
      _OrdemCompra.cdsSCItemOC.Data       := CdsSCIItemOC;
      _OrdemCompra.cdsAgregItemOC.Data    := CdsAgregItemOC;
      _OrdemCompra.cdsAgregTotOC.Data     := CdsAgregTotOC;

      Result := _OrdemCompra.Gravar;

      If Not Result Then _MessageInfo := _OrdemCompra.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.CancelaItemOC(IdItemOC: Double;
  temCotacao: WordBool; CodProcesso: Double): WordBool;
begin
   Try
      Result := _OrdemCompra.CancelaItemOC(IdItemOC , TemCotacao, CodProcesso );

      If Not Result Then _MessageInfo := _OrdemCompra.MessageInfo;
   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.CancelaOC(NumOC: Double): WordBool;
begin
   Try
      Result := _OrdemCompra.CancelaOC( NumOC );

      If Not Result Then _MessageInfo := _OrdemCompra.MessageInfo;
   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.GravarPremiGestEstoque(
  Cds: OleVariant): WordBool;
begin
   Try
      _PremiGestEstoque.cds.Data := Cds;

      Result := _PremiGestEstoque.Gravar;

      If Not Result Then _MessageInfo := _PremiGestEstoque.MessageInfo;
   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.GravarAlmox(
  CdsAlmox: OleVariant): WordBool;
begin
   Try
      _Almox.cdsAlmox.Data := CdsAlmox;

      Result := _Almox.Gravar;

      If Not Result Then _MessageInfo := _Almox.MessageInfo;
   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.ExcluirAlmox(
  CdsAlmox: OleVariant): WordBool;
begin
   Try
      _Almox.cdsAlmox.Data := CdsAlmox;

      Result := _Almox.Excluir;

      If Not Result Then _MessageInfo := _Almox.MessageInfo;
   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.AssociaAlmoxTransf(
  CdsAlmox: OleVariant): WordBool;
begin
   Try
      _Almox.cdsAlmox.Data := CdsAlmox;

      Result := _Almox.AssociaAlmoxTransf;

      If Not Result Then _MessageInfo := _Almox.MessageInfo;
   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.AtribuirAlmoxarifado(
  Cds: OleVariant): WordBool;
begin
   Try
      _Almox.cdsAlmox.Data := Cds;

      Result := _Almox.AtribuirAlmoxarifado;

      If Not Result Then _MessageInfo := _Almox.MessageInfo;
   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.BaixaProdCasa(TipoBaixa, IdPessoa: Integer;
  Valor, Qtde: Double; CodAlmoxOrigem: Integer; const CodArtigo,
  CodMedida: WideString; Data: TDateTime; const NumDocumento: WideString;
  UnidNegoc, CodAlmoxTransf: Integer; const CodArtigoElab,
  CodMedidaElab: WideString): WordBool;
begin
   Try
      Result := _ProdCasa.BaixaProdCasa( TTipoProdCasa(TipoBaixa),IdPessoa,Valor,
                                         Qtde,CodAlmoxOrigem,CodArtigo,CodMedida,
                                         Data,NumDocumento,UnidNegoc,CodAlmoxTransf,
                                         CodArtigoElab,CodMedidaElab );

      If Not Result Then _MessageInfo := _ProdCasa.MessageInfo;
   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.ExcluirRecebMerc( IdNFRecebDevol : Double ): WordBool;
begin
   Try
     Result := _RecebMerc.Excluir( IdNFRecebDevol ) ;

     If Not Result Then _MessageInfo := _RecebMerc.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.GravarRecebMerc(IdPessoa: Integer;
  UsaPlanoPrev, IntegraCAP, IntegraContab: WordBool; IdModulo, IdUsuario,
  IdPatro, IdPlanoPrev: Double; ERecebimentoComOC: WordBool; CdsNota,
  CdsItemNota, CdsAgregItemNota, CdsAgregNota: OleVariant): WordBool;
begin
   Try
     _RecebMerc.cdsNota.Data          := CdsNota;
     _RecebMerc.cdsItemNota.Data      := CdsItemNota;
     _RecebMerc.cdsAgregItemNota.Data := CdsAgregItemNota;
     _RecebMerc.cdsAgregNota.Data     := CdsAgregNota;

     Result := _RecebMerc.Gravar(IdPessoa, UsaPlanoPrev,IntegraCAP,IntegraContab,
                                 IdModulo,IdUsuario,IdPatro, IdPlanoPrev,
                                 ERecebimentoComOC);

     If Not Result Then _MessageInfo := _RecebMerc.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.BaixarMaterial(TipoBaixa,
  IdPessoa: Integer; Cds, CdsItem: OleVariant): WordBool;
begin
   Try
     _ReqManual.cds.Data     := Cds;
     _ReqManual.cdsItem.Data := CdsItem;

     Result := _ReqManual.BaixarMaterial(TTipoBaixa(TipoBaixa),IdPessoa );

     If Not Result Then _MessageInfo := _ReqManual.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.GravarReqMat(Valor: Double;
  const Grupo: WideString; Cds, CdsItem: OleVariant): WordBool;
begin
   Try
     _ReqMat.cds.Data     := Cds;
     _ReqMat.cdsItem.Data := CdsItem;

     Result := _ReqMat.Gravar( Valor, Grupo );

     If Not Result Then _MessageInfo := _ReqMat.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.AtenderReqCad(IdPessoa: Integer;
  QtdeAtendida: Double; DataAtendimento: TDateTime; IdAtendente: Double;
  DeixaRestoPendente: WordBool; CdsItem: OleVariant): WordBool;
begin
   Try
     _ReqMat.cdsItem.Data := CdsItem;

     Result := _ReqMat.AtenderReqCad( IdPessoa,QtdeAtendida ,DataAtendimento,
                                      IdAtendente,DeixaRestoPendente );

     If Not Result Then _MessageInfo := _ReqMat.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.EstornarReqCad(
  CdsItem: OleVariant): WordBool;
begin
   Try
     _ReqMat.cdsItem.Data := CdsItem;

     Result := _ReqMat.EstornarReqCad;

     If Not Result Then _MessageInfo := _ReqMat.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.ConfirmaAtendimento(IdItemEntrega,
  IdUsuario: Double; Data: TDateTime; CdsItem: OleVariant): WordBool;
begin
   Try
     _ReqMat.cdsItem.Data := CdsItem;

     Result := _ReqMat.ConfirmaAtendimento( IdItemEntrega, IdUsuario, Data );

     If Not Result Then _MessageInfo := _ReqMat.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.DevolveAtendimento(IdPessoa: Integer;
  IdUsuario: Double; Data: TDateTime; CdsItem: OleVariant): WordBool;
begin
   Try
     _ReqMat.cdsItem.Data := CdsItem;

     Result := _ReqMat.DevolveAtendimento(IdPessoa, IdUsuario, Data );

     If Not Result Then _MessageInfo := _ReqMat.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.ExcluirSCPrePronta(Cds,
  CdsItem: OleVariant): WordBool;
begin
   Try
     _SCPrePronta.cds.Data     := Cds;
     _SCPrePronta.cdsItem.Data := CdsItem;

     Result := _SCPrePronta.Excluir;

     If Not Result Then _MessageInfo := _SCPrePronta.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.GravarSCPrePronta(Cds,
  CdsItem: OleVariant): WordBool;
begin
   Try
     _SCPrePronta.cds.Data     := Cds;
     _SCPrePronta.cdsItem.Data := CdsItem;

     Result := _SCPrePronta.Gravar;

     If Not Result Then _MessageInfo := _SCPrePronta.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.AtribuirComprador(Operacao: Integer;
  IdItemSoli, IdComprador: Double): WordBool;
begin
   Try
     Result := _SoliCompra.AtribuirComprador(TipoOperacao(Operacao),IdItemSoli,IdComprador);

     If Not Result Then _MessageInfo := _SoliCompra.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.GravarSoliCompra(Valor: Double;
  const Grupo: WideString; Cds, CdsItem: OleVariant): WordBool;
begin
   Try
     _SoliCompra.cds.Data     := Cds;
     _SoliCompra.cdsItem.Data := CdsItem;

     Result := _SoliCompra.Gravar( Valor, Grupo);

     If Not Result Then _MessageInfo := _SoliCompra.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.ExcluirSoliCompra(Cds,
  CdsItem: OleVariant): WordBool;
begin
   Try
     _SoliCompra.cds.Data     := Cds;
     _SoliCompra.cdsItem.Data := CdsItem;

     Result := _SoliCompra.Excluir;

     If Not Result Then _MessageInfo := _SoliCompra.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.AplicaOperacaoTamanho(
  Cds: OleVariant): WordBool;
begin
   Try
     _Tamanho.cds.Data     := Cds;

     Result := _Tamanho.AplicaOperacao;

     If Not Result Then _MessageInfo := _Tamanho.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.AplicaOperacaoTermoInventario(
  Cds: OleVariant): WordBool;
begin
   Try
     _TermoInventario.Cds.Data := Cds;

     Result := _TermoInventario.AplicaOperacao;

     If Not Result Then _MessageInfo := _TermoInventario.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.ExcluirTipoAgregado(Cds,
  CdsContab: OleVariant): WordBool;
begin
   Try
     _TipoAgregado.cds.Data       := Cds;
     _TipoAgregado.cdsContab.Data := CdsContab;

     Result := _TipoAgregado.Excluir;

     If Not Result Then _MessageInfo := _TipoAgregado.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.GravarTipoAgregado(Cds,
  CdsContab: OleVariant): WordBool;
begin
   Try
     _TipoAgregado.cds.Data       := Cds;
     _TipoAgregado.cdsContab.Data := CdsContab;

     Result := _TipoAgregado.Gravar;

     If Not Result Then _MessageInfo := _TipoAgregado.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;


function TDtmAlmoxComprasSrvr50.AplicaOperacaoTipoPerda(
  Cds: OleVariant): WordBool;
begin
   Try
     _TipoPerda.cds.Data := Cds;

     Result := _TipoPerda.AplicaOperacao;

     If Not Result Then _MessageInfo := _TipoPerda.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.GravarUnCusteio(Cds: OleVariant): WordBool;
begin
   Try
     _UnCusteio.cds.Data := Cds;

     Result := _UnCusteio.Gravar;

     If Not Result Then _MessageInfo := _UnCusteio.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.ExcluirUnCusteio(
  Cds: OleVariant): WordBool;
begin
   Try
     _UnCusteio.cds.Data := Cds;

     Result := _UnCusteio.Excluir;

     If Not Result Then _MessageInfo := _UnCusteio.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.AplicaOperacaoCor(
  Cds: OleVariant): WordBool;
begin
   Try
     _Cor.cds.Data := Cds;

     Result := _Cor.AplicaOperacao;

     If Not Result Then _MessageInfo := _Cor.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;
end;

function TDtmAlmoxComprasSrvr50.AplicaOperacaoUnMedida(
  Cds: OleVariant): WordBool;
begin
   Try  
     _UnMedida.cds.Data := Cds;

     Result := _UnMedida.AplicaOperacao;

     If Not Result Then _MessageInfo := _UnMedida.MessageInfo;

   Except
      On E:Exception Do
      Begin
         Result := False;
         _MessageInfo := E.Message;
      End;
   End;

end;

function TDtmAlmoxComprasSrvr50.IDtmAlmoxComprasSrvr50_ExcluirRecebMerc(
  IdNFRecebDevol: Double): WordBool;
begin

end;

initialization
  TComponentFactory.Create(ComServer, TDtmAlmoxComprasSrvr50,
    Class_DtmAlmoxComprasSrvr50, ciMultiInstance, tmApartment);
end.


