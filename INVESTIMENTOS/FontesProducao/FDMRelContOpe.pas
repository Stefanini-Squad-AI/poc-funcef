//********************************************************************************************************
// Data     : 23/03/2007
// Código   : AL_4
// Pendencia: 24844
// Sol      : 56250
// Função   : Respeitar a segregação de planos. Incluir o Planprevctbpatr no order by da qry e criei
//            um grupo
//********************************************************************************************************
// Data     : 08/03/2007
// Código   : AL_3
// Pendencia: 24676
// Sol      : 55162
// Função   : Incluir a Coluna Plano/Patrocinadora
//********************************************************************************************************
// Data     : 28/02/2007
// Código   : AL_2
// Pendencia: 24553
// Sol      : 53867
// Função   : Incluir a Coluna Observação no Relatório Operações
//********************************************************************************************************
// Data     : 11/05/2006
// Código   : AL_1
// Pendencia: 22317
// Sol      : 43013
// Função   : Implementação do Relatório
//********************************************************************************************************

unit FDMRelContOpe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, Series, TeEngine, ExtCtrls, TeeProcs, Chart,
  ppChrtDP, ppChrt, ppStrtch, ppSubRpt, ppMemo;

type
  TDMRelContOpe = class(TDmRelatoriosInv)
    ppl: TppBDEPipeline;
    ds: TwwDataSource;
    qry: TwwQuery;
    rpt: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    lblContrato: TppLabel;
    ppDBImage1: TppDBImage;
    ppShape2: TppShape;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel4: TppLabel;
    ppDetailBand1: TppDetailBand;
    shpDetalhe: TppShape;
    DATAOPERACAO: TppDBText;
    SLDANT: TppDBText;
    SLDPPANT: TppDBText;
    VLROPERACAO: TppDBText;
    QUANTIDADE: TppDBText;
    VLRPROVPERDA: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    shpGrupoContrato: TppShape;
    ppDBText1: TppDBText;
    ppLabel6: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    qryCONTRATO: TStringField;
    qryDESCTIPOOPERACAO: TStringField;
    qryDATAOPERACAO: TDateTimeField;
    qryDATALIQUIDACAO: TDateTimeField;
    qryVLROPERACAO: TFloatField;
    qryQUANTIDADE: TFloatField;
    qrySLDANT: TFloatField;
    qrySLDPPANT: TFloatField;
    qryVLRPROVPERDA: TFloatField;
    qryVLRLUCPREJ: TFloatField;
    ppLabel14: TppLabel;
    DATALIQUIDACAO: TppDBText;
    ppLabel15: TppLabel;
    DESCTIPOOPERACAO: TppDBText;
    qryGRUPO: TStringField;
    ppShape1: TppShape;
    srptOperacao: TppSubReport;
    ppChildReport1: TppChildReport;
    QryDetalhe: TwwQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField3: TStringField;
    DtsDetalhe: TwwDataSource;
    pplDetalhe: TppBDEPipeline;
    ppDetailBand2: TppDetailBand;
    cabOperacoes: TppHeaderBand;
    ppShape3: TppShape;
    ppLabel3: TppLabel;
    ppDBMemo1: TppDBMemo;
    qryOBSERVACAO: TMemoField;
    QryDetalheOBSERVACAO: TMemoField;
    qryIDOPERCONTACOES: TFloatField;
    QryDetalheIDOPERCONTACOES: TFloatField;
    ppSummaryBand1: TppSummaryBand;
    ppLine1: TppLine;
    qryPLANPRVCONTABPATRO: TStringField;
    QryDetalhePLANPRVCONTABPATRO: TStringField;
    ppDBText2: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    procedure rptStartPage(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
    procedure shpGrupoContratoPrint(Sender: TObject);
    procedure qryAfterScroll(DataSet: TDataSet);
    procedure qryAfterOpen(DataSet: TDataSet);
    procedure srptOperacaoPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DMRelContOpe: TDMRelContOpe;

implementation

{$R *.DFM}


procedure TDMRelContOpe.rptStartPage(Sender: TObject);
begin
  inherited;
  cCorZebra := $00E3E3E3;
end;

procedure TDMRelContOpe.shpDetalhePrint(Sender: TObject);
begin
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;

   TppShape(Sender).Brush.Color := cCorZebra;

   inherited;

end;

procedure TDMRelContOpe.shpGrupoContratoPrint(Sender: TObject);
begin
  inherited;
  cCorZebra := $00E3E3E3;
end;

procedure TDMRelContOpe.qryAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qrydetalhe.Filter := 'IDOPERCONTACOES = ' + qryIDOPERCONTACOES.AsString;
end;

//AL_2
procedure TDMRelContOpe.qryAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qrydetalhe.Filter := 'IDOPERCONTACOES = ' + qryIDOPERCONTACOES.AsString;
end;

//AL_2
procedure TDMRelContOpe.srptOperacaoPrint(Sender: TObject);
begin
  inherited;
  cabOperacoes.Visible := True;
end;

end.
