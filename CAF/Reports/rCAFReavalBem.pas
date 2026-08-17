unit rCAFReavalBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppVar, ppBands, ppCtrls, ppPrnabl, ppClass, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet, uCMfileUtils, IvDictio, IvMulti,
  uCtrlPadroes, uCtrlParamCAF;

type
  TRptCAFReavalBem = class(TFrmCmReport)
    sqlVerUltFec: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    ppReavalBem: TppBDEPipeline;
    dsReavalBem: TwwDataSource;
    cdsReavalBem: TCMClientDataSet;
    rpReavalBem: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel66: TppLabel;
    LBLEMPRESA: TppLabel;
    rpBalPatGrpLabel4: TppLabel;
    rpBalPatGrpLabel6: TppLabel;
    rpBalPatGrpLabel9: TppLabel;
    rpLabelDataMov: TppLabel;
    lblTipoGrupo: TppLabel;
    ppDetailBand9: TppDetailBand;
    rpBalPatGrpDBText1: TppDBText;
    rpBalPatGrpDBText2: TppDBText;
    rpBalPatGrpDBText4: TppDBText;
    rpBalPatGrpDBText5: TppDBText;
    ppFooterBand9: TppFooterBand;
    ppLine18: TppLine;
    ppCalc17: TppSystemVariable;
    ppCalc18: TppSystemVariable;
    LBLSISTEMA: TppLabel;
    ppSummaryBand1: TppSummaryBand;
    ppLabel16: TppLabel;
    ppDBCalc19: TppDBCalc;
    ppDBCalc20: TppDBCalc;
    ppDBCalc21: TppDBCalc;
    ppDBText12: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText4: TppDBText;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel19: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel1: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLine5: TppLine;
    sqlReavalBem: TCMSqlParams;
    ppLine6: TppLine;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ParamCAF : TCtrlParamCAF;
    iMoedaOficial  : Integer;
    sMascaraGrupo : String;
    bInvestImob   : Boolean;
    function DataUltFechamento : String;
  public
    { Public declarations }
  end;

var
  RptCAFReavalBem: TRptCAFReavalBem;

implementation

{$R *.DFM}

procedure TRptCAFReavalBem.CmpRptCMBeforeExecute(var CanExecute: Boolean);
var
   iAux : Integer;
begin
   inherited;
   ParamCAF := TCtrlParamCAF.Create;
   ParamCAF.InitializeAs(Padroes);
   try
      ParamCAF.CarregaProp(CrmRptCM.IdEmpresa);
      //----------------------------------------------------------------------------------
      iMoedaOficial := ParamCAF.MOEDAOFICIAL;
      bInvestImob := copy(ParamCAF.SISTEMAS, 4, 1) = '1';
      //----------------------------------------------------------------------------------
      sMascaraGrupo := ParamCAF.MASCCODGRUPO;
      iAux := 1;
      while iAux <= length(sMascaraGrupo) do
      begin
         if sMascaraGrupo[iAux] = '9' then
            sMascaraGrupo[iAux] := '#';
         iAux := iAux + 1;
      end;
      sMascaraGrupo := sMascaraGrupo + ';0; ';
      //----------------------------------------------------------------------------------
      CmpRptCM.ParamValues[0].TextDefault := DataUltFechamento;
      CmpRptCM.ParamValues[1].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO '+
                                                         ' FROM GRUPO G, ' +
                                                         '      PLANOGRUPO PG ' +
                                                         ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                         '   AND G.TIPO = ''A'' ' +
                                                         '   AND G.INATIVO = 0 ' +
                                                         '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                         ' ORDER BY G.CLASSE ';
   finally
      ParamCAF.Free;
   end;
end;

procedure TRptCAFReavalBem.CrmRptCMBeforePrint(Sender: TObject);
begin
   Screen.Cursor := crSQLWait;
   Application.ProcessMessages;
   try
      inherited;
      //----------------------------------------------------------------------------------
      // Processa os Acréscimos
      //----------------------------------------------------------------------------------
      cdsReavalBem.Close;
      if CmpRptCM.ParamValues[1].AsInteger <> 0 then
      begin
         sqlReavalBem.SQL.Strings[49] := ' AND SB.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[1].AsInteger);
         sqlReavalBem.SQL.Strings[71] := ' AND G.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[1].AsInteger);
      end else
      begin
         sqlReavalBem.SQL.Strings[49] := ' ';
         sqlReavalBem.SQL.Strings[71] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger = 0 then
      begin
         sqlReavalBem.SQL.Strings[72] := ' AND G.FLGIMOVEL = 0 ';
         lblTipoGrupo.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[2].AsInteger = 1 then
      begin
         sqlReavalBem.SQL.Strings[72] := ' AND G.FLGIMOVEL = 1 ';
         lblTipoGrupo.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         sqlReavalBem.SQL.Strings[72] := ' ';
         lblTipoGrupo.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      sqlReavalBem.Prepare;
      sqlReavalBem.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      sqlReavalBem.ParamByName('DATASLD').AsDate := CmpRptCM.ParamValues[0].AsDateTime;
      sqlReavalBem.ParamByName('MOECODIGO').AsInteger := iMoedaOficial;
      sqlReavalBem.ParamByName('IDTAXADEP').AsInteger := 1;                  // Brasil
      sqlReavalBem.Open;
      //----------------------------------------------------------------------------------
      if cdsReavalBem.IsEmpty then
         Raise Exception.Create('Não existem dados com os parâmetros fornecidos!');
      //----------------------------------------------------------------------------------
      cdsReavalBem.IndexFieldNames := 'CLASSE;PLACA;IDREAVALACRESC';
      ppDbText4.DisplayFormat := sMascaraGrupo;
      rplabelDataMov.Text := CmpRptCM.ParamValues[0].AsString;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
      Application.ProcessMessages;
   except
      on E : Exception do
      begin
         CMDebugToFile('Erro no Relatório REAVALIAÇÕES PATRIMONIAIS POR BEM!' + #13 + #10 + E.Message);
      end;
   end;
end;

procedure TRptCAFReavalBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   Application.ProcessMessages;
end;

function TRptCAFReavalBem.DataUltFechamento : String;
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
      Result := cdsVerUltFec.FieldByName('DATAULT').AsString
   else
      Result := '-1';
   //-------------------------------------------------------------------------------------
   cdsVerUltFec.Close;
end;

end.
