//******************************************************************************
// Data      : 31/01/2007
// Codigo    : AL_4
// Pendência : 23280
// Sol       :
// Motivo    : Criada rotina para verificar o total de quantidades
//               da carteria própria com suas respectivas carteiras gerenciais
//******************************************************************************
// Data      : 03/01/2007
// Codigo    : AL_3
// Pendência : 24094
// Sol       :
// Motivo    : Retirado a filtragem do IdInvestimenento da HistCaixa
//******************************************************************************
// Data      : 31/08/2006
// Codigo    : AL_2
// Pendência :
// Sol       :
// Motivo    : Implementação do plano/patrocinador
//******************************************************************************
// Data      : 08/02/2006
// Código    : AL_1
// Pendencia :
// SOL       : 35066
// Motivo    : Ajuste na movimentação das operações virtuais, essa passam a ser
//             consultada independentes da atualização da carteira gerencial
//******************************************************************************

unit uCtrlCarteiraGerenc;

interface

//AL_4
Uses SysUtils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCmClientDataSet, UCmSqlParams,
     {$IFNDEF VERSAO0505} uCMTypes, {$ENDIF}
     uCtrlInvestimento, uCtrlParamInvest, uCMFileUtils, uCtrlPadroes;

type
   TCtrlCarteiraGerenc = Class(TCmControlObject)
   private

   public

      constructor Create; override;
      destructor  Destroy; override;
      procedure   OnCreateAppServer; override;

      function ListEvCaixaCota(iIdEventoCaixaCota : Integer = -1;
                               iIdTipoInvest      : Integer = -1;
                               iIdTipoOperacao    : Integer = -1;
                               iIdTipoDespInvest  : Integer = -1;
                               sTipoCpmf          : String  = '';
                               sTipoEvento        : String  = '') : OleVariant;

      //AL_1
      function ListMovOperVirtual(dDataIni, dDataFim : TDateTime;
                                  iIdEventoCaixaCota : Integer =  0;
                                  iIdTipoInvest      : Integer = -1;
                                  iIdTipoOperacao    : Integer =  0;
                                  iIdTipoDespInvest  : Integer =  0;
                                  iIdCarteiraGerenc  : Integer = -1;
                                  iIdInvestimento    : Integer = -1;
                                  iIdPlanPrevCtbPatr : Integer = -1;
                                  sTipoCpmf          : String  = '';
                                  sTipoEvento        : String  = '') : OleVariant;

      //AL_4
      function ListDifCarteiras(dData: TDateTime): Boolean;

   protected
      procedure DoChangeDataBase; override;
   end;

implementation

{TCtrlInvestimento}

constructor TCtrlCarteiraGerenc.Create;
begin
   inherited;
end;

destructor TCtrlCarteiraGerenc.Destroy;
begin
   inherited;
end;

procedure TCtrlCarteiraGerenc.OnCreateAppServer;
begin
   inherited;
end;

procedure TCtrlCarteiraGerenc.DoChangeDataBase;
begin
   inherited;
end;

function TCtrlCarteiraGerenc.ListEvCaixaCota(iIdEventoCaixaCota : Integer = -1;
                                             iIdTipoInvest      : Integer = -1;
                                             iIdTipoOperacao    : Integer = -1;
                                             iIdTipoDespInvest  : Integer = -1;
                                             sTipoCpmf          : String  = '';
                                             sTipoEvento        : String  = '') : OleVariant;
var
   sSql : String;
   bPri : Boolean;
begin
   bPri := True;
   //AL_1
   sSql := 'SELECT EC.IDEVENTOCAIXACOTA, EC.IDREGRA, '+#13+
           '       EC.IDTIPOINVEST, EC.IDTIPOOPERACAO, EC.IDTIPODESPINVEST, '+#13+
           '       EC.DESCCAIXACOTA, TP.DESCTIPOOPERACAO, TD.DESCTIPODESPINV, '+#13+
           '       EC.STACAIXA, EC.STACOTA, EC.STAATIVOPASSIVO, EC.STASOMADIMINUI, '+#13+
           '       EC.STACOTIZA,EC.STACPMF '+#13+
           'FROM EVENTOCAIXACOTA EC, TIPOOPERACAO TP, TIPODESPINVEST TD '+#13;

   if iIdEventoCaixaCota > 0 then
   begin
      sSql := sSql + 'WHERE (EC.IDEVENTOCAIXACOTA = ' + IntToStr(iIdEventoCaixaCota) + ') ' + #13;
      bPri := False;
   end;

   if iIdTipoInvest > -1 then
   begin
      if bPri then
      begin
         sSql := sSql + 'WHERE (EC.IDTIPOINVEST = ' + IntToStr(iIdTipoInvest) + ') ' + #13;
         bPri := False;
      end
      else
         sSql := sSql + '  AND (EC.IDTIPOINVEST = ' + IntToStr(iIdTipoInvest) + ') ' + #13;
   end;

   if iIdTipoOperacao > -1 then
   begin
      if bPri then
      begin
         sSql := sSql + 'WHERE (EC.IDTIPOOPERACAO    = ' + IntToStr(iIdTipoOperacao) + ') '+ #13;
         bPri := False;
      end
      else
         sSql := sSql + '  AND (EC.IDTIPOOPERACAO    = ' + IntToStr(iIdTipoOperacao) + ') '+ #13;
   end;

   if iIdTipoDespInvest > -1 then
   begin
      if bPri then
      begin
         sSql := sSql + 'WHERE (EC.IDTIPODESPINVEST  = ' + IntToStr(iIdTipoDespInvest) + ') '+ #13;
         bPri := False;
      end
      else
         sSql := sSql + '  AND (EC.IDTIPODESPINVEST  = ' + IntToStr(iIdTipoDespInvest) + ') '+ #13;
   end;

   if sTipoCpmf = 'S' then   //CPMF
   begin
      if bPri then
      begin
         sSql := sSql + 'WHERE (EC.STACPMF   = ''S'') '+#13;
         bPri := False;
      end
      else
         sSql := sSql + '  AND (EC.STACPMF   = ''S'') '+#13;
   end;

   if sTipoEvento = 'X' then //CAIXA
   begin
      if bPri then
      begin
         sSql := sSql + 'WHERE (EC.STACAIXA  = ''S'') '+#13;
         bPri := False;
      end
      else
         sSql := sSql + '  AND (EC.STACAIXA  = ''S'') '+#13;
   end;

   if sTipoEvento = 'C' then //COTA
   begin
      if bPri then
      begin
         sSql := sSql + 'WHERE (EC.STACOTA   = ''S'') '+#13;
         bPri := False;
      end
      else
         sSql := sSql + '  AND (EC.STACOTA   = ''S'') '+#13;
   end;

   if bPri then
      sSql := sSql + 'WHERE (EC.IDTIPOINVEST     = TP.IDTIPOINVEST(+))     '+#13+
                     '  AND (EC.IDTIPOOPERACAO   = TP.IDTIPOOPERACAO(+))   '+#13+
                     '  AND (EC.IDTIPODESPINVEST = TD.IDTIPODESPINVEST(+)) '+#13
   else
      sSql := sSql + '  AND (EC.IDTIPOINVEST     = TP.IDTIPOINVEST(+))     '+#13+
                     '  AND (EC.IDTIPOOPERACAO   = TP.IDTIPOOPERACAO(+))   '+#13+
                     '  AND (EC.IDTIPODESPINVEST = TD.IDTIPODESPINVEST(+)) '+#13;

   sSql    := sSql + ' ORDER BY EC.DESCCAIXACOTA ';

   Result  :=GetDataPacket(sSql);
end;

function TCtrlCarteiraGerenc.ListMovOperVirtual(dDataIni, dDataFim : TDateTime;
                                                iIdEventoCaixaCota : Integer =  0;
                                                iIdTipoInvest      : Integer = -1;
                                                iIdTipoOperacao    : Integer =  0;
                                                iIdTipoDespInvest  : Integer =  0;
                                                iIdCarteiraGerenc  : Integer = -1;
                                                iIdInvestimento    : Integer = -1;
                                                iIdPlanPrevCtbPatr : Integer = -1;
                                                sTipoCpmf          : String  = '';
                                                sTipoEvento        : String  = '') : OleVariant;
var sSql: String;
begin
   //AL_1
   sSql := 'SELECT OP.DATAHISTCAIXA, OP.DESCTIPOOPERACAO, OP.DESCCAIXACOTA, OP.DESCCARTGERENC, OP.DESCINVESTIMENTO, '+#13+
           'OP.QTDEOPERACAO, OP.PRECOUNITOPERACAO, OP.VLRHISTCAIXA, PL.PLANPRVCONTABPATRO '+#13+
           'FROM '+#13+
           '  ( (SELECT OI.DATAOPERACAO AS DATAHISTCAIXA,'+#13+
           '     DECODE(TP.DESCTIPOOPERACAO, NULL, EC.DESCCAIXACOTA, TP.DESCTIPOOPERACAO) AS DESCTIPOOPERACAO,'+#13+
           '     EC.DESCCAIXACOTA, CG.DESCCARTGERENC, IV.DESCINVESTIMENTO, OI.QTDEOPERACAO, OI.PRECOUNITOPERACAO, '+#13+
           '     OI.VLROPERACAO AS VLRHISTCAIXA, OI.IDPLANPREVCTBPATR '+#13+
           '     FROM OPERACAOINVEST OI, INVESTIMENTO IV, CARTEIRAGERENC CG, TIPOOPERACAO TP, EVENTOCAIXACOTA  EC '+#13+
           '     WHERE OI.DATAOPERACAO BETWEEN TO_DATE(' + QuotedStr(DateToStr(dDataIni)) + ', ' + QuotedStr('DD/MM/YYYY') + ') AND '+#13+
           '                                   TO_DATE(' + QuotedStr(DateToStr(dDataFim)) + ', ' + QuotedStr('DD/MM/YYYY') + ') '+#13;
   if iIdTipoInvest      > 0 then
      sSql := sSql + '      AND OI.IDTIPOINVEST      = ' + IntToStr(iIdTipoInvest)+#13;
   if iIdPlanPrevCtbPatr > 0 then
      sSql := sSql + '      AND OI.IDPLANPREVCTBPATR = ' + IntToStr(iIdPlanPrevCtbPatr)+#13;
   if iIdCarteiraGerenc  > 0 then
      sSql := sSql + '      AND OI.IDCARTEIRAGERENC  = ' + IntToStr(iIdCarteiraGerenc)+#13;
   if iIdInvestimento    > 0 then
      sSql := sSql + '      AND OI.IDINVESTIMENTO    = ' + IntToStr(iIdInvestimento)+#13;
   if iIdTipoOperacao   <> 0 then
      sSql := sSql + '      AND OI.IDTIPOOPERACAO    = ' + IntToStr(iIdTipoOperacao)+#13;

   sSql := sSql + '      AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO    '+#13+
                  '      AND OI.IDCARTEIRAGERENC  = CG.IDCARTEIRAGERENC  '+#13+
                  '      AND OI.IDTIPOINVEST      = TP.IDTIPOINVEST      '+#13+
                  '      AND OI.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO    '+#13+
                  '      AND OI.IDTIPOINVEST      = EC.IDTIPOINVEST(+)   '+#13+
                  '      AND OI.IDTIPOOPERACAO    = EC.IDTIPOOPERACAO(+) '+#13;

   sSql := sSql + '    ) '+#13;
   sSql := sSql + '    UNION '+#13;

   sSql := sSql + '    (SELECT HC.DATAHISTCAIXA, '+#13+
                  '     DECODE(TP.DESCTIPOOPERACAO, NULL, EC.DESCCAIXACOTA, TP.DESCTIPOOPERACAO) AS DESCTIPOOPERACAO, '+#13+
                  '     EC.DESCCAIXACOTA, CG.DESCCARTGERENC, '' '' AS DESCINVESTIMENTO, '+#13+
                  '     0 AS QTDEOPERACAO, 0 AS PRECOUNITOPERACAO, HC.VLRHISTCAIXA, HC.IDPLANPREVCTBPATR  '+#13+
                  '     FROM  HISTCAIXA HC, CARTEIRAGERENC CG, CARTEIRAXEVENTO CE, TIPOOPERACAO TP, EVENTOCAIXACOTA EC '+#13+
                  '     WHERE HC.DATAHISTCAIXA BETWEEN TO_DATE(' + QuotedStr(DateToStr(dDataIni)) + ', ' + QuotedStr('DD/MM/YYYY') + ') AND '+#13+
                  '                                    TO_DATE(' + QuotedStr(DateToStr(dDataFim)) + ', ' + QuotedStr('DD/MM/YYYY') + ') '+#13;
   if iIdPlanPrevCtbPatr > 0 then
      sSql := sSql + '      AND HC.IDPLANPREVCTBPATR = ' + IntToStr(iIdPlanPrevCtbPatr)+#13;
   if iIdCarteiraGerenc  > 0 then
      sSql := sSql + '      AND HC.IDCARTEIRAGERENC  = ' + IntToStr(iIdCarteiraGerenc)+#13;

   if iIdTipoOperacao   <> 0 then
      sSql := sSql + '      AND EC.IDTIPOOPERACAO    = ' + IntToStr(iIdTipoOperacao)+#13;
   sSql := sSql + '      AND HC.IDCARTEIRAGERENC  = CG.IDCARTEIRAGERENC  '+#13+
                  '      AND HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO '+#13+
                  '      AND CE.IDEVENTOCAIXACOTA = EC.IDEVENTOCAIXACOTA '+#13+
                  '      AND EC.IDTIPOINVEST      = TP.IDTIPOINVEST(+)   '+#13+
                  '      AND EC.IDTIPOOPERACAO    = TP.IDTIPOOPERACAO(+) '+#13+
                  '      AND HC.IDOPERACAOINVEST  NOT IN (SELECT IDOPERACAOINVEST '+#13+
                  '                                       FROM OPERACAOINVEST OI  '+#13+
                  '                                       WHERE OI.IDOPERACAOINVEST = HC.IDOPERACAOINVEST)'+#13;
   if iIdInvestimento < 0 then
   begin
      if iIdEventoCaixaCota <> 0 then
         sSql := sSql + '   AND EC.IDEVENTOCAIXACOTA = ' + IntToStr(iIdEventoCaixaCota)+#13;

      if iIdTipoOperacao    <> 0 then
         sSql := sSql + '   AND EC.IDTIPOOPERACAO    = ' + IntToStr(iIdTipoOperacao)+#13;

      if iIdTipoDespInvest  <> 0 then
         sSql := sSql + '   AND EC.IDTIPODESPINVEST  = ' + IntToStr(iIdTipoDespInvest)+#13;

      if sTipoCpmf = 'S' then        //CPMF
         sSql := sSql + '   AND EC.STACPMF   = ''S'''+#13;

      if sTipoEvento = 'X' then      //CAIXA
         sSql := sSql + '   AND EC.STACAIXA  = ''S'''+#13
      else if sTipoEvento = 'C' then //COTA
         sSql := sSql + '   AND EC.STACOTA   = ''S'''+#13;
   end;

   sSql := sSql + '    ) ) OP, VWPLANPREVCTBPATR PL '+#13;

   sSql := sSql + 'WHERE  '+#13;
   if iIdPlanPrevCtbPatr > 0 then
      sSql := sSql + '  OP.IDPLANPREVCTBPATR = ' + IntToStr(iIdPlanPrevCtbPatr)+' AND '+#13;

   sSql := sSql + '  PL.IDPLANPREVCTBPATR =  OP.IDPLANPREVCTBPATR '+#13+
                  ' ORDER BY PL.PLANPRVCONTABPATRO, OP.DATAHISTCAIXA, OP.DESCCARTGERENC, OP.DESCCAIXACOTA '+#13;
   //AL_1 - Fim

   Result := GetDataPacket(sSql);
end;

//AL_4
function TCtrlCarteiraGerenc.ListDifCarteiras(dData: TDateTime): Boolean;
var sSql: String;
    cdsTemp: TCMClientDataSet;
begin
   if ConnectionSide = cnsClient then
   begin
      if not Connection.AppServer.ListDifCarteiras(dData) then
      begin
         Result := False;
         MessageInfo := Connection.AppServer.MessageInfo;
      end;
   end
   else
   begin
      try // Finally
         try // Except
            cdsTemp := TCMClientDataSet.Create(nil);

            // Prepara SQL que busca as diferenças entre a carteira própria e suas carteiras gerenciais
            sSql := 'SELECT C.DESCCARTINVEST, I.DESCINVESTIMENTO, D.CARTEIRAPROPRIA, D.CARTEIRAGERENCIAL, D.DIF ' + #13 +
                    'FROM CARTEIRAINVEST C, INVESTIMENTO I, ' + #13 +
                    '     (SELECT SUM(NVL(CP.TOTAL,0)) AS CARTEIRAPROPRIA, SUM(NVL(CG.TOTAL,0)) AS CARTEIRAGERENCIAL, ' + #13 +
                    '             CP.IDCARTEIRAINVEST, CP.IDINVESTIMENTO, ' + #13 +
                    '             SUM(NVL(CP.TOTAL,0)) - SUM(NVL(CG.TOTAL,0)) AS DIF ' + #13 +
                    ' ' + #13 +
                    '      FROM (SELECT SUM(H.SALDOQTDEINVCART) AS TOTAL, H.IDCARTEIRAINVEST, H.IDINVESTIMENTO ' + #13 +
                    '            FROM HISTCARTINV H ' + #13 +
                    '            WHERE H.IDHISTCARTINV IN ' + #13 +
                    '                      (SELECT MAX(H2.IDHISTCARTINV) ' + #13 +
                    '                       FROM HISTCARTINV H2 ' + #13 +
                    '                       WHERE H2.DATAMOVCARTINV = TO_DATE(' + QuotedStr(DateToStr(dData)) + ', ' + QuotedStr('dd/mm/yyyy') + ')' + #13 +
                    '                         AND H2.IDCARTEIRAGERENC IS NULL ' + #13 +
                    '                       GROUP BY H2.IDPLANPREVCTBPATR, H2.IDCARTEIRAINVEST, H2.IDINVESTIMENTO) ' + #13 +
                    '            GROUP BY H.IDCARTEIRAINVEST, H.IDINVESTIMENTO) CP, ' + #13 +
                    ' ' + #13 +
                    '           (SELECT SUM(H.SALDOQTDEINVCART) AS TOTAL, H.IDCARTEIRAINVEST, H.IDINVESTIMENTO ' + #13 +
                    '            FROM HISTCARTINV H ' + #13 +
                    '            WHERE H.IDHISTCARTINV IN ' + #13 +
                    '                      (SELECT MAX(H2.IDHISTCARTINV) ' + #13 +
                    '                       FROM HISTCARTINV H2 ' + #13 +
                    '                       WHERE H2.DATAMOVCARTINV = TO_DATE(' + QuotedStr(DateToStr(dData)) + ', ' + QuotedStr('dd/mm/yyyy') + ')' + #13 +
                    '                         AND H2.IDCARTEIRAGERENC IS NOT NULL ' + #13 +
                    '                       GROUP BY H2.IDPLANPREVCTBPATR, H2.IDCARTEIRAINVEST, H2.IDCARTEIRAGERENC, H2.IDINVESTIMENTO) ' + #13 +
                    '            GROUP BY H.IDCARTEIRAINVEST, H.IDINVESTIMENTO) CG, ' + #13 +
                    ' ' + #13 +
                    '           (SELECT DISTINCT IDCARTEIRAINVEST FROM CARTEIRAGERENC) CA, CARTEIRAINVEST CI ' + #13 +
                    ' ' + #13 +
                    '      WHERE CP.IDCARTEIRAINVEST = CG.IDCARTEIRAINVEST(+) ' + #13 +
                    '        AND CP.IDINVESTIMENTO = CG.IDINVESTIMENTO(+) ' + #13 +
                    '        AND CP.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST ' + #13 +
                    '        AND CP.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST ' + #13 +
                    ' ' + #13 +
                    '      GROUP BY CP.IDCARTEIRAINVEST, CP.IDINVESTIMENTO ' + #13 +
                    ' ' + #13 +
                    '      HAVING SUM(NVL(CP.TOTAL,0)) - SUM(NVL(CG.TOTAL,0)) <> 0) D ' + #13 +
                    ' ' + #13 +
                    'WHERE D.IDCARTEIRAINVEST = C.IDCARTEIRAINVEST ' + #13 +
                    '  AND D.IDINVESTIMENTO = I.IDINVESTIMENTO ';
            // Executa o SQL
            cdsTemp.Data := GetDataPacket(sSql);
            // Se houverem diferenças
            if not cdsTemp.IsEmpty then
            begin
               // Limpa a variável para reaproveitamento
               sSql := '';
               // Monta Mensagem de erro com a descrição da carteira, do investimento, os saldos e a diferença
               while not cdsTemp.Eof do
               begin
                  sSql := sSql + 'Carteira Própria ' + cdsTemp.FieldByName('DESCCARTINVEST').AsString + #13 +
                                 'Investimento ' + cdsTemp.FieldByName('DESCINVESTIMENTO').AsString + #13 +
                                 'Saldo Carteira Própria: ' + FormatFloat('#,##0', cdsTemp.FieldByName('CARTEIRAPROPRIA').AsFloat) + #13 +
                                 'Saldo Carteiras Gerenciais: ' + FormatFloat('#,##0', cdsTemp.FieldByName('CARTEIRAGERENCIAL').AsFloat) + #13 +
                                 'Diferença: ' + FormatFloat('#,##0', cdsTemp.FieldByName('DIF').AsFloat) + ';' + #13 + #13;
                  cdsTemp.Next;
               end;
               // Gera o erro com a mensagem montada
               Raise Exception.Create( sSql );
            end
            else
               //Se não houverem diferenças, Resulta True
               Result := True;
         except
            on E : Exception do
            begin
              Result := False;
              MessageInfo := E.Message;
            end;
         end;
      finally
         FreeAndNil(cdsTemp);
      end;
   end;
end;

end.


