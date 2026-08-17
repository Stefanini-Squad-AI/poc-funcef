unit rCAFLancObras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCmReport, uCmRptManager, TXComp, CmParamReport, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport, DB, 
  DBTables, Wwquery, Wwdatsrc, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE,
  DBClient, uCMClientDataSet, uCmSqlParams, MontaSelect, uCMfileUtils, uCtrlPadroes,
  IvDictio, IvMulti, ppStrtch, ppMemo;

type
  TrptCAFLancObras = class(TFrmCmReport)
    ppLancObras: TppBDEPipeline;
    dsLancObras: TwwDataSource;
    rpLancObras: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText46: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppLine27: TppLine;
    ppLabel61: TppLabel;
    ppSystemVariable5: TppSystemVariable;
    ppSystemVariable6: TppSystemVariable;
    ppLabel59: TppLabel;
    ppLabel63: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel80: TppLabel;
    ppLine29: TppLine;
    ppLabel124: TppLabel;
    ppLabel125: TppLabel;
    sqlLancObras: TCMSqlParams;
    cdsLancObras: TCMClientDataSet;
    MSObra: TMontaSelect;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    rpLancObrasCLASSE: TppDBText;
    rpBalPatGrpDBText2: TppDBText;
    ppLine1: TppLine;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    ppDBCalc1: TppDBCalc;
    ppLine2: TppLine;
    rpMovBemLabel6: TppLabel;
    rplblDataIni: TppLabel;
    rpMovBemLabel9: TppLabel;
    rplblDataFim: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppDBCalc2: TppDBCalc;
    ppLine3: TppLine;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
  private
    { Private declarations }
    bInvestImob : Boolean;
    sMascaraGrupo : String;
    function DataUltFechamento : String;
  public
    { Public declarations }
  end;

var
  rptCAFLancObras: TrptCAFLancObras;

implementation

{$R *.dfm}

uses uSistema;

procedure TrptCAFLancObras.CmpRptCMBeforeExecute(var CanExecute: Boolean);
var
   dDataUltFec : TDateTime;
   iAnoFim, iMesFim, iDiaFim : Word;
begin
   inherited;
   with sqlParamCaf do
   begin
      Prepare;
      ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      Open;
      //----------------------------------------------------------------------------------
      bInvestImob := copy(cdsParamCAF.FieldByName('SISTEMAS').AsString, 4, 1) = '1';
      sMascaraGrupo := trim(cdsParamCaf.FieldByName('MASCCODGRUPO').AsString) +';0; ';
   end;
   //-------------------------------------------------------------------------------------
   dDataUltFec := strtodate(DataUltFechamento) + 1;
   DecodeDate(dDataUltFec, iAnoFim, iMesFim, iDiaFim);
   CmpRptCM.ParamValues[0].TextDefault := DateToStr(EncodeDate(iAnoFim,iMesFim,01));
   DecodeDate(DiasUteis.UltDiaMes(iAnoFim, iMesFim), iAnoFim, iMesFim, iDiaFim);
   CmpRptCM.ParamValues[1].TextDefault := DateToStr(EncodeDate(iAnoFim,iMesFim,iDiaFim));
   //-------------------------------------------------------------------------------------
   MSObra.Filtro.Add('CAFOBRA.IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa));
   //-------------------------------------------------------------------------------------
   CmpRptCM.ParamValues[3].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO '+
                                                      ' FROM GRUPO G, ' +
                                                      '      PLANOGRUPO PG ' +
                                                      ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND G.TIPO = ''A'' ' +
                                                      '   AND G.STATUS = ''A'' ' +
                                                      '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                      ' ORDER BY G.CLASSE ';
end;

function TRptCAFLancObras.DataUltFechamento : String;
var
   iGrupoDeprec,
   iGrupoDepIni,
   iGrupoDepFim : Integer;

begin
   //-------------------------------------------------------------------------------------
   // Calculo da data baseado na opção dos Parâmetros do CAF
   //-------------------------------------------------------------------------------------
   if CrmRptCM.IdModulo = 7 then
   begin
      if not bInvestImob then
      begin
         iGrupoDeprec := 2;
      end else
      begin
         iGrupoDeprec := 0;
      end;
   end else
   begin
      iGrupoDeprec := 1;
   end;
   //-------------------------------------------------------------------------------------
   case iGrupoDeprec of
      0 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 0;
          end;
      1 : begin
             iGrupoDepIni := 1;
             iGrupoDepFim := 1;
          end;
      2 : begin
             iGrupoDepIni := 0;
             iGrupoDepFim := 1;
          end;
      else
          begin
             iGrupoDepIni := 2;
             iGrupoDepFim := 2;
          end;
   end;
   //-------------------------------------------------------------------------------------
   sqlVerUltFec.Prepare;
   sqlVerUltFec.ParamByName('PIDPESSOA').AsFloat       := CrmRptCM.IdEmpresa;
   sqlVerUltFec.ParamByName('PFLGIMOVELINI').AsInteger := iGrupoDepIni;
   sqlVerUltFec.ParamByName('PFLGIMOVELFIM').AsInteger := iGrupoDepFim;
   sqlVerUltFec.Open;
   //-------------------------------------------------------------------------------------
   if not cdsVerUltFec.IsEmpty then
      Result := DateToStr(cdsVerUltFec.FieldByName('DATAULT').AsDateTime)
   else
      Result := '';
   //-------------------------------------------------------------------------------------
   cdsVerUltFec.Close;
end;

procedure TrptCAFLancObras.CrmRptCMBeforePrint(Sender: TObject);
begin
   inherited;
   try
      cdsLancObras.Close;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger <> 0 then
      begin
         sqlLancObras.SQL.Strings[13] := ' AND O.IDCAFOBRA = ' + MSObra.ValoresChave[0];
      end else
      begin
         sqlLancObras.SQL.Strings[13] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsInteger <> 0 then
      begin
         sqlLancObras.SQL.Strings[14] := ' AND PG.IDGRUPO = ' + inttostr(CmpRptCM.ParamValues[3].AsInteger);
      end else
      begin
         sqlLancObras.SQL.Strings[14] := ' ';
      end;
      //----------------------------------------------------------------------------------
      sqlLancObras.Prepare;
      sqlLancObras.ParamByName('IDPESSOA').AsFloat   := CrmRptCM.IdEmpresa;
      sqlLancObras.ParamByName('DATAINI').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
      sqlLancObras.ParamByName('DATAFIM').AsDateTime := CmpRptCM.ParamValues[1].AsDateTime;
      sqlLancObras.Open;
      //----------------------------------------------------------------------------------
      if cdsLancObras.IsEmpty then
         if CmpRptCM.ParamValues[3].AsInteger <> 0 then
            Raise Exception.Create('Não há movimentações no Periodo para o Grupo especificado!')
         else
            Raise Exception.Create('Não há movimentações no Periodo especificado!');
      //----------------------------------------------------------------------------------
      rplblDataIni.Text := datetostr(CmpRptCM.ParamValues[0].AsDateTime);
      rplblDataFim.Text := datetostr(CmpRptCM.ParamValues[1].AsDateTime);
      TFloatField(cdsLancObras.FieldByName('VALOFI')).DisplayFormat := '#,##0.00;(#,##0.00); ';
      rpLancObrasCLASSE.DisplayFormat := sMascaraGrupo;
   except
      on E : Exception Do
      begin
         CMDebugToFile('Erro no Relatório LANÇAMENTOS EM OBRAS NO PERIODO : ' + E.Message);
      end;
   end;
end;

end.
