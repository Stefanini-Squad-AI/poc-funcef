unit rCAFSelBxBens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport,
  ppBands, ppClass, ppVar, ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppCache,
  ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc;

type
  TRptCAFSelBxBens = class(TFrmCmReport)
    qrySldCtb: TwwQuery;
    qrySldCtbIDBEM: TFloatField;
    qrySldCtbIDPESSOA: TFloatField;
    qrySldCtbVALCTB: TFloatField;
    updSelBxBens: TUpdateSQL;
    qrySelBxBens: TwwQuery;
    dsSelBxBens: TwwDataSource;
    ppSelBxBens: TppBDEPipeline;
    rpSelBxBens: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppDetailBand1: TppDetailBand;
    rpSelBxBensDBCalc1: TppDBCalc;
    rpSelBxBensDBText7: TppDBText;
    rpSelBxBensDBText9: TppDBText;
    rpSelBxBensDBMemo1: TppDBMemo;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppLabel14: TppLabel;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    rpSelBxBensGroup1: TppGroup;
    rpSelBxBensGroupHeaderBand1: TppGroupHeaderBand;
    rpSelBxBensLabel1: TppLabel;
    rpSelBxBensLabel2: TppLabel;
    rpSelBxBensLabel3: TppLabel;
    rpSelBxBensLabel4: TppLabel;
    rpSelBxBensLabel6: TppLabel;
    rpSelBxBensLabel5: TppLabel;
    rpSelBxBensLabel7: TppLabel;
    rpSelBxBensLabel8: TppLabel;
    rpSelBxBensLine1: TppLine;
    rpSelBxBensLine2: TppLine;
    rpSelBxBensDBText1: TppDBText;
    rpSelBxBensDBText2: TppDBText;
    rpSelBxBensDBText3: TppDBText;
    rpSelBxBensLabel9: TppLabel;
    rpSelBxBensLabel10: TppLabel;
    rpSelBxBensDBText4: TppDBText;
    rpSelBxBensDBText5: TppDBText;
    rpSelBxBensDBText6: TppDBText;
    rpSelBxBensGroupFooterBand1: TppGroupFooterBand;
    rpSelBxBensLabel11: TppLabel;
    rpSelBxBensDBCalc2: TppDBCalc;
    rpSelBxBensLine3: TppLine;
    rpSelBxBensLine4: TppLine;
    qrySelBxBensSBXTERMO: TFloatField;
    qrySelBxBensIDSELBAIXA: TFloatField;
    qrySelBxBensSBXPROCESSO: TStringField;
    qrySelBxBensSBXDATA: TDateTimeField;
    qrySelBxBensNOMERESP: TStringField;
    qrySelBxBensNOMEDEST: TStringField;
    qrySelBxBensPLACA: TFloatField;
    qrySelBxBensIDBEM: TFloatField;
    qrySelBxBensIDPESSOA: TFloatField;
    qrySelBxBensDESCBEM: TStringField;
    qrySelBxBensVALAQUIS: TFloatField;
    qrySelBxBensVALCTB: TFloatField;
    qrySelBxBensSBXFLGEXECUTADO: TFloatField;
    qrySelBxBensSBXDTAEXECUTADO: TDateTimeField;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CrmRptCMChangeDataBaseName(Sender: TObject;
      sDataBaseName: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFSelBxBens: TRptCAFSelBxBens;

implementation

{$R *.DFM}

procedure TRptCAFSelBxBens.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   with qrySelBxBens do
   begin
      Close;
      if (not CmpRptCM.ParamValues[0].IsNull) and (CmpRptCM.ParamValues[0].AsInteger > 0)then
      begin
         SQL.Strings[18] := '   (SB.SBXTERMO = ' + CmpRptCM.ParamValues[0].AsString + ') AND ';
      end else
      begin
         SQL.Strings[18] := ' ';
         //-------------------------------------------------------------------------------
         case CmpRptCM.ParamValues[3].AsInteger of
            0: SQL.Strings[19] := '   (SB.SBXFLGEXECUTADO = 0) AND ';
            1: SQL.Strings[19] := '   (SB.SBXFLGEXECUTADO = 1) AND ';
         else
            SQL.Strings[19] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if (not CmpRptCM.ParamValues[1].IsNull) then
            SQL.Strings[20] := '   (SB.SBXDATA = TO_DATE(' + #39 + CmpRptCM.ParamValues[1].AsString + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')) AND'
         else
            SQL.Strings[20] := '';
         //-------------------------------------------------------------------------------
         if (not CmpRptCM.ParamValues[2].IsNull) then
            SQL.Strings[21] := '   (SB.IDRESPONSAVEL = ' + CmpRptCM.ParamValues[2].AsString + ') AND'
         else
            SQL.Strings[21] := '';
      end;
      //----------------------------------------------------------------------------------
      case CmpRptCM.ParamValues[5].AsInteger of
         0: SQL.Strings[28] := ' ORDER BY SB.SBXTERMO, B.PLACA ';
         1: SQL.Strings[28] := ' ORDER BY SB.SBXTERMO, B.DESBEM ';
         2: SQL.Strings[28] := ' ORDER BY SB.SBXTERMO, B.VALORG ';
      else
         SQL.Strings[28] := '';
      end;
   end;
   //-------------------------------------------------------------------------------------
   if (CmpRptCM.ParamValues[4].AsInteger = 0) then
   begin
      rpSelBxBensDBText9.DataField := 'VALCTB';
      rpSelBxBensLabel8.Caption    := 'Valor Residual';
      rpSelBxBensDBCalc2.DataField := 'VALCTB';
   end else
   begin
      rpSelBxBensDBText9.DataField := 'VALAQUIS';
      rpSelBxBensLabel8.Caption    := 'Valor Aquisição';
      rpSelBxBensDBCalc2.DataField := 'VALAQUIS';
   end;
   //-------------------------------------------------------------------------------------
   // Calcula os saldos contábeis nas respectivas datas fornecidas e registra no campo
   // virtual VALCTB, caso seja solicitado
   //-------------------------------------------------------------------------------------
   qrySelBxBens.Open;
   if (CmpRptCM.ParamValues[4].AsInteger = 0) then
   begin
      while not qrySelBxBens.EOF do
      begin
         qrySldCtb.Close;
         qrySldCtb.ParamByName('PDATAMOV').AsDateTime := strtodate(qrySelBxBensSBXDATA.AsString) - 1;
         qrySldCtb.ParamByName('PIDBEM').AsInteger    := (qrySelBxBensIDBEM.AsInteger);
         qrySldCtb.ParamByName('PIDPESSOA').AsInteger := (qrySelBxBensIDPESSOA.AsInteger);
         qrySldCtb.Open;
         //-------------------------------------------------------------------------------
         if not qrySldCtb.IsEmpty then
         begin
            qrySelBxBens.Edit;
            qrySelBxBensVALCTB.AsCurrency := qrySldCtbVALCTB.AsCurrency;
            qrySelBxBens.Post;
         end;
         //-------------------------------------------------------------------------------
         qrySelBxBens.Next;
      end;
      qrySelBxBens.First;
   end;
end;

procedure TRptCAFSelBxBens.CrmRptCMChangeDataBaseName(Sender: TObject; sDataBaseName: String);
begin
   inherited;
   if qrySelBxBens.Active then
      qrySelBxBens.Close;
   qrySelBxBens.DataBaseName := sDataBaseName;
   //-------------------------------------------------------------------------------------
   if qrySldCtb.Active then
      qrySldCtb.Close;
   qrySldCtb.DataBaseName := sDataBaseName;
end;

end.
