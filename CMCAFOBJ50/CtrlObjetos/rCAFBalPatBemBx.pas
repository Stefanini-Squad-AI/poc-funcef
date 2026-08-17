unit rCAFBalPatBemBx;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, FCmReport, IvDictio, IvMulti, uCmRptManager, TXComp, uCMFileUtils,
  CmParamReport, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl, ppCache,
  ppProd, ppReport, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, DB,
  Wwdatsrc, DBClient, uCMClientDataSet, uCmSqlParams;

type
  TrptCAFBalPatBemBx = class(TFrmCmReport)
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    cdsSomaGrupoBx: TCMClientDataSet;
    sqlSomaGrupoBx: TCMSqlParams;
    sqlBalPatBemBx: TCMSqlParams;
    cdsBalPatBemBx: TCMClientDataSet;
    dsBalPatBemBx: TwwDataSource;
    ppBalPatBemBx: TppBDEPipeline;
    ppBalPatBemppField1: TppField;
    ppBalPatBemppField2: TppField;
    ppBalPatBemppField3: TppField;
    ppBalPatBemppField4: TppField;
    ppBalPatBemppField5: TppField;
    ppBalPatBemppField6: TppField;
    ppBalPatBemppField7: TppField;
    ppBalPatBemppField8: TppField;
    ppBalPatBemppField9: TppField;
    ppBalPatBemppField10: TppField;
    ppBalPatBemppField11: TppField;
    ppBalPatBemppField12: TppField;
    ppBalPatBemppField13: TppField;
    ppBalPatBemppField14: TppField;
    ppBalPatBemppField15: TppField;
    ppBalPatBemppField16: TppField;
    ppBalPatBemppField17: TppField;
    ppBalPatBemppField18: TppField;
    ppBalPatBemppField19: TppField;
    ppBalPatBemppField20: TppField;
    ppBalPatBemppField21: TppField;
    ppBalPatBemppField22: TppField;
    ppBalPatBemppField23: TppField;
    rpBalPatBemBx: TppReport;
    ppHeaderBand7: TppHeaderBand;
    ppLabel60: TppLabel;
    ppLine13: TppLine;
    ppLabel61: TppLabel;
    rpBalPatBemLabel2: TppLabel;
    rpBalPatBemLabel3: TppLabel;
    ppDetailBand7: TppDetailBand;
    rpBemResumLabel2: TppLabel;
    rpBemResumLabel3: TppLabel;
    rpBemResumLabel4: TppLabel;
    rpBemResumLabel5: TppLabel;
    rpBemResumLabel6: TppLabel;
    rpBemResumLabel7: TppLabel;
    rpBemResumLabel8: TppLabel;
    rpBemResumLabel9: TppLabel;
    rpBemResumLabel10: TppLabel;
    rpBemResumLabel11: TppLabel;
    rpBemResumLabel12: TppLabel;
    rpBemResumDBText2: TppDBText;
    rpBemResumDBText4: TppDBText;
    rpBemResumDBText5: TppDBText;
    rpBemResumDBText6: TppDBText;
    rpBemResumDBText7: TppDBText;
    rpBemResumDBText8: TppDBText;
    rpBemResumDBText9: TppDBText;
    rpBemResumDBText10: TppDBText;
    rpBemResumDBText11: TppDBText;
    rpBemResumDBText12: TppDBText;
    rpBemResumDBText3: TppDBText;
    rpBemResumLine1: TppLine;
    rpBemResumLabel27: TppLabel;
    rpBemResumLabel28: TppLabel;
    rpBalPatBemLabel1: TppLabel;
    rpBalPatBemDBText1: TppDBText;
    rpBalPatBemLabel4: TppLabel;
    rpBalPatBemDBText2: TppDBText;
    rpBalPatBemLabel5: TppLabel;
    rpBalPatBemDBText3: TppDBText;
    rpBalPatBemDBText4: TppDBText;
    ppDBText3: TppDBText;
    ppLabel106: TppLabel;
    ppDBText4: TppDBText;
    ppLabel107: TppLabel;
    ppDBText5: TppDBText;
    ppLabel112: TppLabel;
    ppDBText7: TppDBText;
    ppFooterBand7: TppFooterBand;
    ppLine14: TppLine;
    ppLabel62: TppLabel;
    ppCalc13: TppSystemVariable;
    ppCalc14: TppSystemVariable;
    rpBemResumSummaryBand1: TppSummaryBand;
    rpBemResumLabel20: TppLabel;
    rpBemResumLabel21: TppLabel;
    rpBemResumLabel22: TppLabel;
    rpBemResumLabel23: TppLabel;
    rpBemResumLabel24: TppLabel;
    rpBemResumLabel25: TppLabel;
    rpBemResumLabel26: TppLabel;
    rpBemResumLine4: TppLine;
    varSomaCusto1: TppVariable;
    varSomaDeprec1: TppVariable;
    varSomaDeprecAtu1: TppVariable;
    varSomaCMCusto1: TppVariable;
    varSomaCMDeprec1: TppVariable;
    varSomaSldContab1: TppVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLine1: TppLine;
    ppDBText2: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    rpBemResumLabel13: TppLabel;
    rpBemResumDBText13: TppDBText;
    rpBemResumLine3: TppLine;
    rpBemResumLabel14: TppLabel;
    rpBemResumLabel15: TppLabel;
    rpBemResumLabel16: TppLabel;
    rpBemResumLabel19: TppLabel;
    rpBemResumLabel18: TppLabel;
    rpBemResumLabel17: TppLabel;
    varSomaCusto: TppVariable;
    varSomaDeprec: TppVariable;
    varSomaDeprecAtu: TppVariable;
    varSomaCMCusto: TppVariable;
    varSomaCMDeprec: TppVariable;
    varSomaSldContab: TppVariable;
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpBalPatBemBxBeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand1BeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles;
      Index: Integer);
  private
    { Private declarations }
    sTipoGrupo, sClasseGrupo : String;
    bInvestImob   : Boolean;
    FBalPatBem_Grupo : Extended;
    function DataUltFechamento : String;
  public
    { Public declarations }
  end;

var
  rptCAFBalPatBemBx: TrptCAFBalPatBemBx;

implementation

{$R *.dfm}

{ TrptCAFBalPatBemBx }

procedure TrptCAFBalPatBemBx.CmpRptCMBeforeExecute(var CanExecute: Boolean);
begin
   inherited;
   //-------------------------------------------------------------------------------------
   // Captura os Parâmetros
   //-------------------------------------------------------------------------------------
   with sqlParamCaf do
   begin
      Prepare;
      ParamByName('PIDPESSOA').AsFloat := CrmRptCM.IdEmpresa;
      Open;
      //----------------------------------------------------------------------------------
      bInvestImob := copy(cdsParamCAF.FieldByName('SISTEMAS').AsString, 4, 1) = '1';
      //----------------------------------------------------------------------------------
      Close;
   end;
   //-------------------------------------------------------------------------------------
   CmpRptCM.ParamValues[0].TextDefault := DataUltFechamento;
   CmpRptCM.ParamValues[1].LookupSettings.SQL.Text := ' SELECT G.CLASSE, G.NOME, G.IDGRUPO, G.TIPO '+
                                                      ' FROM GRUPO G, ' +
                                                      '      PLANOGRUPO PG ' +
                                                      ' WHERE PG.IDPESSOA = ' + floattostr(CrmRptCM.IdEmpresa) +
                                                      '   AND G.INATIVO = 0' +
                                                      '   AND PG.IDGRUPO = G.IDGRUPO ' +
                                                      ' ORDER BY G.CLASSE ';
end;

function TrptCAFBalPatBemBx.DataUltFechamento: String;
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

procedure TrptCAFBalPatBemBx.CrmRptCMBeforePrint(Sender: TObject);
var
   iAno, iMes, iDia : Word;

begin
   inherited;
   try
      Screen.Cursor := crSQLWait;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      // Aplica os Filtros
      //----------------------------------------------------------------------------------
      DecodeDate(CmpRptCM.ParamValues[0].AsDateTime, iAno, iMes, iDia);
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[1].AsInteger <> 0 then
      begin
         if sTipoGrupo = 'S' then
         begin
            sqlBalPatBemBx.SQL.Strings[42] := ' AND (LTRIM(RTRIM(G1.CLASSE)) LIKE ' + #39 + sClasseGrupo + '%' + #39 + ') ';
            sqlSomaGrupoBx.SQL.Strings[30] := ' AND (LTRIM(RTRIM(G1.CLASSE)) LIKE ' + #39 + sClasseGrupo + '%' + #39 + ') ';
            sqlSomaGrupoBx.SQL.Strings[64] := ' AND (LTRIM(RTRIM(G2.CLASSE)) LIKE ' + #39 + sClasseGrupo + '%' + #39 + ') ';
         end else
         begin
            sqlBalPatBemBx.SQL.Strings[42] := ' AND SCB1.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[1].AsInteger);
            sqlSomaGrupoBx.SQL.Strings[30] := ' AND SB1.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[1].AsInteger);
            sqlSomaGrupoBx.SQL.Strings[64] := ' AND SB2.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[1].AsInteger);
         end;
      end else
      begin
         sqlBalPatBemBx.SQL.Strings[42] := ' ';
         sqlSomaGrupoBx.SQL.Strings[30] := ' ';
         sqlSomaGrupoBx.SQL.Strings[64] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsBoolean then
      begin
         sqlBalPatBemBx.SQL.Strings[149] := ' ';
         sqlSomaGrupoBx.SQL.Strings[31]  := ' ';
         sqlSomaGrupoBx.SQL.Strings[65]  := ' ';
      end else
      begin
         sqlBalPatBemBx.SQL.Strings[149] := ' AND B.CONTROLE = ''T'' ';
         sqlSomaGrupoBx.SQL.Strings[31]  := ' AND B1.CONTROLE = ''T'' ';
         sqlSomaGrupoBx.SQL.Strings[65]  := ' AND B2.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      sqlBalPatBemBx.Prepare;
      sqlBalPatBemBx.ParamByName('IDPESSOA').AsFloat    := CrmRptCM.IdEmpresa;
      sqlBalPatBemBx.ParamByName('DATAINI').AsDateTime := EncodeDate(iAno,iMes,01);
      sqlBalPatBemBx.ParamByName('DATASLD').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
      //----------------------------------------------------------------------------------
      sqlSomaGrupoBx.Prepare;
      sqlSomaGrupoBx.ParamByName('IDPESSOA').AsFloat    := CrmRptCM.IdEmpresa;
      sqlSomaGrupoBx.ParamByName('DATAINI').AsDateTime  := EncodeDate(iAno,iMes,01);
      sqlSomaGrupoBx.ParamByName('DATASLD').AsDateTime  := CmpRptCM.ParamValues[0].AsDateTime;
      //----------------------------------------------------------------------------------
      case CmpRptCM.ParamValues[2].AsInteger of
         0: begin
               sqlBalPatBemBx.ParamByName('PDEPREC').AsInteger    := 0;
               sqlBalPatBemBx.ParamByName('PNOTDEPREC').AsInteger := 1;
               sqlSomaGrupoBx.ParamByName('PDEPREC').AsInteger    := 0;
               sqlSomaGrupoBx.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         1: begin
               sqlBalPatBemBx.ParamByName('PDEPREC').AsInteger    := 1;
               sqlBalPatBemBx.ParamByName('PNOTDEPREC').AsInteger := 1;
               sqlSomaGrupoBx.ParamByName('PDEPREC').AsInteger    := 1;
               sqlSomaGrupoBx.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         2: begin
               sqlBalPatBemBx.ParamByName('PDEPREC').AsInteger    := 0;
               sqlBalPatBemBx.ParamByName('PNOTDEPREC').AsInteger := 0;
               sqlSomaGrupoBx.ParamByName('PDEPREC').AsInteger    := 0;
               sqlSomaGrupoBx.ParamByName('PNOTDEPREC').AsInteger := 0;
            end;
      else  begin
               sqlBalPatBemBx.ParamByName('PDEPREC').AsInteger    := 0;
               sqlBalPatBemBx.ParamByName('PNOTDEPREC').AsInteger := 1;
               sqlSomaGrupoBx.ParamByName('PDEPREC').AsInteger    := 0;
               sqlSomaGrupoBx.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
      end;
      //----------------------------------------------------------------------------------
      sqlBalPatBemBx.Open;
      sqlSomaGrupoBx.Open;
      Screen.Cursor := crDefault;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      if cdsBalPatBemBx.IsEmpty or cdsSomaGrupoBx.IsEmpty then
         Raise Exception.Create('Não existem dados com os parâmetros fornecidos!');
      //----------------------------------------------------------------------------------
      rpBalPatBemLabel3.Text := DatetoStr(CmpRptCM.ParamValues[0].AsDateTime);
   except
      on E : Exception Do
      begin
         CMDebugToFile('BALANCETE PATRIMONIAL POR BEM - BENS BAIXADOS : ' + E.Message );
      end;
   end;
end;

procedure TrptCAFBalPatBemBx.rpBalPatBemBxBeforePrint(Sender: TObject);
begin
   inherited;
   varSomaCusto1.Value     := 0;
   varSomaCMCusto1.Value   := 0;
   varSomaDeprecAtu1.Value := 0;
   varSomaDeprec1.Value    := 0;
   varSomaCMDeprec1.Value  := 0;
   varSomaSldContab1.Value := 0;
end;

procedure TrptCAFBalPatBemBx.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
   inherited;
   cdsSomaGrupoBx.Locate('IDGRUPO',FBalPatBem_Grupo,[]);

   varSomaCusto.Value      := cdsSomaGrupoBx.FieldByName('VALORG0').AsFloat;
   varSomaCMCusto.Value    := cdsSomaGrupoBx.FieldByName('CMBEM0').AsFloat;
   varSomaDeprecAtu.Value  := cdsSomaGrupoBx.FieldByName('DEPLANCATU0').AsFloat;
   varSomaDeprec.Value     := cdsSomaGrupoBx.FieldByName('DEPLANC0').AsFloat;
   varSomaCMDeprec.Value   := cdsSomaGrupoBx.FieldByName('CMDEP0').AsFloat;
   varSomaSldContab.Value  := cdsSomaGrupoBx.FieldByName('VALCTB0').AsFloat;

   varSomaCusto1.Value     := varSomaCusto1.Value     + varSomaCusto.Value;
   varSomaCMCusto1.Value   := varSomaCMCusto1.Value   + varSomaCMCusto.Value;
   varSomaDeprecAtu1.Value := varSomaDeprecAtu1.Value + varSomaDeprecAtu.Value;
   varSomaDeprec1.Value    := varSomaDeprec1.Value    + varSomaDeprec.Value;
   varSomaCMDeprec1.Value  := varSomaCMDeprec1.Value  + varSomaCMDeprec.Value;
   varSomaSldContab1.Value := varSomaSldContab1.Value + varSomaSldContab.Value;
end;

procedure TrptCAFBalPatBemBx.ppGroupHeaderBand1BeforePrint(Sender: TObject);
begin
   inherited;
   FBalPatBem_Grupo := cdsBalPatBemBx.FieldByname('IDGRUPO').AsFloat;
end;

procedure TrptCAFBalPatBemBx.CmpRptCMParamControlExit(Sender: TPainelControles; Index: Integer);
begin
  inherited;
   if Index = 1 then
   begin
      sTipoGrupo := Sender.CdsDisplay.FieldByName('TIPO').AsString;
      sClasseGrupo := trim(Sender.CdsDisplay.FieldByName('CLASSE').AsString);
   end;
   // Sender.CtrlLookup.Text;
end;

end.
