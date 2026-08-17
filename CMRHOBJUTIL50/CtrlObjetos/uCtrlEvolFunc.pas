unit uCtrlEvolFunc;

interface

uses SysUtils, Controls, uCmControlObject, uCmDbObject, IvDictio, 
  uCMClientDataSet, uCMTypes, uCtrlCustomRH, uDbEvolFunc, uDbFuncionario;

type
  TCtrlEvolFunc = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FCdsFuncionario: TCMClientDataSet;
    FCdsEvolFunc: TCMClientDataSet;

    FDbFuncionario: TDbFuncionario;
    FDbEvolFunc: TDbEvolFunc;

    FIAppCliente: OleVariant;

    function TransfFichaFinanceira(IdPessoa: double; IdEmpresa, MesTransf, AnoTransf: integer): boolean;
    function TransfLancRubricasPendentes(IdPessoa: double; IdEmpresa: integer): boolean;

    procedure ExecProgresso(const Progresso: string = ''; NumRegistros: integer = 0;
      ProxRegistro: boolean = false);
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListEvolFunc(IdPessoa: double; DataAlterFunc: TDate = 0;
      IdMotivo: double = 0): OleVariant;
    function ListHistoricoEvolFunc(IdPessoa: double): OleVariant;

    function GetSalarioEvolFunc(IdPessoa: double; DataRef: TDate): double;

    function GravarEvolFunc(GravarTabelaFunc: boolean = false): boolean;
    function GravarEvolFuncComTransfHistorico(const IAppCliente: OleVariant;
      TransfFichaFinanc, TransfLancRubPendentes: boolean;
      MesTransf, AnoTransf: integer): boolean;

    property CdsFuncionario: TCMClientDataSet read FCdsFuncionario write FCdsFuncionario;
    property CdsEvolFunc: TCMClientDataSet read FCdsEvolFunc write FCdsEvolFunc;
  end;

implementation

uses  uCtrlFuncoesRH;
//Variants,
const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_HIST_FICHA = 'Não há Histórico da Ficha Financeira a partir de :1 na empresa selecionada.';
  MSG_AVISO_RUB =
    'Algumas Rubricas não foram transferidas pois :1' +
    'não foram habilitadas para a empresa destino. :2 São elas: :3';

{ TCtrlEvolFunc }

constructor TCtrlEvolFunc.Create;
begin
  inherited;
  FDbFuncionario := TDbFuncionario.Create(Self);
  FDbEvolFunc := TDbEvolFunc.Create(Self);
end;

destructor TCtrlEvolFunc.Destroy;
begin
  FDbFuncionario.Free;
  FDbEvolFunc.Free;
  if (IsAppServer) then
  begin
    FCdsEvolFunc.Free;
    FCdsFuncionario.Free;
  end;
  inherited;
end;

procedure TCtrlEvolFunc.OnCreateAppServer;
begin
  inherited;
  FCdsEvolFunc := TCMClientDataSet.Create(nil);
  FCdsFuncionario := TCMClientDataSet.Create(nil);
end;

procedure TCtrlEvolFunc.DoChangeDataBase;
begin
  inherited;
  FDbFuncionario.DataBaseName := DataBaseName;
  FDbEvolFunc.DataBaseName := DataBaseName;
end;

function TCtrlEvolFunc.ListEvolFunc(IdPessoa: double; DataAlterFunc: TDate;
  IdMotivo: double): OleVariant;
var
  sSQL: string;
begin
  // Define Parametros
  if (IdPessoa = -1) then
    sSQL :=
      'WHERE' +CR_LF+
      '  (1 = 2)'
  else
  begin
    sSQL := '';

    if (IdPessoa > 0) then
      sSQL := '  (IDPESSOA = ' +FloatToStr(IdPessoa)+ ')';

    if (DataAlterFunc > 0) then
    begin
      if (IdPessoa > 0) then
        sSQL := sSQL +' AND';

      sSQL := sSQL +CR_LF+'  (DATAALTERFUNC = TO_DATE(' +
        QuotedStr(DateToStr(DataAlterFunc))+ ',''DD/MM/YYYY''))';
    end;

    if (IdMotivo > 0) then
    begin
      if (IdPessoa > 0) or (DataAlterFunc > 0) then
        sSQL := sSQL +' AND';

      sSQL := sSQL +CR_LF+'  (IDMOTIVO = ' +FloatToStr(IdMotivo)+ ')';
    end;

    if (sSQL <> '') then
      sSQL := 'WHERE' +CR_LF+ sSQL;
  end;

  // Define Sql
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  *'+CR_LF+
    'FROM'+CR_LF+
    '  EVOLFUNC'+CR_LF+
    sSQL);
end;

function TCtrlEvolFunc.ListHistoricoEvolFunc(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  H.IDPESSOA, H.DATAALTERFUNC, H.IDEMPRESA, H.IDESTAB,' +CR_LF+
    '  H.IDCARGO, H.CODCENTROCUSTO, H.TIPOPAGAMENTO, H.SALARIO,' +CR_LF+
    '  H.IDMOTIVO, NVL(H.PERC_REAJ,0) AS PERC_REAJ, H.IDFAIXACARGO,' +CR_LF+
    '  H.IDFAIXAFUNCAO, H.NIVELINDIV1, H.NIVELINDIV2, H.IDFUNCAO,' +CR_LF+
    '  H.TRGDTINCLUSAO, M.DESCRICAO, C.TITULO, C2.TITULO AS FUNCAO,' +CR_LF+
    '  P.NOME AS FILIAL, CC.NOME AS CENTROCUSTO' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA P, EVOLFUNC H, MOTIVO M, CARGO C, CARGO C2, CENTCUST CC' +CR_LF+
    'WHERE' +CR_LF+
    '  (H.IDPESSOA       = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    '  (M.GRUPOMOTIVO   IN (''A'',''D'')) AND' +CR_LF+
    '  (H.IDMOTIVO       = M.IDMOTIVO(+)) AND' +CR_LF+
    '  (H.IDCARGO        = C.IDCARGO(+)) AND' +CR_LF+
    '  (H.IDFUNCAO       = C2.IDCARGO(+)) AND' +CR_LF+
    '  (H.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)) AND' +CR_LF+
    '  (H.IDEMPRESA      = CC.IDEMPRESA(+)) AND' +CR_LF+
    '  (H.IDESTAB        = P.IDPESSOA(+))' +CR_LF+
    'ORDER BY' +CR_LF+
    '  H.DATAALTERFUNC DESC, H.TRGDTINCLUSAO DESC');
end;

function TCtrlEvolFunc.GetSalarioEvolFunc(IdPessoa: double; DataRef: TDate): double;
var
  _Cds: TCMClientDataSet;
begin
  _Cds := TCMClientDataSet.Create(nil);

  _Cds.Data := GetDataPacket(
    'SELECT' +CR_LF+
    '  SALARIO' +CR_LF+
    'FROM' +CR_LF+
    '  EVOLFUNC' +CR_LF+
    'WHERE' +CR_LF+
    '  (IDPESSOA      = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    '  (DATAALTERFUNC = (SELECT MAX(DATAALTERFUNC)' +CR_LF+
    '                    FROM   EVOLFUNC' +CR_LF+
    '                    WHERE (IDPESSOA      = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    '                          (DATAALTERFUNC < TO_DATE(' +
    QuotedStr(DateToStr(DataRef))+ ',''DD/MM/YYYY''))))' +CR_LF+
    'ORDER BY' +CR_LF+
    '  TRGDTINCLUSAO DESC');

  Result := _Cds.FieldByName('SALARIO').asFloat;

  _Cds.Free;
end;

function TCtrlEvolFunc.TransfFichaFinanceira(IdPessoa: double; IdEmpresa, MesTransf,
  AnoTransf: integer): boolean;
var
  sListaIdRubrica: string;
  _CdsRub, _CdsNomeRub: TCMClientDataSet;
begin
  _CdsRub := TCMClientDataSet.Create(nil);
  _CdsNomeRub := TCMClientDataSet.Create(nil);
  try
    // Rubricas que estão selecionadas na Empresa Origem (Rubrica x Empresa)
    _CdsRub.Data := GetDataPacket(
      'SELECT DISTINCT' +CR_LF+
      '  IDRUBRICA' +CR_LF+
      'FROM' +CR_LF+
      '  HISTRUBSAL' +CR_LF+
      'WHERE' +CR_LF+
      '  (IDPESSOA   = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
      '  (MES       >= ' +QuotedStr(IntToStr(AnoTransf) +'/'+ PoeZero(MesTransf))+ ') AND' +CR_LF+
      '  (IDPESSJUR <> ' +IntToStr(IdEmpresa)+ ')');

    if (_CdsRub.IsEmpty) then
    begin
      MessageInfo := CR_LF+ ('Aviso:') +CR_LF+
        CMTranslateMsg(MSG_HIST_FICHA, [IntToStr(AnoTransf) +'/'+ PoeZero(MesTransf)]);
      Result := false;
    end
    else      
    begin
      // Enviar mensagem ao cliente
      ExecProgresso('', _CdsRub.RecordCount);

      // Montar lista de rubricas selecionadas
      sListaIdRubrica := '';
      _CdsRub.First;
      repeat
        if (sListaIdRubrica = '') then
          sListaIdRubrica := _CdsRub.FieldByName('IDRUBRICA').asString
        else
          sListaIdRubrica := sListaIdRubrica +','+ _CdsRub.FieldByName('IDRUBRICA').asString;
        _CdsRub.Next;
      until (_CdsRub.EOF);

      // Rubricas que estão selecionadas na Empresa Destino (Rubrica x Empresa)
      _CdsNomeRub.Data := GetDataPacket(
        'SELECT' +CR_LF+
        '  IDRUBRICA, CODPROVDESC CODIGO, DESCRPROVDESC AS NOME' +CR_LF+
        'FROM' +CR_LF+
        '  RUBRICAXPESS' +CR_LF+
        'WHERE' +CR_LF+
        '  (IDPESSOA   = ' +IntToStr(IdEmpresa)+ ') AND' +CR_LF+
        QuebrarListaFiltro(2, '(IDRUBRICA ', sListaIdRubrica, 50));

      MessageInfo := '';
      _CdsRub.First;
      repeat
        if (_CdsNomeRub.Locate('IDRUBRICA', _CdsRub.FieldByName('IDRUBRICA').asString, [])) then
        begin
          Result := ExecSql(
            'UPDATE HISTRUBSAL SET IDPESSJUR = ' +IntToStr(IdEmpresa) +CR_LF+
            'WHERE' +CR_LF+
            '  (IDPESSOA   = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
            '  (IDRUBRICA  = ' +_CdsRub.FieldByName('IDRUBRICA').asString+ ') AND' +CR_LF+
            '  (MES       >= ' +QuotedStr(IntToStr(AnoTransf) +'/'+ PoeZero(MesTransf))+ ') AND' +CR_LF+
            '  (IDPESSJUR <> ' +IntToStr(IdEmpresa)+ ')');

          if not(Result) then
            raise Exception.Create(MessageInfo);
        end
        else
          MessageInfo := MessageInfo +Format('* [%s]: %s',
            [_CdsNomeRub.FieldByName('CODIGO').asString,
             _CdsNomeRub.FieldByName('NOME').asString]) +CR_LF;

        _CdsRub.Next;

        // Enviar mensagem ao cliente
        ExecProgresso('', 0, true);
      until (_CdsRub.EOF);

      Result := true;
      if (MessageInfo <> '') then
        MessageInfo := CMTranslateMsg(MSG_AVISO_RUB, [CR_LF, CR_LF, MessageInfo]);
    end;
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := CR_LF+ ('Erro:') +CR_LF+ E.Message;
    end;
  end;
  _CdsRub.Free;
  _CdsNomeRub.Free;
end;

function TCtrlEvolFunc.TransfLancRubricasPendentes(IdPessoa: double; IdEmpresa: integer): boolean;
begin
  try
    Result := ExecSql(
      'UPDATE RUBRICAINDIV SET IDEMPRESA = ' +IntToStr(IdEmpresa) +CR_LF+
      'WHERE' +CR_LF+
      '  (IDPESSOA       = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
      '  (IDEMPRESA     <> ' +IntToStr(IdEmpresa)+ ') AND' +CR_LF+
      '  ((FLGPERMANENTE = 1) OR' +CR_LF+
      '   (PARCELAS      > NUMOCORRENCIAS))');

    if not(Result) then
      raise Exception.Create(MessageInfo);
  except
    on E: Exception do
    begin
      Result := false;
      MessageInfo := E.Message;
    end;
  end;
end;

procedure TCtrlEvolFunc.ExecProgresso(const Progresso: string; NumRegistros: integer;
  ProxRegistro: boolean);
begin
  try
    FIAppCliente.ExecProgresso_CB(Progresso, NumRegistros, ProxRegistro);
  except
  end;
end;

function TCtrlEvolFunc.GravarEvolFuncComTransfHistorico(const IAppCliente: OleVariant;
  TransfFichaFinanc, TransfLancRubPendentes: boolean; MesTransf, AnoTransf: integer): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarEvolFuncComTransfHistorico(IAppCliente,
      FCdsFuncionario.Data, FCdsEvolFunc.Data, TransfFichaFinanc, TransfLancRubPendentes,
      MesTransf, AnoTransf);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    FIAppCliente := IAppCliente;
    MessageInfo := '';
    try
      StartTransaction;

      // Gravar dados da Evolução Funcional
      Result := ApplyCds(FCdsEvolFunc, FDbEvolFunc, [], [], true);
      if (Result) then
      begin
        // Gravar dados funcionais
        Result := ApplyCds(FCdsFuncionario, FDbFuncionario, [], []);
        if (Result) then
        begin
          if (TransfFichaFinanc) then
          begin
            // Enviar mensagem ao cliente
            ExecProgresso(('Transferindo Ficha Financeira...'));

            // Gravar dados da transferência da Ficha Financeira
            if (TransfFichaFinanceira(FCdsEvolFunc.FieldByName('IDPESSOA').asFloat,
                FCdsEvolFunc.FieldByName('IDEMPRESA').asInteger, MesTransf, AnoTransf)) then
              MessageInfo := ('Transferência da Ficha Financeira efetuada.')+
                IFF(MessageInfo='', '', CR_LF+CR_LF + MessageInfo)
            else
              raise Exception.Create(
                ('Não foi possível efetuar a transferência da Ficha Financeira.')+
                CR_LF+ MessageInfo);
          end;

          if (TransfLancRubPendentes) then
          begin
            // Enviar mensagem ao cliente
            ExecProgresso(('Transferindo Lançamentos Pendentes...'));

            // Gravar dados da transferência dos Lançamentos Pendentes
            if (TransfLancRubricasPendentes(
               FCdsEvolFunc.FieldByName('IDPESSOA').asFloat,
               FCdsEvolFunc.FieldByName('IDEMPRESA').asInteger)) then
              MessageInfo := MessageInfo +CR_LF+
                ('Transferência dos Lançamentos Pendentes efetuada.')
            else
              raise Exception.Create(
                ('Não foi possível efetuar a transferência dos Lançamentos Pendentes.')+
                CR_LF+ ('Erro:') +CR_LF+ MessageInfo);
          end;
        end
        else
          raise Exception.Create(FDbFuncionario.MessageInfo);
      end
      else
        raise Exception.Create(FDbEvolFunc.MessageInfo);

      // Enviar mensagem ao cliente
      if (TransfFichaFinanc) or (TransfLancRubPendentes) then
        ExecProgresso(('Gravando alterações...'));

      Commit;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlEvolFunc.GravarEvolFunc(GravarTabelaFunc: boolean): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarEvolFunc(FCdsFuncionario.Data, FCdsEvolFunc.Data,
      GravarTabelaFunc);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsEvolFunc, FDbEvolFunc, [], [], true);
      if (Result) and (GravarTabelaFunc) then
      begin
        Result := ApplyCds(FCdsFuncionario, FDbFuncionario, [], []);
        if not(Result) then
          raise Exception.Create(FDbFuncionario.MessageInfo);
      end
      else
        raise Exception.Create(FDbEvolFunc.MessageInfo);

      Commit;
    except
      on E: Exception do
      begin
        Rollback;
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.
