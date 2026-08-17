unit uCtrlRptContabilDiaria;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient, uCMClientDataSet;

type
   TCtrlRptContabilDiaria = Class(TCmControlObject)

   private

   public

      constructor Create; override;
      destructor Destroy; override;
      function GeraConatbilDiaria(dDataInicial,dDataFinal: TDateTime;
                                  rCodPortador,rIDPessoa: Double): OleVariant;
      procedure GeraSaldos(rIDPessoa, rCodPortador: Double; dDataInicial,dDataFinal: TDateTime;
                           var rSaldoAnterior, rSaldoAtual: Double);

   protected

      procedure DoChangeDataBase; override;


   end;




implementation
{ TCtrlRptContabilDiaria }




constructor TCtrlRptContabilDiaria.Create;
begin
   inherited;
end;



destructor TCtrlRptContabilDiaria.Destroy;
begin
   inherited;
end;



procedure TCtrlRptContabilDiaria.DoChangeDataBase;
begin
   inherited;
end;



function TCtrlRptContabilDiaria.GeraConatbilDiaria(dDataInicial,
  dDataFinal: TDateTime; rCodPortador,rIDPessoa: Double): OleVariant;
var
   sSql : String;
   ContabilDiaria    : TCMClientDataSet;
   ContabilDiariaAux : TCMClientDataSet;
begin
   ContabilDiaria:=TCMClientDataSet.Create(nil);
   ContabilDiariaAux:=TCMClientDataSet.Create(nil);
   try
      sSql:='SELECT DISTINCT '+
            '   M.CODLANCFINANC, '+
            '   M.DATALANCFINAN, '+
            '   M.HISTORICO, '+
            '   M.ENTRADASAIDA, '+
            '   DECODE(M.PLNCODIGO,NULL,L.PLNCODIGO,M.PLNCODIGO) AS CODPLANILHA, '+
            '   M.IDMODULO, '+
            '   C.PLACONTA, '+
            '   P.PLANOME, '+
            '   M.CODPORTADOR, '+
            '   SA.SALDOANT, '+
            '   SF.SALDOFINAL '+
            'FROM '+
            '   MOVIMFINANC M, '+
            '   PORTADORCONTA C, '+
            '   PLANOCONTA P, '+
            '   RECBTOPAGTO R, '+
            '   LANCTODOCUM L, '+
            '   (SELECT SUM(DECODE(ENTRADASAIDA,''E'',VALORLANCFINAN,-VALORLANCFINAN)) AS SALDOFINAL '+
            '    FROM MOVIMFINANC '+
            '    WHERE (DATALANCFINAN <= TO_DATE('''+
                 FormatDateTime('dd/mm/yyyy',dDataFinal)+''',''DD/MM/YYYY'')) ';

      if (rCodPortador<>0) then
         sSql:=sSql+'          AND (CODPORTADOR = '+FloatToStr(rCodPortador)+')) SF, '
      else
         sSql:=sSql+') SF, ';

      sSql:=sSql+'   (SELECT SUM(DECODE(ENTRADASAIDA,''E'',VALORLANCFINAN,-VALORLANCFINAN)) AS SALDOANT '+
                 '    FROM MOVIMFINANC '+
                 '    WHERE (DATALANCFINAN < TO_DATE('''+
                      FormatDateTime('dd/mm/yyyy',dDataInicial)+''',''DD/MM/YYYY'')) ';

      if (rCodPortador<>0) then
         sSql:=sSql+'          AND (CODPORTADOR = '+FloatToStr(rCodPortador)+')) SA '
      else
         sSql:=sSql+') SA ';

      if (rCodPortador<>0) then
         sSql:=sSql+'WHERE '+
                    '   (C.CODPORTADOR = '+FloatToStr(rCodPortador)+'))  '
      else
         sSql:=sSql+'WHERE ';

      sSql:=sSql+'   (M.DATALANCFINAN BETWEEN TO_DATE('''+
           FormatDateTime('dd/mm/yyyy',dDataInicial)+''',''DD/MM/YYYY'') AND '+
           '   TO_DATE('''+
           FormatDateTime('dd/mm/yyyy',dDataFinal)+''',''DD/MM/YYYY'')) AND '+
           '   (M.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
           '   (C.CODPORTADOR = M.CODPORTADOR) AND '+
           '   (P.PLACONTA = C.PLACONTA) AND '+
           '   (P.PLANO = C.PLANO) AND '+
           '   (R.CODLANCFINANC(+) = M.CODLANCFINANC) AND '+
           '   (R.NUMLANCTO = L.NUMLANCTO(+)) AND '+
           '   (R.CODDOCUMENTO = L.CODDOCUMENTO(+)) '+
           'ORDER BY '+
           '   M.ENTRADASAIDA, '+
           '   M.DATALANCFINAN, '+
           '   M.CODPORTADOR ';

      ContabilDiariaAux.Data:=GetDataPacket(sSql);
      ContabilDiaria.Data:=GetDataPacket('SELECT '+
                                         '   PLACONTA AS CONTAD, '+
                                         '   PLACONTA AS CONTAC, '+
                                         '   PLACONTA AS NOMECONTAD, '+
                                         '   PLACONTA AS NOMECONTAC, '+ 
                                         '   LACHIST1||'' ''||LACHIST2 AS HISTORICO, '+
                                         '   LACVALOR ,''ENTRADA'' AS ENTRADASAIDA, '+
                                         '   (TO_DATE(''01/01/1999'',''DD/MM/YYYY'')) AS DATALANC, '+
                                         '   (TO_DATE(''01/01/1999'',''DD/MM/YYYY'')) AS DATACONT, '+
                                         '   (0) AS PLNPLANIL '+
                                         'FROM '+
                                         '   LANCAMENTO '+
                                         'WHERE '+
                                         '   (1=2) /*+OPTIMIZER_MODE RULE*/ ');

      ContabilDiariaAux.First;
      while not(ContabilDiariaAux.Eof) do
      begin
         if not(ContabilDiariaAux.FieldByName('CODPLANILHA').isNull) then
          begin
             with TCMClientDataSet.Create(nil) do
             try
                Data:=GetDataPacket('SELECT '+
                                    '   L.PLACONTA,L.PLNCODIGO,P.PLNDATDIA, '+
                                    '   DECODE(L.CODSUBCONTA,NULL,C.PLANOME,S.NOMESUBCONTA) AS NOME, '+
                                    '   L.LACVALOR,P.PLNPLANIL,L.LACDEBCRE '+
                                    'FROM PLANILHA P,PLANOCONTA C,SUBCONTA S, LANCAMENTO L '+
                                    'WHERE (L.PLNCODIGO = '+
                                    FloatToStr(ContabilDiariaAux.FieldByName('CODPLANILHA').AsFloat)+
                                    ') AND '+
                                    '      (RTRIM(L.PLACONTA) <> RTRIM('+
                                    ContabilDiariaAux.FieldByName('PLACONTA').AsString+')) AND '+
                                    '      (P.PLNCODIGO = L.PLNCODIGO) AND '+
                                    '      (L.CODSUBCONTA = S.CODSUBCONTA(+)) AND '+
                                    '      (L.PLANO = C.PLANO) AND '+
                                    '      (L.PLACONTA = C.PLACONTA) ');
                First;
                while not(Eof) do
                begin
                   ContabilDiaria.Append;
                   if ((FieldByName('LACDEBCRE').AsString = 'D') and
                       (ContabilDiariaAux.FieldByName('ENTRADASAIDA').AsString = 'E')) or
                      ((FieldByName('LACDEBCRE').AsString = 'C') and
                       (ContabilDiariaAux.FieldByName('ENTRADASAIDA').AsString = 'S')) then
                      ContabilDiaria.FieldByName('LACVALOR').AsFloat:=
                                   - FieldByName('LACVALOR').AsFloat
                   else
                      ContabilDiaria.FieldByName('LACVALOR').AsFloat:=
                                     FieldByName('LACVALOR').AsFloat;

                   if (ContabilDiariaAux.FieldByName('ENTRADASAIDA').AsString = 'E') then
                    begin
                       ContabilDiaria.FieldByName('CONTAC').AsString:=
                                      FieldByName('PLACONTA').AsString;
                       ContabilDiaria.FieldByName('NOMECONTAC').AsString:=
                                      FieldByName('NOME').AsString;
                       ContabilDiaria.FieldByName('CONTAD').AsString:=
                                      ContabilDiariaAux.FieldByName('PLACONTA').AsString;
                       ContabilDiaria.FieldByName('NOMECONTAD').AsString:=
                                      ContabilDiariaAux.FieldByName('PLANOME').AsString;
                       ContabilDiaria.FieldByName('ENTRADASAIDA').AsString:='ENTRADAS';
                     end
                    else
                     begin
                        ContabilDiaria.FieldByName('CONTAD').AsString:=
                                       FieldByName('PLACONTA').AsString;
                        ContabilDiaria.FieldByName('NOMECONTAD').AsString:=
                                       FieldByName('NOME').AsString;
                        ContabilDiaria.FieldByName('CONTAC').AsString:=
                                       ContabilDiariaAux.FieldByName('PLACONTA').AsString;
                        ContabilDiaria.FieldByName('NOMECONTAC').AsString:=
                                       ContabilDiariaAux.FieldByName('PLANOME').AsString;
                        ContabilDiaria.FieldByName('ENTRADASAIDA').AsString :='SAIDAS';
                     end;

                    ContabilDiaria.FieldByName('HISTORICO').AsString:=
                                   ContabilDiariaAux.FieldByName('HISTORICO').AsString;
                    ContabilDiaria.FieldByName('PLNPLANIL').AsInteger:=
                                   FieldByName('PLNPLANIL').AsInteger;
                    ContabilDiaria.FieldByName('DATALANC').AsString:=
                                   ContabilDiariaAux.FieldByName('DATALANCFINAN').AsString;
                    ContabilDiaria.FieldByName('DATACONT').AsString:=
                                   FieldByName('PLNDATDIA').AsString;
                    ContabilDiaria.Post;

                   Next;
                end;
             finally
                Free;
             end;
          end;
         ContabilDiariaAux.Next;
      end;

      Result:=ContabilDiaria.Data;
   finally
      ContabilDiaria.Free;
      ContabilDiariaAux.Free;
   end;
end;



procedure TCtrlRptContabilDiaria.GeraSaldos(rIDPessoa, rCodPortador: Double;
  dDataInicial, dDataFinal: TDateTime; var rSaldoAnterior,
  rSaldoAtual: Double);
var
   sSql: String;
begin
   with TCMClientDataSet.Create(nil) do
   try
      sSql:='SELECT SUM(DECODE(M.ENTRADASAIDA,''E'',M.VALORLANCFINAN,-M.VALORLANCFINAN)) AS SALDO '+
            'FROM MOVIMFINANC M '+
            'WHERE (M.IDPESSOA = '+ FloatToStr(rIDPessoa)+')  AND '+
            '      (M.DATALANCFINAN < TO_DATE('''+
                    FormatDateTime('dd/mm/yyyy',dDataInicial)+''',''DD/MM/YYYY'')) ';

      if (rCodPortador<>0) then
         sSql:=sSql+'      AND (M.CODPORTADOR = '+FloatToStr(rCodPortador)+') ';

      Data:=GetDataPacket(sSql);
      rSaldoAnterior:=FieldByName('SALDO').AsFloat;

      Close;

      sSql:='SELECT SUM(DECODE(M.ENTRADASAIDA,''E'',M.VALORLANCFINAN,-M.VALORLANCFINAN)) AS SALDO '+
            'FROM MOVIMFINANC M '+
            'WHERE (M.IDPESSOA = '+ FloatToStr(rIDPessoa)+')  AND '+
            '      (M.DATALANCFINAN <= TO_DATE('''+
                    FormatDateTime('dd/mm/yyyy',dDataFinal)+''',''DD/MM/YYYY'')) ';

      if (rCodPortador<>0) then
         sSql:=sSql+'      AND (M.CODPORTADOR = '+FloatToStr(rCodPortador)+') ';

      Data:=GetDataPacket(sSql);
      rSaldoAtual:=FieldByName('SALDO').AsFloat;

   finally
      Free;
   end;
end;



end.
