unit uCtrlAlteraLote;

interface

Uses sysutils, uCmControlObject, uCmDbObject, DB, uDataBase,
     DbClient, Classes, uCmTypes, uDBLoteXDocum;

type

  TCtrlAlteraLote = class(TCmControlObject)
  Protected
//    procedure AfterInitialize; Override;
     procedure DoChangeDataBase; Override;
  private
    _DbLoteXDocum  : TDbLoteXDocum;
    _CdsLoteXDocum : TClientDataSet;
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
    function GravaLotexDocum(ovLotexDocum : OleVariant) : Boolean;
end;

implementation

{ TCtrlAlteraLote }

constructor TCtrlAlteraLote.Create;
begin
  inherited;
  _CdsLoteXDocum := TClientDataSet.Create(nil);
  _DbLoteXDocum  := TDBLoteXDocum.Create(self); 
end;

destructor TCtrlAlteraLote.Destroy;
begin
  inherited;
  _DbLoteXDocum.Free;
  _CdsLoteXDocum.Free;
end;

procedure TCtrlAlteraLote.DoChangeDataBase;
begin
  inherited;
  _DbLotexDocum.DataBaseName := DataBaseName;
end;

function TCtrlAlteraLote.GravaLotexDocum(ovLotexDocum : OleVariant): Boolean;
var Msg : String;
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

    StartTransaction;
    try
      Result := ApplyCds(_CdsLotexDocum,_DbLotexDocum,[],[]);
      Msg    := _DbLotexDocum.MessageInfo;
      If Not Result Then Raise Exception.create(Msg);
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
begin
  LstSQL := TStringList.Create;
  with LstSQL do
  begin
    Append('SELECT                                             ');
    Append(' (0)as SALDO, D.IDFORCLI, D.CODDOCUMENTO,          ');
    Append('  D.IDPESSOA, D.NODOCUMENTO, D.COMPLDOCUMENTO,     ');
    Append('  D.DATAPROGRAMADA,                                ');
    Append('  D.DATAVENCTO, D.RECPAG, P.NOME, D.STATUS         ');
    Append('FROM DOCUMENTO D, PESSOA P                         ');
    Append('WHERE                                              ');
    Append(' ((D.STATUS=''0'') OR (D.STATUS=''1'') OR (D.STATUS IS NULL)) AND ');
    Append(' ((D.OPERACAO=''2'') OR (D.OPERACAO=''3'') OR (D.OPERACAO=''14'')) AND ');
    Append(' ((D.EMISBLOQ <> ''S'') OR (D.EMISBLOQ IS NULL)) AND ');
    Append(' (D.RECPAG = ' + QuotedStr(sRecPag) + ') AND       ');
    Append(' (D.IDPESSOA = '+ IntToStr(iIDEmpresa) + ') AND    ');

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
  Result := GetDataPacket(LstSQL);
end;

function TCtrlAlteraLote.ListDocumento: OleVariant;
var sSQL : String;
begin
  sSQL := ' SELECT (0)as SALDO,DOCUMENTO.IDFORCLI,DOCUMENTO.CODDOCUMENTO, ' +
          ' DOCUMENTO.IDPESSOA,DOCUMENTO.NoDOCUMENTO,DOCUMENTO.COMPLDOCUMENTO,DOCUMENTO.DATAPROGRAMADA, ' +
          ' DOCUMENTO.DATAVENCTO,DOCUMENTO.RECPAG,PESSOA.NOME,DOCUMENTO.STATUS ' +
          ' FROM DOCUMENTO,PESSOA WHERE DOCUMENTO.CODDOCUMENTO = NULL ';
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
      Append('  LP.NUMLOTE  = LOTEX.NUMLOTE AND '                              );
      Append('  LD.CODDOCUMENTO = DOC.CODDOCUMENTO '                           );
    end;
  end;
  Result := GetDataPacket(LstSQL);
end;

function TCtrlAlteraLote.ListLotexDocum(iIDEmpresa : Integer; sRecPag, sNumLote : String): Olevariant;
var LstSQL : TStrings;
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
    Append('  LD.FLGBAIXA                                    ');
    Append('FROM                                             ');
    Append('  DOCUMENTO D,                                   ');
    Append('  PESSOA P,                                      ');
    Append('  LOTEXDOCUM LD,                                 ');
    Append('  LOTEPAGTO LP                                   ');
    Append('WHERE                                            ');
    Append('  D.IDPESSOA = ' + InttoStr(iIDEmpresa) + ' AND  ');
    Append('  D.RECPAG = ' + QuotedStr(sRecPag) + ' AND      ');
    Append('  LD.NUMLOTE = ' + sNumLote + ' AND              ');
    Append('  LD.FLGBAIXA IS NULL AND                        ');
    Append('  D.IDFORCLI = P.IDPESSOA AND                    ');
    Append('  LD.NUMLOTE = LP.NUMLOTE AND                    ');
    Append('  LD.CODDOCUMENTO = D.CODDOCUMENTO               ');
  end;
  Result := GetDataPacket(LstSQL);
  LstSQL.Free;
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
          '   LD.FLGBAIXA       ' +
          'FROM                 ' +
          '   DOCUMENTO D,      ' +
          '   PESSOA P,         ' +
          '   LOTEXDOCUM LD,    ' +
          '   LOTEPAGTO LP      ' +
          'WHERE   1 = 2';
  Result := GetDataPacket(sSQL);
end;

end.


