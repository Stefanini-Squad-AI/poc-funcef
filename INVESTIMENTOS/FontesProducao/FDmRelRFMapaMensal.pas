//******************************************************************************
// Data      : 06/05/2008
// Código    : AL_22
// Pendencia : 27840
// SOL       :
// Descrição : Recompilação da query analítica (perdeu os parâmetros)
//******************************************************************************
// Data      : 27/03/2008
// Código    : AL_21
// Pendencia : 27668
// SOL       : 81608
// Descrição : Alteração na query analítica e sintética somando todos os itens
//             de juros e correção,antes era fixo o tipo de operação.
//             Títulos com perfis com mais de um item do tipo Moeda (BNDESPAR).
//******************************************************************************
// Data      : 15/02/2008
// Código    : AL_20
// Pendencia : 24799
// SOL       : 55978
// Descrição : Ajuste no cálculo do valor aplicado após transferência de planos.
//             Passa a buscar pelo histórico da TRC
//******************************************************************************
// Data      : 25/07/2007
// Código    : AL_19
// Pendencia : 24799
// SOL       : 55978
// Descrição : Ajuste no cálculo do valor aplicado após transferência de planos.
//******************************************************************************
// Data      : 29/03/2006
// Código    : AL_18
// Pendencia : 24912
// SOL       : 55516
//             Implementação da alteração da coluna de IOF para trazer o Saldo Acumulado de
//             IOF na data Final e não mais pelo somatório do período escolhido;
//******************************************************************************
// Data      : 27/03/2006
// Código    : AL_17
// Pendencia : 21002
// Desc      : Retirada de critica de HI8.PUACUITEM da subquery de IOF para trazer
//             o registro do ultimo dia (pois o HI8.PUACUITEM fica zerado no final
//             do período)
//******************************************************************************
// Data      : 27/11/2006
// Código    : AL_16
// Pendencia : 21002
// Desc      : Alteração do Caption de Recebimento para Recebimentos/Recbtos
//******************************************************************************
// Data      : 06/11/2006
// Código    : AL_15
// Pendencia : 23632
// Desc      : Acerto no Saldo Anterior após pagamento de Juros pois não estava
//             trazendo pela data de liquidacao
//******************************************************************************
// Data      : 26/10/2006
// Código    : AL_14
// Pendencia : 23632
// Desc      : Ajuste no relatório para mostrar o valor aplicado proporcional as
//               quantidades transferidas do título.
//******************************************************************************
// Data      : 22/08/2006
// Código    : AL_13
// Desc      : Acerto na subquery para buscar o valor do IOF
//             Não pode fazer somatório dos valores já acumulados (PUACUITEM),
//               tem que ser do valor de cada item (PUITEM)
//******************************************************************************
// Data      : 07/08/2006
// Código    : AL_12
// Pendencia : 23008
// Desc      : Implementação de TRC Planos antes do registro de ATU
//             Alteração para pegar dados da aplicação original
//********************************************************************************************************
//Data	     : 12/07/2006
//Codigo     : AL_11
//Função     : Acerto no sinal do Pagamento de Juros para ficar Negativo
//********************************************************************************************************
//Data	     : 26/05/2006
//Codigo     : AL_10
//Pendência  : 22480
//SOL        : 43633
//Função     : Melhorias na Funcionalidade de Transferência entre Planos
//******************************************************************************
// Data     : 15/03/2006
// Código   : AL_9
// Pendencia: 21769
// SOL      : 41208
// Motivo   : Acerto na filtragem de registros vencidos que estava aparecendo
//            Melhoria na critica para pegar os Pagtos de Juros pela data de
//            Liquidação
//******************************************************************************
// Data     : 18/01/2006
// Código   : AL_9
// Pendencia: 20779
// SOL      : 35222
// Motivo   : Implementação dos filtros por Classe, Emissor e Investimento
//******************************************************************************
// Data     : 04/01/2006
// Código   : AL_8
// Pendencia: 21180
// Sol      : 39553
// Motivo   : Ajuste para não captar valor de Correção para titulos de Cotação
//            quando o VLRITEM for zero e o PUITEM repetir o anterior
//******************************************************************************
// Data     : 13/12/2005
// Código   : AL_7
// Pendencia: 20901
// Sol      : 38821
// Motivo   : Criação do campo FLGREGIMECXCOMP e DTAREGIMECXCOMP na PARAMINVEST
//            para testar a utilização de regime de Caixa ou Competência nas
//            Operações de Renda Fixa
//******************************************************************************
// Data     : 07/10/2005
// Código   : AL_6
// Motivo   : Acerto no SubSelect SLD no between DATAINI para DATAMIN
//******************************************************************************
// Data     : 07/10/2005
// Código   : AL_5
// Motivo   : Implementação da label de diferença no relatório
//******************************************************************************
// Data     : 05/10/2005
// Código   : AL_4
// Motivo   : Ajuste nos Saldos Iniciais e Finais e na variação
//******************************************************************************
// Data     : 03/10/2005
// Código   : AL_3
// Motivo   : Ajuste na query para impressão do mapa nos fins de semana
//******************************************************************************
// Data     : 20/07/2005
// Código   : AL_2
// Motivo   : Retirado filtro (AND TP.CODTIPDOC IS NOT NULL) subqry de Resgates
//            das qryMapaMensalRF e qryMapaMensalRFAnalitico
//******************************************************************************
// Data     : 19/05/2005
// Código   : AL_1
// Motivo   : Implementação de Sub-Relatório e qryMapaMensalRFAnalitico
//******************************************************************************
// Data     : 18/05/2005
// Motivo   : Alteração no nome do Relatório para MAPA DE MOVIMENTAÇÃO EM RENDA FIXA
//            Inclusão de Campos no Layout
//******************************************************************************
// Data     : 25/04/2005
// Motivo   : Ajuste na qryMapaMensalRF para trazer os saldos conforme
//            OP.VENCOPERACAO >= TO_DATE(:DATAINI ao invés da :DATAFIM  e
//            Acerto no item Lucro que não estava pegado o campo VLRITEM
//******************************************************************************
// Data     : 11/04/2005
// Motivo   : Ajuste na qryMapaMensalRF para acertar os decodes dos valores
//******************************************************************************
// Data     : 07/04/2005
// Motivo   : Acerto na qryMapaMensalRF com inclusão dos filtros no sub-select RESG
//            AND HT.TIPMOVHISRENFIX = 'OPE'
//            AND HT.NATURMOVHISTRENFI = 'D'
//******************************************************************************
// Data     : 05/04/2005
// Motivo   : Acerto na qryMapaMensalRF onde foi colocado o Outher Joi para os
//            campos SLD.IDINVESTIMENTO(+) e SLD.IDOPERRENFIXAPLIC(+)
//******************************************************************************
// Data     : 31/03/2005
// Motivo   : Implementado o Campo DIF e colocado NVL's na qry
//******************************************************************************
// Data     : 30/03/2005
// Motivo   : Ajuste na query QryMapaMensalRF compatibilizando com os novos campos VLRITEM e VLRACUITEM
//******************************************************************************
// Data     : 29/03/2005
// Motivo   : Ajuste na query para arredondar os valores de juros e correção
//               antes de soma-los
//            Ajuste na subquery de resgates, LeftJoin com Agio/Desagio e NVL() destes
//******************************************************************************
// Data     : 24/03/2005
// Motivo   : Incluido o Lucro/Prejuízo nos Resgates da qryMapaMensalRF
//******************************************************************************
// Data     : 10/03/2005
// Motivo   : Colocado um filtro na qryMapaMensalRF (AND HI0.TIPMOVHISRENFIX = 'ATU')
//            no subselect HIS
//            Colocado filtro IDPLANPREVCTBPATR
//******************************************************************************

unit FDmRelRFMapaMensal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, ppStrtch, ppSubRpt;

type
  TDmRelRFMapaMensal = class(TDmRelatoriosInv)
    pplMapaMensalRF: TppBDEPipeline;
    dsMapaMensalRF: TwwDataSource;
    qryMapaMensalRF: TwwQuery;
    rptMapaMensalRF: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBImage1: TppDBImage;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    shpCabClasse: TppShape;
    shpCabecalho: TppShape;
    lblInvestimento: TppLabel;
    lblVlrAplic: TppLabel;
    shpDetalhe: TppShape;
    ppdbDescInvestimento: TppDBText;
    ppdbVlrAplic: TppDBText;
    lblJuros: TppLabel;
    ppdbVlrJuros: TppDBText;
    pdbVlrCorrecao: TppDBText;
    lblCorrecao: TppLabel;
    lblAgioDesagio: TppLabel;
    ppdbAgioDesagio: TppDBText;
    lblResgates: TppLabel;
    ppdbResgates: TppDBText;
    ppdbSaldoAtu: TppDBText;
    lblSaldo: TppLabel;
    ppdbSaldoAnt: TppDBText;
    lblSaldoAnt: TppLabel;
    lblTotClasse: TppLabel;
    ppdbSumVlrJuros: TppDBCalc;
    ppdbSumVlrCorrecao: TppDBCalc;
    ppdbSumAgioDesagio: TppDBCalc;
    ppdbSumResgates: TppDBCalc;
    ppdbSumSldAnt: TppDBCalc;
    ppdbSumSaldoAtu: TppDBCalc;
    lblProvPerda: TppLabel;
    ppdbProvPerda: TppDBText;
    ppdbSumProvPerda: TppDBCalc;
    lblDescClasse: TppLabel;
    lblIOF: TppLabel;
    lblAplicacao: TppLabel;
    lblPagtoJuros: TppLabel;
    ppdbAplicacoes: TppDBText;
    ppdbVlrIOF: TppDBText;
    ppdbPagtoJur: TppDBText;
    ppdbSumAplicacoes: TppDBCalc;
    ppdbSumVlrIOF: TppDBCalc;
    ppdbSumPagtoJuros: TppDBCalc;
    ppdbLucPrej: TppDBText;
    ppdbSumLucPrej: TppDBCalc;
    lblLucPrej: TppLabel;
    ppShape1: TppShape;
    ppLine1: TppLine;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppSummaryBand1: TppSummaryBand;
    ppDBText2: TppDBText;
    ppDBText15: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppLabel7: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppShape2: TppShape;
    qryMapaMensalRFAnalitico: TwwQuery;
    dsMapaMensalRFAnalitico: TwwDataSource;
    pplMapaMensalRFAnalitico: TppBDEPipeline;
    ppLine3: TppLine;
    ppDBText3: TppDBText;
    pplTrcPlano: TppLabel;
    ppDBCalc1: TppDBCalc;
    qryMapaMensalRFAnaliticoPLANPRVCONTABPATRO: TStringField;
    qryMapaMensalRFAnaliticoCLASSE: TStringField;
    qryMapaMensalRFAnaliticoINVESTIMENTO: TStringField;
    qryMapaMensalRFAnaliticoDATAOPERACAO: TDateTimeField;
    qryMapaMensalRFAnaliticoVENCIMENTO: TDateTimeField;
    qryMapaMensalRFAnaliticoIDOPERRENFIX: TFloatField;
    qryMapaMensalRFAnaliticoIDINVESTIMENTO: TFloatField;
    qryMapaMensalRFAnaliticoIDOPERRENFIXAPLIC: TFloatField;
    qryMapaMensalRFAnaliticoIDPLANPREVCTBPATR: TFloatField;
    qryMapaMensalRFAnaliticoVALORAPLICADO: TFloatField;
    qryMapaMensalRFAnaliticoSALDOANTERIOR: TFloatField;
    qryMapaMensalRFAnaliticoSALDO: TFloatField;
    qryMapaMensalRFAnaliticoCORRECAO: TFloatField;
    qryMapaMensalRFAnaliticoJUROS: TFloatField;
    qryMapaMensalRFAnaliticoVLRPROVPERDA: TFloatField;
    qryMapaMensalRFAnaliticoAGIODESAGIO: TFloatField;
    qryMapaMensalRFAnaliticoVLRIOF: TFloatField;
    qryMapaMensalRFAnaliticoRESGATES: TFloatField;
    qryMapaMensalRFAnaliticoLUCPREJ: TFloatField;
    qryMapaMensalRFAnaliticoAPLICACOES: TFloatField;
    qryMapaMensalRFAnaliticoPAGTOJUR: TFloatField;
    qryMapaMensalRFAnaliticoTRCPLANO: TFloatField;
    qryMapaMensalRFAnaliticoDIF: TFloatField;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBText4: TppDBText;
    pplTransfPlanoAnal: TppLabel;
    ppdbTrcPlanoAnal: TppDBText;
    qryMapaMensalRFPLANPRVCONTABPATRO: TStringField;
    qryMapaMensalRFCLASSE: TStringField;
    qryMapaMensalRFINVESTIMENTO: TStringField;
    qryMapaMensalRFIDINVESTIMENTO: TFloatField;
    qryMapaMensalRFVALORAPLICADO: TFloatField;
    qryMapaMensalRFSALDOANTERIOR: TFloatField;
    qryMapaMensalRFSALDO: TFloatField;
    qryMapaMensalRFCORRECAO: TFloatField;
    qryMapaMensalRFJUROS: TFloatField;
    qryMapaMensalRFVLRPROVPERDA: TFloatField;
    qryMapaMensalRFAGIODESAGIO: TFloatField;
    qryMapaMensalRFVLRIOF: TFloatField;
    qryMapaMensalRFRESGATES: TFloatField;
    qryMapaMensalRFLUCPREJ: TFloatField;
    qryMapaMensalRFAPLICACOES: TFloatField;
    qryMapaMensalRFPAGTOJUR: TFloatField;
    qryMapaMensalRFTRCPLANO: TFloatField;
    qryMapaMensalRFIDPLANPREVCTBPATR: TFloatField;
    shpDetalhe1: TppShape;
    qryMapaMensalRFPRINCIPAL: TFloatField;
    qryMapaMensalRFAnaliticoPRINCIPAL: TFloatField;
    qryMapaMensalRFDIF: TFloatField;
    ppDBText5: TppDBText;
    qryMapaMensalRFCAMPO25: TStringField;
    qryMapaMensalRFAnaliticoSEGMENTACAO: TStringField;
    qryMapaMensalRFSEGMENTACAO: TStringField;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppDBText65: TppDBText;
    ppLine8: TppLine;
    ppLine9: TppLine;
    procedure shpDetalhePrint(Sender: TObject);
    procedure rptMapaMensalRFStartPage(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure qryMapaMensalRFAfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
    function MostraParam(Form: String): boolean; OverRide;
  end;

var
  DmRelRFMapaMensal: TDmRelRFMapaMensal;

implementation

uses FParamMapaInvRF, FTelaAut;


{$R *.DFM}

{ TDmRelRFMapaMensal }

function TDmRelRFMapaMensal.MostraParam(Form: String): boolean;
begin
   try
      AbrirForm(frmParamMapaInvRF,TfrmParamMapaInvRF, false);
      frmParamMapaInvRF.fModal := True;
      frmParamMapaInvRF.WindowState := wsNormal;
      Result := True
   except
      Result := False;
   end;
end;

procedure TDmRelRFMapaMensal.rptMapaMensalRFStartPage(Sender: TObject);
begin
   inherited;
   cCorZebra := $00E3E3E3;
   shpDetalhe.Brush.Color := clWhite;
end;

procedure TDmRelRFMapaMensal.shpDetalhePrint(Sender: TObject);
begin
   inherited;
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelRFMapaMensal.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
   inherited;
   // A cada quebra de Grupo volta a cor para branco
   cCorZebra := $00E3E3E3;
end;

procedure TDmRelRFMapaMensal.qryMapaMensalRFAfterScroll(DataSet: TDataSet);
begin
  inherited;
   //AL_1
   //AL_10
   qryMapaMensalRFAnalitico.Filter := 'IDPLANPREVCTBPATR = ' + qryMapaMensalRFIDPLANPREVCTBPATR.AsString + ' AND IDINVESTIMENTO = ' + qryMapaMensalRFIDINVESTIMENTO.AsString;
end;

procedure TDmRelRFMapaMensal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
action:=cafree;
end;

end.
