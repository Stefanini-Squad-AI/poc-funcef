unit dOpcoes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Wwquery;

type
  TDMOpcoes = class(TDataModule)
    qryBuscaSaldosOpcoes: TwwQuery;
    qryVerificaVenctoOpcao: TwwQuery;
    qryVerificaVenctoOpcaoIDOPCAO: TFloatField;
    qryVerificaVenctoOpcaoIDINVESTIMENTO: TFloatField;
    qryVerificaVenctoOpcaoDTAVENCTO: TDateTimeField;
    qryVerificaVenctoOpcaoVLRPRECOEX: TFloatField;
    qryVerificaVenctoOpcaoIDBOLSAVALORES: TFloatField;
    qryVerificaVenctoOpcaoIDINVESTBASE: TFloatField;
    qryVerificaVenctoOpcaoDESCINVESTIMENTO: TStringField;
    qryVerificaVenctoOpcaoIDEMISSOR: TFloatField;
    qryInsOrdMovInv: TwwQuery;
    qryInsOperacaoInvest: TwwQuery;
    qryInsOpracao: TwwQuery;
    qryInsBoleta: TwwQuery;
    qryBuscaSaldosOpcoesIDHISTCARTINV: TFloatField;
    qryBuscaSaldosOpcoesDATAMOVCARTINV: TDateTimeField;
    qryBuscaSaldosOpcoesIDINVESTIMENTO: TFloatField;
    qryBuscaSaldosOpcoesIDCARTEIRAINVEST: TFloatField;
    qryBuscaSaldosOpcoesSALDOQTDEINVCART: TFloatField;
    qryBuscaSaldosOpcoesSALDOPREMIO: TFloatField;
    qryBuscaSaldosOpcoesIDCORRETVALORES: TFloatField;
    qryBuscaSaldosOpcoesIDCARTEIRAGERENC: TFloatField;
    qryBuscaSaldosOpcoesIDPLANPREVCTBPATR: TFloatField;
    qryBuscaSaldosOpcoesDESCINVESTIMENTO: TStringField;
    qryBuscaSaldosOpcoesDESCTIPOOPERACAO: TStringField;
    qryBuscaSaldosOpcoesDTAVENCTO: TDateTimeField;
    qryBuscaSaldosOpcoesVLRPRECOEX: TFloatField;
    qryBuscaSaldosOpcoesIDBOLSAVALORES: TFloatField;
    qryBuscaSaldosOpcoesIDEMISSOR: TFloatField;
    qryBuscaSaldosOpcoesQTDELOTE: TFloatField;
    qryBuscaSaldosOpcoesIDLOTE: TStringField;
    qryCorretoraXLote: TwwQuery;
    qryCorretoraXLoteIDCORRETVALORES: TFloatField;
    qryBuscaSaldosOpcoesSALDOVLRINVCART: TFloatField;
    qryBuscaSaldosOpcoesIDOPERACAOINVEST: TFloatField;
    qryBuscaBaixaOpc: TwwQuery;
    qryBuscaBaixaOpcIDHISTCARTINV: TFloatField;
    qryBuscaBaixaOpcIDOPERACAOINVEST: TFloatField;
    qryBuscaBaixaOpcPLNCODIGO: TFloatField;
    qryBuscaBaixaOpcIDLOTE: TStringField;
    qryBuscaBaixaOpcNUMDOCUMENTO: TStringField;
    qryAux: TwwQuery;
    qryBuscaLoteInvestBase: TwwQuery;
    qryBuscaSaldosOpcoesIDINVESTBASE: TFloatField;
    qryBuscaLoteInvestBaseSALDOQTDEINVCART: TFloatField;
    qryCorretoraXLoteIDCUSTODIANTE: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMOpcoes: TDMOpcoes;

implementation

{$R *.DFM}

end.
