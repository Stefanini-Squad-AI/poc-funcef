//******************************************************************************
//Data       : 14/05/2009
//SOL        : 117032
//Kintana    : 550770
//Rotina     : Saldo dos Fundos de Investimentos
//Responsável: Ricardo Cristiano
//Problema   : Inconsistência ao Gerar o relatório de Saldo
//Solução    : Alteração do componente de impressão(lSaldoFundo p/ lSaldoFundoTot).
//******************************************************************************
// Data      : 06/12/2007
// Código    : AL_12
// Pendencia :
// SOL       :
// Desc      : Implementação do "TRUNC" nas querys´s que fazem join com a tabela de
//             cadastro de fundo(HISTFUNDOINVEST). Essa inclusão trata a busca
//             independente da hora.
//******************************************************************************
// Data      : 01/08/2007
// Código    : AL_11
// Pendencia : 24957
// SOL       : 56201
// Motivo    : QrySaldoCon para Consolidação do Saldo por Ativo
//             QrySaldoDet incluí os campos desctipofundoinvest
//             Criei o rptSaldoFundoCon
//             A qrySaldoTot/QrySaldoCon está sendo construída em execução pela QrySaldoDet
//******************************************************************************
// Data      : 29/05/2007
// Código    : AL_10
// Pendencia : 25291
// SOL       : 59686
// Motivo    : Implementações para melhorar a performance da funcionalidade
//******************************************************************************
// Data      : 18/04/2006
// Código    : AL_9
// Motivo    : Acerto na filtragem de Gestor, DmRelFundosSaldo.QrySaldoTot e
//             DmRelFundosSaldo.QrySaldoDet para utilizar a HISTFUNDOINVEST
//             conforme a data de Vigência
//******************************************************************************
// Data      : 05/02/2007
// Código    : AL_8
// Motivo    : Implementação do filtro para trazer Saldo Bloqueado
//******************************************************************************
// Data      : 23/08/2006
// Código    : AL_7
// Pendencia : 23123
// SOL       : 45112
// Motivo    : Implementação para utilização do Fundo de Inv. em Participação
//******************************************************************************
// Data      : 03/01/2006
// Código    : AL_6
// Motivo    : Implementação da quantidade bloqueada no relatório
//             (QrySaldoTot, QrySaldoDet)
//******************************************************************************
// Data     : 05/09/2005
// Linha(s) : AL_5
// Linha(s) : Ajuste para emissão de Fundo FDIC (Tipo de Cota)
//            Ajuste na query Detalhe retirada de filtro duplicado
//******************************************************************************
// Data     : 13/07/2005
// Linha(s) : AL_4
// Linha(s) : Ajuste no layout do relatorio.
//******************************************************************************
// Data     : 11/07/2005
// Linha(s) : AL_3
// Linha(s) : Retirada  a coluna de variação.
//******************************************************************************
// Data     : 07/07/2005
// Linha(s) : AL_2
// Linha(s) : QrySaldoTot e QrySaldodET  filtragem de NATUREZAOPERACAO <> 'R' do TIPOOPERACAO
//******************************************************************************
// Data     : 29/06/2005
// Linha(s) : AL_1
// Linha(s) : Retiradao do tratamento de abertura e fechamento da QrySaldoTot e
//            QrySaldoDet e acerto nos IF de linhas
//******************************************************************************
// Data     : 30/03/2005
// Linha(s) : QrySaldoTot, QrySaldoDet
// Motivo   : Implementação do saldo de abertura e fechamento(parametros "ABERTURA e
//            FECHAMENTO, integer)
//******************************************************************************
// Data     : 12/01/2005
// Linha(s) : QrySaldoTot, QrySaldoDet
// Motivo   : Ajuste na busca da DTAVIGENCIA da tabela FUNDOINVEST, não trazia o mais
//            recente registro
//******************************************************************************
// Data     : 26/10/2004
// Código   : QrySaldoTot, QrySaldoDet
// Motivo   : Implementação para sempre buscar a variação
//******************************************************************************
// Data     : 20/09/2004
// Motivo   : Implementação da data de aplicação nas query's QrySaldoDet e QrySaldoTot,
//            devido ao novo conceito de apuração de CPMF .
//******************************************************************************
// Data     : 12/07/2004
// Motivo   : Acerto nas query's QrySaldoDet e QrySaldoTot. Devido a maximização
//            da hora da datavigencia
//******************************************************************************

unit FDmRelFundosSaldo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt;

type
  TDmRelFundosSaldo = class(TDmRelatoriosInv)
    rptSaldoFundos: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppsSaldoFundosCab: TppShape;
    pplblSaldoFundosFundo: TppLabel;
    pplblSaldoFundosQtd: TppLabel;
    pplblSaldoFundosVlrBruto: TppLabel;
    pplblSaldoFundosIOF: TppLabel;
    pplblSaldoFundosIR: TppLabel;
    pplblSaldoFundosSldLiq: TppLabel;
    //Al_3
    LblPlano: TppLabel;
    ppLabel7: TppLabel;
    ppLabel86: TppLabel;
    lblCarteira: TppLabel;
    pplblSaldoFundosDataRef: TppLabel;
    ppDBImage6: TppDBImage;
    dtbDatalhes: TppDetailBand;
    ppsSaldoFundosDet: TppShape;
    srptSaldoFundos: TppSubReport;
    ppChildReport4: TppChildReport;
    //Al_3
    ppDetailBand7: TppDetailBand;
    ppDBSaldoFundosFundo: TppDBText;
    ppDBSaldoFundosQTD: TppDBText;
    ppDBSaldoFundosVlrBruto: TppDBText;
    ppDBSaldoFundosIOF: TppDBText;
    ppDBSaldoFundosIR: TppDBText;
    ppDBSaldoFundosSldLiq: TppDBText;
    //Al_3
    ppFooterBand3: TppFooterBand;
    ppLine4: TppLine;
    ppLabel8: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppSummaryBand10: TppSummaryBand;
    ppLabel72: TppLabel;
    ppDBCalc7: TppDBCalc;
    ppDBCalc11: TppDBCalc;
    ppDBCalc12: TppDBCalc;
    ppDBCalc13: TppDBCalc;
    ppLine35: TppLine;
    ppGroup7: TppGroup;
    //AL_7
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    //AL_7
    //Al_3
    pplSaldoFundo: TppBDEPipeline;
    dsSaldoTot: TDataSource;
    QrySaldoTot: TwwQuery;
    //AL_7
    QrySaldoTotDESCFUNDOINVEST: TStringField;
    QrySaldoTotSALDOQTDCOTAS: TFloatField;
    QrySaldoTotSALDOVLRFUNDO: TFloatField;
    QrySaldoTotVLRIOFPROV: TFloatField;
    QrySaldoTotVLRIRPROV: TFloatField;
    QrySaldoTotSALDOLIQUIDO: TFloatField;
    QrySaldoTotPLANPRVCONTABPATRO: TStringField;
    pplSaldoFundoDet: TppBDEPipeline;
    //AL_6
    QrySaldoTotSALDOQTDCOTASBLQ: TFloatField;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    QrySaldoTotDESCTIPOFUNDOINV: TStringField;
    QrySaldoTotIDTIPOFUNDOINVEST: TFloatField;
    QrySaldoTotIDPLANPREVCTBPATR: TFloatField;
    QrySaldoTotIDFUNDOINVEST: TFloatField;
    ppGroup1: TppGroup;
    ghbCabecalhoPlano: TppGroupHeaderBand;
    gfbRodapePlano: TppGroupFooterBand;
    ppDBText3: TppDBText;
    dbcValBrutoPlano: TppDBCalc;
    pplLinhaRodapeFundo: TppLine;
    dbcValIOFPlano: TppDBCalc;
    dbcValIRPlano: TppDBCalc;
    dbcValLiqFundo: TppDBCalc;
    ppLabel3: TppLabel;
    ppLine5: TppLine;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    QrySaldoTotSALDOQTDCOTASG: TFloatField;
    QrySaldoTotSALDOQTDCOTASBLQG: TFloatField;
    QrySaldoTotSALDOVLRFUNDOG: TFloatField;
    QrySaldoTotVLRIOFPROVG: TFloatField;
    QrySaldoTotVLRIRPROVG: TFloatField;
    QrySaldoTotSALDOLIQUIDOG: TFloatField;
    ppDBText29: TppDBText;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLine1: TppLine;
    ppsSaldoFundosSCab: TppShape;
    pplblSSaldoFundosAplicacao: TppLabel;
    pplblSSaldoFundosQTD: TppLabel;
    lblValorCota: TppLabel;
    pplblSSaldoFundosVlrBruto: TppLabel;
    pplblSSaldoFundosVlrBrutoIOF: TppLabel;
    pplblSSaldoFundosVlrBrutoIR: TppLabel;
    pplSSaldoFundosCab: TppLine;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppShape1: TppShape;
    ppsSaldoFundosSDet: TppShape;
    ppDBSSaldoFundosAplicacao: TppDBText;
    ppDBSSaldoFundosQTD: TppDBText;
    ppDBSSaldoFundosVlrCota: TppDBText;
    ppDBSSaldoFundosVlrBruto: TppDBText;
    ppDBSSaldoFundosIOF: TppDBText;
    ppDBSSaldoFundosIR: TppDBText;
    ppDBSSaldoFundosSlrLiq: TppDBText;
    dbTipoCota: TppDBText;
    ppDBText1: TppDBText;
    // AL_11
    pplSaldoCon: TppBDEPipeline;
    pplSaldoConppField1: TppField;
    pplSaldoConppField2: TppField;
    pplSaldoConppField3: TppField;
    pplSaldoConppField4: TppField;
    pplSaldoConppField5: TppField;
    pplSaldoConppField6: TppField;
    pplSaldoConppField7: TppField;
    pplSaldoConppField8: TppField;
    pplSaldoConppField9: TppField;
    pplSaldoConppField10: TppField;
    DtsSaldoCon: TDataSource;
    QrySaldoCon: TwwQuery; // Fim AL_11
    QrySaldoDet: TwwQuery;
    QrySaldoDetPLANPRVCONTABPATRO: TStringField;
    QrySaldoDetDESCFUNDOINVEST: TStringField;
    QrySaldoDetDATAAPLICACAO: TDateTimeField;
    QrySaldoDetDATAMOVFUNDO: TDateTimeField;
    QrySaldoDetSALDOQTDCOTAS: TFloatField;
    QrySaldoDetSALDOVLRFUNDO: TFloatField;
    QrySaldoDetVLRCOTAATUAL: TFloatField;
    QrySaldoDetSALDOQTDCOTASBLQ: TFloatField;
    QrySaldoDetVLRIOFPROV: TFloatField;
    QrySaldoDetVLRIRPROV: TFloatField;
    QrySaldoDetSALDOLIQUIDO: TFloatField;
    QrySaldoDetVLRCOTAAPLICACAO: TFloatField;
    QrySaldoDetDESCTIPOCOTA: TStringField;
    QrySaldoDetIDFUNDOINVEST: TFloatField;
    QrySaldoDetIDPLANPREVCTBPATR: TFloatField;
    QrySaldoDetIDTIPOFUNDOINVEST: TFloatField;
    QrySaldoDetDESCTIPOFUNDOINV: TStringField;
    DtsSaldoDet: TDataSource;
    rptSaldoFundoCon: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppShape4: TppShape;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel29: TppLabel;
    ppLabel113: TppLabel;
    pplblSaldoFundosConDataRef: TppLabel;
    ppDBImage2: TppDBImage;
    ppLabel32: TppLabel;
    ppDBText5: TppDBText;
    ppDetailBand2: TppDetailBand;
    ppShape5: TppShape;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppLine3: TppLine;
    ppLabel33: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppSummaryBand2: TppSummaryBand;
    ppLabel34: TppLabel;
    ppDBCalc21: TppDBCalc;
    ppDBCalc22: TppDBCalc;
    ppDBCalc23: TppDBCalc;
    ppDBCalc24: TppDBCalc;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppDBCalc25: TppDBCalc;
    ppDBCalc26: TppDBCalc;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand; // Fim AL_11
    procedure ppsSaldoFundosDetPrint(Sender: TObject);
    procedure dtbDatalhesBeforePrint(Sender: TObject);
    procedure srptSaldoFundosPrint(Sender: TObject);
    procedure rptSaldoFundosStartPage(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure gfbRodapePlanoAfterGenerate(Sender: TObject);
    procedure gfbRodapePlanoBeforePrint(Sender: TObject);
    procedure ppsSaldoFundosSDetPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra         : TColor;
    wCountPlano       : Integer;
    // AL_5
    bImp              : Boolean;
    procedure SetImpTipoCota(pImp: Boolean);

  // AL_5
  published
     Property ImpTipoCota : Boolean read bImp write SetImpTipoCota;

  public
    { Public declarations }

  end;

var
  DmRelFundosSaldo: TDmRelFundosSaldo;

implementation

Uses uBibliotecaInvest;

{$R *.DFM}

procedure TDmRelFundosSaldo.ppsSaldoFundosDetPrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;
   TppShape(Sender).Brush.Color := cCorZebra;
end;

procedure TDmRelFundosSaldo.dtbDatalhesBeforePrint(Sender: TObject);
begin
  inherited;
   wCountPlano := wCountPlano + 1;  
end;

procedure TDmRelFundosSaldo.srptSaldoFundosPrint(Sender: TObject);
begin                                                                               
  inherited;
  QrySaldoDet.Filter   := 'IDFUNDOINVEST     = ' + QrySaldoTot.FieldByName('IDFUNDOINVEST').AsString+' AND '+
                          'IDPLANPREVCTBPATR = ' + QrySaldoTot.FieldByName('IDPLANPREVCTBPATR').AsString;
  //AL_7
  QrySaldoDet.Filtered := True;
end;

procedure TDmRelFundosSaldo.rptSaldoFundosStartPage(Sender: TObject);
begin
  inherited;
   cCorZebra := $00E3E3E3;
   //AL_7
   dbTipoCota.Visible  := ImpTipoCota;
end;

procedure TDmRelFundosSaldo.SetImpTipoCota(pImp: Boolean);
begin
   bImp := pImp;
end;

procedure TDmRelFundosSaldo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ImpTipoCota := False;
end;

procedure TDmRelFundosSaldo.gfbRodapePlanoAfterGenerate(
  Sender: TObject);
begin
  inherited;
   wCountPlano := 0;
end;

procedure TDmRelFundosSaldo.gfbRodapePlanoBeforePrint(Sender: TObject);
begin
  inherited;
   If ghbCabecalhoPlano.Visible then
   begin
      If wCountPlano <= 1 Then
         gfbRodapePlano.Visible := False
      else
         gfbRodapePlano.Visible := True;
   end
   else
      gfbRodapePlano.Visible := False;
   wCountPlano   := 0;
end;

procedure TDmRelFundosSaldo.ppsSaldoFundosSDetPrint(Sender: TObject);
begin
  inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;
   TppShape(Sender).Brush.Color := cCorZebra;
end;

end.
