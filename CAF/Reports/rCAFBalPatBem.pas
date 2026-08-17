unit rCAFBalPatBem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, 
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, Db, Wwdatsrc, uCMfileUtils,
  DBTables, Wwquery, uCmRptManager, TXComp, CmParamReport, uCmSqlParams,
  DBClient, uCMClientDataSet, uCtrlPadroes, IvDictio, IvMulti, TXRB;

type
  TRptCAFBalPatBem = class(TFrmCmReport)
    cdsBalPatBem: TCMClientDataSet;
    sqlBalPatBem: TCMSqlParams;
    dsBalPatBem: TwwDataSource;
    ppBalPatBem: TppBDEPipeline;
    rpBalPatBem: TppReport;
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
    cdsParamCaf: TCMClientDataSet;
    sqlParamCaf: TCMSqlParams;
    cdsVerUltFec: TCMClientDataSet;
    sqlVerUltFec: TCMSqlParams;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLine1: TppLine;
    rpBemResumLabel13: TppLabel;
    rpBemResumDBText13: TppDBText;
    rpBemResumLine3: TppLine;
    rpBemResumLabel14: TppLabel;
    rpBemResumLabel15: TppLabel;
    rpBemResumLabel16: TppLabel;
    rpBemResumLabel19: TppLabel;
    rpBemResumLabel18: TppLabel;
    rpBemResumLabel17: TppLabel;
    cdsSomaGrupo: TCMClientDataSet;
    sqlSomaGrupo: TCMSqlParams;
    varSomaCusto: TppVariable;
    varSomaDeprec: TppVariable;
    varSomaDeprecAtu: TppVariable;
    varSomaCMCusto: TppVariable;
    varSomaCMDeprec: TppVariable;
    varSomaSldContab: TppVariable;
    varSomaCusto1: TppVariable;
    varSomaDeprec1: TppVariable;
    varSomaDeprecAtu1: TppVariable;
    varSomaCMCusto1: TppVariable;
    varSomaCMDeprec1: TppVariable;
    varSomaSldContab1: TppVariable;
    ppDBText2: TppDBText;
    lblTipoRelat: TppLabel;
    rpBalPatBemlblTipoBem9: TppLabel;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure CmpRptCMBeforeExecute(var CanExecute: Boolean);
    procedure rpBalPatBemBeforePrint(Sender: TObject);
    procedure ppGroupFooterBand1BeforePrint(Sender: TObject);
    procedure ppGroupHeaderBand1BeforePrint(Sender: TObject);
    procedure CmpRptCMParamControlExit(Sender: TPainelControles; Index: Integer);
  private
    { Private declarations }
    sTipoGrupo, sClasseGrupo : String;
    iMoedaOficial : Integer;
    bInvestImob   : Boolean;
    FBalPatBem_Grupo : Extended;
    function DataUltFechamento : String;
  public
    { Public declarations }
  end;

var
  RptCAFBalPatBem: TRptCAFBalPatBem;

implementation

{$R *.DFM}

procedure TRptCAFBalPatBem.CmpRptCMBeforeExecute(var CanExecute: Boolean);
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
      iMoedaOficial := cdsParamCAF.FieldByName('MOEDAOFICIAL').AsInteger;
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

function TRptCAFBalPatBem.DataUltFechamento : String;
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

procedure TRptCAFBalPatBem.CrmRptCMBeforePrint(Sender: TObject);
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
      lblTipoRelat.Caption := ' ';
      if CmpRptCM.ParamValues[1].AsInteger <> 0 then
      begin
         if sTipoGrupo = 'S' then
         begin
            sqlBalPatBem.SQL.Strings[31] := ' AND (LTRIM(RTRIM(G1.CLASSE)) LIKE ' + #39 + sClasseGrupo + '%' + #39 + ') ';
            sqlSomaGrupo.SQL.Strings[25] := ' AND (LTRIM(RTRIM(G1.CLASSE)) LIKE ' + #39 + sClasseGrupo + '%' + #39 + ') ';
            sqlSomaGrupo.SQL.Strings[70] := ' AND (LTRIM(RTRIM(G2.CLASSE)) LIKE ' + #39 + sClasseGrupo + '%' + #39 + ') ';
         end else
         begin
            sqlBalPatBem.SQL.Strings[31] := ' AND SCB1.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[1].AsInteger);
            sqlSomaGrupo.SQL.Strings[25] := ' AND SB1.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[1].AsInteger);
            sqlSomaGrupo.SQL.Strings[70] := ' AND SB2.IDGRUPO = ' + IntToStr(CmpRptCM.ParamValues[1].AsInteger);
         end;
      end else
      begin
         sqlBalPatBem.SQL.Strings[31] := ' ';
         sqlSomaGrupo.SQL.Strings[25] := ' ';
         sqlSomaGrupo.SQL.Strings[70] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[3].AsBoolean then
      begin
         lblTipoRelat.Caption := 'Inclui Bens em Controle Físico';
         sqlBalPatBem.SQL.Strings[173] := ' ';
         sqlSomaGrupo.SQL.Strings[26]  := ' ';
         sqlSomaGrupo.SQL.Strings[71]  := ' ';
      end else
      begin
         sqlBalPatBem.SQL.Strings[173] := ' AND B.CONTROLE = ''T'' ';
         sqlSomaGrupo.SQL.Strings[26]  := ' AND B1.CONTROLE = ''T'' ';
         sqlSomaGrupo.SQL.Strings[71]  := ' AND B2.CONTROLE = ''T'' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[4].AsBoolean then
      begin
         lblTipoRelat.Caption := 'Inclui Bens Baixados';
         sqlBalPatBem.SQL.Strings[174] := ' ';
         sqlSomaGrupo.SQL.Strings[27]  := ' ';
         sqlSomaGrupo.SQL.Strings[72]  := ' ';
      end else
      begin
         sqlBalPatBem.SQL.Strings[174] := ' AND B.BAIXATOTAL <> ''S'' ';
         sqlSomaGrupo.SQL.Strings[27]  := ' AND B1.BAIXATOTAL <> ''S'' ';
         sqlSomaGrupo.SQL.Strings[72]  := ' AND B2.BAIXATOTAL <> ''S'' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[5].AsBoolean then
      begin
         lblTipoRelat.Caption := 'Somente Bens Baixados no Periodo';
         sqlBalPatBem.SQL.Strings[174] := ' ';
         sqlSomaGrupo.SQL.Strings[27]  := ' ';
         sqlSomaGrupo.SQL.Strings[72]  := ' ';
         sqlBalPatBem.SQL.Strings[164] := ' (SELECT HM9.IDBEM ';
         sqlBalPatBem.SQL.Strings[165] := '  FROM HISTORICOMOVIMENTACAO HM9 ';
         sqlBalPatBem.SQL.Strings[166] := '  WHERE (HM9.DATAMOVIMENTACAO >= :PDATAINI AND HM9.DATAMOVIMENTACAO <= :PDATASLD) ';
         sqlBalPatBem.SQL.Strings[167] := '    AND HM9.IDTIPOMOVIMENTACAO = 06 ';
         sqlBalPatBem.SQL.Strings[168] := '    AND HM9.IDPESSOA = :IDPESSOA) BX, ';
         sqlBalPatBem.SQL.Strings[186] := '  AND B.IDBEM = BX.IDBEM ';
         sqlSomaGrupo.SQL.Strings[18] := ' (SELECT HM5.IDBEM ';
         sqlSomaGrupo.SQL.Strings[19] := '  FROM HISTORICOMOVIMENTACAO HM5 ';
         sqlSomaGrupo.SQL.Strings[20] := '  WHERE (HM5.DATAMOVIMENTACAO >= :DATAINI AND HM5.DATAMOVIMENTACAO <= :DATASLD) ';
         sqlSomaGrupo.SQL.Strings[21] := '    AND HM5.IDTIPOMOVIMENTACAO = 06 ';
         sqlSomaGrupo.SQL.Strings[22] := '    AND HM5.IDPESSOA = :IDPESSOA) BX1, ';
         sqlSomaGrupo.SQL.Strings[43] := '  AND B1.IDBEM = BX1.IDBEM ';
         sqlSomaGrupo.SQL.Strings[63] := ' (SELECT HM6.IDBEM ';
         sqlSomaGrupo.SQL.Strings[64] := '  FROM HISTORICOMOVIMENTACAO HM6 ';
         sqlSomaGrupo.SQL.Strings[65] := '  WHERE (HM6.DATAMOVIMENTACAO >= :DATAINI AND HM6.DATAMOVIMENTACAO <= :DATASLD) ';
         sqlSomaGrupo.SQL.Strings[66] := '    AND HM6.IDTIPOMOVIMENTACAO = 06 ';
         sqlSomaGrupo.SQL.Strings[67] := '    AND HM6.IDPESSOA = :IDPESSOA) BX2, ';
         sqlSomaGrupo.SQL.Strings[90] := '  AND B2.IDBEM = BX2.IDBEM ';
      end else
      begin
         sqlBalPatBem.SQL.Strings[164] := ' ';
         sqlBalPatBem.SQL.Strings[165] := ' ';
         sqlBalPatBem.SQL.Strings[166] := ' ';
         sqlBalPatBem.SQL.Strings[167] := ' ';
         sqlBalPatBem.SQL.Strings[168] := ' ';
         sqlBalPatBem.SQL.Strings[186] := ' ';
         sqlSomaGrupo.SQL.Strings[18] := ' ';
         sqlSomaGrupo.SQL.Strings[19] := ' ';
         sqlSomaGrupo.SQL.Strings[20] := ' ';
         sqlSomaGrupo.SQL.Strings[21] := ' ';
         sqlSomaGrupo.SQL.Strings[22] := ' ';
         sqlSomaGrupo.SQL.Strings[43] := ' ';
         sqlSomaGrupo.SQL.Strings[63] := ' ';
         sqlSomaGrupo.SQL.Strings[64] := ' ';
         sqlSomaGrupo.SQL.Strings[65] := ' ';
         sqlSomaGrupo.SQL.Strings[66] := ' ';
         sqlSomaGrupo.SQL.Strings[67] := ' ';
         sqlSomaGrupo.SQL.Strings[90] := ' ';
      end;
      //----------------------------------------------------------------------------------
      if CmpRptCM.ParamValues[6].AsInteger = 0 then
      begin
         sqlBalPatBem.SQL.Strings[32] := ' ';
         sqlBalPatBem.SQL.Strings[175] := ' ';
         sqlSomaGrupo.SQL.Strings[28] := ' ';
         sqlSomaGrupo.SQL.Strings[73] := ' ';
         rpBalPatBemlblTipoBem9.Caption := ' ';
      end else
      if CmpRptCM.ParamValues[6].AsInteger = 1 then
      begin
         sqlBalPatBem.SQL.Strings[32] := ' AND G1.FLGIMOVEL = 0 ';
         sqlBalPatBem.SQL.Strings[175] := ' AND G.FLGIMOVEL = 0 ';
         sqlSomaGrupo.SQL.Strings[28] := ' AND G1.FLGIMOVEL = 0 ';
         sqlSomaGrupo.SQL.Strings[73] := ' AND G2.FLGIMOVEL = 0 ';
         rpBalPatBemlblTipoBem9.Caption := 'IMOBILIZADO';
      end else
      begin
         sqlBalPatBem.SQL.Strings[32] := ' AND G1.FLGIMOVEL = 1 ';
         sqlBalPatBem.SQL.Strings[175] := ' AND G.FLGIMOVEL = 1 ';
         sqlSomaGrupo.SQL.Strings[28] := ' AND G1.FLGIMOVEL = 1 ';
         sqlSomaGrupo.SQL.Strings[73] := ' AND G2.FLGIMOVEL = 1 ';
         rpBalPatBemlblTipoBem9.Caption := 'INVESTIMENTOS IMOBILIARIOS';
      end;
      //----------------------------------------------------------------------------------
      sqlBalPatBem.Prepare;
      sqlBalPatBem.ParamByName('IDPESSOA').AsFloat    := CrmRptCM.IdEmpresa;
      sqlBalPatBem.ParamByName('PDATAINI').AsDateTime := EncodeDate(iAno,iMes,01);
      sqlBalPatBem.ParamByName('PDATASLD').AsDateTime := CmpRptCM.ParamValues[0].AsDateTime;
      sqlBalPatBem.ParamByName('MOECODIGO').AsInteger := iMoedaOficial;
      sqlBalPatBem.ParamByName('IDTAXADEP').AsInteger := 1;                      // Brasil
      //----------------------------------------------------------------------------------
      sqlSomaGrupo.Prepare;
      sqlSomaGrupo.ParamByName('IDPESSOA').AsFloat    := CrmRptCM.IdEmpresa;
      sqlSomaGrupo.ParamByName('DATAINI').AsDateTime  := EncodeDate(iAno,iMes,01);
      sqlSomaGrupo.ParamByName('DATASLD').AsDateTime  := CmpRptCM.ParamValues[0].AsDateTime;
      sqlSomaGrupo.ParamByName('MOECODIGO').AsInteger := iMoedaOficial;
      sqlSomaGrupo.ParamByName('IDTAXADEP').AsInteger := 1;                      // Brasil
      //----------------------------------------------------------------------------------
      case CmpRptCM.ParamValues[2].AsInteger of
         0: begin
               sqlBalPatBem.ParamByName('PDEPREC').AsInteger    := 0;
//               sqlBalPatBem.ParamByName('PNOTDEPREC').AsInteger := 1;
               sqlSomaGrupo.ParamByName('PDEPREC').AsInteger    := 0;
//               sqlSomaGrupo.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         1: begin
               sqlBalPatBem.ParamByName('PDEPREC').AsInteger    := 1;
//               sqlBalPatBem.ParamByName('PNOTDEPREC').AsInteger := 1;
               sqlSomaGrupo.ParamByName('PDEPREC').AsInteger    := 1;
//               sqlSomaGrupo.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
         2: begin
               sqlBalPatBem.ParamByName('PDEPREC').AsInteger    := 0;
//               sqlBalPatBem.ParamByName('PNOTDEPREC').AsInteger := 0;
               sqlSomaGrupo.ParamByName('PDEPREC').AsInteger    := 0;
//               sqlSomaGrupo.ParamByName('PNOTDEPREC').AsInteger := 0;
            end;
      else  begin
               sqlBalPatBem.ParamByName('PDEPREC').AsInteger    := 0;
//               sqlBalPatBem.ParamByName('PNOTDEPREC').AsInteger := 1;
               sqlSomaGrupo.ParamByName('PDEPREC').AsInteger    := 0;
//               sqlSomaGrupo.ParamByName('PNOTDEPREC').AsInteger := 1;
            end;
      end;
      //----------------------------------------------------------------------------------
      sqlBalPatBem.Open;
      sqlSomaGrupo.Open;
      Screen.Cursor := crDefault;
      Application.ProcessMessages;
      //----------------------------------------------------------------------------------
      if cdsBalPatBem.IsEmpty or cdsSomaGrupo.IsEmpty then
         Raise Exception.Create('Não existem dados com os parâmetros fornecidos!');
      //----------------------------------------------------------------------------------
      rpBalPatBemLabel3.Text := DatetoStr(CmpRptCM.ParamValues[0].AsDateTime);
   except
      on E : Exception Do
      begin
         CMDebugToFile('BALANCETE PATRIMONIAL POR BEM : ' + E.Message );
      end;
   end;
end;

procedure TRptCAFBalPatBem.rpBalPatBemBeforePrint(Sender: TObject);
begin
   inherited;
   varSomaCusto1.Value     := 0;
   varSomaCMCusto1.Value   := 0;
   varSomaDeprecAtu1.Value := 0;
   varSomaDeprec1.Value    := 0;
   varSomaCMDeprec1.Value  := 0;
   varSomaSldContab1.Value := 0;
end;

procedure TRptCAFBalPatBem.ppGroupFooterBand1BeforePrint(Sender: TObject);
begin
   inherited;
   cdsSomaGrupo.Locate('IDGRUPO',FBalPatBem_Grupo,[]);

   varSomaCusto.Value      := cdsSomaGrupo.FieldByName('VALORG0').AsFloat;
   varSomaCMCusto.Value    := cdsSomaGrupo.FieldByName('CMBEM0').AsFloat;
   varSomaDeprecAtu.Value  := cdsSomaGrupo.FieldByName('DEPLANCATU0').AsFloat;
   varSomaDeprec.Value     := cdsSomaGrupo.FieldByName('DEPLANC0').AsFloat;
   varSomaCMDeprec.Value   := cdsSomaGrupo.FieldByName('CMDEP0').AsFloat;
   varSomaSldContab.Value  := cdsSomaGrupo.FieldByName('VALCTB0').AsFloat;

   varSomaCusto1.Value     := varSomaCusto1.Value     + varSomaCusto.Value;
   varSomaCMCusto1.Value   := varSomaCMCusto1.Value   + varSomaCMCusto.Value;
   varSomaDeprecAtu1.Value := varSomaDeprecAtu1.Value + varSomaDeprecAtu.Value;
   varSomaDeprec1.Value    := varSomaDeprec1.Value    + varSomaDeprec.Value;
   varSomaCMDeprec1.Value  := varSomaCMDeprec1.Value  + varSomaCMDeprec.Value;
   varSomaSldContab1.Value := varSomaSldContab1.Value + varSomaSldContab.Value;
end;

procedure TRptCAFBalPatBem.ppGroupHeaderBand1BeforePrint(Sender: TObject);
begin
   inherited;
   FBalPatBem_Grupo := cdsBalPatBem.FieldByname('IDGRUPO').AsFloat;
end;

procedure TRptCAFBalPatBem.CmpRptCMParamControlExit(Sender: TPainelControles; Index: Integer);
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
