//********************************************************************************************************
// Data     : 22/06/2007
// Código   : AL_8
// Pendencia: 25246
// Sol      : 42459
// Função   : O Relatório imprimirá os contratos que possuem saldo no dia
//            Se houver a impressão de gráfico o sistema permitirá informar o período
//            Quando não houver saldo na data será impresso somente o cabeçalho
//********************************************************************************************************
// Data     : 23/03/2007
// Código   : AL_7
// Pendencia: 24844
// Sol      : 56250
// Função   : Respeitar a Segregação de Planos (Foi alterada a Qry coloquei planprevctbpatr no order by)
//            Criei um grupo no relatorio
//********************************************************************************************************
// Data     : 14/03/2007
// Código   : AL_6
// Pendencia:
// Sol      :
// Função   : Acerto no Lay-out
//********************************************************************************************************
// Data     : 08/03/2007
// Código   : AL_5
// Pendencia: 24676
// Sol      : 55162
// Função   : Incluir o plano/patrocinadora
//********************************************************************************************************
// Data     : 08/05/2006
// Código   : AL_4
// Pendencia:
// Sol      :
// Função   : Implementação de Liquidação de Contrato
//********************************************************************************************************
// Data     : 06/01/2006
// Código   : AL_3
// Pendencia:
// Sol      :
// Função   : Alteração no lay-out por solicitação da Funcef
//********************************************************************************************************
// Data     : 04/01/2006
// Código   : AL_2
// Pendencia:
// Sol      :
// Função   : Alteração no lay-out por solicitação da Funcef
//********************************************************************************************************
// Data     : 16/12/2005
// Código   : AL_1
// Pendencia:
// Sol      :
// Função   : Implementação do flag de visibilidade do gráfico
//********************************************************************************************************
// Definição  : O Relatório imprimirá os contratos que possuem saldo no dia
//              Se houver a impressão de gráfico o sistema permitirá informar o período
//              Quando não houver saldo na data será impresso somente o cabeçalho
//********************************************************************************************************

unit FDMRelContSaldos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, Series, TeEngine, ExtCtrls, TeeProcs, Chart,
  ppChrtDP, ppChrt, ppModule, raCodMod;

type
  TDMRelContSaldos = class(TDmRelatoriosInv)
    ppl: TppBDEPipeline;
    ds: TwwDataSource;
    qry: TwwQuery;
    rpt: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    lblContrato: TppLabel;
    ppDBImage1: TppDBImage;
    lblPeriodo: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    qryCONTRATO: TStringField;
    qryDATAHISTCONTACOES: TDateTimeField;
    qrySALDORECEBER: TFloatField;
    qrySALDOPAGAR: TFloatField;
    qryVARIACAO: TFloatField;
    qrySALDOLIQUIDO: TFloatField;
    qryPROVISAO: TFloatField;
    qrySALDOPROV: TFloatField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBText1: TppDBText;
    ppLabel6: TppLabel;
    shpGrupoContrato: TppShape;
    shpDetalhe: TppShape;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppShape2: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppDBText4: TppDBText;
    ppLabel9: TppLabel;
    ppDBText5: TppDBText;
    ppLabel10: TppLabel;
    ppDBText6: TppDBText;
    ppLabel11: TppLabel;
    ppDBText7: TppDBText;
    ppLabel12: TppLabel;
    ppDBText8: TppDBText;
    ppLabel13: TppLabel;
    graGrafico: TppDPTeeChart;
    qryGraf: TwwQuery;
    StringField1: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    dsGraf: TwwDataSource;
    pplGraf: TppBDEPipeline;
    qryIDOPERCONTACOES: TFloatField;
    qryGrafIDOPERCONTACOES: TFloatField;
    qryQTDRECEBER: TFloatField;
    qryQTDPAGAR: TFloatField;
    qrySLDPROVISAO: TFloatField;
    qryGrafSLDPROVISAO: TFloatField;
    ppDBText9: TppDBText;
    ppLabel3: TppLabel;
    ppDBText10: TppDBText;
    ppLabel4: TppLabel;
    qryGrafIDOPERCONTACOESAP: TFloatField;
    qryIDOPERCONTACOESAP: TFloatField;
    //AL_5
    ppDBText11: TppDBText;
    qryPLANPRVCONTABPATRO: TStringField;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    qryGrafPLANPRVCONTABPATRO: TStringField;
    //AL_8
    qryGrafQTDRECEBER: TFloatField;
    ppPageStyle1: TppPageStyle;
    raCodeModule1: TraCodeModule;
    updQry: TUpdateSQL;

    procedure rptStartPage(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
    procedure graGraficoPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DMRelContSaldos: TDMRelContSaldos;

implementation

{$R *.DFM}

procedure TDMRelContSaldos.rptStartPage(Sender: TObject);
begin
  inherited;
  cCorZebra := $00E3E3E3;
end;

procedure TDMRelContSaldos.shpDetalhePrint(Sender: TObject);
begin
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3                  
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra;

   inherited;

end;

procedure TDMRelContSaldos.graGraficoPrint(Sender: TObject);
begin
   qryGraf.Filter := 'IDOPERCONTACOESAP = ' + qryIDOPERCONTACOESAP.AsString;
   inherited;
end;

end.
