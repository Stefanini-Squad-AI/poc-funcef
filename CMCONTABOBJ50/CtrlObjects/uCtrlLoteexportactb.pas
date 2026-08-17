Unit uCtrlLoteexportactb;

Interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbLoteexportactb, uSistema, DB, uDataBase,
  DbClient, uCMTypes, Classes, uCtrlPadroes, uCMClientDataSet;

Type
  TCtrlLoteexportactb = Class(TCmControlObject)
  protected
    Procedure DoChangeDataBase; override;
    Procedure OnCreateAppServer; override;
    Procedure AfterInitialize; override;
  private
    _DbLoteexportactb: TDbLoteexportactb;
    _Padroes: TCtrlPadroes;
    Fcds: TClientDataSet;
    aDeParaExterno : array of array of string;

    // Eventos dos ClientDataSet´s
    Procedure Setcds(Const Value: TClientDataSet);
    Function CarregaDeparaExterno(Const sOrigem:String = ''): boolean;
  public
    Property cds: TClientDataSet read Fcds write Setcds;
    Constructor Create; override;
    Destructor Destroy; override;
    Function ListLoteexportactb(idloteExportaCtb : integer = 0; sdataLote : string = ''; idUsuario: Integer = 0; const sTipoLote: string = ''): OleVariant;
    Function GravarLoteexportactb(const dados :Olevariant; const sDescricao: string = ''; const sTipoLote: string = ''; const iNumLote:Integer = -1; const bApropriado:Boolean = False): Integer;
    Function ListaLancamentos(const DataIni, DataFim : TDateTime; const sIdModulos: string ) : Olevariant;
    Function ListaLancRecPag (const DataIni, DataFim : TDateTime; const iTipoData:Integer; const sIdModulos, sRecPag: string; const bApropriado: Boolean = True) : Olevariant;
    Function ContaPlanilhas(const DataIni, DataFim : TDateTime; const sIdModulos: string ) : Integer;
    Function ExcluiLoteExportaCtb(const IdLoteExportaCtb : Integer): Boolean;
    Function ExcluiBaixaCAP(const IdLoteExportaCtb: Integer): Boolean;
    Function GetCodExterno(const atributo, vlrcm: string): string;
  End;

Implementation

{ TCtrlLoteexportactb }

Constructor TCtrlLoteexportactb.Create;
Begin
  Inherited;
  _DbLoteexportactb := TDbLoteexportactb.Create(self);
  _Padroes := TCtrlPadroes.Create;
End;

Destructor TCtrlLoteexportactb.Destroy;
Begin
  _DbLoteexportactb.Free;
  _Padroes.Free;
  If isAppServer Then
    FCds.Free;
  Inherited;
End;

Procedure TCtrlLoteexportactb.DoChangeDataBase;
Begin
  Inherited;
  _DbLoteexportactb.DataBaseName := DataBaseName;
End;

Function TCtrlLoteexportactb.ListLoteexportactb(idloteExportaCtb : integer = 0; sdataLote : string = ''; idUsuario: Integer = 0; const sTipoLote: string = ''): OleVariant;
Var
  ssql: String;
Begin
  ssql :=  'SELECT IDLOTEEXPORTACTB, DESCLOTE, TIPOLOTE, DATALOTE, IDUSUARIO, NUMLOTE FROM LOTEEXPORTACTB WHERE 1 = 1 ';
  if idloteExportaCtb <> 0 then
    sSql := sSql + ' AND IDLOTEEXPORTACTB = ' + IntToStr(idloteExportaCtb);
  if sdataLote <> '' then
    sSql := sSql + ' AND DATALOTE = TO_DATE('+ quotedStr(sdataLote)+', ''DD/MM/YYYY'')';
  if idUsuario <> 0 then
    sSql := sSql + ' AND IDUSUARIO = ' + IntToStr(idusuario);
  if sTipoLote <> '' then
    sSql := sSql + ' AND TIPOLOTE = ' + QuotedStr(sTipoLote);
  Result := GetDataPacket(ssql);
End;

Procedure TCtrlLoteexportactb.Setcds(Const Value: TClientDataSet);
Begin
  Fcds := Value;
End;

Function TCtrlLoteexportactb.GravarLoteexportactb(const dados :Olevariant;
                                                  const sDescricao: string = '';
                                                  const sTipoLote:string = '';
                                                  const iNumLote:Integer = -1;
                                                  const bApropriado:Boolean = False): Integer;
Var
  sChave, sSql: String;
  cdsAux : TclientDataSet;
  bInseriu : Boolean;
Begin
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravarLoteexportactb(dados, sDescricao, sTipoLote);
    If Result = -1 Then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    Try
      Result      := -1;
      cdsAux      := TclientDataSet.Create(nil);
      cdsAux.Data := dados;
      sChave      := '';
      StartTransaction;
      if not cdsAux.Eof then begin
        // Cria o lote
        cds.Insert;
        cds.FieldByName('IDUSUARIO').asInteger := sistema.IdUsuario;
        cds.FieldByName('DATALOTE').asDateTime := now;
        cds.FieldByName('DESCLOTE').asString   := sDescricao;
        cds.FieldByName('TIPOLOTE').asString   := sTipoLote;
        if iNumLote > 0 then
          cds.FieldByName('NUMLOTE').asInteger := iNumLote;
        cds.Post;
        if not ApplyCds(Cds, _DbLoteexportactb, [], []) then
           raise Exception.create(_DbLoteexportactb.MessageInfo);

        // Atualiza o id do lote nas planilhas exportadas
        cdsAux.First;
        sChave := '';
        while (not cdsAux.Eof) do begin
           if sTipoLote = 'C' then begin   // Lançamentos Contábeis
              if sChave <> cdsAux.FieldByName('PLNCODIGO').AsString then begin
                 if not execSql(' UPDATE PLANILHA SET IDLOTEEXPORTACTB = '+ _DbLoteexportactb.Idloteexportactb.asString +
                                ' WHERE PLNCODIGO = '+ cdsAux.fieldByName('PLNCODIGO').asString) then
                    raise Exception.create('Erro ao atualizar a Planilha');
                 sChave := cdsAux.fieldByName('PLNCODIGO').asString;
              end;
           end;
           if sTipoLote[1] in ['R','P'] then begin  // Contas a Pagar e Receber
              sSql := ' UPDATE LANCTODOCUM SET IDLOTEEXPORTACTB = '+ _DbLoteexportactb.Idloteexportactb.asString +
                      '  WHERE CODDOCUMENTO = '+ cdsAux.fieldByName('CODDOCUMENTO').asString;

              if bApropriado then
                   sSql := sSql + ' AND RTRIM(OPERACAO) IN(''2'',''4'') '+#13
              else sSql := sSql + ' AND RTRIM(OPERACAO) = ''5'' '+#13;

              if not execSql(sSql) then
                 raise Exception.create('Erro ao atualizar o Documento: ' +#13+ MessageInfo);
           end;

           cdsAux.Next;
        end;
      end;

      Commit;
      Result := _DbLoteexportactb.Idloteexportactb.asInteger;
    Except
      On E: Exception Do Begin
        Result := -1;
        Rollback;
        MessageInfo := E.Message;
      End;
    End;
  End;
  cdsAux.Free;
End;


Procedure TCtrlLoteexportactb.OnCreateAppServer;
Begin
  Inherited;
  FCds := TClientDataSet.Create(Nil);
End;



Procedure TCtrlLoteexportactb.AfterInitialize;
Begin
  Inherited;
  _Padroes.InitializeAs(Self);
  _Padroes.OpenTransaction := false;
End;

function TCtrlLoteexportactb.ListaLancamentos(const DataIni, DataFim: TDateTime; const sIdModulos: string): Olevariant;
var sSql : string;
begin
  CarregaDeparaExterno('C');
  sSql := 'SELECT /*+RULE*/ PL.PLNCODIGO, PL.IDMODULO AS COD_PROCESSO, '+#13+
          '       PL.IDPESSOA AS COD_EMPRESA,        '+#13+
          '       LC.IDPLANOPREV AS COD_UNIDADE,     '+#13+
          '       TO_CHAR(SYSDATE, ''YYYYMMDD'') AS DATA_PROCESSAMENTO, '+#13+
          '       LC.LACNUMLAN AS SEQ_MOVIMENTO,     '+#13+
          '       LC.PLANO AS COD_PLANO_CONTAS,      '+#13+
          '       LC.PLACONTA AS COD_CONTA_CONTABIL, '+#13+
          '       LC.LACDEBCRE AS DEBITO_CREDITO,    '+#13+
          '       LC.LACVALOR AS VAL_LANCAMENTO,     '+#13+
          '       PL.PLNCODIGO AS NUM_DOCUMENTO,     '+#13+
          '       LC.LACHIST1 || '' '' || LC.LACHIST2 || '' '' || LC.LACHIST3 || '' '' || LC.LACHIST4 || '' '' || LC.LACHIST5 AS COMPLEMENTO_HISTORICO, '+#13+
          '       TO_CHAR(PL.PLNDATDIA, ''YYYYMMDD'') AS DATA_CONTABILIZACAO, '+#13+
          '       CC.CODCENTROCUSTO AS COD_CENTRO_CUSTO,  P.MASCARA,          '+#13+
          '       M.NOMEMODULO                                                '+#13+
          '  FROM PLANILHA PL, LANCAMENTO LC, CENTCUST CC, PLANO P, MODULO M  '+#13+
          ' WHERE PL.PLNCODIGO = LC.PLNCODIGO              '+#13+
          '   AND LC.CODCENTROCUSTO = CC.CODCENTROCUSTO(+) '+#13+
          '   AND LC.IDMODULO = M.IDMODULO(+)              '+#13+
          '   AND LC.PLANO = P.PLANO(+)                    '+#13+
          '   AND PL.IDLOTEEXPORTACTB IS NULL              '+#13;

  if (trim(dateToStr(DataIni)) <> '') and (trim(dateToStr(DataFim)) <> '') then
    sSql := sSql + ' AND PL.PLNDATDIA BETWEEN TO_DATE( '+ quotedStr(dateToStr(DataIni)) + ', ''DD/MM/YYYY'' ) AND TO_DATE( '+ quotedStr(dateToStr(DataFim)) + ', ''DD/MM/YYYY'' ) '+#13;

  if trim(sIdModulos) <> '' then
    sSql := sSql + ' AND PL.IDMODULO IN ('+ sIdModulos +')'+#13;

  sSql := sSql + ' ORDER BY NUM_DOCUMENTO ASC, SEQ_MOVIMENTO ';

  result := GetDataPacket(sSql);

end;

function TCtrlLoteexportactb.ContaPlanilhas(const DataIni, DataFim: TDateTime; const sIdModulos: string): Integer;
  var ssql : string;
  cds : TclientDataSet;
begin
  result := 0;
  cds := TclientDataSet.Create(nil);
  sSql := '';
  sSql := sSql + ' SELECT /*+RULE*/ DISTINCT PL.PLNCODIGO FROM PLANILHA PL WHERE 1 = 1 ';

  if (trim(dateToStr(DataIni)) <> '') and (trim(dateToStr(DataFim)) <> '') then
    sSql := sSql + ' AND PL.PLNDATDIA BETWEEN TO_DATE( '+ quotedStr(dateToStr(DataIni)) + ', ''DD/MM/YYYY'' ) AND TO_DATE( '+ quotedStr(dateToStr(DataFim)) + ', ''DD/MM/YYYY'' ) ';

  if trim(sIdModulos) <> '' then
    sSql := sSql + ' AND PL.IDMODULO IN ('+ sIdModulos +')';

  cds.Data := getDataPacket(sSql);
  result := cds.RecordCount;
  cds.Free;
end;

function TCtrlLoteexportactb.ExcluiLoteExportaCtb(const IdLoteExportaCtb : integer): Boolean;
begin
  Result := False;
  try
    StartTransaction;

    // Carrega informações do lote
    _DbLoteexportactb.Idloteexportactb.AsInteger := IdLoteExportaCtb;
    _DbLoteexportactb.LoadFromDb;

    if _DbLoteexportactb.TipoLote.AsString = 'P' then begin
       if not ExcluiBaixaCAP( IdLoteExportaCtb ) then
          raise exception.create( messageinfo );
    end;

    if _DbLoteexportactb.TipoLote.AsString = 'C' then
         result := ExecSql(' UPDATE PLANILHA SET IDLOTEEXPORTACTB = NULL WHERE IDLOTEEXPORTACTB = '+ intToStr(IdLoteExportaCtb))
    else result := ExecSql(' UPDATE LANCTODOCUM SET IDLOTEEXPORTACTB = NULL WHERE IDLOTEEXPORTACTB = '+ intToStr(IdLoteExportaCtb));

    result := result and ExecSql(' DELETE FROM LOTEEXPORTACTB WHERE IDLOTEEXPORTACTB = '+ intToStr(IdLoteExportaCtb));

    if Result then
      Commit;
  except
      On E: Exception Do Begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      End;
  end;
end;


function TCtrlLoteexportactb.ExcluiBaixaCAP(const IdLoteExportaCtb: Integer): Boolean;
var cdsTemp : TCMClientDataSet;
    bAprop, bBaixa : Boolean;
    sSql : String;
begin
   try
      try
         Result  := True;
         cdsTemp := TCMClientDataSet.Create( nil );
         // Verifica se houve registros de apropriação no lote
         sSql := 'SELECT COUNT(*) AS QTDE         '+#13+
                 '  FROM LANCTODOCUM              '+#13+
                 ' WHERE RTRIM(OPERACAO)  = ''2'' '+#13+
                 '   AND IDLOTEEXPORTACTB = ' + IntToStr( IdLoteExportaCtb );
         cdsTemp.Data := GetDataPacket( sSql );
         bAprop := (cdsTemp.FieldByName('QTDE').AsInteger > 0);

         // Verifica se houve registros de baixa no mesmo lote
         sSql := 'SELECT COUNT(*) AS QTDE         '+#13+
                 '  FROM LANCTODOCUM              '+#13+
                 ' WHERE RTRIM(OPERACAO)  = ''5'' '+#13+
                 '   AND IDLOTEEXPORTACTB = ' + IntToStr( IdLoteExportaCtb );
         cdsTemp.Data := GetDataPacket( sSql );
         bBaixa := (cdsTemp.FieldByName('QTDE').AsInteger > 0);

         // Se houve apropriação e baixa no mesmo lote, todas as baixas foram automática
         if (bAprop = True) and (bBaixa = True) then begin
            // Volta o status do documento
            sSql := 'UPDATE DOCUMENTO SET STATUS = 0                      '+#13+
                    ' WHERE CODDOCUMENTO IN( SELECT DISTINCT CODDOCUMENTO '+#13+
                    '                          FROM LANCTODOCUM           '+#13+
                    '                         WHERE IDLOTEEXPORTACTB = ' + IntToStr(idLoteExportaCtb) + ' )';
            if not ExecSQL( sSql ) then
               raise exception.Create( messageInfo );

            // Exclui os registros de baixa da RecbtoPagto
            sSql := 'DELETE FROM RECBTOPAGTO                             '+#13+
                    ' WHERE NUMLANCTO IN (SELECT NUMLANCTO               '+#13+
                    '                       FROM LANCTODOCUM             '+#13+
                    '                      WHERE RTRIM(OPERACAO) = ''5'' '+#13+
                    '                        AND IDLOTEEXPORTACTB = ' + IntToStr( IdLoteExportaCtb ) + ' )';
            if not ExecSQL( sSql ) then
               raise exception.Create( messageInfo );

            // Exclui os registros de baixa
            sSql := 'DELETE FROM LANCTODOCUM        '+#13+
                    ' WHERE RTRIM(OPERACAO) = ''5'' '+#13+
                    '   AND IDLOTEEXPORTACTB = ' + IntToStr( IdLoteExportaCtb );
            if not ExecSQL( sSql ) then
               raise exception.Create( messageInfo );
         end;
      except
         On E: Exception Do Begin
           Result := False;
           MessageInfo := E.Message;
         End;
      end;
   finally
      FreeAndNil( cdsTemp );
   end;
end;



function TCtrlLoteexportactb.CarregaDeparaExterno(Const sOrigem:String): Boolean;
var  cdsDeparaExterno : TClientDataSet;
     i, j : integer;
     sSql : String;
begin
  sSql := 'SELECT * FROM DEPARAEXTERNO ';
  if sOrigem = 'C' then
     sSql := sSql + ' WHERE FLGORIGEM IS NULL OR FLGORIGEM = ' + QuotedStr(sOrigem);

  if sOrigem[1] in['R','P'] then
     sSql := sSql + ' WHERE FLGORIGEM IS NULL ' +#13+
                       ' OR FLGORIGEM = ''F'' ' +#13+
                       ' OR FLGORIGEM = ' + QuotedStr(sOrigem);

  cdsDeparaExterno      := TClientDataSet.Create(nil);
  cdsDeparaExterno.Data := GetDataPacket(sSql);
  SetLength(aDeParaExterno, cdsDeparaExterno.RecordCount, cdsDeparaExterno.FieldCount);
  cdsDeparaExterno.First;
  i := 0;
  while not cdsDeparaExterno.Eof do
  begin
    for j := 0 to cdsDeparaExterno.FieldCount - 1 do
      aDeParaExterno[i, j] := cdsDeparaExterno.Fields[j].AsString;
    i := i + 1;
    cdsDeparaExterno.Next;
  end;
  cdsDeparaExterno.Free;
end;

function TCtrlLoteexportactb.GetCodExterno(const atributo, vlrcm: string): string;
var i : integer;
begin
   Result := '';
   for i:= low(aDeParaExterno) to high(aDeParaExterno) do begin
      if (UpperCase(aDeParaExterno[i, 1]) = UpperCase(atributo)) and (UpperCase(aDeParaExterno[i, 2]) = UpperCase(vlrcm)) then begin
         Result := aDeParaExterno[i, 3];
         Exit;
      end;
   end;
end;

function TCtrlLoteexportactb.ListaLancRecPag(const DataIni, DataFim: TDateTime;
                                             const iTipoData : Integer;
                                             const sIdModulos, sRecPag: string;
                                             const bApropriado: Boolean): Olevariant;
var ssql, sParam : string;
begin
  sParam := '';
  if bApropriado then
       sParam := sParam + ' AND RTRIM(LD.OPERACAO) IN(''2'',''4'') '+#13
  else sParam := sParam + ' AND RTRIM(LD.OPERACAO) = ''5'' '+#13;

  if iTipoData = 0 then begin
     if (trim(dateToStr(DataIni)) <> '') and (trim(dateToStr(DataFim)) <> '') then
       sParam := sParam + ' AND D.DATAVENCTO BETWEEN TO_DATE( '+ quotedStr(dateToStr(DataIni)) + ', ''DD/MM/YYYY'' ) AND TO_DATE( '+ quotedStr(dateToStr(DataFim)) + ', ''DD/MM/YYYY'' ) ';
  end else begin
     if (trim(dateToStr(DataIni)) <> '') and (trim(dateToStr(DataFim)) <> '') then
       sParam := sParam + ' AND D.DATAEMISSAO BETWEEN TO_DATE( '+ quotedStr(dateToStr(DataIni)) + ', ''DD/MM/YYYY'' ) AND TO_DATE( '+ quotedStr(dateToStr(DataFim)) + ', ''DD/MM/YYYY'' ) ';
  end;

  if trim(sIdModulos) <> '' then
    sParam := sParam + ' AND D.IDMODULO IN ('+ sIdModulos +')';

  CarregaDeparaExterno(sRecPag);

  sSql := 'SELECT D.IDMODULO AS COD_PROCESSO,                            '+#13+
          '      TO_CHAR(SYSDATE, ''DD/MM/YYYY'') AS DATA_PROCESSAMENTO, '+#13+
          '      D.NODOCUMENTO AS NODOCUMENTO,                           '+#13+
          '      D.IDPESSOA AS COD_EMPRESA,                              '+#13+
          '      RD.CODCENTRORESPON,                                     '+#13+
          '      DECODE(D.RECPAG,''R'',CP.CODCLIENTE, FS.CODCORRESP) AS COD_FORCLI,'+#13+
          '      P.NUMDOCUMENTO,                                         '+#13+
          '      P.RAZAOSOCIAL,                                          '+#13+
          '      P.TIPO,                                                 '+#13+
          '      RD.CODTIPRECDES,                                        '+#13+
          '      DECODE(D.RECPAG,''R'', PF.CODFORMA,                     '+#13+
          '                              D.CODFORMA) AS CODFORMA,        '+#13+
          '      CB.CONTACORRENTE,                                       '+#13+
          '      AG.NUMAGENCIA,                                          '+#13+
          '      B.NUMBANCO,                                             '+#13+
          '      PC.NOCONTACORR AS CONTA_PORTADOR,                       '+#13+
          '      BP.NUMBANCO    AS BANCO_PORTADOR,                       '+#13+
          '      AP.NUMAGENCIA  AS AGENCIA_PORTADOR,                     '+#13+
          '      D.DATAVENCTO,                                           '+#13+
          '      D.DATAPROGRAMADA,                                       '+#13+
          '      1 AS AGRUPA,                                            '+#13+
          '      0 AS AUTENTICA,                                         '+#13+
          '      D.OBS,                                                  '+#13+
          '      D.CODTIPDOC,                                            '+#13+
          '      D.CODDOCUMENTO,                                         '+#13+
          '      RD.IDPROGRAMA,                                          '+#13+
          '      RD.IDPLANOPREV,                                         '+#13+
          '      RD.CODCENTROCUSTO,                                      '+#13+
          '      UL.ULTLOTE,                                             '+#13+
          '      MIN( DECODE(D.RECPAG, ''R'',                            '+#13+
          '                  CT.IDTIPOCLIENTE,                           '+#13+
          '                  FR.IDRAMOFORNECEDOR) ) AS IDTIPOCLIENTE,    '+#13+
          '      SUM( DECODE(D.RECPAG, ''R'',                            '+#13+
          '                  DECODE(LD.DEBCRE,''D'', (LD.VALOR*(RD.VALOR/TR.VALOR)), (LD.VALOR*(RD.VALOR/TR.VALOR)) * -1),                  '+#13+
          '                  DECODE(LD.DEBCRE,''C'', (LD.VALOR*(RD.VALOR/TR.VALOR)), (LD.VALOR*(RD.VALOR/TR.VALOR)) * -1)) ) AS VLR_LIQUIDO '+#13+
          '     FROM DOCUMENTO D, LANCTODOCUM LD, RATEIODOCUM RD,  CLIENTEPESS CP, FORNSERV FS,      '+#13+
          '          PESSOA P, CONTABANCARIA CB, AGENCIABANCARIA AG, BANCO B,                        '+#13+
          '          PORTADORFORMA PF, PORTADORCONTA PC, BANCO BP, AGENCIABANCARIA AP,               '+#13+

          '          ( SELECT IDPESSOA, MIN(IDRAMOFORNECEDOR) AS IDRAMOFORNECEDOR '+#13+
          '              FROM FORNXRAMO                                           '+#13+
          '             GROUP BY IDPESSOA ) FR,                                   '+#13+
          '          ( SELECT IDPESSOA, MIN(IDTIPOCLIENTE) AS IDTIPOCLIENTE       '+#13+
          '              FROM CLIXTIPOCLI                                         '+#13+
          '             GROUP BY IDPESSOA ) CT,                                   '+#13+

          '          ( SELECT CODDOCUMENTO, SUM(VALOR) AS VALOR                                      '+#13+
          '              FROM RATEIODOCUM                                                            '+#13+
          '             GROUP BY CODDOCUMENTO ) TR,                                                  '+#13+
          '          ( SELECT MAX(NUMLOTE) AS ULTLOTE                                                '+#13+
          '              FROM LOTEEXPORTACTB                                                         '+#13+
          '             WHERE DATALOTE = SYSDATE                                                     '+#13+
          '               AND TIPOLOTE = ' + QuotedStr(sRecPag) + ' ) UL                             '+#13+
          '    WHERE D.CODDOCUMENTO = LD.CODDOCUMENTO         '+#13+
          '      AND D.CODDOCUMENTO = RD.CODDOCUMENTO         '+#13+
          '      AND D.CODDOCUMENTO = TR.CODDOCUMENTO         '+#13+
          '      AND D.CODPORTFORMA = PF.CODPORTFORMA(+)      '+#13+
          '      AND PF.CODPORTADOR = PC.CODPORTADOR(+)       '+#13+
          '      AND PC.IDBANCO     = BP.IDPESSOA(+)          '+#13+
          '      AND PC.IDAGENCIA   = AP.IDPESSOA(+)          '+#13+
          '      AND D.IDFORCLI = P.IDPESSOA                  '+#13+
          '      AND D.IDFORCLI = CP.IDPESSOA(+)              '+#13+
          '      AND D.IDFORCLI = FS.IDPESSOA(+)              '+#13+
          '      AND D.IDFORCLI = CT.IDPESSOA(+)              '+#13+
          '      AND D.IDFORCLI = FR.IDPESSOA(+)              '+#13+
          '      AND D.IDCBANCARIA = CB.IDCBANCARIA(+)        '+#13+
          '      AND CB.IDAGENCIA = AG.IDPESSOA(+)            '+#13+
          '      AND AG.IDBANCO = B.IDPESSOA(+)               '+#13+
          '      AND D.RECPAG = ' + QuotedStr(sRecPag)         +#13+
          '      AND LD.IDLOTEEXPORTACTB IS NULL              '+#13+ sParam +#13+
          '    GROUP BY D.IDMODULO, TO_CHAR(SYSDATE, ''DD/MM/YYYY''), D.NODOCUMENTO,    '+#13+
          '              D.IDPESSOA, RD.CODCENTRORESPON,                                '+#13+
          '              DECODE(D.RECPAG,''R'',CP.CODCLIENTE, FS.CODCORRESP),           '+#13+
          '              P.NUMDOCUMENTO, P.RAZAOSOCIAL, P.TIPO, RD.CODTIPRECDES,        '+#13+
          '              DECODE(D.RECPAG,''R'', PF.CODFORMA, D.CODFORMA),               '+#13+
          '              CB.CONTACORRENTE, AG.NUMAGENCIA, B.NUMBANCO,                   '+#13+
          '              PC.NOCONTACORR, BP.NUMBANCO, AP.NUMAGENCIA,                    '+#13+
          '              D.DATAVENCTO, D.DATAPROGRAMADA, 1, 0, D.OBS,                   '+#13+
          '              D.CODTIPDOC, D.CODDOCUMENTO, RD.IDPROGRAMA, RD.IDPLANOPREV,    '+#13+
          '              RD.CODCENTROCUSTO, UL.ULTLOTE                                  '+#13+
          '    ORDER BY D.NODOCUMENTO ';

  result := GetDataPacket(sSql);
end;


End.

