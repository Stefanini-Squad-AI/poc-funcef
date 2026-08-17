unit uCtrlDispFinanc;

interface

uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase, DbClient, uCMClientDataSet,
     uDbMovimFinanc, UCmSqlParams
     {$IFNDEF VERSAO0505} ,uCMTypes {$ENDIF};

type
   TCtrlDisponFinanc = Class(TCmControlObject)
   private
      F_rIDPessoa       : Double;
      F_rIDModulo       : Double;
      F_rIDUsuario      : Double;
      F_bUsaPlanoPatro  : Boolean;
      FcdsLancamento    : TCMClientDataSet;
      FDbMovimFinanc    : TDbMovimFinanc;
      _sql              : TCmSqlParams;

   public
      property cdsLancamento: TCMClientDataSet read FcdsLancamento write FcdsLancamento;
      property IDPessoa: Double read F_rIDPessoa write F_rIDPessoa ;
      property IDModulo: Double read F_rIDModulo write F_rIDModulo;
      property IDUsuario: Double read F_rIDUsuario write F_rIDUsuario;
      property UsaPlanoPatro: Boolean read F_bUsaPlanoPatro write F_bUsaPlanoPatro;

      constructor Create(rIDPessoa,rIDModulo,rIDUsuario: Double; bUsaPlanoPatro: Boolean); reintroduce;
      destructor Destroy; override;

      procedure OnCreateAppServer; override;

      function EncerraDisponibilidade(dDataRef: TDateTime): Boolean;
      function AplicaMarcacoesDisp: Boolean;
      function ListLancamentos(rIDPessoa: Double; dDataRef: TDateTime): OleVariant;
      function ListConsLancamentos(rIDPessoa, rIDPatro, rIDPlanoPrev: Double;
                                   dDataRef: TDateTime): OleVariant;
      function ListRelatDisp(rIDPessoa, rIDPatro, rIDPlanoPrev: Double;
                             dDataRef: TDateTime): OleVariant;
      function ListDispDivergentes(rIDPessoa: Double; sMesAno: String): OleVariant;


      function TestaDispFinanc(iIdPessoa,iIdUsuario : Integer;
                               dDataOper : TDateTime): Boolean;

      {function TestaDispFinanc(iIdPessoa,iIdUsuario : Integer;
                               dDataOper : TDateTime;
                               var bIncluiDisp : boolean): Boolean;}

      function IncluiDispFinanc(iIdPessoa, iIdUsuario,
                                iIdModuloOrig, iIdPlano,iIdPatro,
                                iCodDocumento,iCodLancFinanc: Integer;
                                fVlrDisp : Double;
                                dDataDisp : TDateTime;
                                sHistorico : String;
                                bIncluiDisp : boolean) : Boolean;

      function AlteraDispFinanc(iIdModulo, iCodDocumento,
                                iCodLancFinanc : Integer) : Boolean;


      function FlgIntegraDispFin:boolean;

      function SelecionaDispFinanc(dDataRef : TDateTime): OleVariant;

   protected
      procedure DoChangeDataBase; override;
   end;

implementation

{ TCtrlDsiponFinanc }

constructor TCtrlDisponFinanc.Create(rIDPessoa, rIDModulo,
  rIDUsuario: Double; bUsaPlanoPatro: Boolean);
begin
   inherited Create;

   F_rIDPessoa:=rIDPessoa;
   F_rIDModulo:=rIDModulo;
   F_rIDUsuario:=rIDUsuario;
   F_bUsaPlanoPatro:=bUsaPlanoPatro;
   FDbMovimFinanc:=TDbMovimFinanc.Create(Self);

  _sql               := TCmSqlParams.Create(nil);
  _sql.ControlObject := Self;

end;

destructor TCtrlDisponFinanc.Destroy;
begin
   inherited;
   FDbMovimFinanc.Free;
   if IsAppServer then FcdsLancamento.Free;

   _sql.Free;
   
end;

procedure TCtrlDisponFinanc.DoChangeDataBase;
begin
   inherited;
   FDbMovimFinanc.DataBaseName:=DataBaseName;
end;

procedure TCtrlDisponFinanc.OnCreateAppServer;
begin
   inherited;
   FcdsLancamento:=TCMClientDataSet.Create(nil);
end;

function TCtrlDisponFinanc.ListLancamentos(rIDPessoa: Double;
  dDataRef: TDateTime): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   M.*, '+
         '   P.DESCRICAO, '+
         '   DECODE(M.DATADISPFINANC,NULL,''N'',''S'') AS FLGDISP '+
         'FROM '+
         '   MOVIMFINANC M, '+
         '   PORTADORCONTA P '+
         'WHERE '+
         '   (M.CODPORTADOR = P.CODPORTADOR) AND'+
         '   ((M.DATADISPFINANC IS NULL) OR (M.DATADISPFINANC = '+
         '    TO_DATE('''+FormatDateTime('dd/mm/yyyy',dDataRef)+''', '+
              '''dd/mm/yyyy''))) AND '+
         '   (M.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '   (M.STATUSCONCILIA <> ''C'') '+
         'ORDER BY '+
         '   P.DESCRICAO, '+
         '   M.DATALANCFINAN, '+
         '   M.ENTRADASAIDA ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlDisponFinanc.ListConsLancamentos(rIDPessoa, rIDPatro, rIDPlanoPrev: Double;
  dDataRef: TDateTime): OleVariant;
var
   sSql : String;
begin
   sSql:=' SELECT '+
         '    U.DATALANCFINAN, '+
         '    U.NUMCHQBORDERO, '+
         '    U.HISTORICO, '+
         '    U.STATUSCONCILIA, '+
         '    U.ENTRADASAIDA, '+
         '    U.VALORLANCFINAN, '+
         '    U.CODPORTADOR, '+
         '    U.DESCRICAO, '+
         '    DECODE(U.CODLANCFINANC,-1,''Total Geral'', '+
         '           DECODE(U.CODLANCFINANC,0,''Total por Plano/Patro'', '+
         '           TO_CHAR(U.CODLANCFINANC))) AS CODLANCFINANC, '+
         '    U.DATADISPFINANC, '+
         '    U.ENTRADA, '+
         '    U.SAIDA, '+
         '    U.VALORAPLIC, '+
         '    U.VALORRESGATE, '+
         '    U.IDPLANOPREV, '+
         '    U.IDPATRO, '+
         '    U.NOMEPATRO, '+
         '    U.NOMEPLANO '+
         ' FROM '+
         '    ((SELECT '+
         '         TO_CHAR(M.DATALANCFINAN,''DD/MM/YYYY'') AS DATALANCFINAN, '+
         '         M.NUMCHQBORDERO, '+
         '         M.HISTORICO, '+
         '         M.STATUSCONCILIA, '+
         '         M.ENTRADASAIDA, '+
         '         M.VALORLANCFINAN, '+
         '         M.CODPORTADOR, '+
         '         P.DESCRICAO, '+
         '         M.CODLANCFINANC, '+
         '         M.DATADISPFINANC, '+
         '         SUM(DECODE(R.RECPAG,''R'',R.VALOR,0)) AS ENTRADA, '+
         '         SUM(DECODE(R.RECPAG,''P'',R.VALOR,0)) AS SAIDA, '+
         '         0 AS VALORAPLIC, '+
         '         0 AS VALORRESGATE, '+
         '         R.IDPLANOPREV, '+
         '         R.IDPATRO, '+
         '         PE.NOME AS NOMEPATRO, '+
         '         PC.NOME AS NOMEPLANO '+
         '      FROM '+
         '         MOVIMFINANC M, '+
         '         PORTADORCONTA P, '+
         '         RATEIOFINANC R, '+
         '         PESSOA PE, '+
         '         PLANPREVCONTABIL PC '+
         '      WHERE '+
         '         (R.IDPATRO = PE.IDPESSOA(+)) AND '+
         '         (R.IDPLANOPREV = PC.IDPLANOPREV(+)) AND '+
         '         (M.CODPORTADOR = P.CODPORTADOR) AND '+
         '         (M.CODLANCFINANC = R.CODLANCFINANC) AND '+
         '         (M.DATADISPFINANC = TO_DATE('''+
                    FormatDateTime('dd/mm/yyyy',dDataRef)+''',''dd/mm/yyyy'')) AND '+
         '         (M.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '         (M.STATUSCONCILIA <> ''C'') ';

   if (rIDPlanoPrev<>0) then
       sSql:=sSql+'         AND (R.IDPLANOPREV = '+FloatToStr(rIDPlanoPrev)+') ';

   if (rIDPatro<>0) then
       sSql:=sSql+'         AND (R.IDPATRO = '+FloatToStr(rIDPatro)+') ';

   sSql:=sSql+'      GROUP BY '+
              '         M.DATALANCFINAN, '+
              '         M.NUMCHQBORDERO, '+
              '         M.HISTORICO, '+
              '         M.STATUSCONCILIA, '+
              '         M.ENTRADASAIDA, '+
              '         M.VALORLANCFINAN, '+
              '         M.CODPORTADOR, '+
              '         P.DESCRICAO, '+
              '         M.CODLANCFINANC, '+
              '         M.DATADISPFINANC, '+
              '         R.IDPLANOPREV, '+
              '         R.IDPATRO, '+
              '         PE.NOME, '+
              '         PC.NOME ) '+
              'UNION ALL '+
              ' (SELECT '+
              '     '''' AS DATALANCFINAN, '+
              '     '''' AS NUMCHQBORDERO, '+
              '     '''' AS HISTORICO, '+
              '     '''' AS STATUSCONCILIA, '+
              '     '''' AS ENTRADASAIDA, '+
              '     0 AS VALORLANCFINAN, '+
              '     0  AS CODPORTADOR, '+
              '     ''-'' AS DESCRICAO, '+
              '     0 AS CODLANCFINANC, '+
              '     M.DATADISPFINANC, '+
              '     SUM(DECODE(R.RECPAG,''R'',R.VALOR,0)) AS ENTRADA, '+
              '     SUM(DECODE(R.RECPAG,''P'',R.VALOR,0)) AS SAIDA, '+
              '     DECODE(SIGN(SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1))),1, '+
              '            SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)),0) AS VALORAPLIC, '+
              '     DECODE(SIGN(SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1))),-1, '+
              '            SUM(DECODE(R.RECPAG,''P'',R.VALOR,R.VALOR*-1)),0) AS VALORRESGATE, '+
              '     R.IDPLANOPREV, '+
              '     R.IDPATRO, '+
              '     PE.NOME AS NOMEPATRO, '+
              '     PC.NOME AS NOMEPLANO '+
              ' FROM '+
              '    MOVIMFINANC M, '+
              '    PORTADORCONTA P, '+
              '    RATEIOFINANC R, '+
              '    PESSOA PE, '+
              '    PLANPREVCONTABIL PC '+
              ' WHERE '+
              '    (R.IDPATRO = PE.IDPESSOA(+)) AND '+
              '    (R.IDPLANOPREV = PC.IDPLANOPREV(+)) AND '+
              '    (M.CODPORTADOR = P.CODPORTADOR) AND '+
              '    (M.CODLANCFINANC = R.CODLANCFINANC) AND '+
              '    (M.DATADISPFINANC = TO_DATE('''+
               FormatDateTime('dd/mm/yyyy',dDataRef)+''',''dd/mm/yyyy'')) AND '+
              '    (M.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
              '    (M.STATUSCONCILIA <> ''C'') ';
              
   if (rIDPlanoPrev<>0) then
       sSql:=sSql+'    AND (R.IDPLANOPREV = '+FloatToStr(rIDPlanoPrev)+') ';

   if (rIDPatro<>0) then
       sSql:=sSql+'    AND (R.IDPATRO = '+FloatToStr(rIDPatro)+') ';

   sSql:=sSql+' GROUP BY '+
              '    M.DATADISPFINANC, '+
              '    R.IDPLANOPREV, '+
              '    R.IDPATRO, '+
              '    PE.NOME, '+
              '    PC.NOME) '+
              'UNION ALL '+
              ' (SELECT '+
              '     '''' AS DATALANCFINAN, '+
              '     '''' AS NUMCHQBORDERO, '+
              '     '''' AS HISTORICO, '+
              '     '''' AS STATUSCONCILIA, '+
              '     '''' AS ENTRADASAIDA, '+
              '     0 AS VALORLANCFINAN, '+
              '     0  AS CODPORTADOR, '+
              '     ''-'' AS DESCRICAO, '+
              '     -1 AS CODLANCFINANC, '+
              '     M.DATADISPFINANC, '+
              '     SUM(DECODE(R.RECPAG,''R'',R.VALOR,0)) AS ENTRADA, '+
              '     SUM(DECODE(R.RECPAG,''P'',R.VALOR,0)) AS SAIDA, '+
              '     DECODE(SIGN(SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1))),1, '+
              '            SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)),0) AS VALORAPLIC, '+
              '     DECODE(SIGN(SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1))),-1, '+
              '            SUM(DECODE(R.RECPAG,''P'',R.VALOR,R.VALOR*-1)),0) AS VALORRESGATE, '+
              '     0 AS IDPLANOPREV, '+
              '     0 AS IDPATRO, '+
              '     '''' AS NOMEPATRO, '+
              '     '''' AS NOMEPLANO '+
              '  FROM '+
              '     MOVIMFINANC M, '+
              '     PORTADORCONTA P, '+
              '     RATEIOFINANC R, '+
              '     PESSOA PE, '+
              '     PLANPREVCONTABIL PC '+
              '  WHERE '+
              '     (R.IDPATRO = PE.IDPESSOA(+)) AND '+
              '     (R.IDPLANOPREV = PC.IDPLANOPREV(+)) AND '+
              '     (M.CODPORTADOR = P.CODPORTADOR) AND '+
              '     (M.CODLANCFINANC = R.CODLANCFINANC) AND '+
              '     (M.DATADISPFINANC = TO_DATE('''+
              FormatDateTime('dd/mm/yyyy',dDataRef)+''',''dd/mm/yyyy'')) AND '+
              '     (M.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
              '     (M.STATUSCONCILIA <> ''C'') ';

   if (rIDPlanoPrev<>0) then
       sSql:=sSql+'    AND (R.IDPLANOPREV = '+FloatToStr(rIDPlanoPrev)+') ';

   if (rIDPatro<>0) then
       sSql:=sSql+'    AND (R.IDPATRO = '+FloatToStr(rIDPatro)+') ';

   sSql:=sSql+'  GROUP BY M.DATADISPFINANC)) U '+
              'ORDER BY '+
              '   U.DATADISPFINANC, '+
              '   U.IDPLANOPREV, '+
              '   U.IDPATRO, '+
              '   U.DESCRICAO, '+
              '   U.DATALANCFINAN, '+
              '   U.ENTRADASAIDA ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlDisponFinanc.ListRelatDisp(rIDPessoa, rIDPatro,
  rIDPlanoPrev: Double; dDataRef: TDateTime): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   TO_CHAR(M.DATALANCFINAN,''DD/MM/YYYY'') AS DATALANCFINAN, '+
         '   M.NUMCHQBORDERO, '+
         '   M.HISTORICO, '+
         '   M.STATUSCONCILIA, '+
         '   M.ENTRADASAIDA, '+
         '   M.VALORLANCFINAN, '+
         '   M.CODPORTADOR, '+
         '   P.DESCRICAO, '+
         '   M.CODLANCFINANC, '+
         '   M.DATADISPFINANC, '+
         '   E.NOMEEMPRESA, '+
         '   SUM(DECODE(R.RECPAG,''R'',R.VALOR,0)) AS ENTRADA, '+
         '   SUM(DECODE(R.RECPAG,''P'',R.VALOR,0)) AS SAIDA, '+
         '   SUM(DECODE(R.RECPAG,''R'',R.VALOR,R.VALOR*-1)) AS SALDOAPLICRESTATE, '+
         '   R.IDPLANOPREV, '+
         '   R.IDPATRO, '+
         '   PE.NOME AS NOMEPATRO, '+
         '   PC.NOME AS NOMEPLANO '+
         'FROM '+
         '   MOVIMFINANC M, '+
         '   PORTADORCONTA P, '+
         '   RATEIOFINANC R, '+
         '   PESSOA PE, '+
         '   PLANPREVCONTABIL PC, '+
         '   EMPRESAPROP E '+
         'WHERE '+
         '   (R.IDPATRO = PE.IDPESSOA(+)) AND '+
         '   (R.IDPLANOPREV = PC.IDPLANOPREV(+)) AND '+
         '   (M.CODPORTADOR = P.CODPORTADOR) AND '+
         '   (M.DATADISPFINANC = TO_DATE('''+
              FormatDateTime('dd/mm/yyyy',dDataRef)+''',''dd/mm/yyyy'')) AND '+
         '   (M.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '   (M.STATUSCONCILIA <> ''C'') AND '+
         '   (M.CODLANCFINANC = R.CODLANCFINANC) AND '+
         '   (E.IDPESSOA = M.IDPESSOA) ';

   if (rIDPlanoPrev<>0) then
       sSql:=sSql+'    AND (R.IDPLANOPREV = '+FloatToStr(rIDPlanoPrev)+') ';

   if (rIDPatro<>0) then
       sSql:=sSql+'    AND (R.IDPATRO = '+FloatToStr(rIDPatro)+') ';

   sSql:=sSql+'GROUP BY '+
              '   M.DATALANCFINAN, '+
              '   M.NUMCHQBORDERO, '+
              '   M.HISTORICO, '+
              '   M.STATUSCONCILIA, '+
              '   M.ENTRADASAIDA, '+
              '   M.VALORLANCFINAN, '+
              '   M.CODPORTADOR, '+
              '   P.DESCRICAO, '+
              '   M.CODLANCFINANC, '+
              '   M.DATADISPFINANC, '+
              '   E.NOMEEMPRESA, '+
              '   R.IDPLANOPREV, '+
              '   R.IDPATRO, '+
              '   PE.NOME, '+
              '   PC.NOME '+
              'ORDER BY '+
              '   M.DATADISPFINANC, '+
              '   R.IDPLANOPREV, '+
              '   R.IDPATRO, '+
              '   P.DESCRICAO, '+
              '   M.DATALANCFINAN, '+
              '   M.ENTRADASAIDA ';

   Result:=GetDataPacket(sSql);
end;

function TCtrlDisponFinanc.ListDispDivergentes(rIDPessoa: Double;
  sMesAno: String): OleVariant;
var
   sSql : String;
begin
   sSql:='SELECT '+
         '   M.DataDispFinanc, '+
         '   PC.NOME AS NOMEPLANO, '+
         '   PE.NOME AS NOMEPATRO '+
         'FROM '+
         '   MovimFinanc M, '+
         '   RateioFinanc R, '+
         '   PESSOA PE, '+
         '   PLANPREVCONTABIL PC '+
         'WHERE '+
         '   (M.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '   (R.IDPATRO = PE.IDPESSOA(+)) AND '+
         '   (R.IDPLANOPREV = PC.IDPLANOPREV(+)) AND '+
         '   (M.CodLancFinanc=R.CodLancFinanc) AND '+
         '   (TO_CHAR(M.DataDispFinanc,''MM/YYYY'') = '''+sMesAno+''' ) AND '+
         '   (SELECT Sum(Decode(R1.RECPAG,''R'',R1.Valor,-R1.Valor)) AS Total '+
         '    FROM '+
         '       MovimFinanc M1, '+
         '       RateioFinanc R1 '+
         '    WHERE '+
         '       (M1.IDPESSOA = '+FloatToStr(rIDPessoa)+') AND '+
         '       (M1.CodLancFinanc = R1.CodLancFinanc) AND '+
         '       (M1.DataDispFinanc = M.DataDispFinanc) AND '+
         '       ((R1.IDPATRO = R.IDPATRO) OR ((R1.IDPATRO IS NULL) AND (R.IDPATRO IS NULL))) AND '+
         '       ((R1.IDPLANOPREV = R.IDPLANOPREV) OR '+
         '        ((R1.IDPLANOPREV IS NULL) AND (R.IDPLANOPREV IS NULL))))<> 0 '+
         'GROUP BY '+
         '   M.DataDispFinanc, '+
         '   PC.NOME , '+
         '   PE.NOME ';
   Result:=GetDataPacket(sSql);
end;

function TCtrlDisponFinanc.EncerraDisponibilidade(
  dDataRef: TDateTime): Boolean;
begin
   MessageInfo:='';
   if ConnectionSide=cnsClient then
    begin
       Result:=Connection.AppServer.EncerraDisponibilidade(dDataRef,
                                                           F_rIDPessoa,
                                                           F_rIDModulo,
                                                           F_rIDUsuario,
                                                           F_bUsaPlanoPatro);
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result:=ApplyCds(FcdsLancamento,FDbMovimFinanc,[],[]);
          if not(Result) then
           begin
              MessageInfo:=FDbMovimFinanc.MessageInfo;
              Rollback;
              Exit;
           end
          else
           begin
              Result:=ExecSQL('UPDATE PARAMFINANC SET DATABLOQDISPFINAN = TO_DATE('''+
                              FormatDateTime('dd/mm/yyyy',dDataRef)+''',''DD/MM/YYYY'') '+
                              'WHERE (IDPESSOA = '+FloatToStr(F_rIDPessoa)+') ');
              if not(Result) then
               begin
                  Rollback;
                  Exit;
               end
              else
               Commit;
           end;
       except
          on E:Exception do
          begin
             Result := False;
             MessageInfo := E.Message;
             Rollback;
          end;
       end;
    end;
end;

function TCtrlDisponFinanc.AplicaMarcacoesDisp: Boolean;
begin
   MessageInfo:='';
   if ConnectionSide=cnsClient then
    begin
       Result:=Connection.AppServer.AplicaMarcacoesDisp(FcdsLancamento.Data,
                                                        F_rIDPessoa,
                                                        F_rIDModulo,
                                                        F_rIDUsuario,
                                                        F_bUsaPlanoPatro);
       if not Result then MessageInfo:=Connection.AppServer.MessageInfo;
    end
   else
    begin
       try
          StartTransaction;

          Result:=ApplyCds(FcdsLancamento,FDbMovimFinanc,[],[]);
          if not(Result) then
           begin
              MessageInfo:=FDbMovimFinanc.MessageInfo;
              Rollback;
              Exit;
           end;
          Commit;
       except
          on E:Exception do
          begin
             Result := False;
             MessageInfo := E.Message;
             Rollback;
          end;
       end;
    end;
end;

function TCtrlDisponFinanc.TestaDispFinanc(iIdPessoa,iIdUsuario : Integer;
                                           dDataOper : TDateTime): Boolean;
var
   sSql,fDispBloq,fUsuBloq : string;
   dDataDisp : TDateTime;
begin
   Result := True;

   if FlgIntegraDispFin then // Verifico se Faz Integracao com Disp. Financeira
   begin
      sSql := 'SELECT                                             ' +
              '   PAR.FLGDISPBLOQ, PAR.DATABLOQDISPFINAN,         ' +
              '   USU.IDUSUARIO, USU.FLGDISPFINANC                ' +
              'FROM  PARAMFINANC PAR,USUARIOSISTEMA USU           ' +
              'WHERE                                              ' +
              '   (PAR.IDPESSOA =  '+IntToStr(iIdPessoa)+' )      ' +
              '   AND (USU.IDUSUARIO = '+IntToStr(iIdUsuario)+' ) ' ;

      _Cds.Data  := GetDataPacket(sSql);

      if not _Cds.isEmpty then
      begin
         dDataDisp := _Cds.FieldByName('DATABLOQDISPFINAN').AsDateTime;
         // Somente valido se o lancto for no mesmo dia da Disponibilidade
         if dDataOper = dDataDisp then
         begin
            fDispBloq := _Cds.FieldByName('FLGDISPBLOQ').AsString;
            fUsuBloq  := _Cds.FieldByName('FLGDISPFINANC').AsString;

            // Verifico se a Disp. está bloqueada para lanctos
            if fDispBloq = 'Y' then
            begin
               if fUsuBloq <> 'Y' then
                  Result := False;
            end;
         end;
      end;
   end;
end;

function TCtrlDisponFinanc.FlgIntegraDispFin:boolean;
var
  sSql :string;
begin
   sSql := 'SELECT FLGINTDISPFIN FROM PARAMFINANC ';

    _cds.Data := GetDataPacket(sSql);
   if Not _cds.isEmpty Then
   begin
      if _cds.FieldByName('FLGINTDISPFIN').AsString = 'Y' then
         Result := True
      else
         Result := False;
   end;
end;

function TCtrlDisponFinanc.IncluiDispFinanc(iIdPessoa, iIdUsuario,
                                            iIdModuloOrig, iIdPlano, iIdPatro,
                                            iCodDocumento, iCodLancFinanc : Integer;
                                            fVlrDisp : Double;
                                            dDataDisp : TDateTime;
                                            sHistorico : String;
                                            bIncluiDisp : boolean) : Boolean;
var fIdDispFinanc:integer;
    sMensagem : String;
begin
   {TIPOREG := A = SALDO INICIAL
               I = INVESTIMENTO
               O = OUTROS MODULOS
               S = SALDO FINAL
    TIPO := B = BLOQUEIO
            L = LANCAMENTOS}
   if ConnectionSide = cnsClient then
   begin
      Result :=
         Connection.AppServer.IncluiDispFinanc(iIdPessoa, iIdUsuario,
                                               iIdModuloOrig, iIdPlano, iIdPatro,
                                               iCodDocumento,iCodLancFinanc,
                                               fVlrDisp, dDataDisp,
                                               sHistorico,bIncluiDisp);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
      if (bIncluiDisp) then
      begin
         Try
            StartTransaction;
            // DISPFINANC
            fIdDispFinanc := GetSequence('DISPFINANC');
            _sql.SQL.Clear;
            _sql.SQL.Add(' INSERT INTO DISPFINANC ');
            _sql.SQL.Add(' (IDDISPFINANC,VLRDISPFINANC,TIPOREG,IDMODULOORIGEM,');
            _sql.SQL.Add('  TIPO,HISTORICO,DATADISPFINANC, ');
            _sql.SQL.Add('  CODDOCUMENTO,CODLANCFINANC) ');
            _sql.SQL.Add(' VALUES ');
            _sql.SQL.Add(' (:IDDISPFINANC,:VLRDISPFINANC,:TIPOREG,:IDMODULOORIGEM,');
            _sql.SQL.Add('  :TIPO,:HISTORICO,:DATADISPFINANC, ');
            _sql.SQL.Add('  :CODDOCUMENTO,:CODLANCFINANC) ');
            _sql.Prepare;
            _sql.ParamByName('IDDISPFINANC').asInteger    := fIdDispFinanc;
            _sql.ParamByName('VLRDISPFINANC').asFloat     := fVlrDisp;

            if iIdModuloOrig = 79 then
               _sql.ParamByName('TIPOREG').asString := 'I'
            else
               _sql.ParamByName('TIPOREG').asString := 'O';

            _sql.ParamByName('IDMODULOORIGEM').asInteger  := iIdModuloOrig;

            if iIdModuloOrig = 9 then
               _sql.ParamByName('TIPO').asString := 'B'
            else
               _sql.ParamByName('TIPO').asString := 'L';


            _sql.ParamByName('HISTORICO').asString        := sHistorico;
            _sql.ParamByName('DATADISPFINANC').asDateTime := dDataDisp;
            if iCodLancFinanc = -1 then
               _sql.ParamByName('CODLANCFINANC').Clear
            else
               _sql.ParamByName('CODLANCFINANC').AsInteger := iCodLancFinanc;

            if iCodDocumento = -1 then
               _sql.ParamByName('CODDOCUMENTO').Clear
            else
               _sql.ParamByName('CODDOCUMENTO').AsInteger := iCodDocumento;

            if not ExecSQL(_sql.SQLChanged,False) Then
               Raise Exception.Create(MessageInfo);

            // RATEIODISPFINANC
            _sql.SQL.Clear;
            _sql.SQL.Add(' INSERT INTO RATEIODISPFINANC ');
            _sql.SQL.Add(' (IDDISPFINANC,IDPLANO,IDPATRO,');
            _sql.SQL.Add('  VLRRATEIO,IDPESSOA) ');
            _sql.SQL.Add(' VALUES ');
            _sql.SQL.Add(' (:IDDISPFINANC,:IDPLANO,:IDPATRO,');
            _sql.SQL.Add('  :VLRRATEIO,:IDPESSOA) ');

            _sql.Prepare;

            _sql.ParamByName('IDDISPFINANC').AsInteger := fIdDispFinanc;
            _sql.ParamByName('IDPLANO').AsInteger      := iIdPlano;
            _sql.ParamByName('IDPATRO').AsInteger      := iIdPatro;
            _sql.ParamByName('VLRRATEIO').AsFloat      := fVlrDisp;
            _sql.ParamByName('IDPESSOA').AsInteger     := iIdPessoa;

            if not ExecSQL(_sql.SQLChanged,False) Then
               Raise Exception.Create(MessageInfo);

            Commit;
            Result := True;
         except
            on E:Exception do
            begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            end;
         end;
      end;
   end;
end;

function TCtrlDisponFinanc.AlteraDispFinanc(iIdModulo, iCodDocumento,
                                            iCodLancFinanc : integer): boolean;
begin
   if ConnectionSide = cnsClient then
   begin
      Result :=
         Connection.AppServer.AlteraDispFinanc(iIdModulo, iCodDocumento,
                                               iCodLancFinanc);
      If Not Result Then
         MessageInfo := Connection.AppServer.MessageInfo;
   End Else
   Begin
      if FlgIntegraDispFin then
      begin
         Try
            StartTransaction;
            // DISPFINANC
            _sql.SQL.Clear;
            _sql.SQL.Add(' UPDATE DISPFINANC SET FLGEXCLUSAO = ''Y'' ');
            _sql.SQL.Add(' WHERE ');
            if iIdModulo = 9 then
               _sql.SQL.Add(' CODLANCFINANC = :CODLANCFINANC ')
            else
               _sql.SQL.Add(' CODDOCUMENTO = :CODDOCUMENTO ');

            _sql.Prepare;
            if iIdModulo = 9 then
               _sql.ParamByName('CODLANCFINANC').AsInteger := iCodLancFinanc
            else
               _sql.ParamByName('CODDOCUMENTO').AsInteger := iCodDocumento;

            if not ExecSQL(_sql.SQLChanged,False) Then
               Raise Exception.Create(MessageInfo);

            Commit;
            Result := True;
         except
            on E:Exception do
            begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            end;
         end;
      end;
   end;
end;

function TCtrlDisponFinanc.SelecionaDispFinanc(dDataRef:TDateTime): OleVariant;
var sSql : string;
begin
   sSql := 'SELECT                                    '+
           '  IDDISPFINANC,DATADISPFINANC,IDMODULO,   '+
           '  IDMODULOORIGEM,HISTORICO,VLRDISPFINANC, '+
           '  TIPO,FLGEXCLUSAO,TIPOREG                '+
           'FROM DISPFINANC                           '+
           'WHERE                                     '+
           '   (DATADISPFINANC = TO_DATE('''+DateToStr(dDataRef)+''',''DD/MM/YYYY'')) ';

   Result := GetDataPacket(sSql);
end;

end.
