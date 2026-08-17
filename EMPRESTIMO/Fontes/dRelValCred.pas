 unit dRelValCred;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   dReports, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd, ppReport,
   Db, DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe,
   ppDBBDE, ppVar, ppStrtch, ppSubRpt, Grids, DBGrids, ppRichTx, ppMemo;

type
   TdtmRelValCred = class(TdtmReports)
      qryValCred: TwwQuery;
      pplValCred: TppBDEPipeline;
      dtsValCred: TwwDataSource;
      qryValCredFLGFORMAPAG: TStringField;
      qryValCredDATACREDITO: TDateTimeField;
      qryValCredPORTFORMAPAG: TFloatField;
      qryValCredCODFORMAPAG: TFloatField;
      qryValCredIDCONTRATOEMPTMO: TFloatField;
      qryValCredMATRICULA: TStringField;
      qryValCredNUMBANCO: TStringField;
      qryValCredNUMAGENCIA: TStringField;
      qryValCredCONTACORRENTE: TStringField;
      qryValCredHMEVLRPREVISTO: TFloatField;
      rptValCred: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppLine2: TppLine;
      ppLabel3: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppSystemVariable2: TppSystemVariable;
      ppLabel122: TppLabel;
      rptValCred_lblDataIni: TppLabel;
      rptValCred_lblDataFim: TppLabel;
      ppLabel13: TppLabel;
      ppLabel14: TppLabel;
      rptValCred_lblFormaCred: TppLabel;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppGroup3: TppGroup;
      ppGroupHeaderBand3: TppGroupHeaderBand;
      ppGroupFooterBand3: TppGroupFooterBand;
      ppGroup4: TppGroup;
      ppGroupHeaderBand4: TppGroupHeaderBand;
      ppGroupFooterBand4: TppGroupFooterBand;
      ppLine1: TppLine;
      ppShape1: TppShape;
      ppDBText1: TppDBText;
      ppLabel4: TppLabel;
      ppLine3: TppLine;
      ppShape2: TppShape;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBText4: TppDBText;
      ppShape3: TppShape;
      ppDBText5: TppDBText;
      ppDBCalc1: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      qryValCredNOME: TStringField;
      ppLabel15: TppLabel;
      ppShape5: TppShape;
      ppLabel16: TppLabel;
      ppLine6: TppLine;
      ppDBText9: TppDBText;
      qryValCredDESCFORMAPAG: TStringField;
      qryValCredPORTADOR_FORMA: TStringField;
      qryValCredFORMA: TStringField;
      ppDBText12: TppDBText;
      qryValCredPAGO: TStringField;
      ppLabel21: TppLabel;
      ppLine7: TppLine;
      ppLine8: TppLine;
      ppLabel22: TppLabel;
      ppLabel23: TppLabel;
      ppLabel24: TppLabel;
      ppLabel25: TppLabel;
      ppLabel26: TppLabel;
      ppLabel27: TppLabel;
      ppLabel28: TppLabel;
      ppLabel29: TppLabel;
      ppDBText13: TppDBText;
      ppDBText14: TppDBText;
      ppLabel7: TppLabel;
      ppShape4: TppShape;
      ppLabel8: TppLabel;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppLine4: TppLine;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      qryValCredHMEDATAVENCTO: TDateTimeField;
      qryValCredENVIADO: TStringField;
      ppLabel9: TppLabel;
      ppDBText10: TppDBText;
      qryContratosDuplicados: TwwQuery;
      pplContratosDuplicados: TppBDEPipeline;
      dsContratosDuplicados: TwwDataSource;
      qryValCredIDBENEF: TFloatField;
      qryValCredIDPESSOA: TFloatField;
      ppContratosDuplicados: TppSubReport;
      ppChildReport1: TppChildReport;
      ppTitleBand1: TppTitleBand;
      ppDetailBand2: TppDetailBand;
      ppSummaryBand1: TppSummaryBand;
      qryContratosDuplicadosIDCONTRATOEMPTMO: TFloatField;
      qryContratosDuplicadosMATRICULA: TStringField;
      qryContratosDuplicadosFLGSITUACAO: TStringField;
      qryContratosDuplicadosNOME: TStringField;
      qryContratosDuplicadosDATACREDITO: TDateTimeField;
      qryContratosDuplicadosPAGO: TStringField;
      qryContratosDuplicadosENVIADO: TStringField;
      qryContratosDuplicadosHMEDATAVENCTO: TDateTimeField;
      qryContratosDuplicadosHMEVLRPREVISTO: TFloatField;
      ppDBText11: TppDBText;
      ppDBText15: TppDBText;
      ppDBText16: TppDBText;
      ppDBText17: TppDBText;
      ppDBText18: TppDBText;
      ppLabel10: TppLabel;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppLabel17: TppLabel;
      ppLabel18: TppLabel;
      qryContratosDuplicadosIDPESSOA: TFloatField;
      qryContratosDuplicadosIDBENEF: TFloatField;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppMemo2: TppMemo;
    memPatro: TppRichText;
    memPlano: TppRichText;
    ppMemo1: TppMemo;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    lblTipoEmptmo: TppLabel;
    lblTipoContr: TppLabel;

      procedure ppLine1Print(Sender: TObject);
      procedure ppShape1Print(Sender: TObject);
      procedure ppGroupHeaderBand2BeforePrint(Sender: TObject);
      procedure ppDetailBand1BeforePrint(Sender: TObject);
    procedure rptValCredBeforePrint(Sender: TObject);


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

      bSeparador  : Boolean;
      CorLinha    : TColor;
      CorAtual    : TColor;
      bCorLinha   : Boolean;
      bSintetico  : Boolean;
      dDataIni    : TDateTime;
      dDataFim    : TDateTime;

      function MostraParam(Form: string): boolean; override;

   end;



var
  dtmRelValCred: TdtmRelValCred;



implementation
{$R *.DFM}
uses
   CRelValCred, USistema;



function TdtmRelValCred.MostraParam(Form: string): boolean;
var
   frm : TForm;
begin
   // criação dos forms de configuração de Relatórios

   // Prestação de Contas --------------------------------------------------------------------------------------
   if (LowerCase(Form) = 'cfgrelvalcred') then begin
      frm := TcfgRelValCred.Create(Application);
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



procedure TdtmRelValCred.ppLine1Print(Sender: TObject);
begin
   inherited;
   (Sender as TppLine).Visible := bSeparador;
end;



procedure TdtmRelValCred.ppShape1Print(Sender: TObject);
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
end;



procedure TdtmRelValCred.ppGroupHeaderBand2BeforePrint(Sender: TObject);
begin
   inherited;
   CorAtual := clWhite;
end;



procedure TdtmRelValCred.ppDetailBand1BeforePrint(Sender: TObject);
begin
   inherited;
   (Sender as TppDetailBand).Visible := not(bSintetico);
   if not bSintetico then
   begin
      ppContratosDuplicados.ExpandAll := False;
      ppContratosDuplicados.Visible   := False;

      qryContratosDuplicados.Filtered := False;
      qryContratosDuplicados.Filter   := 'IDPESSOA = ' + qryValCredIDPESSOA.AsString + ' AND IDBENEF = ' + qryValCredIDBENEF.AsString +
                                         ' AND IDCONTRATOEMPTMO <> ' + qryValCredIDCONTRATOEMPTMO.AsString;
      qryContratosDuplicados.Filtered := True;
      if not qryContratosDuplicados.IsEmpty then
      begin
         ppContratosDuplicados.ExpandAll := True;
         ppContratosDuplicados.Visible   := True;
      end;
   end;
end;



procedure TdtmRelValCred.rptValCredBeforePrint(Sender: TObject);
begin
  inherited;

  qryContratosDuplicados.Close;
  qryContratosDuplicados.ParamByName('pDATAINI').AsDateTime   := dDataIni;
  qryContratosDuplicados.ParamByName('pDATAFIM').AsDateTime   := dDataFim;
  qryContratosDuplicados.ParamByName('pIDEMPRESA').AsInteger  := Sistema.IDEMPRESA;
  qryContratosDuplicados.Open;
end;



end.
