{---------------------------Alteração-------------------------------------------
Pendência   : SOL 114575 KINTANA 535771
Responsável : Jéssica Lana
Data        : 24/04/2009
Descrição   : Gravar arquivos com a query de entrada na pasta C:\PLANUS\TEMP.
-------------------------------------------------------------------------------}
unit dRelContaCorrente;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE;

type
   TTipoRel = (trAnalitico, trSintetico);

   TdtmRelContaCorrente = class(TdtmReports)
      pplContaCorrente: TppBDEPipeline;
      dsContaCorrente: TwwDataSource;
      rptContaCorrente: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppDBText1: TppDBText;
      ppDBText3: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppLine5: TppLine;
      ppLabel122: TppLabel;
      ppShape2: TppShape;
      ppLine4: TppLine;
      ppShape3: TppShape;
      ppLabel13: TppLabel;
      ppLabel19: TppLabel;
      qryContaCorrente: TwwQuery;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBCalc5: TppDBCalc;
      ppDBCalc14: TppDBCalc;
      ppShape4: TppShape;
      ppLabel14: TppLabel;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppDBText7: TppDBText;
      ppDBText16: TppDBText;
      ppDBText8: TppDBText;
      ppDBText21: TppDBText;
      ppDBText2: TppDBText;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      qryContaCorrenteIDCONTRATOEMPTMO: TFloatField;
      qryContaCorrenteIDPESSOA: TFloatField;
      qryContaCorrenteNOME: TStringField;
      qryContaCorrenteDATAASSINATURA: TDateTimeField;
      qryContaCorrenteDATACREDITO: TDateTimeField;
      qryContaCorrenteNUMPARCELAS: TFloatField;
      qryContaCorrenteHMEPARCELA: TFloatField;
      qryContaCorrenteHMEVLRPREVISTO: TFloatField;
      qryContaCorrenteHMEVLREFETIVO: TFloatField;
      qryContaCorrenteHMEDATAPREVISTA: TDateTimeField;
      qryContaCorrenteHMEDATAVENCTO: TDateTimeField;
      qryContaCorrenteHMEDATAEFETIVA: TDateTimeField;
      qryContaCorrenteVLR_ANT: TFloatField;
      qryContaCorrenteVLR_ATU: TFloatField;
      qryContaCorrenteVLR_PAGO: TFloatField;
      ppDBText9: TppDBText;
      ppDBText10: TppDBText;
      ppDBCalc6: TppDBCalc;
      ppDBCalc7: TppDBCalc;
      ppDBCalc8: TppDBCalc;
      ppDBCalc9: TppDBCalc;
      qryContaCorrenteMATRICULA: TStringField;
      qryContaCorrenteIDSITPLANOPREV: TFloatField;
      qryContaCorrenteIDTIPOCONTREMPTMO: TFloatField;
      qryContaCorrenteDESCRICAO: TStringField;
      qryContaCorrenteTCEDESCRICAO: TStringField;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppDBText12: TppDBText;
      ppShape5: TppShape;
      ppShape1: TppShape;
      ppDBText11: TppDBText;
      ppLabel11: TppLabel;
      ppLabel10: TppLabel;
      ppDBText6: TppDBText;
      ppLabel4: TppLabel;
      ppLabel6: TppLabel;
      ppLabel12: TppLabel;
      ppLabel15: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel5: TppLabel;
      ppLabel9: TppLabel;
      ppLabel16: TppLabel;
      ppDBText13: TppDBText;
      ppDBCalc10: TppDBCalc;
      ppDBCalc11: TppDBCalc;
      ppDBCalc12: TppDBCalc;
      ppDBCalc13: TppDBCalc;
      ppDBCalc15: TppDBCalc;
      qryContaCorrenteMATRICTIT: TStringField;
      qryContaCorrenteNOMETIT: TStringField;
      ppDBText14: TppDBText;
      ppDBText15: TppDBText;
      qryContaCorrenteSLD_DEV_ANT: TFloatField;
      qryContaCorrenteVLR_DEV_ANT: TFloatField;
      qryContaCorrenteSLD_DEV_ATU: TFloatField;
      qryContaCorrenteVLR_DEV_ATU: TFloatField;
    ppLabel17: TppLabel;
    ppLine1: TppLine;
    ppShape6: TppShape;
    ppDBCalc16: TppDBCalc;
    ppDBCalc17: TppDBCalc;
    ppDBCalc18: TppDBCalc;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    qryContaCorrenteDESCSITCONTRATO: TStringField;
    qryContaCorrenteDATA_QUITACAO: TDateTimeField;

      procedure ppLine4Print(Sender: TObject);
      procedure ppShape3Print(Sender: TObject);
      procedure ppLabel13Print(Sender: TObject);
      procedure qryContaCorrenteBeforeOpen(DataSet: TDataSet);
      procedure ppShape1Print(Sender: TObject);
    procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand3BeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand1BeforePrint(Sender: TObject);


   private { Private declarations }

      //    Cores:
      //    ColorA = $FFFFFF   { branco, clWhite }
      //    ColorC = $00C0FFFF { amarelo - pastel }
      //    ColorD = $00C6F9CC { verde - pastel }
      //    ColorE = $00F3E6CD { azul - pastel }
      //    ColorF = $00A0A0A0
      //    ColorG = $00BEBEBE
      //    ColorH = $00D2D2D2
      //    ColorI = $00E3E3E3

   public { Public declarations }

      sMesCompetencia   : String;
      bSeparador        : Boolean;
      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;
      tAnalSint         : TTipoRel;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelContaCorrente: TdtmRelContaCorrente;



implementation
{$R *.DFM}
uses
   UFuncoesEmptmo, uSistema, cRelContaCorrente;



function TdtmRelContaCorrente.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelcontacorrente') then begin
      frm := TcfgRelContaCorrente.Create(Application);
   end else begin
      frm := nil;
   end;

   if frm = nil then begin
      Result := False;
      Exit;
   end;

   with frm do begin
      Result := (ShowModal = mrOk);
      Free;
   end;
end;



procedure TdtmRelContaCorrente.ppLine4Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador and (tAnalSint = trAnalitico);
end;



procedure TdtmRelContaCorrente.ppShape3Print(Sender: TObject);
begin
   inherited;

   if bCorLinha then begin
      if CorAtual = clWhite then begin
         CorAtual := CorLinha;
      end else begin
         CorAtual := clWhite;
      end;
   end else begin
      CorAtual := clWhite;
   end;

   (Sender as TppShape).Brush.Color := CorAtual;
   (Sender as TppShape).Visible     := (tAnalSint = trAnalitico);
end;



procedure TdtmRelContaCorrente.ppLabel13Print(Sender: TObject);
begin
   inherited;
   TppLabel(Sender).Caption := sMesCompetencia;
end;



procedure TdtmRelContaCorrente.qryContaCorrenteBeforeOpen(DataSet: TDataSet);
begin
   inherited;

   (* Gravando o SQL de entrada para permitir verificação *)
  //Jéssica Lana SOL 114575 Kintana 535771 24/04/2009
  //qryContaCorrente.SQL.SaveToFile(Sistema.TempDir + 'EP-RelContaCorrente.txt');
    qryContaCorrente.SQL.SaveToFile(ftempregra + '\' + 'EP-RelContaCorrente.txt');
   Application.ProcessMessages;
end;



procedure TdtmRelContaCorrente.ppShape1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppShape).Brush.Color := clSilver;
end;



procedure TdtmRelContaCorrente.ppDetailBand1BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppDetailBand).Visible := (tAnalSint = trAnalitico);
end;



procedure TdtmRelContaCorrente.ppGroupFooterBand3BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppGroupFooterBand).Visible := (tAnalSint = trAnalitico);
end;



procedure TdtmRelContaCorrente.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppGroupFooterBand).Visible := (tAnalSint = trAnalitico);
end;



procedure TdtmRelContaCorrente.ppGroupHeaderBand1BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppGroupHeaderBand).Visible := (tAnalSint = trAnalitico);
end;



end.
