unit rCAFInvGuiaTransfBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCmReport, uCmRptManager, TXComp, CmParamReport, ppBands, 
  ppClass, ppVar, ppMemo, ppCtrls, ppStrtch, ppPrnabl, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, DB, Wwdatsrc,
  DBTables, Wwquery, DBClient, uCMClientDataSet, uCmSqlParams,
  MontaSelect, uCMfileUtils, uCtrlPadroes, IvDictio, IvMulti;

type
  TRptCAFInvGuiaTransfBem = class(TFrmCmReport)
    dsGuiaTransfBem: TwwDataSource;
    ppGuiaTransfBem: TppBDEPipeline;
    rpGuiaTransfBem: TppReport;
    ppHeaderBand4: TppHeaderBand;
    ppLabel13: TppLabel;
    ppLine6: TppLine;
    ppLabel15: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText9: TppDBText;
    rpGuiaTransfBemDBMemo1: TppDBMemo;
    rpGuiaTransfBemDBText1: TppDBText;
    rpGuiaTransfBemDBCalc3: TppDBCalc;
    rpGuiaTransfBemLine11: TppLine;
    ppFooterBand4: TppFooterBand;
    ppLabel16: TppLabel;
    ppLine8: TppLine;
    rpGuiaTransfBemMemo1: TppMemo;
    rpGuiaTransfBemLine1: TppLine;
    rpGuiaTransfBemLine2: TppLine;
    rpGuiaTransfBemLine3: TppLine;
    rpGuiaTransfBemLine4: TppLine;
    rpGuiaTransfBemLine5: TppLine;
    rpGuiaTransfBemLine6: TppLine;
    rpGuiaTransfBemMemo2: TppMemo;
    rpGuiaTransfBemLabel1: TppLabel;
    rpGuiaTransfBemLabel2: TppLabel;
    rpGuiaTransfBemLabel3: TppLabel;
    rpGuiaTransfBemLine7: TppLine;
    rpGuiaTransfBemLabel4: TppLabel;
    rpGuiaTransfBemLabel5: TppLabel;
    rpGuiaTransfBemLabel6: TppLabel;
    ppCalc8: TppSystemVariable;
    ppCalc23: TppSystemVariable;
    rpGuiaTransfBemGroup1: TppGroup;
    rpGuiaTransfBemGroupHeaderBand2: TppGroupHeaderBand;
    rpGuiaTransfBemLabel7: TppLabel;
    rpGuiaTransfBemLabel8: TppLabel;
    rpGuiaTransfBemLabel9: TppLabel;
    rpGuiaTransfBemLabel10: TppLabel;
    rpGuiaTransfBemLabel11: TppLabel;
    rpGuiaTransfBemLabel12: TppLabel;
    rpGuiaTransfBemLabel13: TppLabel;
    rpGuiaTransfBemLabel14: TppLabel;
    rpGuiaTransfBemLabel15: TppLabel;
    rpGuiaTransfBemDBText2: TppDBText;
    rpGuiaTransfBemDBText3: TppDBText;
    rpGuiaTransfBemDBText4: TppDBText;
    rpGuiaTransfBemDBText5: TppDBText;
    rpGuiaTransfBemDBText6: TppDBText;
    rpGuiaTransfBemDBText7: TppDBText;
    rpGuiaTransfBemDBText8: TppDBText;
    rpGuiaTransfBemLabel16: TppLabel;
    rpGuiaTransfBemLabel17: TppLabel;
    rpGuiaTransfBemDBText9: TppDBText;
    rpGuiaTransfBemDBText10: TppDBText;
    rpGuiaTransfBemLine9: TppLine;
    rpGuiaTransfBemLabel18: TppLabel;
    rpGuiaTransfBemLabel19: TppLabel;
    rpGuiaTransfBemLabel20: TppLabel;
    rpGuiaTransfBemLabel21: TppLabel;
    ppLine7: TppLine;
    rpGuiaTransfBemGroupFooterBand2: TppGroupFooterBand;
    rpGuiaTransfBemDBCalc1: TppDBCalc;
    rpGuiaTransfBemLine8: TppLine;
    rpGuiaTransfBemLabel22: TppLabel;
    rpGuiaTransfBemLine10: TppLine;
    sqlGuiaTransfBem: TCMSqlParams;
    cdsGuiaTransfBem: TCMClientDataSet;
    MSTermo: TMontaSelect;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFInvGuiaTransfBem: TRptCAFInvGuiaTransfBem;

implementation

{$R *.dfm}

procedure TRptCAFInvGuiaTransfBem.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   MSTermo.Filtro.Add('SELBAIXA.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa));
   CmpRptCM.ParamValues[3].LookupSettings.SQL.Text := ' SELECT NOME, IDLOCALIZACAO ' +
                                                      ' FROM LOCALIZACAO ' +
                                                      ' WHERE IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      ' ORDER BY NOME ';
   CmpRptCM.ParamValues[4].LookupSettings.SQL.Text := ' SELECT NOME, IDLOCALIZACAO ' +
                                                      ' FROM LOCALIZACAO ' +
                                                      ' WHERE IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      ' ORDER BY NOME ';
   CmpRptCM.ParamValues[5].LookupSettings.SQL.Text := ' SELECT DESCCONJUNTO, IDCONJUNTO ' +
                                                      ' FROM CONJUNTO ' +
                                                      ' WHERE IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      ' ORDER BY DESCCONJUNTO ';
   CmpRptCM.ParamValues[6].LookupSettings.SQL.Text := ' SELECT DESCCONJUNTO, IDCONJUNTO ' +
                                                      ' FROM CONJUNTO ' +
                                                      ' WHERE IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      ' ORDER BY DESCCONJUNTO ';
end;

procedure TRptCAFInvGuiaTransfBem.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   try
      cdsGuiaTransfBem.Close;
      with sqlGuiaTransfBem do
      begin
         if CmpRptCM.ParamValues[2].AsInteger <> 0 then
         begin
            SQL.Strings[28] := '   AND SB.IDSELBAIXA = ' + MSTermo.ValoresChave[0];
         end else
         begin
            SQL.Strings[28] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamValues[3].AsInteger <> 0 then
         begin
            SQL.Strings[29] := '   AND SBB.IDLOCALATUAL = ' + inttostr(CmpRptCM.ParamValues[3].AsInteger);
         end else
         begin
            SQL.Strings[29] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamValues[4].AsInteger <> 0 then
         begin
            SQL.Strings[30] := '   AND SBB.IDLOCALIZACAO = ' + inttostr(CmpRptCM.ParamValues[4].AsInteger);
         end else
         begin
            SQL.Strings[30] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamValues[5].AsInteger <> 0 then
         begin
            SQL.Strings[31] := '   AND SBB.IDCONJATUAL = ' + inttostr(CmpRptCM.ParamValues[5].AsInteger);
         end else
         begin
            SQL.Strings[31] := ' ';
         end;
         //-------------------------------------------------------------------------------
         if CmpRptCM.ParamValues[6].AsInteger <> 0 then
         begin
            SQL.Strings[32] := '   AND SBB.IDCONJUNTO = ' + inttostr(CmpRptCM.ParamValues[6].AsInteger);
         end else
         begin
            SQL.Strings[32] := ' ';
         end;
      end;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crSQLWait;
      sqlGuiaTransfBem.Prepare;
      sqlGuiaTransfBem.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlGuiaTransfBem.ParamByName('DATAMOVINI').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
      sqlGuiaTransfBem.ParamByName('DATAMOVFIM').AsDateTime := CmpRptCM.ParamValues[1].AsDateTime;
      sqlGuiaTransfBem.Open;
      Screen.Cursor := crDefault;
   except
      on E : Exception Do
      begin
         CMDebugToFile('GUIA DE TRANSFERENCIA DE BENS : ' + E.Message);
      end;
   end;
end;

end.
