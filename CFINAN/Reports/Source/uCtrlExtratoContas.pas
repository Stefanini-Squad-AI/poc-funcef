{-------------------------------------------------------------------------------
------------------------------ HISTÓRICO DE ALTERAÇÕES -------------------------
--------------------------------------------------------------------------------
 Atender......: WO7872
 Data.........: 14/02/2024
 Responsável..: Luis Ferrari
 Descrição....: Saldo de contas vindo para proxima conta, ajustado a variavel rSaldoTot
--------------------------------------------------------------------------------
}
unit uCtrlExtratoContas;

interface

uses sysutils, uCmControlObject, uCmDbObject, uSistema, DB, uDataBase, DbClient,
     uCMClientDataSet, Wwquery, dBaseDados; 

type
   TFiltro = record
                rIDPessoa    : Double;
                rIDModulo    : Double;
                rCodPortador : Double;
                iStatus      : Integer;
                iTipoEmissao : Integer;
                iOrdenacao   : Integer;
                bCtasComMov  : Boolean;
                dDataInicial : TDateTime;
                dDataFinal   : TDateTime;
                bOutraMoeda  : Boolean;
             end;


   TCtrlExtratoContas = Class(TCmControlObject)

   private

    FRemoveContasAbertas: boolean;

    procedure SetRemoveContasAbertas(const Value: boolean);


   public

      constructor Create; override;
      destructor Destroy; override;
      function GeraDadosExtratoContas(Filtro: TFiltro): OleVariant;
      function ListaSaldoGeral(iIdEmpresa, iConta: Double; iStatus:
                               Integer; sDataRef: String) : OleVariant;
      function ListaSaldoXPatrocinadora(iIdEmpresa, iConta: Double; iStatus:
                               Integer; sDataRef: String) : OleVariant;

      function ListaSaldoXPlano(iIdEmpresa, iConta: Double; iStatus:
                               Integer; sDataRef: String) : OleVariant;
      function ListaSaldoXPlanoEPatrocinadora(iIdEmpresa, iConta: Double; iStatus:
                               Integer; sDataRef: String) : OleVariant;

      function ListaFluxoRealAnalCAPCAR(dDataIni,dDataFim: TDateTime; iIdPessoa: integer): OleVariant;
      function ListaLogo(iIdPessoa: integer): OleVariant;

      property RemoveContasAbertas : boolean read FRemoveContasAbertas write SetRemoveContasAbertas;


   protected

      procedure DoChangeDataBase; override;


   end;



implementation
{ TCtrlExtratoContas }



constructor TCtrlExtratoContas.Create;
begin
   inherited;
end;



destructor TCtrlExtratoContas.Destroy;
begin
   inherited;
end;



procedure TCtrlExtratoContas.DoChangeDataBase;
begin
   inherited;
end;



function TCtrlExtratoContas.GeraDadosExtratoContas(Filtro: TFiltro): OleVariant;
var
   sSql        : String;
   rSaldo      : Double;
   rSaldoTot   : Double;
   cdsSaldos   : TCMClientDataSet;
   cdsExtratos : TCMClientDataSet;
   cdsContas   : TCMClientDataSet;
   cdsGerado   : TCMClientDataSet;
   //Bloqueios Judiciais
   qryAux        : TwwQuery;
   cdsBloqCheque : TCMClientDataSet;
   cdsBloqJud    : TCMClientDataSet;
   cdsBloqOutros : TCMClientDataSet;
begin

   cdsSaldos:=TCMClientDataSet.Create(nil);
   cdsExtratos:=TCMClientDataSet.Create(nil);
   cdsContas:=TCMClientDataSet.Create(nil);
   cdsGerado:=TCMClientDataSet.Create(nil);
   //Bloqueios Judiciais
   qryAux        := TwwQuery.create(nil);
   qryAux.DatabaseName := 'BaseDados';
   cdsBloqCheque := TCMClientDataSet.Create(nil);
   cdsBloqJud    := TCMClientDataSet.Create(nil);
   cdsBloqOutros := TCMClientDataSet.Create(nil);
   try
      cdsSaldos.Filtered:=True;
      cdsExtratos.Filtered:=True;
      //Bloqueios Judiciais
      cdsBloqCheque.Filtered:=True;
      cdsBloqJud.Filtered:=True;
      cdsBloqOutros.Filtered:=True;

      //-------------------------
      // cdsExtratos
      //-------------------------

      sSql:='SELECT '+
            '   M.CODPORTADOR AS CODIGO, '+
            '   M.CODLANCFINANC AS CODFINANC, '+
            '   M.NUMCHQBORDERO AS BORDERO, ';

      case Filtro.iTipoEmissao of
         0: sSql:=sSql+' M.DATALANCFINAN AS DATA, ';
         1: sSql:=sSql+' M.DATACONCILIACAO AS DATA, ';
      end;

      sSql:=sSql+'   M.ENTRADASAIDA, ' +
                 '   M.HISTORICO, '+
                 '   M.STATUSCONCILIA AS STATUS, '+
                 '   C.DESCRICAO, ';

      if not(Filtro.bOutraMoeda) then
         sSql:=sSql+'   DECODE(M.ENTRADASAIDA,''S'',-M.VALORLANCFINAN,M.VALORLANCFINAN) AS VALOR, '+
                    '   DECODE(M.ENTRADASAIDA,''S'',0,M.VALORLANCFINAN) AS VALORENTRADA, '+
                    '   DECODE(M.ENTRADASAIDA,''S'',M.VALORLANCFINAN,0) AS VALORSAIDA, '
      else
         sSql:=sSql+'   DECODE(M.ENTRADASAIDA,''S'',-M.VALOROUTRAMOEDA,M.VALOROUTRAMOEDA) AS VALOR, '+
                    '   DECODE(M.ENTRADASAIDA,''S'',0,M.VALOROUTRAMOEDA) AS VALORENTRADA, '+
                    '   DECODE(M.ENTRADASAIDA,''S'',M.VALOROUTRAMOEDA,0) AS VALORSAIDA, ';

       sSql:=sSql+'   (0) AS SALDOANTERIOR, (0) AS SALDOREGISTRO ' +
                  'FROM '+
                  '   MOVIMFINANC M, PORTADORCONTA C '+
                  'WHERE '+
                  '   ((C.FLGSTATUS = ''A'') OR (C.FLGSTATUS is null)) AND '+
                  '   (M.IDPESSOA = '+FloatToStr(Filtro.rIDPessoa)+') ';

      case Filtro.iTipoEmissao of
         0: sSql:=sSql+'   AND (M.DATALANCFINAN >= TO_DATE('''+
                       FormatDateTime('dd/mm/yyyy',Filtro.dDataInicial)+''',''DD/MM/YYYY'')) AND '+
                       ' (M.DATALANCFINAN <= TO_DATE('''+
                       FormatDateTime('dd/mm/yyyy',Filtro.dDataFinal)+''',''DD/MM/YYYY'')) ';
         1: sSql:=sSql+'   AND (M.STATUSCONCILIA <> ''J'') AND '+
                       '   (M.DATACONCILIACAO >= TO_DATE('''+
                       FormatDateTime('dd/mm/yyyy',Filtro.dDataInicial)+''',''DD/MM/YYYY'')) AND '+
                       '   (M.DATACONCILIACAO <= TO_DATE('''+
                       FormatDateTime('dd/mm/yyyy',Filtro.dDataFinal)+''',''DD/MM/YYYY'')) ';
      end;

      if (Filtro.rCodPortador<>0) then
          sSql:=sSql+'   AND (M.CODPORTADOR = ' +FloatToStr(Filtro.rCodPortador)+') ';

      if (Filtro.rIDModulo<>0) then
          sSql:=sSql+'   AND (M.IDMODULO = ' +FloatToStr(Filtro.rIDModulo)+') ';

      case Filtro.iStatus of
         1: sSql:=sSql+'   AND (M.STATUSCONCILIA IN (''P'',''I'',''X'')) ';
         2: sSql:=sSql+'   AND (M.STATUSCONCILIA <> ''C'') ';
         3: sSql:=sSql+'   AND (M.STATUSCONCILIA = ''C'') ';
         4: sSql:=sSql+'   AND (M.STATUSCONCILIA IN (''N'',''C'')) ';
         5: sSql:=sSql+'   AND (M.STATUSCONCILIA = ''I'') ';
         6: sSql:=sSql+'   AND (M.STATUSCONCILIA <> ''J'') ';
         7: sSql:=sSql+'   AND (M.STATUSCONCILIA <> ''C'') AND (M.STATUSCONCILIA <> ''J'') ';
      end;

      sSql:=sSql+'   AND (C.CODPORTADOR = M.CODPORTADOR) '+
                 'ORDER BY M.CODPORTADOR, ';

      case Filtro.iTipoEmissao of
         0: sSql:=sSql+'   M.DATALANCFINAN, M.CODLANCFINANC ';
         1: sSql:=sSql+'   M.DATACONCILIACAO, M.CODLANCFINANC ';
      end;

      cdsExtratos.Data:=GetDataPacket(sSql);


      //-------------------------
      // cdsSaldos
      //-------------------------

      sSql:='SELECT  '+
            '   M.CODPORTADOR, ';

      if not(Filtro.bOutraMoeda) then
         sSql:=sSql+
           '   SUM(DECODE(M.ENTRADASAIDA,''S'',-M.VALORLANCFINAN,M.VALORLANCFINAN)) AS SALDOANTERIOR '
      else
         sSql:=sSql+
           '   SUM(DECODE(M.ENTRADASAIDA,''S'',-M.VALOROUTRAMOEDA,M.VALOROUTRAMOEDA)) AS SALDOANTERIOR ';

      sSql:=sSql+'FROM MOVIMFINANC M ' +
                 'WHERE '+
                 '   (M.IDPESSOA = '+FloatToStr(Filtro.rIDPessoa)+') AND ';

      case Filtro.iTipoEmissao of
         0: sSql:=sSql+'   (M.DATALANCFINAN < TO_DATE('''+
                       FormatDateTime('dd/mm/yyyy',Filtro.dDataInicial)+''',''DD/MM/YYYY'')) ';
         1: sSql:=sSql+'   (M.STATUSCONCILIA <> ''J'') AND (M.DATACONCILIACAO < TO_DATE('''+
                       FormatDateTime('dd/mm/yyyy',Filtro.dDataInicial)+''',''DD/MM/YYYY'')) ';
      end;

      if (Filtro.rCodPortador<>0) then
         sSql:=sSql+' AND (M.CODPORTADOR = '+FloatToStr(Filtro.rCodPortador)+') ';

      case Filtro.iStatus of
         1: sSql:=sSql+'   AND (M.STATUSCONCILIA IN (''P'',''I'',''X'')) ';
         2: sSql:=sSql+'   AND (M.STATUSCONCILIA <> ''C'') ';
         3: sSql:=sSql+'   AND (M.STATUSCONCILIA = ''C'') ';
         4: sSql:=sSql+'   AND (M.STATUSCONCILIA IN (''N'',''C'')) ';
         5: sSql:=sSql+'   AND (M.STATUSCONCILIA = ''I'') ';
         6: sSql:=sSql+'   AND (M.STATUSCONCILIA <> ''J'') ';
         7: sSql:=sSql+'   AND (M.STATUSCONCILIA <> ''C'') AND (M.STATUSCONCILIA <> ''J'') ';
      end;

      sSql:=sSql+' GROUP BY M.CODPORTADOR ORDER BY M.CODPORTADOR';

      cdsSaldos.Data:=GetDataPacket(sSql);

      //-------------------------
      // cdsContas
      //-------------------------

      sSql:='SELECT '+
            '   CODPORTADOR,DESCRICAO '+
            'FROM '+
            '   PORTADORCONTA '+
            'WHERE '+
            '   ((FLGSTATUS = ''A'') OR (FLGSTATUS is null)) AND '+
            '   (IDPESSOA = '+FloatToStr(Filtro.rIDPessoa)+') ';

      if (Filtro.rCodPortador<>0) then
          sSql:=sSql+'   AND (CODPORTADOR = '+FloatToStr(Filtro.rCodPortador)+') ';

      sSql:=sSql+'ORDER BY CODPORTADOR';

      cdsContas.Data:=GetDataPacket(sSql);

      //-------------------------
      // Bloqueios Judiciais - Esta rotina estava no TRptExtratoContas.CrmRptCMBeforePrint (RExtratoContas.pas)
      //-------------------------

      if not dtmBaseDados.dbBaseDados.Intransaction then
        dtmBaseDados.dbBaseDados.StartTransaction;

      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.add('UPDATE MOVIMFINANC SET SITBLOQUEIOLANC = -1 '); // Bloqueio temporario para atender necessidade do relatório
      qryAux.SQL.add(' WHERE DATALANCFINAN = ' + quotedstr(FormatDateTime('dd/mm/yyyy', Filtro.dDataFinal)));

      if Filtro.rCodPortador <> 0 then
       qryAux.SQL.add('      AND CODPORTADOR = ' + FloatToStr(Filtro.rCodPortador));
     
      qryAux.SQL.add('      AND SITBLOQUEIOLANC = 0 '); // Desbloqueado 1
      qryAux.SQL.add('      AND HISTPADFINAN IN (14, 19, 20)  '); // Cheques e SICOB D+1 e SIVAT

      if Not qryAux.Prepared then
        qryAux.Prepare;

      qryAux.ExecSQL;

      // cdsBloqJud
      // Selecionando os Bloqueios Judiciais Anteriores a data

      sSql := 'SELECT CODPORTADOR, ABS(NVL(SUM(DECODE(TIPOLANCTO, ''S'', -VALORLANCTO, VALORLANCTO)), 0)) AS VALORTOTBLOQJUD ' +
              '  FROM MOVFINBLOQJUDICIAIS ' +
              ' WHERE DATALANCTO <= ' + quotedstr(FormatDateTime('dd/mm/yyyy', Filtro.dDataFinal)) +
              '   AND SITBLOQDESBLOQ = 1 ' ; // Bloqueado

      if Filtro.rCodPortador <> 0 then
        sSql := sSql + '      AND CODPORTADOR = ' + FloatToStr(Filtro.rCodPortador);

      sSql := sSql + '   AND IDMOVFINBLOQJUDICIAIS NOT IN (SELECT IDMOVFINBLOQJUDICIAISPAI FROM MOVFINBLOQJUDICIAIS  ' +
                     '                                      WHERE DATALANCTO <= ' + quotedstr(FormatDateTime('dd/mm/yyyy', Filtro.dDataFinal));

      if Filtro.rCodPortador <> 0 then
        sSql := sSql + '                                              AND CODPORTADOR = ' + FloatToStr(Filtro.rCodPortador);

      sSql := sSql + '                                              AND SITBLOQDESBLOQ = 0 ) '+
                     ' GROUP BY CODPORTADOR ';

      cdsBloqJud.Data := GetDataPacket(sSql);

      // cdsBloqCheque
      // Selecionando os Cheques Bloqueados Anteriores a data

      sSql := 'SELECT CODPORTADOR, ABS(NVL(SUM(DECODE(ENTRADASAIDA, ''S'', -VALORLANCFINAN, VALORLANCFINAN)), 0)) AS VALORTOTBLOQCHQ ' +
              '  FROM MOVIMFINANC ' +
              ' WHERE DATALANCFINAN <= ' + quotedstr(FormatDateTime('dd/mm/yyyy', Filtro.dDataFinal)) +
              '   AND HISTPADFINAN = 14 ' + // Cheques
              '   AND SITBLOQUEIOLANC IN (-1, 1) '; // Bloqueado Temporário e Bloqueado Normal (pela conciliação)

      if Filtro.rCodPortador <> 0 then
       sSql := sSql + '      AND CODPORTADOR = ' + FloatToStr(Filtro.rCodPortador);

      sSql := sSql + ' GROUP BY CODPORTADOR ';

      cdsBloqCheque.Data := GetDataPacket(sSql);

      // cdsBloqOutros
      // Selecionando Outros documentos bloqueados Anteriores a data
      sSql := 'SELECT CODPORTADOR, ABS(NVL(SUM(DECODE(ENTRADASAIDA, ''S'', -VALORLANCFINAN, VALORLANCFINAN)), 0)) AS VALORTOTBLOQOUTROS ' +
              '  FROM MOVIMFINANC ' +
              ' WHERE DATALANCFINAN <= ' + quotedstr(FormatDateTime('dd/mm/yyyy', Filtro.dDataFinal)) +
              '   AND HISTPADFINAN IN (19, 20) ' + // SICOB D+1 e SIVAT
              '   AND SITBLOQUEIOLANC IN (-1, 1) ' ; // Bloqueado Temporário e Bloqueado Normal (pela conciliação)

      if Filtro.rCodPortador <> 0 then
        sSql := sSql + '      AND CODPORTADOR = ' + FloatToStr(Filtro.rCodPortador);

      sSql := sSql + ' GROUP BY CODPORTADOR ';

      cdsBloqOutros.Data := GetDataPacket(sSql);

      if dtmBaseDados.dbBaseDados.InTransaction then
        dtmBaseDados.dbBaseDados.Rollback;

      // Fim Bloqueios Judiciais


      with cdsGerado do
      begin
         rSaldoTot:=0;

         //-------------------------
         // cdsGerado
         //-------------------------

         sSql:='SELECT '+
               '   M.CODPORTADOR AS CODIGO, '+
               '   M.CODLANCFINANC AS CODFINANC, '+
               '   M.NUMCHQBORDERO AS BORDERO, '+
               '   M.DATALANCFINAN AS DATA, '+
               '   M.ENTRADASAIDA, '+
               '   M.HISTORICO, '+
               '   M.STATUSCONCILIA AS STATUS, '+
               '   C.DESCRICAO, ';

         if not(Filtro.bOutraMoeda) then
            sSql:=sSql+'   SUM(DECODE(M.ENTRADASAIDA,''S'',-M.VALORLANCFINAN, '+
                                                           'M.VALORLANCFINAN)) AS VALOR, '+
                       '   SUM(DECODE(M.ENTRADASAIDA,''S'',0,M.VALORLANCFINAN)) AS VALORENTRADA, '+
                       '   SUM(DECODE(M.ENTRADASAIDA,''S'',M.VALORLANCFINAN,0)) AS VALORSAIDA, '
         else
            sSql:=sSql+'   SUM(DECODE(M.ENTRADASAIDA,''S'',-M.VALOROUTRAMOEDA, '+
                                                           'M.VALOROUTRAMOEDA)) AS VALOR, '+
                       '   SUM(DECODE(M.ENTRADASAIDA,''S'',0,M.VALOROUTRAMOEDA)) AS VALORENTRADA, '+
                       '   SUM(DECODE(M.ENTRADASAIDA,''S'',M.VALOROUTRAMOEDA,0)) AS VALORSAIDA, ';

         sSql:=sSql+'   (0) AS SALDOANTERIOR, '+
                    '   (0) AS SALDOREGISTRO, '+
                    '   (0) AS SALDOTOTAL, '+
                    '   (0) AS BLOQCHEQUE, '+
                    '   (0) AS BLOQJUD, '+
                    '   (0) AS BLOQOUTROS '+
                    'FROM '+
                    '   MOVIMFINANC M, PORTADORCONTA C '+
                    'WHERE '+
                    '   (1=2) '+
                    'GROUP BY '+
                    '   M.CODPORTADOR, '+
                    '   M.CODLANCFINANC, '+
                    '   M.NUMCHQBORDERO, '+
                    '   M.DATALANCFINAN, '+
                    '   M.ENTRADASAIDA, '+
                    '   M.HISTORICO, '+
                    '   M.STATUSCONCILIA, '+
                    '   C.DESCRICAO '+
                    'ORDER BY '+
                    '   M.CODPORTADOR, '+
                    '   M.DATALANCFINAN ';

         case Filtro.iOrdenacao of
            0: sSql:=sSql+'   /*+OPTIMIZER_MODE RULE*/ ';
            1: sSql:=sSql+'   ,VALOR /*+OPTIMIZER_MODE RULE*/ ';
            2: sSql:=sSql+'   ,M.NUMCHQBORDERO /*+OPTIMIZER_MODE RULE*/ ';
         end;

         Data:=GetDataPacket(sSql);

         rSaldoTot:=0;
         cdsSaldos.FilterOptions:=[foCaseInsensitive];
         cdsExtratos.FilterOptions:=[foCaseInsensitive];

         cdsContas.First;
         while not(cdsContas.Eof) do
         begin
            rSaldo:=0;
            rSaldoTot:=0;        // WO7872 Ferrari
            cdsSaldos.Filter:='CODPORTADOR = '+cdsContas.FieldByName('CodPortador').AsString;

            //Bloqueios Judiciais
            cdsBloqCheque.Filter := 'CODPORTADOR = ' + cdsContas.FieldByName('CodPortador').AsString;
            cdsBloqJud.Filter    := 'CODPORTADOR = ' + cdsContas.FieldByName('CodPortador').AsString;
            cdsBloqOutros.Filter := 'CODPORTADOR = ' + cdsContas.FieldByName('CodPortador').AsString;

            cdsSaldos.First;
            if not(cdsSaldos.IsEmpty) then
               while not(cdsSaldos.Eof) do
               begin
                  rSaldo:=cdsSaldos.FieldByName('SALDOANTERIOR').AsFloat;
                  rSaldoTot:=rSaldoTot+rSaldo;

                  Append;
                  FieldByName('CODIGO').AsFloat:=cdsSaldos.FieldByName('CodPortador').AsFloat;
                  FieldByName('DATA').AsDateTime:=Filtro.dDataInicial-1;
                  FieldByName('HISTORICO').AsString:='Saldo Anterior';
                  FieldByName('DESCRICAO').AsString:=cdsContas.FieldByName('Descricao').AsString;
                  FieldByName('SALDOREGISTRO').AsFloat:=rSaldo;
                  FieldByName('SALDOTOTAL').AsFloat:=rSaldoTot;
                  FieldByName('BLOQCHEQUE').AsFloat:=cdsBloqCheque.FieldByName('VALORTOTBLOQCHQ').AsFloat;
                  FieldByName('BLOQJUD').AsFloat:=cdsBloqJud.FieldByName('VALORTOTBLOQJUD').AsFloat;
                  FieldByName('BLOQOUTROS').AsFloat:=cdsBloqOutros.FieldByName('VALORTOTBLOQOUTROS').AsFloat;
                  Post;
                  cdsSaldos.Next;
               end
            else
             begin
                Append;
                FieldByName('CODIGO').AsFloat:=cdsContas.FieldByName('CodPortador').AsFloat;
                FieldByName('DATA').AsDateTime:=Filtro.dDataInicial-1;
                FieldByName('HISTORICO').AsString:='Saldo Anterior';
                FieldByName('DESCRICAO').AsString:=cdsContas.FieldByName('Descricao').AsString;
                FieldByName('SALDOREGISTRO').AsFloat:=0;
                FieldByName('BLOQCHEQUE').AsFloat:=cdsBloqCheque.FieldByName('VALORTOTBLOQCHQ').AsFloat;
                FieldByName('BLOQJUD').AsFloat:=cdsBloqJud.FieldByName('VALORTOTBLOQJUD').AsFloat;
                FieldByName('BLOQOUTROS').AsFloat:=cdsBloqOutros.FieldByName('VALORTOTBLOQOUTROS').AsFloat;
                Post;
             end;

            //Adiciona o Movimento do Financeiro
            cdsExtratos.Filter:='CODIGO = '+cdsContas.FieldByName('CodPortador').AsString;
            cdsExtratos.First;

            if not(cdsExtratos.IsEmpty) then
               while not(cdsExtratos.Eof) do
               begin
                  rSaldo:=rSaldo+cdsExtratos.FieldByName('VALOR').AsFloat;
                  rSaldoTot:=rSaldoTot+cdsExtratos.FieldByName('VALOR').AsFloat;

                  if not ((cdsExtratos.FieldByName('VALORSAIDA').AsFloat = 0) and
                     (cdsExtratos.FieldByName('VALORENTRADA').AsFloat = 0)) then begin
                     Append;
                     FieldByName('BORDERO').AsString:=cdsExtratos.FieldByName('BORDERO').AsString;
                     FieldByName('CODIGO').AsFloat:=cdsExtratos.FieldByName('CODIGO').AsFloat;
                     FieldByName('DATA').AsDateTime:=cdsExtratos.FieldByName('DATA').AsDateTime;
                     FieldByName('HISTORICO').AsString:=cdsExtratos.FieldByName('HISTORICO').AsString;
                     FieldByName('DESCRICAO').AsString:=cdsExtratos.FieldByName('DESCRICAO').AsString;
                     FieldByName('VALORSAIDA').AsFloat:=cdsExtratos.FieldByName('VALORSAIDA').AsFloat;
                     FieldByName('VALORENTRADA').AsFloat:=cdsExtratos.FieldByName('VALORENTRADA').AsFloat;
                     FieldByName('SALDOREGISTRO').AsFloat:=rSaldo;
                     FieldByName('SALDOTOTAL').AsFloat:=rSaldoTot;
                     FieldByName('STATUS').AsString:=cdsExtratos.FieldByName('STATUS').AsString;
                     FieldByName('BLOQCHEQUE').AsFloat:=cdsBloqCheque.FieldByName('VALORTOTBLOQCHQ').AsFloat;
                     FieldByName('BLOQJUD').AsFloat:=cdsBloqJud.FieldByName('VALORTOTBLOQJUD').AsFloat;
                     FieldByName('BLOQOUTROS').AsFloat:=cdsBloqOutros.FieldByName('VALORTOTBLOQOUTROS').AsFloat;
                     Post;
                  end;
                  rSaldo    := FieldByName('SALDOREGISTRO').AsFloat;
                  rSaldoTot := FieldByName('SALDOTOTAL').AsFloat;
                  cdsExtratos.Next;
               end
            else
             if (Filtro.bCtasComMov) then Delete;

            cdsContas.Next;
         end;
      end;
      Result:=cdsGerado.Data;
   finally
      cdsSaldos.Free;
      cdsExtratos.Free;
      cdsContas.Free;
      cdsGerado.Free;
      //Bloqueios Judiciais
      qryAux.Free;
      cdsBloqCheque.Free;
      cdsBloqJud.Free;
      cdsBloqOutros.Free;
   end;
end;



function TCtrlExtratoContas.ListaFluxoRealAnalCAPCAR(dDataIni,
  dDataFim: TDateTime; iIdPessoa: integer): OleVariant;
var
   sSQL: string;
begin
   sSQL := 'SELECT ' + #13 +
           '   U.UNIDNEGOC, ' + #13 +
           '   U.CODTIPRECDES, ' + #13 +
           '   U.RECPAG, ' + #13 +
           '   U.CODCENTRORESPON, ' + #13 +
           '   U.DATALANCFINAN, ' + #13 +
           '   ABS(U.VALOR) AS VALTOT, ' + #13 +
           '   U.VALOR, ' + #13 +
           '   U.HISTORICO, ' + #13 +
           '   '''' AS RAZAOSOCIAL, ' + #13 +
           '   U.CODLANCFINANC AS DOCUMENTO, ' + #13 +
           '   U.DESCCONTA, ' + #13 +
           '   TRIM(U.CODCENTRORESPON) || '' - '' || U.DESCCR AS DESCCR, ' + #13 +
           '   TRIM(U.CODTIPRECDES) || '' - '' || U.DESCTD AS DESCTD, ' + #13 +
           '   U.DESCUN, ' + #13 +
           '   U.CODLANCFINANC ' + #13 +
           'FROM ' + #13 +

           '  (((SELECT ' + #13 +
           '        PU.UNIDNEGOC, ' + #13 +
           '        PU.CODTIPRECDES, ' + #13 +
           '        PU.RECPAG, ' + #13 +
           '        CR.CODEXTERNO AS CODCENTRORESPON, ' + #13 +
           '        PU.DATACFLOAT AS DATALANCFINAN, ' + #13 +
           '        PU.VALORPAGO AS VALTOT, ' + #13 +
           '        DECODE(PU.RECPAG,''R'',PU.VALORPAGO,-PU.VALORPAGO) AS VALOR, ' + #13 +
           '        (''Ref. ''||PU.NUMCHQBORDERO||'' - ''||P.RAZAOSOCIAL||''  Doc.No.: ''||PU.NODOCUMENTO||PU.COMPLDOCUMENTO||'' ''||L.HISTORICOCOMPL) AS HISTORICO, ' + #13 +
           '        '''' AS RAZAOSOCIAL, ' + #13 +
           '        M.CODLANCFINANC AS DOCUMENTO, ' + #13 +
           '        PC.DESCRICAO AS DESCCONTA, ' + #13 +
           '        CR.NOME AS DESCCR, ' + #13 +
           '        T.DESCRICAO AS DESCTD, ' + #13 +
           '        UN.NOME AS DESCUN, ' + #13 +
           '        M.CODLANCFINANC ' + #13 +
           '     FROM ' + #13 +
           '        TIPORECEBDESEMB T, ' + #13 +
           '        PESSOA P, ' + #13 +
           '        PARAMFINANC PF, ' + #13 +
           '        MOVIMFINANC M, ' + #13 +
           '        DOCUMENTO D, ' + #13 +
           '        LANCTODOCUM L, ' + #13 +
           '        PORTADORCONTA PC, ' + #13 +
           '        UNIDNEGOCIO UN, ' + #13 +
           '        CENTRESPON CR, ' + #13 +

           '       (SELECT ' + #13 +
           '           D.CODDOCUMENTO, ' + #13 +
           '           R.UNIDNEGOC, ' + #13 +
           '           R.CODTIPRECDES, ' + #13 +
           '           R.RECPAG, ' + #13 +
           '           R.CODCENTRORESPON, ' + #13 +
           '           L.DATALANCTO, ' + #13 +
           '           D.NODOCUMENTO, ' + #13 +
           '           RP.CODLANCFINANC, ' + #13 +
           '           D.COMPLDOCUMENTO, ' + #13 +
           '           RP.NUMCHQBORDERO, ' + #13 +
           '           RP.DATACFLOAT, ' + #13 +
           '           D.DATAPROGRAMADA, ' + #13 +
           '           DECODE(D.RECPAG,''P'',DECODE(D.OPERACAO,''10'',DECODE(L.DEBCRE,''C'',L.VALOR,-L.VALOR)*R.PERC, ' + #13 +
           '                                                          DECODE(L.DEBCRE,''D'',L.VALOR,-L.VALOR)*R.PERC), ' + #13 +
           '                                 DECODE(D.OPERACAO,''10'',DECODE(L.DEBCRE,''D'',L.VALOR,-L.VALOR)*R.PERC, ' + #13 +
           '                                                          DECODE(L.DEBCRE,''C'',L.VALOR,-L.VALOR)*R.PERC)) AS VALORPAGO, ' + #13 +
           '           R.IDPESSOA, ' + #13 +
           '           D.IDFORCLI ' + #13 +
           '        FROM ' + #13 +
           '           DOCUMENTO D, ' + #13 +
           '           LANCTODOCUM L, ' + #13 +
           '           RECBTOPAGTO RP, ' + #13 +

           '         (SELECT ' + #13 +
           '               D.NUMFATURA, ' + #13 +
           '               R.CODTIPRECDES, ' + #13 +
           '               R.RECPAG, ' + #13 +
           '               R.IDPESSOA, ' + #13 +
           '               R.UNIDNEGOC, ' + #13 +
           '               R.CODCENTRORESPON, ' + #13 +
           '               (SUM(R.VALOR)/T.VALORTOTAL) AS PERC ' + #13 +
           '            FROM ' + #13 +
           '               RATEIODOCUM R, ' + #13 +
           '               DOCUMENTO D, ' + #13 +
           '               (SELECT ' + #13 +
           '                   D.NUMFATURA, ' + #13 +
           '                   SUM(DECODE(D.RECPAG,''P'',DECODE(D.OPERACAO,''15'',DECODE(L.DEBCRE,''D'',L.VALOR,-L.VALOR), ' + #13 +
           '                                                                      DECODE(L.DEBCRE,''C'',L.VALOR,-L.VALOR)), ' + #13 +
           '                                             DECODE(D.OPERACAO,''15'',DECODE(L.DEBCRE,''C'',L.VALOR,-L.VALOR), ' + #13 +
           '                                                                      DECODE(L.DEBCRE,''D'',L.VALOR,-L.VALOR)))) AS VALORTOTAL ' + #13 +
           '                FROM ' + #13 +
           '                   DOCUMENTO D, ' + #13 +
           '                   LANCTODOCUM L ' + #13 +
           '                WHERE ' + #13 +
           '                  (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' + #13 +
           '                  (D.OPERACAO     = L.OPERACAO) AND ' + #13 +
           '                  (D.IDPESSOA     = ' + IntToStr(iIdPessoa) + ') AND ' + #13 +
           '                  (L.ESTORNO IS NULL) AND ' + #13 +
           '                  (D.NUMFATURA IS NOT NULL) AND ' + #13 +
           '                  (D.OPERACAO = ''1 '') ' + #13 +
           '                GROUP BY D.NUMFATURA) T ' + #13 +

           '            WHERE ' + #13 +
           '              (T.NUMFATURA    = D.NUMFATURA) AND ' + #13 +
           '              (T.VALORTOTAL  <> 0) AND ' + #13 +
           '              (D.CODDOCUMENTO = R.CODDOCUMENTO) ' + #13 +
           '            GROUP BY D.NUMFATURA, R.CODTIPRECDES, R.RECPAG, R.IDPESSOA, ' + #13 +
           '                     R.UNIDNEGOC, R.CODCENTRORESPON, T.VALORTOTAL) R ' + #13 +

           '        WHERE ' + #13 +
           '          (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' + #13 +
           '          (L.OPERACAO IN (''5 '',''10'',''15''))  AND ' + #13 +
           '          (D.IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' + #13 +
           '          (L.ESTORNO IS NULL) AND ' + #13 +
           '          (D.NUMFATURA = R.NUMFATURA) AND ' + #13 +
           '          (RP.CODDOCUMENTO = L.CODDOCUMENTO) AND ' + #13 +
           '          (RP.NUMLANCTO = L.NUMLANCTO) ' + #13;

           if dDataIni <> 0 then
              sSQL := sSQL + ' AND (RP.DATACFLOAT >= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataIni)) + ',''DD/MM/YYYY'')) ';

           if dDataFim <> 0 then
              sSQL := sSQL + ' AND (RP.DATACFLOAT <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataFim)) + ',''DD/MM/YYYY'')) ';


           sSQL := sSQL +
           '       UNION ALL ' + #13 +

           '        SELECT ' + #13 +
           '           D.CODDOCUMENTO, ' + #13 +
           '           R.UNIDNEGOC, ' + #13 +
           '           R.CODTIPRECDES, ' + #13 +
           '           R.RECPAG, ' + #13 +
           '           R.CODCENTRORESPON, ' + #13 +
           '           L.DATALANCTO, ' + #13 +
           '           D.NODOCUMENTO, ' + #13 +
           '           RP.CODLANCFINANC, ' + #13 +
           '           D.COMPLDOCUMENTO, ' + #13 +
           '           RP.NUMCHQBORDERO, ' + #13 +
           '           RP.DATACFLOAT, ' + #13 +
           '           D.DATAPROGRAMADA, ' + #13 +
           '           DECODE(D.RECPAG,''P'',DECODE(D.OPERACAO,''10'',DECODE(L.DEBCRE,''C'',L.VALOR,-L.VALOR)*R.PERC, ' + #13 +
           '                                                          DECODE(L.DEBCRE,''D'',L.VALOR,-L.VALOR)*R.PERC), ' + #13 +
           '                                 DECODE(D.OPERACAO,''10'',DECODE(L.DEBCRE,''D'',L.VALOR,-L.VALOR)*R.PERC, ' + #13 +
           '                                                          DECODE(L.DEBCRE,''C'',L.VALOR,-L.VALOR)*R.PERC)) AS VALORPAGO, ' + #13 +
           '           R.IDPESSOA, ' + #13 +
           '           D.IDFORCLI ' + #13 +
           '        FROM ' + #13 +
           '           DOCUMENTO D, ' + #13 +
           '           LANCTODOCUM L, ' + #13 +
           '           RECBTOPAGTO RP, ' + #13 +

           '          (SELECT ' + #13 +
           '              R.CODDOCUMENTO, ' + #13 +
           '              R.CODTIPRECDES, ' + #13 +
           '              R.RECPAG, ' + #13 +
           '              R.IDPESSOA, ' + #13 +
           '              R.UNIDNEGOC, ' + #13 +
           '              R.CODCENTRORESPON, ' + #13 +
           '              (SUM(R.VALOR)/T.VALORTOTAL) AS PERC ' + #13 +
           '           FROM ' + #13 +
           '              RATEIODOCUM R, ' + #13 +

           '             (SELECT ' + #13 +
           '                 D.CODDOCUMENTO, ' + #13 +
           '                 SUM(DECODE(D.RECPAG,''P'',DECODE(D.OPERACAO,''15'',DECODE(L.DEBCRE,''D'',L.VALOR,-L.VALOR), ' + #13 +
           '                                                                    DECODE(L.DEBCRE,''C'',L.VALOR,-L.VALOR)), ' + #13 +
           '                                           DECODE(D.OPERACAO,''15'',DECODE(L.DEBCRE,''C'',L.VALOR,-L.VALOR), ' + #13 +
           '                                                                    DECODE(L.DEBCRE,''D'',L.VALOR,-L.VALOR)))) AS VALORTOTAL ' + #13 +
           '              FROM ' + #13 +
           '                 DOCUMENTO D, ' + #13 +
           '                 LANCTODOCUM L ' + #13 +
           '              WHERE ' + #13 +
           '                (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' + #13 +
           '                (D.OPERACAO = L.OPERACAO) AND ' + #13 +
           '                (D.IDPESSOA = ' + IntToStr(iIdPessoa) + ')  AND ' + #13 +
           '                (L.ESTORNO IS NULL) AND ' + #13 +
           '                (L.VALOR <> 0) AND ' + #13 +
           '                (D.OPERACAO IN (''2 '',''10'',''15'')) ' + #13 +
           '               GROUP BY D.CODDOCUMENTO) T ' + #13 +

           '           WHERE ' + #13 +
           '             (T.CODDOCUMENTO = R.CODDOCUMENTO) AND ' + #13 +
           '             (T.VALORTOTAL <> 0) ' + #13 +
           '           GROUP BY R.CODDOCUMENTO, R.CODTIPRECDES, R.RECPAG, R.IDPESSOA, ' + #13 +
           '                    R.UNIDNEGOC, R.CODCENTRORESPON, T.VALORTOTAL) R ' + #13 +

           '        WHERE ' + #13 +
           '          (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' + #13 +
           '          (L.OPERACAO IN (''5 '',''10'',''15'')) AND ' + #13 +
           '          (D.IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' + #13 +
           '          (L.ESTORNO IS NULL) AND ' + #13 +
           '          (D.CODDOCUMENTO = R.CODDOCUMENTO) AND ' + #13 +
           '          (RP.CODDOCUMENTO = L.CODDOCUMENTO) AND ' + #13 +
           '          (RP.NUMLANCTO = L.NUMLANCTO) ' + #13; 

           if dDataIni <> 0 then
              sSQL := sSQL + ' AND (RP.DATACFLOAT >= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataIni)) + ',''DD/MM/YYYY'')) ';

           if dDataFim <> 0 then
              sSQL := sSQL + ' AND (RP.DATACFLOAT <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataFim)) + ',''DD/MM/YYYY'')) ';


           sSQL := sSQL +  '      ) PU ' + #13 +
           '     WHERE ' + #13 +
           '       (P.IDPESSOA         = PU.IDFORCLI) AND ' + #13 +
           '       (T.CODTIPRECDES     = PU.CODTIPRECDES) AND ' + #13 +
           '       (T.RECPAG           = PU.RECPAG) AND ' + #13 +
           '       (T.IDPESSOA         = PU.IDPESSOA) AND ' + #13 +
           '       (M.CODLANCFINANC    = PU.CODLANCFINANC) AND ' + #13 +
           '       (PF.IDPESSOA        = PU.IDPESSOA) AND ' + #13 +
           '       (D.CODDOCUMENTO     = PU.CODDOCUMENTO) AND ' + #13 +
           '       (D.OPERACAO         = L.OPERACAO) AND ' + #13 +
           '       (L.ESTORNO IS NULL) AND ' + #13 +
           '       (D.CODDOCUMENTO     = L.CODDOCUMENTO) AND ' + #13 +
           '       (M.CODPORTADOR      = PC.CODPORTADOR) AND ' + #13 +
           '       ((PC.FLGGRAVAFLUXO  = ''S'') OR (PC.FLGGRAVAFLUXO IS NULL)) AND ' + #13 +
           '       (PU.UNIDNEGOC       = UN.UNIDNEGOC) AND ' + #13 +
           '       (PU.IDFORCLI        = UN.IDPESSOA) AND ' + #13 +
           '       (PU.CODCENTRORESPON = CR.CODCENTRORESPON) AND ' + #13 +
           '       (PU.IDFORCLI        = CR.IDPESSOA)) ' + #13 +

           '    UNION ALL ' + #13 +

           '    (SELECT ' + #13 +
           '        R.UNIDNEGOC, ' + #13 +
           '        R.CODTIPRECDES, ' + #13 +
           '        R.RECPAG, ' + #13 +
           '        CR.CODEXTERNO AS CODCENTRORESPON, ' + #13 +
           '        M.DATALANCFINAN, ' + #13 +
           '        R.VALOR AS VALTOT, ' + #13 +
           '        DECODE(R.RECPAG,''R'',R.VALOR,-R.VALOR) AS VALOR, ' + #13 +
           '        M.HISTORICO, ' + #13 +
           '        '''' AS RAZAOSOCIAL, ' + #13 +
           '        M.CODLANCFINANC AS DOCUMENTO, ' + #13 +
           '        PC.DESCRICAO AS DESCCONTA, ' + #13 +
           '        CR.NOME AS DESCCR, ' + #13 +
           '        T.DESCRICAO AS DESCTD, ' + #13 +
           '        UN.NOME AS DESCUN, ' + #13 +
           '        M.CODLANCFINANC ' + #13 +
           '     FROM ' + #13 +
           '        MOVIMFINANC M, ' + #13 +
           '        TIPORECEBDESEMB T, ' + #13 +
           '        RATEIOFINANC R, ' + #13 +
           '        PORTADORCONTA PC, ' + #13 +
           '        CENTRESPON CR, ' + #13 +
           '        UNIDNEGOCIO UN ' + #13 +
           '     WHERE ' + #13 +
           '       (M.IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' + #13;

           if dDataIni <> 0 then
              sSQL := sSQL + ' (M.DATALANCFINAN  >= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataIni)) + ',''DD/MM/YYYY'')) AND ';

           if dDataFim <> 0 then
              sSQL := sSQL + ' (M.DATALANCFINAN  <= TO_DATE(' + QuotedStr(FormatDateTime('dd/mm/yyyy',dDataFim)) + ',''DD/MM/YYYY'')) AND ';

           sSQL := sSQL +
           '       (M.CODPORTADOR   = PC.CODPORTADOR) AND ' + #13 +
           '       (M.IDPESSOA      = PC.IDPESSOA) AND ' + #13 +
           '       (M.CODLANCFINANC = R.CODLANCFINANC) AND ' + #13 +
           '       (M.IDPESSOA      = R.IDPESSOA) AND ' + #13 +
           '       (R.UNIDNEGOC     = UN.UNIDNEGOC) AND ' + #13 +
           '       (R.IDPESSOA      = UN.IDPESSOA) AND ' + #13 +
           '       (R.IDPESSOA      = CR.IDPESSOA(+)) AND ' + #13 +
           '       (R.CODCENTRORESPON = CR.CODCENTRORESPON(+)) AND ' + #13 +
           '       (R.CODTIPRECDES  = T.CODTIPRECDES) AND ' + #13 +
           '       (R.RECPAG        = T.RECPAG) AND ' + #13 +
           '       (R.IDPESSOA      = T.IDPESSOA) AND ' + #13 +
           '       ((PC.FLGGRAVAFLUXO = ''S'') OR (PC.FLGGRAVAFLUXO IS NULL)) AND ' + #13 +

           '       (NOT EXISTS (SELECT ' + #13 +
           '                       RP.CODLANCFINANC ' + #13 +
           '                    FROM ' + #13 +
           '                       RECBTOPAGTO RP ' + #13 +
           '                    WHERE ' + #13 +
           '                      (RP.CODLANCFINANC = M.CODLANCFINANC))) ' + #13 +
           '     ))) U ' + #13 +
           'ORDER BY U.CODCENTRORESPON,U.RECPAG,U.CODTIPRECDES,U.DATALANCFINAN,U.CODLANCFINANC ';

   Result := GetDataPacket(sSQL);
end;




function TCtrlExtratoContas.ListaLogo(iIdPessoa: integer): OleVariant;
begin
   Result := GetDataPacket('SELECT  '+
                           '   I.IMAGEM ' +
                           'FROM ' +
                           '  PESSOA P, IMAGENS I ' +
                           'WHERE ' +
                           '   (P.IDPESSOA = ' + IntToStr(iIdPessoa) + ') AND ' +
                           '   (I.IDIMAGEM = P.IDIMAGEM)');
end;




function TCtrlExtratoContas.ListaSaldoGeral(iIdEmpresa, iConta: Double; iStatus:
                                            Integer; sDataRef: String): OleVariant;
Var
   sSQL : String;
begin
   sSQL := '';

   if not FRemoveContasAbertas then

      sSQL :=
        'SELECT                                                                                       ' +
        '  UN.DESCRICAO, nvl(UN.CODPORTADOR,0) as CODPORTADOR,                                        ' +
        '  SUM(UN.SALDOANTERIOR) AS SALDOANTERIOR,                                                    ' +
        '  SUM(UN.RECEBTOPAGTO) AS RECEBTOPAGTO, SUM(UN.SALDOATU) AS SALDOATU                         ' +
        'FROM ((                                                                                      ' ;

   sSQL := sSQL +

        '  SELECT                                                                                         ' +
        '      C.DESCRICAO, C.CODPORTADOR,                                                                ' +
        '      SUM(DECODE(M.ENTRADASAIDA,''S'',-M.VALORLANCFINAN,M.VALORLANCFINAN)) AS SALDOANTERIOR,     ' +
        '      0 AS RECEBTOPAGTO,                                                                         ' +
        '      SUM(DECODE(M.ENTRADASAIDA,''S'',-M.VALORLANCFINAN,M.VALORLANCFINAN)) AS SALDOATU           ' +
        '    FROM                                                                                         ' +
        '      PORTADORCONTA C, MOVIMFINANC M                                                             ' +
        'WHERE (M.DATALANCFINAN <= TO_DATE(' + QuotedStr(sDataRef) + ' ,''DD/MM/YYYY'')) AND              ' ;

   case iStatus of
     0 : sSQL := sSQL + ' ( M.STATUSCONCILIA IN (''P'',''X'',''I'',''N'',''C'',''J'')) AND ' ;
     1 : sSQL := sSQL + ' ( M.STATUSCONCILIA IN (''X'',''I'')) AND ' ;
     2 : sSQL := sSQL + ' ( M.STATUSCONCILIA <> ''C'') AND ' ;
   end;

   if ( iConta = 0 ) then
      sSQL := sSQL + ' ( M.CODPORTADOR = C.CODPORTADOR )  AND '
      else
      sSQL := sSQL + ' ( M.CODPORTADOR = C.CODPORTADOR )  AND ' +
                     ' ( C.CODPORTADOR = ' + FloatToStr(iConta) + ') AND  ' ;

   sSQL := sSQL +
   '   (M.IDPESSOA = ' + FloatToStr(iIdEmpresa) + ') AND                                                  ' +
   '   ((C.FLGSTATUS = ''A'') OR (C.FLGSTATUS IS NULL))                                                   ' ;

   if not FRemoveContasAbertas then
   sSQL := sSQL +
      'GROUP BY C.DESCRICAO, C.CODPORTADOR) '
   else
   sSQL := sSQL +
      'GROUP BY C.DESCRICAO, C.CODPORTADOR  ';

   if not FRemoveContasAbertas then
      sSQL := sSQL +

        'UNION                                                                                                 ' +
        '(SELECT                                                                                               ' +
        '   DECODE(C.DESCRICAO,NULL,''Sem conta selecionada'',C.DESCRICAO) AS DESCRICAO, C.CODPORTADOR,        ' +
        '   0 AS SALDOANTERIOR,                                                                                ' +
        '   SUM(S.SALDO) AS RECBTOPAGTO,                                                                       ' +
        '   SUM(S.SALDO) AS SALDOATU                                                                           ' +
        ' FROM                                                                                                 ' +
        '  (SELECT                                                                                             ' +
        '     CODDOCUMENTO, SUM(DECODE(DEBCRE,''D'',VALOR,-VALOR)) AS SALDO                                    ' +
        '   FROM LANCTODOCUM                                                                                   ' +
        '   GROUP BY CODDOCUMENTO) S,                                                                          ' +
        '   DOCUMENTO D,                                                                                       ' +
        '   LANCTODOCUM L,                                                                                     ' +
        '   PORTADORFORMA P,                                                                                   ' +
        '   PORTADORCONTA C,                                                                                   ' +
        '   PARAMFINANC PF                                                                                     ' +
        ' WHERE ((D.STATUS <> 2) OR (D.STATUS IS NULL)) AND                                                    ' +
        '   ((D.OPERACAO = ''1 '') OR (D.OPERACAO = ''2 '') OR                                                 ' +
        '   (D.OPERACAO = ''3 '') OR (D.OPERACAO = ''14'')) AND                                                ' +
        '   (D.IDPESSOA = ' + FloatToStr(iIdEmpresa) + ') AND                                                  ' +
        '   (((PF.FLGCONFIRMARECPAG = ''S'') AND (D.FLGCONFIRMARECPAG = ''S'')) OR                             ' +
        '   (((PF.FLGCONFIRMARECPAG = ''N'') OR (PF.FLGCONFIRMARECPAG IS NULL)) AND                            ' +
        '   ((D.DATAPROGRAMADA = TO_DATE( ' + QuotedStr( sDataRef ) + ' ,''DD/MM/YYYY''))))) AND               ' +
        '   (D.CODDOCUMENTO = S.CODDOCUMENTO) AND                                                              ' +
        '   (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                                                              ' +
        '   (D.OPERACAO = L.OPERACAO) AND                                                                      ' +
        '   (L.ESTORNO IS NULL) AND                                                                            ' ;

   if not (iConta = 0) and not ( FRemoveContasAbertas ) then
      sSQL := sSQL +
        '   ( P.CODPORTADOR = ' + FloatToStr(iConta) + ' ) AND '   ;

   if not ( FRemoveContasAbertas ) then
      sSQL := sSQL +
        '   (D.CODPORTFORMA = P.CODPORTFORMA(+)) AND                  ' +
        '   (P.CODPORTADOR = C.CODPORTADOR(+)) AND                    ' +
        '   (D.IDPESSOA = PF.IDPESSOA) AND                            ' +
        '   ((C.FLGSTATUS = ''A'') OR (C.FLGSTATUS IS NULL))          ' +
        ' GROUP BY C.DESCRICAO, C.CODPORTADOR)) UN                    ' +
        ' GROUP BY  UN.DESCRICAO, UN.CODPORTADOR                      ' +
        ' ORDER BY  UN.DESCRICAO                                      ' ;

   if ( FRemoveContasAbertas ) then
      sSQL := sSQL +
        ' ORDER BY  DESCRICAO              ' ;
   Result := GetDataPacket(sSQL);
end;



function TCtrlExtratoContas.ListaSaldoXPatrocinadora(iIdEmpresa,
  iConta: Double; iStatus: Integer; sDataRef: String): OleVariant;
var
sSQL : String;
begin
   if not FRemoveContasAbertas then
      sSQL :=
           'SELECT                                                                                        ' +
           '  UN.DESCRICAO, /*Patrocinadora*/                                                             ' +
           '  UN.NOME ,                                                                                   ' +
           '  UN.CODPORTADOR,                                                                             ' +
           '  UN.IDPATRO,                                                                                 ' +
           '  SUM(UN.SALDOANTERIOR) AS SALDOANTERIOR,                                                     ' +
           '  SUM(UN.RECEBTOPAGTO) AS RECEBTOPAGTO,                                                       ' +
           '  SUM(UN.SALDOATU + UN.RECEBTOPAGTO) AS SALDOATU                                              ' +
           'FROM ((' ;

      sSQL := sSQL +
           'SELECT                                                                                    ' +
           '      C.DESCRICAO,                                                                            ' +
           '      C.CODPORTADOR,                                                                          ' +
           '      R.IDPATRO,                                                                              ' +
           '      DECODE (PA.NOME,NULL, ''Patrocinadora não encontrada'', PA.NOME) AS NOME,               ' +
           '      SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) AS SALDOANTERIOR,                        ' +
           '      0 AS RECEBTOPAGTO,                                                                        ' +
           '      SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) AS SALDOATU                              ' +
           '    FROM                                                                                      ' +
           '      PORTADORCONTA C,                                                                        ' +
           '      MOVIMFINANC M,                                                                          ' +
           '      RATEIOFINANC R,                                                                         ' +
           '      PESSOA PA                                                                               ' +
           '    WHERE                                                                                     ' +
           '      (R.IDPATRO = PA.IDPESSOA(+)) AND                                                        ' +
           '      (M.DATALANCFINAN <= TO_DATE( ' + QuotedStr(sDataRef) + ' ,''DD/MM/YYYY'')) AND          ' ;

           case iStatus of
             0 : sSQL := sSQL + ' ( M.STATUSCONCILIA IN (''P'',''X'',''I'',''N'',''C'',''J'')) AND        ' ;
             1 : sSQL := sSQL + ' ( M.STATUSCONCILIA IN (''X'',''I'')) AND ' ;
             2 : sSQL := sSQL + ' ( M.STATUSCONCILIA <> ''C'') AND ' ;
           end;

           if ( iConta = 0 ) then
              sSQL := sSQL + ' ( M.CODPORTADOR = C.CODPORTADOR )  AND '
              else
              sSQL := sSQL + ' ( M.CODPORTADOR = C.CODPORTADOR )  AND ' +
                             ' ( C.CODPORTADOR = ' + FloatToStr(iConta) + ') AND  ' ;

           sSQL := sSQL +
           '      (M.IDPESSOA = ' + FloatToStr(iIdEmpresa) + ') AND                                       ' +
           '      ((C.FLGSTATUS = ''A'') OR (C.FLGSTATUS IS NULL)) AND                                    ' +
           '      (M.CODLANCFINANC = R.CODLANCFINANC)                                                     ' +
           '    GROUP BY                                                                                  ' +
           '       C.DESCRICAO,                                                                           ' +
           '       C.CODPORTADOR,                                                                         ' +
           '       R.IDPATRO,                                                                             ' ;

           if FRemoveContasAbertas then
           sSQL := sSQL +
             ' PA.NOME ' +
   //IGOR PENDENCIA 25868 - As contas zeradas não devem ser impressas
             ' HAVING SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) <> 0                        ' +
             '     OR SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) <> 0                        '
           else
           sSQL := sSQL +
           '    PA.NOME) ' +
           '    UNION ' +
           '   (SELECT        ' +
           '      DECODE(C.DESCRICAO,NULL,''Sem conta selecionada'',C.DESCRICAO) AS DESCRICAO,            ' +
           '      C.CODPORTADOR,                                                                          ' +
           '      R.IDPATRO,                                                                              ' +
           '      PA.NOME,                                                                                ' +
           '      0 AS SALDOANTERIOR,                                                                     ' +
           '      SUM(DECODE(DEBCRE,''D'',R.VALOR,-R.VALOR)) AS SALDO, ' +
           '      0 AS RECBTOPAGTO ' +
           '    FROM '+
           '      DOCUMENTO D,                                                                            ' +
           '      LANCTODOCUM L,                                                                          ' +
           '      PORTADORFORMA P,                                                                        ' +
           '      PORTADORCONTA C,                                                                        ' +
           '      RATEIODOCUM R,                                                                          ' +
           '      PESSOA PA,                                                                              ' +
           '      PARAMFINANC PF                                                                          ' +
           '    WHERE                                                                                     ' +
           '       ((D.STATUS <> 2) OR (D.STATUS IS NULL)) AND                                            ' +
           '       ((D.OPERACAO = ''1 '') OR (D.OPERACAO = ''2 '') OR                                     ' +
           '       (D.OPERACAO = ''3 '')  OR (D.OPERACAO = ''14'')) AND                                   ' +
           '       (D.IDPESSOA = ' + FloatToStr(iIdEmpresa) + ' ) AND                                     ' +
           '       (((PF.FLGCONFIRMARECPAG = ''S'') AND (D.FLGCONFIRMARECPAG = ''S'')) OR                 ' +
           '       (((PF.FLGCONFIRMARECPAG = ''N'') OR (PF.FLGCONFIRMARECPAG IS NULL)) AND                ' +
           '       ((D.DATAPROGRAMADA = TO_DATE(' + QuotedStr(sDataRef) +' ,''DD/MM/YYYY''))))) AND       ' +
           '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                                                  ' +
           '       (D.OPERACAO = L.OPERACAO) AND                                                          ' +
           '       (D.CODDOCUMENTO = R.CODDOCUMENTO) AND                                                  ' +
           '       (R.IDPATRO = PA.IDPESSOA) AND                                                          ' +
           '       (L.ESTORNO IS NULL) AND                                                                ' +
           '       (D.CODPORTFORMA = P.CODPORTFORMA(+)) AND                                               ' +
           '       (P.CODPORTADOR = C.CODPORTADOR(+)) AND                                                 ' +
           '       (D.IDPESSOA = PF.IDPESSOA) AND                                                         ' +
           '       ((C.FLGSTATUS = ''A'') OR (C.FLGSTATUS IS NULL))                                       ' ;

           if not (iConta = 0) and not (FRemoveContasAbertas) then
              sSQL := sSQL + 'AND ( P.CODPORTADOR = ' + FloatToStr(iConta) + ' ) ' ;

           if not ( FRemoveContasAbertas ) then
              sSQL := sSQL +
                '    GROUP BY                                  ' +
                '      C.DESCRICAO,                            ' +
                '      C.CODPORTADOR,                          ' +
                '      R.IDPATRO,                              ' +
                '      PA.NOME                                 ' +
                '       )) UN                                  ' +
                'GROUP BY                                      ' +
                '   UN.DESCRICAO,                              ' +
                '   UN.CODPORTADOR,                            ' +
                '   UN.IDPATRO,                                ' +
                '   UN.NOME                                    ' +

   //IGOR PENDENCIA 25868 - As contas zeradas não devem ser impressas
                'HAVING SUM(UN.SALDOANTERIOR)              <> 0 ' +
                '    OR SUM(UN.RECEBTOPAGTO)               <> 0 ' +
                '    OR SUM(UN.SALDOATU + UN.RECEBTOPAGTO) <> 0 ' +

                'ORDER BY                                      ' +
                '   UN.DESCRICAO,                              ' +
                '   UN.NOME                                    ';


   Result := GetDataPacket(sSQL);
end;



function TCtrlExtratoContas.ListaSaldoXPlano(iIdEmpresa, iConta: Double;
  iStatus: Integer; sDataRef: String): OleVariant;
var
sSQL : String;
begin
   if not FRemoveContasAbertas then
      sSQL := sSQL +

        'SELECT                     ' +
        '   UN.DESCRICAO, /*Plano*/ ' +
        '   UN.CODPORTADOR, ' +
        '   UN.IDPLANOPREV, ' +
        '   UN.NOME, ' +
        '   SUM(UN.SALDOANTERIOR) AS SALDOANTERIOR, ' +
        '   SUM(UN.RECEBTOPAGTO) AS RECEBTOPAGTO, ' +
        '   SUM(UN.SALDOATU + UN.RECEBTOPAGTO) AS SALDOATU ' +
        'FROM (( ' ;

   sSQL := sSQL +

    '  SELECT ' +
    '     C.DESCRICAO, ' +
    '     C.CODPORTADOR, ' +
    '     R.IDPLANOPREV, ' +
    '     P.NOME, ' +
    '     SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) AS SALDOANTERIOR, ' +
    '     0 AS RECEBTOPAGTO, ' +
    '     SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) AS SALDOATU ' +
    '  FROM ' +
    '     PORTADORCONTA C, ' +
    '     MOVIMFINANC M, ' +
    '     RATEIOFINANC R, ' +
    '     PLANPREVCONTABIL P ' +
    '  WHERE ' +
    '    (M.DATALANCFINAN <= TO_DATE(' + QuotedStr(sDataRef) + ',''DD/MM/YYYY'')) AND ' ;

   case iStatus of
     0 : sSQL := sSQL + ' ( M.STATUSCONCILIA IN (''P'',''X'',''I'',''N'',''C'',''J'')) AND        ' ;
     1 : sSQL := sSQL + ' ( M.STATUSCONCILIA IN (''X'',''I'')) AND ' ;
     2 : sSQL := sSQL + ' ( M.STATUSCONCILIA <> ''C'') AND ' ;
   end;

   if ( iConta = 0 ) then
      sSQL := sSQL + ' ( M.CODPORTADOR = C.CODPORTADOR )  AND '
      else
      sSQL := sSQL + ' ( M.CODPORTADOR = C.CODPORTADOR )  AND ' +
                     ' ( C.CODPORTADOR = ' + FloatToStr(iConta) + ') AND  ' ;

   sSQL := sSQL +

'                  (M.IDPESSOA = ' + FloatToStr(iIdEmpresa) + ') AND ' +
'                  ((C.FLGSTATUS = ''A'') OR (C.FLGSTATUS IS NULL)) AND ' +
'                  (M.CODLANCFINANC = R.CODLANCFINANC) AND ' +
'                  (C.CODPORTADOR = M.CODPORTADOR) AND ' +
'                  (R.IDPLANOPREV = P.IDPLANOPREV) ' +
'                GROUP BY ' +
'                   C.DESCRICAO, ' +
'                   C.CODPORTADOR, ' +
'                   R.IDPLANOPREV, ' ;

   if FRemoveContasAbertas then
   sSQL := sSQL +
    'P.NOME ' +
   //IGOR PENDENCIA 25868 - As contas zeradas não devem ser impressas
    'HAVING SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) <> 0 ' +
    '    OR SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) <> 0 ' 
   else
   sSQL := sSQL +
    'P.NOME) ' +
    'UNION ' +
'   (SELECT ' +
'       DECODE(C.DESCRICAO,NULL,''Sem conta selecionada'',C.DESCRICAO) AS DESCRICAO, ' +
'       C.CODPORTADOR, ' +
'       R.IDPLANOPREV, ' +
'       PL.NOME, ' +
'       0 AS SALDOANTERIOR, ' +
'       SUM(DECODE(DEBCRE,''D'',R.VALOR,-R.VALOR)) AS SALDO, ' +
'       0 AS RECBTOPAGTO ' +
'    FROM ' +
'      DOCUMENTO D, ' +
'      LANCTODOCUM L, ' +
'      PORTADORFORMA P, ' +
'      PORTADORCONTA C, ' +
'      RATEIODOCUM R, ' +
'      PLANPREVCONTABIL PL, ' +
'      PARAMFINANC PF ' +
'    WHERE ' +
'       ((D.STATUS <> ''2'') OR (D.STATUS IS NULL)) AND ' +
'       ((D.OPERACAO = ''1'') OR (D.OPERACAO = ''2 '') OR (D.OPERACAO = ''3 '') OR (D.OPERACAO = ''14'')) AND ' +
'       (D.IDPESSOA =  ' + FloatToStr(iIdEmpresa) + ') AND ' +
'       (((PF.FLGCONFIRMARECPAG = ''S'') AND (D.FLGCONFIRMARECPAG = ''S'')) OR ' +
'       (((PF.FLGCONFIRMARECPAG = ''N'') OR (PF.FLGCONFIRMARECPAG IS NULL)) AND ' +
'       ((D.DATAPROGRAMADA = TO_DATE(' + QuotedStr(sDataRef) + ',''DD/MM/YYYY''))))) AND ' +
'       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
'       (D.OPERACAO = L.OPERACAO) AND ' +
'       (D.CODDOCUMENTO = R.CODDOCUMENTO) AND ' +
'       (R.IDPLANOPREV = PL.IDPLANOPREV) AND ' +
'       (L.ESTORNO IS NULL) AND ' +
'       (D.CODPORTFORMA = P.CODPORTFORMA(+)) AND ' +
'       (P.CODPORTADOR = C.CODPORTADOR(+)) AND ' +
'       (D.IDPESSOA = PF.IDPESSOA) AND ' +
'       ((C.FLGSTATUS = ''A'') OR (C.FLGSTATUS IS NULL)) ' ;

  if not (iConta = 0) and not ( FRemoveContasAbertas ) then
     sSQL := sSQL + ' AND ( P.CODPORTADOR = ' + FloatToStr(iConta) + ' ) ' ;

  if not ( FRemoveContasAbertas ) then
    sSQL := sSQL +
     ' GROUP BY ' +
     '    C.DESCRICAO, ' +
     '    C.CODPORTADOR, ' +
     '    R.IDPLANOPREV, ' +
     '    PL.NOME)) UN ' +
     ' GROUP BY ' +
     '    UN.DESCRICAO, ' +
     '    UN.CODPORTADOR, ' +
     '    UN.IDPLANOPREV, ' +
     '    UN.NOME ' +

   //IGOR PENDENCIA 25868 - As contas zeradas não devem ser impressas
     ' HAVING SUM(UN.SALDOANTERIOR)              <> 0 ' +
     '     OR SUM(UN.RECEBTOPAGTO)               <> 0 ' +
     '     OR SUM(UN.SALDOATU + UN.RECEBTOPAGTO) <> 0 ' +

     ' ORDER BY ' +
     '    UN.DESCRICAO ';

  Result := GetDataPacket(sSQL);
end;



function TCtrlExtratoContas.ListaSaldoXPlanoEPatrocinadora(iIdEmpresa,
  iConta: Double; iStatus: Integer; sDataRef: String): OleVariant;
var
  sSQL : String;
begin
  if not FRemoveContasAbertas then
     sSQL := sSQL +

       'SELECT ' +
       '   UN.DESCRICAO,   /* PLANO PATRO*/ ' +
       '   UN.NOME || '' - '' || UN.NOMEPLANO AS NOME, ' +
       '   UN.CODPORTADOR, ' +
       '   UN.IDPATRO, ' +
       '   UN.IDPLANOPREV, ' +
       '   SUM(UN.SALDOANTERIOR) AS SALDOANTERIOR, ' +
       '   SUM(UN.RECEBTOPAGTO) AS RECEBTOPAGTO, ' +
       '   SUM(UN.SALDOATU + UN.RECEBTOPAGTO) AS SALDOATU ' +
       'FROM ((' ;

     sSQL := sSQL +

       '   SELECT ' +
       '        C.DESCRICAO, ' +
       '        C.CODPORTADOR, ' +
       '        R.IDPATRO, ' +
       '        ppc.nome as NOMEPlano, ' +
       '        r.idplanoprev, ' ;

     if not (FRemoveContasAbertas) then
        sSQL := sSQL +  '        DECODE (PA.NOME,NULL, ''Plano - Patrocinadora não encontrada '' , PA.NOME ) AS NOME, '
     else
        sSQL := sSQL +
       '        DECODE (PA.NOME,NULL, ''Plano - Patrocinadora não encontrada '', PA.NOME || '' - '' || PPC.NOME) AS NOME, ';

        sSQL := sSQL +
       '        SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) AS SALDOANTERIOR, ' +
       '        0 AS RECEBTOPAGTO, ' +
       '        SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) AS SALDOATU ' +
       '     FROM ' +
       '        PORTADORCONTA C, ' +
       '        MOVIMFINANC M, ' +
       '        RATEIOFINANC R, ' +
       '        PESSOA PA, ' +
       '        planprevcontabil ppc ' +
       '     WHERE ' +
       '       (R.IDPATRO = PA.IDPESSOA(+)) AND ' ;

       case iStatus of
         0 : sSQL := sSQL + ' ( M.STATUSCONCILIA IN (''P'',''X'',''I'',''N'',''C'',''J'')) AND ' ;
         1 : sSQL := sSQL + ' ( M.STATUSCONCILIA IN (''X'',''I'')) AND ' ;
         2 : sSQL := sSQL + ' ( M.STATUSCONCILIA <> ''C'') AND ' ;
       end;

       if ( iConta = 0 ) then
          sSQL := sSQL + ' ( M.CODPORTADOR = C.CODPORTADOR )  AND '
          else
          sSQL := sSQL + ' ( M.CODPORTADOR = C.CODPORTADOR )  AND ' +
                         ' ( C.CODPORTADOR = ' + FloatToStr(iConta) + ') AND  ' ;

       sSQL := sSQL +


       '       (M.IDPESSOA = ' + FloatToStr(iIdEmpresa) + ' ) AND ' +
       '       ((C.FLGSTATUS = ''A'') OR (C.FLGSTATUS IS NULL)) AND ' +
       '       (M.CODLANCFINANC = R.CODLANCFINANC) and ' +
       '       (ppc.idplanoprev(+) = r.idplanoprev ) ' +
       '     GROUP BY ' +
       '        C.DESCRICAO, ' +
       '        C.CODPORTADOR, ' +
       '        r.idplanoprev, ' +
       '        ppc.nome, ' +
       '        R.IDPATRO, ' ;

       if FRemoveContasAbertas then
         sSQL := sSQL +
           'PA.NOME ' +
   //IGOR PENDENCIA 25868 - As contas zeradas não devem ser impressas
           ' HAVING SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) <> 0 ' +
           '     OR SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) <> 0 '
       else
         sSQL := sSQL +
           'PA.NOME) ' +
           'UNION ' +
       '   (SELECT ' +
       '       DECODE(C.DESCRICAO,NULL,''Sem conta selecionada'',C.DESCRICAO) AS DESCRICAO, ' +
       '       C.CODPORTADOR, ' +
       '       R.IDPATRO, ' +
       '       ppc.nome , ' +
       '       r.idplanoprev, ' +
       '       PA.NOME, ' +
       '       0 AS SALDOANTERIOR, ' +
       '       SUM(DECODE(DEBCRE,''D'',R.VALOR,-R.VALOR)) AS SALDO, ' +
       '       0 AS RECBTOPAGTO ' +
       '    FROM ' +
       '        DOCUMENTO D, ' +
       '        LANCTODOCUM L, ' +
       '        PORTADORFORMA P, ' +
       '        PORTADORCONTA C, ' +
       '        RATEIODOCUM R, ' +
       '        PESSOA PA, ' +
       '        PARAMFINANC PF, ' +
       '        planprevcontabil ppc ' +
       '    WHERE ' +
       '       ((D.STATUS <> 2) OR (D.STATUS IS NULL)) AND ' +
       '       ((D.OPERACAO = ''1 '') OR (D.OPERACAO = ''2 '') OR  ' +
       '         (D.OPERACAO = ''3 '') OR (D.OPERACAO = ''14'')) AND ' +
       '       (D.IDPESSOA = ' + FloatToStr(iIdEmpresa) + ') AND ' +
       '       (((PF.FLGCONFIRMARECPAG = ''S'') AND (D.FLGCONFIRMARECPAG = ''S'')) OR ' +
       '       (((PF.FLGCONFIRMARECPAG = ''N'') OR (PF.FLGCONFIRMARECPAG IS NULL)) AND ' +
       '       ((D.DATAPROGRAMADA = TO_DATE( ' + QuotedStr(sDataRef) + ' ,''DD/MM/YYYY''))))) AND ' +
       '       (D.CODDOCUMENTO = L.CODDOCUMENTO) AND ' +
       '       (D.OPERACAO = L.OPERACAO) AND ' +
       '       (D.CODDOCUMENTO = R.CODDOCUMENTO) AND ' +
       '       (R.IDPATRO = PA.IDPESSOA) AND ' +
       '       (L.ESTORNO IS NULL) AND ' +
       '       (D.CODPORTFORMA = P.CODPORTFORMA(+)) AND ' +
       '       (P.CODPORTADOR = C.CODPORTADOR(+)) AND ' +
       '       (D.IDPESSOA = PF.IDPESSOA) AND ' +
       '       (ppc.idplanoprev(+) = r.idplanoprev) and ' +
       '       ((C.FLGSTATUS = ''A'') OR (C.FLGSTATUS IS NULL)) ' ;

  if not ( FRemoveContasAbertas ) then
    sSQL := sSQL +

       '    GROUP BY ' +
       '      C.DESCRICAO, ' +
       '      C.CODPORTADOR, ' +
       '      ppc.nome, ' +
       '      R.IDPATRO, ' +
       '      r.idplanoprev, ' +
       '      PA.NOME ' +
       '       )) UN ' +
       'GROUP BY ' +
       '   UN.DESCRICAO, ' +
       '   UN.CODPORTADOR, ' +
       '   UN.IDPATRO, ' +
       '   UN.NOMEPlano, ' +
       '   UN.NOME, ' +
       '   UN.IDPLANOPREV ' +

   //IGOR PENDENCIA 25868 - As contas zeradas não devem ser impressas
       ' HAVING SUM(UN.SALDOANTERIOR)              <> 0 ' +
       '     OR SUM(UN.RECEBTOPAGTO)               <> 0 ' +
       '     OR SUM(UN.SALDOATU + UN.RECEBTOPAGTO) <> 0 ' +

       'ORDER BY ' +
       '   UN.DESCRICAO, ' +
       '   UN.NOME ' ;

       Result := GetDataPacket(sSQL);
end;



procedure TCtrlExtratoContas.SetRemoveContasAbertas(const Value: boolean);
begin
  FRemoveContasAbertas := Value;
end;



end.
