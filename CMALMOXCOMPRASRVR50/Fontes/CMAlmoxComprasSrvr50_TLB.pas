unit CMAlmoxComprasSrvr50_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : $Revision:   1.88.1.0.1.0  $
// File generated on 16/10/2002 17:58:40 from Type Library described below.

// ************************************************************************ //
// Type Lib: C:\ProjetosCM5\CMAlmoxCompraSrvr50\Fontes\CMAlmoxComprasSrvr50.tlb (1)
// IID\LCID: {1C01305F-9895-45F6-8C47-2B7FBCD4D8AE}\0
// Helpfile: 
// DepndLst: 
//   (1) v1.0 Midas, (C:\WINNT\System32\midas.dll)
//   (2) v2.0 stdole, (C:\WINNT\System32\stdole2.tlb)
//   (3) v4.0 StdVCL, (C:\WINNT\System32\STDVCL40.DLL)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL, 
  MIDAS;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  CMAlmoxComprasSrvr50MajorVersion = 1;
  CMAlmoxComprasSrvr50MinorVersion = 0;

  LIBID_CMAlmoxComprasSrvr50: TGUID = '{1C01305F-9895-45F6-8C47-2B7FBCD4D8AE}';

  IID_IDtmAlmoxComprasSrvr50: TGUID = '{779E331F-6BAB-4539-8837-6D4AD74AEE82}';
  CLASS_DtmAlmoxComprasSrvr50: TGUID = '{B7E030EA-0133-4011-96BB-AB10B7C2E4EE}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IDtmAlmoxComprasSrvr50 = interface;
  IDtmAlmoxComprasSrvr50Disp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  DtmAlmoxComprasSrvr50 = IDtmAlmoxComprasSrvr50;


// *********************************************************************//
// Interface: IDtmAlmoxComprasSrvr50
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {779E331F-6BAB-4539-8837-6D4AD74AEE82}
// *********************************************************************//
  IDtmAlmoxComprasSrvr50 = interface(IAppServer)
    ['{779E331F-6BAB-4539-8837-6D4AD74AEE82}']
    function  ConectaDB(const UserName: WideString; const PassWord: WideString; 
                        const ServerName: WideString): WordBool; safecall;
    function  MessageInfo: WideString; safecall;
    function  GravaLogOperacoes(dIdPessoa: Double; dIdModulo: Double; dIdUsuario: Double; 
                                const sDescOperacao: WideString): WordBool; safecall;
    function  GetDataPacket(const sSql: WideString): OleVariant; safecall;
    function  ProcessaPessoaForne(Operacao: Integer; CdsPessoa: OleVariant; 
                                  CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                  CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                  CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                  CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                  CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant; 
                                  CdsImAgregForn: OleVariant; CdsEmpresaForn: OleVariant; 
                                  CdsFornXDesemb: OleVariant; CdsFornXRamo: OleVariant): WordBool; safecall;
    function  ProcessaPessoaCliente(Operacao: Integer; CdsPessoa: OleVariant; 
                                    CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                    CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                    CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                    CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                    CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant; 
                                    CdsEmpresaCliente: OleVariant; CdsTipoRecebCli: OleVariant; 
                                    CdsImAgregCli: OleVariant; CdsTiposCli: OleVariant): WordBool; safecall;
    function  ProcessaPessoaAgencia(Operacao: Integer; CdsPessoa: OleVariant; 
                                    CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                    CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                    CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                    CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                    CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant): WordBool; safecall;
    function  ProcessaPessoaBanco(Operacao: Integer; CdsPessoa: OleVariant; 
                                  CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                  CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                  CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                  CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                  CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant): WordBool; safecall;
    function  ExecSqlAndCommit(const sSql: WideString): WordBool; safecall;
    function  ProcessaMensagem(CdsMensagem: OleVariant; iOperacaoMensage: Integer; 
                               IdMensagem: Integer): WordBool; safecall;
    function  GravaHistSenha(aCdsHistSenha: OleVariant): WordBool; safecall;
    function  GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa: Integer; TipoPessoa: Integer; 
                             var ovPessoa: OleVariant; var ovPessoaFisica: OleVariant; 
                             var ovDocPessoa: OleVariant; var ovEndPess: OleVariant; 
                             var ovTelEndPess: OleVariant; var ovContatoPess: OleVariant; 
                             var ovTelContato: OleVariant; var ovContaBancaria: OleVariant; 
                             var ovImagensPessoa: OleVariant; var ovImagensDoc: OleVariant; 
                             var ovEstado: OleVariant; var ovNaturalidade: OleVariant; 
                             var ovBanco: OleVariant; var ovDocumento: OleVariant; 
                             var ovTipoDoc: OleVariant): WordBool; safecall;
    function  SelDadosCli(rIdEmpresa: Double; rIdForcli: Double; out ovSubTipo: OleVariant; 
                          out ovEmpresaCliente: OleVariant; out ovTipoReceb: OleVariant; 
                          out ovTipoRecebCli: OleVariant; out ovImAgreg: OleVariant; 
                          out ovImAgregCli: OleVariant; out ovTipos: OleVariant; 
                          out ovTiposCli: OleVariant): WordBool; safecall;
    function  SelDadosForne(rIdEmpresa: Double; rIdForcli: Double; out ovSubTipo: OleVariant; 
                            out ovEmpresaForne: OleVariant; out ovTipoDesemb: OleVariant; 
                            out ovImAgreg: OleVariant; out ovRamoForne: OleVariant; 
                            out ovTipoDesembForn: OleVariant; out ovImAgregForn: OleVariant; 
                            out ovRamoXForne: OleVariant): WordBool; safecall;
    function  GetDataPacketTS(lSQL: OleVariant): OleVariant; safecall;
    function  GetContentFile(const sFileName: WideString): WideString; safecall;
    function  ExcluirProcessoCompra(CdsProcecsso: OleVariant; CdsItemSoli: OleVariant): WordBool; safecall;
    function  GravarProcessoCompra(CdsProcesso: OleVariant; CdsItemSoli: OleVariant; 
                                   CdsCotacao: OleVariant; CdsNovoForn: OleVariant): WordBool; safecall;
    function  GravaParalmox(Cds: OleVariant; CdsParamRel: OleVariant): WordBool; safecall;
    function  GravaParamCompras(Cds: OleVariant): WordBool; safecall;
    function  PreparaAssinatura(IdPessoa: Double; IdModulo: Double): Word; safecall;
    function  AlteraCusto(IdPessoa: Integer; Valor: Double; CodCusteio: Integer; 
                          CodAlmoxOrigem: Integer; const CodArtigo: WideString; 
                          const CodMedida: WideString; Data: TDateTime; 
                          const NumDocumento: WideString; const CentroCusto: WideString; 
                          UnidNegoc: Integer): WordBool; safecall;
    function  GravarArtigo(Tipo: Integer; CdsArtigo: OleVariant; CdsArtxContaxCC: OleVariant; 
                           CdsConver: OleVariant; CdsImpostos: OleVariant; CdsProdutos: OleVariant; 
                           CdsCorTamanho: OleVariant): WordBool; safecall;
    function  ExcluirArtigo(CdsArtigo: OleVariant): WordBool; safecall;
    function  ExisteMedida(const CodMedida: WideString; CdsConver: OleVariant): WordBool; safecall;
    function  AtribuirArtigo(Cds: OleVariant): WordBool; safecall;
    function  AtualizaMovimento(IdPessoa: Integer; const CodArtigo: WideString; Data: TDateTime): WordBool; safecall;
    function  RealizaBaixa(IdTipoPerda: Integer; IdPessoa: Integer; Valor: Double; Qtde: Double; 
                           CodCusteio: Integer; CodAlmoxOrigem: Integer; 
                           const CodArtigo: WideString; const CodMedida: WideString; 
                           Data: TDateTime; const NumDocumento: WideString; 
                           const CentroCusto: WideString; UnidNegoc: Integer): WordBool; safecall;
    function  AtribuirGrupos(IdComprador: Double; Cds: OleVariant): WordBool; safecall;
    function  GravarContratoProd(Cds: OleVariant): WordBool; safecall;
    function  CalculaSumario(CodProcesso: Double): WordBool; safecall;
    function  GravarCotacao(CdsCotacao: OleVariant; CdsPrazoEntrega: OleVariant; 
                            CdsPrazoPagto: OleVariant; CdsValorAgreg: OleVariant; 
                            CdsValorAgregTela: OleVariant): WordBool; safecall;
    function  GravaStatus(CodProcesso: Double; IdProcxArt: Double; Proposta: Double; 
                          IdForCli: Double; const Status: WideString; 
                          const Justificativa: WideString): WordBool; safecall;
    function  ProcessaSelecao(CdsSuamario: OleVariant): WordBool; safecall;
    function  ProcessaStatus(CodProcesso: Double): WordBool; safecall;
    function  ValidaDadosCotacao(CdsCotacao: OleVariant; CdsPrazoEntrega: OleVariant; 
                                 CdsPrazoPgto: OleVariant; CdsValorAgreg: OleVariant): WordBool; safecall;
    function  AtualizaDataRepresa(IdPessoa: Integer; Data: TDateTime; const Bilhete: WideString): WordBool; safecall;
    function  AtribuiUsuxGrupo(Cds: OleVariant): WordBool; safecall;
    function  GravaGrupoProd(Cds: OleVariant): WordBool; safecall;
    function  ImplantarSaldo(IdPessoa: Integer; Qtde: Double; Valor: Double; CodCusteio: Integer; 
                             CodAlmoxOrigem: Integer; const CodArtigo: WideString; 
                             const CodMedida: WideString; const CentroCusto: WideString; 
                             UnidNegoc: Integer; ValUltCompra: Double): WordBool; safecall;
    function  ExcluirItegrarcao(IdPessoa: Integer; Data: TDateTime; UsaPlanoPrev: WordBool; 
                                IdModulo: Integer; IdUsuario: Integer; const Bilhete: WideString): WordBool; safecall;
    function  IntegrarContab(IdPessoa: Integer; DataIni: TDateTime; DataFim: TDateTime; 
                             ContabilizaTransf: WordBool; UsaPlanoPrev: WordBool; 
                             IdModulo: Integer; IdUsuario: Integer; IdPatro: Integer; 
                             IdPlanoPrev: Integer; const Bilhete: WideString): WordBool; safecall;
    function  AbreInventario(Cds: OleVariant; const CodGrupoProd: WideString): Double; safecall;
    function  AtualizaSaldo(IdInventario: Integer; UnidNegoc: Integer): WordBool; safecall;
    function  ExcluirInventario(Cds: OleVariant): WordBool; safecall;
    function  GeraDiferencas(IdInventario: Integer): WordBool; safecall;
    function  GravarContagem(CdsContagem: OleVariant): WordBool; safecall;
    function  ImportArqInvent(IdInvetario: Integer; Arquivo: OleVariant): WordBool; safecall;
    function  GravarLocalizacao(Cds: OleVariant): WordBool; safecall;
    function  ConverterUnidade(const CodArtigo: WideString; const CodProduto: WideString; 
                               const CodUnVelha: WideString; const CodUnNova: WideString; 
                               const Bilhete: WideString): WordBool; safecall;
    function  ExcluirNotaFiscal(CdsNota: OleVariant; CdsItemNota: OleVariant; 
                                CdsAgregItemNota: OleVariant; CdsAgregNota: OleVariant): WordBool; safecall;
    function  GravarNotaFiscal(CdsNota: OleVariant; CdsItemNota: OleVariant; 
                               CdsAgregItemNota: OleVariant; CdsAgregNota: OleVariant): WordBool; safecall;
    function  ExcluirOrdemCompra(CdsOC: OleVariant; CdsItemOC: OleVariant; 
                                 CdsPrazoPgtoOC: OleVariant; CdsPrazoEntregaOC: OleVariant; 
                                 CdsSCIItemOC: OleVariant; CdsAgregItemOC: OleVariant; 
                                 CdsAgregTotOC: OleVariant): WordBool; safecall;
    function  CancelaItemOC(IdItemOC: Double; temCotacao: WordBool; CodProcesso: Double): WordBool; safecall;
    function  CancelaOC(NumOC: Double): WordBool; safecall;
    function  GravarPremiGestEstoque(Cds: OleVariant): WordBool; safecall;
    function  GravarAlmox(CdsAlmox: OleVariant): WordBool; safecall;
    function  ExcluirAlmox(CdsAlmox: OleVariant): WordBool; safecall;
    function  AssociaAlmoxTransf(CdsAlmox: OleVariant): WordBool; safecall;
    function  AtribuirAlmoxarifado(Cds: OleVariant): WordBool; safecall;
    function  BaixaProdCasa(TipoBaixa: Integer; IdPessoa: Integer; Valor: Double; Qtde: Double; 
                            CodAlmoxOrigem: Integer; const CodArtigo: WideString; 
                            const CodMedida: WideString; Data: TDateTime; 
                            const NumDocumento: WideString; UnidNegoc: Integer; 
                            CodAlmoxTransf: Integer; const CodArtigoElab: WideString; 
                            const CodMedidaElab: WideString): WordBool; safecall;
    function  ExcluirRecebMerc(IdNFRecebDevol: Double): WordBool; safecall;
    function  GravarRecebMerc(IdPessoa: Integer; UsaPlanoPrev: WordBool; IntegraCAP: WordBool; 
                              IntegraContab: WordBool; IdModulo: Double; IdUsuario: Double; 
                              IdPatro: Double; IdPlanoPrev: Double; ERecebimentoComOC: WordBool; 
                              CdsNota: OleVariant; CdsItemNota: OleVariant; 
                              CdsAgregItemNota: OleVariant; CdsAgregNota: OleVariant): WordBool; safecall;
    function  BaixarMaterial(TipoBaixa: Integer; IdPessoa: Integer; Cds: OleVariant; 
                             CdsItem: OleVariant): WordBool; safecall;
    function  GravarReqMat(Valor: Double; const Grupo: WideString; Cds: OleVariant; 
                           CdsItem: OleVariant): WordBool; safecall;
    function  AtenderReqCad(IdPessoa: Integer; QtdeAtendida: Double; DataAtendimento: TDateTime; 
                            IdAtendente: Double; DeixaRestoPendente: WordBool; CdsItem: OleVariant): WordBool; safecall;
    function  EstornarReqCad(CdsItem: OleVariant): WordBool; safecall;
    function  ConfirmaAtendimento(IdItemEntrega: Double; IdUsuario: Double; Data: TDateTime; 
                                  CdsItem: OleVariant): WordBool; safecall;
    function  DevolveAtendimento(IdPessoa: Integer; IdUsuario: Double; Data: TDateTime; 
                                 CdsItem: OleVariant): WordBool; safecall;
    function  ExcluirSCPrePronta(Cds: OleVariant; CdsItem: OleVariant): WordBool; safecall;
    function  GravarSCPrePronta(Cds: OleVariant; CdsItem: OleVariant): WordBool; safecall;
    function  AtribuirComprador(Operacao: Integer; IdItemSoli: Double; IdComprador: Double): WordBool; safecall;
    function  GravarSoliCompra(Valor: Double; const Grupo: WideString; Cds: OleVariant; 
                               CdsItem: OleVariant): WordBool; safecall;
    function  ExcluirSoliCompra(Cds: OleVariant; CdsItem: OleVariant): WordBool; safecall;
    function  AplicaOperacaoTamanho(Cds: OleVariant): WordBool; safecall;
    function  AplicaOperacaoTermoInventario(Cds: OleVariant): WordBool; safecall;
    function  ExcluirTipoAgregado(Cds: OleVariant; CdsContab: OleVariant): WordBool; safecall;
    function  GravarTipoAgregado(Cds: OleVariant; CdsContab: OleVariant): WordBool; safecall;
    function  AplicaOperacaoTipoPerda(Cds: OleVariant): WordBool; safecall;
    function  GravarUnCusteio(Cds: OleVariant): WordBool; safecall;
    function  ExcluirUnCusteio(Cds: OleVariant): WordBool; safecall;
    function  AplicaOperacaoCor(Cds: OleVariant): WordBool; safecall;
    function  AplicaOperacaoUnMedida(Cds: OleVariant): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IDtmAlmoxComprasSrvr50Disp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {779E331F-6BAB-4539-8837-6D4AD74AEE82}
// *********************************************************************//
  IDtmAlmoxComprasSrvr50Disp = dispinterface
    ['{779E331F-6BAB-4539-8837-6D4AD74AEE82}']
    function  ConectaDB(const UserName: WideString; const PassWord: WideString; 
                        const ServerName: WideString): WordBool; dispid 1;
    function  MessageInfo: WideString; dispid 2;
    function  GravaLogOperacoes(dIdPessoa: Double; dIdModulo: Double; dIdUsuario: Double; 
                                const sDescOperacao: WideString): WordBool; dispid 3;
    function  GetDataPacket(const sSql: WideString): OleVariant; dispid 4;
    function  ProcessaPessoaForne(Operacao: Integer; CdsPessoa: OleVariant; 
                                  CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                  CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                  CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                  CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                  CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant; 
                                  CdsImAgregForn: OleVariant; CdsEmpresaForn: OleVariant; 
                                  CdsFornXDesemb: OleVariant; CdsFornXRamo: OleVariant): WordBool; dispid 5;
    function  ProcessaPessoaCliente(Operacao: Integer; CdsPessoa: OleVariant; 
                                    CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                    CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                    CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                    CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                    CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant; 
                                    CdsEmpresaCliente: OleVariant; CdsTipoRecebCli: OleVariant; 
                                    CdsImAgregCli: OleVariant; CdsTiposCli: OleVariant): WordBool; dispid 6;
    function  ProcessaPessoaAgencia(Operacao: Integer; CdsPessoa: OleVariant; 
                                    CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                    CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                    CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                    CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                    CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant): WordBool; dispid 7;
    function  ProcessaPessoaBanco(Operacao: Integer; CdsPessoa: OleVariant; 
                                  CdsPessoaFisica: OleVariant; CdsDocPessoa: OleVariant; 
                                  CdsSubTipo: OleVariant; CdsEndPess: OleVariant; 
                                  CdsTelEndPess: OleVariant; CdsContatoPess: OleVariant; 
                                  CdsTelContato: OleVariant; CdsContaBancaria: OleVariant; 
                                  CdsImagensPessoa: OleVariant; CdsImagensDoc: OleVariant): WordBool; dispid 8;
    function  ExecSqlAndCommit(const sSql: WideString): WordBool; dispid 9;
    function  ProcessaMensagem(CdsMensagem: OleVariant; iOperacaoMensage: Integer; 
                               IdMensagem: Integer): WordBool; dispid 10;
    function  GravaHistSenha(aCdsHistSenha: OleVariant): WordBool; dispid 11;
    function  GetDadosPessoa(rIdPessoa: Double; TipoGetPessoa: Integer; TipoPessoa: Integer; 
                             var ovPessoa: OleVariant; var ovPessoaFisica: OleVariant; 
                             var ovDocPessoa: OleVariant; var ovEndPess: OleVariant; 
                             var ovTelEndPess: OleVariant; var ovContatoPess: OleVariant; 
                             var ovTelContato: OleVariant; var ovContaBancaria: OleVariant; 
                             var ovImagensPessoa: OleVariant; var ovImagensDoc: OleVariant; 
                             var ovEstado: OleVariant; var ovNaturalidade: OleVariant; 
                             var ovBanco: OleVariant; var ovDocumento: OleVariant; 
                             var ovTipoDoc: OleVariant): WordBool; dispid 12;
    function  SelDadosCli(rIdEmpresa: Double; rIdForcli: Double; out ovSubTipo: OleVariant; 
                          out ovEmpresaCliente: OleVariant; out ovTipoReceb: OleVariant; 
                          out ovTipoRecebCli: OleVariant; out ovImAgreg: OleVariant; 
                          out ovImAgregCli: OleVariant; out ovTipos: OleVariant; 
                          out ovTiposCli: OleVariant): WordBool; dispid 13;
    function  SelDadosForne(rIdEmpresa: Double; rIdForcli: Double; out ovSubTipo: OleVariant; 
                            out ovEmpresaForne: OleVariant; out ovTipoDesemb: OleVariant; 
                            out ovImAgreg: OleVariant; out ovRamoForne: OleVariant; 
                            out ovTipoDesembForn: OleVariant; out ovImAgregForn: OleVariant; 
                            out ovRamoXForne: OleVariant): WordBool; dispid 14;
    function  GetDataPacketTS(lSQL: OleVariant): OleVariant; dispid 15;
    function  GetContentFile(const sFileName: WideString): WideString; dispid 16;
    function  ExcluirProcessoCompra(CdsProcecsso: OleVariant; CdsItemSoli: OleVariant): WordBool; dispid 17;
    function  GravarProcessoCompra(CdsProcesso: OleVariant; CdsItemSoli: OleVariant; 
                                   CdsCotacao: OleVariant; CdsNovoForn: OleVariant): WordBool; dispid 18;
    function  GravaParalmox(Cds: OleVariant; CdsParamRel: OleVariant): WordBool; dispid 19;
    function  GravaParamCompras(Cds: OleVariant): WordBool; dispid 20;
    function  PreparaAssinatura(IdPessoa: Double; IdModulo: Double): {??Word} OleVariant; dispid 21;
    function  AlteraCusto(IdPessoa: Integer; Valor: Double; CodCusteio: Integer; 
                          CodAlmoxOrigem: Integer; const CodArtigo: WideString; 
                          const CodMedida: WideString; Data: TDateTime; 
                          const NumDocumento: WideString; const CentroCusto: WideString; 
                          UnidNegoc: Integer): WordBool; dispid 22;
    function  GravarArtigo(Tipo: Integer; CdsArtigo: OleVariant; CdsArtxContaxCC: OleVariant; 
                           CdsConver: OleVariant; CdsImpostos: OleVariant; CdsProdutos: OleVariant; 
                           CdsCorTamanho: OleVariant): WordBool; dispid 23;
    function  ExcluirArtigo(CdsArtigo: OleVariant): WordBool; dispid 24;
    function  ExisteMedida(const CodMedida: WideString; CdsConver: OleVariant): WordBool; dispid 25;
    function  AtribuirArtigo(Cds: OleVariant): WordBool; dispid 26;
    function  AtualizaMovimento(IdPessoa: Integer; const CodArtigo: WideString; Data: TDateTime): WordBool; dispid 27;
    function  RealizaBaixa(IdTipoPerda: Integer; IdPessoa: Integer; Valor: Double; Qtde: Double; 
                           CodCusteio: Integer; CodAlmoxOrigem: Integer; 
                           const CodArtigo: WideString; const CodMedida: WideString; 
                           Data: TDateTime; const NumDocumento: WideString; 
                           const CentroCusto: WideString; UnidNegoc: Integer): WordBool; dispid 28;
    function  AtribuirGrupos(IdComprador: Double; Cds: OleVariant): WordBool; dispid 29;
    function  GravarContratoProd(Cds: OleVariant): WordBool; dispid 30;
    function  CalculaSumario(CodProcesso: Double): WordBool; dispid 31;
    function  GravarCotacao(CdsCotacao: OleVariant; CdsPrazoEntrega: OleVariant; 
                            CdsPrazoPagto: OleVariant; CdsValorAgreg: OleVariant; 
                            CdsValorAgregTela: OleVariant): WordBool; dispid 32;
    function  GravaStatus(CodProcesso: Double; IdProcxArt: Double; Proposta: Double; 
                          IdForCli: Double; const Status: WideString; 
                          const Justificativa: WideString): WordBool; dispid 33;
    function  ProcessaSelecao(CdsSuamario: OleVariant): WordBool; dispid 34;
    function  ProcessaStatus(CodProcesso: Double): WordBool; dispid 35;
    function  ValidaDadosCotacao(CdsCotacao: OleVariant; CdsPrazoEntrega: OleVariant; 
                                 CdsPrazoPgto: OleVariant; CdsValorAgreg: OleVariant): WordBool; dispid 36;
    function  AtualizaDataRepresa(IdPessoa: Integer; Data: TDateTime; const Bilhete: WideString): WordBool; dispid 37;
    function  AtribuiUsuxGrupo(Cds: OleVariant): WordBool; dispid 38;
    function  GravaGrupoProd(Cds: OleVariant): WordBool; dispid 39;
    function  ImplantarSaldo(IdPessoa: Integer; Qtde: Double; Valor: Double; CodCusteio: Integer; 
                             CodAlmoxOrigem: Integer; const CodArtigo: WideString; 
                             const CodMedida: WideString; const CentroCusto: WideString; 
                             UnidNegoc: Integer; ValUltCompra: Double): WordBool; dispid 40;
    function  ExcluirItegrarcao(IdPessoa: Integer; Data: TDateTime; UsaPlanoPrev: WordBool; 
                                IdModulo: Integer; IdUsuario: Integer; const Bilhete: WideString): WordBool; dispid 41;
    function  IntegrarContab(IdPessoa: Integer; DataIni: TDateTime; DataFim: TDateTime; 
                             ContabilizaTransf: WordBool; UsaPlanoPrev: WordBool; 
                             IdModulo: Integer; IdUsuario: Integer; IdPatro: Integer; 
                             IdPlanoPrev: Integer; const Bilhete: WideString): WordBool; dispid 42;
    function  AbreInventario(Cds: OleVariant; const CodGrupoProd: WideString): Double; dispid 43;
    function  AtualizaSaldo(IdInventario: Integer; UnidNegoc: Integer): WordBool; dispid 44;
    function  ExcluirInventario(Cds: OleVariant): WordBool; dispid 45;
    function  GeraDiferencas(IdInventario: Integer): WordBool; dispid 46;
    function  GravarContagem(CdsContagem: OleVariant): WordBool; dispid 47;
    function  ImportArqInvent(IdInvetario: Integer; Arquivo: OleVariant): WordBool; dispid 48;
    function  GravarLocalizacao(Cds: OleVariant): WordBool; dispid 49;
    function  ConverterUnidade(const CodArtigo: WideString; const CodProduto: WideString; 
                               const CodUnVelha: WideString; const CodUnNova: WideString; 
                               const Bilhete: WideString): WordBool; dispid 50;
    function  ExcluirNotaFiscal(CdsNota: OleVariant; CdsItemNota: OleVariant; 
                                CdsAgregItemNota: OleVariant; CdsAgregNota: OleVariant): WordBool; dispid 51;
    function  GravarNotaFiscal(CdsNota: OleVariant; CdsItemNota: OleVariant; 
                               CdsAgregItemNota: OleVariant; CdsAgregNota: OleVariant): WordBool; dispid 52;
    function  ExcluirOrdemCompra(CdsOC: OleVariant; CdsItemOC: OleVariant; 
                                 CdsPrazoPgtoOC: OleVariant; CdsPrazoEntregaOC: OleVariant; 
                                 CdsSCIItemOC: OleVariant; CdsAgregItemOC: OleVariant; 
                                 CdsAgregTotOC: OleVariant): WordBool; dispid 53;
    function  CancelaItemOC(IdItemOC: Double; temCotacao: WordBool; CodProcesso: Double): WordBool; dispid 54;
    function  CancelaOC(NumOC: Double): WordBool; dispid 55;
    function  GravarPremiGestEstoque(Cds: OleVariant): WordBool; dispid 56;
    function  GravarAlmox(CdsAlmox: OleVariant): WordBool; dispid 57;
    function  ExcluirAlmox(CdsAlmox: OleVariant): WordBool; dispid 58;
    function  AssociaAlmoxTransf(CdsAlmox: OleVariant): WordBool; dispid 59;
    function  AtribuirAlmoxarifado(Cds: OleVariant): WordBool; dispid 60;
    function  BaixaProdCasa(TipoBaixa: Integer; IdPessoa: Integer; Valor: Double; Qtde: Double; 
                            CodAlmoxOrigem: Integer; const CodArtigo: WideString; 
                            const CodMedida: WideString; Data: TDateTime; 
                            const NumDocumento: WideString; UnidNegoc: Integer; 
                            CodAlmoxTransf: Integer; const CodArtigoElab: WideString; 
                            const CodMedidaElab: WideString): WordBool; dispid 61;
    function  ExcluirRecebMerc(IdNFRecebDevol: Double): WordBool; dispid 62;
    function  GravarRecebMerc(IdPessoa: Integer; UsaPlanoPrev: WordBool; IntegraCAP: WordBool; 
                              IntegraContab: WordBool; IdModulo: Double; IdUsuario: Double; 
                              IdPatro: Double; IdPlanoPrev: Double; ERecebimentoComOC: WordBool; 
                              CdsNota: OleVariant; CdsItemNota: OleVariant; 
                              CdsAgregItemNota: OleVariant; CdsAgregNota: OleVariant): WordBool; dispid 63;
    function  BaixarMaterial(TipoBaixa: Integer; IdPessoa: Integer; Cds: OleVariant; 
                             CdsItem: OleVariant): WordBool; dispid 64;
    function  GravarReqMat(Valor: Double; const Grupo: WideString; Cds: OleVariant; 
                           CdsItem: OleVariant): WordBool; dispid 65;
    function  AtenderReqCad(IdPessoa: Integer; QtdeAtendida: Double; DataAtendimento: TDateTime; 
                            IdAtendente: Double; DeixaRestoPendente: WordBool; CdsItem: OleVariant): WordBool; dispid 66;
    function  EstornarReqCad(CdsItem: OleVariant): WordBool; dispid 67;
    function  ConfirmaAtendimento(IdItemEntrega: Double; IdUsuario: Double; Data: TDateTime; 
                                  CdsItem: OleVariant): WordBool; dispid 68;
    function  DevolveAtendimento(IdPessoa: Integer; IdUsuario: Double; Data: TDateTime; 
                                 CdsItem: OleVariant): WordBool; dispid 69;
    function  ExcluirSCPrePronta(Cds: OleVariant; CdsItem: OleVariant): WordBool; dispid 70;
    function  GravarSCPrePronta(Cds: OleVariant; CdsItem: OleVariant): WordBool; dispid 71;
    function  AtribuirComprador(Operacao: Integer; IdItemSoli: Double; IdComprador: Double): WordBool; dispid 72;
    function  GravarSoliCompra(Valor: Double; const Grupo: WideString; Cds: OleVariant; 
                               CdsItem: OleVariant): WordBool; dispid 73;
    function  ExcluirSoliCompra(Cds: OleVariant; CdsItem: OleVariant): WordBool; dispid 74;
    function  AplicaOperacaoTamanho(Cds: OleVariant): WordBool; dispid 75;
    function  AplicaOperacaoTermoInventario(Cds: OleVariant): WordBool; dispid 76;
    function  ExcluirTipoAgregado(Cds: OleVariant; CdsContab: OleVariant): WordBool; dispid 77;
    function  GravarTipoAgregado(Cds: OleVariant; CdsContab: OleVariant): WordBool; dispid 78;
    function  AplicaOperacaoTipoPerda(Cds: OleVariant): WordBool; dispid 80;
    function  GravarUnCusteio(Cds: OleVariant): WordBool; dispid 79;
    function  ExcluirUnCusteio(Cds: OleVariant): WordBool; dispid 81;
    function  AplicaOperacaoCor(Cds: OleVariant): WordBool; dispid 82;
    function  AplicaOperacaoUnMedida(Cds: OleVariant): WordBool; dispid 83;
    function  AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; 
                              MaxErrors: Integer; out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function  AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                            Options: Integer; const CommandText: WideString; 
                            var Params: OleVariant; var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function  AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function  AS_GetProviderNames: OleVariant; dispid 20000003;
    function  AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function  AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                            var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoDtmAlmoxComprasSrvr50 provides a Create and CreateRemote method to          
// create instances of the default interface IDtmAlmoxComprasSrvr50 exposed by              
// the CoClass DtmAlmoxComprasSrvr50. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoDtmAlmoxComprasSrvr50 = class
    class function Create: IDtmAlmoxComprasSrvr50;
    class function CreateRemote(const MachineName: string): IDtmAlmoxComprasSrvr50;
  end;

implementation

uses ComObj;

class function CoDtmAlmoxComprasSrvr50.Create: IDtmAlmoxComprasSrvr50;
begin
  Result := CreateComObject(CLASS_DtmAlmoxComprasSrvr50) as IDtmAlmoxComprasSrvr50;
end;

class function CoDtmAlmoxComprasSrvr50.CreateRemote(const MachineName: string): IDtmAlmoxComprasSrvr50;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DtmAlmoxComprasSrvr50) as IDtmAlmoxComprasSrvr50;
end;

end.
