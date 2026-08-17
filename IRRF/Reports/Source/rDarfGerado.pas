{-------------------------------------------------------------------------------
--------------------------- HISTÓRICO DE ALTERAÇÕES ----------------------------
--------------------------------------------------------------------------------
N.Chamado.....: MIGRACAO-ORACLE-2025 (TAS000000006794)
Dt.Alteração..: 20/10/2025
Responsável...: Paulo Nobre
Descrição.....: Ajustes na função: CrmRptCMBeforePrint para retirar o ORDER BY
                do segundo UNION.
---------------------------------------------------------------------------------
Data      : 23/02/2024
Autor     : Everson Cunha
Pendência : WO7829
Descrição : Inclusão do campo PLACONTA no relatório
--------------------------------------------------------------------------------
Rotina    : CrmRptCMBeforePrint
Data      : 03/08/2022
Autor     : Luis Ferrari
Pendência : 127725
Descrição : Ajustado query, fazendo Union entre tabela LANCIRRF com
            IRRFFOLHABENEF.
--------------------------------------------------------------------------------
Rotina    : CrmRptCMBeforePrint
Data      : 17/07/2022
Autor     : Luis Ferrari
Pendência : 127273
Descrição : Ajustado query, trocando tabela LANCIRRF por IRRFFOLHABENEF .
--------------------------------------------------------------------------------
Rotina    : CrmRptCMBeforePrint
Data      : 16/05/2007
Autor     : Bruno Bastos
Pendência : 23529
Descrição : Implementado a coloção da data de lançamento, e correção para
            mostrar o número do documento do documento original e mostrar apenas
            uma linha por fornecedor.
--------------------------------------------------------------------------------
Rotina    : CrmRptCMBeforePrint
Data      : 09/12/2004
Autor     : Marchetti
Pendência : 17478
Descrição : Implementado o filtro por natureza de rendimento e ajuste dos labels
            das datas
--------------------------------------------------------------------------------}


unit rDarfGerado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, Db, DBClient, uCMClientDataSet, uCmSqlParams, ppCtrls,
  ppBands, ppClass, ppVar, ppPrnabl, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, ppDBBDE, Wwdatsrc, uCmRptManager, TXComp,
  CmParamReport, TXRB;

type
  TfrmrptDarfGerado = class(TFrmCmReport)
    dsDarfGerado: TwwDataSource;
    pplDarfGerado: TppBDEPipeline;
    rpDarfGerado: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel7: TppLabel;
    ppLine3: TppLine;
    ppLabel8: TppLabel;
    rpDarfGeradoLabel2: TppLabel;
    ppDetailBand5: TppDetailBand;
    rpDarfEmiteDBText11: TppDBText;
    rpDarfEmiteDBText12: TppDBText;
    rpDarfEmiteDBText13: TppDBText;
    rpDarfEmiteDBText14: TppDBText;
    rpDarfEmiteDBText16: TppDBText;
    rpDarfEmiteDBText5: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLine5: TppLine;
    ppLabel11: TppLabel;
    ppCalc1: TppSystemVariable;
    ppCalc2: TppSystemVariable;
    rpDarfEmiteGroup1: TppGroup;
    rpDarfEmiteGroupHeaderBand1: TppGroupHeaderBand;
    rpDarfEmiteDBText1: TppDBText;
    rpDarfEmiteLabel6: TppLabel;
    rpDarfEmiteLabel7: TppLabel;
    rpDarfEmiteDBText2: TppDBText;
    rpDarfEmiteDBText3: TppDBText;
    rpDarfEmiteLabel8: TppLabel;
    rpDarfEmiteDBText4: TppDBText;
    rpDarfEmiteLabel10: TppLabel;
    rpDarfEmiteDBText6: TppDBText;
    rpDarfEmiteLabel11: TppLabel;
    rpDarfEmiteLabel12: TppLabel;
    rpDarfEmiteLabel13: TppLabel;
    rpDarfEmiteLabel14: TppLabel;
    rpDarfEmiteDBText7: TppDBText;
    rpDarfEmiteDBText8: TppDBText;
    rpDarfEmiteDBText9: TppDBText;
    rpDarfEmiteDBText10: TppDBText;
    rpDarfEmiteLine1: TppLine;
    rpDarfEmiteLine2: TppLine;
    rpDarfEmiteGroupFooterBand1: TppGroupFooterBand;
    rpDarfGeradoDBCalc1: TppDBCalc;
    rpDarfGeradoDBCalc2: TppDBCalc;
    rpDarfGeradoLabel1: TppLabel;
    sqlDarfGerado: TCMSqlParams;
    cdsDarfGerado: TCMClientDataSet;
    rpDarfEmiteLabel1: TppLabel;
    rpDarfEmiteLabel2: TppLabel;
    rpDarfEmiteLabel15: TppLabel;
    rpDarfEmiteLabel3: TppLabel;
    rpDarfEmiteLabel5: TppLabel;
    rpDarfEmiteLabel4: TppLabel;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLine1: TppLine;
    pplDarfGeradoppField28: TppField;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure rpDarfEmiteGroupFooterBand1BeforePrint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmrptDarfGerado: TfrmrptDarfGerado;

implementation

{$R *.DFM}

procedure TfrmrptDarfGerado.CrmRptCMBeforePrint(Sender: TObject);
begin
  inherited;
  rpDarfGeradoLabel2.Caption := CmpRptCM.ParamValues[0].Asstring+' - '+CmpRptCM.ParamValues[1].AsString;
  with sqlDarfGerado do
  Begin
    Sql.Clear;

    // Paulo Nobre - TAS000000006794 - Inicio
    Sql.Add(' SELECT t.* FROM ( '+                                                           #13#10+
    // Paulo Nobre - TAS000000006794 - Fim

   // Inicio 127725 Ferrari
            ' SELECT '+                                                                      #13#10+
            '   0 as IDMOTIVO, '+                                                            #13#10+
            '   DRF.IDDARF, '+                                                               #13#10+
            '   '''' as DESCRICAO, '+                                                        #13#10+
            '   LIR.CODNATUREZA, '+                                                          #13#10+
            '   DRF.CODNATUREZA AS NATUREZADARF, '+                                          #13#10+
            '   LIR.NUMDOCUMENTO CPF, '+                                                     #13#10+
            '   PES.RAZAOSOCIAL, '+                                                          #13#10+
            '   DRF.DATAINIAPURACAO, '+                                                      #13#10+
            '   DRF.DATAFINALAPURACAO, '+                                                    #13#10+
            '   DRF.DATAVENCDARF, '+                                                         #13#10+
            '   MIN(NVL(DRF.VLRIRRF, 0)) AS VLRDARF, '+                                      #13#10+
            '   MIN(NVL(DRF.VLRMULTA, 0)) AS VLRMULTA, '+                                    #13#10+
            '   MIN(NVL(DRF.VLRJUROS, 0)) AS VLRJUROS, '+                                    #13#10+
            '   MIN(NVL(DRF.VLRTOTAL, 0)) AS VLRTOTAL, '+                                    #13#10+
            '   DRF.DATAEMISDARF, '+                                                         #13#10+
            '   SUM(DECODE(NVL(LIR.VLRIRRF, 0), 0, '+                                        #13#10+
            '         DECODE(NVL(LIR.VLRPIS, 0), 0, '+                                       #13#10+
            '           DECODE(NVL(LIR.VLRIOF, 0), 0, '+                                     #13#10+
            '             DECODE(NVL(LIR.VLRCOFINS, 0), 0, '+                                #13#10+
            '               DECODE(NVL(LIR.VLRCSLL, 0), 0, '+                                #13#10+
            '                 DECODE(NVL(LIR.VLRCSCOFPIS, 0), 0, 0, '+                       #13#10+
            '                   LIR.VLRCSCOFPIS), '+                                         #13#10+
            '                     LIR.VLRCSLL), '+                                           #13#10+
            '                       LIR.VLRCOFINS), '+                                       #13#10+
            '                         LIR.VLRIOF), '+                                        #13#10+
            '                           LIR.VLRPIS), '+                                      #13#10+
            '                             LIR.VLRIRRF)) AS VLRIRRF, '+                       #13#10+
            '   SUM(NVL(LIR.VLRBASE, 0)) AS VLRBASE, '+                                      #13#10+
            '   LIR.DATALANCAMENTO AS DATALANC, '+                                           #13#10+
            '   DRF.DATAVENCDARF AS DATAPAG, '+                                              #13#10+
            '   DOC.NODOCUMENTO AS NUMAPDOC '+                                               #13#10+
            ' , TRIM(LIR.PLACONTA) AS PLACONTA '+                                            #13#10+ //Everson Cunha - WO7829
            ' FROM '+                                                                        #13#10+
            '   DARF        DRF, '+                                                          #13#10+
            '   LANCIRRF    LIR, '+                                                          #13#10+
            '   PESSOA      PES, '+                                                          #13#10+
            '   DOCUMENTO   DOC  '+                                                          #13#10+
            ' WHERE (DRF.IDDARF        = LIR.IDDARF(+)) '+                                   #13#10+
            '   AND (PES.IDPESSOA(+)   = LIR.IDBENEFIRRF) '+                                 #13#10+
            '   AND (DRF.DATAEMISDARF >= TO_DATE(:DATAINI,''DD/MM/YYYY'')) '+                #13#10+
            '   AND (DRF.DATAEMISDARF <= TO_DATE(:DATAFIM,''DD/MM/YYYY'')) '+                #13#10+
            '   AND (LIR.CODDOCUMENTO = DOC.CODDOCUMENTO(+)) '+                              #13#10+
            '   AND (LIR.CODDOCUMENTO  = DOC.CODDOCUMENTO(+)) '+                             #13#10);

    if CmpRptCM.ParamValues[2].AsString <> '' then
      SQL.Add('   AND DRF.CODNATUREZA = ' + QuotedStr(CmpRptCM.ParamValues[2].AsString));

    Sql.Add(' GROUP BY '+                                                                    #13#10+
            '   PES.RAZAOSOCIAL, '+                                                          #13#10+
            '   DRF.IDDARF, '+                                                               #13#10+
            '   LIR.NUMDOCUMENTO, '+                                                         #13#10+
            '   LIR.CODNATUREZA, '+                                                          #13#10+
            '   DRF.CODNATUREZA, '+                                                          #13#10+
            '   DRF.DATAINIAPURACAO, '+                                                      #13#10+
            '   DRF.DATAFINALAPURACAO, '+                                                    #13#10+
            '   DRF.DATAVENCDARF, '+                                                         #13#10+
            '   DRF.DATAEMISDARF, '+                                                         #13#10+
            '   LIR.DATALANCAMENTO, '+                                                       #13#10+
            '   DRF.DATAVENCDARF, '+                                                         #13#10+
            '   DOC.NODOCUMENTO '+                                                           #13#10+
            ' , TRIM(LIR.PLACONTA) '+                                                        #13#10);     //Everson Cunha - WO7829
    Sql.Add('   Union ');
// Fim SIG 127725 Ferrari
    Sql.Add(' SELECT '+                                                                      #13#10+
            '   LIR.IDMOTIVO, '+                                                             #13#10+      // SIG 127273 Ferrari
            '   DRF.IDDARF, '+                                                               #13#10+
            '   MOT.DESCRICAO, '+                                                            #13#10+      // SIG 127273 Ferrari
            '   LIR.CODNATUREZA, '+                                                          #13#10+
            '   DRF.CODNATUREZA AS NATUREZADARF, '+                                          #13#10+
            '   LIR.NUMDOCUMENTO CPF, '+                                                     #13#10+      // SIG 127273 Ferrari
            '   PES.RAZAOSOCIAL, '+                                                          #13#10+
            '   DRF.DATAINIAPURACAO, '+                                                      #13#10+
            '   DRF.DATAFINALAPURACAO, '+                                                    #13#10+
            '   DRF.DATAVENCDARF, '+                                                         #13#10+
            '   MIN(NVL(DRF.VLRIRRF, 0)) AS VLRDARF, '+                                      #13#10+
            '   MIN(NVL(DRF.VLRMULTA, 0)) AS VLRMULTA, '+                                    #13#10+
            '   MIN(NVL(DRF.VLRJUROS, 0)) AS VLRJUROS, '+                                    #13#10+
            '   MIN(NVL(DRF.VLRTOTAL, 0)) AS VLRTOTAL, '+                                    #13#10+
            '   DRF.DATAEMISDARF, '+                                                         #13#10+
{            '   SUM(DECODE(NVL(LIR.VLRIRRF, 0), 0, '+                                        #13#10+
            '         DECODE(NVL(LIR.VLRPIS, 0), 0, '+                                       #13#10+
            '           DECODE(NVL(LIR.VLRIOF, 0), 0, '+                                     #13#10+
            '             DECODE(NVL(LIR.VLRCOFINS, 0), 0, '+                                #13#10+     // // SIG 127273 Ferrari
            '               DECODE(NVL(LIR.VLRCSLL, 0), 0, '+                                #13#10+
            '                 DECODE(NVL(LIR.VLRCSCOFPIS, 0), 0, 0, '+                       #13#10+
            '                   LIR.VLRCSCOFPIS), '+                                         #13#10+
            '                     LIR.VLRCSLL), '+                                           #13#10+
            '                       LIR.VLRCOFINS), '+                                       #13#10+
            '                         LIR.VLRIOF), '+                                        #13#10+
            '                           LIR.VLRPIS), '+                                      #13#10+
            '                             LIR.VLRIRRF)) AS VLRIRRF, '+                       #13#10+
}
//            '   SUM(NVL(LIR.VLRBASE, 0)) AS VLRBASE, '+                                      #13#10+     // SIG 127273 Ferrari
            '   SUM(NVL(LIR.VLRIMPOSTO,0)) AS VLRIRRF, '+                                    #13#10+       // SIG 127273 Ferrari
            '   SUM(NVL(LIR.VLRBASE,0)) AS VLRBASE, '+                                       #13#10+       // SIG 127273 Ferrari
            '   LIR.DATAPAGAMENTO AS DATALANC, '+                                            #13#10+       // SIG 127273 Ferrari
            '   DRF.DATAVENCDARF AS DATAPAG, '+                                              #13#10+       // SIG 127273 Ferrari
            '   DOC.NODOCUMENTO AS NUMAPDOC '+                                               #13#10+
            ' , TRIM(LIR.PLACONTA) AS PLACONTA '+                                            #13#10+     //Everson Cunha - WO7829
            ' FROM '+                                                                        #13#10+
            '   DARF        DRF, '+                                                          #13#10+
            '   IRRFFOLHABENEF    LIR, '+                                                    #13#10+     // SIG 127273 Ferrari
            '   PESSOA      PES, '+                                                          #13#10+
            '   DOCUMENTO   DOC, '+                                                          #13#10+
            '   MOTIVO MOT  '+                                                               #13#10+      // SIG 127273 Ferrari
{            '  (SELECT '+                                                                    #13#10+
            '     LIR.CODDOCUMENTO, '+                                                       #13#10+
            '     MAX(LDC.DATALANCTO) AS DATAPAG '+                                          #13#10+
            '   FROM '+                                                                      #13#10+
            '     IRRFFOLHABENEF    LIR, '+                                                  #13#10+    // SIG 127273 Ferrari
            '     LANCTODOCUM LDC '+                                                         #13#10+
            '   WHERE (LIR.CODDOCUMENTO = LDC.CODDOCUMENTO) '+                               #13#10+
            '     AND (LDC.OPERACAO     = ''5 '') '+                                         #13#10+
            '   GROUP BY '+                                                                  #13#10+
            '     LIR.CODDOCUMENTO) BDO '+                                                   #13#10+
}
            ' WHERE (DRF.IDDARF        = LIR.IDDARF(+)) '+                                   #13#10+
            '   AND (PES.IDPESSOA(+)   = LIR.IDPESSOA) '+                                    #13#10+     // SIG 127273 Ferrari
            '   AND (DRF.DATAEMISDARF >= TO_DATE(:DATAINI,''DD/MM/YYYY'')) '+                #13#10+
            '   AND (DRF.DATAEMISDARF <= TO_DATE(:DATAFIM,''DD/MM/YYYY'')) '+                #13#10+
            '   AND (LIR.IDMOTIVO = MOT.IDMOTIVO) '+                                         #13#10+
            '   AND (LIR.CODDOCUMENTO  = DOC.CODDOCUMENTO(+)) '+                             #13#10);

    if CmpRptCM.ParamValues[2].AsString <> '' then
      SQL.Add('   AND DRF.CODNATUREZA = ' + QuotedStr(CmpRptCM.ParamValues[2].AsString));

    Sql.Add(' GROUP BY '+                                                                    #13#10+
            '   LIR.IDMOTIVO, '+                                                             #13#10+      // SIG 127273 Ferrari
            '   MOT.DESCRICAO, '+                                                            #13#10+      // SIG 127273 Ferrari
            '   LIR.NUMDOCUMENTO, '+                                                         #13#10+      // SIG 127273 Ferrari
            '   PES.RAZAOSOCIAL, '+                                                          #13#10+
            '   DRF.IDDARF, '+                                                               #13#10+
            '   LIR.CODNATUREZA, '+                                                          #13#10+
            '   DRF.CODNATUREZA, '+                                                          #13#10+
            '   DRF.DATAINIAPURACAO, '+                                                      #13#10+
            '   DRF.DATAFINALAPURACAO, '+                                                    #13#10+
            '   DRF.DATAVENCDARF, '+                                                         #13#10+
            '   DRF.DATAEMISDARF, '+                                                         #13#10+
            '   LIR.DATAPAGAMENTO, '+                                                        #13#10+      // SIG 127273 Ferrari
            '   DRF.DATAVENCDARF, '+                                                         #13#10+      // SIG 127273 Ferrari
            '   DOC.NODOCUMENTO '+                                                           #13#10+
            ' , TRIM(LIR.PLACONTA) '+                                                        #13#10);     //Everson Cunha - WO7829

    // Paulo Nobre - TAS000000006794 - Inicio

{    Sql.Add(' ORDER BY '+                                                                    #13#10+
            '   DRF.IDDARF, '+                                                               #13#10+
            '   DRF.DATAEMISDARF, '+                                                         #13#10+
            '   LIR.CODNATUREZA, '+                                                          #13#10+      // SIG 127725 Ferrari
            '   PES.RAZAOSOCIAL '+                                                           #13#10);   }

        Sql.Add('  ) t '+                                                                    #13#10+
            ' ORDER BY t.IDDARF, '+                                                          #13#10+
            '          t.DATAEMISDARF, '+                                                    #13#10+
            '          t.CODNATUREZA, '+                                                     #13#10+
            '          t.RAZAOSOCIAL '+                                                      #13#10);

    // Paulo Nobre - TAS000000006794 - Fim

    prepare;

    ParamByName('DATAINI').AsString := CmpRptCM.ParamValues[0].AsString;
    ParamByName('DATAFIM').AsString := CmpRptCM.ParamValues[1].AsString;

    Sql.SaveToFile('C:\Planus\Temp\darf.TXT');

    Open;
  end;
end;

procedure TfrmrptDarfGerado.rpDarfEmiteGroupFooterBand1BeforePrint(
  Sender: TObject);
begin
  inherited;

  if ((rpDarfGeradoDBCalc1.Value > 0) or (rpDarfGeradoDBCalc2.value > 0)) or
     (Trim(rpDarfEmiteDBText11.Text) <> '') then
    Begin
      rpDarfGeradoLabel1.Visible  := true;
      rpDarfGeradoDBCalc1.Visible := true;
      rpDarfGeradoDBCalc2.Visible := true;
    end
  else
    Begin
      rpDarfGeradoLabel1.Visible  := false;
      rpDarfGeradoDBCalc1.Visible := false;
      rpDarfGeradoDBCalc2.Visible := false;
    end;
end;

end.
