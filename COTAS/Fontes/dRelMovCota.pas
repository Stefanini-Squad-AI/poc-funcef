unit dRelMovCota;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB,
   ppDBPipe, ppDBBDE, ADODB, DBClient, Provider, FCmReport, uCmRptManager,
   TXComp, CmParamReport, dLookCota, ppModule, raCodMod, ppStrtch, ppSubRpt,
  uCMClientDataSet, uCmSqlParams;

type
   TdtmRelMovCota = class(TdtmReports)
      dtsMovCota: TwwDataSource;
      qryMovCota: TwwQuery;
      rptMovCota: TppReport;
      rptContratosAdminSint_CabecalhoRelat: TppHeaderBand;
      pplbTitulo: TppLabel;
      pplbNomeEmpresa: TppLabel;
      ppItensContrato: TppDetailBand;
      shpItem: TppShape;
      ppFooterBand12: TppFooterBand;
      ppLine37: TppLine;
      ppShape1: TppShape;
      pplbNomeSistema: TppLabel;
      ppCalc23: TppSystemVariable;
      ppSystemVariable1: TppSystemVariable;
      ppDBText9: TppDBText;
      ppDBText12: TppDBText;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      lblTipoData: TppLabel;
      ppLabel5: TppLabel;
      ppLabel14: TppLabel;
      ppLabel15: TppLabel;
      ppDBText7: TppDBText;
      ppSubReport1: TppSubReport;
      ppChildReport1: TppChildReport;
      ppTitleBand1: TppTitleBand;
      ppDetailBand1: TppDetailBand;
      ppSummaryBand1: TppSummaryBand;
      qryMovCotaDATA: TDateTimeField;
      qryMovCotaVLRCOTIZADO: TFloatField;
      qryMovCotaATIVO: TStringField;
      qryMovCotaNOMEPLANO: TStringField;
      qryMovCotaNOMEPATRO: TStringField;
      qryMovCotaVLRPATRIMONIO: TFloatField;
      qryMovCotaPERNUMERO: TFloatField;
      qryMovCotaPEREXERCICIO: TFloatField;
      qryMovCotaVLRCOTA: TFloatField;
      qryMovCotaQTDCOTA: TFloatField;
      ppLabel8: TppLabel;
      ppLabel9: TppLabel;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      ppLabel19: TppLabel;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      qrySub: TwwQuery;
      dtsSub: TwwDataSource;
      qryMovCotaIDATIVOCOTA: TFloatField;
      qrySubCOTIZAMAIS: TFloatField;
      qrySubCOTIZAMENOS: TFloatField;
      qrySubRENTABILIZAMAIS: TFloatField;
      qrySubRENTABILIZAMENOS: TFloatField;
      ppDBText4: TppDBText;
      ppDBText5: TppDBText;
      ppDBText6: TppDBText;
      ppDBText8: TppDBText;
    ppShape2: TppShape;
    qrySubMOVIMENTACAO: TStringField;
    ppDBText10: TppDBText;
    ppShape3: TppShape;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppSummaryBand2: TppSummaryBand;
    ppLine1: TppLine;
    ppLabel1: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel2: TppLabel;
    CdsMovCota: TCMClientDataSet;
    ppDbLogo: TppDBImage;
    ppMovCota: TppDBPipeline;
    ppLbAtivo: TppLabel;
    ppLbPlano: TppLabel;
    ppLbPatro: TppLabel;
    LbDtInicio: TppLabel;
    LbDtFim: TppLabel;
    ppDadosFundacao: TppDBPipeline;
    CdsSub: TCMClientDataSet;
    ppSub: TppDBPipeline;
    CdsSubDATA: TDateTimeField;
    CdsSubDESCRICAO: TStringField;
    CdsSubVLRCOTIMAIS: TFloatField;
    CdsSubVLRCOTIMENOS: TFloatField;
    CdsSubVLRRENTMAIS: TFloatField;
    CdsSubVLRRENTMENOS: TFloatField;
    ppLinhaSeparadora: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    CdsMovCotaDATA: TDateTimeField;
    CdsMovCotaVLRPATRIMONIO: TFloatField;
    CdsMovCotaQTDCOTA: TFloatField;
    CdsMovCotaVLRCOTA: TFloatField;
    CdsMovCotaVLRCOTIZADO: TFloatField;
    CdsMovCotaVLRRENTABILIZADO: TFloatField;
    CdsMovCotaATIVO: TStringField;
    CdsMovCotaORIGEMATIVO: TStringField;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText1: TppDBText;
    CMSqlParams1: TCMSqlParams;
    CdsMovCotaDATAINI: TDateTimeField;

      procedure shpItemPrint(Sender: TObject);
      procedure ppLbDtInicioPrint(Sender: TObject);
      procedure ppLbDtFimPrint(Sender: TObject);
    procedure ppShape2Print(Sender: TObject);
    procedure ppSubReport1Print(Sender: TObject);
    procedure rptMovCotaStartPage(Sender: TObject);
    procedure rptMovCotaEndPage(Sender: TObject);

   private { Private declarations }

   public { Public declarations }

      bSeparador        : Boolean;
      CorLinha          : TColor;
      CorAtual          : TColor;
      bCorLinha         : Boolean;

      sDataIni          : String;
      sDataFim          : String;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelMovCota: TdtmRelMovCota;



implementation
{$R *.DFM}
uses
   cRelMovCota;




function TdtmRelMovCota.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   if (LowerCase(Form) = 'cfgrelmovcota') then
   begin
      frm := TcfgRelMovCota.Create(Application);
   end
   else
   begin
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



procedure TdtmRelMovCota.shpItemPrint(Sender: TObject);
begin
   inherited;

   if bCorLinha then
   begin
      if CorAtual = clWhite then
      begin
         CorAtual := CorLinha;
      end
      else
      begin
         CorAtual := clWhite;
      end;
   end
   else
   begin
      CorAtual := clWhite;
   end;

   (Sender as TppShape).Brush.Color := CorAtual;
end;



procedure TdtmRelMovCota.ppLbDtInicioPrint(Sender: TObject);
begin
   inherited;
   (Sender as TppLabel).Caption := sDataIni;
end;



procedure TdtmRelMovCota.ppLbDtFimPrint(Sender: TObject);
begin
   inherited;
   (Sender as TppLabel).Caption := sDataFim;
end;



procedure TdtmRelMovCota.ppShape2Print(Sender: TObject);
begin
   inherited;

   if bCorLinha then
   begin
      if CorAtual = clWhite then
      begin
         CorAtual := CorLinha;
      end
      else
      begin
         CorAtual := clWhite;
      end;
   end
   else
   begin
      CorAtual := clWhite;
   end;

   (Sender as TppShape).Brush.Color := CorAtual;
end;



procedure TdtmRelMovCota.ppSubReport1Print(Sender: TObject);
begin
  inherited;

  if CdsMovCota.FieldByName('DATAINI').AsDateTime <> 0 then
  begin
       CdsSub.Filter := 'DATA >= ' + QuotedStr(CdsMovCota.FieldByName('DATAINI').AsString) +
                        ' AND DATA <= ' + QuotedStr(CdsMovCota.FieldByName('DATA').AsString);
  end
  else
  begin
       CdsSub.Filter := 'DATA = ' + QuotedStr(CdsMovCota.FieldByName('DATA').AsString);
  end;
end;

procedure TdtmRelMovCota.rptMovCotaStartPage(Sender: TObject);
begin
  inherited;
  CdsSub.Filtered := true;
  ppLinhaSeparadora.Visible := bSeparador;
end;

procedure TdtmRelMovCota.rptMovCotaEndPage(Sender: TObject);
begin
  inherited;
  CdsSub.Filtered := false;
end;

end.

