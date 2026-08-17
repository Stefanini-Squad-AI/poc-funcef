unit dOperacaoInvest;

//	------------------------------------------------------------------------------------------------
//
//	Autor          :  André Pontes
//	Data de Início :
//	Data de Término:
//
//	Modificações	:   11/08/1999  1) Nova query (qryIntegraContab) para trazer a máscara do plano de contas
//                                  (para suprir o novo parâmetro da LancaContab)
//                   24/08/1999  2) Correção na qryIntegraContab: havia TFiels a mais, não declarados
//                                  no SQL (Augusto)
//                       .
//                       .
//                       .
//                   01/09/1999  3) Alteração na qryTipoOperacao: inclusao do campo RecPag
//                                  (para se poder decidir se a Operação involverá um Fornecedor ou
//                                  um Cliente, e possibilitar a busca da Sub-Conta apropriada)
//                               4) Alteração na qryDespXTipoOper: idem acima
//                               5) Novas queries: BuscaForn e BuscaCli (vide acima)
//                               6) Todas as queries passam a ser preparadas no seu 1º uso, e não mais
//                                  no on_Create do DataModule
//
// -------------------------------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, Wwdatsrc;

type
  TdtmOperacaoInvest = class(TDataModule)
    qrySaldoCarteira: TwwQuery;
    qrySaldoCarteiraDATAMOVCARTINV: TDateTimeField;
    qrySaldoCarteiraIDCARTEIRAINVEST: TFloatField;
    qrySaldoCarteiraSALDOCOTASCARTINV: TFloatField;
    qrySaldoCarteiraSALDOVLRCARTINV: TFloatField;
    qrySaldoCarteiraSALDOQTDEINVCART: TFloatField;
    qrySaldoCarteiraSALDOVLRINVCART: TFloatField;
    qryTipoOperacao: TwwQuery;
    qryLancaDocumento: TwwQuery;
    qryAuxiliar: TwwQuery;
    qryDespXTipoOper: TwwQuery;
    qryTipoOperacaoFLGGERACONTAB: TFloatField;
    qryTipoOperacaoFLGGERACAPCAR: TFloatField;
    qryDespXTipoOperFLGGERACONTAB: TFloatField;
    qryDespXTipoOperFLGGERACAPCAR: TFloatField;
    qryTipoOperacaoCODTIPDOC: TFloatField;
    qryDespXTipoOperCODTIPDOC: TFloatField;
    qryIntegraContab: TwwQuery;
    qryIntegraContabMASCARA: TStringField;
    qryFlgAtualSaldo13: TwwQuery;
    qryAtualizaSaldoC: TwwQuery;
    qryAtualizaSaldoCIDOPERACAOINVEST: TFloatField;
    qryAtualizaSaldoCSALDOCOTASCARTINV: TFloatField;
    qryAtualizaSaldoCSALDOVLRCARTINV: TFloatField;
    qryAtualizaSaldoCVLRMOVCARTINV: TFloatField;
    qryAtualizaSaldoCCOTASMOVCARTINV: TFloatField;
    qryFlgAtualSaldo13IDHISTCARTINV: TFloatField;
    qryFlgAtualSaldo13DATAMOVCARTINV: TDateTimeField;
    qryFlgAtualSaldo13IDCARTEIRAINVEST: TFloatField;
    qryFlgAtualSaldo13IDINVESTIMENTO: TFloatField;
    qryFlgAtualSaldo13FLGCALCSALDO: TStringField;
    qryAtualizaSaldoCNATURMOVCARTINV: TStringField;
    updAtualizaSaldoC: TUpdateSQL;
    qryAtualizaSaldoCIDHISTCARTINV: TFloatField;
    qrySaldoCarteiraIDHISTCARTINV: TFloatField;
    qryAtualizaSaldoCFLGCALCSALDO: TStringField;
    qryFlgAtualSaldo2: TwwQuery;
    FloatField1: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField1: TStringField;
    qryTipoOperacaoRECPAG: TStringField;
    qryDespXTipoOperRECPAG: TStringField;
    qryBuscaCli: TwwQuery;
    qryBuscaForn: TwwQuery;
    qryBuscaFornCODSUBCONTA: TFloatField;
    qryBuscaCliCODSUBCONTA: TFloatField;
    qryVerificaConta: TwwQuery;
    qryVerificaContaPLASUBCONTA: TStringField;
    qryVerificaContaPLACCUST: TStringField;
    qryPadraoAtuTTCI: TwwQuery;
    qryPadraoAtuTT: TwwQuery;
    qryPadraoAtuTTIDPADRLANCCONT: TFloatField;
    qryPadraoAtuTTIDTIPOINVEST: TFloatField;
    qryPadraoAtuTTIDTIPOOPERACAO: TFloatField;
    qryPadraoAtuTTCODTIPTITULO: TStringField;
    qryPadraoAtuTTIDPESSOA: TFloatField;
    qryPadraoAtuTTIDTIPODESPINVEST: TFloatField;
    qryPadraoAtuTTRECPAG: TStringField;
    qryPadraoAtuTTIDFORCLI: TFloatField;
    qryPadraoAtuTTCODTIPRECDES: TStringField;
    qryPadraoAtuTTIDCARTEIRAINVEST: TFloatField;
    qryPadraoAtuTTCODSUBCONTAC: TFloatField;
    qryPadraoAtuTTCODSUBCONTAD: TFloatField;
    qryPadraoAtuTTFLGPAGRECNAO: TStringField;
    qryPadraoAtuTTHISTLANCINVEST: TStringField;
    qryPadraoAtuTTPLANO: TFloatField;
    qryPadraoAtuTTCONTADOPERFIN: TStringField;
    qryPadraoAtuTTCONTACOPERFIN: TStringField;
    qryPadraoAtuTTCENCUSTCINVEST: TStringField;
    qryPadraoAtuTTCENCUSTDINVEST: TStringField;
    qryPadraoAtuTTCODCENTRORESPON: TStringField;
    qryPadraoAtuTTUNIDNEGOC: TFloatField;
    qryPadraoAtuTTTIPMOVCARTINV: TStringField;
    qryPadraoAtuTTTIPLANCINVEST: TStringField;
    qryPadraoAtuTTIDEMPRESA: TFloatField;
    qryPadraoAtuTTCIIDPADRLANCCONT: TFloatField;
    qryPadraoAtuTTCIIDTIPOINVEST: TFloatField;
    qryPadraoAtuTTCIIDTIPOOPERACAO: TFloatField;
    qryPadraoAtuTTCICODTIPTITULO: TStringField;
    qryPadraoAtuTTCIIDPESSOA: TFloatField;
    qryPadraoAtuTTCIIDTIPODESPINVEST: TFloatField;
    qryPadraoAtuTTCIRECPAG: TStringField;
    qryPadraoAtuTTCIIDFORCLI: TFloatField;
    qryPadraoAtuTTCICODTIPRECDES: TStringField;
    qryPadraoAtuTTCIIDCARTEIRAINVEST: TFloatField;
    qryPadraoAtuTTCICODSUBCONTAC: TFloatField;
    qryPadraoAtuTTCICODSUBCONTAD: TFloatField;
    qryPadraoAtuTTCIFLGPAGRECNAO: TStringField;
    qryPadraoAtuTTCIHISTLANCINVEST: TStringField;
    qryPadraoAtuTTCIPLANO: TFloatField;
    qryPadraoAtuTTCICONTADOPERFIN: TStringField;
    qryPadraoAtuTTCICONTACOPERFIN: TStringField;
    qryPadraoAtuTTCICENCUSTCINVEST: TStringField;
    qryPadraoAtuTTCICENCUSTDINVEST: TStringField;
    qryPadraoAtuTTCICODCENTRORESPON: TStringField;
    qryPadraoAtuTTCIUNIDNEGOC: TFloatField;
    qryPadraoAtuTTCITIPMOVCARTINV: TStringField;
    qryPadraoAtuTTCITIPLANCINVEST: TStringField;
    qryPadraoAtuTTCIIDEMPRESA: TFloatField;
    qryFlgAtualSaldo13NATURMOVCARTINV: TStringField;
    qryFlgAtualSaldo2IDLOTE: TStringField;
    qryAtualizaSaldoIL: TwwQuery;
    FloatField24: TFloatField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    StringField14: TStringField;
    StringField15: TStringField;
    updAtualizaSaldoIL: TUpdateSQL;
    qryAtualizaSaldoILDATAMOVCARTINV: TDateTimeField;
    qryAtualizaSaldoILTIPMOVCARTINV: TStringField;
    qryAtualizaSaldoILSALDOATU: TFloatField;
    qryAtualizaSaldoILMOVIMCAR: TFloatField;
    qryAtualizaSaldoILSALDOCAR: TFloatField;
    qryAtualizaSaldoILSALDOAQUI: TFloatField;
    qryAtualizaSaldoILSALDOREND: TFloatField;
    qrySaldoInvestimentoT: TwwQuery;
    FloatField4: TFloatField;
    DateTimeField3: TDateTimeField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    qrySaldoInvestimentoTSALDOAQUI: TFloatField;
    qrySaldoInvestimentoTSALDOREND: TFloatField;
    qryAtualizaSaldoILMOVIMAQUI: TFloatField;
    qryAtualizaSaldoILQTDEMOVINVCART: TFloatField;
    qryMoeda: TwwQuery;
    qryMoedaMOEPERIODICIDADE: TStringField;
    qryMoedaFLGPERCVALOR: TStringField;
    qryFlgAtualSaldo13IDLOTE: TStringField;
    qryAtualizaSaldoCIDDESPOPERINVEST: TFloatField;
    qryAtualizaSaldoILIDDESPOPERINVEST: TFloatField;
    qryAtualizaSaldoCIDINVESTIMENTO: TFloatField;
    qryAtualizaSaldoCIDLOTE: TStringField;
    qryAtualizaSaldoCIDTIPOOPERACAO: TFloatField;
    qryAtualizaSaldoCFLGCALCDIARIO: TFloatField;
    qryAtualizaSaldoILIDTIPOOPERACAO: TFloatField;
    qryAtualizaSaldoILFLGCALCDIARIO: TFloatField;
    qryAtualizaSaldoCNATURMOVOPER: TStringField;
    qryAtualizaSaldoILNATURMOVOPER: TStringField;
    qryAtualizaSaldoILMOVIMATU: TFloatField;
    qryAtualizaSaldoCTIPMOVCARTINV: TStringField;
    qryAtualizaSaldoCQTDEMOVINVCART: TFloatField;
    qryHistoricoCarteira: TwwQuery;
    qryAtualizaSaldoCDATAMOVCARTINV: TDateTimeField;
    qryAtualizaSaldoCIDCARTEIRAINVEST: TFloatField;
    QryBuscaSaldoNova: TwwQuery;
    QryBuscaSaldoNovaIDHISTCARTINV: TFloatField;
    QryBuscaSaldoNovaTIPMOVCARTINV: TStringField;
    QryBuscaSaldoNovaIDCARTEIRAINVEST: TFloatField;
    QryBuscaSaldoNovaDATAMOVCARTINV: TDateTimeField;
    QryBuscaSaldoNovaSALDOCOTASCARTINV: TFloatField;
    QryBuscaSaldoNovaSALDOVLRCARTINV: TFloatField;
    QryBuscaSaldoNovaSALDOQTDEINVCART: TFloatField;
    QryBuscaSaldoNovaSALDOVLRINVCART: TFloatField;
    QryBuscaSaldoNovaSALDOATU: TFloatField;
    QryBuscaSaldoNovaSALDOCAR: TFloatField;
    QryBuscaSaldoNovaSALDOAQUI: TFloatField;
    QryBuscaSaldoNovaSALDOREND: TFloatField;
    wwDataSource1: TwwDataSource;
    qryAtualizaSaldoILIDCARTEIRAINVEST: TFloatField;
    qryAtualizaSaldoILIDINVESTIMENTO: TFloatField;
    qryAtualizaSaldoILIDLOTE: TStringField;
    QrySaldoInvestimentoNova: TwwQuery;
    qrySaldoCustodia: TwwQuery;
    qrySaldoCustodiaIDCUSTODIA: TFloatField;
    qrySaldoCustodiaSALDOBLOQUEADO: TFloatField;
    qrySaldoCustodiaSALDOLIBERADO: TFloatField;
    qryHistCustodia: TwwQuery;
    StringField2: TStringField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    qrySaldoInvestimentoTSALDOJUROS: TFloatField;
    qrySaldoInvestimentoTSALDOPREMIO: TFloatField;
    qryAtualizaSaldoILVLRJUROS: TFloatField;
    qrySaldoInvestimentoTSALDOVARIACAO: TFloatField;
    qryAtualizaSaldoILVLRVARIACAO: TFloatField;
    qrySaldoInvestimentoTSALDOIRPROV: TFloatField;
    qrySaldoInvestimentoTSALDOIRAPU: TFloatField;
    qrySaldoInvestimentoTSALDOIOFPROV: TFloatField;
    qrySaldoInvestimentoTSALDOIOFAPU: TFloatField;
    qrySaldoInvestimentoTSALDOAGIO: TFloatField;
    qryAtualizaSaldoILVLRAGIO: TFloatField;
    qryAtualizaSaldoILVLRIRPROV: TFloatField;
    qryAtualizaSaldoILVLRIRAPU: TFloatField;
    qryAtualizaSaldoILVLRIOFPROV: TFloatField;
    qryAtualizaSaldoILVLRIOFAPU: TFloatField;
    qryAtualizaSaldoILTIPOOPERACAO: TFloatField;

    // outros procedimentos
    procedure dtmOperacaoInvestDestroy(Sender: TObject);


  private { Private declarations }

  public { Public declarations }

  end;



var
  dtmOperacaoInvest: TdtmOperacaoInvest;


implementation
{$R *.DFM}



procedure TdtmOperacaoInvest.dtmOperacaoInvestDestroy(Sender: TObject);
begin
(*
// -- Padrão de Operação ---------------------------------------------------------------------------

    qryPadraoOperFCTTCI.Close;
    qryPadraoOperFCTTCI.UnPrepare;

    qryPadraoOperFCTT.Close;
    qryPadraoOperFCTT.UnPrepare;

    qryPadraoOperFCCI.Close;
    qryPadraoOperFCCI.UnPrepare;

    qryPadraoOperTTCI.Close;
    qryPadraoOperTTCI.UnPrepare;

    qryPadraoOperFC.Close;
    qryPadraoOperFC.UnPrepare;

    qryPadraoOperTT.Close;
    qryPadraoOperTT.UnPrepare;

    qryPadraoOperCI.Close;
    qryPadraoOperCI.UnPrepare;

    qryPadraoOper.Close;
    qryPadraoOper.UnPrepare;

// -- Padrão de Despesa ----------------------------------------------------------------------------

    qryPadraoDespFCTTCI.Close;
    qryPadraoDespFCTTCI.UnPrepare;

    qryPadraoDespFCTT.Close;
    qryPadraoDespFCTT.UnPrepare;

    qryPadraoDespFCCI.Close;
    qryPadraoDespFCCI.UnPrepare;

    qryPadraoDespTTCI.Close;
    qryPadraoDespTTCI.UnPrepare;

    qryPadraoDespFC.Close;
    qryPadraoDespFC.UnPrepare;

    qryPadraoDespTT.Close;
    qryPadraoDespTT.UnPrepare;

    qryPadraoDespCI.Close;
    qryPadraoDespCI.UnPrepare;

    qryPadraoDesp.Close;
    qryPadraoDesp.UnPrepare;
*)
// -- Histórico e Saldos ---------------------------------------------------------------------------

    qryHistoricoCarteira.Close;
    qryHistoricoCarteira.UnPrepare;

    qrySaldoCarteira.Close;
    qrySaldoCarteira.UnPrepare;

    qrySaldoInvestimentoT.Close;
    qrySaldoInvestimentoT.UnPrepare;

    qryFlgAtualSaldo13.Close;
    qryFlgAtualSaldo13.UnPrepare;

    qryFlgAtualSaldo2.Close;
    qryFlgAtualSaldo2.UnPrepare;

    qryAtualizaSaldoC.Close;
    qryAtualizaSaldoC.UnPrepare;

    qryAtualizaSaldoIL.Close;
    qryAtualizaSaldoIL.UnPrepare;

    qryMoeda.Close;
    qryMoeda.UnPrepare;

    qrySaldoCustodia.Close;
    qrySaldoCustodia.UnPrepare;

    qryHistCustodia.Close;
    qryHistCustodia.UnPrepare;
// -- Outros ---------------------------------------------------------------------------------------

    qryTipoOperacao.Close;
    qryTipoOperacao.UnPrepare;

    qryLancaDocumento.Close;
    qryLancaDocumento.UnPrepare;

    qryAuxiliar.Close;
    qryAuxiliar.UnPrepare;

    qryDespXTipoOper.Close;
    qryDespXTipoOper.UnPrepare;

    qryIntegraContab.Close;
    qryIntegraContab.UnPrepare;

    qryBuscaCli.Close;
    qryBuscaCli.UnPrepare;

    qryBuscaForn.Close;
    qryBuscaForn.UnPrepare;

    qryVerificaConta.Close;
    qryVerificaConta.UnPrepare;

// -- Fim ------------------------------------------------------------------------------------------
end;



end.
