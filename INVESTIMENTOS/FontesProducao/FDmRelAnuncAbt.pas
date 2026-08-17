//********************************************************************************************************
//Data    : 19/01/2006
//Codigo  : AL_4
//Descr.  : Implementação de flag de AGE totalmente recebida independente de haver diferença
//********************************************************************************************************
//Data    : 13/10/2005
//Codigo  : AL_3
//Descr.  : Passa a mostrar o motivo de bloqueio de cada operação
//********************************************************************************************************
//Data    : 29/09/2005
//Codigo  : AL_2
//Descr.  : Ajustes no Lay Out por definição de Ribas/Roseli (Funcef)
//********************************************************************************************************
//Data    : 16/09/2005
//Codigo  : AL_1
//Descr.  : Implementação de Cancelamento de Recebimento (PAS e DFM)
//********************************************************************************************************

unit FDmRelAnuncAbt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FDMRelatoriosInv, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache,
  ppProd, ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE;

type
  TDmRelAnuncAbt = class(TDmRelatoriosInv)
    pplAnunciosAbt: TppBDEPipeline;
    dsAnunciosAbt: TwwDataSource;
    qryAnunciosAbt: TwwQuery;
    rptAnunciosAbt: TppReport;
    ppHeaderBand1: TppHeaderBand;
    lblNomeRel: TppLabel;
    ppLabel2: TppLabel;
    lblCarteira: TppLabel;
    ppDBImage1: TppDBImage;
    lblFiltros: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel5: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    qryAnunciosAbtBOLETA: TStringField;
    qryAnunciosAbtDESCTIPOOPERACAO: TStringField;
    qryAnunciosAbtDATAEX: TDateTimeField;
    qryAnunciosAbtDATAPREVISTA: TDateTimeField;
    qryAnunciosAbtDATABASE: TDateTimeField;
    qryAnunciosAbtDESCINVESTIMENTO: TStringField;
    qryAnunciosAbtQTDPREVISTA: TFloatField;
    qryAnunciosAbtQTDRECEBIDA: TFloatField;
    qryAnunciosAbtPRECOUNITOPERACAO: TFloatField;
    qryAnunciosAbtVLROPERACAO: TFloatField;
    qryAnunciosAbtIDGRUPO: TStringField;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppgRodape: TppGroupFooterBand;
    ppDBText1: TppDBText;
    shpDetalhe: TppShape;
    ppDBText2: TppDBText;
    shpCabecalho: TppShape;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppLabel14: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    dbtTotQtdPrev: TppDBCalc;
    dbtTotQtdRec: TppDBCalc;
    dbtTotQtdRest: TppDBCalc;
    dbtTovVlrOper: TppDBCalc;
    pplTotal: TppLine;
    qryAnunciosAbtDESCCARTINVEST: TStringField;
    ppDBText12: TppDBText;
    ppLabel15: TppLabel;
    lblTotais: TppLabel;
    dbcCount: TppDBCalc;
    shpTotal: TppShape;
    dbtTotQtdCan: TppDBCalc;
    ppDBText13: TppDBText;
    ppLabel16: TppLabel;
    qryAnunciosAbtQTDCANCELADA: TFloatField;
    qryAnunciosAbtVALORPREVISTO: TFloatField;
    shpGrupo: TppShape;
    qryAnunciosAbtSIGLAMOTBLOQ: TStringField;
    qryAnunciosAbtDESCMOTBLOQ: TStringField;
    qryAnunciosAbtCONTA: TStringField;
    ppLabel17: TppLabel;
    ppDBText14: TppDBText;
    ppLabel18: TppLabel;
    ppDBText15: TppDBText;
    procedure ppgRodapeBeforePrint(Sender: TObject);
    procedure shpDetalhePrint(Sender: TObject);
    procedure rptAnunciosAbtStartPage(Sender: TObject);
    procedure ppgRodapeAfterPrint(Sender: TObject);
    procedure lblNomeRelPrint(Sender: TObject);
  private
    { Private declarations }
    cCorZebra : TColor;
  public
    { Public declarations }
  end;

var
  DmRelAnuncAbt: TDmRelAnuncAbt;

implementation

{$R *.DFM}

procedure TDmRelAnuncAbt.ppgRodapeBeforePrint(Sender: TObject);
begin
   // Só imprime o totalizador quando houverem mais de uma linha
   if dbcCount.Value > 1 then
   begin
      lblTotais.Visible := True;
      dbtTotQtdPrev.Visible := True;
      dbtTotQtdRec.Visible := True;
      //AL_1
      dbtTotQtdCan.Visible := True;
      dbtTotQtdRest.Visible := True;
      dbtTovVlrOper.Visible := True;
      pplTotal.Visible := True;
      shpTotal.Visible := True;
   end
   else
   begin
      lblTotais.Visible := False;
      dbtTotQtdPrev.Visible := False;
      dbtTotQtdRec.Visible := False;
      //AL_1
      dbtTotQtdCan.Visible := False;
      dbtTotQtdRest.Visible := False;
      dbtTovVlrOper.Visible := False;
      pplTotal.Visible := False;
      shpTotal.Visible := False;
   end;
   inherited;
end;

procedure TDmRelAnuncAbt.shpDetalhePrint(Sender: TObject);
begin
   inherited;
   // Imprime a linha de detalhe na cor certa
   TppShape(Sender).Brush.Color := cCorZebra
end;

procedure TDmRelAnuncAbt.rptAnunciosAbtStartPage(Sender: TObject);
begin
   inherited;
   // Inicia o relatório com a cor default
   cCorZebra              := clWhite;
   shpDetalhe.Brush.Color := $00E3E3E3;
end;

procedure TDmRelAnuncAbt.ppgRodapeAfterPrint(Sender: TObject);
begin
   inherited;
   // Troca a cor no rodapé, para imprimir uma AGE de cada cor
   if cCorZebra = ClWhite then
      cCorZebra := $00E3E3E3
   else
      cCorZebra := ClWhite;
end;

procedure TDmRelAnuncAbt.lblNomeRelPrint(Sender: TObject);
begin
  // AL_3
  lblNomeRel.Caption := rptAnunciosAbt.PrinterSetup.DocumentName;
  inherited;
end;

end.
