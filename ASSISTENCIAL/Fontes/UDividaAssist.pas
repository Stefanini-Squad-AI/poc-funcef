unit UDividaAssist;

interface
   function ConsultaDividaAssist(idPessoa: integer; var dValor: extended;
                                 var sSQL: string): integer;
   function BaixaDividaAssist(mes, mescobranca: string;
            idmotivo, idplanass, idplanoprev, idpessjur, idtitular, iddependente,
            idcontass: integer): integer;
   function MudaCobrancaDividaAssist(mes, mesCobranca: string;
            idMotivo, idPlanAss, idPlanoPrev, idPessJur, idTitular, idDependente,
            idContAss: integer): integer;

implementation

uses SysUtils, wwQuery, Forms, USistema, UAdmAss, UDataBase, USincronismo;

function ConsultaDividaAssist(idPessoa: integer; var dValor: extended;
                              var sSQL: string): integer;
var qry: TwwQuery;
begin
  sSQL := 'select h.idmotivo, h.idplanass, h.idplanoprev, h.idpessjur, h.idtitular, h.iddependente, h.idcontass,'+
                ' MES, m.descricao motivo, pa.nome planass, MESCOBRANCA, pp.nome planprev,'+
                ' pj.nome patro, c.nome contribuicao, pt.nome titular, pd.nome dependente,'+
                ' VALORESPERADO, DATAPREVISAO, h.IDLOTE lote,'+
                ' decode(h.flgcobcarne,1,''BC'',''FL'') LOCAL'+
           ' from hstcontribass h, motivo m, planass pa, planprev pp, pessoa pj,'+
                ' contribuicao c, pessoa pt, pessoa pd'+
          ' where (h.idtitular = '+IntToStr(idPessoa)+')'+
            ' and (h.sitrecebimento = 1)'+
            ' and (h.IDTIPO in (''C'',''A''))'+
            ' and (h.idmotivo = m.idmotivo)'+
            ' and (h.IDPLANASS = pa.idplanass)'+
            ' and (h.IDPLANOPREV = pp.idplanoprev)'+
            ' and (h.IDPESSJUR = pj.idpessoa)'+
            ' and (h.IDCONTASS = c.idcontribuicao)'+
            ' and (h.IDTITULAR = pt.idpessoa)'+
            ' and (h.IDDEPENDENTE = pd.idpessoa)';
  qry := TwwQuery.Create(Application);
  qry.DataBaseName := 'basedados';
  qry.SQL.Clear;
  qry.SQL.Add
    ('select sum(VALORESPERADO) valor'+
       ' from hstcontribass h'+
     ' WHERE (h.idtitular = '+IntToStr(idPessoa)+')'+
       ' and (h.sitrecebimento = 1)'+
       ' and (h.IDTIPO in (''C'',''A''))');
  try
     qry.open;
  except
     dValor := 0;
     result := 1;
     exit;
  end;
  result := 0;
  dValor := qry.FieldbyName('valor').asFloat;
end;

function BaixaDividaAssist(mes, mescobranca: string;
         idmotivo, idplanass, idplanoprev, idpessjur, idtitular, iddependente,
         idcontass: integer): integer;
var qry: TwwQuery;
begin
  result := 0;

  qry := TwwQuery.Create(Application);
  qry.DataBaseName := 'basedados';

  qry.SQL.Clear;
  qry.SQL.Add
    ('select idtitular'+
      ' from hstcontribass h'+
     ' where (h.idtitular = '+IntToStr(idtitular)+')'+
       ' and (h.sitrecebimento = 1)'+
       ' and (h.IDTIPO in (''C'',''A''))'+
       ' and (rownum = 1)');
  try
     qry.open;
  except;
     result := 2;
     exit;
  end;

  if qry.IsEmpty then
  begin
     result := 1;
     exit;
  end;

  qry.SQL.Clear;
  qry.SQL.Add
    ('UPDATE HSTCONTRIBASS'+
       ' SET SITRECEBIMENTO = 2,'+
           ' VALORRECEBIDO = VALORESPERADO,'+
           ' DATA = SYSDATE,'+
           ' CODREFERENCIA = ''BAIXA SIST: '+Sistema.NomeAplicativo+''''+
     ' WHERE (IDPESSJUR = '+inttostr(idpessjur)+')'+
       ' AND (IDTITULAR = '+inttostr(idtitular)+')'+
       ' AND (IDDEPENDENTE ='+inttostr(iddependente)+')'+
       ' AND (IDPLANASS = '+inttostr(idplanass)+')'+
       ' AND (IDPLANOPREV = '+inttostr(idplanoprev)+')'+
       ' AND (IDCONTASS = '+inttostr(idcontass)+')'+
       ' AND (MESCOBRANCA = '''+mescobranca+''')'+
       ' AND (IDMOTIVO = '+inttostr(idmotivo)+')'+
       ' AND (MES = '''+mes+''')');
  try
     qry.ExecSQL;
  except
     result := 2;
  end;

  if result = 0 then
  begin
    //baixa eventuais pendências (SITRECEBIMENTO = 4)
    qry.SQL.Clear;
    qry.SQL.Add
      ('UPDATE HSTCONTRIBASS'+
         ' SET VALORRECEBIDO = VALORESPERADO,'+
             ' DATA = SYSDATE,'+
             ' SITRECEBIMENTO = ''2'','+
             ' CODREFERENCIA = ''BAIXA SIST: '+Sistema.NomeAplicativo+''''+
       ' WHERE (SITRECEBIMENTO  = 4)'+
         ' AND (IDPESSJUR = '+inttostr(idpessjur)+')'+
         ' AND (IDTITULAR = '+inttostr(idtitular)+')'+
         ' AND (IDDEPENDENTE ='+inttostr(iddependente)+')'+
         ' AND (IDPLANASS = '+inttostr(idplanass)+')'+
         ' AND (IDPLANOPREV = '+inttostr(idplanoprev)+')'+
         ' AND (IDCONTASS = '+inttostr(idcontass)+')'+
         ' AND (MES = '''+mes+''')');
    try
       qry.ExecSQL;
    except
       result := 2;
    end;
  end;
end;

function PegaProxMes(idPatro: integer; mesCobranca: string): string;
var cTipoEnvPrev: char; //??
    sAnoMesCobranca: string;
begin
  sAnoMesCobranca := mesCobranca;
  //??
  if VerificaFechamento(idPatro, cteIdModuloCCP, sAnoMesCobranca, 'E', cTipoEnvPrev) then
    sAnoMesCobranca := ProximoMesAberto(sAnoMesCobranca, idPatro, cteIdModuloCCP, 'E');
  result := sAnoMesCobranca;
end;

function MudaCobrancaDividaAssist(mes, mesCobranca: string;
         idMotivo, idPlanAss, idPlanoPrev, idPessJur, idTitular, idDependente,
         idContAss: integer): integer;
var nResultado: integer;
    qry: TwwQuery;
    novoMesCobranca, sDataPrevisao, sFlgInterno, sNumRecebimento: string;
begin
  nResultado := BaixaDividaAssist(mes, mesCobranca, idMotivo, idPlanAss, idPlanoPrev,
                                  idPessJur, idTitular, idDependente, idContAss);
  result := nResultado;
  if nResultado = 0 then
  begin
    qry := TwwQuery.Create(Application);
    qry.DataBaseName := 'basedados';

    //novos parâmetros
    qry.SQL.Text :=
       'SELECT SP.FLGINTERNO'+
        ' FROM PARTPREVPLAN PPP, SITPART SP'+
       ' WHERE (PPP.IDPESSJUR = '+inttoStr(idPessJur)+') AND'+
             ' (PPP.SEQPROPOSTA = 1) AND'+
             ' (PPP.IDPLANOPREV = '+intToStr(idPlanoPrev)+') AND'+
             ' (PPP.IDPESSOA = '+intToStr(idTitular)+') AND'+
             ' (PPP.IDSITPART = SP.IDSITPART)';
    qry.open;
    sFlgInterno := qry.FieldByName('FLGINTERNO').AsString;
    qry.close;
    novoMesCobranca := DateToStr(Date);
    novoMesCobranca := Copy(novoMesCobranca,7,4)+'/'+Copy(novoMesCobranca,4,2);
    novoMesCobranca := PegaProxMes(idPessJur, novoMesCobranca);
    sNumRecebimento := intToStr(LeUltRegistro(qry, 'HSTCONTRIBASS'));
    sDataPrevisao := CriticaDataCobrancaAssist(qry,
                                               intToStr(idPessJur),
                                               intToStr(idPlanoPrev),
                                               sFlgInterno,
                                               intToStr(idPlanAss),
                                               'N',
                                               Copy(novoMesCobranca,6,2),
                                               Copy(novoMesCobranca,1,4));
    qry.SQL.Clear;
    qry.SQL.Add
      ('INSERT INTO HSTCONTRIBASS'+
       ' (MES, SEQPROPOSTA, IDMOTIVO, IDPLANASS, MESCOBRANCA, IDPLANOPREV,'+
        ' IDPESSJUR, IDCONTASS, IDTITULAR, IDDEPENDENTE,'+
        ' VALORESPERADO, IDREGRA, PLNCODEFET, CODDOCEFET, VALORRECEBIDO, DATA,'+
        ' CODPORTFORMA, CODDOCPREV, PLNCODPREV, DATAPREVISAO, SITRECEBIMENTO,'+
        ' NUMRECEBIMENTO, FLGCOBCARNE, CODREFERENCIA, IDPAGADOR, IDTIPO, IDLOTE)'+
      ' SELECT'+
        ' MES, SEQPROPOSTA, IDMOTIVO, IDPLANASS,'''+novoMesCobranca+''', IDPLANOPREV,'+
        ' IDPESSJUR, IDCONTASS, IDTITULAR, IDDEPENDENTE,'+
        ' VALORESPERADO, IDREGRA, PLNCODEFET, CODDOCEFET, null, null,'+
        ' CODPORTFORMA, CODDOCPREV, PLNCODPREV, '''+sDataPrevisao+''', 0,'+
          sNumRecebimento+', 0, CODREFERENCIA, IDTITULAR, IDTIPO, null'+
       ' FROM HSTCONTRIBASS'+
      ' WHERE (MES = '''        +mes                   +''') AND'+
            ' (MESCOBRANCA = '''+mesCobranca           +''') AND'+
            ' (IDMOTIVO = '     +intToStr(idMotivo)    +') AND'+
            ' (IDPLANASS = '    +intToStr(idPlanAss)   +') AND'+
            ' (IDPLANOPREV = '  +intToStr(idPlanoPrev) +') AND'+
            ' (IDPESSJUR = '    +intToStr(idPessJur)   +') AND'+
            ' (IDTITULAR = '    +intToStr(idTitular)   +') AND'+
            ' (IDDEPENDENTE = ' +intToStr(idDependente)+') AND'+
            ' (IDCONTASS = '    +intToStr(idContAss)   +')');
    try
       qry.ExecSQL;
    except;
      raise;
      exit;
    end;
  end;//if
end;

end.

