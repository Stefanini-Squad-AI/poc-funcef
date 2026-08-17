{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Marcos Inacio da Luz            }
{ Atualizado Em: 23/01/2002                             }
{                                                       }
{*******************************************************}

unit uCtrlLivroICMS;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbNflivro, uDbNfLivroDetalhe, uSistema, DB, DbClient, classes,
     {$IFNDEF VERSAO0505} uCMTypes {$ENDIF};

  Type
    TCtrlLivroICMS = Class(TCmControlObject)

    private
    FDbNfLivro: TDbNfLivro;
    FDbNfLivroDetalhe : TDbNfLivroDetalhe;

    FCdsNflivro: TClientDataSet;
    FCdsNflivroDetalhe: TClientDataSet;
    CdsAux : TClientDataSet;

    procedure SetDbNflivroDetalhe(const Value: TDbNflivrodetalhe);
    procedure SetCdsNflivroDetalhe(const Value: TClientDataSet);

    procedure SetDbNflivro(const Value: TDbNflivro);
    procedure SetCdsNflivro(const Value: TClientDataSet);


    protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;

    public
      Constructor Create; Override;
      Destructor Destroy; Override;

      property CdsNflivroDetalhe: TClientDataSet   read FCdsNflivroDetalhe write SetCdsNflivroDetalhe;
      property CdsNflivro: TClientDataSet          read FCdsNflivro        write SetCdsNflivro;
      property DbNflivroDetalhe: TDbNflivroDetalhe read FDbNfLivroDetalhe  write SetDbNflivroDetalhe;
      property DbNflivro: TDbNflivro               read FDbNflivro         write setDbNflivro;


      {Grava os Livros no Banco de Dados}
      Function GravarLivro : Boolean;

      {Apaga os Livros do Bandco de Dados}
      Function ExcluirLivro : Boolean;

      {Aplica as alteraçòes pendentes no ClientDataSet}
      function AplicaAlteracoes(Const cds : OleVariant) : Boolean;
      {Faz a query para verificar se o documento já existe}
      function ListValidaDoc(IdForCli, IdPessoa, NumNfINI : LongInt; Complemento, FlgEntradaSaida : String) : OleVariant;
      {Pega o último idnflivro inserido na tabela nflivro}
      function GetLastIdnflivro : LongInt;
      {Lista um livro caso o mesmo tenha sido gerado pelo VHL}
      function ListLivroVHL(flagSerie, DataRef : string) : OleVariant;
      {retorna um detalhe do livro com o id e a aliquota especificado, caso exista}
      function VerificaDetalhe(Idnflivro : integer; Aliquota : Real) : OleVariant;
      {verifica se o livro especificado tem algum detalhe}
      function VerificaDetalheDoLivro(Idnflivro : integer) : OleVariant;
      {Lista as notas emitidas}
      function ListNotasEmitidas(IdEmpresa, IdDocumento : longInt; DataIni, DataFim : string) : OleVariant;
      {procura o livro especificado}
      function ProcurarLivro(IdNflivro : string) : OleVariant;
      {procura os detalhes do livro especificado}
      function ProcurarDetalhe(IdNflivro : string) : OleVariant;
      {Lista as notas recebidas - CAPCAR - Clementino - Vampeta}
      function ListNotasRecebidas(IdEmpresa : longInt; DataIni, DataFim : string) : OleVariant;

    protected

    End;

implementation

{ TCtrlLivroICMS }




constructor TCtrlLivroICMS.Create;
begin
  inherited;
  FDbNflivroDetalhe := TDbNflivroDetalhe.Create(Self);
  FDbNflivro   := TDbNflivro.create(Self);
end;

destructor TCtrlLivroICMS.Destroy;
begin
  FDbNflivrodetalhe.Free;
  FDbNflivro.Free;
  if isAppServer then
    Begin
      FCdsNflivrodetalhe.Free;
      FCdsNflivro.free;
      CdsAux.free;
    end;
  inherited;
end;

procedure TCtrlLivroICMS.DoChangeDataBase;
begin
  inherited;
  DbNflivroDetalhe.DataBaseName := DataBaseName;
  DbNflivro.DataBaseName   := DataBaseName;
end;




procedure TCtrlLivroICMS.SetCdsNflivro(
  const Value: TClientDataSet);
begin
  FCdsNflivro := Value;
end;

procedure TCtrlLivroICMS.SetCdsNflivroDetalhe(
                                        const Value: TClientDataSet);
begin
  FCdsNflivroDetalhe := Value;
end;


procedure TCtrlLivroICMS.SetDbNflivro(
        const Value: TDbNflivro);
begin
  FDbNflivro := Value;
end;

procedure TCtrlLivroICMS.SetDbNflivroDetalhe(
  const Value: TDbNflivroDetalhe);
begin
  FDbNflivroDetalhe := Value;
end;


function TCtrlLivroICMS.ListValidaDoc(IDFORCLI, IDPESSOA, NUMNFINI : LongInt; Complemento, FlgEntradaSaida : String) : OleVariant;
var
  sSql : string;
begin
  Ssql := 'SELECT IDNFLIVRO '+
          '  FROM NFLIVRO '+
          ' WHERE (IDPESSOA = '+intTostr(IDPESSOA)+ ') '+
          '   AND (IDFORCLI = '+intTostr(IDFORCLI)+ ') '+
          '   AND (RTRIM(NUMNFINI)= '+intTostr(NUMNFINI)+') '+
          '   AND FLGENTRADASAIDA = '+quotedStr(FlgEntradaSaida)+' ';

  if Trim(Complemento) <> '' then
     Ssql := Ssql + '   AND (RTRIM(NFCOMPLEMENTO)=RTRIM('+quotedStr(Complemento)+')) ';

  Result := GetDataPacket(ssql);

end;

function TCtrlLivroICMS.AplicaAlteracoes(Const cds: OleVariant) : Boolean;
begin
  If ConnectionSide = cnsClient Then
    Begin
      Result := Connection.AppServer.AplicaAlteracoes(cds);
      if not Result then
         MessageInfo := Connection.AppServer.MessageInfo;
    end
  else
    Begin
      try
        Result := True;
        Cdsaux.data := cds;
        ApplyCds(cdsAux, DbNflivro, [], []);
      except
        Result := False;
      end;
    end;
end;

function TCtrlLivroICMS.GravarLivro: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.GravarLivro(FCdsNflivro.data, FCdsNflivroDetalhe.data); //GravaSCPrePronta ( Fcds.Data, FcdsItem.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;
           // Pai
           Result := ApplyCds(FCdsNflivro,FDbNfLivro,[],[] );
           Msg    := FDbNfLivro.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           // itens Filhos
           Result := ApplyCds(FCdsNflivroDetalhe,FDbNfLivroDetalhe,
                    [FDbNfLivro.Idnflivro],[FDbNfLivroDetalhe.Idnflivro] );
           Msg    := FDbNfLivroDetalhe.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Commit;
        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;
end;

function TCtrlLivroICMS.ExcluirLivro: Boolean;
Var
   Msg  : String;
begin
  If ConnectionSide = cnsClient Then
  Begin
     Result := Connection.AppServer.ExcluirLivro(FCdsNflivro.data, FCdsNflivroDetalhe.data); //ExcluirSCPrePronta ( Fcds.Data, FcdsItem.Data );
     If Not Result Then
        MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
     Begin
        Try
           StartTransaction;
           // itens Filhos
           Result := ApplyCds(FCdsNflivroDetalhe,FDbNfLivroDetalhe,[],[] );
           Msg    := FDbNfLivroDetalhe.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           // Pai
           Result := ApplyCds(FCdsNflivro,FDbNfLivro,[],[] );
           Msg    := FDbNfLivro.MessageInfo;
           If Not Result Then Raise Exception.Create(Msg);

           Commit;
        except
           On E:Exception Do
            Begin
               Rollback;
               Result := False;
               MessageInfo := E.Message;
            End;
        End;
     End;
end;


function TCtrlLivroICMS.GetLastIdnflivro: LongInt;
Var
  Ssql : string;
begin
  with _Cds do
    Begin
      Ssql            := 'SELECT MAX(IDNFLIVRO) IDNFLIVRO FROM NFLIVRO';
      Data := GetDataPacket(Ssql);
      Result := fieldByname('IDNFLIVRO').AsInteger;
    end;
end;

function TCtrlLivroICMS.ListLivroVHL(flagSerie,
                                     DataRef: string): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT IDNFLIVRO, NUMNFINI, NUMNFFIM, OBSERVACAO ' +
          '  FROM NFLIVRO ' +
          ' WHERE (DATAENTRADANF = TO_DATE('+quotedStr(DataRef)+',''DD/MM/YYYY'')) ' +
          '   AND (FLGENTRADASAIDA = ''I'') ';

 if Trim(FLAGSERIE) = '' then
    Ssql := Ssql + ' AND (NFCOMPLEMENTO IS NULL) '
 else
    Ssql := Ssql + ' AND (NFCOMPLEMENTO = '''+flagSerie+''') ';
 Result := GetDataPacket(Ssql);
end;

function TCtrlLivroICMS.VerificaDetalhe(Idnflivro: integer;
                                        Aliquota: Real): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT IDNFLIVRODETALHE,IDNFLIVRO ' +
          '  FROM NFLIVRODETALHE ' +
          ' WHERE (IDNFLIVRO = '+intTostr(Idnflivro)+') ' +
          '   AND (ALIQUOTA = '+floatTostr(Aliquota)+') ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlLivroICMS.VerificaDetalheDoLivro(
                        Idnflivro: integer): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT IDNFLIVRODETALHE,IDNFLIVRO ' +
          '  FROM NFLIVRODETALHE ' +
          ' WHERE (IDNFLIVRO = '+IntToStr(Idnflivro)+') ';
  Result := GetDataPacket(Ssql);
end;

function TCtrlLivroICMS.ListNotasEmitidas(IdEmpresa, IdDocumento : Integer; DataIni,
                                          DataFim: string): OleVariant;
Var
  Ssql : TstringList;
begin
  Ssql := tstringList.create;
  Ssql.Append('SELECT LPAD(RTRIM(NVL(P.NUMDOCUMENTO,''0'')),14,''0'') CNPJ, P.RAZAOSOCIAL, ');
  Ssql.Append('       TO_CHAR(NF.DATAEMISSAONF,''DD/MM/YYYY'') DATAEMISSAONF, ');
  Ssql.Append('       NVL(RPAD(RTRIM(SUBSTR(NF.NFCOMPLEMENTO,1,3)),3,'' ''),''U    '') SERIE, ');
  Ssql.Append('       LPAD(RTRIM(SUBSTR(NF.NUMNFINI,1,8)),8,''0'') NUMNOTAFISCAL, ');
  Ssql.Append('       SUM(NVL(NF.VLRTOTALNF * 100, 0)) VALORCONTABIL, SUM(NVL(NFD.BASECALCULO * 100, 0)) AS BASECALCULO, ');
  Ssql.Append('       DECODE(RTRIM(NF.OBSERVACAO),''Cancelada'',''C'',''A'') TIPO, ');
  Ssql.Append('       SUM(DECODE(RTRIM(NF.OBSERVACAO),''Cancelada'',0,NVL(NFD.VALORIMPOSTO * 100, 0))) VALORIMPOSTO, ');
  Ssql.Append('       LPAD(RTRIM(NVL(DOC.NUMDOCUMENTO, '''')),14,''0'')  CPFCNPJ, ');
  Ssql.Append('       DECODE(UPPER(C.NOME), ''SÃO PAULO'', ''SÃO PAULO'', ''OUTROS MUNICÍPIOS'') ');
  Ssql.Append('       AS NOME, DECODE(RTRIM(NF.OBSERVACAO),''Cancelada'', ''ERRO PREENCHIMENTO'', DECODE(UPPER(C.NOME), ''SÃO PAULO'', NF.OBSERVACAO, NF.OBSERVACAO || UPPER(C.NOME))) AS OBSERVACAO, (NFD.ALIQUOTA * 10) AS ALIQUOTA ');
  Ssql.Append('  FROM NFLIVRO NF, NFLIVRODETALHE NFD, PESSOA P, PESSOA PE, ENDPESS EN, CIDADES C, (SELECT IDPESSOA, NUMDOCUMENTO FROM DOCPESSOA WHERE IDDOCUMENTO = '+intTostr(IdDocumento)+ ') DOC ');
  Ssql.Append(' WHERE NF.IDNFLIVRO = NFD.IDNFLIVRO(+) ');
  Ssql.Append('   AND NF.IDPESSOA = P.IDPESSOA ');
  Ssql.Append('   AND NF.IDFORCLI = PE.IDPESSOA(+) ');
  Ssql.Append('   AND NF.IDFORCLI = DOC.IDPESSOA(+) ');
  Ssql.Append('   AND PE.IDENDCORRESP = EN.IDENDERECO(+) ');
  Ssql.Append('   AND EN.IDCIDADES = C.IDCIDADES(+) ');
  Ssql.Append('   AND NF.FLGENTRADASAIDA = ''I'' ');
  Ssql.Append('   AND NF.DATAEMISSAONF >= TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') ');
  Ssql.Append('   AND NF.DATAEMISSAONF <= TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY'') ');
  Ssql.Append('   AND NF.IDPESSOA = '+intTostr(IdEmpresa) + ' ' );
  Ssql.Append(' GROUP BY P.NUMDOCUMENTO, NF.DATAEMISSAONF, NF.NFCOMPLEMENTO, NF.NUMNFINI, DECODE(RTRIM(NF.OBSERVACAO),''Cancelada'',''C'',''A''), ');
  Ssql.Append('          DECODE(RTRIM(NF.OBSERVACAO),''Cancelada'', ''ERRO PREENCHIMENTO'', DECODE(UPPER(C.NOME), ''SÃO PAULO'', NF.OBSERVACAO, NF.OBSERVACAO || UPPER(C.NOME))), PE.NUMDOCUMENTO, ');
  Ssql.Append('          DECODE(UPPER(C.NOME), ''SÃO PAULO'', ''SÃO PAULO'', ''OUTROS MUNICÍPIOS''), NF.OBSERVACAO, NFD.ALIQUOTA, DOC.NUMDOCUMENTO, P.RAZAOSOCIAL ');
  Ssql.Append(' ORDER BY DATAEMISSAONF');
  Result := GetDataPacket(Ssql);
end;

function TCtrlLivroICMS.ProcurarLivro(IdNflivro: string): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT * '+
          '  FROM NFLIVRO '+
          ' WHERE IDNFLIVRO = '+IdNflivro;
  Result := GetDataPacket(Ssql);
end;

function TCtrlLivroICMS.ProcurarDetalhe(IdNflivro: string): OleVariant;
Var
  Ssql : string;
begin
  Ssql := 'SELECT * '+
          '  FROM NFLIVRODETALHE '+
          ' WHERE IDNFLIVRO = '+IdNflivro;
  Result := GetDataPacket(Ssql);
end;

function TCtrlLivroICMS.ListNotasRecebidas(IdEmpresa: Integer; DataIni,
                                           DataFim: string): OleVariant;
Var
  Ssql : string;
begin
   Ssql := 'SELECT LPAD(RTRIM(NVL(P.NUMDOCUMENTO,''0'')),14,''0'') AS DOCUMENTO, ' +
           '       TO_CHAR(L.DATALANCTO,''DD/MM/YYYY'') AS DATALANCTO, ' +
           '       DECODE(T.FLGSERVICO,''F'',NVL(RPAD(RTRIM(SUBSTR(D.COMPLDOCUMENTO,1,3)),3,'' ''),''U  ''),''000'') AS SERIE, ' +
           '       LPAD(RTRIM(SUBSTR(D.NODOCUMENTO,1,8)),8,''0'') AS NODOCUMENTO, ' +
           '       (NVL(L.VALOR, 0) * 100) AS VALOR, DECODE(T.FLGSERVICO,''F'',''N'',''R'') AS FLGSERVICO, ' +
           '       DECODE(LD.VALORISS,NULL,''N'',''S'') AS TIPO, (NVL(LD.VALORISS, 0) * 100) AS VALORISS, ' +
           '       ((NVL(LD.VALORISS, 0) / NVL(L.VALOR, 0)) * 100)  AS ALIQUOTA, '+
           '       LPAD(RTRIM(NVL(PE.NUMDOCUMENTO,''0'')),14,''0'') AS NUMDOCUMENTO, ' +
           '       DECODE(UPPER(C.NOME), ''SALVADOR'', ''SSA'', ''OUT'') AS NOMEMUN,  '+
           '       DECODE(UPPER(C.NOME), ''SÃO PAULO'', ''SÃO PAULO'', ''OUTROS MUNICÍPIOS'') AS NOME, D.OBS '+
           '  FROM DOCUMENTO D, LANCTODOCUM L, PESSOA P, PESSOA PE, ENDPESS EN, CIDADES C, ' +
           '       TIPODOCRECPAG T, (SELECT LD.CODDOCUMENTO, SUM(DECODE(LD.DEBCRE,''D'',LD.VALOR,(LD.VALOR*-1))) AS VALORISS ' +
           '                           FROM ALTXIMPOSTO I, LANCTODOCUM LD ' +
           '                          WHERE (I.CODIMPOSTO = 15) ' +
           '                            AND (LD.CODALTERADOR = I.CODALTERADOR) ' +
           '                          GROUP BY LD.CODDOCUMENTO) LD ' +
           ' WHERE L.DATALANCTO >= TO_DATE('+quotedStr(DataIni)+',''DD/MM/YYYY'') ' +
           '   AND L.DATALANCTO <= TO_DATE('+quotedStr(DataFim)+',''DD/MM/YYYY'') ' +
           '   AND (D.RECPAG = ''P'') ' +
           '   AND (D.IDPESSOA = '+IntToStr(IdEmpresa)+') ' +
           '   AND (D.IDPESSOA = P.IDPESSOA) ' +
           '   AND (D.CODDOCUMENTO = L.CODDOCUMENTO) ' +
           '   AND (LD.CODDOCUMENTO(+) = L.CODDOCUMENTO) ' +
           '   AND (T.CODTIPDOC = D.CODTIPDOC) ' +
           '   AND (T.FLGSERVICO IN (''F'',''O'')) ' +
           '   AND (D.OPERACAO = L.OPERACAO) ' +
           '   AND (L.ESTORNO IS NULL) ' +
           '   AND (D.IDFORCLI = PE.IDPESSOA(+)) '+
           '   AND PE.IDENDCORRESP = EN.IDENDERECO(+) '+
           '   AND EN.IDCIDADES = C.IDCIDADES(+) ';
    result := GetDataPacket(Ssql);
end;

procedure TCtrlLivroICMS.OnCreateAppServer;
begin
  inherited;
  FCdsNflivrodetalhe := TClientDataSet.Create(nil);
  FcdsNflivro := TClientDataSet.Create(nil);
  CdsAux := TClientDataSet.Create(nil);
end;

end.






