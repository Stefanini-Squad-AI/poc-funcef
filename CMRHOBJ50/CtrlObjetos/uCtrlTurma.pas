unit uCtrlTurma;

{-------------------------------------------------------------------------------------------------
Nº SIG......: 78744
Data........: 23/11/2018
Responsável.: Everson Cunha
Descrição...: Alterar a forma de gravação, para primeiro gravar o registro pai (curso) e depois
              o registro filho (turma). fCadCursoMT. Tibero
---------------------------------------------------------------------------------------------------
Nº SOL......: 44964
Data........: 24/05/2017
Responsável.: Peterson Victor
Descrição...: Atualizar a HSTTRN quando alterar a TURMA
---------------------------------------------------------------------------------------------------
Nº SOL......: 245968
Nº PPM......: 635851
Data........: 13/03/2015
Responsavel.: Wylliam Leite da Silva
Descrição...: Coreções no cadastro de cursos
Rotinas.....: .pas
--------------------------------------------------------------------------------------------------
Nº SOL......: 137268-7062
Nº KINTANA..: 1497173
Data........: 11/09/2013
Responsável.: Edilaine Ferraresi
Descrição...: reestruturação da tela de registro coletivo de treinamento
Rotinas.....: registro de turmas
--------------------------------------------------------------------------------------------------}

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
     uCtrlCustomRH, uDbTurma, uDbTurmaxInstrutorInterno, uDbTurmaxInstrutorExterno,
     // Wylliam Leite - SOL:245968 PPM:635851
     Classes;

type
  tpInstrutores = (tpInternos, tpExternos);
  TCtrlTurma = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb : TDbTurma;
    FDbInstrutorI : TDbTurmaxInstrutorInterno;
    FDbInstrutorE : TDbTurmaxInstrutorExterno;

    FCds: TCMClientDataSet;
    FCdsInstInt: TCMClientDataSet;
    FCdsInstExt: TCMClientDataSet;
    FCdsInscritos: TCMClientDataSet;
    procedure SetCds(const Value: TCMClientDataSet);
    procedure SetCdsInstExt(const Value: TCMClientDataSet);
    procedure SetCdsInstInt(const Value: TCMClientDataSet);
    procedure SetCdsInscritos(const Value: TCMClientDataSet);

    function  AtualizaValorInsctritos(iIdTurma : integer; rValor : currency ) : boolean;
    function  ExcluirInscritos( iIdTurma : integer) : boolean;

  protected

  public
    constructor Create; override;
    destructor  Destroy; override;

    property Cds: TCMClientDataSet read FCds write SetCds;
    property CdsInstInt: TCMClientDataSet read FCdsInstInt write SetCdsInstInt;
    property CdsInstExt: TCMClientDataSet read FCdsInstExt write SetCdsInstExt;
    property CdsInscritos : TCMClientDataSet read FCdsInscritos write SetCdsInscritos;

    function Gravar( bCommit : boolean ): boolean;
    function Excluir(bCommit: boolean; iIdTurma : integer): boolean;

    function GetCodigo : integer;
    function GetInstrutores(iIdTurma : integer; sCampoRetorno, sSeparador: string): string;
    function GetQtdInscritos(iIdTurma : integer; const sTipoRegistro : string = '') : integer;

    function ListaTurma( iIdCurso : double ) : OleVariant;
    function ListaCurso( iIdCurso : double ) : OleVariant;

    function ListaDadosTurma( iIdTurma : String; const iIdPessoa : double = -1; const bDadosHistorico : boolean = false) : OleVariant;
    function ListaInscritosTurma(iIdTurma : integer) : OleVariant;
    function ListaInscritosCurso(iIdCurso : double) : OleVariant;
    function ListaTurmasInscritas(iIdPessoa : double) : OleVariant;

    function ListaFuncionarios( lstSituacao : string; const sOrdem : string = ''; prListaInstIntSel: TStringList  = Nil)  : OleVariant;

    // Wylliam Leite - SOL:245968 PPM:635851
    //Foi incluido um parametro na função
    //function ListaInstrutorExterno : OleVariant;
    function ListaInstrutorExterno(prListaInstExtSel: TStringList = Nil) : OleVariant;

    function ListaInstrutorInternoTurma( iIdTurma : integer) : OleVariant;
    function ListaInstrutorExternoTurma( iIdTurma : integer) : OleVariant;

    function ListaInstrutorInternoCurso( iIdCurso : double ) : OleVariant;
    function ListaInstrutorExternoCurso( iIdCurso : double ) : OleVariant;
    function  AtualizaDataHistorico(iIdTurma,iIdCurso : integer;dDataIni,dDataFim : string) : Boolean; //Peterson Victor SIG44864

  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;


{ TCtrlTurma }

function TCtrlTurma.AtualizaValorInsctritos(iIdTurma : integer; rValor: currency): boolean;
var
  sSQL : string;
  iNumInscritos: integer;
  rRateio : double;
begin
  iNumInscritos := FCdsInscritos.RecordCount;
  rRateio := (rValor / iNumInscritos);

  sSQL := 'UPDATE HSTTRN SET VALOR = '+OraNumero( CurrToStr(rRateio))+
          ' WHERE IDTURMA  = '+IntToStr(iIdTurma);

  try
     Result := ExecSQL(sSQL);
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

constructor TCtrlTurma.Create;
begin
  inherited;
  FDb := TDbTurma.Create(Self);
  FDbInstrutorI := TDbTurmaxInstrutorInterno.Create(Self);
  FDbInstrutorE := TDbTurmaxInstrutorExterno.Create(Self);
end;

destructor TCtrlTurma.Destroy;
begin
  FDb.Free;
  FDbInstrutorI.Free;
  FDbInstrutorE.Free;

  if (IsAppServer) then
  begin
    FCds.Free;
    FCdsInstInt.Free;
    FCdsInstExt.Free;
    FCdsInscritos.free;
  end;

  inherited;
end;

procedure TCtrlTurma.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
  FDbInstrutorI.DataBaseName := DataBaseName;
  FDbInstrutorE.DataBaseName := DataBaseName;
end;


function TCtrlTurma.Excluir(bCommit: boolean; iIdTurma : integer): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      if not InTransaction then
         StartTransaction;

      // excluindo instrutores internos
      FCdsInstInt.First;
      while not(FCdsInstInt.EOF) do
      begin
        if FCdsInstInt.FieldByName('IDTURMA').AsInteger = iIdTurma then
           FCdsInstInt.Delete
        else
           FCdsInstInt.next;
      end;

      Result := ApplyCds(FCdsInstInt, FDbInstrutorI, [], []);
      if Result then
      begin
        // excluindo instrutores externo
        FCdsInstExt.First;
        while not(FCdsInstExt.EOF) do
        begin
          if FCdsInstExt.FieldByName('IDTURMA').AsInteger = iIdTurma then
             FCdsInstExt.Delete
          else
             FCdsInstExt.next;
        end;

        Result := ApplyCds(FCdsInstExt, FDbInstrutorE, [], []);
        if (Result) then
        begin
          // inscritos
          Result := ExcluirInscritos( iIdTurma );
          if (Result) then
          begin
            //FCDS.Locate('IDTURMA', iIdTurma, []);
            FCDS.delete;

            Result := ApplyCds(FCds, FDb, [], []);  // grava turma
            if not (Result) then
               raise Exception.Create(FDb.MessageInfo);
          end
          else
            raise Exception.Create(MessageInfo);
        end
        else
          raise Exception.Create(FDbInstrutorE.MessageInfo);
      end
      else
         raise Exception.Create(FDbInstrutorI.MessageInfo);

      if bCommit then
         Commit;

    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlTurma.ExcluirInscritos(iIdTurma: integer): boolean;
var
  sSQL1, sSQL2 : string;
begin
  sSQL1 := 'DELETE FROM INSCRITOSTURMA'+
           ' WHERE IDTURMA  = '+IntToStr( iIdTurma);

  sSQL2 := 'DELETE FROM HSTTRN'+
           ' WHERE IDTURMA  = '+IntToStr( iIdTurma);

  try
     Result := ExecSQL(sSQL1);
     if Result then
        Result := ExecSQL(sSQL2);
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;

end;

function TCtrlTurma.GetCodigo: integer;
begin
  Result := FDb.GetCodigo();
end;

function TCtrlTurma.Gravar( bCommit : boolean ): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCds.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      if not InTransaction then
         StartTransaction;

      FCds.Filtered := false;
      FCds.first;
      while not FCds.eof do
      begin
        if FCds.FieldByName('FLGATUINSCRITOS').AsString = 'S' then
        begin
          AtualizaValorInsctritos(Fcds.FieldByName('IDTURMA').AsInteger, Fcds.FieldByName('VALORCURSO').AsCurrency);
          FCds.next;
        end
        else if FCds.FieldByName('FLGDEL').AsString = 'S' then
        begin
          Excluir(false, Fcds.FieldByName('IDTURMA').AsInteger);
          //FCds.delete;
        end
        else
          FCds.next;
      end;

      Result := ApplyCds(FCds, FDb, [], []);  // grava turma
      if (Result) then
      begin
        Result := ApplyCds(FCdsInstInt, FDbInstrutorI, [], []);
        if (Result) then
        begin
          Result := ApplyCds(FCdsInstExt, FDbInstrutorE, [], []);
          if not(Result) then
            raise Exception.Create(FDbInstrutorE.MessageInfo);
        end
        else
         raise Exception.Create(FDbInstrutorI.MessageInfo);
      end
      else
        raise Exception.Create(FDb.MessageInfo);

      if bCommit then
        Commit;

    except
      on E: Exception do
      begin
       if bCommit then 
          Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlTurma.ListaInscritosTurma(iIdTurma: integer): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT P.RAZAOSOCIAL, H.VALOR, H.DUR_TOT, H.IDPESSOA, H.IDCURSO, H.NUMSEQ, I.IDINSCRITOS, '+
          '       DECODE(H.REGISTRO, ''T'', ''TREINAMENTO'', ''I'', ''INCENTIVO'', '' '')  AS REGISTRO '+
          '  FROM INSCRITOSTURMA I, PESSOA P, HSTTRN H  '+
          ' WHERE P.IDPESSOA = I.IDPESSOA               '+
          '   AND H.IDPESSOA = I.IDPESSOA               '+
          '   AND H.IDTURMA  = I.IDTURMA                '+
          '   AND I.IDTURMA  = '+IntToStr( iIdTurma) +
          ' ORDER BY P.RAZAOSOCIAL ';

  Result := GetDataPacket( sSQL );

end;

function TCtrlTurma.ListaInstrutorExterno(prListaInstExtSel: TStringList  = Nil): OleVariant;
var
  sSQL : string;
  sParametrosSQL: string; // Wylliam Leite - SOL:245968 PPM:635851
  i: Integer;
begin
  // Wylliam Leite - SOL:245968 PPM:635851 - Inicio
  i:= 0;
  sParametrosSQL := '';

  if not (prListaInstExtSel = nil) then
  begin
    for i:=0 to prListaInstExtSel.Count -1 do
    begin
         if (sParametrosSQL = '') then
            sParametrosSQL:= '''' + prListaInstExtSel.Strings[i] + ''''
         else
            sParametrosSQL:= sParametrosSQL +','''+prListaInstExtSel.Strings[i]+'''';
    end;
  end;
  // Wylliam Leite - SOL:245968 PPM:635851 - Fim

  sSQL := 'SELECT ''N'' AS SEL, P.NOME, EX.IDINSTEXT, P.IDPESSOA, -1 AS IDTURMA  '+
          '  FROM INSTRUTOREXTERNO EX, PESSOA P '+
          ' WHERE P.IDPESSOA = EX.IDINSTEXT  ';

          // Wylliam Leite - SOL:245968 PPM:635851
          // Linha add na query para não trazer instrutores
          // já adionados no curso.
          if sParametrosSQL <> '' then
             sSQL:= sSQL + ' AND P.IDPESSOA NOT IN ('+ sParametrosSQL +')';

          sSQL:= sSQL + ' ORDER BY P.NOME ';

  Result := GetDataPacket( sSQL );

end;

function TCtrlTurma.ListaInstrutorExternoTurma(iIdTurma: integer): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT ''N'' AS SEL, P.NOME, EX.IDINSTEXT, P.IDPESSOA, EX.IDTURMA, EX.IDTXIE '+
          '  FROM PESSOA P, TURMAXINST_EXT EX, TURMA TU  '+
          ' WHERE P.IDPESSOA = EX.IDINSTEXT  '+
          '   AND EX.IDTURMA = TU.IDTURMA    '+
          '   AND EX.IDTURMA = '+IntToStr( iIdTurma) +
          ' ORDER BY P.NOME ';

  Result := GetDataPacket( sSQL );

end;

function TCtrlTurma.ListaFuncionarios( lstSituacao : string; const sOrdem : string = ''; prListaInstIntSel: TStringList  = Nil) : OleVariant;
var
  sSQL : string;
  sParametrosSQL: String; // Wylliam Leite - SOL:245968 PPM:635851
  i: Integer; // Wylliam Leite - SOL:245968 PPM:635851
begin
  // Wylliam Leite - SOL:245968 PPM:635851 - Inicio
  i:= 0;
  sParametrosSQL := '';

  if not (prListaInstIntSel = nil) then
  begin
    for i:=0 to prListaInstIntSel.Count -1 do
    begin
         if (sParametrosSQL = '') then
            sParametrosSQL:= '''' + prListaInstIntSel.Strings[i] + ''''
         else
            sParametrosSQL:= sParametrosSQL +','''+prListaInstIntSel.Strings[i]+'''';
    end;
  end;
  // Wylliam Leite - SOL:245968 PPM:635851 - Fim

  // respeitar a ordem dos 4 primeiros campos por causa do grid. Campos novos após o IDTURMA
  sSQL := 'SELECT ''N'' AS SEL, FU.MATRICULA, P.NOME, '+
          '       DECODE(S.TIPOSIT, ''A'', ''Ativo'', ''F'', ''Afastado'', ''D'', ''Demitido'', '' '') TIPOSIT, '+
          '       FU.IDSITFUNC, FU.IDPESSOA, -1 AS IDTURMA '+
          '  FROM FUNCIONARIO FU, PESSOA P, SITFUNC S '+
          ' WHERE P.IDPESSOA = FU.IDPESSOA            '+
          '   AND S.IDSITFUNC = FU.IDSITFUNC          ';

  if lstSituacao <> '' then
     sSQL := sSQL +
          '   AND S.TIPOSIT IN ('+ lstSituacao +')   ';

  // Wylliam Leite - SOL:245968 PPM:635851
  if (sParametrosSQL <> '') then
     sSQL := sSQL + ' AND FU.IDPESSOA NOT IN ('+ sParametrosSQL +')';

  if sOrdem = '' then
     sSQL := sSQL + ' ORDER BY P.NOME'
  else
     sSQL := sSQL + ' ORDER BY '+sOrdem;

  Result := GetDataPacket( sSQL );

end;

function TCtrlTurma.ListaInstrutorInternoTurma(iIdTurma: integer): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT ''N'' AS SEL, FU.MATRICULA, P.NOME, T.IDPESSOA, T.IDTURMA, T.IDTXII '+
          '  FROM FUNCIONARIO FU, PESSOA P, TURMAXINST_INT T, TURMA TU  '+
          ' WHERE P.IDPESSOA = FU.IDPESSOA  '+
          '   AND T.IDPESSOA = FU.IDPESSOA  '+
          '   AND T.IDTURMA  = TU.IDTURMA   '+
          '   AND T.IDTURMA = '+IntToStr( iIdTurma) +
          ' ORDER BY P.NOME ';

  Result := GetDataPacket( sSQL );

end;


function TCtrlTurma.ListaDadosTurma( iIdTurma : string; const iIdPessoa : double; const bDadosHistorico : boolean ) : OleVariant;
var
  sSQL : string;
begin
  if bDadosHistorico then
    sSQL := 'SELECT T.DESCRICAO, H.DATREINI AS DTINI, H.DATREFIM AS DTFIM, T.HRINI, T.HRFIM, T.IDCIDADES, T.IDCURSO, P.RAZAOSOCIAL,  '+
            '       H.VALOR AS VALORCURSO, H.DUR_TOT AS CARGAHORA, CI.NOME, CI.UF, T.CONTEUDO, T.OBSERVACAO, T.IDTURMA, S.VALORTETO, H.IDENTIDINSTR, '+
            '       T.VALORPASS, T.VALORHOSP, T.VALOROUTROS, S.DESCRICAO AS SIGLA '+
            '  FROM TURMA T, CIDADES CI, CURSO C, PESSOA P, HSTTRN H, SIGLACURSO S '+
            ' WHERE CI.IDCIDADES = T.IDCIDADES '+
            '   AND P.IDPESSOA = H.IDENTIDINSTR '+
            '   AND C.IDCURSO = T.IDCURSO '+
            '   AND S.IDSIGLACURSO = C.IDSIGLACURSO '+
            '   AND T.IDTURMA = H.IDTURMA '+
            '   AND H.IDTURMA  in ('+iIdTurma +') '+
            '   AND H.IDPESSOA = '+FloatToStr(iIdPessoa)

  else
    sSQL := 'SELECT T.DESCRICAO, T.DTINI, T.DTFIM, T.HRINI, T.HRFIM, T.IDCIDADES, T.IDCURSO, P.RAZAOSOCIAL, '+
            '       T.CARGAHORA, T.VALORCURSO, CI.NOME, CI.UF, T.CONTEUDO, T.OBSERVACAO, T.IDTURMA, S.VALORTETO, '+
            '       T.VALORPASS, T.VALORHOSP, T.VALOROUTROS, S.DESCRICAO AS SIGLA '+
            '  FROM TURMA T, CIDADES CI, CURSO C, PESSOA P, SIGLACURSO S '+
            ' WHERE CI.IDCIDADES = T.IDCIDADES '+
            '   AND P.IDPESSOA = C.IDENTIDINSTR '+
            '   AND S.IDSIGLACURSO = C.IDSIGLACURSO '+
            '   AND C.IDCURSO = T.IDCURSO '+
            '   AND T.IDTURMA  in ( '+iIdTurma+ ')';

  Result := GetDataPacket( sSQL );

end;


function TCtrlTurma.ListaTurma( iIdCurso : double ): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT T.IDTURMA, T.DESCRICAO, T.DTINI, T.DTFIM, T.HRINI, T.HRFIM, T.IDCIDADES, T.IDCURSO, NVL(IT.QTDINSCR,0) QTDINSCR, '+
          '       T.VALORCURSO, C.NOME, C.UF, T.CONTEUDO, T.OBSERVACAO, T.VALORPASS, T.VALORHOSP, T.VALOROUTROS, T.CARGAHORA, '+
          '       ''N'' FLGDEL, ''N'' FLGATUINSCRITOS '+
          '  FROM TURMA T, CIDADES C, '+
          '       (SELECT I.IDTURMA, COUNT(*) QTDINSCR FROM INSCRITOSTURMA I GROUP BY I.IDTURMA) IT '+
          ' WHERE C.IDCIDADES = T.IDCIDADES '+
          '   AND IT.IDTURMA(+) = T.IDTURMA '+
          '   AND T.IDCURSO  = '+FloatToStr(iIdCurso) +
          ' ORDER BY T.DTINI DESC ';

  Result := GetDataPacket( sSQL );

end;

procedure TCtrlTurma.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
  FCdsInstInt := TCMClientDataSet.Create(nil);
  FCdsInstExt := TCMClientDataSet.Create(nil);
  FCdsInscritos := TCMClientDataSet.Create(nil);
end;

procedure TCtrlTurma.SetCds(const Value: TCMClientDataSet);
begin
  FCds := Value;
end;

procedure TCtrlTurma.SetCdsInstExt(const Value: TCMClientDataSet);
begin
  FCdsInstExt := Value;
end;

procedure TCtrlTurma.SetCdsInstInt(const Value: TCMClientDataSet);
begin
  FCdsInstInt := Value;
end;

procedure TCtrlTurma.SetCdsInscritos(const Value: TCMClientDataSet);
begin
  FCdsInscritos := Value;
end;

function TCtrlTurma.ListaInstrutorExternoCurso(iIdCurso: double): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT '' '' AS SEL, P.NOME, EX.IDINSTEXT, EX.IDTURMA, EX.IDTXIE, P.IDPESSOA '+
          '  FROM PESSOA P, TURMAXINST_EXT EX, TURMA TU  '+
          ' WHERE P.IDPESSOA = EX.IDINSTEXT  '+
          '   AND EX.IDTURMA = TU.IDTURMA    '+
          '   AND TU.IDCURSO = '+FloatToStr( iIdCurso ) +
          ' ORDER BY P.NOME ';

  Result := GetDataPacket( sSQL );

end;

function TCtrlTurma.ListaInstrutorInternoCurso(iIdCurso: double): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT '' '' AS SEL, FU.MATRICULA, P.NOME, T.IDPESSOA, T.IDTURMA, T.IDTXII '+
          '  FROM FUNCIONARIO FU, PESSOA P, TURMAXINST_INT T, TURMA TU  '+
          ' WHERE P.IDPESSOA = FU.IDPESSOA  '+
          '   AND T.IDPESSOA = FU.IDPESSOA  '+
          '   AND T.IDTURMA  = TU.IDTURMA   '+
          '   AND TU.IDCURSO = '+FloatToStr( iIdCurso) +
          ' ORDER BY P.NOME ';

  Result := GetDataPacket( sSQL );

end;


function TCtrlTurma.ListaTurmasInscritas(iIdPessoa: double): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT I.IDINSCRITOS, I.IDTURMA, I.IDPESSOA '+
          '  FROM INSCRITOSTURMA I '+
          ' WHERE I.IDPESSOA = '+FloatToStr( iIdPessoa);

  Result := GetDataPacket( sSQL );

end;

function TCtrlTurma.ListaCurso(iIdCurso: double): OleVariant;
var
  sSQL : string;
begin
  sSQL := 'SELECT C.DESCRICAO, C.IDCURSO, S.SIGLA, P.RAZAOSOCIAL, C.IDENTIDINSTR '+
          '  FROM CURSO C, PESSOA P, SIGLACURSO S '+
          ' WHERE P.IDPESSOA = C.IDENTIDINSTR '+
          '   AND S.IDSIGLACURSO(+) = C.IDSIGLACURSO '+
          '   AND C.IDCURSO = '+FloatToStr(iIdCurso);

  Result := GetDataPacket( sSQL );

end;

function TCtrlTurma.ListaInscritosCurso(iIdCurso: double): OleVariant;
var
  sSQL : string;
begin
  // respeitar a ordem dos 4 primeiros campos por causa do grid. Campos novos após o FLGNOVO
  sSQL := 'SELECT ''N'' SEL, FU.MATRICULA, P.NOME,  '+
          '       DECODE(S.TIPOSIT, ''A'', ''Ativo'', ''F'', ''Afastado'', ''D'', ''Demitido'', '' '') TIPOSIT, '+
          '       I.IDINSCRITOS, I.IDTURMA, I.IDPESSOA, ''N'' FLGNOVO '+
          '  FROM INSCRITOSTURMA I, PESSOA P, TURMA T, FUNCIONARIO FU, SITFUNC S '+
          ' WHERE P.IDPESSOA  = FU.IDPESSOA         '+
          '   AND S.IDSITFUNC = FU.IDSITFUNC        '+
          '   AND FU.IDPESSOA = I.IDPESSOA          '+
          '   AND T.IDTURMA   = I.IDTURMA           '+
          '   AND T.IDCURSO  = '+FloatToStr( iIdCurso) +
          ' ORDER BY FU.MATRICULA ';

  Result := GetDataPacket( sSQL );

end;

function TCtrlTurma.GetInstrutores(iIdTurma : integer; sCampoRetorno, sSeparador: string): string;
var
  sSQL, sLista : string;
begin
  sLista := '';

  sSQL := 'SELECT P.NOME, T.IDPESSOA  '+
          '  FROM PESSOA P, TURMAXINST_INT T   '+
          ' WHERE P.IDPESSOA = T.IDPESSOA      '+
          '   AND T.IDTURMA  = '+IntToStr( iIdTurma )+
          ' union ' +
          'SELECT P.NOME, EX.IDINSTEXT as IDPESSOA '+
          '  FROM PESSOA P, TURMAXINST_EXT EX      '+
          ' WHERE P.IDPESSOA = EX.IDINSTEXT        '+
          '   AND EX.IDTURMA = '+IntToStr( iIdTurma );

  _Cds.data := GetDataPacket( sSQL );
  while not _cds.eof do
  begin
    sLista := sLista + _Cds.FieldByName( sCampoRetorno ).AsString;
    _cds.next;

    if not _cds.eof then
       sLista := sLista + sSeparador;
  end;

  Result := sLista;
end;

function TCtrlTurma.GetQtdInscritos(iIdTurma: integer; const sTipoRegistro : string): integer;
var
  sSQL : string;
begin
  if sTipoRegistro = '' then
     sSQL := 'SELECT Count(*) AS QTDINSCRITOS '+
             '  FROM INSCRITOSTURMA  '+
             ' WHERE IDTURMA  = '+IntToStr( iIdTurma )
  else
     sSQL := 'SELECT Count(IDPESSOA) AS QTDINSCRITOS '+
             '  FROM HSTTRN '+
             ' WHERE IDTURMA  = '+IntToStr( iIdTurma ) +
             '   AND REGISTRO = '+QuotedStr(sTipoRegistro);

  _Cds.data := GetDataPacket( sSQL );

  Result := _Cds.Fields[0].AsInteger;
end;

function TCtrlTurma.AtualizaDataHistorico(iIdTurma,iIdCurso : integer; dDataIni,
  dDataFim: string): Boolean;
var
  sSQL : string;
begin
   if not InTransaction then
      StartTransaction;

  sSQL := ' UPDATE HSTTRN ' +
          ' SET DATREINI            = to_date(' + QuotedStr(dDataIni) + ' , ' + QuotedStr('DD/MM/YYYY') + '), ' +
          '     DATREFIM            = to_date(' + QuotedStr(dDataFim) + ' , ' + QuotedStr('DD/MM/YYYY') + '), ' +
          '     DATPLINI            = to_date(' + QuotedStr(dDataIni) + ' , ' + QuotedStr('DD/MM/YYYY') + '), ' +
          '     DATPLFIM            = to_date(' + QuotedStr(dDataFim) + ' , ' + QuotedStr('DD/MM/YYYY') + ') ' +
          'WHERE (IDCURSO = ' + IntToStr(iIdCurso)+ ')' +
          '      AND (IDTURMA = ' + IntToStr(iIdTurma)+ ')';

  try
     Result := ExecSQL(sSQL);
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;

end;

end.
