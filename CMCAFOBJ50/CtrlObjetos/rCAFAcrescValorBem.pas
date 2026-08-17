unit rCAFAcrescValorBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, ppBands, ppClass, uCMfileUtils,
  ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, DBTables, Wwquery, Provider,
  uCmSqlParams, DBClient, uCMClientDataSet;

type
  TrptCAFAcrescValorBem = class(TFrmCmReport)
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    ppAcrescValorBem: TppBDEPipeline;
    rpAcrescValorBem: TppReport;
    ppHeaderBand9: TppHeaderBand;
    ppLabel66: TppLabel;
    LBLEMPRESA: TppLabel;
    rpBalPatGrpLabel4: TppLabel;
    rpBalPatGrpLabel6: TppLabel;
    rpBalPatGrpLabel9: TppLabel;
    rpLabelDataMov: TppLabel;
    lblTipoGrupo: TppLabel;
    ppLabel2: TppLabel;
    ppLine6: TppLine;
    ppDetailBand9: TppDetailBand;
    rpBalPatGrpDBText4: TppDBText;
    rpBalPatGrpDBText5: TppDBText;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
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
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLine5: TppLine;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppDBText4: TppDBText;
    ppDBText12: TppDBText;
    ppLine4: TppLine;
    ppLabel3: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel19: TppLabel;
    ppLine1: TppLine;
    ppDBCalc3: TppDBCalc;
    ppDBCalc4: TppDBCalc;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    rpBalPatGrpDBText1: TppDBText;
    rpBalPatGrpDBText2: TppDBText;
    ppLine3: TppLine;
    ppLabel4: TppLabel;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel1: TppLabel;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppLine2: TppLine;
    sqlAcrescValorBem: TCMSqlParams;
    cdsAcrescValorBem: TCMClientDataSet;
    dsAcrescValorBem: TwwDataSource;
    cdsAcrescValorBem0: TCMClientDataSet;
    sqlAcrescValorBem0: TCMSqlParams;
    qryAcrescValorBem0: TwwQuery;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    sMascaraGrupo : String;
    bInvestImob   : Boolean;
    function DataUltFechamento : String;
  public
    { Public declarations }
  end;

var
  rptCAFAcrescValorBem: TrptCAFAcrescValorBem;

implementation

{$R *.DFM}

procedure TrptCAFAcrescValorBem.CmpRptCMBeforeExecute(var CanExecute: Boolean);
var
   iAux : Integer;
begin
   inherited;
   sqlParamCaf.Prepare;
   sqlParamCaf.ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
   sqlParamCaf.Open;
   //-------------------------------------------------------------------------------------
   bInvestImob := copy(cdsParamCAF.FieldByName('SISTEMAS').AsString, 4, 1) = '1';
   sMascaraGrupo := cdsParamCaf.FieldByName('MASCCODGRUPO').AsString;
   //-------------------------------------------------------------------------------------
   iAux := 1;
   while iAux <= length(sMascaraGrupo) do
   begin
      if sMascaraGrupo[iAux] = '9' then
         sMascaraGrupo[iAux] := '#';
      iAux := iAux + 1;
   end;
   sMascaraGrupo := sMascaraGrupo + ';0; ';
   //-------------------------------------------------------------------------------------
   CmpRptCM.ParamValues[0].TextDefault := DataUltFechamento;
   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO '+
                                                      ' FROM GRUPO G, ' +
                                                      '      PLANOGRUPO PG ' +
                                                      ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND G.TIPO = ''A'' ' +
                                                      '   AND G.INATIVO = 0 ' +
                                                      '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                      ' ORDER BY G.CLASSE ';
end;

procedure TrptCAFAcrescValorBem.CrmRptCMBeforePrint(Sender: TObject);
begin
   Screen.Cursor := crSQLWait;
   Application.ProcessMessages;
   try
      inherited;
      //----------------------------------------------------------------------------------
      // Processa os Acréscimos
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[1].AsInteger <> 0 then
      begin
         qryAcrescValorBem0.SQL.Strings[41] := ' AND SB.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[1].AsInteger);
         qryAcrescValorBem0.SQL.Strings[51] := ' AND G.IDGRUPO = '+IntToStr(CmpRptCM.ParamValues[1].AsInteger);
      end else
      begin
         qryAcrescValorBem0.SQL.Strings[41] := ' ';
         qryAcrescValorBem0.SQL.Strings[51] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[2].AsInteger = 0 then
      begin
         qryAcrescValorBem0.SQL.Strings[52] := ' AND G.FLGIMOVEL = 0 ';
         lblTipoGrupo.Caption := 'IMOBILIZADO';
      end else
      if CmpRptCM.ParamValues[2].AsInteger = 1 then
      begin
         qryAcrescValorBem0.SQL.Strings[52] := ' AND G.FLGIMOVEL = 1 ';
         lblTipoGrupo.Caption := 'INVESTIMENTOS IMOBILIÁRIOS';
      end else
      begin
         qryAcrescValorBem0.SQL.Strings[50] := ' ';
         lblTipoGrupo.Caption := ' ';
      end;
      //----------------------------------------------------------------------------------
      qryAcrescValorBem0.Prepare;
      qryAcrescValorBem0.ParamByName('IDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      qryAcrescValorBem0.ParamByName('DATASLD').AsDate   := CmpRptCM.ParamValues[0].AsDateTime;
      qryAcrescValorBem0.Open;
      //----------------------------------------------------------------------------------
      if qryAcrescValorBem0.IsEmpty then
         Raise Exception.Create('Não existem dados com os parâmetros fornecidos!');
      //----------------------------------------------------------------------------------
      // Transferindo dados para o relatório
      //----------------------------------------------------------------------------------
      cdsAcrescValorBem.Close;
      sqlAcrescValorBem.Open;
      qryAcrescValorBem0.First;
      while not qryAcrescValorBem0.EOF do
      begin
         cdsAcrescValorBem.Append;
         cdsAcrescValorBem.FieldByName('CLASSE').AsString := qryAcrescValorBem0.FieldByName('CLASSE').AsString;
         cdsAcrescValorBem.FieldByName('NOME').AsString := qryAcrescValorBem0.FieldByName('NOME').AsString;
         cdsAcrescValorBem.FieldByName('PLACA').AsInteger := qryAcrescValorBem0.FieldByName('PLACA').AsInteger;
         cdsAcrescValorBem.FieldByName('DESBEM').AsString := qryAcrescValorBem0.FieldByName('DESBEM').AsString;
         cdsAcrescValorBem.FieldByName('IDREAVALACRESC').AsInteger := qryAcrescValorBem0.FieldByName('IDREAVALACRESC').AsInteger;
         cdsAcrescValorBem.FieldByName('DATAMOVIMENTACAO').AsDateTime := qryAcrescValorBem0.FieldByName('DATAMOVIMENTACAO').AsDateTime;
         cdsAcrescValorBem.FieldByName('VALORG').AsCurrency := qryAcrescValorBem0.FieldByName('VALORG').AsCurrency;
         cdsAcrescValorBem.FieldByName('DEPLANC').AsCurrency := qryAcrescValorBem0.FieldByName('DEPLANC').AsCurrency;
         cdsAcrescValorBem.Post;
         //-------------------------------------------------------------------------------
         qryAcrescValorBem0.Next;
      end;
      qryAcrescValorBem0.Close;
      //----------------------------------------------------------------------------------
      ppDbText4.DisplayFormat := sMascaraGrupo;
      rplabelDataMov.Text := CmpRptCM.ParamValues[0].AsString;
      //----------------------------------------------------------------------------------
      Screen.Cursor := crDefault;
      Application.ProcessMessages;
   except
      on E : Exception do
      begin
         CMDebugToFile('Erro no Relatório ACRÉSCIMOS DE VALOR POR BEM!' + #13 + #10 + E.Message);
      end;
   end;
end;

function TrptCAFAcrescValorBem.DataUltFechamento: String;
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

procedure TrptCAFAcrescValorBem.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   inherited;
   cdsParamCaf.Open;
   Application.ProcessMessages;
end;

end.
