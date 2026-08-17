//******************************************************************************
// Autor     : Ricardo Cristiano
// Data      : 08/02/2006
// Código    : AL_1
// Pendencia :
// SOL       : 35066
// Motivo    : Ajuste na movimentação das operações virtuais, essa passam a ser
//             consultada independentes da atualização da carteira gerencial
//******************************************************************************

unit uCtrlCarteiraGerenc;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

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

      //AL_1 - Ricardo - 08/02/2006
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

   protected
      procedure DoChangeDataBase; override;
   end;

implementation

{TCtrlInvestimento}

constructor TCtrlCarteiraGerenc.Create;
begin
   inherited;
//  DbInvestimento   := TDbInvestimento.Create(Self);
end;

destructor TCtrlCarteiraGerenc.Destroy;
begin
//   FreeAndNil(FDbInvestimento);
//   if IsAppServer then
//      FreeAndNil(FCdsInvestimento);

   inherited;
end;

procedure TCtrlCarteiraGerenc.OnCreateAppServer;
begin
   inherited;
//   FCdsInvestimento   := TClientDataSet.Create(nil);
end;

procedure TCtrlCarteiraGerenc.DoChangeDataBase;
begin
   inherited;
//   FDbInvestimento.DataBaseName   := DataBaseName;
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
   //AL_1 - Ricardo - 08/02/2006    
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
   //AL_1 - Ricardo - 08/02/2006
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
   if iIdInvestimento    > 0 then
      sSql := sSql + '      AND HC.IDINVESTIMENTO    = ' + IntToStr(iIdInvestimento)+#13;
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

end.

{SELECT HC.DATAHISTCAIXA, CG.DESCCARTGERENC, EC.DESCCAIXACOTA, IV.DESCINVESTIMENTO, HC.VLRHISTCAIXA
FROM HISTCAIXA HC, OPERACAOINVEST OI, INVESTIMENTO IV, CARTEIRAGERENC CG, CARTEIRAXEVENTO CE,
     EVENTOCAIXACOTA EC
WHERE
     HC.DATAHISTCAIXA BETWEEN TO_DATE('01/10/2005','DD/MM/YYYY') AND TO_DATE('31/10/2005','DD/MM/YYYY')
 AND HC.IDOPERACAOINVEST  = OI.IDOPERACAOINVEST(+)
 AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO(+)
 AND HC.IDCARTEIRAGERENC  = CG.IDCARTEIRAGERENC
 AND HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO
 AND CE.IDEVENTOCAIXACOTA = EC.IDEVENTOCAIXACOTA
ORDER BY HC.DATAHISTCAIXA, HC.IDCARTEIRAGERENC, HC.IDHISTCAIXA
}




