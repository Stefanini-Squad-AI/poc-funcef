// Alterações:      
{ --------------------------------------------------------------------------------------------------
Rotina    : *** várias ***
Data      : 26/12/2002
Autor     : André Pontes
Descrição : Recebimento de CaP / CaR totalmente refeito, contemplando baixas parciais e valores
            inesperados
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : qryTMPDESC
Data      : 09/12/2002
Autor     : André Pontes
Descrição : TMP.SITENVIO IN ('1', '2') ao invés de TMP.SITENVIO NOT IN ('0', '9')
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : RecebeParcelaBancoCR
Data      : 04/12/2002
Autor     : Marchetti
Descrição : Rotina alterada para contemplar o não pagamento da amortização e quitação
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : RecebeParcelaTmpDesc
Data      : 04/12/2002
Autor     : Marchetti
Descrição : Rotina alterada para contemplar o não pagamento da amortização
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 25/11/2002
Autor     : Marchetti
Descrição : É passado o record dos dados da concessão. Nesse processo os dados seguem sem valor, pois
            os mesmos somente serão utilizados na alteração de valores da concessão.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : RecebeParcelaTmpDesc
Data      : 08/11/2002 a 18/11/2002
Autor     : André
Descrição : Rotina alterada para contemplar equivalência de 1 para 1 entre HistMovEmptmo e TMPDESC
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CalculaItens
Data      : 12/11/2002
Autor     : Marchetti
Descrição : Passado o número de parcelas pagas
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : RecebeParcelaBancoCP,RecebeParcelaBancoCR
Data      : 11/11/2002
Autor     : Marchetti
Descrição : Quando o saldo do documento for igual ao saldo a receber, faz a baixa pelo valor pago,
            senão faz a baixa pela diferença entre valor a receber e valor recebido  
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : BuscaSaldoDocumento
Data      : 06/11/2002
Autor     : Marchetti
Descrição : Acertada a query para trazer o valor efetivamente pago no financeiro
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : RecebeParcelaBancoCR
Data      : 06/11/2002
Autor     : Marchetti
Descrição : Acertada a rotina para aceitar recebimento ZERO no financeiro colocando o mesmo como
            FlgTipoDiverg = 6
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : MontaSql
Data      : 30/10/2002
Autor     : Marchetti
Descrição : Colocado filtro para não levar em consideração itens com valor previsto nulo ou igual a
            ZERO
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : AbreTMPDESC
Data      : 25/10/2002
Autor     : André Pontes
Descrição : Query passa para o objeto, com passagem de parâmetros, ao invés de ter o SQL.Text passado
            dinamicamente. Estava EXTREMAMENTE lento...
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 25/10/2002
Autor     : André Pontes
Descrição : Retirado o filtro por plano
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : RecebeParcelaBancoCP, RecebeParcelaBancoCR, RecebeParcelaTmpDesc
Data      : 18/10/2002
Autor     : Marchetti
Descrição : Retirado o LimpaParametros da qryauxemptmo e colocado Close 
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : RecebeParcelaBancoCR
Data      : 16/10/2002
Autor     : Marchetti
Descrição : Acerto no loop do contrato + parcela, pois quando haviam registros de parcela + encargos,
            a rotina baixava o valor dos encargos com o valor da parcela.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : ExisteItensEmAberto
Data      : 15/10/2002
Autor     : Marchetti
Descrição : Função que retorna possiveis itens em aberto
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : RecebeParcelaTmpDesc
Data      : 02/10/2002
Autor     : André Pontes
Descrição : *** Verificar isso !!! ***
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : InsereDiferencaHist
Data      : 01/10/2002
Autor     : André Pontes
Descrição : Correção da data efetiva na gravação de um novo item (DataPrevista := 0)
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 01/10/2002
Autor     : Marchetti
Descrição : label "Cobrança / Pagamento (mês/ano)" substitui "Cobrança (mês/ano)"
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 01/10/2002
Autor     : Marchetti
Descrição : Colocado filtro de ano e mes de cobranca para os itens do financeiro
---------------------------------------------------------------------------------------------------}




// --------------------------------------------------------------------
// --------------------------------------------------------------------
//
//    Tipo de Divergência:
//
//       1 - Valores AINDA não recebidos (não é usado no recebimento)
//
//       2 - Recebimentos Inesperados
//       3 - Valores recebidos a menor
//       4 - Valores recebidos a maior
//       5 - Divergência de datas
//       6 - Valores que não serão recebidos
//
// --------------------------------------------------------------------
// --------------------------------------------------------------------



unit FExecRecebimentoNovo;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FWizardMTEP, StdCtrls, Mask, wwdbedit, Wwdbspin, mListaPatro, wwdblook,
   mContratoEmptmo, mMutuario, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
   Buttons, TB97Tlbr, TB97, fcLabel, ComCtrls, ExtCtrls, Db, DBTables,
   Wwquery,

   uTypesEmptmo;

type
   TNovosDados = record
      IDItemEmptmo   : Int64;
      Valor          : Double;
      DataEfetiva    : TDateTime;
      DataPrevista   : TDateTime;
      DataVencto     : TDateTime;
      FlgDivergPend  : Integer;
      FlgBaixado     : Integer;
      AnoCompetencia : Integer;
      MesCompetencia : Integer;
      AnoCobranca    : Integer;
      MesCobranca    : Integer;
      IdRubrica      : Int64;
      FlgTipoDiverg  : Integer;
   end;

   TfrmExecRecebimentoNovo = class(TfrmWizardMTEP)
      molMutuario: TmolMutuario;
      molContratoEmptmo: TmolContratoEmptmo;
      Label1: TLabel;
      DBcboTipoEmptmo: TwwDBLookupCombo;
      Label3: TLabel;
      DBcboTipoContrato: TwwDBLookupCombo;
      molListaPatro: TmolListaPatro;
      grpRecebimento: TGroupBox;
      chkFolhaPatro: TCheckBox;
      chkFolhaBenef: TCheckBox;
      chkCaP: TCheckBox;
      chkCaR: TCheckBox;
      Panel2: TPanel;
      Label15: TLabel;
      DBspnAno: TwwDBSpinEdit;
      cboMes: TComboBox;
      chkDiverg: TCheckBox;
      Panel3: TPanel;
      memResult: TMemo;
      qryHistMov: TwwQuery;
      qryTmpDesc: TwwQuery;
      qryTmpDescMESREFERENCIA: TStringField;
      qryTmpDescCODALTERADOR: TFloatField;
      qryTmpDescPLNCODIGOPREV: TFloatField;
      qryTmpDescCODTIPRECDES: TStringField;
      qryTmpDescCODSUBCONTA: TFloatField;
      qryTmpDescRECPAG: TStringField;
      qryTmpDescIDEMPRESAPROP: TFloatField;
      qryTmpDescCODTIPDOC: TFloatField;
      qryTmpDescPLACONTAD: TStringField;
      qryTmpDescPLANO: TFloatField;
      qryTmpDescPLACONTAC: TStringField;
      qryTmpDescIDPESSOA: TFloatField;
      qryTmpDescCODDOCUMENTOPREV: TFloatField;
      qryTmpDescFLGTIPODESC: TStringField;
      qryTmpDescCODPORTFORMA: TFloatField;
      qryTmpDescVALOR: TFloatField;
      qryTmpDescIDTITULAR: TFloatField;
      qryTmpDescIDPLANASS: TFloatField;
      qryTmpDescIDDESCONTO: TFloatField;
      qryTmpDescUNIDNEGOC: TFloatField;
      qryTmpDescIDMOTIVO: TFloatField;
      qryTmpDescDATARECEBIMENTO: TDateTimeField;
      qryTmpDescCODCENTRORESPON: TStringField;
      qryTmpDescMESCOBRANCA: TStringField;
      qryTmpDescCODCENTROCUSTOD: TStringField;
      qryTmpDescIDPESSJUR: TFloatField;
      qryTmpDescIDPROVENTO: TFloatField;
      qryTmpDescCODCENTROCUSTOC: TStringField;
      qryTmpDescIDPLANOPREV: TFloatField;
      qryTmpDescIDEMPRESA: TFloatField;
      qryTmpDescVALORRECEBIDO: TFloatField;
      qryTmpDescNUMPRIORIDADE: TFloatField;
      qryTmpDescORDEM: TFloatField;
      qryTmpDescMATRICULA: TStringField;
      qryTmpDescINSCRICAONUMERO: TFloatField;
      qryTmpDescVALORBASE1: TFloatField;
      qryTmpDescVALORBASE2: TFloatField;
      qryTmpDescVALORBASE3: TFloatField;
      qryTmpDescFLGDESCONTO: TFloatField;
      qryTmpDescCODRETORNO: TStringField;
      qryTmpDescNUMDEPENDSEGURO: TStringField;
      qryTmpDescCODPROVDESC: TStringField;
      qryTmpDescFLGDESCFOLHA: TStringField;
      qryTmpDescDATAREFERENCIA: TDateTimeField;
      qryTmpDescDESCRICAO: TStringField;
      qryTmpDescREFERENCIA: TStringField;
      qryTmpDescFLGFORNPAG: TFloatField;
      qryTmpDescFLGFORNCOMISS: TFloatField;
      qryTmpDescIDFUNDACAO: TFloatField;
      qryTmpDescCODDOCUMENTOEFET: TFloatField;
      qryTmpDescPLNCODIGOEFET: TFloatField;
      qryTmpDescSISTORIGEM: TStringField;
      qryTmpDescFLGALTERADOR: TStringField;
      qryTmpDescPERIODO: TFloatField;
      qryTmpDescEXERCICIO: TFloatField;
      qryTmpDescFLGATRASODEVOL: TStringField;
      qryTmpDescDATACOBRANCA: TDateTimeField;
      qryTmpDescNODOCUMENTO: TFloatField;
      qryTmpDescCOMPLDOCUMENTO: TStringField;
      qryTmpDescIDFAVORECIDO: TFloatField;
      qryTmpDescIDLOTE: TFloatField;
      qryTmpDescIDEMPCOBRANCA: TFloatField;
      qryTmpDescTIPCODIGO: TStringField;
      qryTmpDescSITENVIO: TStringField;
      qryTmpDescSEQPROPOSTA: TFloatField;
      qryTmpDescFLGEXISTEHST: TFloatField;
      qryTmpDescNUMLANCTO: TFloatField;
      qryTmpDescTRGDTINCLUSAO: TDateTimeField;
      qryTmpDescTRGUSERINCLUSAO: TStringField;
      qryTmpDescLOTEPREVIA: TFloatField;
      qryTmpDescFONTEPAGADORA: TFloatField;
      qryTmpDescFLGINTEVENTO: TStringField;
      qryTmpDescIDMODULO: TFloatField;
      qryTmpDescVALORINFO: TFloatField;
      qryTmpDescPARCELARUB: TFloatField;
      qryTmpDescPRAZORUB: TFloatField;
      qryTmpDescIDPLANPREVCONTAB: TFloatField;
      qryTmpDescIDREGRACALCULO: TFloatField;
      qryTmpDescFLGSITUACAO: TStringField;
      qryTmpDescIDTIPOCONTREMPTMO: TFloatField;
      qryItensCaPCaR: TwwQuery;
      qryContratosGeracao: TwwQuery;
      qryContratosGeracaoIDCONTRATOEMPTMO: TFloatField;
      qryContratosGeracaoIDCONTRQUITACAO: TFloatField;
      qryContratosGeracaoIDTIPOEMPTMO: TFloatField;
      qryContratosGeracaoIDINSCRICAOEMPTMO: TFloatField;
      qryContratosGeracaoIDTIPOCONTREMPTMO: TFloatField;
      qryContratosGeracaoIDPATRO: TFloatField;
      qryContratosGeracaoIDPLANOPREV: TFloatField;
      qryContratosGeracaoIDVERBA: TFloatField;
      qryContratosGeracaoIDPESSOA: TFloatField;
      qryContratosGeracaoIDBENEF: TFloatField;
      qryContratosGeracaoFLGSITUACAO: TStringField;
      qryContratosGeracaoFLGFORMAREC: TStringField;
      qryContratosGeracaoFLGFORMAPAG: TStringField;
      qryContratosGeracaoCODFORMAPAG: TFloatField;
      qryContratosGeracaoPORTFORMAREC: TFloatField;
      qryContratosGeracaoPORTFORMAPAG: TFloatField;
      qryContratosGeracaoIDCBANCARIA: TFloatField;
      qryContratosGeracaoDATAASSINATURA: TDateTimeField;
      qryContratosGeracaoDATASITUACAO: TDateTimeField;
      qryContratosGeracaoDATACREDITO: TDateTimeField;
      qryContratosGeracaoDATAPRIMPARC: TDateTimeField;
      qryContratosGeracaoDATACANC: TDateTimeField;
      qryContratosGeracaoVLRCONTRATO: TFloatField;
      qryContratosGeracaoVLRPARCELA: TFloatField;
      qryContratosGeracaoTXJUROS: TFloatField;
      qryContratosGeracaoHMENUMPARCELAS: TFloatField;
      qryContratosGeracaoHMEPARCELA: TFloatField;
      qryContratosGeracaoIDREGRAJURCONC: TFloatField;
      qryContratosGeracaoIDREGRALIMITES: TFloatField;
      qryContratosGeracaoIDREGRASUSPCOBR: TFloatField;
      qryContratosGeracaoIDREGRASLDDIA: TFloatField;
      qryContratosGeracaoIDREGRAJURANTCONC: TFloatField;
      qryContratosGeracaoIDREGRAELEG: TFloatField;
      qryContratosGeracaoIDREGRARESERVA: TFloatField;
      qryContratosGeracaoIDREGRAMARGEM: TFloatField;
      qryContratosGeracaoIDREGRAPRAZOSCONC: TFloatField;
      qryContratosGeracaoDATAINSC: TDateTimeField;
      qryContratosGeracaoDATAULTATUALIZA: TDateTimeField;
      qryContratosGeracaoMOECODIGO: TFloatField;
      qryContratosGeracaoMOESIGLA: TStringField;
      qryBuscaParcela: TwwQuery;
      qryBuscaParcelaIDITEMEMPTMO: TFloatField;
      qryBuscaParcelaHMEPARCELA: TFloatField;
      qryBuscaParcelaHMENUMPARCELAS: TFloatField;
      qryBuscaParcelaHMECENTRALIZA: TFloatField;
      qryBuscaParcelaHMEDESTACADO: TFloatField;
      qryBuscaParcelaHMESALDODEV: TFloatField;
      qryValorBaixadoDoc: TwwQuery;
      qryBuscaItem: TwwQuery;
      qryBuscaItemIDITEMEMPTMO: TFloatField;
      qryUpdateHistMov: TwwQuery;
      qryUpdateTmpDesc: TwwQuery;
      qryValorBaixadoDocVALOR_BAIXADO: TFloatField;
      qryItensCaPCaRVLR_PREVISTO_DOC: TFloatField;
      qryItensCaPCaRIDCONTRATOEMPTMO: TFloatField;
      qryItensCaPCaRCODDOCUMENTO: TFloatField;
      qryUltDataBaixaDoc: TwwQuery;
      qryUltDataBaixaDocDATA_BAIXA: TDateTimeField;
      qryBaixaItensDoc: TwwQuery;
      FloatField1: TFloatField;
      qryItensABaixar: TwwQuery;
      qryItensCaPCaRHMEDATAVENCTO: TDateTimeField;
      qryHistMovIDHISTMOVEMPTMO: TFloatField;
      qryHistMovIDCONTRATOEMPTMO: TFloatField;
      qryHistMovIDITEMEMPTMO: TFloatField;
      qryHistMovHMEANOCOMPETENCIA: TFloatField;
      qryHistMovHMEMESCOMPETENCIA: TFloatField;
      qryHistMovHMEANOCOBRANCA: TFloatField;
      qryHistMovHMEMESCOBRANCA: TFloatField;
      qryHistMovHMETIPOMOV: TFloatField;
      qryHistMovHMEORIGEM: TFloatField;
      qryHistMovHMERECPAG: TStringField;
      qryHistMovHMEFORMACOBRANCA: TStringField;
      qryHistMovHMESEQCOBRANCA: TFloatField;
      qryHistMovIDRUBRICA: TFloatField;
      qryHistMovHMEPRIORIDADE: TFloatField;
      qryHistMovHMEDATAATUALIZA: TDateTimeField;
      qryHistMovHMESALDODEV: TFloatField;
      qryHistMovHMETXJUROS: TFloatField;
      qryHistMovIDREGRA: TFloatField;
      qryHistMovHMEPARCELA: TFloatField;
      qryHistMovHMENUMPARCELAS: TFloatField;
      qryHistMovHMECENTRALIZA: TFloatField;
      qryHistMovHMEDESTACADO: TFloatField;
      qryHistMovIDITEMCENTRALIZA: TFloatField;
      qryHistMovHMEVLRPREVISTO: TFloatField;
      qryHistMovHMEVLREFETIVO: TFloatField;
      qryHistMovHMEDATAPREVISTA: TDateTimeField;
      qryHistMovHMEDATAVENCTO: TDateTimeField;
      qryHistMovHMEDATAEFETIVA: TDateTimeField;
      qryHistMovFLGBAIXADO: TFloatField;
      qryHistMovFLGDIVERGPEND: TFloatField;
      qryHistMovFLGBAIXAMANUAL: TFloatField;
      qryHistMovFLGESTORNADO: TFloatField;
      qryHistMovFLGQUITADO: TFloatField;
      qryHistMovFLGABONADO: TFloatField;
      qryItensABaixarIDHISTMOVEMPTMO: TFloatField;
      qryItensABaixarIDCONTRATOEMPTMO: TFloatField;
      qryItensABaixarIDITEMEMPTMO: TFloatField;
      qryItensABaixarCODDOCUMENTO: TFloatField;
      qryItensABaixarHMEANOCOMPETENCIA: TFloatField;
      qryItensABaixarHMEMESCOMPETENCIA: TFloatField;
      qryItensABaixarHMEANOCOBRANCA: TFloatField;
      qryItensABaixarHMEMESCOBRANCA: TFloatField;
      qryItensABaixarEVENTO: TFloatField;
      qryItensABaixarHMEORIGEM: TFloatField;
      qryItensABaixarHMERECPAG: TStringField;
      qryItensABaixarHMEFORMACOBRANCA: TStringField;
      qryItensABaixarHMESEQCOBRANCA: TFloatField;
      qryItensABaixarIDRUBRICA: TFloatField;
      qryItensABaixarHMEPRIORIDADE: TFloatField;
      qryItensABaixarHMEDATAATUALIZA: TDateTimeField;
      qryItensABaixarHMESALDODEV: TFloatField;
      qryItensABaixarHMETXJUROS: TFloatField;
      qryItensABaixarIDREGRA: TFloatField;
      qryItensABaixarPARCELA: TFloatField;
      qryItensABaixarPARCELAS_RESTANTES: TFloatField;
      qryItensABaixarHMECENTRALIZA: TFloatField;
      qryItensABaixarHMEDESTACADO: TFloatField;
      qryItensABaixarHMEVLRPREVISTO: TFloatField;
      qryItensABaixarHMEVLREFETIVO: TFloatField;
      qryItensABaixarHMEDATAPREVISTA: TDateTimeField;
      qryItensABaixarHMEDATAVENCTO: TDateTimeField;
      qryItensABaixarHMEDATAEFETIVA: TDateTimeField;
      qryItensABaixarFLGBAIXADO: TFloatField;
      qryItensABaixarFLGDIVERGPEND: TFloatField;
      qryItensABaixarFLGBAIXAMANUAL: TFloatField;
      qryItensABaixarFLGESTORNADO: TFloatField;
      qryItensABaixarFLGQUITADO: TFloatField;
      qryItensABaixarFLGABONADO: TFloatField;
      qryItensABaixarIDTIPOCONTREMPTMO: TFloatField;

      procedure molListaPatrobtnInvertePatroClick(Sender: TObject);
      procedure molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure btnContinuarClick(Sender: TObject);
      procedure pgcControleChange(Sender: TObject);


   private // Private declarations

      rConcessao        : TDadosConcessao;
      dDataAtualizacao  : TDateTime;
      rSaldoDevAnt      : TSaldoDevAnt;

      vItens            : TListaItem;

      iPais             : Integer;
      sEstado           : String;
      iCidade           : Integer;

      sDiaSldDev        : String;

      // -------------------------------------------------------------------------------------------
      procedure AbreQueries;
      // -------------------------------------------------------------------------------------------
      procedure AbreCaPCaR(const iPatro   : Int64;
                           const sRecPag  : String
                           );

      function  RecebimentoCaPCar(const iIndicePatro: Integer;
                                  const sRecPag     : String
                                  ): Currency;

      function  RecebeDocumentoCaPCar: Currency;
      function  VlrBaixadoDoc(const iDocumento: Int64): Currency;
      function  UltDataBaixaDoc(const iDocumento: Int64): TDateTime;

      function  BaixaTodosItensDocumento(const iDocumento  : Int64;
                                         const dDataBaixa  : TDateTime;
                                         const bDivergente : Boolean;
                                         const iTipoDiverg : Integer
                                         ): Integer;

      function  ProcessaBaixaParcial(const iDocumento: Int64;
                                     const fVlrBaixa : Currency;
                                     const dDataBaixa: TDateTime
                                     ): Integer;
      // -------------------------------------------------------------------------------------------
      procedure AbreTMPDESC(const iPatro: Int64);
      function  RecebimentoTMPDESC(const iIndicePatro: Integer): Currency;
      function  RecebeParcelaTmpDesc: Currency;

      function  EncontrouRegistro(const IDHist      : Int64;
                                  const IDContrato  : Int64
                                  ): Boolean;

      function  MarcaBaixaTMPDESC(const IDHist      : Int64;
                                  const IDContrato  : Int64
                                  ): Boolean;
      // -------------------------------------------------------------------------------------------
      procedure InsereDiferencaHist(var   qryLocal   : TwwQuery;
                                    const NovosDados : TNovosDados
                                    );
      procedure InsereInesperado(const IDContrato  : Int64;
                                 const IDTipoContr : Int64;
                                 const fVlrInserir : Currency;
                                 const dData       : TDateTime
                                 );
      // -------------------------------------------------------------------------------------------
      function  SelecionaContratosGeracao(const iIDContrato : Int64; const sDataAtualiza : String): Boolean;
      function  ProcessaContratos: boolean;
      procedure AtualizaSaldoDiario(iIDContratoEmptmo : Int64; dDataPrevista : TDateTime);
      function  GeraItensAtu: Boolean;
      function  Contabiliza(const IDContrato : Int64; const sDataAtualiza : String): integer;
      // -------------------------------------------------------------------------------------------


   public // Public declarations

   end;



var
  frmExecRecebimentoNovo: TfrmExecRecebimentoNovo;



implementation
{$R *.DFM}
uses
   USistema,
   UDataBase,
   UMensErro,
   UFuncoesEmptmo,
   FProgresso,
   dBaseDados, uModulo, uVerificaPreenchimento, DLookEmptmo, dMS, uIntegraEmptmo,
   DEmptmo, uDiasUteis, UCalcEmptmo;




procedure TfrmExecRecebimentoNovo.AbreQueries;
begin
   // Tipo de Empréstimo
   with dtmLookEmptmo.qryLookTipoEmptmo do
   begin
      LimpaParametros(dtmLookEmptmo.qryLookTipoEmptmo);
      ParamByName('PIDEMPRESAPROP').AsInteger := Sistema.IDEmpresa;
      Open;
   end;
end;



function TfrmExecRecebimentoNovo.RecebimentoCaPCar(const iIndicePatro: Integer;
                                                   const sRecPag     : String
                                                   ): Currency;
var
   iContador      : Integer;
   fValor         : Currency;
   fValorPatro    : Currency;
   sTextoRecPag   : String;
begin
   try
      fValorPatro := 0;

      if chkCaP.Checked then
      begin
         case sRecPag[1] of
            'P': sTextoRecPag := 'a Pagar';
            'R': sTextoRecPag := 'a Receber';
         end;

         MostraEspera('Verificando valores do Financeiro (' + sTextoRecPag + ') ...');

         AbreCaPCar(molListaPatro.vIDPatro[iIndicePatro], sRecPag);

         EscondeEspera;

         MostraFormProgresso('Realizando Recebimentos do Financeiro (' + sTextoRecPag + ') ' +
                             molListaPatro.lstPatro.Items[iIndicePatro] +
                             '...', 0, qryItensCaPCaR.RecordCount, True, True);

         iContador   := 0;
         // ----------------------------------------------------------------------------------
         while not(qryItensCaPCaR.EOF) do
         begin
            if frmProgresso.Cancelou then Break; // interrompeu o processo

            if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

            try
               fValor := RecebeDocumentoCaPCar;

               // ----------------------------------------------------------------------------
               //    Tratamento de Quitação Contratual (recebimento do último item em aberto)
               // ----------------------------------------------------------------------------

               if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
            except
               if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
            end;

            // Totalizador
            fValorPatro := fValorPatro + fValorPatro;

            qryItensCaPCaR.Next;

            inc(iContador);
            AndaFormProgresso(iContador);
         end; // while not(EOF)
         // ----------------------------------------------------------------------------------
      end;

   finally
      EscondeFormProgresso;

      Result := fValorPatro;

      qryItensCaPCaR.Close;
   end;
end;



procedure TfrmExecRecebimentoNovo.AbreCaPCaR(const iPatro: Int64; const sRecPag: String);
begin
   with qryItensCaPCaR do
   begin
      LimpaParametros(qryItensCaPCaR);
      ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      ParamByName('PIDPATRO').AsInteger         := iPatro;
      ParamByName('PHMERECPAG').AsString        := sRecPag;
      ParamByName('PHMEANOCOBRANCA').AsInteger  := trunc(DBspnAno.Value);
      ParamByName('PHMEMESCOBRANCA').AsInteger  := (cboMes.ItemIndex + 1);


      if DBcboTipoEmptmo.LookupValue <> ''   then ParamByName('PIDTIPOEMPTMO').AsInteger        := StrToInt(DBcboTipoEmptmo.LookupValue);
      if DBcboTipoContrato.LookupValue <> '' then ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := StrToInt(DBcboTipoContrato.LookupValue);
      if molMutuario.iParticipante > 0       then ParamByName('PIDPESSOA').AsInteger            := molMutuario.iParticipante;
      if molContratoEmptmo.IDContrato > 0    then ParamByName('PIDDESCONTO').AsInteger          := molContratoEmptmo.IDContrato;

      Open;
   end;
end;



function TfrmExecRecebimentoNovo.RecebeDocumentoCaPCar: Currency;
Var
   iContrato      : Int64;
   fVlrDocumento  : Currency;
   fVlrReceber    : Currency;
   fVlrRecebido   : Currency;
   dDataBaixa     : TDateTime;
begin
   Result         := 0;

   // Guarda os dados do registro processado
   iContrato      := qryItensCaPCaRIDCONTRATOEMPTMO.AsInteger;
   fVlrDocumento  := qryItensCaPCaRVLR_PREVISTO_DOC.AsCurrency;
   fVlrReceber    := 0;
   fVlrRecebido   := 0;

   // Verifica o valor baixado no Documento
   fVlrReceber    := VlrBaixadoDoc(qryItensCaPCaRCODDOCUMENTO.AsInteger);

   // Se o valor baixado for ZERO, sai (e vai para o próximo)
   // obs:  é possível que um Documento tenha status = '2' (baixado),
   //       mas o valor efetivamente baixado seja ZERO
   if Arredonda(fVlrReceber, 2) = 0 then Exit;

   // Se houve recebimento, verifica a data de baixa
   dDataBaixa     := UltDataBaixaDoc(qryItensCaPCaRCODDOCUMENTO.AsInteger);

   // Verifica se o valor baixado do Documento corresponde ao esperado
   if Arredonda(fVlrReceber, 2) = Arredonda(fVlrDocumento, 2) then
   begin
      // Baixa todos os itens de uma só vez
      if dDataBaixa <= qryItensCaPCaRHMEDATAVENCTO.AsDateTime then
      begin
         // ----------------------------------------------------------------------------------------
         // Baixa sem divergência
         // ----------------------------------------------------------------------------------------
         BaixaTodosItensDocumento(qryItensCaPCaRCODDOCUMENTO.AsInteger,
                                  dDataBaixa,
                                  False,  // bDivergente
                                  0       // tipo de divergência (nesse caso não importa)
                                  );
         // ----------------------------------------------------------------------------------------
      end
      else // if dDataBaixa <= qryItensCaPCaRHMEDATAVENCTO.AsDateTime
      begin
         // ----------------------------------------------------------------------------------------
         // Baixa com divergência de datas
         // ----------------------------------------------------------------------------------------
         BaixaTodosItensDocumento(qryItensCaPCaRCODDOCUMENTO.AsInteger,
                                  dDataBaixa,
                                  True,   // bDivergente
                                  5       // divergência de datas
                                  );
         // ----------------------------------------------------------------------------------------
      end; // if dDataBaixa <= qryItensCaPCaRHMEDATAVENCTO.AsDateTime
   end
   else // if Arredonda(fVlrReceber, 2) = Arredonda(fVlrDocumento, 2)
   begin
      // -------------------------------------------------------------------------------------------
      //    Processamento de baixa Parcial
      // -------------------------------------------------------------------------------------------

      ProcessaBaixaParcial(qryItensCaPCaRCODDOCUMENTO.AsInteger, fVlrDocumento, dDataBaixa);

      // -------------------------------------------------------------------------------------------
   end; // if Arredonda(fVlrReceber, 2) = Arredonda(fVlrDocumento, 2)
end;



function TfrmExecRecebimentoNovo.ProcessaBaixaParcial(const iDocumento: Int64;
                                                      const fVlrBaixa : Currency;
                                                      const dDataBaixa: TDateTime
                                                      ): Integer;
var
   bBaixado          : Boolean;
   bDivergente       : Boolean;
   bDivergTrat       : Boolean;
   iTipoDiverg       : Integer;
   fVlrRestante      : Currency;
   fVlrEfetivo       : Currency;
   fDiferenca        : Currency;
   NovosDadosParcela : TNovosDados;
begin
   // inicializa o valor restante com o valor baixado no Documento
   fVlrRestante   := fVlrBaixa;

   // seleciona os itens (na HistMovEmptmo) que compõem o Documento
   with qryItensABaixar do
   begin
      LimpaParametros(qryItensABaixar);
      ParamByName('PCODDOCUMENTO').AsInteger := iDocumento;
      Open;
   end;

   qryItensABaixar.First;
   while not(qryItensABaixar.EOF) do
   begin
      // -------------------------------------------------------------------------------------------
      //    Baixa item a item, subtraindo do valor restante a baixar
      // -------------------------------------------------------------------------------------------

      bBaixado       := False;
      bDivergente    := False;
      bDivergTrat    := False;
      iTipoDiverg    := -1;

      // enquanto houver valor restante, haverá valor a baixar
      if fVlrRestante > 0 then
      begin
         bBaixado    := True;    // haverá valor recebido

         if fVlrRestante < abs(qryItensABaixarHMEVLRPREVISTO.AsCurrency) then
         begin
            bDivergTrat := True;    // será considerada tratada pq há inserção da diferença
            iTipoDiverg := 3;       // valor menor que o esperado

            fVlrEfetivo := fVlrRestante;
            fDiferenca  := abs(qryItensABaixarHMEVLRPREVISTO.AsCurrency) - fVlrRestante;

            // se o item já era negativo, a diferença também deve ser
            if qryItensABaixarHMEVLRPREVISTO.AsCurrency < 0 then fDiferenca := fDiferenca * (-1);

            // -------------------------------------------------------------------------------------
            //    Inserção da Diferença
            // -------------------------------------------------------------------------------------

            // Prepara os dados para inserção da diferença no Histórico
            NovosDadosParcela.Valor          := fDiferenca;
            NovosDadosParcela.IDItemEmptmo   := qryItensABaixarIDITEMEMPTMO.AsInteger;
            NovosDadosParcela.FlgBaixado     := 0;
            NovosDadosParcela.FlgDivergPend  := 1;
            NovosDadosParcela.FlgTipoDiverg  := iTipoDiverg;
            NovosDadosParcela.AnoCompetencia := qryItensABaixarHMEANOCOMPETENCIA.AsInteger;
            NovosDadosParcela.MesCompetencia := qryItensABaixarHMEMESCOMPETENCIA.AsInteger;
            NovosDadosParcela.AnoCobranca    := qryItensABaixarHMEANOCOBRANCA.AsInteger;
            NovosDadosParcela.MesCobranca    := qryItensABaixarHMEMESCOBRANCA.AsInteger;
            NovosDadosParcela.DataPrevista   := qryItensABaixarHMEDATAPREVISTA.AsDateTime;
            NovosDadosParcela.DataVencto     := qryItensABaixarHMEDATAVENCTO.AsDateTime;

            // Inclui diferença a receber no Historico
            InsereDiferencaHist(qryItensABaixar, NovosDadosParcela);

            // -------------------------------------------------------------------------------------
         end
         else  // if fVlrRestante < abs(qryItensABaixarHMEVLRPREVISTO.AsCurrency)
         begin
            // o valor restante é maior ou igual ao valor previsto
            bDivergente := False;

            fVlrEfetivo := qryItensABaixarHMEVLRPREVISTO.AsCurrency;

         end;  // if fVlrRestante < abs(qryItensABaixarHMEVLRPREVISTO.AsCurrency)
         // ----------------------------------------------------------------------------------------
      end
      else // if fVlrRestante > 0
      begin
         // fVlrRestante <= 0
         // não há mais valor restante no documento
         bBaixado       := False;
         bDivergente    := True;
         bDivergTrat    := False;
         iTipoDiverg    := 6;       // Valor não será recebido
      end; // if fVlrRestante > 0


      // -------------------------------------------------------------------------------------------
      //    Baixa do Item
      // -------------------------------------------------------------------------------------------
      with qryUpdateHistMov do
      begin
         LimpaParametros(qryUpdateHistMov);
         ParamByName('PIDCONTRATOEMPTMO').AsInteger      := qryItensABaixarIDCONTRATOEMPTMO.AsInteger;
         ParamByName('PIDHISTMOVEMPTMO').AsInteger       := qryItensABaixarIDHISTMOVEMPTMO.AsInteger;

         if bBaixado then
         begin
            ParamByName('PFLGRECEBIMENTO').AsInteger     := 0;
            ParamByName('PHMEDATAEFETIVA').AsDateTime    := dDataBaixa;
            ParamByName('PHMEVLREFETIVO').AsCurrency     := fVlrEfetivo;

            // se for devolução, inverte o sinal do valor efetivo
            if qryItensABaixarHMEVLRPREVISTO.AsCurrency < 0 then ParamByName('PHMEVLREFETIVO').AsCurrency := fVlrEfetivo * (-1);
         end
         else // if bBaixado
         begin
            ParamByName('PFLGBAIXADO').AsInteger         := 0;
         end;

         if bDivergente then
         begin
            ParamByName('PFLGDIVERGPEND').AsInteger      := 1;
            if iTipoDiverg > 0 then ParamByName('PFLGTIPODIVERG').AsInteger   := iTipoDiverg;
         end;

         if bDivergTrat then
         begin
            ParamByName('PFLGDIVERGTRAT').AsInteger      := 1;
            if iTipoDiverg > 0 then ParamByName('PFLGTIPODIVERG').AsInteger   := iTipoDiverg;
         end;

         // só grava divergente/tratado se não for quitação tampouco amortização
         qryUpdateHistMov.ExecSQL;
      end;
      // -------------------------------------------------------------------------------------------
      //    FIM da Baixa do Item
      // -------------------------------------------------------------------------------------------

      // Abate do valor restante o valor do item atual
      fVlrRestante := fVlrRestante - abs(qryItensABaixarHMEVLRPREVISTO.AsCurrency);

      qryItensABaixar.Next
      // -------------------------------------------------------------------------------------------
   end; // while not(qryItensABaixar.EOF)


   // Se, terminados os itens do Documento, ainda houver algum valor a baixar...
   if fVlrRestante > 0 then
   begin
      // -------------------------------------------------------------------------------------------
      //    Tratamento para recebimento "inesperado"
      // ---------------------------------------------------------------------------------------
      InsereInesperado(qryTmpDescIDDESCONTO.AsInteger,
                       qryTmpDescIDTIPOCONTREMPTMO.AsInteger,
                       fVlrRestante,
                       dDataBaixa
                       );
      // ---------------------------------------------------------------------------------------
   end;
end;



function TfrmExecRecebimentoNovo.VlrBaixadoDoc(const iDocumento: Int64): Currency;
begin
   try
      try
         with qryValorBaixadoDoc do
         begin
            LimpaParametros(qryValorBaixadoDoc);
            ParamByName('PCODDOCUMENTO').AsInteger := iDocumento;
            Open;

            if IsEmpty then
            begin
               Result := 0;
            end
            else // if IsEmpty
            begin
               Result := qryValorBaixadoDocVALOR_BAIXADO.AsCurrency;
            end;

            Close;
         end;

      except
         Result := 0;
      end;

   finally
      qryValorBaixadoDoc.Close;
   end;
end;



function TfrmExecRecebimentoNovo.UltDataBaixaDoc(const iDocumento: Int64): TDateTime;
begin
   try
      try
         with qryUltDataBaixaDoc do
         begin
            LimpaParametros(qryUltDataBaixaDoc);
            ParamByName('PCODDOCUMENTO').AsInteger := iDocumento;
            Open;

            if IsEmpty then
            begin
               Result := 0;
            end
            else
            begin
               Result := qryUltDataBaixaDocDATA_BAIXA.AsDateTime;
            end;

            Close;
         end;

      except
         Result := 0;
      end;

   finally
      qryUltDataBaixaDoc.Close;
   end;
end;



function TfrmExecRecebimentoNovo.BaixaTodosItensDocumento(const iDocumento  : Int64;
                                                          const dDataBaixa  : TDateTime;
                                                          const bDivergente : Boolean;
                                                          const iTipoDiverg : Integer
                                                          ): Integer;
begin
   try
      with qryBaixaItensDoc do
      begin
         LimpaParametros(qryBaixaItensDoc);
         ParamByName('PCODDOCUMENTO').AsInteger       := iDocumento;
         ParamByName('PHMEDATAEFETIVA').AsDate        := dDataBaixa;

         if bDivergente then
         begin
            ParamByName('PFLGDIVERGPEND').AsInteger   := 1;
            ParamByName('PFLGTIPODIVERG').AsInteger   := iTipoDiverg;
         end; // bDivergente

         ExecSQL;

         Result := RowsAffected;
      end;

   except
      Result := -1;
   end;
end;



function TfrmExecRecebimentoNovo.RecebimentoTMPDESC(const iIndicePatro: Integer): Currency;
var
   iContador   : Integer;
   fValor      : Currency;
   fValorPatro : Currency;
begin
   try
      fValorPatro := 0;
      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
      if (chkFolhaPatro.Checked) or (chkFolhaBenef.Checked) then
      begin
         AbreTMPDESC(molListaPatro.vIDPatro[iIndicePatro]);

         MostraFormProgresso('Realizando Recebimentos Folha ' +
                             molListaPatro.lstPatro.Items[iIndicePatro] +
                             '...', 0, qryTmpDesc.RecordCount, True, True);

         iContador   := 0;
         // ----------------------------------------------------------------------------------------
         while not(qryTmpDesc.EOF) do
         begin
            if frmProgresso.Cancelou then Break; // interrompeu o processo

            if not(dtmBaseDados.dbBaseDados.InTransaction) then StartTransacao;

            try
               fValor := RecebeParcelaTmpDesc;

               if dtmBaseDados.dbBaseDados.InTransaction then CommitTransacao;
            except
               if dtmBaseDados.dbBaseDados.InTransaction then RollbackTransacao;
            end;

            // Totalizador
            fValorPatro := fValorPatro + fValor;

            inc(iContador);
            AndaFormProgresso(iContador);

            qryTmpDesc.Next;
         end; // while not(EOF)
         // ----------------------------------------------------------------------------------------
      end;
      // -------------------------------------------------------------------------------------------
      // -------------------------------------------------------------------------------------------
   finally
      EscondeFormProgresso;
      Result := fValorPatro;

      qryTmpDesc.Close;
   end;
end;



procedure TfrmExecRecebimentoNovo.AbreTMPDESC(const iPatro: Int64);
var
   sTipoFolha  : String;
   iTipoFolha  : integer;
begin
   // Filtro por tipo de Folha (Benefícios / Patrocinadora) ----------------------------------------

   sTipoFolha := '';

   if chkFolhaPatro.Checked then
   begin
      if chkFolhaBenef.Checked then
      begin
         sTipoFolha := QuotedStr('B') + ',' + QuotedStr('P');
         iTipoFolha := -1;
      end
      else
      begin
         sTipoFolha := QuotedStr('P');
         iTipoFolha := 1;
      end;
   end
   else
   begin
      if chkFolhaBenef.Checked then sTipoFolha := QuotedStr('B');
      iTipoFolha := 2;
   end;

   // ----------------------------------------------------------------------------------------------

   with qryTmpDesc do
   begin
      LimpaParametros(qryTmpDesc);

      ParamByName('PIDEMPRESAPROP').AsInteger   := Sistema.IDEmpresa;
      ParamByName('PMESCOBRANCA').AsString      := FormatFloat('0000', DBspnAno.Value) + '/' +
                                                   FormatFloat('00', cboMes.ItemIndex + 1);

      ParamByName('PIDPESSJUR').AsInteger       := iPatro;

      if DBcboTipoEmptmo.LookupValue <> ''   then ParamByName('PIDTIPOEMPTMO').AsInteger        := StrToInt(DBcboTipoEmptmo.LookupValue);
      if DBcboTipoContrato.LookupValue <> '' then ParamByName('PIDTIPOCONTREMPTMO').AsInteger   := StrToInt(DBcboTipoContrato.LookupValue);

      if iTipoFolha > 0                      then ParamByName('PFLGDESCFOLHA').AsInteger        := iTipoFolha;
      if chkDiverg.Checked                   then ParamByName('PSITENVIO').AsInteger            := 2;
      if molContratoEmptmo.IDContrato > 0    then ParamByName('PIDDESCONTO').AsInteger          := molContratoEmptmo.IDContrato;
      if molMutuario.iParticipante > 0       then ParamByName('PIDPESSOA').AsInteger            := molMutuario.iParticipante;

      Open;
   end; // with qryTmpDesc
end;



// Executa o recebimento de uma Parcela de Emprestimo enviada para TMPDESC
function TfrmExecRecebimentoNovo.RecebeParcelaTmpDesc: Currency;
var
   NovosDadosParcela                : TNovosDados;

   IDHistMov, IDContrato            : Int64;
   IDMutuario, IDRubrica            : Int64;

   iPlanilha, iDocumento            : Int64;

   fVlrPrevisto, fVlrEfetivo        : Currency;
   fVlrPrevistoHist                 : Currency;
   fDiferenca                       : Currency;

   bInesperado, bBaixado            : Boolean;
   bDivergente, bDivergTrat         : Boolean;

   iEvento, iTipoDiverg             : Integer;

   dDataEfetiva                     : TDateTime;

   sMsg                             : String;
   sSituacaoContrato                : String;
   sMesCobranca, sMesReferencia     : String;

   iAnoCobranca, iAnoCompetencia    : Integer;
   iMescobranca, iMesCompetencia    : Integer;
begin
   // ----------------------------------------------------------------------------------------------
{
   // A verificação abaixo já foi feita na qryTMPDESC

   // 1º - Verifica se houve valor recebido.
   // Não havendo, sai...
   if ( (qryTmpDescSITENVIO.AsString = 0) or (qryTmpDescVALORRECEBIDO.IsNull) ) then Exit;
}

   // ----------------------------------------------------------------------------------------------

   // Guarda os dados
   IDHistMov         := qryTmpDescORDEM.AsInteger;
   IDContrato        := qryTmpDescIDDESCONTO.AsInteger;
   IDMutuario        := qryTmpDescIDPESSOA.AsInteger;

   sMesCobranca      := qryTmpDescMESCOBRANCA.AsString;
   iAnoCobranca      := StrToInt(Copy(sMesCobranca, 1, 4));
   iMesCobranca      := StrToInt(Copy(sMesCobranca, 6, 2));

   sMesReferencia    := qryTmpDescMESREFERENCIA.AsString;
   iAnoCompetencia   := StrToInt(Copy(sMesReferencia, 1, 4));
   iMesCompetencia   := StrToInt(Copy(sMesReferencia, 6, 2));

   IDRubrica         := qryTmpDescIDPROVENTO.AsInteger;

   fVlrPrevisto      := qryTmpDescVALOR.AsCurrency;
   fVlrEfetivo       := qryTmpDescVALORRECEBIDO.AsCurrency;

   sSituacaoContrato := qryTmpDescFLGSITUACAO.AsString;

   iTipoDiverg       := -1;
   bDivergente       := False;
   bDivergTrat       := False;

   // ----------------------------------------------------------------------------------------------

   // 2º - Verifica se o valor a receber é esperado ou não (campo ORDEM)
   if qryTmpDescORDEM.isNull then
   begin
      // Recebimento não esperado
      bInesperado := True;
   end
   else
   begin
      // 2º - Verifica se o valor a receber é esperado ou não (procurando o registro na HistMovEmptmo)
      if EncontrouRegistro(IDHistMov, IDContrato) then
      begin
         bInesperado := False;

         fVlrPrevistoHist  := qryHistMovHMEVLRPREVISTO.AsCurrency;
         iEvento           := qryHistMovHMETIPOMOV.AsInteger;

         // Verifica se o registro já foi baixado (manualmente ou não) ou se já foi abonado
         // "quitado" não se aplica aqui, pois implica em devolução
         if ( ((qryHistMovFLGBAIXAMANUAL.IsNull) or (qryHistMovFLGBAIXAMANUAL.AsInteger = 0)) and
              ((qryHistMovFLGABONADO.IsNull) or (qryHistMovFLGABONADO.AsInteger = 0)) and
              (qryHistMovHMEVLREFETIVO.IsNull) ) then
         begin
            // Recebimento "normal" (enviado pelo Empréstimo)

            // 3º - Verifica a situação na TMPDESC (há 3 possibilidades):
            //    (a) valor recebido ZERO
            //    (b) valor recebido = valor enviado
            //    (c) valor recebido <> valor enviado


            // (a) Valor recebido ZERO
            if fVlrEfetivo = 0 then
            begin
               bBaixado       := False;
               bDivergente    := True;
               bDivergTrat    := False;
               iTipoDiverg    := 6;       // Valor não será recebido
            end
            else
            begin
               // (b) Valor recebido = valor enviado
               // NADA a fazer (só o update na Hist)

               bBaixado       := True;
               bDivergente    := False;
               dDataEfetiva   := qryHistMovHMEDATAVENCTO.AsDateTime;

               // (c) Valor recebido <> valor enviado
               if fVlrEfetivo <> fVlrPrevisto then
               begin
                  bDivergTrat    := True;

                  if fVlrEfetivo < fVlrPrevisto then iTipoDiverg := 3;    // valor menor que o esperado
                  if fVlrEfetivo > fVlrPrevisto then iTipoDiverg := 4;    // valor maior que o esperado

                  fDiferenca  := fVlrPrevisto - fVlrEfetivo;

                  // se for devolução
                  if fVlrPrevistoHist < 0 then fDiferenca := fDiferenca * (-1);

                  // -------------------------------------------------------------------------------

                  // Prepara os dados para inserção da diferença no Histórico
                  NovosDadosParcela.Valor          := fDiferenca;
                  NovosDadosParcela.IDItemEmptmo   := qryHistMovIDITEMEMPTMO.AsInteger;
                  NovosDadosParcela.FlgBaixado     := 0;
                  NovosDadosParcela.FlgDivergPend  := 1;
                  NovosDadosParcela.FlgTipoDiverg  := iTipoDiverg;
                  NovosDadosParcela.AnoCompetencia := qryHistMovHMEANOCOMPETENCIA.AsInteger;
                  NovosDadosParcela.MesCompetencia := qryHistMovHMEMESCOMPETENCIA.AsInteger;
                  NovosDadosParcela.AnoCobranca    := qryHistMovHMEANOCOBRANCA.AsInteger;
                  NovosDadosParcela.MesCobranca    := qryHistMovHMEMESCOBRANCA.AsInteger;
                  NovosDadosParcela.IdRubrica      := qryHistMovIDRUBRICA.AsInteger;
                  NovosDadosParcela.DataPrevista   := qryHistMovHMEDATAPREVISTA.AsDateTime;
                  NovosDadosParcela.DataVencto     := qryHistMovHMEDATAVENCTO.AsDateTime;

                  // Inclui diferença a receber no Historico
                  InsereDiferencaHist(qryHistMov, NovosDadosParcela);

                  // -------------------------------------------------------------------------------

               end; // if fValorEfetivo <> fValorPrevisto

            end; // if fValorEfetivo = 0


            // -------------------------------------------------------------------------------------
            //    Update do Histórico e da TMPDESC (registro sendo processado)
            // -------------------------------------------------------------------------------------

            with qryUpdateHistMov do
            begin
               LimpaParametros(qryUpdateHistMov);
               ParamByName('PIDCONTRATOEMPTMO').AsInteger      := IDContrato;
               ParamByName('PIDHISTMOVEMPTMO').AsInteger       := IDHistMov;

               if bBaixado then
               begin
                  ParamByName('PFLGRECEBIMENTO').AsInteger     := 0;
                  ParamByName('PHMEDATAEFETIVA').AsDateTime    := dDataEfetiva;
                  ParamByName('PHMEVLREFETIVO').AsCurrency     := fVlrEfetivo;

                  // se for devolução, inverte o sinal do valor efetivo
                  if fVlrPrevistoHist < 0 then ParamByName('PHMEVLREFETIVO').AsCurrency   := fVlrEfetivo * (-1);
               end
               else
               begin
                  ParamByName('PFLGBAIXADO').AsInteger         := 0;
               end;

               // só grava divergente/tratado se não for quitação tampouco amortização
//               if (iEvento <> 2) and (iEvento <> 3) then
//               begin
               if bDivergente then
               begin
                  ParamByName('PFLGDIVERGPEND').AsInteger   := 1;
                  if iTipoDiverg > 0 then ParamByName('PFLGTIPODIVERG').AsInteger   := iTipoDiverg;
               end;

               if bDivergTrat then
               begin
                  ParamByName('PFLGDIVERGTRAT').AsInteger   := 1;
                  if iTipoDiverg > 0 then ParamByName('PFLGTIPODIVERG').AsInteger   := iTipoDiverg;
               end;
//               end;

               if bBaixado then ExecSQL;

               // só grava divergente/tratado se não for quitação tampouco amortização
//               if (bBaixado) or ((iEvento <> 2) and (iEvento <> 3)) then ExecSQL;
            end;

            // -------------------------------------------------------------------------------------
            //    FIM Update do Histórico e da TMPDESC (registro sendo processado)
            // -------------------------------------------------------------------------------------



            // -------------------------------------------------------------------------------------
            //    Tratamento de Quitação Contratual (recebimento do último item em aberto)
            // -------------------------------------------------------------------------------------

            // só faz a verificação em caso de baixa total e se o contrato estiver encerrado
            // e se não for amortização / quitação
            if (bBaixado)
               and (fVlrEfetivo = fVlrPrevisto)
               and (iEvento <> 2) and (iEvento <> 3)
               and ((sSituacaoContrato = 'E') or (sSituacaoContrato = 'K')) then
            begin
               // se o Contrato em questão não possuir mais itens em aberto, é marcado como "quitado"
               if not(CalcEmptmo.ExistemItensEmAberto(IDContrato)) then
               begin
                  CalcEmptmo.AtualizaFlgSituacao(IDCONTRATO, 'CONTRATOEMPTMO', 'Q', sMsg);
               end;
            end;

            // -------------------------------------------------------------------------------------
            //    FIM Tratamento de Quitação Contratual (recebimento do último item em aberto)
            // -------------------------------------------------------------------------------------



            // -------------------------------------------------------------------------------------
            //    Tratamento de Quitação Contratual (item de quitação)
            // -------------------------------------------------------------------------------------

            // É preciso criar um parâmetro para definir se um não recebimento de quitação deve
            // fazer com que a quitação seja desfeita
            // pensar também na situação em que um recebimento de quitação ocorrer de forma parcial
            //
            // No momento, só se aceita recebimento TOTAL da quitação
            if iEvento = 3 then
            begin
               // Houve baixa total do registro de recebimento
               // apenas marca
               if (bBaixado) and (fVlrEfetivo = fVlrPrevisto) then
               begin

                  CalcEmptmo.AtualizaFlgSituacao(IDContrato, 'CONTRATOEMPTMO', 'Q', sMsg);

               end else begin

                  // Houve recebimento parcial ou nenhum do item de quitação
                  // é necessário cancelar a quitação e voltar o contrato para 'A'

                  // Pega o contrato no historico de contrato e verifica se ta vazio
                  ParametrosSistema;
                  if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
                  begin
                     dtmEmptmo.AbreHistMov(qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsInteger,
                                           3,  // evento 3  = quitação
                                           -1, // origem -1 = qualquer (<> 10)
                                           qryHistMov.FieldByName('HMEDATAPREVISTA').AsDateTime);

                     // todos os registro de quitação estão em uma única planilha
                     iPlanilha  := dtmEmptmo.qryHistoricoMovPLNCODIGO.AsInteger;
                     iDocumento := dtmEmptmo.qryHistoricoMovCODDOCUMENTO.AsInteger;

                     // Deleta Historico | 3 = Quitação
                     dtmEmptmo.ExcHistContrato(qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsInteger,
                                               3,  // evento 3  = quitação
                                               -1, // origem -1 = qualquer uma
                                               qryHistMov.FieldByName('HMEDATAPREVISTA').AsDateTime);

                     // Desmarca os itens quitados
                     CalcEmptmo.DesMarcaItensQuitados(qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsInteger, sysdate);

                     // Exclui CaP/CaR se necessario
                     IntegraEmptmo.ExcluiFinanceiro(iDocumento,sMsg);

                     // Exclui Folha se necessario
                     dtmEmptmo.ExcFolha;

                     // Exclui Contabilidade
                     IntegraEmptmo.ExcluiContabil(iPlanilha,sMsg);

                     CalcEmptmo.AtualizaFlgSituacao(qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsInteger,'CONTRATOEMPTMO','A',sMsg);

                     // Faz Atualização Diária de débitos
                     if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
                     begin
                        AtualizaSaldoDiario(qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsInteger, qryHistMov.FieldByName('HMEDATAPREVISTA').AsDateTime);
                     end;

                     dtmEmptmo.qryHistoricoMov.Close;

                  end
                  else // if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1
                  begin
                     if (bBaixado) and (fVlrEfetivo <> fVlrPrevisto) then
                     begin
                        CalcEmptmo.AtualizaFlgSituacao(IDContrato, 'CONTRATOEMPTMO', 'K', sMsg);
                     end;
                  end; // if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1
               end; // if (bBaixado) and (fVlrEfetivo = fVlrPrevisto)
            end; // if iEvento = 3

            // -------------------------------------------------------------------------------------
            //    FIM Tratamento de Quitação Contratual (item de quitação)
            // -------------------------------------------------------------------------------------


            // -------------------------------------------------------------------------------------
            //    Tratamento de Amortização
            // -------------------------------------------------------------------------------------

            if iEvento = 2 then
            begin
               // Houve baixa total do registro de recebimento
               // apenas marca
               if (bBaixado) and (fVlrEfetivo = fVlrPrevisto) then
               begin
                  // Não faz nada
               end
               else
               begin
                  // Houve recebimento parcial ou nenhum do item de quitação
                  // é necessário cancelar a quitação e voltar o contrato para 'A'

                  // Pega o contrato no historico de contrato e verifica se ta vazio
                  ParametrosSistema;
                  if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
                  begin
                     dtmEmptmo.AbreHistMov(qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsInteger,
                                           2,  // evento 2  = amortização
                                           -1, // origem -1 = qualquer (<> 10)
                                           qryHistMov.FieldByName('HMEDATAPREVISTA').AsDateTime);

                     // todos os registro de quitação estão em uma única planilha
                     iPlanilha  := dtmEmptmo.qryHistoricoMovPLNCODIGO.AsInteger;
                     iDocumento := dtmEmptmo.qryHistoricoMovCODDOCUMENTO.AsInteger;

                     // Deleta Historico | 3 = Quitação
                     dtmEmptmo.ExcHistContrato(qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsInteger,
                                               2,  // evento 2  = amortização
                                               -1, // origem -1 = qualquer uma
                                               qryHistMov.FieldByName('HMEDATAPREVISTA').AsDateTime);


                     // Exclui CaP/CaR se necessario
                     IntegraEmptmo.ExcluiFinanceiro(iDocumento,sMsg);

                     // Exclui Folha se necessario
                     dtmEmptmo.ExcFolha;

                     // Exclui Contabilidade
                     IntegraEmptmo.ExcluiContabil(iPlanilha,sMsg);

                     // Faz Atualização Diária de débitos
                     if dtmEmptmo.qryParamEmptmoFLGCALCDIA.AsInteger = 1 then
                     begin
                        AtualizaSaldoDiario(qryHistMov.FieldByName('IDCONTRATOEMPTMO').AsInteger, qryHistMov.FieldByName('HMEDATAPREVISTA').AsDateTime);
                     end;

                     dtmEmptmo.qryHistoricoMov.Close;
                  end;
               end;

            end;

            // -------------------------------------------------------------------------------------
            //    FIM Tratamento de Amortização
            // -------------------------------------------------------------------------------------

         end
         else
         begin

            // Deve apenas fazer SITENVIO = '9'

         end; // if flgBaixaManual


      end
      else
      begin
         // Recebimento não esperado
         bInesperado := True;

      end; // if EncontrouRegistro

   end; // if qryTmpDescORDEM.isNull


   // ----------------------------------------------------------------------------------------------
   //    Update da TMPDESC (registro sendo processado)
   // ----------------------------------------------------------------------------------------------

   with qryUpdateTMPDESC do
   begin
      LimpaParametros(qryUpdateTMPDESC);
      ParamByName('PIDDESCONTO').AsInteger   := IDContrato;
      ParamByName('PORDEM').AsInteger        := IDHistMov;
      ExecSQL;
   end;

   // ----------------------------------------------------------------------------------------------
   //    FIM Update da TMPDESC (registro sendo processado)
   // ----------------------------------------------------------------------------------------------



   // ----------------------------------------------------------------------------------------------
   //    Tratamento do recebimento inesperado
   // ----------------------------------------------------------------------------------------------

   // Não dá para usar a InserDiferencaHist pq a função se baseia em uma linha pré-exixtente
   // da HistMovEmptmo. Como se está querendo inserir um registro totalmente novo, é necessário
   // inicializar TODOS os campos necessários.
   if bInesperado then InsereInesperado(qryTmpDescIDDESCONTO.AsInteger,
                                        qryTmpDescIDTIPOCONTREMPTMO.AsInteger,
                                        qryTmpDescVALORRECEBIDO.AsCurrency,
                                        qryTmpDescDATARECEBIMENTO.AsDateTime
                                        );
   // ----------------------------------------------------------------------------------------------
   //    FIM Tratamento do recebimento inesperado
   // ----------------------------------------------------------------------------------------------

   Result := fVlrEfetivo;
end;



procedure TfrmExecRecebimentoNovo.InsereInesperado(const IDContrato  : Int64;
                                                   const IDTipoContr : Int64;
                                                   const fVlrInserir : Currency;
                                                   const dData       : TDateTime
                                                   );
var
   rItem             : TItemRecDep;
   rContrato         : TDadosContrato;
   IDHistMovEmptmo   : Int64;
begin
   // *******************************************************************************************
   //
   // Não dá para usar a InserDiferencaHist pq a função se baseia em uma linha pré-exixtente
   // da HistMovEmptmo. Como se está querendo inserir um registro totalmente novo, é necessário
   // inicializar TODOS os campos necessários.
   //
   // Serão necessários também DOIS inserts na HistMovEmptmo:
   //    - o recebimento inesperado (baixado);
   //    - a devolução do valor inesperado (previsto);
   //
   // *******************************************************************************************

   LimpaRegistro(rItem);

   // Busca o item para gravar na HISTMOVEMPTMO
   with qryBuscaParcela do
   begin
      LimpaParametros(qryBuscaParcela);
      ParamByName('PIDCONTRATOEMPTMO').AsInteger := IDContrato;
      Open;
   end;


   // preenche os campos necessários
   rItem.CodigoItem     := qryBuscaParcelaIDITEMEMPTMO.AsInteger;
   rItem.Parcela        := qryBuscaParcelaHMEPARCELA.AsInteger;
   rItem.ParcResta      := qryBuscaParcelaHMENUMPARCELAS.AsInteger;

   rItem.iEvento        := 1;    // presume-se que seja uma parcela

   rItem.FlgEnvio       := 0;
   rItem.FlgBaixado     := 0;
   rItem.RecPag         := 'R';
   rItem.FormaCobranca  := 'F';
   rItem.TipoFolha      := 'P';
   rItem.Origem         := 11;   // Recebimento
   rItem.SeqCobranca    := 1;
   rItem.FlgTipoDiverg  := 2;    // Recebimento Inesperado

   rItem.AnoCompetencia := trunc(DBspnAno.Value);
   rItem.MesCompetencia := (cboMes.ItemIndex + 1);
   rItem.AnoCobranca    := trunc(DBspnAno.Value);
   rItem.MesCobranca    := (cboMes.ItemIndex + 1);

   rItem.FlgCentraliza  := qryBuscaParcelaHMECENTRALIZA.AsInteger;
   rItem.FlgDestacado   := qryBuscaParcelaHMEDESTACADO.AsInteger;

//   rItem.Rubrica        := qryTmpDescIDPROVENTO.AsInteger;

   rItem.DataPrevista   := dData;
   rItem.DataVencto     := dData;
   rItem.DataEfetiva    := dData;

   rItem.Valor          := fVlrInserir;
   rItem.ValorEfetivo   := fVlrInserir;
   rItem.SaldoDevedor   := qryBuscaParcelaHMESALDODEV.AsCurrency;
   rItem.TxJuros        := 0;

   // faz o insert
   CalcEmptmo.InsertMovEmptmo(rItem, rContrato, IDHistMovEmptmo);

   // ----------------------------------------------------------------------------------------------

   // aproveitando o registro (do item) que já foi preparado,
   // altera apenas os dados necessários

   rItem.RecPag         := 'P';
   rItem.SeqCobranca    := 2;

   rItem.DataEfetiva    := 0;
   rItem.Valor          := rItem.Valor * (-1);
   rItem.ValorEfetivo   := 0;

   rItem.FlgDivergPend  := 1;

   // faz o insert
   CalcEmptmo.InsertMovEmptmo(rItem, rContrato, IDHistMovEmptmo);

   // ----------------------------------------------------------------------------------------------

   qryBuscaParcela.Close;
end;



function TfrmExecRecebimentoNovo.EncontrouRegistro(const IDHist      : Int64;
                                                   const IDContrato  : Int64
                                                   ): Boolean;
begin
   // Procura pelo registro de origem na HistMovEmptmo
   LimpaParametros(qryHistMov);

//   qryHistMov.ParamByName('PIDEMPRESAPROP').AsInteger    := Sistema.IDEmpresa;
   qryHistMov.ParamByName('PIDHISTMOVEMPTMO').AsInteger  := IDHist;
   qryHistMov.ParamByName('PIDCONTRATOEMPTMO').AsInteger := IDContrato;

   qryHistMov.Open;

   Result := not(qryHistMov.IsEmpty);
end;



function TfrmExecRecebimentoNovo.MarcaBaixaTMPDESC(const IDHist      : Int64;
                                                   const IDContrato  : Int64
                                                   ): Boolean;
begin
   Result := True;

   // Atualiza TMPDESC com SITENVIO = 9
   try
      LimpaParametros(qryUpdateTmpDesc);

      qryUpdateTmpDesc.ParamByName('PORDEM').AsInteger      := IDHist;
      qryUpdateTmpDesc.ParamByName('IDDESCONTO').AsInteger  := IDContrato;

      qryUpdateTmpDesc.ExecSql;
   except
      Result := False;
   end;
end;



procedure TfrmExecRecebimentoNovo.InsereDiferencaHist(var   qryLocal   : TwwQuery;
                                                      const NovosDados : TNovosDados
                                                      );
var
   rContrato        : TDadosContrato;
   ItemContrato     : TItemRecDep;
   iIdHistMovEmptmo : Int64;
begin

   try
      // Limpa o registro com os dados do Contrato
      LimpaRegistroContrato(rContrato);
      LimpaRegistroConcessao(rConcessao);

      rContrato.IDContratoEmptmo       := qryLocal.FieldByName('IDCONTRATOEMPTMO').AsInteger;

      if qryLocal = qryHistMov then
      begin
         ItemContrato.Parcela          := qryLocal.FieldByName('HMEPARCELA').AsInteger;
         ItemContrato.ParcResta        := qryLocal.FieldByName('HMENUMPARCELAS').AsInteger;
         ItemContrato.IdItemCentraliza := qryLocal.FieldByName('IDITEMCENTRALIZA').AsInteger;
         ItemContrato.iEvento          := qryLocal.FieldByName('HMETIPOMOV').AsInteger;
      end;

      if qryLocal = qryItensABaixar then
      begin
         ItemContrato.Parcela          := qryItensABaixarPARCELA.AsInteger;
         ItemContrato.ParcResta        := qryItensABaixarPARCELAS_RESTANTES.AsInteger;
         ItemContrato.iEvento          := qryItensABaixarEVENTO.AsInteger;
      end;

      ItemContrato.CodigoItem          := NovosDados.IdItemEmptmo;

      ItemContrato.FormaCobranca       := qryLocal.FieldByName('HMEFORMACOBRANCA').AsString;

      ItemContrato.DataPrevista        := NovosDados.DataPrevista;
      ItemContrato.DataVencto          := NovosDados.DataVencto;
      ItemContrato.DataUltAtualiza     := 0;
      ItemContrato.AnoCompetencia      := NovosDados.AnoCompetencia;
      ItemContrato.MesCompetencia      := NovosDados.MesCompetencia;

      ItemContrato.AnoCobranca         := NovosDados.AnoCobranca;
      ItemContrato.MesCobranca         := NovosDados.MesCobranca;

      ItemContrato.Valor               := NovosDados.Valor;

      if ItemContrato.Valor >= 0 then
      begin
         ItemContrato.RecPag           := 'R';
      end
      else
      begin
         ItemContrato.RecPag           := 'P';
      end;

      ItemContrato.ValorEfetivo        := 0;
      ItemContrato.DataEfetiva         := 0;
      ItemContrato.SaldoDevedor        := qryLocal.FieldByName('HMESALDODEV').ASCurrency;
      ItemContrato.TxJuros             := qryLocal.FieldByName('HMETXJUROS').AsFloat;
      ItemContrato.Regra               := qryLocal.FieldByName('IDREGRA').AsInteger;
      ItemContrato.Rubrica             := NovosDados.IdRubrica;

      ItemContrato.Origem              := 11; // Recebimento

      ItemContrato.Prioridade          := qryLocal.FieldByName('HMEPRIORIDADE').AsInteger;
      ItemContrato.SeqCobranca         := (qryLocal.FieldByName('HMESEQCOBRANCA').AsInteger + 1);
      ItemContrato.FlgCentraliza       := qryLocal.FieldByName('HMECENTRALIZA').AsInteger;
      ItemContrato.FlgEnvio            := 0;
      ItemContrato.FlgBaixado          := 0;
      ItemContrato.FlgDivergPend       := 1;
      ItemContrato.FlgTipoDiverg       := NovosDados.FlgTipoDiverg;

      ItemContrato.FlgDestacado        := qryLocal.FieldByName('HMEDESTACADO').AsInteger;

      // função que grava as informações pertinentes a um contrato no histórico de movimento
      // de Empréstimo (tabela HISTMOVEMPTMO), tendo como saída True se a operação foi
      // bem sucedida e False caso negativo
      if not(CalcEmptmo.InsertMovEmptmo(ItemContrato, rContrato, iIdHistMovEmptmo)) then
      begin
         ShowMessage('Erro ao incluir Histórico !!!!');
      end;

   finally
      // Limpa o registro com os dados do Contrato
      LimpaRegistroContrato(rContrato);
   end;
end;



procedure TfrmExecRecebimentoNovo.AtualizaSaldoDiario(iIDContratoEmptmo : Int64; dDataPrevista : TDateTime);
var
   iContador : Integer;
begin
   for iContador := trunc(dDataPrevista) to trunc(SysDate) do
   begin
      dDataAtualizacao := iContador;

      if (SelecionaContratosGeracao(iIDContratoEmptmo, DateToStr(dDataAtualizacao))) then
      begin
         // Itera pelos contratos, gerando (ou não) as parcelas
         if not(ProcessaContratos) then Exit;
      end;

      // -------------------------------------------------------------------------------------------

      if ( (ParametrosSistema) and (dtmEmptmo.qryParamEmptmoFLGINTEGRACONTAB.AsInteger = 1) ) then
      begin
         Contabiliza(iIDContratoEmptmo, DateToStr(dDataAtualizacao));
      end;

   end; // for iContador
end;



function TfrmExecRecebimentoNovo.SelecionaContratosGeracao(const iIDContrato : Int64; const sDataAtualiza : String): Boolean;
var
   sSQL : String;
begin
   Result := False;

   sSQL :=
   'SELECT '                                                                                 + #13 +
   '   C.IDCONTRATOEMPTMO, '                                                                 + #13 +

   '   C.IDCONTRQUITACAO, TC.IDTIPOEMPTMO, '                                                 + #13 +
   '   C.IDINSCRICAOEMPTMO, C.IDTIPOCONTREMPTMO, '                                           + #13 +

   '   C.IDPATRO, C.IDPLANOPREV, C.IDVERBA, '                                                + #13 +
   '   C.IDPESSOA, C.IDBENEF, '                                                              + #13 +

   '   C.FLGSITUACAO, C.FLGFORMAREC, C.FLGFORMAPAG, '                                        + #13 +
   '   C.CODFORMAPAG, C.PORTFORMAREC, C.PORTFORMAPAG, '                                      + #13 +
   '   C.IDCBANCARIA, '                                                                      + #13 +

   '   C.DATAASSINATURA, C.DATASITUACAO, '                                                   + #13 +
   '   C.DATACREDITO, C.DATAPRIMPARC, '                                                      + #13 +
   '   C.DATACANC, C.MOECODIGO, M.MOESIGLA, '                                                + #13 +

   '   C.VLRCONTRATO, C.VLRPARCELA, C.TXJUROS, '                                             + #13 +
   '   C.NUMPARCELAS, '                                                                      + #13 +

   '   H1.DATAULTATUALIZA, H2.HMEPARCELA, H3.HMENUMPARCELAS, '                               + #13 +

   '   TC.IDREGRAJURCONC, '                                                                  + #13 +
   '   TC.IDREGRALIMITES, '                                                                  + #13 +
   '   TC.IDREGRASUSPCOBR, '                                                                 + #13 +
   '   TC.IDREGRASLDDIA, '                                                                   + #13 +
   '   TC.IDREGRAJURANTCONC, '                                                               + #13 +
   '   TC.IDREGRAELEG, '                                                                     + #13 +
   '   TC.IDREGRARESERVA, '                                                                  + #13 +
   '   TC.IDREGRAMARGEM, '                                                                   + #13 +
   '   TC.IDREGRAPRAZOSCONC, '                                                               + #13 +

   '   I.DATAINSC '                                                                          + #13 +

   'FROM '                                                                                   + #13 +
   '   INSCRICAOEMPTMO I, '                                                                  + #13 +
   '   CONTRATOEMPTMO  C, '                                                                  + #13 +
   '   MOEDA           M, '                                                                  + #13 +
   '   TIPOCONTREMPTMO TC, '                                                                 + #13 +
   '   TIPOEMPTMO      TE, '                                                                 + #13 +

   // ----------------------------------------------------------------------------------------------

   '   ( '                                                                                   + #13 +
   '   SELECT '                                                                              + #13 +
   '      IDCONTRATOEMPTMO, '                                                                + #13 +
   '      MAX(HMEDATAATUALIZA) AS DATAULTATUALIZA '                                          + #13 +
   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO '                                                                    + #13 +
   '   WHERE '                                                                               + #13 +
   '      ( HMEDATAATUALIZA < TO_DATE(' + QuotedStr(sDataAtualiza) + ',''DD/MM/YYYY'') ) '   + #13 +
   '      AND ( (FLGESTORNADO IS NULL) OR (FLGESTORNADO = 0) ) '                             + #13 +
   '      AND IDCONTRATOEMPTMO = ' + IntToStr(iIDContrato)                                   + #13 +
   '   GROUP BY '                                                                            + #13 +
   '      IDCONTRATOEMPTMO '                                                                 + #13 +
   '   ) H1, '                                                                               + #13 +

   '   ( '                                                                                   + #13 +
   '   SELECT '                                                                              + #13 +
   '      IDCONTRATOEMPTMO, '                                                                + #13 +
   '      MAX(HMEPARCELA) AS HMEPARCELA '                                                    + #13 +
   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO '                                                                    + #13 +
   '   WHERE '                                                                               + #13 +
   '      ( HMEDATAATUALIZA < TO_DATE(' + QuotedStr(sDataAtualiza) + ',''DD/MM/YYYY'') ) '   + #13 +
   '      AND ( (FLGESTORNADO IS NULL) OR (FLGESTORNADO = 0) ) '                             + #13 +
   '      AND IDCONTRATOEMPTMO = ' + IntToStr(iIDContrato)                                   + #13 +
   '   GROUP BY '                                                                            + #13 +
   '      IDCONTRATOEMPTMO '                                                                 + #13 +
   '   ) H2, '                                                                               + #13 +

   '   ( '                                                                                   + #13 +
   '   SELECT '                                                                              + #13 +
   '      IDCONTRATOEMPTMO, '                                                                + #13 +
   '      MIN(HMENUMPARCELAS) AS HMENUMPARCELAS '                                            + #13 +
   '   FROM '                                                                                + #13 +
   '      HISTMOVEMPTMO '                                                                    + #13 +
   '   WHERE '                                                                               + #13 +
   '      ( HMEDATAATUALIZA < TO_DATE(' + QuotedStr(sDataAtualiza) + ',''DD/MM/YYYY'') ) '   + #13 +
   '      AND ( (FLGESTORNADO IS NULL) OR (FLGESTORNADO = 0) ) '                             + #13 +
   '      AND IDCONTRATOEMPTMO = ' + IntToStr(iIDContrato)                                   + #13 +
   '   GROUP BY '                                                                            + #13 +
   '      IDCONTRATOEMPTMO '                                                                 + #13 +
   '   ) H3 '                                                                                + #13 +

   // ----------------------------------------------------------------------------------------------

   'WHERE ' + #13 +
   '   ( C.FLGSITUACAO IN (''A'', ''E'', ''J'') ) '                                          + #13 +
   '   AND C.IDCONTRATOEMPTMO = ' + IntToStr(iIDContrato)                                    + #13 +
   '   AND ( TE.IDEMPRESAPROP    = ' + IntToStr(Sistema.IDEmpresa) + ' ) '                   + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO ) '                                  + #13 +
   '   AND ( TC.IDTIPOEMPTMO     = TE.IDTIPOEMPTMO ) '                                       + #13 +
   '   AND ( C.IDCONTRATOEMPTMO  = H1.IDCONTRATOEMPTMO ) '                                   + #13 +
   '   AND ( C.IDCONTRATOEMPTMO  = H2.IDCONTRATOEMPTMO ) '                                   + #13 +
   '   AND ( C.IDCONTRATOEMPTMO  = H3.IDCONTRATOEMPTMO ) '                                   + #13 +
   '   AND ( C.IDINSCRICAOEMPTMO = I.IDINSCRICAOEMPTMO(+) ) '                                + #13 +
   '   AND ( C.MOECODIGO         = M.MOECODIGO(+) ) ';

   try

      with qryContratosGeracao do
      begin
         Close;
         SQL.Clear;
         SQL.Text := sSQL;
         Open;

         if not(isEmpty) then Result := True;
      end;

   finally

   end;
end;



function TfrmExecRecebimentoNovo.ProcessaContratos: boolean;
var
   i        : Integer;
   sMsg     : String;
   bGerou   : Boolean;
begin

   i        := 0;
   bGerou   := False; (* nenhuma parcela gerada ainda *)
   Result   := True;

   (* query que seleciona contratos ativos cuja última parcela (não estornada) é de
      competência inferior ao mês de geração escolhido *)
   try
      with qryContratosGeracao do
      begin
         First;
         while not(EOF) do
         begin
            if qryContratosGeracaoDATAULTATUALIZA.AsDateTime <> (dDataAtualizacao - 1) then
            begin
               if GeraItensAtu then
               begin
                  bGerou := True; (* pelo menos 1 contrato atualizado *)
               end;
            end; {DataAtualiza = dia anterior}

            qryContratosGeracao.Next;
         end;
      end;

   finally

   end;
end;



function TfrmExecRecebimentoNovo.Contabiliza(const IDContrato : Int64; const sDataAtualiza : String): integer;
var
   sResult     : TStringList;
   sErro       : TStringList;
   sSQL        : String;
   sHistorico  : String;
   iPlanilha   : Integer;
begin
   (* monta o select que será passado para para a função de contabilização *)

   sSQL :=
   'SELECT '                                                                                       + #13 +
   '   H.IDHISTMOVEMPTMO, '                                                                        + #13 +
   '   H.IDCONTRATOEMPTMO, TC.IDTIPOCONTREMPTMO, '                                                 + #13 +
   '   C.IDPLANOPREV, C.IDPATRO, '                                                                 + #13 +
   '   H.IDITEMEMPTMO, H.IDITEMCENTRALIZA, '                                                       + #13 +
   '   ( TO_CHAR(H.HMEDATAATUALIZA, ''YYYYMM'' ) '   {Anteriormente era passada a competencia}     + #13 +
   '   ) AS ANOMES, '                                                                              + #13 +
   '   H.HMEFORMACOBRANCA, '                                                                       + #13 +
   '   H.HMEVLRPREVISTO, H.HMEVLREFETIVO, '                                                        + #13 +
   '   ITC.TIPCODIGO '                                                                             + #13 +

   'FROM '                                                                                         + #13 +
   '   HISTMOVEMPTMO H, ITEMXTIPOCONTR ITC, CONTRATOEMPTMO C, '                                    + #13 +
   '   TIPOCONTREMPTMO TC, TIPOEMPTMO TE '                                                         + #13 +

   'WHERE '                                                                                        + #13 +
   '       ( C.FLGSITUACAO          IN ''A'', ''J'') '                                             + #13 +
   '   AND ( (H.HMECENTRALIZA       = 0) OR (H.HMECENTRALIZA IS NULL) ) '                          + #13 +
   '   AND ( H.HMEORIGEM            = 5 ) '                                                        + #13 +
   '   AND ( H.HMEDATAATUALIZA      = TO_DATE(' + QuotedStr(sDataAtualiza) + ',''DD/MM/YYYY'') )'  + #13 +
   '   AND ( H.PLNCODIGO            IS NULL ) '                                                    + #13 +
   '   AND ( H.PLNCODIGOESTORNO     IS NULL) '                                                     + #13 +
   '   AND ( H.FLGESTORNADO         IS NULL ) '                                                    + #13 +
   '   AND ( H.FLGBAIXADO           = 0 ) '                                                        + #13 +
   '   AND C.IDCONTRATOEMPTMO = ' + IntToStr(IDContrato)                                          + #13 +
   '   AND ( TE.IDEMPRESAPROP       = ' + IntToStr (Sistema.IDEmpresa) + ' ) '                     + #13 +
   '   AND ( H.IDCONTRATOEMPTMO     = C.IDCONTRATOEMPTMO ) '                                       + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO ) '                                     + #13 +
   '   AND ( TC.IDTIPOEMPTMO        = TE.IDTIPOEMPTMO ) '                                          + #13 +
   '   AND ( C.IDTIPOCONTREMPTMO    = ITC.IDTIPOCONTREMPTMO ) '                                    + #13 +
   '   AND ( H.IDITEMEMPTMO         = ITC.IDITEMEMPTMO ) '                                         + #13 +

   'ORDER BY '                                                                                     + #13 +
   '   H.HMEDATAATUALIZA, H.IDCONTRATOEMPTMO ';


   (* prepara o Histórico-padrão que será passado adiante *)
   sHistorico  := 'Atualização de saldo de Empréstimos, ref: ' +
                  IntToStr(DiasUteis.ExtraiMes(dDataAtualizacao)) + '/' +
                  IntToStr(DiasUteis.ExtraiAno(dDataAtualizacao));

   sHistorico  := sHistorico + '.';

   (* chama a função de contabilização passando o SQL acima *)
   Result := IntegraEmptmo.ContabilizaItens('C', 'N', sSQL, sHistorico, dDataAtualizacao, sResult, sErro, iPlanilha);
end;



function TfrmExecRecebimentoNovo.GeraItensAtu: Boolean;
var
   iRegraTxJuros  : Int64;
   fTxJuros       : Currency;
   iParcelaAtual  : Integer;
   rSitPart       : TSitPart;
   sCompetencia   : String;
   sAno           : String;
   sMes           : String;
   iIdHistMovEmptmo : Int64;
   rContrato      : TDadosContrato;
begin
   Result := True;

   try
      try
         (* Parcela Atual *)
         iParcelaAtual  := qryContratosGeracaoHMEPARCELA.AsInteger;

         (* Limpa o registro com os dados do Contrato *)
         LimpaRegistroContrato(rContrato);
         LimpaRegistroConcessao(rConcessao);

         (* Inicializa o registro com os dados do Contrato *)
         rContrato.IDContratoEmptmo  := qryContratosGeracaoIDContratoEmptmo.AsInteger;
         rContrato.IDPessoa          := qryContratosGeracaoIDPESSOA.AsInteger;
         rContrato.IDTipoContrEmptmo := qryContratosGeracaoIDTipoContrEmptmo.AsInteger;
         rContrato.IDTipoEmptmo      := qryContratosGeracaoIDTIPOEMPTMO.AsInteger;
         rContrato.IDPlanoPrev       := qryContratosGeracaoIDPLANOPREV.AsInteger;
         rContrato.IDPatro           := qryContratosGeracaoIDPATRO.AsInteger;
         rContrato.IDBenef           := qryContratosGeracaoIDBENEF.AsInteger;

         (* NumParcelas será o número de parcelas remanescentes *)
         rContrato.NumParcelas       := qryContratosGeracaoHMENUMPARCELAS.AsInteger;

         rContrato.DataCredito       := qryContratosGeracaoDATACREDITO.AsDateTime;
         rContrato.DataSituacao      := qryContratosGeracaoDATASITUACAO.AsDateTime;
         rContrato.DataAssinatura    := qryContratosGeracaoDATAASSINATURA.AsDateTime;
         rContrato.DataPrimParc      := qryContratosGeracaoDATAPRIMPARC.AsDateTime;
         rContrato.DataCanc          := qryContratosGeracaoDATACANC.AsDateTime;
         rContrato.DataInscricao     := qryContratosGeracaoDATAINSC.AsDateTime;
         rContrato.VlrContrato       := qryContratosGeracaoVLRCONTRATO.AsCurrency;
         rContrato.VlrParcela        := qryContratosGeracaoVLRPARCELA.AsCurrency;
         rContrato.Txjuros           := qryContratosGeracaoTXJUROS.AsCurrency;
         rContrato.FlgFormaRec       := qryContratosGeracaoFLGFORMAREC.AsString;
         rContrato.FlgFormaPag       := qryContratosGeracaoFLGFORMAPAG.AsString;

         rContrato.Indexador         := qryContratosGeracaoMOECODIGO.AsInteger;
         rContrato.SiglaIndexador    := qryContratosGeracaoMOESIGLA.AsString;

         (* traz os dados do histórico imediatamente anterior *)
         iRegraTxJuros := qryContratosGeracaoIDREGRAJURCONC.AsInteger;

         rSaldoDevAnt  := CalcEmptmo.SaldoDevAnt(qryContratosGeracaoIDContratoEmptmo.AsInteger,
                                                 dDataAtualizacao,
                                                 0, // ano competencia
                                                 0, // mes competencia
                                                 sDiaSldDev);

         fTxJuros      := CalcEmptmo.BuscaTxJuros(rContrato, iRegraTxJuros, iParcelaAtual, Date,
                                                  rSaldoDevAnt.fTxJurosAnt, rSaldoDevAnt.fSaldoDevAnt,
                                                  False, rContrato.Indexador);

         (* busca a situação do participante *)
         rSitPart := FuncoesEmptmo.BuscaSitPart(rContrato.IDPessoa);

         sAno := IntToStr(DiasUteis.ExtraiAno(dDataAtualizacao));
         sMes := IntToStr(DiasUteis.ExtraiMes(dDataAtualizacao));

         if Length(sMes) = 1 then sMes := '0' + sMes;

         sCompetencia := sAno + sMes;

         if CalcEmptmo.CalculaItens(rContrato,
                                    rConcessao,
                                    5 (* = atualização *),
                                    5 (* = atualização *),
                                    iPais, sEstado, iCidade,
                                    iParcelaAtual,
                                    rSitPart.IDSitPart,
                                    rContrato.FlgFormaRec,
                                    fTxJuros, rSaldoDevAnt.fSaldoDevAnt,
                                    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                                    // VlrSolic, SaldoQuit, Margem, Reserva, SalPart, SalMantido, SalDoenca, SalBenef, VlrMaxPermit
                                    0, 0, 0,
                                    dDataAtualizacao, (dDataAtualizacao - 1), sCompetencia,
                                    True,    // interrompe
                                    False,   // mostra msg
                                    False,   // mostra progresso
                                    vItens
                                    ) then
         begin

            CalcEmptmo.GravaMovEmptmo(rContrato,
                                      vItens,
                                      5, // atualização diária
                                      iParcelaAtual,
                                      DiasUteis.ExtraiAno(dDataAtualizacao),
                                      DiasUteis.ExtraiMes(dDataAtualizacao),
                                      DiasUteis.ExtraiAno(dDataAtualizacao),
                                      DiasUteis.ExtraiMes(dDataAtualizacao),
                                      rContrato.NumParcelas, // nº de parcelas remanescentes *)
                                      dDataAtualizacao, dDataAtualizacao,
                                      '',
                                      '',
                                      False, // mostra progresso
                                      iIdHistMovEmptmo
                                      );

         end;

      except
         Raise;
         Repaint;
         Result := False;
      end;

   finally
      (* Limpa o registro com os dados do Contrato *)
      LimpaRegistroContrato(rContrato);
   end;
end;



procedure TfrmExecRecebimentoNovo.btnContinuarClick(Sender: TObject);
var
   i              : Integer;
   iContador      : Integer;
   fVlrReceb      : Currency;
   fVlrRecebPatro : Currency;
   fVlrRecebTotal : Currency;
begin
   inherited;

   try
      // vai para página de Resultados
      Repaint;
      Application.ProcessMessages;

      // limpa os memos de resultado e erro
      memResult.Clear;
      memResult.Lines.Add('Iniciando Recebimento...' + DBcboTipoEmptmo.LookupValue);
      memResult.Lines.Add(' ');

      Repaint;
      Application.ProcessMessages;

      fVlrRecebTotal := 0;

      // Laço das Patrocinadoras escolhidas
      for i := 0 to High(molListaPatro.vIDPatro) do
      begin
         // Caso patrocinadora não tenha sido selecionada passa para próxima
         if not(molListaPatro.lstPatro.Checked[i]) then Continue;

         fVlrRecebPatro := 0;

         // Atualiza Resultado
         memResult.Lines.Add('------------------------------------------------------------');
         memResult.Lines.Add('Processando ' + molListaPatro.lstPatro.Items[i] + '...');
         memResult.Lines.Add(' ');

         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------
         fVlrReceb      := RecebimentoCaPCar(i, 'P');
         fVlrRecebPatro := fVlrRecebPatro + fVlrReceb;
         memResult.Lines.Add(' Financeiro (a Pagar)   : ' + FormatFloat('#,0.00', fVlrReceb));
         // ----------------------------------------------------------------------------------------
         fVlrReceb      := RecebimentoCaPCar(i, 'R');
         fVlrRecebPatro := fVlrRecebPatro + fVlrReceb;
         memResult.Lines.Add(' Financeiro (a Receber) : ' + FormatFloat('#,0.00', fVlrReceb));
         // ----------------------------------------------------------------------------------------
         fVlrReceb      := RecebimentoTMPDESC(i);
         fVlrRecebPatro := fVlrRecebPatro + fVlrReceb;
         memResult.Lines.Add(' Folha(s)               : ' + FormatFloat('#,0.00', fVlrReceb));
         // ----------------------------------------------------------------------------------------
         // ----------------------------------------------------------------------------------------

         // Atualiza Resultado
         memResult.Lines.Add('------------------------------------------------------------');
         memResult.Lines.Add(' Valor Recebido - ' +
                             molListaPatro.lstPatro.Items[i] + ': ' +
                             FormatFloat('#,0.00', fVlrRecebPatro));
         memResult.Lines.Add('------------------------------------------------------------');
         memResult.Lines.Add(' ');

         Repaint;

      end; // for

      // Atualiza Resultado
      memResult.Lines.Add(' ');
      memResult.Lines.Add('------------------------------------------------------------');
      memResult.Lines.Add('------------------------------------------------------------');
      memResult.Lines.Add(' Valor TOTAL Recebido: ' + FormatFloat('#,0.00', fVlrRecebTotal));
      memResult.Lines.Add('------------------------------------------------------------');
      memResult.Lines.Add('------------------------------------------------------------');
      memResult.Lines.Add(' ');
      memResult.Lines.Add('Fim do Processo ');

   finally
   end; // try
end;



procedure TfrmExecRecebimentoNovo.molListaPatrobtnInvertePatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnInvertePatroClick(Sender);
end;



procedure TfrmExecRecebimentoNovo.molListaPatrobtnMarcaTodosPatroClick(Sender: TObject);
begin
   inherited;
   molListaPatro.btnMarcaTodosPatroClick(Sender);
end;



procedure TfrmExecRecebimentoNovo.FormShow(Sender: TObject);
begin
   inherited;

   ParametrosSistema;

   iPais    := dtmEmptmo.qryParamEmptmoIDPAIS.AsInteger;
   sEstado  := dtmEmptmo.qryParamEmptmoCODESTADO.AsString;
   iCidade  := dtmEmptmo.qryParamEmptmoIDCIDADES.AsInteger;

   if not(dtmEmptmo.qryParamEmptmoFLGSALDODEVANT.isNULL) then
   begin
      case dtmEmptmo.qryParamEmptmoFLGSALDODEVANT.AsInteger of
         0: sDiaSldDev := 'C';
         1: sDiaSldDev := 'A';
      end;
   end;

   AbreQueries;

   molMutuario.btnLimpaPart.Click;
   molContratoEmptmo.btnLimpaContrato.Click;

   // Preenche a listbox de patrocinadoras... 
   molListaPatro.PreenchePatro;
   // ...e marca todas por default
   molListaPatro.btnMarcaTodosPatroClick(self);

   cboMes.ItemIndex := DiasUteis.ExtraiMes(SysDate) - 1;
   dbspnAno.Value   := DiasUteis.ExtraiAno(SysDate);
end;



procedure TfrmExecRecebimentoNovo.pgcControleChange(Sender: TObject);
begin
   inherited;
   bbtnConfirmar.Enabled := False;
end;



end.
