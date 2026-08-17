{-------------------------------------------------------------------------------
------------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------
--------------------------------------------------------------------------------

 Pendência....: 129494 
 Data.........: 06/10/2022
 Responsável..: Everson Cunha
 Descrição....: Possibilitar a geração sem o preenchimento do filtro da Conta
--------------------------------------------------------------------------------
//Rotina..........: rpExtratoContaSummaryBand1BeforePrint
//N. Sol..........: 125196
//N. Kintana......:
//Data............: 06/05/2022
//Responsável.....: Luis Ferrari
//Descrição.......: Não abater mais o total de bloqueios judiciais do campo
//                  Total Disponível
--------------------------------------------------------------------------------
//Rotina..........: CrmRptCmBeforePrint
//N. Sol..........: 218716
//N. Kintana......: 2060242
//Data............: 25/02/2014
//Alteração Form..: Commit Update da Situação Bloqueado Temporáriamente
//                  (SITBLOQUEIOLANC = -1)
//Responsável.....: Felipe A. Santos
//Descrição.......: Foi mudado o commit do update que muda situação do cheque
//                  para bloqueado no before  print do relatório, para que esse
//                  bloqueio temporário fique somente na memória e não no banco,
//                  pois ocorria o caso de não desbloquear a situação caso o
//                  sistema fosse forçado a ser finalizado.
--------------------------------------------------------------------------------
//N. Sol..........: 201700
//N. Kintana......: 1955228
//Data............: 07/03/2013
//Responsável.....: Paulo Nobre
//Descrição.......: Controle de Bloqueio para lançamentos de SICOB D+1 e SIVAT
--------------------------------------------------------------------------------
//N. Sol..........: 198796/13843
//N. Kintana......: 1914601
//Data............: 04/02/2013
//Responsável.....: Paulo Nobre
//Descrição.......: Acertando rotina (update) que cria conceito de Bloquear um
//                  cheque temporariamente p/ atender necessidade de saldo neste
//                  relatorio
--------------------------------------------------------------------------------
//N. Sol..........: 198796
//N. Kintana......: 1913896
//Data............: 16/01/2013
//Responsável.....: Paulo Nobre
//Descrição.......: Incluindo rotina (update) que cria conceito de Bloquear um
//                  cheque temporariamente p/ atender necessidade de saldo neste
//                  relatorio
--------------------------------------------------------------------------------
//N. Sol..........: 198796/13762
//N. Kintana......: 1912835
//Data............: 15/01/2013
//Responsável.....: Paulo Nobre
//Descrição.......: Colocando ABS no valor do cheque bloqueado
--------------------------------------------------------------------------------
//N. Sol..........: 31714/12942
//N. Kintana......: 1879169
//Data............: 07/12/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Selecionando os Bloqueios Judiciais Anteriores a data
--------------------------------------------------------------------------------
//N. Sol..........: 31714/12862
//N. Kintana......: 1873038
//Data............: 29/11/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Alterando a data de pesquisa dos saldos bloqueados para a
//                  data final
--------------------------------------------------------------------------------
//N. Sol..........: 31714_11823
//N. Kintana......: 1817509
//Data............: 08/10/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão de novos totalizadores para atender à NOVA
//                  conciliação bancária
--------------------------------------------------------------------------------}

Unit RExtratoContas;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FCmReport, uCmRptManager, TXComp, CmParamReport, ppDB, ppDBPipe, ppDBBDE,
   Db, Wwdatsrc, ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache,
   ppComm, ppRelatv, ppProd, ppReport, DBClient, uCMClientDataSet, uCtrlExtratoContas,
   uCmSqlParams, TXRB, DBTables, Wwquery;

Type
   TRptExtratoContas = Class(TFrmCmReport)
      rpExtratoContas: TppReport;
      ppHeader: TppHeaderBand;
      pplNomeRelat: TppLabel;
      pplblEmpresa: TppLabel;
      rpExtratoContaLabel10: TppLabel;
      lbData: TppLabel;
      rpExtratoContaLabel11: TppLabel;
      lbStatus: TppLabel;
      lblData: TppLabel;
      lblDoc: TppLabel;
      lblHistorico: TppLabel;
      lblValor: TppLabel;
      lblSaldo: TppLabel;
      lblStatus: TppLabel;
      rpExtratoContaLine1: TppLine;
      rpExtratoContaLabel1: TppLabel;
      ppDetail: TppDetailBand;
      dbtData: TppDBText;
      dbtBordero: TppDBText;
      dbtHistorico: TppDBText;
      dbtValor: TppDBText;
      dbtStatus: TppDBText;
      rpExtratoContaDBText2: TppDBText;
      rpExtratoContaDBText3: TppDBText;
      ppFooter: TppFooterBand;
      pplblSistema: TppLabel;
      ppLine4: TppLine;
      ppCalc3: TppSystemVariable;
      ppCalc4: TppSystemVariable;
      rpExtratoContaDBText1: TppDBText;
      rpExtratoContaDBCalc1: TppDBCalc;
      rpExtratoContaDBCalc4: TppDBCalc;
      rpExtratoContaLine2: TppLine;
      rpExtratoContaLabel2: TppLabel;
      rpExtratoContaGroup1: TppGroup;
      rpHeaderDescricao: TppGroupHeaderBand;
      dbtDescricao: TppDBText;
      rpExtratoContaLine3: TppLine;
      rpFooterDescricao: TppGroupFooterBand;
      rpExtratoContaDBCalc2: TppDBCalc;
      rpExtratoContaDBCalc3: TppDBCalc;
      dsExtratoContas: TwwDataSource;
      ppExtratoContas: TppBDEPipeline;
      ppExtratoContappField1: TppField;
      ppExtratoContappField2: TppField;
      ppExtratoContappField3: TppField;
      ppExtratoContappField4: TppField;
      ppExtratoContappField5: TppField;
      ppExtratoContappField6: TppField;
      ppExtratoContappField7: TppField;
      ppExtratoContappField8: TppField;
      ppExtratoContappField9: TppField;
      ppExtratoContappField10: TppField;
      ppExtratoContappField11: TppField;
      ppExtratoContappField12: TppField;
      ppExtratoContappField13: TppField;
      ppExtratoContappField14: TppField;
      cdsExtratoContas: TCMClientDataSet;
      ppLabel2: TppLabel;
      qryTotBloqueios: TwwQuery;
      qryTotBloqueiosVALORTOTBLOQ: TFloatField;
      dsTotBloqueios: TwwDataSource;
      ppBDETotBloqueios: TppBDEPipeline;
      qryTotBloqJud: TwwQuery;
      dsTotBloqJud: TwwDataSource;
      qryTotBloqChq: TwwQuery;
      dsTotBloqChq: TwwDataSource;
      qryTotBloqJudVALORTOTBLOQJUD: TFloatField;
      qryTotBloqChqVALORTOTBLOQCHQ: TFloatField;
      ppBDETotBloqJud: TppBDEPipeline;
      ppBDETotBloqChq: TppBDEPipeline;
      qryAux: TwwQuery;
      qryTotBloqOutros: TwwQuery;
      dsTotBloqOutros: TwwDataSource;
      qryTotBloqOutrosVALORTOTBLOQOUTROS: TFloatField;
      ppBDETotBloqOutros: TppBDEPipeline;
    plblCheques: TppLabel;
    plblBloqueioOutros: TppLabel;
    plblBloqueioJudiciais: TppLabel;
    pdbtxtVlrBloqCheques: TppDBText;
    rpExtratoContaDBTextBloqOutros: TppDBText;
    rpExtratoContaDBTextBloqJud: TppDBText;
    ppExtratoContasppField1: TppField;
    ppExtratoContasppField2: TppField;
    ppExtratoContasppField3: TppField;
    ppDBText4: TppDBText;

      Procedure CmpRptCMBeforeExecute(Var CanExecute: Boolean);
      Procedure CrmRptCMBeforePrint(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure FormDestroy(Sender: TObject);
      Procedure rpExtratoContaSummaryBand1BeforePrint(Sender: TObject);

   Private { Private declarations }

      CtrlExtratoContas: TCtrlExtratoContas;

   Public { Public declarations }

   End;

Var
   RptExtratoContas: TRptExtratoContas;

Implementation
{$R *.DFM}
Uses
   dBaseDados;

Procedure TRptExtratoContas.FormCreate(Sender: TObject);
Begin
   Inherited;
   CtrlExtratoContas := TCtrlExtratoContas.Create;
   CtrlExtratoContas.Initialize(dtmBaseDados.dbBaseDados, True);
End;

Procedure TRptExtratoContas.FormDestroy(Sender: TObject);
Begin
   // SOL 198796   KTN 1913896  - Paulo Nobre
   qryTotBloqueios.Close;
   qryTotBloqJud.Close;
   qryTotBloqChq.Close;

   //Everson Cunha - SIG129494 - Ini
   {If Not dtmBaseDados.dbBaseDados.Intransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;
   qryAux.Close;
   qryAux.SQL.clear;
   qryAux.SQL.ADD('UPDATE MOVIMFINANC SET ');
   qryAux.SQL.ADD('SITBLOQUEIOLANC = 0    '); // Voltando o Desbloqueio para o cheque que estava Bloq. temporario
   qryAux.SQL.add('WHERE DATALANCFINAN = ' + quotedstr(FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[1].AsDateTime)));

   if not(CmpRptCM.ParamValues[2].IsNull) then //Everson Cunha - SIG129494
     qryAux.SQL.add('      AND CODPORTADOR = ' + CmpRptCM.ParamValues[2].asString);

   qryAux.SQL.add('      AND SITBLOQUEIOLANC = -1 '); // Bloqueado
   // SOL 201700 Kintana 1955228 - Paulo Nobre
   qryAux.SQL.add('      AND HISTPADFINAN IN (14, 19, 20)  '); // Cheques e SICOB D+1 e SIVAT
   If Not qryAux.Prepared Then
      qryAux.Prepare;
   qryAux.ExecSQL;
   If dtmBaseDados.dbBaseDados.Intransaction Then
      dtmBaseDados.dbBaseDados.Commit;
   //
   } //Everson Cunha - SIG129494 - Fim

   CtrlExtratoContas.Free;
   Inherited;
End;

Procedure TRptExtratoContas.CmpRptCMBeforeExecute(Var CanExecute: Boolean);
Begin
   Inherited;
   CmpRptCM.ParamValues[0].TextDefault := FormatDateTime('dd/mm/yyyy', Date);
   CmpRptCM.ParamValues[1].TextDefault := FormatDateTime('dd/mm/yyyy', Date);

   CmpRptCM.ParamValues[2].LookupSettings.SQL.Text := 'SELECT ' +
      '   CODPORTADOR,DESCRICAO ' +
      'FROM ' +
      '   PORTADORCONTA ' +
      'WHERE ' +
      '  (IDPESSOA = ' + FloatToStr(CrmRptCM.IdEmpresa) + ') AND ' +
      '  ((FLGSTATUS=''A'') OR (FLGSTATUS is null)) ' +
      'ORDER BY DESCRICAO ';
End;

Procedure TRptExtratoContas.CrmRptCMBeforePrint(Sender: TObject);
Var
   Filtro: TFiltro;
Begin
   Inherited;
   Filtro.rIDPessoa := CrmRptCM.IdEmpresa;

   Filtro.dDataInicial := CmpRptCM.ParamValues[0].AsDateTime;
   Filtro.dDataFinal := CmpRptCM.ParamValues[1].AsDateTime;

   If Not (CmpRptCM.ParamValues[2].IsNull) Then
      Filtro.rCodPortador := CmpRptCM.ParamValues[2].AsFloat;
   If Not (CmpRptCM.ParamValues[3].IsNull) Then
      Filtro.rIDModulo := CmpRptCM.ParamValues[3].AsFloat;

   Filtro.iStatus := CmpRptCM.ParamValues[4].AsInteger;
   Filtro.iTipoEmissao := CmpRptCM.ParamValues[5].AsInteger;
   Filtro.iOrdenacao := CmpRptCM.ParamValues[6].AsInteger;
   Filtro.bOutraMoeda := (CmpRptCM.ParamValues[7].AsInteger = 1);

   If Filtro.bOutraMoeda Then
      pplNomeRelat.Caption := 'Extrato de Contas (Outra Moeda)'
   Else
      pplNomeRelat.Caption := 'Extrato de Contas';

   Filtro.bCtasComMov := CmpRptCM.ParamValues[8].AsBoolean;

   //Carrega cdsExtratoContas
   cdsExtratoContas.Data := CtrlExtratoContas.GeraDadosExtratoContas(Filtro);

   rpExtratoContas.Groups[0].NewPage := CmpRptCM.ParamValues[9].AsBoolean;

   Case CmpRptCM.ParamValues[9].AsInteger Of
      0: lbData.Caption := 'Data de Lançamento: ' +
         FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[0].AsDateTime) + ' à ' +
            FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[1].AsDateTime);
      1: lbData.Caption := 'Data de Conciliação: ' +
         FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[0].AsDateTime) + ' à ' +
            FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[1].AsDateTime);
   End;

   lbStatus.caption := CmpRptCM.ParamValues[4].RadioGroupSettings.Items[CmpRptCM.ParamValues[4].AsInteger];

   //Everson Cunha - SIG129494 - Ini
   // Passei pra dentro da TCtrlExtratoContas (uCtrlExtratoContas.pas)
   
   {// SOL 198796   KTN 1913896  - Paulo Nobre
   // Sol 198796/13843 Kintana 1914601 -  Paulo Nobre
   If Not dtmBaseDados.dbBaseDados.Intransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.ADD('UPDATE MOVIMFINANC SET ');
   qryAux.SQL.ADD('SITBLOQUEIOLANC = -1    '); // Bloqueado temporario só para atender a um necessidade deste relatório
   qryAux.SQL.add('WHERE DATALANCFINAN = ' + quotedstr(FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[1].AsDateTime)));

   if not(CmpRptCM.ParamValues[2].IsNull) then //Everson Cunha - SIG129494
     qryAux.SQL.add('      AND CODPORTADOR = ' + CmpRptCM.ParamValues[2].asString);
     
   qryAux.SQL.add('      AND SITBLOQUEIOLANC = 0 '); // Desbloqueado               1
   // SOL 201700 Kintana 1955228 - Paulo Nobre
   qryAux.SQL.add('      AND HISTPADFINAN IN (14, 19, 20)  '); // Cheques e SICOB D+1 e SIVAT
   If Not qryAux.Prepared Then
      qryAux.Prepare;
   qryAux.ExecSQL;

   // Felipe A. Santos SOL 218716 KINTANA 2060242 - Inicio
   //If dtmBaseDados.dbBaseDados.Intransaction Then
   // dtmBaseDados.dbBaseDados.Commit;
   // Felipe A. Santos SOL 218716 KINTANA 2060242 - fim

   // SOL 31714_11823  KTN 1817509 - Paulo Nobre
   // SOL 31714/12862   KTN 1873038   - Paulo Nobre
   // Selecionando os Bloqueios Judiciais Anteriores a data
   qryTotBloqJud.Close;
   qryTotBloqJud.SQL.Clear;
   qryTotBloqJud.SQL.add('SELECT ABS(NVL(SUM(DECODE(TIPOLANCTO, ''S'', -VALORLANCTO, VALORLANCTO)), 0)) AS VALORTOTBLOQJUD ');
   qryTotBloqJud.SQL.add('FROM MOVFINBLOQJUDICIAIS   ');
   qryTotBloqJud.SQL.add('WHERE DATALANCTO <= ' + quotedstr(FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[1].AsDateTime)));

   if not(CmpRptCM.ParamValues[2].IsNull) then //Everson Cunha - SIG129494
     qryTotBloqJud.SQL.add('      AND CODPORTADOR = ' + CmpRptCM.ParamValues[2].asString);

   qryTotBloqJud.SQL.add('      AND SITBLOQDESBLOQ = 1    '); // Bloqueado
   qryTotBloqJud.SQL.add('      AND IDMOVFINBLOQJUDICIAIS NOT IN (SELECT IDMOVFINBLOQJUDICIAISPAI FROM MOVFINBLOQJUDICIAIS  ');
   qryTotBloqJud.SQL.add('                                        WHERE DATALANCTO <= ' + quotedstr(FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[1].AsDateTime)));

   if not(CmpRptCM.ParamValues[2].IsNull) then //Everson Cunha - SIG129494
     qryTotBloqJud.SQL.add('                                              AND CODPORTADOR = ' + CmpRptCM.ParamValues[2].asString);

   qryTotBloqJud.SQL.add('                                              AND SITBLOQDESBLOQ = 0 ) ');
   qryTotBloqJud.Open;

   // Selecionando os Cheques Bloqueados Anteriores a data
   // Sol..........: 31714/12942 - Paulo Nobre
   // SOL 198796/13762 - KTN 1912835 - Paulo Nobre
   // Sol 198796/13843 Kintana 1914601 -  Paulo Nobre
   qryTotBloqChq.Close;
   qryTotBloqChq.SQL.Clear;
   qryTotBloqChq.SQL.add('SELECT ABS(NVL(SUM(DECODE(ENTRADASAIDA, ''S'', -VALORLANCFINAN, VALORLANCFINAN)), 0)) AS VALORTOTBLOQCHQ');
   qryTotBloqChq.SQL.add('FROM MOVIMFINANC     ');
   qryTotBloqChq.SQL.add('WHERE DATALANCFINAN <= ' + quotedstr(FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[1].AsDateTime)));

   if not(CmpRptCM.ParamValues[2].IsNull) then //Everson Cunha - SIG129494
     qryTotBloqChq.SQL.add('      AND CODPORTADOR = ' + CmpRptCM.ParamValues[2].asString);
     
   qryTotBloqChq.SQL.add('      AND SITBLOQUEIOLANC IN (-1, 1) '); // Bloqueado Temporário e Bloqueado Normal (pela conciliação)
   // SOL 201700 Kintana 1955228 - Paulo Nobre
   qryTotBloqChq.SQL.add('      AND HISTPADFINAN = 14 '); // Cheques
   qryTotBloqChq.Open;

   // Selecionando Outros documentos bloqueados Anteriores a data
   qryTotBloqOutros.Close;
   qryTotBloqOutros.SQL.Clear;
   qryTotBloqOutros.SQL.add('SELECT ABS(NVL(SUM(DECODE(ENTRADASAIDA, ''S'', -VALORLANCFINAN, VALORLANCFINAN)), 0)) AS VALORTOTBLOQOUTROS');
   qryTotBloqOutros.SQL.add('FROM MOVIMFINANC     ');
   qryTotBloqOutros.SQL.add('WHERE DATALANCFINAN <= ' + quotedstr(FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[1].AsDateTime)));

   if not(CmpRptCM.ParamValues[2].IsNull) then //Everson Cunha - SIG129494
     qryTotBloqOutros.SQL.add('      AND CODPORTADOR = ' + CmpRptCM.ParamValues[2].asString);
     
   qryTotBloqOutros.SQL.add('      AND SITBLOQUEIOLANC IN (-1, 1) '); // Bloqueado Temporário e Bloqueado Normal (pela conciliação)
   // SOL 201700 Kintana 1955228 - Paulo Nobre
   qryTotBloqOutros.SQL.add('      AND HISTPADFINAN IN (19, 20)  '); // SICOB D+1 e SIVAT
   qryTotBloqOutros.Open;

   // Sol 198796/13843 Kintana 1914601 -  Paulo Nobre
   qryTotBloqueios.Close;
   qryTotBloqueios.SQL.Clear;
   qryTotBloqueios.SQL.add('SELECT                        ');
   qryTotBloqueios.SQL.add('(SELECT ABS(NVL(SUM(DECODE(ENTRADASAIDA, ''S'', -VALORLANCFINAN, VALORLANCFINAN)), 0)) ');
   qryTotBloqueios.SQL.add(' FROM MOVIMFINANC     ');
   qryTotBloqueios.SQL.add('WHERE DATALANCFINAN <= ' + quotedstr(FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[1].AsDateTime)));

   if not(CmpRptCM.ParamValues[2].IsNull) then //Everson Cunha - SIG129494
     qryTotBloqueios.SQL.add('      AND CODPORTADOR = ' + CmpRptCM.ParamValues[2].asString);

   qryTotBloqueios.SQL.add('      AND SITBLOQUEIOLANC IN (-1, 1) '); // Bloqueado Temporário e Bloqueado Normal (pela conciliação)
   // SOL 201700 Kintana 1955228 - Paulo Nobre
   qryTotBloqueios.SQL.add('      AND HISTPADFINAN IN (14, 19, 20) )  '); // Cheques e SICOB D+1 e SIVAT
   qryTotBloqueios.SQL.add(' +         ');
   qryTotBloqueios.SQL.add('(SELECT ABS(NVL(SUM(DECODE(TIPOLANCTO, ''S'', -VALORLANCTO, VALORLANCTO)), 0))  ');
   qryTotBloqueios.SQL.add(' FROM MOVFINBLOQJUDICIAIS   ');
   qryTotBloqueios.SQL.add('WHERE DATALANCTO <= ' + quotedstr(FormatDateTime('dd/mm/yyyy', CmpRptCM.ParamValues[1].AsDateTime)));

   if not(CmpRptCM.ParamValues[2].IsNull) then //Everson Cunha - SIG129494
     qryTotBloqueios.SQL.add('      AND CODPORTADOR = ' + CmpRptCM.ParamValues[2].asString );

   qryTotBloqueios.SQL.add(' ) AS VALORTOTBLOQ ');
   qryTotBloqueios.SQL.add('FROM DUAL    ');
   qryTotBloqueios.Open;

   // Felipe A. Santos SOL 218716 KINTANA 2060242 - Inicio
   if dtmBaseDados.dbBaseDados.InTransaction then
      dtmBaseDados.dbBaseDados.Rollback;
   // Felipe A. Santos SOL 218716 KINTANA 2060242 - fim
   } //Everson Cunha - SIG129494 - Fim

End;

Procedure TRptExtratoContas.rpExtratoContaSummaryBand1BeforePrint(Sender: TObject);
Begin
   Inherited;
   // SOL 31714_11823  KTN 1817509 - Paulo Nobre
   // ppSaldoDispMovimFinanc.Caption := floattostrf(cdsExtratoContas.fieldbyname('SALDOTOTAL').asFloat - qryTotBloqueios.fieldbyname('VALORTOTBLOQ').asFloat, ffnumber, 18, 2);   SIG 125196 Ferrari
   //ppSaldoDispMovimFinanc.Caption := floattostrf(cdsExtratoContas.fieldbyname('SALDOTOTAL').asFloat, ffnumber, 18, 2);  // SIG 125196 Ferrari //Everson Cunha - SIG129494
End;

End.

