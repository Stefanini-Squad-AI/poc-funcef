//******************************************************************************
// Data     : 29/06/2004
// Código   : AL_1
// Motivo   : Ajuste na buscaSaldos para trazer o saldo de opções revertidas
//******************************************************************************
unit dOpcoesIndice;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery, Wwdatsrc;

type
  TDMOpcoesIndice = class(TDataModule)
    qryBuscaValorCesta: TwwQuery;
    qryInsOrdemOpcInd: TwwQuery;
    qryInsOperOpcInd: TwwQuery;
    qryInsHistOpcInd: TwwQuery;
    qryInsItemOpcInd: TwwQuery;
    qryInsHistOpcIndXItens: TwwQuery;
    qryAux: TwwQuery;
    qryInsDespOpcInd: TwwQuery;
    qryBuscaValorCestaVALORTOTAL: TFloatField;
    qryBuscaSaldoHistOpcInd: TwwQuery;
    qryUpdStatusOpcInd: TwwQuery;
    qryInsBoletaOpcInd: TwwQuery;
    qrySelHistExclusao: TwwQuery;
    qrySelOperExclusao: TwwQuery;
    qrySelAtuExclusao: TwwQuery;
    qrySelOperExclusaoIDHISTOPCIND: TFloatField;
    qrySelOperExclusaoIDOPEROPCIND: TFloatField;
    qrySelOperExclusaoIDINVESTIMENTO: TFloatField;
    qrySelOperExclusaoIDBOLETA: TStringField;
    qryDelHistOpcInd: TwwQuery;
    qryDelHistOpcIndXItens: TwwQuery;
    qryDelOperOpcInd: TwwQuery;
    qryDelBoletaHistOpcInd: TwwQuery;
    qrySelHistExclusaoIDINVESTIMENTO: TFloatField;
    qrySelAtuExclusaoIDHISTOPCIND: TFloatField;
    qrySelAtuExclusaoIDOPEROPCIND: TFloatField;
    qrySelAtuExclusaoIDINVESTIMENTO: TFloatField;
    qrySelAtuExclusaoIDBOLETA: TStringField;
    qrySelAtuExclusaoPLNCODIGO: TFloatField;
    qryItensOpcInd: TwwQuery;
    qryItensOpcIndIDITEMOPCIND: TFloatField;
    qryItensOpcIndDESITEMOPCIND: TStringField;
    QryLancamento: TwwQuery;
    QryLanctoDocum: TwwQuery;
    QryRateioDocum: TwwQuery;
    FloatField121: TFloatField;
    StringField32: TStringField;
    FloatField122: TFloatField;
    StringField33: TStringField;
    FloatField123: TFloatField;
    FloatField124: TFloatField;
    DateTimeField15: TDateTimeField;
    StringField34: TStringField;
    FloatField125: TFloatField;
    FloatField126: TFloatField;
    FloatField127: TFloatField;
    FloatField128: TFloatField;
    FloatField129: TFloatField;
    FloatField130: TFloatField;
    StringField35: TStringField;
    DateTimeField16: TDateTimeField;
    FloatField131: TFloatField;
    FloatField132: TFloatField;
    FloatField133: TFloatField;
    StringField36: TStringField;
    StringField37: TStringField;
    FloatField134: TFloatField;
    DateTimeField17: TDateTimeField;
    FloatField135: TFloatField;
    FloatField136: TFloatField;
    FloatField137: TFloatField;
    FloatField138: TFloatField;
    FloatField139: TFloatField;
    FloatField140: TFloatField;
    FloatField141: TFloatField;
    FloatField142: TFloatField;
    FloatField143: TFloatField;
    FloatField144: TFloatField;
    FloatField145: TFloatField;
    FloatField146: TFloatField;
    FloatField147: TFloatField;
    FloatField148: TFloatField;
    FloatField149: TFloatField;
    FloatField150: TFloatField;
    FloatField151: TFloatField;
    FloatField152: TFloatField;
    FloatField153: TFloatField;
    FloatField154: TFloatField;
    FloatField155: TFloatField;
    FloatField156: TFloatField;
    FloatField157: TFloatField;
    DateTimeField18: TDateTimeField;
    DateTimeField19: TDateTimeField;
    FloatField158: TFloatField;
    DateTimeField20: TDateTimeField;
    FloatField159: TFloatField;
    FloatField160: TFloatField;
    FloatField161: TFloatField;
    FloatField162: TFloatField;
    StringField38: TStringField;
    FloatField163: TFloatField;
    DateTimeField21: TDateTimeField;
    StringField39: TStringField;
    StringField40: TStringField;
    FloatField164: TFloatField;
    FloatField165: TFloatField;
    StringField41: TStringField;
    FloatField166: TFloatField;
    FloatField167: TFloatField;
    FloatField168: TFloatField;
    FloatField169: TFloatField;
    FloatField170: TFloatField;
    StringField42: TStringField;
    StringField43: TStringField;
    StringField44: TStringField;
    FloatField171: TFloatField;
    FloatField172: TFloatField;
    FloatField173: TFloatField;
    StringField45: TStringField;
    FloatField174: TFloatField;
    FloatField175: TFloatField;
    FloatField176: TFloatField;
    StringField46: TStringField;
    FloatField177: TFloatField;
    FloatField178: TFloatField;
    QryPlanilha: TwwQuery;
    QryLotexDocum: TwwQuery;
    QryDocumento: TwwQuery;
    QryRecbtoPagto: TwwQuery;
    qrySelHistExclusaoIDBOLETA: TStringField;
    qrySelHistExclusaoPLNCODIGO: TFloatField;
    qrySelHistExclusaoCODDOCUMENTO: TFloatField;
    qryBuscaOperacoes: TwwQuery;
    qryBuscaOperacoesIDORDEMOPCIND: TFloatField;
    qryBuscaOperacoesDATAORDEM: TDateTimeField;
    qryBuscaOperacoesIDCORRETVALORES: TFloatField;
    qryBuscaOperacoesIDBOLETA: TStringField;
    qryBuscaOperacoesIDINVESTIMENTO: TFloatField;
    qryBuscaOperacoesIDTIPOOPERACAO: TFloatField;
    qryBuscaOperacoesIDTIPOINVEST: TFloatField;
    qryBuscaOperacoesQUANTIDADE: TFloatField;
    qryBuscaOperacoesPREMIO: TFloatField;
    qryBuscaOperacoesVALOR: TFloatField;
    qryBuscaOperacoesOBSERVACAO: TMemoField;
    qryBuscaOperacoesSTATUS: TStringField;
    qryBuscaOperacoesIDUSUARIO: TFloatField;
    qryBuscaOperacoesIDPLANPREVCTBPATR: TFloatField;
    qryBuscaOperacoesSTACONFIRMA: TStringField;
    qryBuscaOperacoesSTAAUTORIZA: TStringField;
    qryBuscaOperacoesDESCINVESTIMENTO: TStringField;
    qryBuscaOperacoesDESCTIPOOPERACAO: TStringField;
    qryBuscaOperacoesDTAVENCTO: TDateTimeField;
    qryBuscaOperacoesVLRPRECOEX: TFloatField;
    qryBuscaOperacoesSTATPAMERICANA: TStringField;
    qryBuscaOperacoesSTAOPCCOMPRA: TStringField;
    qryBuscaOperacoesTIPCOTVENC: TStringField;
    qryBuscaOperacoesVLRSTRIKEPUT: TFloatField;
    qryBuscaOperacoesVLRPONTO: TFloatField;
    qryBuscaOperacoesVENCIMENTO: TFloatField;
    qryBuscaOperacoesTOTALORDEM: TFloatField;
    qryBuscaOperacoesNATUREZAOPERACAO: TStringField;
    qryBuscaOperacoesIDCARTEIRAINVEST: TFloatField;
    qryBuscaOperacoesIDCARTEIRAGERENC: TFloatField;
    qryBuscaOperacoesIDLOTE: TStringField;
    qryBuscaOperacoesIDCESTAOPCIND: TFloatField;
    qryBuscaOperacoesCODTIPDOC: TFloatField;
    updBuscaOperacoes: TUpdateSQL;
    dsBuscaOperacoes: TwwDataSource;
    qryBuscaBoletaOper: TwwQuery;
    qryBuscaBoletaOperIDBOLETA: TStringField;
    qryBuscaBoletaOperIDDESPOPEROPCIND: TFloatField;
    qryBuscaBoletaOperIDTIPOOPERACAO: TFloatField;
    qryBuscaBoletaOperIDTIPODESPINVEST: TFloatField;
    qryBuscaBoletaOperIDOPEROPCIND: TFloatField;
    qryBuscaBoletaOperVLRDESPESA: TFloatField;
    qryBuscaBoletaOperIDREGRA: TFloatField;
    qryBuscaBoletaOperDESCTIPODESPINV: TStringField;
    dsBuscaBoletaOper: TwwDataSource;
    UpdBuscaBoletaOper: TUpdateSQL;
    qryNumDocumento: TwwQuery;
    qryNumDocumentoIDBOLETA: TStringField;
    qryVlrMaxCesta: TwwQuery;
    qryVlrMaxCestaVLRSTRIKEPUT: TFloatField;
    qryVlrMaxCestaQUANTIDADE: TFloatField;
    qryVlrMaxCestaVLRPONTO: TFloatField;
    qryVlrMaxCestaVALMAX: TFloatField;
    qryBuscaCestaOpcInd: TwwQuery;
    qryBuscaCestaOpcIndIDINVESTIMENTO: TFloatField;
    qryBuscaCestaOpcIndQUANTIDADE: TFloatField;
    qryBuscaCestaOpcIndIDCUSTODIANTE: TFloatField;
    qryBuscaCestaOpcIndIDCARTEIRAINVEST: TFloatField;
    qryBuscaCestaOpcIndIDEMISSOR: TFloatField;
    qryBuscaCestaOpcIndIDCARTEIRAGERENC: TFloatField;
    qryBuscaTRCCesta: TwwQuery;
    qryBuscaTRCCestaIDOPERCUSTODIA: TFloatField;
    qryBuscaTRCCestaIDHISTCARTINVDEST: TFloatField;
    qryBuscaTRCCestaIDHISTCARTINVORIG: TFloatField;
    qryUpdStatusBoleta: TwwQuery;
    qryBuscaSaldoHistXItens: TwwQuery;
    qryBuscaOperacoesDESCCARTINVEST: TStringField;
    qryBuscaOperacoesSGLCORRETVALORES: TStringField;
    qryVerificaCestaInv: TwwQuery;
    qryBuscaVlrAtuCesta: TwwQuery;
    qryBuscaVlrAtuCestaSALDOCESTA: TFloatField;
    qryBuscaOrdemLote: TwwQuery;
    qryBuscaOrdemLoteIDORDEMOPCIND: TFloatField;
    qryBuscaOrdemLoteIDCESTAOPCIND: TFloatField;
    qryBuscaOrdemLoteDATAORDEM: TDateTimeField;
    qryUpdHistOpcIndXItens: TwwQuery;
    qryBuscaOrdemLoteIDINVESTIMENTO: TFloatField;
    qryBuscaOrdemLotePREMIO: TFloatField;
    qryBuscaOrdemLoteQUANTIDADE: TFloatField;
    qryBuscaSaldoHistXItensIDHISTOPCIND: TFloatField;
    qryBuscaSaldoHistXItensIDITEMOPCIND: TFloatField;
    qryBuscaSaldoHistXItensVLRHISTOPCIND: TFloatField;
    qryBuscaSaldoHistXItensSLDHISTOPCIND: TFloatField;
    qryBuscaSaldoHistXItensIDREGRAUSADA: TFloatField;
    qryBuscaSaldoAjuste: TwwQuery;
    qryBuscaSaldoAjusteSALDOAJUSTE: TFloatField;
    qryUpdPlanilhaHist: TwwQuery;
    qryBuscaCestaOpcIndDESCINVESTIMENTO: TStringField;
    qryDelDespesOpcInd: TwwQuery;
    qryBuscaBoletaAberta: TwwQuery;
    qryBuscaBoletaAbertaIDBOLETA: TStringField;
    qryBuscaHistAtual: TwwQuery;
    QryCestaOpcDia: TwwQuery;
    QryCestaOpcDiaAnterior: TwwQuery;
    QryCestaDeletadas: TwwQuery;
    qryBuscaOpcao: TwwQuery;
    qryBuscaOpcaoIDOPCAO: TFloatField;
    qryBuscaOpcaoIDINVESTIMENTO: TFloatField;
    qryBuscaOpcaoDTAVENCTO: TDateTimeField;
    qryBuscaOpcaoVLRPRECOEX: TFloatField;
    qryBuscaOpcaoIDBOLSAVALORES: TFloatField;
    qryBuscaOpcaoIDINVESTBASE: TFloatField;
    qryBuscaOpcaoSTATPAMERICANA: TStringField;
    qryBuscaOpcaoSTAOPCCOMPRA: TStringField;
    qryBuscaOpcaoIDTIPOOPCAO: TFloatField;
    qryBuscaOpcaoTIPCOTVENC: TStringField;
    qryBuscaOpcaoVLRSTRIKEPUT: TFloatField;
    qryBuscaOpcaoVLRPONTO: TFloatField;
    qryItensOpcIndIDREGRA: TFloatField;
    qryBuscaBoletaAbertaDATA: TDateTimeField;
    qryAuxiliar: TwwQuery;
    qryBuscaOperacoesIDOPEROPCIND: TFloatField;
    qryBuscaOperacoesPLNCODIGO: TFloatField;
    qryBuscaOperacoesCODDOCUMENTO: TFloatField;
    qryBuscaOperacoesPLANO: TFloatField;
    qrySelAtuExclusaoDATAHISTOPCIND: TDateTimeField;
    qryBuscaPlano: TwwQuery;
    qryBuscaPlanoPLANO: TFloatField;
    qryBuscaPlanoPLNCODIGO: TFloatField;
    qryBuscaTransf: TwwQuery;
    qryBuscaTransfIDTIPOOPERACAO: TFloatField;
    qryBuscaTransfIDCARTEIRAINVEST: TFloatField;
    qryBuscaTransfIDEMISSOR: TFloatField;
    qryBuscaTransfMOVIMAQUI: TFloatField;
    qryBuscaTransfVLRVARIACAO: TFloatField;
    qryBuscaTransfPLANO: TFloatField;
    qryBuscaTransfPLNCODIGO: TFloatField;
    qryBuscaTransfPLANOHIST: TFloatField;
    qryBuscaTransfPLANILHAHIST: TFloatField;
    qryBuscaTransfIDINVESTIMENTO: TFloatField;
    qryBuscaTransfDATAMOVCARTINV: TDateTimeField;
    qryBuscaSaldoHistOpcIndIDHISTOPCIND: TFloatField;
    qryBuscaSaldoHistOpcIndIDBOLETA: TStringField;
    qryBuscaSaldoHistOpcIndIDOPEROPCIND: TFloatField;
    qryBuscaSaldoHistOpcIndIDINVESTIMENTO: TFloatField;
    qryBuscaSaldoHistOpcIndIDCARTEIRAINVEST: TFloatField;
    qryBuscaSaldoHistOpcIndIDTIPOOPERACAO: TFloatField;
    qryBuscaSaldoHistOpcIndIDTIPOINVEST: TFloatField;
    qryBuscaSaldoHistOpcIndDATAHISTOPCIND: TDateTimeField;
    qryBuscaSaldoHistOpcIndHISTORICO: TStringField;
    qryBuscaSaldoHistOpcIndIDPLANPREVCTBPATR: TFloatField;
    qryBuscaSaldoHistOpcIndPLNCODIGO: TFloatField;
    qryBuscaSaldoHistOpcIndVLRHISTOPCIND: TFloatField;
    qryBuscaSaldoHistOpcIndSLDVLRHISTOPCIND: TFloatField;
    qryBuscaSaldoHistOpcIndQTDHISTOPCIND: TFloatField;
    qryBuscaSaldoHistOpcIndSLDQTDHISTOPCIND: TFloatField;
    qryBuscaSaldoHistOpcIndTIPMOVHISTOPCIND: TStringField;
    qryBuscaSaldoHistOpcIndIDLOTE: TStringField;
    qryBuscaSaldoHistOpcIndIDCARTEIRAGERENC: TFloatField;
    qryBuscaSaldoHistOpcIndFLGCALCULA: TStringField;
    qryBuscaSaldoHistOpcIndDESCINVESTIMENTO: TStringField;
    qryBuscaSaldoHistOpcIndDTAVENCTO: TDateTimeField;
    qryBuscaSaldoHistOpcIndVLRPRECOEX: TFloatField;
    qryBuscaSaldoHistOpcIndSTATPAMERICANA: TStringField;
    qryBuscaSaldoHistOpcIndSTAOPCCOMPRA: TStringField;
    qryBuscaSaldoHistOpcIndTIPCOTVENC: TStringField;
    qryBuscaSaldoHistOpcIndVLRSTRIKEPUT: TFloatField;
    qryBuscaSaldoHistOpcIndVLRPONTO: TFloatField;
    qryBuscaSaldoHistOpcIndVLRVENCTO: TFloatField;
    qryBuscaSaldoHistOpcIndVLRCOMPRA: TFloatField;
    qryBuscaSaldoHistOpcIndDIASCORRIDOS: TFloatField;
    qryBuscaSaldoHistOpcIndDIASATEHOJE: TFloatField;
    qryBuscaSaldoHistOpcIndAJUSTEDIA: TFloatField;
    qryBuscaSaldoHistOpcIndVLRATEHOJE: TFloatField;
    qryBuscaSaldoHistOpcIndDATAOPERACAO: TDateTimeField;
    qryBuscaSaldoHistOpcIndIDCESTAOPCIND: TFloatField;
    qryBuscaSaldoHistOpcIndIDCORRETVALORES: TFloatField;
    procedure qryBuscaSaldoHistOpcIndAfterScroll(DataSet: TDataSet);
    procedure qryBuscaSaldoHistOpcIndAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMOpcoesIndice: TDMOpcoesIndice;

implementation

uses UOperComum;

{$R *.DFM}

procedure TDMOpcoesIndice.qryBuscaSaldoHistOpcIndAfterScroll(DataSet: TDataSet);
begin
   OperComum.LimpaParametros(qryBuscaSaldoHistXItens);
   with qryBuscaSaldoHistXItens do
   begin
      ParamByName('IDHISTOPCIND').AsInteger := DataSet.FieldByName('IDHISTOPCIND').AsInteger;
      Open;
   end;
end;

procedure TDMOpcoesIndice.qryBuscaSaldoHistOpcIndAfterOpen(DataSet: TDataSet);
begin
   OperComum.LimpaParametros(qryBuscaSaldoHistXItens);
   with qryBuscaSaldoHistXItens do
   begin
      ParamByName('IDHISTOPCIND').AsInteger := DataSet.FieldByName('IDHISTOPCIND').AsInteger;
      Open;
   end;
end;

end.
