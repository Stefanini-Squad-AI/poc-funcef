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

      function ListMovOperVirtual(dDataIni, dDataFim : TDateTime;
                                  iIdEventoCaixaCota : Integer = -1;
                                  iIdTipoInvest      : Integer = -1;
                                  iIdTipoOperacao    : Integer = -1;
                                  iIdTipoDespInvest  : Integer = -1;
                                  iIdCarteiraGerenc  : Integer = -1;
                                  iIdInvestimento    : Integer = -1;
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

function TCtrlCarteiraGerenc.ListEvCaixaCota(iIdEventoCaixaCota, iIdTipoInvest, iIdTipoOperacao,
                                             iIdTipoDespInvest : Integer;
                                             sTipoCpmf, sTipoEvento: String): OleVariant;
var
   sSql : String;
   bPri : Boolean;
begin
   bPri := True;
   sSql := 'SELECT IDEVENTOCAIXACOTA, IDREGRA, IDTIPOINVEST, '+#13+
           '       IDTIPOOPERACAO, DESCCAIXACOTA, STACAIXA, STACOTA, '+#13+
           '       STAATIVOPASSIVO, STASOMADIMINUI, STACOTIZA, '+#13+
           '       IDTIPODESPINVEST, STACPMF '+#13+
           'FROM EVENTOCAIXACOTA '+#13;

   if iIdEventoCaixaCota > 0 then
   begin
      sSql := sSql + 'WHERE IDEVENTOCAIXACOTA = ' + IntToStr(iIdEventoCaixaCota)+#13;
      bPri := False;
   end;

   if iIdTipoInvest > -1 then
   begin
      if bPri then
      begin
         sSql := sSql + 'WHERE (IDTIPOINVEST = ' + IntToStr(iIdTipoInvest) + ')' + #13;
         bPri := False;
      end
      else
         sSql := sSql + '  AND (IDTIPOINVEST = ' + IntToStr(iIdTipoInvest) + ')' + #13;
   end;

   if iIdTipoOperacao > -1 then
   begin
      if bPri then
      begin
         sSql := sSql + '   AND IDTIPOOPERACAO    = ' + IntToStr(iIdTipoOperacao)+#13;
         bPri := False;
      end
      else
         sSql := sSql + '   AND IDTIPOOPERACAO    = ' + IntToStr(iIdTipoOperacao)+#13;
   end;

   if iIdTipoDespInvest > -1 then
   begin
      if bPri then
      begin
         sSql := sSql + '   AND IDTIPODESPINVEST  = ' + IntToStr(iIdTipoDespInvest)+#13;
         bPri := False;
      end
      else
         sSql := sSql + '   AND IDTIPODESPINVEST  = ' + IntToStr(iIdTipoDespInvest)+#13;
   end;

   if sTipoCpmf = 'S' then   //CPMF
   begin
      if bPri then
      begin
         sSql := sSql + '   AND STACPMF   = ''S'''+#13;
         bPri := False;
      end
      else
         sSql := sSql + '   AND STACPMF   = ''S'''+#13;
   end;

   if sTipoEvento = 'X' then //CAIXA
   begin
      if bPri then
      begin
         sSql := sSql + '   AND STACAIXA  = ''S'''+#13;
         bPri := False;
      end
      else
         sSql := sSql + '   AND STACAIXA  = ''S'''+#13;
   end;

   if sTipoEvento = 'C' then //COTA
   begin
      if bPri then
      begin
         sSql := sSql + '   AND STACOTA   = ''S'''+#13;
         bPri := False;
      end
      else
         sSql := sSql + '   AND STACOTA   = ''S'''+#13;
   end;

   sSql    := sSql + 'ORDER BY DESCCAIXACOTA ';
   
   Result  :=GetDataPacket(sSql);
end;

function TCtrlCarteiraGerenc.ListMovOperVirtual(dDataIni, dDataFim: TDateTime;
                                                iIdEventoCaixaCota, iIdTipoInvest,
                                                iIdTipoOperacao, iIdTipoDespInvest,
                                                iIdCarteiraGerenc, iIdInvestimento: Integer;
                                                sTipoCpmf, sTipoEvento: String): OleVariant;
var sSql: String;
begin
   sSql := 'SELECT HC.DATAHISTCAIXA, CG.DESCCARTGERENC, EC.DESCCAIXACOTA, '+#13+
           '       IV.DESCINVESTIMENTO, OI.QTDEOPERACAO, OI.PRECOUNITOPERACAO, HC.VLRHISTCAIXA '+#13+
           'FROM HISTCAIXA HC, OPERACAOINVEST OI, INVESTIMENTO IV, CARTEIRAGERENC CG, '+#13+
           '     CARTEIRAXEVENTO CE, EVENTOCAIXACOTA EC '+#13+
           'WHERE HC.DATAHISTCAIXA BETWEEN TO_DATE(' + QuotedStr(DateToStr(dDataIni)) + ', ' + QuotedStr('DD/MM/YYYY') + ') AND' + #13 +
           '                               TO_DATE(' + QuotedStr(DateToStr(dDataFim)) + ', ' + QuotedStr('DD/MM/YYYY') + ')' + #13;

   if iIdEventoCaixaCota > 0 then
      sSql := sSql + '   AND EC.IDEVENTOCAIXACOTA = ' + IntToStr(iIdEventoCaixaCota)+#13;

   if iIdTipoInvest > 0 then
   begin
      sSql := sSql + '   AND EC.IDTIPOINVEST      = ' + IntToStr(iIdTipoInvest)+#13;
      sSql := sSql + '   AND OI.IDTIPOINVEST      = ' + IntToStr(iIdTipoInvest)+#13;
   end;

   if iIdTipoOperacao > 0 then
      sSql := sSql + '   AND EC.IDTIPOOPERACAO    = ' + IntToStr(iIdTipoOperacao)+#13;

   if iIdTipoDespInvest > 0 then
      sSql := sSql + '   AND EC.IDTIPODESPINVEST  = ' + IntToStr(iIdTipoDespInvest)+#13;

   if iIdCarteiraGerenc > 0 then
      sSql := sSql + '   AND CE.IDCARTEIRAGERENC  = ' + IntToStr(iIdCarteiraGerenc)+#13;

   if iIdInvestimento > 0 then
      sSql := sSql + '   AND OI.IDINVESTIMENTO    = ' + IntToStr(iIdInvestimento)+#13;

   if sTipoCpmf = 'S' then        //CPMF
      sSql := sSql + '   AND EC.STACPMF   = ''S'''+#13;

   if sTipoEvento = 'X' then      //CAIXA
      sSql := sSql + '   AND EC.STACAIXA  = ''S'''+#13
   else if sTipoEvento = 'C' then //COTA
      sSql := sSql + '   AND EC.STACOTA   = ''S'''+#13;

   if iIdInvestimento > 0 then
      sSql := sSql + ' AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO    '+#13
   else
      sSql := sSql + ' AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO(+) '+#13;

   sSql := sSql + ' AND HC.IDOPERACAOINVEST  = OI.IDOPERACAOINVEST(+) '+#13;
   sSql := sSql + ' AND OI.IDINVESTIMENTO    = IV.IDINVESTIMENTO(+)   '+#13;
   sSql := sSql + ' AND HC.IDCARTEIRAGERENC  = CG.IDCARTEIRAGERENC    '+#13;
   sSql := sSql + ' AND HC.IDCARTEIRAXEVENTO = CE.IDCARTEIRAXEVENTO   '+#13;
   sSql := sSql + ' AND CE.IDEVENTOCAIXACOTA = EC.IDEVENTOCAIXACOTA   '+#13;
   sSql := sSql + 'ORDER BY HC.DATAHISTCAIXA, CG.DESCCARTGERENC, EC.DESCCAIXACOTA,IV.DESCINVESTIMENTO ';

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




