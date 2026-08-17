unit uCtrlAlteraLote;

interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase,
     DbClient, Classes, uCmTypes, uDBLoteXDocum, uCtrlRad, uCtrlRadPlus, jclmath;

type

  TCtrlAlteraLote = class(TCmControlObject)
  Protected
     procedure DoChangeDataBase; Override;
  private
    _DbLoteXDocum  : TDbLoteXDocum;
    _CdsLoteXDocum : TClientDataSet;
    Rad            : TCtrlRAD;
    CtrlRadPlus    : TCtrlRadPlus;    
  Public
    constructor Create;  Override;
    destructor  Destroy; Override;
    function ListLotexDocum(iIDEmpresa : Integer; sRecPag, sNumLote : String) : Olevariant;
    function ListDocum(iIDUsuario, iIDCliente, iIDEmpresa : Integer;
                       sRecPag, sDocumento, sDataProgramada : String) : Olevariant;
    function ListLotexDocumEmpty : OleVariant;
    function ListDocumento : OleVariant;
    function ListDocPendentes(iIDEmpresa : Integer; sRecPag : String) : OleVariant;
    function ListLotePagto(iIDEmpresa, iIDUsuario : Integer; sRecPag: String; bFinanceiro: Boolean) : OleVariant;
    function GravaLotexDocum(ovLotexDocum : OleVariant; idEmpresa: integer; idUsuario: integer; numLote: integer) : Boolean;
    procedure AfterInitialize; Override;
end;

implementation

{ TCtrlAlteraLote }

procedure TCtrlAlteraLote.AfterInitialize;
begin
  inherited;
 //pendência 26773 - 20/11/2007
  Rad := TCtrlRAD.Create;
  Rad.InitializeAs(Self);
  CtrlRadPlus := TCtrlRadPlus.Create;
  CtrlRadPlus.InitializeAs(Self);

end;

constructor TCtrlAlteraLote.Create;
begin
  inherited;
  _CdsLoteXDocum := TClientDataSet.Create(nil);
  _DbLoteXDocum  := TDBLoteXDocum.Create(self);
end;

destructor TCtrlAlteraLote.Destroy;
begin
  Rad.free;
  CtrlRadPlus.free;
  _DbLoteXDocum.Free;
  _CdsLoteXDocum.Free;
  inherited;
end;

procedure TCtrlAlteraLote.DoChangeDataBase;
begin
  inherited;
  _DbLotexDocum.DataBaseName := DataBaseName;
end;

function TCtrlAlteraLote.GravaLotexDocum(ovLotexDocum : OleVariant; idEmpresa: integer; idUsuario: integer; numLote: integer): Boolean;
var Msg: String;
    IdTipoProcRad, idprocesso: integer;
    valorLote : extended;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaLotexDocum(ovLotexDocum);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    if _CdsLotexDocum.Active then _CdsLotexDocum.Close;
    _CdsLotexDocum.Data := ovLotexDocum;

    result := true;

    StartTransaction;
    try
      //início pendência 26773 - 20/11/2007
      IdTipoProcRad := 0;
      valorLote     := 0;
      idprocesso    := 0;

      _CdsLotexDocum.DisableControls;

      try
        _CdsLotexDocum.First;
        while not _CdsLotexDocum.Eof do
        begin
          valorLote := valorLote + _CdsLotexDocum.fieldByName('VALOR').asFloat;
          _CdsLotexDocum.Next;
        end;
      finally
        _CdsLotexDocum.EnableControls;
      end;

      _cds.data := getDataPacket( ' SELECT R.IDPROCESSO, R.FLGOK FROM LOTEPAGTO L, RADINSTPROCESSO R '+
                                  ' WHERE L.NUMLOTE = '+ intToStr(numLote) +
                                  '       AND L.IDPROCESSO = R.IDPROCESSO ');

      if (_cds.FieldByName('FLGOK').asString = 'S') then
      begin
        messageInfo := 'Já existe um processo RAD aprovado para este lote, não é permitido alterá-lo.';
        raise exception.Create(messageInfo);
      end
      else
      begin
        if CtrlRadPlus.RecuperaVersaoRAD = '+' then
        begin
          IdTipoProcRad := CtrlRadPlus.RecuperaTipoProcesso(6, IdEmpresa);
          if ( CtrlRadPlus.ExcluirProcesso( _cds.fieldByName('IDPROCESSO').asInteger, True ) ) then
          begin
            if (IdTipoProcRad > 0) and ( not IsFloatZero(valorLote) ) then
            begin
              CtrlRadPlus.InicializaPropriedades;
              CtrlRadPlus.TipoProcesso := IdTipoProcRad;
              CtrlRadPlus.IdEmpresa    := IdEmpresa;
              CtrlRadPlus.IdUsuario    := IdUsuario;
              CtrlRadPlus.Obs          := 'Lote Nº: ' + intToStr(numLote);
              CtrlRadPlus.VlrProc      := valorLote;
              idprocesso               := CtrlRadPlus.IniciarProcesso(true);
            end;
          end
          else
          begin
            result := false;
            messageInfo := CtrlRadPlus.messageInfo;
            raise exception.Create(messageInfo);
          end;
        end
        else
        begin
          IdTipoProcRad := Rad.GetTipoProcesso( _cds.fieldByName('IDPROCESSO').asInteger, IdEmpresa );
          if Rad.ExcluirProcesso( _cds.fieldByName('IDPROCESSO').asInteger, True ) then
          begin
            if (IdTipoProcRad > 0) and ( not IsFloatZero(valorLote) ) then
            Rad.IdEmpresa    := IdEmpresa;
            Rad.IdPessoa     := IdEmpresa;
            Rad.IdUsuario    := IdUsuario;
            Rad.TipoProcesso := IdTipoProcRad;
            Rad.OBS          := 'Lote Nº: ' + intToStr(numLote);
            Rad.Valor        := valorLote;
            idprocesso       := Rad.IniciarProcesso(true);
          end
          else
          begin
            result := false;
            messageInfo := Rad.messageInfo;
            raise exception.Create(messageInfo);
          end;
        end;
      end;
      //fim pendência 26773 - 20/11/2007

      Result := ApplyCds(_CdsLotexDocum,_DbLotexDocum,[],[]);
      Msg    := _DbLotexDocum.MessageInfo;
      If Not Result Then Raise Exception.create(Msg);

      //pendência 26773 - 20/11/2007
      if (idprocesso > 0) then
        result := ExecSql('UPDATE LOTEPAGTO SET IDPROCESSO = '+ intToStr(idprocesso) + ' WHERE NUMLOTE = '+ intToStr(numLote));

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

function TCtrlAlteraLote.ListDocPendentes(iIDEmpresa: Integer;
  sRecPag: String): OleVariant;
var
sSQL : String;
begin
  sSQL := 'SELECT DISTINCT ' +
          '  NODOCUMENTO, COMPLDOCUMENTO, CODDOCUMENTO ' +
          'FROM ' +
          '  DOCUMENTO '+
          'WHERE (STATUS = ''0'' OR STATUS = ''1'' OR (STATUS is NULL) ) ' +
          '  AND (OPERACAO = 2 OR OPERACAO = 3 OR OPERACAO = 14) ' +
          '  AND (RECPAG = ' + QuotedStr(sRecPag) + ') AND ' +
          '  IDPESSOA = ' + IntToStr(iIDEmpresa) + ' ' +
          'ORDER BY NODOCUMENTO,COMPLDOCUMENTO';
  Result := GetDataPacket(sSQL);

end;

function TCtrlAlteraLote.ListDocum(iIDUsuario, iIDCliente, iIDEmpresa : Integer;
                                   sRecPag, sDocumento, sDataProgramada : String) : Olevariant;
var
  LstSQL : TStrings;
  cds : TClientDataSet;
begin
  LstSQL := TStringList.Create;
  with LstSQL do
  begin
    Append('SELECT                                             ');
    Append(' SALDODOC.SALDO AS SALDO, D.IDFORCLI, D.CODDOCUMENTO,          ');
    Append('  D.IDPESSOA, D.NODOCUMENTO, D.COMPLDOCUMENTO,     ');
    Append('  D.DATAPROGRAMADA,                                ');
    Append('  D.DATAVENCTO, D.RECPAG, P.NOME, D.STATUS,        ');

    //início - andré tavares - pendência 23734 - 16/11/2006 - Incluir 4 colunas na grade: plano, banco, agência e conta. Similar a tela de criação do lote.
    Append('  SALDODOC.SALDO AS VALOR,   ');
    Append('  (0) AS NUMLOTE, ');
    Append('  B.NUMBANCO, ');
    Append('  A.NUMAGENCIA, ');
    Append('  C.CONTACORRENTE, ');
    Append('  ''                                                                                                                '' AS PLANOPREV ');
    //fim - andré tavares - pendência 23734 - 16/11/2006

    Append('FROM DOCUMENTO D, PESSOA P,                      ');

    //início - andré tavares - pendência 23734 - 16/11/2006 - Incluir 4 colunas na grade: plano, banco, agência e conta. Similar a tela de criação do lote.
    Append('  CONTABANCARIA C,                               ');
    Append('  BANCO B,                                       ');
    Append('  AGENCIABANCARIA A,                             ');
    APPEND('  ( SELECT ');
    APPEND('      SUM(DECODE(LANC.DEBCRE,''D'',DECODE(DOC.RECPAG,''R'',LANC.VALOR,LANC.VALOR * -1),DECODE(DOC.RECPAG,''R'',LANC.VALOR * -1,LANC.VALOR))) AS SALDO, ');
    APPEND('      DOC.CODDOCUMENTO ');
    APPEND('    FROM LANCTODOCUM LANC, DOCUMENTO DOC ');
    APPEND('    WHERE DOC.CODDOCUMENTO = LANC.CODDOCUMENTO ');
    APPEND('    GROUP BY DOC.CODDOCUMENTO ) SALDODOC ');
    //fim - andré tavares - pendência 23734 - 16/11/2006

    Append('WHERE                                              ');
    Append(' ((D.STATUS=''0'') OR (D.STATUS=''1'') OR (D.STATUS IS NULL)) AND ');
    Append(' ((D.OPERACAO=''2'') OR (D.OPERACAO=''3'') OR (D.OPERACAO=''14'')) AND ');
    Append(' ((D.EMISBLOQ <> ''S'') OR (D.EMISBLOQ IS NULL)) AND ');
    Append(' (D.RECPAG = ' + QuotedStr(sRecPag) + ') AND       ');
    Append(' (D.IDPESSOA = '+ IntToStr(iIDEmpresa) + ') AND    ');

    //início - andré tavares - pendência 23734 - 16/11/2006 - Incluir 4 colunas na grade: plano, banco, agência e conta. Similar a tela de criação do lote.
    Append('  D.IDCBANCARIA = C.IDCBANCARIA(+) AND           ');
    Append('  C.IDAGENCIA = A.IDPESSOA(+)      AND           ');
    Append('  A.IDBANCO = B.IDPESSOA(+)        AND           ');
    Append('  SALDODOC.CODDOCUMENTO = D.CODDOCUMENTO  AND    ');
    //fim - andré tavares - pendência 23734 - 16/11/2006

    if iIDCliente <> 0 then
      Append(' (D.IDFORCLI = ' + IntToStr(iIDCliente) + ') AND ');
    if sDocumento <> '0' then
      Append(' (D.CODDOCUMENTO = ' + sDocumento + ') AND ');
    if sDataProgramada <> '' then
      Append(' (D.DATAPROGRAMADA = TO_DATE(''' + sDataProgramada + ''',''DD/MM/YYYY'') ) AND ');

    Append(' (D.IDFORCLI = P.IDPESSOA) AND        ');
    Append('  D.CODTIPDOC IN                           ');
    Append('           (SELECT CODTIPDOC FROM TIPODOCRECPAG A  ');
    Append('            WHERE A.RECPAG = ' + QuotedStr(sRecPag) );
    Append('                  AND NOT EXISTS                   ');
    Append('                 (SELECT 1 FROM USUARIOxTPDOCTO B  ');
    Append('                  WHERE RECPAG = ' + QuotedStr(sRecPag));
    Append('                        AND B.IDUSUARIO =          ');
    Append(                         IntToStr(iIDUsuario) + ')  ');
    Append('            UNION SELECT CODTIPDOC                 ');
    Append('                  FROM TIPODOCRECPAG A             ');
    Append('                  WHERE A.RECPAG = ' + QuotedStr(sRecPag));
    Append('                        AND EXISTS                 ');
    Append('                       (SELECT 1 FROM USUARIOxTPDOCTO B');
    Append('                        WHERE RECPAG = ' + QuotedStr(sRecPag));
    Append('                              AND A.CODTIPDOC = B.CODTIPDOC ');
    Append('                              AND B.IDUSUARIO =    ');
    Append(                       IntToStr(iIDUsuario) + ')) AND ');
    Append(' (D.CODDOCUMENTO != ALL (select coddocumento from lotexdocum where flgbaixa is null)) ');
    Append('ORDER BY  P.NOME, D.DATAPROGRAMADA, D.NODOCUMENTO');
  end;

   //início - andré tavares - pendência 23734 - 16/11/2006 - Incluir 4 colunas na grade: plano, banco, agência e conta. Similar a tela de criação do lote.
  cds := TClientDataSet.Create(nil);
  try
    cds.data := GetDataPacket(LstSQL);

    cds.First;
    while not cds.Eof do
    begin
      with TClientDataset.Create(nil) do
      begin
        data := GetDataPacket(' SELECT DISTINCT PC.NOME '+#13+
                              ' FROM PLANPREV PP, PLANPREVCONTABIL PC, RATEIODOCUM R '+#13+
                              ' WHERE PP.IDPLANOPREV = PC.IDPLANOPREVPREV AND '+#13+
                              '       PC.IDPLANOPREV = R.IDPLANOPREV AND '+#13+
                              '       R.CODDOCUMENTO =  '+ cds.FieldByname( 'CODDOCUMENTO' ).asString +#13+
                              ' UNION '+#13+
                              ' SELECT DISTINCT PC.NOME '+#13+
                              ' FROM PLANPREVCONTABIL PC, RATEIODOCUM R '+#13+
                              ' WHERE IDPLANOPREVPREV IS NULL AND '+#13+
                              '       PC.IDPLANOPREV = R.IDPLANOPREV AND '+#13+
                              '       R.CODDOCUMENTO =  '+ Cds.FieldByname( 'CODDOCUMENTO' ).asString );

        first;
        cds.Edit;
        cds.fieldByName('PLANOPREV').asString := '';
        while not eof do
        begin
          cds.Edit;
          if (recno > 1) then
            cds.fieldByName('PLANOPREV').asString := cds.fieldByName('PLANOPREV').asString + '; '+ fieldByName('NOME').asString
          else
            cds.fieldByName('PLANOPREV').asString := cds.fieldByName('PLANOPREV').asString + fieldByName('NOME').asString;
          cds.Post;
          next;
        end;
      end;//with

      cds.Next;
    end;

    Result   := cds.data;
  finally
    cds.Free;
    LstSQL.Free;
  end;
//fim - andré tavares - pendência 23734 - 16/11/2006


end;

function TCtrlAlteraLote.ListDocumento: OleVariant;
var sSQL : String;
begin
  sSQL := ' SELECT (0)AS SALDO,              '+
          '        DOCUMENTO.IDFORCLI,       '+
          '        DOCUMENTO.CODDOCUMENTO,   '+
          '        DOCUMENTO.IDPESSOA,       '+
          '        DOCUMENTO.NoDOCUMENTO,    '+
          '        DOCUMENTO.COMPLDOCUMENTO, '+
          '        DOCUMENTO.DATAPROGRAMADA, '+
          '        DOCUMENTO.DATAVENCTO,     '+
          '        DOCUMENTO.RECPAG,         '+
          '        PESSOA.NOME,              '+
          '        DOCUMENTO.STATUS,         '+
    //início - andré tavares - pendência 23734 - 16/11/2006 - Incluir 4 colunas na grade: plano, banco, agência e conta. Similar a tela de criação do lote.
          '        (0) AS VALOR,             '+
          '        (0) AS NUMLOTE,           '+
          '        B.NUMBANCO,               '+
          '        A.NUMAGENCIA,             '+
          '        C.CONTACORRENTE,          '+
          '        ''                                                                                                                '' AS PLANOPREV '+
     //FIM - andré tavares - pendência 23734 - 16/11/2006
          ' FROM DOCUMENTO,PESSOA, '+
          
    //início - andré tavares - pendência 23734 - 16/11/2006 - Incluir 4 colunas na grade: plano, banco, agência e conta. Similar a tela de criação do lote.
          '     CONTABANCARIA C,  '+
          '     BANCO B,          '+
          '     AGENCIABANCARIA A '+
    //fim - andré tavares - pendência 23734 - 16/11/2006

          'WHERE DOCUMENTO.CODDOCUMENTO = -1 ';
  Result := GetDataPacket(sSQL);
end;

function TCtrlAlteraLote.ListLotePagto(iIDEmpresa, iIDUsuario: Integer;
  sRecPag : String; bFinanceiro: Boolean) : OleVariant;
var LstSQL : TStrings;
begin
  LstSQL := TStringList.Create;
  with LstSQL do
  begin
    Clear;
    Append('SELECT DISTINCT LP.NUMLOTE, '                                    );
    Append('  LP.IDUSUARIOINCLUSAO,LP.DATAEMISSAO, '                         );
    Append('  LP.NUMCHQBORDERO, LP.FAVORECIDO, '                             );
    Append('  LP.FLAGEMISSAO, LP.CODPORTFORMA, LP.FLAGCANCEL, '              );
    Append('  LP.IDPESSOA, LP.OBSERVACAO '                                   );
    Append('FROM '                                                           );
    Append('  LOTEPAGTO LP, LOTEXDOCUM LD, DOCUMENTO D, '                    );
    Append('  (SELECT count(*) As TOTDOCUM, NUMLOTE '                        );
    Append('   FROM LOTEXDOCUM LD, DOCUMENTO D '                             );
    Append('   WHERE '                                                       );
    Append('     D.RECPAG = ' + QuotedStr(sRecPag) + ' AND '                 );
    Append('    ((LD.FLGBAIXA     IS NULL)  ) AND '                          );
    Append('     LD.CODDOCUMENTO = D.CODDOCUMENTO '                          );
    Append('   GROUP BY NUMLOTE ) TOTDOCUM, '                                );
    Append('  (SELECT count(*) AS TOTDOCUM, NUMLOTE '                        );
    Append('   FROM LOTEXDOCUM LD, DOCUMENTO D '                             );
    Append('   WHERE '                                                       );
    Append('     D.RECPAG = '+ QuotedStr(sRecPag) + ' AND '                  );
    Append('   ((LD.FLGBAIXA IS NULL)) AND '                                 );
    Append('     LD.CODDOCUMENTO = D.CODDOCUMENTO  AND '                     );
    Append('     D.CODTIPDOC IN (SELECT CODTIPDOC FROM TIPODOCRECPAG A '     );
    Append('                     WHERE A.RECPAG = ' + QuotedStr(sRecPag)     );
    Append('                     AND NOT EXISTS '                            );
    Append('                            (SELECT 1 FROM USUARIOxTPDOCTO B '   );
    Append('                             WHERE RECPAG = ' + QuotedStr(sRecPag));
    Append('                             AND B.IDUSUARIO = '                 );
    Append(                                  IntToStr(iIDUsuario) + ')'      );
    Append('                     UNION'                                      );
    Append('                     SELECT CODTIPDOC  FROM TIPODOCRECPAG A'     );
    Append('                     WHERE A.RECPAG = ' + QuotedStr(sRecPag)     );
    Append('                     AND EXISTS '                                );
    Append('                         (SELECT 1 FROM USUARIOxTPDOCTO B WHERE ');
    Append('                          RECPAG = ' +QuotedStr(sRecPag)         );
    Append('                          AND A.CODTIPDOC = B.CODTIPDOC AND'     );
    Append('                          B.idusuario = ' + IntToStr(iIDUsuario) );
    Append('                          )) GROUP BY NUMLOTE) TOTLOTE '         );

    if bFinanceiro then
    begin
      Append(' WHERE  '                                                        );
      Append('   TOTLOTE.TOTDOCUM = TOTDOCUM.TOTDOCUM AND '                    );
      Append('   TOTLOTE.NUMLOTE  = TOTDOCUM.NUMLOTE AND '                     );
      Append('   TOTLOTE.NUMLOTE  = LP.NUMLOTE AND '                           );
      Append('   LP.IDPESSOA = ' + IntToStr(iIDEmpresa) + ' AND '              );
      Append('   D.RECPAG = ' + QuotedStr(sRecPag) + ' AND '                   );
      Append('   LP.FLAGEMISSAO IS NULL AND '                                  );
      Append('   LD.FLGBAIXA IS NULL AND '                                     );
      Append('   LP.NUMLOTE  = LD.NUMLOTE AND '                                );
      Append('   LD.CODDOCUMENTO = D.CODDOCUMENTO '                            );
    end
    else
    begin
      Append(' WHERE '                                                         );
      Append('  LP.IDPESSOA = ' + IntToStr(iIDEmpresa) + ' AND '               );
      Append('  TOTLOTE.TOTDOCUM = TOTDOCUM.TOTDOCUM AND '                     );
      Append('  TOTLOTE.NUMLOTE = TOTDOCUM.NUMLOTE AND'                        );
      Append('  TOTLOTE.NUMLOTE = LD.NUMLOTE AND '                             );
      Append('  D.RECPAG = ' + QuotedStr(sRecPag) + ' AND '                    );
      Append('  LP.PLNCODIGO IS NULL AND '                                     );
      Append('  LD.FLGBAIXA IS NULL AND '                                      );
      Append('  LP.NUMLOTE  = LD.NUMLOTE AND '                              );
      Append('  LD.CODDOCUMENTO = D.CODDOCUMENTO '                           );
    end;
  end;
  Result := GetDataPacket(LstSQL);
end;

function TCtrlAlteraLote.ListLotexDocum(iIDEmpresa : Integer; sRecPag, sNumLote : String): Olevariant;
var LstSQL : TStrings;
    cds: TClientDataSet;
begin
  LstSQL := TStringList.Create;
  with LstSQL do
  begin
    Append('SELECT                                           ');
    Append('  P.NOME,                                        ');
    Append('  D.DATAPROGRAMADA,                              ');
    Append('  D.IDPESSOA,                                    ');
    Append('  D.DATAVENCTO,                                  ');
    Append('  D.NoDOCUMENTO,                                 ');
    Append('  D.COMPLDOCUMENTO,                              ');
    Append('  D.CODDOCUMENTO,                                ');
    Append('  D.OPERACAO,                                    ');
    Append('  LP.FLAGEMISSAO,                                ');
    Append('  LD.VALOR,                                      ');
    Append('  LD.NUMLOTE,                                    ');
    Append('  LD.FLGBAIXA,                                   ');

    //início - andré tavares - pendência 23734 - 16/11/2006 - Incluir 4 colunas na grade: plano, banco, agência e conta. Similar a tela de criação do lote.
    Append('   (0) AS SALDO, ');
    Append('  B.NUMBANCO, ');
    Append('  A.NUMAGENCIA, ');
    Append('  C.CONTACORRENTE, ');
    Append('  ''                                                                                                                '' AS PLANOPREV, ');
    //fim - andré tavares - pendência 23734 - 16/11/2006

    Append('  LP.CODPORTFORMA '); //andré tavares - pendência 24357 - 31/01/2007 

    Append('FROM                                             ');
    Append('  DOCUMENTO D,                                   ');
    Append('  PESSOA P,                                      ');
    Append('  LOTEXDOCUM LD,                                 ');
    Append('  LOTEPAGTO LP,                                  ');

    //início - andré tavares - pendência 23734 - 16/11/2006 - Incluir 4 colunas na grade: plano, banco, agência e conta. Similar a tela de criação do lote.
    Append('  CONTABANCARIA C,                               ');
    Append('  BANCO B,                                       ');
    Append('  AGENCIABANCARIA A                              ');
    //fim - andré tavares - pendência 23734 - 16/11/2006

    Append('WHERE                                            ');
    Append('  D.IDPESSOA = ' + InttoStr(iIDEmpresa) + ' AND  ');
    Append('  D.RECPAG = ' + QuotedStr(sRecPag) + ' AND      ');
    Append('  LD.NUMLOTE = ' + sNumLote + ' AND              ');
    Append('  LD.FLGBAIXA IS NULL AND                        ');
    Append('  D.IDFORCLI = P.IDPESSOA AND                    ');
    Append('  LD.NUMLOTE = LP.NUMLOTE AND                    ');
    Append('  LD.CODDOCUMENTO = D.CODDOCUMENTO AND           ');

    //início - andré tavares - pendência 23734 - 16/11/2006 - Incluir 4 colunas na grade: plano, banco, agência e conta. Similar a tela de criação do lote.
    Append('  D.IDCBANCARIA = C.IDCBANCARIA(+) AND           ');
    Append('  C.IDAGENCIA = A.IDPESSOA(+) AND                ');
    Append('  A.IDBANCO = B.IDPESSOA(+)                      ');

    cds := TClientDataSet.Create(nil);
    try
      cds.data := GetDataPacket(LstSQL);


      cds.First;
      while not cds.Eof do
      begin
        with TClientDataset.Create(nil) do
        begin
          data := GetDataPacket(' SELECT DISTINCT PC.NOME '+#13+
                                ' FROM PLANPREV PP, PLANPREVCONTABIL PC, RATEIODOCUM R '+#13+
                                ' WHERE PP.IDPLANOPREV = PC.IDPLANOPREVPREV AND '+#13+
                                '       PC.IDPLANOPREV = R.IDPLANOPREV AND '+#13+
                                '       R.CODDOCUMENTO =  '+ cds.FieldByname( 'CODDOCUMENTO' ).asString +#13+
                                ' UNION '+#13+
                                ' SELECT DISTINCT PC.NOME '+#13+
                                ' FROM PLANPREVCONTABIL PC, RATEIODOCUM R '+#13+
                                ' WHERE IDPLANOPREVPREV IS NULL AND '+#13+
                                '       PC.IDPLANOPREV = R.IDPLANOPREV AND '+#13+
                                '       R.CODDOCUMENTO =  '+ Cds.FieldByname( 'CODDOCUMENTO' ).asString );

          first;
          cds.Edit;
          cds.fieldByName('PLANOPREV').asString := '';
          while not eof do
          begin
            cds.Edit;
            if (recno > 1) then
              cds.fieldByName('PLANOPREV').asString := cds.fieldByName('PLANOPREV').asString + '; '+ fieldByName('NOME').asString
            else
              cds.fieldByName('PLANOPREV').asString := cds.fieldByName('PLANOPREV').asString + fieldByName('NOME').asString;
            cds.Post;
            next;
          end;
        end;//with

        cds.Next;
      end;

      Result   := cds.data;
    finally
      cds.Free;
      LstSQL.Free;
    end;
 //fim - andré tavares - pendência 23734 - 16/11/2006

  end;
end;

function TCtrlAlteraLote.ListLotexDocumEmpty: OleVariant;
var sSQL : String;
begin
  sSQL := 'SELECT               ' +
          '   P.NOME,           ' +
          '   D.DATAPROGRAMADA, ' +
          '   D.IDPESSOA,       ' +
          '   D.DATAVENCTO,     ' +
          '   D.NoDOCUMENTO,    ' +
          '   D.COMPLDOCUMENTO, ' +
          '   D.CODDOCUMENTO,   ' +
          '   D.OPERACAO,       ' +
          '   LP.FLAGEMISSAO,   ' +
          '   LD.VALOR,         ' +
          '   LD.NUMLOTE,       ' +
          '   LD.FLGBAIXA,      ' +
          //início - andré tavares - pendência 23734 - 16/11/2006 - Incluir 4 colunas na grade: plano, banco, agência e conta. Similar a tela de criação do lote.
          '   (0) AS SALDO, '+
          '   B.NUMBANCO, '+
          '   A.NUMAGENCIA, '+
          '   C.CONTACORRENTE, '+
          '  ''                                                                                                                '' AS PLANOPREV, '+
          //fim - andré tavares - pendência 23734 - 16/11/2006

          '  LP.CODPORTFORMA '+
          'FROM                 ' +
          '   DOCUMENTO D,      ' +
          '   PESSOA P,         ' +
          '   LOTEXDOCUM LD,    ' +
          '   LOTEPAGTO LP,     ' +
          //início - andré tavares - pendência 23734 - 16/11/2006 - Incluir 4 colunas na grade: plano, banco, agência e conta. Similar a tela de criação do lote.
          '  CONTABANCARIA C,   ' +
          '  BANCO B,           ' +
          '  AGENCIABANCARIA A  ' +
          //fim - andré tavares - pendência 23734 - 16/11/2006
          'WHERE   1 = 2';
  Result := GetDataPacket(sSQL);
end;

end.


