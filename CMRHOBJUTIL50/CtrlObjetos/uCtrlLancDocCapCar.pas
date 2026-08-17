unit uCtrlLancDocCapCar;

{$I VERSAO_PADRAO.INC}

interface

uses SysUtils, Classes, Db, uCmControlObject, uCMTypes, uCMTranslate, uCMClientDataSet,
  uCMSqlParams, uCtrlPadroes, uCtrlDocumento, uCtrlImpostoRetido, uCtrlFuncoesRH;

const
  MSG_ERRO_ALTERAR_DOC = 'Erro ao Alterar documento' + CR_LF;
  MSG_ERRO_EXCLUIR_DOC = 'Erro ao excluir documento' + CR_LF;
  MSG_ERRO_EXCLUI_RECBTOPAGTO = 'Erro ao excluir lançamentos de baixa' + CR_LF;

type
  TCtrlLancDocCapCar = class(TCmControlObject)
  private
    FCtrlDocumento: TCtrlDocumento;
    FCtrlImposto: TCtrlImpostoRetido;
    FCtrlPadroes: TCtrlPadroes;

    FCdsDocumento: TCMClientDataSet;
    FCdsRateio: TCMClientDataSet;

    FCodDocumento: double;
    FNumSlip: string;
    FIdHotel: double;
  protected
    procedure AfterInitialize; override;
    procedure OnCreateAppServer; override;
  public
    constructor Create(IdHotel: double); reintroduce;
    destructor  Destroy; override;

    function  LerSequencia(Tabela: string): double;
    procedure FechaDataSet;

    function ListDocumento(const CodDocumento: double): OleVariant;
    function ListRateio(const CodDocumento: double): OleVariant;
    function ListLancamento(const CodDocumento: double): OleVariant;
    function ListAlteradores(const CodDocumento: double): OleVariant;

    function ProcessaDocumento(
      IdUsuario, IdEspAcesso, UnidNegoc: Integer; UsaPlanoPatro, EnglobaParcela: boolean;
      Operacao: TOperacao; DataRegularizacao, DataDispFinanc: TDateTime): boolean;

    property CdsDocumento: TCMClientDataSet read FCdsDocumento write FCdsDocumento;
    property CdsRateio: TCMClientDataSet read FCdsRateio write FCdsRateio;
    property CodDocumento: double read FCodDocumento;
    property NumSlip: string read FNumSlip;
  end;

implementation

uses JclMath, Controls;

{ TCtrlLancDocCapCar }

constructor TCtrlLancDocCapCar.Create(IdHotel: double);
begin
  inherited Create;

  FCtrlDocumento := TCtrlDocumento.Create;
  {$IFDEF PADRAO_7_09_00}
  FCtrlDocumento.IdHotel := Trunc(FIdHotel);
  {$ENDIF}

  FCtrlImposto := TCtrlImpostoRetido.Create;
  FCtrlPadroes := TCtrlPadroes.Create;

  FIdHotel := IdHotel;
end;

destructor TCtrlLancDocCapCar.Destroy;
begin
  FCtrlPadroes.Free;
  FCtrlDocumento.Free;
  FCtrlImposto.Free;

  if (IsAppServer) then
  begin
    FCdsDocumento.Free;
    FCdsRateio.Free;
  end;
  inherited;
end;

procedure TCtrlLancDocCapCar.AfterInitialize;
begin
  inherited;
  FCtrlPadroes.InitializeAs(Self);
  FCtrlPadroes.OpenTransaction := false;

  FCtrlDocumento.InitiAlizeAs(Self);
  FCtrlDocumento.OpenTransaction := false;

  FCtrlImposto.InitializeAs(Self);
  FCtrlImposto.OpenTransaction := false;
end;

function TCtrlLancDocCapCar.ListDocumento(const CodDocumento: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  D.CODDOCUMENTO, D.CODPORTFORMA, D.CODSUBCONTA, D.IDPESSOA,' +CR_LF+
    '  D.PLANO, D.PLACONTA, D.MOECODIGO, D.NUMSLIP, D.EMISBLOQ,' +CR_LF+
    '  RTRIM(D.CODCENTROCUSTO) AS CODCENTROCUSTO, D.IDFORCLI,' +CR_LF+
    '  D.IDMODULO, D.CODTIPDOC, D.RECPAG, D.NODOCUMENTO,' +CR_LF+
    '  D.COMPLDOCUMENTO, D.DATAEMISSAO, D.DATAVENCTO, D.DATAPROGRAMADA,' +CR_LF+
    '  D.STATUS, D.NUMFATURA, D.OPERACAO, D.IDUSUARIOINCLUSAO,' +CR_LF+
    '  L.NUMLANCTO, L.CODALTERADOR, L.PLNCODIGO, L.DATALANCTO,' +CR_LF+
    '  L.VALOR, L.VALOROUTRAMOEDA, L.ESTORNO, L.DEBCRE,' +CR_LF+
    '  L.HISTORICOCOMPL, R.CODLANCFINANC, R.NUMLOTE, R.NUMCHQBORDERO,' +CR_LF+
    '  R.DATACFLOAT, P.NOME, D.CODFORMA, D.NUMLEITCODBARRAS,' +CR_LF+
    '  D.NUMDIGCODBARRAS, L.NUMFATURA, L.FLGTIPOFATURA,' +CR_LF+
    '  L.VLRLIQUIDO, D.UNIDNEGOC, D.REFERENCIA, D.OBS, D.NUMAPGR,' +CR_LF+
    '  D.NUMAPGR AS OLDAPGR, US.NOMEUSUARIO, D.IDCBANCARIA,' +CR_LF+
    '  C.CONTACORRENTE, B.NUMBANCO, A.NUMAGENCIA,' +CR_LF+
    '  C.TIPOCONTA, D.DATADISPONIB, D.CODFISCAL,' +CR_LF+
    '  DECODE(C.TIPOCONTA,' +CR_LF+
    '    ''1'', ' +QuotedStr(CMTranslate('Conta Corrente'))+ ',' +CR_LF+
    '    ''2'', ' +QuotedStr(CMTranslate('Cartão Salário'))+ ',' +CR_LF+
    '    ''3'', ' +QuotedStr(CMTranslate('Conta Poupança'))+ ',' +CR_LF+
    '    '''') AS DESCTIPOCONTA' +CR_LF+
    'FROM' +CR_LF+
    '  DOCUMENTO D, LANCTODOCUM L, RECBTOPAGTO R, PESSOA P,' +CR_LF+
    '  USUARIOSISTEMA US, CONTABANCARIA C, AGENCIABANCARIA A, BANCO B' +CR_LF+
    'WHERE' +CR_LF+
    '  (D.CODDOCUMENTO      = ' +FloatToStr(CodDocumento)+ ') AND' +CR_LF+
    '  (D.CODDOCUMENTO      = L.CODDOCUMENTO) AND' +CR_LF+
    '  (D.OPERACAO          = L.OPERACAO) AND' +CR_LF+
    '  (R.CODDOCUMENTO(+)   = L.CODDOCUMENTO) AND' +CR_LF+
    '  (R.NUMLANCTO(+)      = L.NUMLANCTO) AND' +CR_LF+
    '  (P.IDPESSOA          = D.IDFORCLI) AND' +CR_LF+
    '  (D.IDUSUARIOINCLUSAO = US.IDUSUARIO) AND' +CR_LF+
    '  (C.IDCBANCARIA(+)    = D.IDCBANCARIA) AND' +CR_LF+
    '  (C.IDAGENCIA         = A.IDPESSOA(+)) AND' +CR_LF+
    '  (A.IDBANCO           = B.IDPESSOA(+))');
end;

function TCtrlLancDocCapCar.ListRateio(const CodDocumento: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  R.CODDOCUMENTO, R.CODTIPRECDES, R.RECPAG, R.IDPESSOA, R.IDRESERVAORCAMEN,' +CR_LF+
    '  RTRIM(R.CODCENTRORESPON) AS CODCENTRORESPON, R.UNIDNEGOC, R.MOECODIGO,' +CR_LF+
    '  R.VALOR, R.VALOROUTRAMOEDA, T.PLACONTACREDITO, R.IDUSUARIOINCLUSAO, U.NOME,' +CR_LF+
    '  C.NOME, RTRIM(R.CODCENTROCUSTO) AS CODCENTROCUSTO, R.IDRATEIODOCUM,' +CR_LF+
    '  T.DESCRICAO, I.MOESIGLA, CC.NOME AS NOMECENTROCUSTO, R.PLANO, R.IDPATRO,' +CR_LF+
    '  R.IDPROGRAMA, R.NUMIMOVEL, PATRO.NOME AS NOMEPATRO, PLANO.NOME AS DESCPLANO,' +CR_LF+
    '  PROGRAMA.DESCPROGRAMA, T.HITCODHIST, R.IDPLANOPREV, RESERVAORCAMEN.NUMRESERVA,' +CR_LF+
    '  T.FLGOBRIGARESERVA, RESERVAORCAMEN.NUMRESERVA AS NUMRESERVAOLD,' +CR_LF+
    '  R.VALOR AS VALORRESERVAOLD, R.VLRRESORCAMEN, T.CODSUBCONTA' +CR_LF+
    'FROM' +CR_LF+
    '  RATEIODOCUM R, UNIDNEGOCIO U, CENTRESPON C, TIPORECEBDESEMB T, MOEDA I,' +CR_LF+
    '  CENTCUST CC, PESSOA PATRO, PLANPREVCONTABIL PLANO, PROGRAMA, RESERVAORCAMEN' +CR_LF+
    'WHERE' +CR_LF+
    '  (R.CODDOCUMENTO     = ' +FloatToStr(CodDocumento)+ ') AND' +CR_LF+
    '  (R.CODTIPRECDES     = T.CODTIPRECDES) AND' +CR_LF+
    '  (R.RECPAG           = T.RECPAG) AND' +CR_LF+
    '  (R.IDPESSOA         = T.IDPESSOA) AND' +CR_LF+
    '  (R.UNIDNEGOC        = U.UNIDNEGOC) AND' +CR_LF+
    '  (R.IDPESSOA         = U.IDPESSOA) AND' +CR_LF+
    '  (R.MOECODIGO        = I.MOECODIGO(+)) AND' +CR_LF+
    '  (R.CODCENTRORESPON  = C.CODCENTRORESPON(+)) AND' +CR_LF+
    '  (R.IDPESSOA         = C.IDPESSOA(+)) AND' +CR_LF+
    '  (R.IDPESSOA         = CC.IDEMPRESA(+)) AND' +CR_LF+
    '  (R.CODCENTROCUSTO   = CC.CODCENTROCUSTO(+)) AND' +CR_LF+
    '  (R.IDPLANOPREV      = PLANO.IDPLANOPREV(+)) AND' +CR_LF+
    '  (R.IDPROGRAMA       = PROGRAMA.IDPROGRAMA(+)) AND' +CR_LF+
    '  (R.IDPATRO          = PATRO.IDPESSOA(+)) AND' +CR_LF+
    '  (R.IDRESERVAORCAMEN = RESERVAORCAMEN.IDRESERVAORCAMEN(+))' +CR_LF+
    'ORDER BY' +CR_LF+
    '  T.DESCRICAO, U.NOME, C.NOME, NOMECENTROCUSTO, R.VALOR');
end;

function TCtrlLancDocCapCar.ListLancamento(const CodDocumento: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  L.CODDOCUMENTO, L.NUMLANCTO, L.CODALTERADOR, L.PLNCODIGO, L.DATALANCTO,' +CR_LF+
    '  L.VALOR, L.VALOROUTRAMOEDA, L.DEBCRE, L.OPERACAO, L.HISTORICOCOMPL,' +CR_LF+
    '  L.IDUSUARIOINCLUSAO, L.ESTORNO, R.CODDOCUMENTO, R.NUMLANCTO, R.IDUSUARIOINCLUSAO,' +CR_LF+
    ' R.CODLANCFINANC, R.CODPORTFORMA, R.NUMLOTE, R.NUMCHQBORDERO, R.DATACFLOAT' +CR_LF+
    'FROM' +CR_LF+
    '  LANCTODOCUM L, RECBTOPAGTO R' +CR_LF+
    'WHERE' +CR_LF+
    '  (L.CODDOCUMENTO    = ' +FloatToStr(CodDocumento)+ ') AND' +CR_LF+
    '  (R.CODDOCUMENTO(+) = L.CODDOCUMENTO) AND' +CR_LF+
    '  (R.NUMLANCTO(+)    = L.NUMLANCTO)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  L.DATALANCTO');
end;

function TCtrlLancDocCapCar.ListAlteradores(const CodDocumento: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  A.DESCRICAO, LC.DATALANCTO, LC.VALOROUTRAMOEDA, LC.VALOR, LC.HISTORICOCOMPL,' +CR_LF+
    '  LC.DEBCRE, LC.VLRLIQUIDO, LC.UNIDNEGOC, LC.IDPESSOA, U.NOME,' +CR_LF+
    '  A.CODALTERADOR, (''S'') AS CONTABILIZA, CONVERTE' +CR_LF+
    'FROM' +CR_LF+
    '  LANCTODOCUM LC, TIPOALTERADOR A, UNIDNEGOCIO U' +CR_LF+
    'WHERE' +CR_LF+
    '  (LC.CODDOCUMENTO = ' +FloatToStr(CodDocumento)+ ') AND' +CR_LF+
    '  (LC.CODALTERADOR = A.CODALTERADOR) AND' +CR_LF+
    '  (LC.UNIDNEGOC    = U.UNIDNEGOC(+)) AND' +CR_LF+
    '  (LC.IDPESSOA     = U.IDPESSOA(+))');
end;

procedure TCtrlLancDocCapCar.OnCreateAppServer;
begin
  inherited;
  FCdsDocumento := TCMClientDataSet.Create(nil);
  FCdsRateio := TCMClientDataSet.Create(nil);
end;

function TCtrlLancDocCapCar.ProcessaDocumento(
  IdUsuario, IdEspAcesso, UnidNegoc: Integer; UsaPlanoPatro, EnglobaParcela: boolean;
  Operacao: TOperacao; DataRegularizacao, DataDispFinanc: TDateTime): boolean;
var
  iCodDocumento, iNumLancto: integer;
  iIdEmpresa, iIdModulo: integer;
  sDscLog: string;

  procedure InicializaImposto;
  begin
    FCtrlImposto.NumLanctoOrigem := 0;
    FCtrlImposto.PartidaDobrada := false;
    FCtrlImposto.IdPlanoConta := FCdsDocumento.FieldByName('PLANO').asInteger;
    FCtrlImposto.IntegraContab := false;
    FCtrlImposto.IdEmpresa := FCdsDocumento.FieldByName('IDPESSOA').asInteger;
    FCtrlImposto.RecPag := FCdsDocumento.FieldByName('RECPAG').asString[1];
    FCtrlImposto.IdUsuario := IdUsuario;
    FCtrlImposto.IdModulo := FCdsDocumento.FieldByName('IDMODULO').asInteger;
    FCtrlImposto.DataProgramada := FCdsDocumento.FieldByName('DATAPROGRAMADA').asDateTime;
    FCtrlImposto.OperacaoDocumento := '2';
    FCtrlImposto.IdForCli := FCdsDocumento.FieldByName('IDFORCLI').asInteger;
    FCtrlImposto.CodDocumento := iCodDocumento;
    FCtrlImposto.NumLancto := iNumLancto;
    FCtrlImposto.ValorLancto := FCdsDocumento.FieldByName('VALOR').asFloat;
    FCtrlImposto.ValorLiquido := 0;
    FCtrlImposto.DataLancto := FCdsDocumento.FieldByName('DATALANCTO').asDateTime;
    FCtrlImposto.DataEmissao := FCdsDocumento.FieldByName('DATAEMISSAO').asDateTime;
    FCtrlImposto.DebCre := FCdsDocumento.FieldByName('DEBCRE').asString;
    FCtrlImposto.MomentoLancamento := mlLancamento;
    FCtrlImposto.CodTipoDoc := FCdsDocumento.FieldByName('CODTIPDOC').asInteger;
  end;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ProcessaDocumento(FIdHotel, IdUsuario,
      IdEspAcesso, UnidNegoc, UsaPlanoPatro, EnglobaParcela, Integer(Operacao),
      DataRegularizacao, DataDispFinanc, FCdsDocumento.Data, FCdsRateio.Data,
      FCodDocumento, FNumSlip);

    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := true;

    if (Operacao = opApagar) then
      FCdsDocumento.StatusFilter := [usDeleted]
    else
      FCdsDocumento.StatusFilter := [];

    // Setar variáveis para as rotinas de Log
    iIdEmpresa := FCdsDocumento.FieldByName('IDPESSOA').asInteger;
    iIdModulo := FCdsDocumento.FieldByName('IDMODULO').asInteger;

    // Incializar a CtrlDocumento
    if (EnglobaParcela) then
      FCtrlDocumento.Prepare(OpDocumento, odlAParcelar)
    else
    begin
      FCtrlDocumento.Prepare(OpDocumento, odlEfetivo);
      FCtrlDocumento.DataDisponibilidade := DataDispFinanc;
    end;

    FCtrlDocumento.IdEspAcesso := IdEspAcesso;
    FCtrlDocumento.IdUsuario := IdUsuario;
    FCtrlDocumento.IdModulo := FCdsDocumento.FieldByName('IDMODULO').asInteger;
    FCtrlDocumento.UsaPlanoPatro := UsaPlanoPatro;
    FCtrlDocumento.SlipAutomatico := false;

    try
      StartTransaction;

      case (Operacao) of
        opAlterar :
        begin
          sDscLog := CMTranslate('Alterar Documento');

          // Atribuir os valores para a Alteração do Documento
          FCtrlDocumento.SetValues(
            FCdsDocumento.FieldByName('CODDOCUMENTO').asInteger,
            FCdsDocumento.FieldByName('NODOCUMENTO').asFloat,
            FCdsDocumento.FieldByName('COMPLDOCUMENTO').asString,
            '', FCdsDocumento.FieldByName('RECPAG').asString, '',
            FCdsDocumento.FieldByName('NUMSLIP').asString,
            FCdsDocumento.FieldByName('NUMLEITCODBARRAS').asString,
            FCdsDocumento.FieldByName('PLACONTA').asString,
            FCdsDocumento.FieldByName('CODCENTROCUSTO').asString, '',
            FCdsDocumento.FieldByName('NUMDIGCODBARRAS').asString, '', '', '',
            FCdsDocumento.FieldByName('EMISBLOQ').asString,
            FCdsDocumento.FieldByName('REFERENCIA').asString,
            FCdsDocumento.FieldByName('OBS').asString,
            FCdsDocumento.FieldByName('DATAVENCTO').asDateTime,
            FCdsDocumento.FieldByName('DATAEMISSAO').asDateTime,
            FCdsDocumento.FieldByName('DATAPROGRAMADA').asDateTime, 0, 0, 0, 0, 0, 0, 0, 0,
            FCdsDocumento.FieldByName('CODTIPDOC').asInteger,
            FCdsDocumento.FieldByName('IDPESSOA').asInteger,
            FCdsDocumento.FieldByName('IDMODULO').asInteger,
            FCdsDocumento.FieldByName('IDFORCLI').asInteger,
            FCdsDocumento.FieldByName('NUMFATURA').asInteger,
            FCdsDocumento.FieldByName('IDCBANCARIA').asInteger,
            FCdsDocumento.FieldByName('UNIDNEGOC').asInteger,
            FCdsDocumento.FieldByName('PLANO').asInteger, 0,
            FCdsDocumento.FieldByName('NUMAPGR').asInteger,
            FCdsDocumento.FieldByName('MOECODIGO').asInteger, 0, 0,
            FCdsDocumento.FieldByName('IDUSUARIOINCLUSAO').asInteger,
            FCdsDocumento.FieldByName('IDPESSOA').asInteger, 0, 0,
            FCdsDocumento.FieldByName('CODSUBCONTA').asInteger,
            FCdsDocumento.FieldByName('CODPORTFORMA').asInteger, 0, 0,
            FCdsDocumento.FieldByName('CODFORMA').asInteger,
//            {$IFDEF PADRAO_7_09_00}
            Trunc(FIdHotel),
//            {$ELSEIF Defined(PADRAO_7_08_06)}
//            0);
//            {$ELSE}
            '', 0);
//            {$IFEND}

          FCtrlDocumento.LanctoDocum.SetValues(
            FCdsDocumento.FieldByName('DATALANCTO').asDateTime,
            FCdsDocumento.FieldByName('CODDOCUMENTO').asInteger,
            FCdsDocumento.FieldByName('NUMLANCTO').asInteger,
            FCdsDocumento.FieldByName('VLRLIQUIDO').asFloat,
            FCdsDocumento.FieldByName('VALOROUTRAMOEDA').asFloat,
            FCdsDocumento.FieldByName('VALOR').asFloat, 0, 0, 0,
            IdUsuario, FCdsDocumento.FieldByName('IDPESSOA').asInteger, 0, 0,
            FCdsDocumento.FieldByName('CODTIPDOC').asInteger, 0, 0, '', '', '',
            FCdsDocumento.FieldByName('NUMFATURA_1').asString,
            FCdsDocumento.FieldByName('HISTORICOCOMPL').asString,
            FCdsDocumento.FieldByName('COMPLDOCUMENTO').asString, '', '',
            FCtrlDocumento.GetDebCre(FCdsDocumento.FieldByName('CODTIPDOC').asInteger),
            FCdsDocumento.FieldByName('IDMODULO').asInteger,
            FCdsDocumento.FieldByName('PLANO').asInteger, UsaPlanoPatro);

          FCdsRateio.First;
          while not(FCdsRateio.EOF) do
          begin
            FCtrlDocumento.RateioDocum.SetValues(
              FCdsRateio.FieldByName('VALOR').asFloat,
              FCdsRateio.FieldByName('VALOROUTRAMOEDA').asFloat,
              FCdsRateio.FieldByName('VLRRESORCAMEN').asFloat,
              FCdsRateio.FieldByName('IDRATEIODOCUM').asInteger,
              FCdsDocumento.FieldByName('IDPESSOA').asInteger,
              FCdsDocumento.FieldByName('CODDOCUMENTO').asInteger,
              FCdsRateio.FieldByName('UNIDNEGOC').asInteger,
              FCdsDocumento.FieldByName('MOECODIGO').asInteger,
              FCdsDocumento.FieldByName('IDUSUARIOINCLUSAO').asInteger,
              FCdsRateio.FieldByName('IDRESERVAORCAMEN').asInteger,
              FCdsDocumento.FieldByName('PLANO').asInteger,
              FCdsRateio.FieldByName('IDPLANOPREV').asInteger,
              FCdsRateio.FieldByName('IDPATRO').asInteger,
              FCdsRateio.FieldByName('IDPROGRAMA').asInteger, 0,
              FCdsDocumento.FieldByName('IDPESSOA').asInteger,
              FCdsRateio.FieldByName('CODTIPRECDES').asString,
              FCdsDocumento.FieldByName('RECPAG').asString,
              FCdsRateio.FieldByName('CODCENTRORESPON').asString,
              FCdsRateio.FieldByName('CODCENTROCUSTO').asString,
              FCdsRateio.FieldByName('NUMIMOVEL').asString);

            FCdsRateio.Next;
          end;

          if not(FCtrlDocumento.Update) then
            raise Exception.Create(MSG_ERRO_ALTERAR_DOC + FCtrlDocumento.MessageInfo);

          if (IsFloatZero(FCtrlDocumento.CodDocumento)) then
            FCtrlDocumento.CodDocumento := FCdsDocumento.FieldByName('CODDOCUMENTO').asInteger;

          if (IsFloatZero(FCtrlDocumento.Lanctodocum.NumLancto)) then
            FCtrlDocumento.Lanctodocum.NumLancto := FCdsDocumento.FieldByName('NUMLANCTO').asInteger;

          iCodDocumento := Trunc(FCtrlDocumento.CodDocumento);
          iNumLancto := FCtrlDocumento.Lanctodocum.NumLancto;

          FCodDocumento := iCodDocumento;
          FNumSlip := FCtrlDocumento.NumSlip;

          FCdsDocumento.Edit;
          if IsFloatZero(FCdsDocumento.FieldByName('CODDOCUMENTO').asFloat) then
            FCdsDocumento.FieldByName('CODDOCUMENTO').asFloat := iCodDocumento;

          if IsFloatZero(FCdsDocumento.FieldByName('NUMLANCTO').asFloat) then
            FCdsDocumento.FieldByName('NUMLANCTO').asFloat := iNumLancto;
          FCdsDocumento.Post;

          // Se o CodLancFinanc estiver preenchido será efetuada a exclusão do
          // lançamento para efetivação das alterações
          if not(IsFloatZero(FCdsDocumento.FieldByName('CODLANCFINANC').asFloat)) then
            if not(FCtrlDocumento.RecbToPagto.Excluir(
                   FCdsDocumento.FieldByName('CODDOCUMENTO').asInteger,
                   FCdsDocumento.FieldByName('NUMLANCTO').asInteger)) then
              raise Exception.Create(MSG_ERRO_EXCLUI_RECBTOPAGTO + FCtrlDocumento.MessageInfo);

          // Calcular o Imposto/Agragados no momento do lançamento do documento
          InicializaImposto;

          FCtrlImposto.NumLanctoOrigem := iNumLancto;
          FCtrlImposto.Excluir;

          InicializaImposto;
          FCtrlImposto.Incluir;
        end;
        else // opApagar
        begin
          sDscLog := CMTranslate('Excluir Documento');
          FCtrlDocumento.CodDocumento := FCdsDocumento.FieldByName('CODDOCUMENTO').asInteger;

          if (FCtrlDocumento.Delete) then
          begin
            FCdsDocumento.EmptyDataSet;
            FCdsRateio.EmptyDataSet;
          end
          else
            raise Exception.Create(MSG_ERRO_EXCLUIR_DOC + FCtrlDocumento.MessageInfo);
        end;
      end;

      if not(FCtrlPadroes.GravaLogOperacoes(
             iIdEmpresa, iIdModulo, IdUsuario, sDscLog, false)) then
        raise Exception.Create(FCtrlPadroes.MessageInfo);

      Commit;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
    FCdsDocumento.StatusFilter := [];
  end;
end;

function TCtrlLancDocCapCar.LerSequencia(Tabela: string): double;
begin
  Result := GetSequence(Tabela);
end;

procedure TCtrlLancDocCapCar.FechaDataSet;
begin
  if (FCdsDocumento.Active) then
  begin
    FCdsDocumento.EmptyDataSet;
    FCdsDocumento.Close;
    FCdsDocumento.Active := false;
  end;

  if (FCdsRateio.Active) then
  begin
    FCdsRateio.EmptyDataSet;
    FCdsRateio.Close;
    FCdsRateio.Active := false;
  end;
end;

end.
