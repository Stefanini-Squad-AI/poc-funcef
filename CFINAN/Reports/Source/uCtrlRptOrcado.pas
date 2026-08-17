unit uCtrlRptOrcado;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient, uCMClientDataSet,
     uFuncaoGeral;

type
   TFiltro = record
                rIDPessoa    : Double;
                rUnidNegoc   : Double;
                sCodCRespon  : String;
                sCodCCusto   : String;
                dDataInicial : TDateTime;
                dDataFinal   : TDateTime;
                sPrazo       : String;
                bCtasZeradas : Boolean;
                bAnalitico   : Boolean;
             end;

   TParamMasc = record
                   sMascaraCAR   : String;
                   sMascaraCAP   : String;
                   iNumMaxEleCAR : Integer;
                   iNumMaxEleCAP : Integer;                   
                end;

   TCtrlRptOrcado = Class(TCmControlObject)

   private

      function BuscaValorPrev(Filtro: TFiltro; sCodTipRecDes,sRecPag: String):Double;
      function BuscaValorReal(Filtro: TFiltro; sCodTipRecDes,sRecPag: String):Double;
      function BuscaValorOrc(Filtro: TFiltro; sCodTipRecDes,sRecPag: String):Double;


   public

      constructor Create; override;
      destructor Destroy; override;
      function DifPercentual(VlrMaior, VlrMenor: String): Extended;
      function GeraDadosOrcXPrev(Filtro: TFiltro; ParamMasc: TParamMasc): OleVariant;
      function GeraDadosOrcXReal(Filtro: TFiltro; ParamMasc: TParamMasc): OleVariant;
      function GeraDadosOrcXRealCR(Filtro: TFiltro; ParamMasc: TParamMasc): OleVariant;


   protected

      procedure DoChangeDataBase; override;


   end;



implementation
{ TCtrlRptOrcado }



constructor TCtrlRptOrcado.Create;
begin
   inherited;
end;



destructor TCtrlRptOrcado.Destroy;
begin
  inherited;
end;



procedure TCtrlRptOrcado.DoChangeDataBase;
begin
  inherited;
end;



function TCtrlRptOrcado.GeraDadosOrcXPrev(Filtro: TFiltro; ParamMasc: TParamMasc): OleVariant;
var
   sSql          : String;
   iNumEleTeste  : Integer;
   iGrau         : Integer;
   iGrauCAR      : Integer;
   iGrauCAP      : Integer;
   rSinal        : Double;
   rVlrPrev      : Double;
   rVlrOrc       : Double;   
begin
   iGrauCAR :=FuncaoGeral.CalcNumEleGrau(ParamMasc.sMascaraCAR,1);
   iGrauCAP :=FuncaoGeral.CalcNumEleGrau(ParamMasc.sMascaraCAP,1);
   with TCMClientDataSet.Create(nil) do
   try
      sSql:='SELECT '+
            '   DECODE(FLGINDICARECDES,''N'',''2. Outras Entradas - Outras Saídas'', '+
                                           '''1. Recebimentos - Pagamentos'') AS GR, '+
            '   DECODE(FLGINDICARECDES,''N'',DECODE(RECPAG, ''R'', ''2.1. Outras Entradas'', '+
                                                                 '''2.2. Outras Saídas''), '+
                                           'DECODE(RECPAG, ''R'', ''1.1. Recebimentos'', '+
                                                                 '''1.2. Pagamentos'')) AS RP, '+
            '   ANASINT, RECPAG, CODTIPRECDES, '+
            '   SUBSTR(''                               '',1,(LENGTH(RTRIM(CODTIPRECDES))*2))||DESCRICAO AS DESCRICAO, '+
            '   0 AS VALORPREV, 0 AS VALORORC, '+
            '   0 AS DIFERENCA,0 AS PERC, 0 AS VALORPREVSIN, 0 AS VALORORCSIN, 0 AS DIFERENCASIN, '+
            '   0 AS VALORPREVANA, 0 AS VALORORCANA, 0 AS DIFERENCAANA  '+
            'FROM '+
            '   TIPORECEBDESEMB '+
            'WHERE '+
            '  (IDPESSOA = '+FloatToStr(Filtro.rIDPessoa)+') '+
            'ORDER BY GR, RP, CODTIPRECDES ';
      Data:=GetDataPacket(sSql);

      First;
      while not(Eof) do
      begin

         if (FieldByName('RECPAG').AsString='R') then
          begin
             iNumEleTeste:=ParamMasc.iNumMaxEleCAR;
             rSinal:=1;
             iGrau:=iGrauCAR;
          end
         else
          begin
             iNumEleTeste:=ParamMasc.iNumMaxEleCAP;
             rSinal:=-1;
             iGrau :=iGrauCAP;
          end;

         if (Length(Trim(FieldByName('CODTIPRECDES').AsString))>iNumEleTeste) then
             Delete
         else
          begin
             rVlrPrev:=BuscaValorPrev(Filtro,FieldByName('CODTIPRECDES').AsString,
                                             FieldByName('RECPAG').AsString);
             rVlrOrc:=BuscaValorOrc(Filtro,FieldByName('CODTIPRECDES').AsString,
                                           FieldByName('RECPAG').AsString);

             if (Filtro.bCtasZeradas) or (rVlrPrev<>0) or (rVlrOrc<>0) then
              begin
                 Edit;
                 FieldByName('VALORPREV').AsFloat:=rVlrPrev;
                 FieldByName('VALORORC').AsFloat:=rVlrOrc;
                 FieldByName('DIFERENCA').AsFloat:=rVlrOrc-rVlrPrev;

                 if (FieldByName('VALORORC').AsFloat<>0) then
                     FieldByName('PERC').AsFloat:=(((rVlrOrc-rVlrPrev)/rVlrOrc)*100);

                 if (Length(Trim(FieldByName('CODTIPRECDES').AsString))=iGrau) then
                  begin
                     FieldByName('VALORPREVSIN').AsFloat:=rVlrPrev*rSinal;
                     FieldByName('VALORORCSIN').AsFloat:=rVlrOrc*rSinal;
                     FieldByName('DIFERENCASIN').AsFloat:=FieldByName('VALORORCSIN').AsFloat-
                                                          FieldByName('VALORPREVSIN').AsFloat;
                     FieldByName('VALORPREVANA').AsFloat:=rVlrPrev;
                     FieldByName('VALORORCANA').AsFloat:=rVlrOrc;
                     FieldByName('DIFERENCAANA').AsFloat:=rVlrOrc-rVlrPrev;;
                  end;
                 Post;
              end;
          end;
         Next;
      end;
      Result:=Data;
   finally
      Free;
   end;
end;



function TCtrlRptOrcado.GeraDadosOrcXReal(Filtro: TFiltro; ParamMasc: TParamMasc): OleVariant;
var
   sSql          : String;
   iNumEleTeste  : Integer;
   iGrau         : Integer;
   iGrauCAR      : Integer;
   iGrauCAP      : Integer;
   rSinal        : Double;
   rVlrReal      : Double;
   rVlrOrc       : Double;
begin
   iGrauCAR :=FuncaoGeral.CalcNumEleGrau(ParamMasc.sMascaraCAR,1);
   iGrauCAP :=FuncaoGeral.CalcNumEleGrau(ParamMasc.sMascaraCAP,1);
   with TCMClientDataSet.Create(nil) do
   try
      sSql:='SELECT '+
            '   DECODE(FLGINDICARECDES,''N'',''2. Outras Entradas - Outras Saídas'','+
                                            '''1. Recebimentos - Pagamentos'') AS GR, '+
            '   DECODE(FLGINDICARECDES,''N'',DECODE(RECPAG, ''R'', ''2.1. Outras Entradas'', '+
                                                                  '''2.2. Outras Saídas''), '+
                                            'DECODE(RECPAG, ''R'', ''1.1. Recebimentos'', '+
                                                                  '''1.2. Pagamentos'')) AS RP, '+
            '   ANASINT, RECPAG, CODTIPRECDES, DESCRICAO, 0 AS VALORREA, 0 AS VALORORC, '+
            '   0 AS DIFERENCA,0 AS PERC, 0 AS VALORREASIN, 0 AS VALORORCSIN, 0 AS DIFERENCASIN,'+
            '   0 AS VALORREAANA, 0 AS VALORORCANA, 0 AS DIFERENCAANA '+
            'FROM '+
            '   TIPORECEBDESEMB '+
            'WHERE '+
            '   (IDPESSOA = '+FloatToStr(Filtro.rIDPessoa)+') '+
            'ORDER BY GR, RP, CODTIPRECDES ';

      Data:=GetDataPacket(sSql);

      First;
      while not(Eof) do
      begin

         if (FieldByName('RECPAG').AsString='R') then
          begin
             iNumEleTeste:=ParamMasc.iNumMaxEleCAR;
             rSinal:=1;
             iGrau:=iGrauCAR;
          end
         else
          begin
             iNumEleTeste:=ParamMasc.iNumMaxEleCAP;
             rSinal:=-1;
             iGrau :=iGrauCAP;
          end;

         if (Length(Trim(FieldByName('CODTIPRECDES').AsString))>iNumEleTeste) then
             Delete
         else
          begin
             rVlrReal:=BuscaValorReal(Filtro,FieldByName('CODTIPRECDES').AsString,
                                             FieldByName('RECPAG').AsString);
             rVlrOrc:=BuscaValorOrc(Filtro,FieldByName('CODTIPRECDES').AsString,
                                           FieldByName('RECPAG').AsString);

             if (Filtro.bCtasZeradas) or (rVlrReal<>0) or (rVlrOrc<>0) then
              begin
                 Edit;
                 FieldByName('VALORREA').AsFloat:=rVlrReal;
                 FieldByName('VALORORC').AsFloat:=rVlrOrc;
                 FieldByName('DIFERENCA').AsFloat:=rVlrOrc-rVlrOrc;

                 if (FieldByName('VALORORC').AsFloat<>0) then
                     FieldByName('PERC').AsFloat:=(((rVlrOrc-rVlrReal)/rVlrOrc)*100);

                 if (Length(Trim(FieldByName('CODTIPRECDES').AsString))=iGrau) then
                  begin
                     FieldByName('VALORREASIN').AsFloat:=rVlrReal*rSinal;
                     FieldByName('VALORORCSIN').AsFloat:=rVlrOrc*rSinal;
                     FieldByName('DIFERENCASIN').AsFloat:=FieldByName('VALORORCSIN').AsFloat-
                                                          FieldByName('VALORREASIN').AsFloat;
                     FieldByName('VALORREAANA').AsFloat:=rVlrReal;
                     FieldByName('VALORORCANA').AsFloat:=rVlrOrc;
                     FieldByName('DIFERENCAANA').AsFloat:=rVlrOrc-rVlrOrc;
                  end;
                 Post;
              end;
          end;
         Next;
      end;
      Result:=Data;
   finally
      Free;
   end;
end;



function TCtrlRptOrcado.GeraDadosOrcXRealCR(Filtro: TFiltro;
  ParamMasc: TParamMasc): OleVariant;
var
   sSql          : String;
   iNumEleTeste  : Integer;
   iGrau         : Integer;
   iGrauCAR      : Integer;
   iGrauCAP      : Integer;
   rSinal        : Double;
   rVlrReal      : Double;
   rVlrOrc       : Double;
begin
   iGrauCAR :=FuncaoGeral.CalcNumEleGrau(ParamMasc.sMascaraCAR,1);
   iGrauCAP :=FuncaoGeral.CalcNumEleGrau(ParamMasc.sMascaraCAP,1);
   with TCMClientDataSet.Create(nil) do
   try
      sSql:='SELECT '+
            '   C.CODEXTERNO AS CODCENTRORESPON, C.NOME,  '+
            '   DECODE(T.FLGINDICARECDES,''N'',''2. Outras Entradas - Outras Saídas'','+
                                              '''1. Recebimentos - Pagamentos'') AS GR, '+
            '   DECODE(T.FLGINDICARECDES,''N'',DECODE(T.RECPAG, ''R'', ''2.1. Outras Entradas'', '+
                                                                      '''2.2. Outras Saídas''),'+
                                              'DECODE(T.RECPAG, ''R'', ''1.1. Recebimentos'', '+
                                                                      '''1.2. Pagamentos'')) AS RP, '+
            '   T.ANASINT, T.RECPAG, T.CODTIPRECDES, T.DESCRICAO, 0 AS VALORREA, 0 AS VALORORC, '+
            '   0 AS DIFERENCA,0 AS PERC, 0 AS VALORREASIN, 0 AS VALORORCSIN, 0 AS DIFERENCASIN,'+
            '   0 AS VALORREAANA, 0 AS VALORORCANA, 0 AS DIFERENCAANA '+
            'FROM '+
            '   TIPORECEBDESEMB T, CENTRESPON C '+
            'WHERE '+
            '   (T.IDPESSOA = '+FloatToStr(Filtro.rIDPessoa)+') AND '+
            '   (C.IDPESSOA = '+FloatToStr(Filtro.rIDPessoa)+') ';

      if Filtro.bAnalitico then
         sSql:=sSql+'    AND (C.ANALITICOSINTET = ''A'') ';

      if (Trim(Filtro.sCodCRespon)<>'') then
         sSql:=sSql+'    AND (RTRIM(C.CODCENTRORESPON) = '+Trim(Filtro.sCodCRespon)+' ) ';

      sSql:=sSql+'ORDER BY C.CODCENTRORESPON, GR, RP, T.CODTIPRECDES ';

      Data:=GetDataPacket(sSql);

      First;
      while not(Eof) do
      begin

         if (FieldByName('RECPAG').AsString='R') then
          begin
             iNumEleTeste:=ParamMasc.iNumMaxEleCAR;
             rSinal:=1;
             iGrau:=iGrauCAR;
          end
         else
          begin
             iNumEleTeste:=ParamMasc.iNumMaxEleCAP;
             rSinal:=-1;
             iGrau :=iGrauCAP;
          end;

         if (Length(Trim(FieldByName('CODTIPRECDES').AsString))>iNumEleTeste) then
             Delete
         else
          begin
             rVlrReal:=BuscaValorReal(Filtro,FieldByName('CODTIPRECDES').AsString,
                                             FieldByName('RECPAG').AsString);
             rVlrOrc:=BuscaValorOrc(Filtro,FieldByName('CODTIPRECDES').AsString,
                                           FieldByName('RECPAG').AsString);

             if (Filtro.bCtasZeradas) or (rVlrReal<>0) or (rVlrOrc<>0) then
              begin
                 Edit;
                 FieldByName('VALORREA').AsFloat:=rVlrReal;
                 FieldByName('VALORORC').AsFloat:=rVlrOrc;
                 FieldByName('DIFERENCA').AsFloat:=rVlrOrc-rVlrOrc;

                 if (FieldByName('VALORORC').AsFloat<>0) then
                     FieldByName('PERC').AsFloat:=(((rVlrOrc-rVlrReal)/rVlrOrc)*100);

                 if (Length(Trim(FieldByName('CODTIPRECDES').AsString))=iGrau) then
                  begin
                     FieldByName('VALORREASIN').AsFloat:=rVlrReal*rSinal;
                     FieldByName('VALORORCSIN').AsFloat:=rVlrOrc*rSinal;
                     FieldByName('DIFERENCASIN').AsFloat:=FieldByName('VALORORCSIN').AsFloat-
                                                          FieldByName('VALORREASIN').AsFloat;
                     FieldByName('VALORREAANA').AsFloat:=rVlrReal;
                     FieldByName('VALORORCANA').AsFloat:=rVlrOrc;
                     FieldByName('DIFERENCAANA').AsFloat:=rVlrOrc-rVlrOrc;
                  end;
                 Post;
              end;
          end;
         Next;
      end;
      Result:=Data;
   finally
      Free;
   end;
end;



function TCtrlRptOrcado.BuscaValorPrev(Filtro: TFiltro; sCodTipRecDes,sRecPag: String): Double;
var
   sSql : String;
begin
   with TCMClientDataSet.Create(nil) do
   try
      sSql:='SELECT '+
            '   SUM(DECODE(VALOR,NULL,0,VALOR)) AS VALORPREV '+
            'FROM '+
            '   FLUXOPREVISTO '+
            'WHERE '+
            '   (IDPESSOA = '+FloatToStr(Filtro.rIDPessoa)+') AND '+
            '   (DATAPROGRAMADA >= TO_DATE('''+
            FormatDateTime('dd/mm/yyyy',Filtro.dDataInicial)+''',''DD/MM/YYYY'')) AND '+
            '   (DATAPROGRAMADA <= TO_DATE('''+
            FormatDateTime('dd/mm/yyyy',Filtro.dDataFinal)+''',''DD/MM/YYYY'')) AND '+
            '   (RTRIM(CODTIPRECDES) LIKE '''+Trim(sCodTipRecDes)+'%'') AND '+
            '   (RECPAG = '''+sRecPag+''') ';

      if (Trim(Filtro.sCodCRespon)<>'') then
         sSql:=sSql+'   AND (RTRIM(CODCENTRORESPON) LIKE '''+
                     Trim(Filtro.sCodCRespon)+'%'' )  ';

      if (Trim(Filtro.sCodCCusto)<>'') then
         sSql:=sSql+'   AND (RTRIM(CODCENTROCUSTO) LIKE '''+
               Trim(Filtro.sCodCCusto)+'%'' )';

      if (Filtro.rUnidNegoc<>0) then
         sSql:=sSql+'   AND (UNIDNEGOC = '+FloatToStr(Filtro.rUnidNegoc)+') ';

      Data:=GetDataPacket(sSql);
      Result:=FieldByName('VALORPREV').AsFloat;
   finally
      Free;
   end;
end;



function TCtrlRptOrcado.BuscaValorReal(Filtro: TFiltro; sCodTipRecDes,sRecPag: String): Double;
var
   sSql : String;
begin
   with TCMClientDataSet.Create(nil) do
   try
      sSql:='SELECT '+
            '  SUM(DECODE(FR.VALOR,NULL,0,FR.VALOR)) AS VALORREA '+
            'FROM '+
            '   FLUXOREAL FR '+
            'WHERE '+
            '   (FR.IDPESSOA = '+FloatToStr(Filtro.rIDPessoa) +') AND '+
            '   (FR.DATACFLOAT >= TO_DATE('''+
            FormatDateTime('dd/mm/yyyy',Filtro.dDataInicial)+''',''DD/MM/YYYY'')) AND '+
            '   (FR.DATACFLOAT <= TO_DATE('''+
            FormatDateTime('dd/mm/yyyy',Filtro.dDataFinal)+''',''DD/MM/YYYY'')) AND '+
            '   (RTRIM(FR.CODTIPRECDES) LIKE '''+
            Trim(sCodTipRecDes)+'%'') AND '+
            '   (FR.RECPAG = '''+Trim(sRecPag)+''' ) ';

      if (Trim(Filtro.sCodCRespon)<>'') then
         sSql:=sSql+'   AND (RTRIM(FR.CODCENTRORESPON) LIKE '''+
                     Trim(Filtro.sCodCRespon)+'%'' )  ';

      if (Trim(Filtro.sCodCCusto)<>'') then
         sSql:=sSql+'   AND (RTRIM(FR.CODCENTROCUSTO) LIKE '''+
               Trim(Filtro.sCodCCusto)+'%'' )';

      if (Filtro.rUnidNegoc<>0) then
         sSql:=sSql+'   AND (FR.UNIDNEGOC = '+FloatToStr(Filtro.rUnidNegoc)+') ';

      Data:=GetDataPacket(sSql);
      Result:=FieldByName('VALORREA').AsFloat;
   finally
      Free;
   end;
end;



function TCtrlRptOrcado.BuscaValorOrc(Filtro: TFiltro; sCodTipRecDes,sRecPag: String): Double;
var
   sSql : String;
begin
   with TCMClientDataSet.Create(nil) do
   try
      sSql:='SELECT '+
            '   SUM(DECODE(FO.VALOR,NULL,0,FO.VALOR)) AS VALORORC '+
            'FROM '+
            '   FLUXOORCADO FO '+
            'WHERE '+
            '   (FO.IDPESSOA = '+FloatToStr(Filtro.rIDPessoa)+') AND '+
            '   (FO.DATAPROGRAMADA >= TO_DATE('''+
            FormatDateTime('dd/mm/yyyy',Filtro.dDataInicial)+''',''DD/MM/YYYY'')) AND '+
            '   (FO.DATAPROGRAMADA <= TO_DATE('''+
            FormatDateTime('dd/mm/yyyy',Filtro.dDataFinal)+''',''DD/MM/YYYY'')) AND '+
            '   (RTRIM(FO.CODTIPRECDES) LIKE '''+Trim(sCodTipRecDes)+'%'') AND '+
            '   (FO.RECPAG = '''+sRecPag+''') AND '+
            '   (FO.PRAZO  = '''+Filtro.sPrazo+''') ';

      if (Trim(Filtro.sCodCRespon)<>'') then
         sSql:=sSql+'   AND (RTRIM(FO.CODCENTRORESPON) LIKE '''+
                     Trim(Filtro.sCodCRespon)+'%'' )  ';

      if (Trim(Filtro.sCodCCusto)<>'') then
         sSql:=sSql+'   AND (RTRIM(FO.CODCENTROCUSTO) LIKE '''+
               Trim(Filtro.sCodCCusto)+'%'' )';

      if (Filtro.rUnidNegoc<>0) then
         sSql:=sSql+'   AND (FO.UNIDNEGOC = '+FloatToStr(Filtro.rUnidNegoc)+') ';

      Data:=GetDataPacket(sSql);
      Result:=FieldByName('VALORORC').AsFloat;
   finally
      Free;
   end;
end;



function TCtrlRptOrcado.DifPercentual(VlrMaior,VlrMenor: String): Extended;
var rVlrMenor,rVlrMaior : Extended;
begin
   rVlrMenor:=0;
   rVlrMaior:=0;
   Result:=0;
   if Trim(VlrMenor)<>'' then rVlrMenor:=StrToFloat(VlrMenor);
   if Trim(VlrMaior)<>'' then rVlrMaior:=StrToFloat(VlrMaior);
   if rVlrMaior<>0 then Result:=(((rVlrMaior - rVlrMenor)/rVlrMaior)*100);
end;



end.
