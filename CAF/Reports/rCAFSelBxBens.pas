unit rCAFSelBxBens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport,
  ppBands, ppClass, ppVar, ppStrtch, ppMemo, ppCtrls, ppPrnabl, ppCache,
  ppProd, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc,
  DBClient, uCMClientDataSet, uCmSqlParams, MontaSelect, uCMfileUtils, uCtrlPadroes,
  IvDictio, IvMulti;

type
  TRptCAFSelBxBens = class(TFrmCmReport)
    sqlSelBxBens: TCMSqlParams;
    cdsSelBxBens: TCMClientDataSet;
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
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    MSTermo: TMontaSelect;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure rpSelBxBensDBCalc1GroupBreak(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RptCAFSelBxBens: TRptCAFSelBxBens;

implementation

{$R *.DFM}

procedure TRptCAFSelBxBens.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   MSTermo.Filtro.Add('SELBAIXA.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa));
end;

procedure TRptCAFSelBxBens.CrmRptCMBeforePrint(Sender: TObject);
Var
   iMoedaOficial : Integer;
begin
   inherited;
   try
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      // Captura as Mascaras
      //----------------------------------------------------------------------------------
      with sqlParamCaf do
      begin
         Prepare;
         ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
         Open;
         //-------------------------------------------------------------------------------
         iMoedaOficial := cdsParamCAF.FieldByName('MOEDAOFICIAL').AsInteger;
         Close;
      end;
      //----------------------------------------------------------------------------------
      cdsSelBxBens.Close;
      with sqlSelBxBens do
      begin
         if CmpRptCM.ParamValues[1].AsInteger <> 0 then
         begin
            SQL.Strings[39] := '   AND SB.IDSELBAIXA = ' + MSTermo.ValoresChave[1];
         end else
         begin
            case CmpRptCM.ParamValues[3].AsInteger of
               0: SQL.Strings[39] := '   AND SB.SBXFLGEXECUTADO = 0';
               1: SQL.Strings[39] := '   AND SB.SBXFLGEXECUTADO = 1';
            else
               SQL.Strings[39] := '';
            end;
            //----------------------------------------------------------------------------
            if CmpRptCM.ParamValues[0].AsDateTime > 0 then
            begin
               SQL.Strings[40] := '   AND SB.SBXDATA = TO_DATE(' + #39 + FormatDateTime('dd/mm/yyyy',CmpRptCM.ParamValues[0].AsDateTime) + #39 + ',' + #39 + 'DD/MM/YYYY' + #39 + ')';
            end else
            begin
               SQL.Strings[40] := '';
            end;
            //----------------------------------------------------------------------------
            if CmpRptCM.ParamValues[2].AsInteger <> 0 then
            begin
               SQL.Strings[41] := '   AND SB.IDRESPONSAVEL = ' + inttostr(CmpRptCM.ParamValues[2].AsInteger);
            end else
            begin
               SQL.Strings[41] := '';
            end;
         end;
         //-------------------------------------------------------------------------------
         case CmpRptCM.ParamValues[5].AsInteger of
            0: SQL.Strings[52] := ' ORDER BY SB.SBXTERMO, B.PLACA ';
            1: SQL.Strings[52] := ' ORDER BY SB.SBXTERMO, B.DESBEM ';
            2: SQL.Strings[52] := ' ORDER BY SB.SBXTERMO, SCB.VALORG ';
            3: SQL.Strings[52] := ' ORDER BY SB.SBXTERMO, SCB.SALDOCONTAB ';
         else
            SQL.Strings[52] := '';
         end;
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsInteger = 0 then
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
      //----------------------------------------------------------------------------------
      sqlSelBxBens.Prepare;
      sqlSelBxBens.ParamByName('IDPESSOA').AsFloat    := CrmRptCM.IdEmpresa;
      sqlSelBxBens.ParamByName('MOECODIGO').AsInteger := iMoedaOficial;
      sqlSelBxBens.ParamByName('IDTAXADEP').AsInteger := 1;                      // Brasil
      sqlSelBxBens.Open;
      Screen.Cursor := crDefault;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      if cdsSelBxBens.IsEmpty then
         Raise Exception.Create('Não existem Termos de Seleção de Baixa que atendam aos parâmetros');
  except
     On E : Exception Do
     begin
        CMDebugToFile('SELEÇÃO DE BENS PARA BAIXA : ' + E.Message);
     end;
  end;
end;

procedure TRptCAFSelBxBens.rpSelBxBensDBCalc1GroupBreak(Sender: TObject);
begin
   inherited;
   rpSelBxBensDBCalc1.Value := 0;
end;

end.
