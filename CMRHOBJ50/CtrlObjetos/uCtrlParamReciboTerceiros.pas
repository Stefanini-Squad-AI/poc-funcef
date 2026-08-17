// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit uCtrlParamReciboTerceiros;

interface

uses SysUtils, Controls, classes, uCmControlObject, uCmDbObject, uCmClientDataSet, uCMTypes,
  uCtrlCustomRH, uCtrlFuncoesRH, uCtrlIntegraRH, uCtrlCtFolha, uCtrlBancoPortFolha,
  uCtrlListTerceirosRH, USistema;

const
  // Mensagens de PROCESSAMENTO
  MSG_SEL_DADOS_PESSOAS = 'Selecionando dados das Pessoas...';
  MSG_PROCESSANDO = 'Processando informações...';
  MSG_GERACAO_CAP_OK = 'Contas a Pagar efetuada com sucesso.' +CR_LF+ 'Documento(s) Nº.: ';
  // Mensagens de AVISO
  // Mensagens de ERRO
  MSG_ERRO_SEL_DADOS_RUBRICA = 'Parametrização incorreta para a Rubrica Nº ';
  MSG_ERRO_SEL_DADOS_PESSOAS = 'Não há dados a serem processados para esta competência ou' +CR_LF+
    'Dados Cadastrais incompletos.';
  MSG_ERRO_GERACAO_CAP = 'Ocorreu um erro durante o processamento da integração.' +CR_LF+
    'Consulte Resultado da geração para maiores detalhes.';

type
  TCtrlParamReciboTerceiros = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  private
    FCtrlListTerceirosRH: TCtrlListTerceirosRH;
    FCtrlCtFolha: TCtrlCtFolha;
    FCtrlBancoPortFolha: TCtrlBancoPortFolha;
    FCtrlIntegraRH: TCtrlIntegraRH;
    FCdsPrincipal: TCMClientDataSet;
    FCdsDocumentos: TCMClientDataSet;

    FIdBanco: integer;
    FPortadorFormaPadrao: integer;
    FIdEmpresa: integer;

    FIdRubrica: double;

    FRateioCC: boolean;

    FNomeTabela: string;
    FAnoMes: string;
    FListaIdFavorecido: string;
    FListaIdTipoFolha: string;

    function  AbrirQueryPrincipal: boolean;
    procedure ExecMensagem(MsgErro: boolean; MensagemErro: string);
  public
    constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce; 
    destructor  Destroy; override;

    function ListFavorecidos(IdEmpresa: integer): OleVariant;

    function GerarIntegracaoCAP(DataRef, DataEmissao, DataPagamento: TDate; IdEmpresa,
      IdModulo, IdUsuario: integer; ListaIdTipoFolha, ListaIdFavorecido: string;
      Previa, RateioCC, ObrigaAbc, ObrigaCRespon: boolean; PlanoPrevGlobal,
      PatroGlobal, CodTipDoc: integer; UsaPlanoPatro: boolean): boolean;
  end;

implementation

{ TCtrlParamReciboTerceiros }

constructor TCtrlParamReciboTerceiros.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); 
begin
  inherited Create;
  SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FCtrlListTerceirosRH := TCtrlListTerceirosRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlCtFolha := TCtrlCtFolha.Create;
  FCtrlBancoPortFolha := TCtrlBancoPortFolha.Create;
  FCtrlIntegraRH := TCtrlIntegraRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
end;

destructor TCtrlParamReciboTerceiros.Destroy;
begin
  FCtrlListTerceirosRH.Free;
  FCtrlCtFolha.Free;
  FCtrlBancoPortFolha.Free;
  FCtrlIntegraRH.Free;
  inherited;
end;

procedure TCtrlParamReciboTerceiros.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlParamReciboTerceiros.AfterInitialize;
begin
  inherited;
  FCtrlListTerceirosRH.InitializeAs(Self);
  FCtrlCtFolha.InitializeAs(Self);
  FCtrlBancoPortFolha.InitializeAs(Self);
  FCtrlIntegraRH.InitializeAs(Self);
end;

procedure TCtrlParamReciboTerceiros.DoChangeDataBase;
begin
  inherited;
  FCtrlListTerceirosRH.DataBase := DataBase;
  FCtrlCtFolha.DataBase := DataBase;
  FCtrlBancoPortFolha.DataBase := DataBase;
  FCtrlIntegraRH.DataBase := DataBase;
end;

function TCtrlParamReciboTerceiros.ListFavorecidos(IdEmpresa: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.IDPESSOA, UPPER(DECODE(P.TIPO,''F'',P.NOME,P.RAZAOSOCIAL)) AS NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P,'+CR_LF+
    '  (SELECT DISTINCT'+CR_LF+
    '     RI.IDFAVORECIDO'+CR_LF+
    '   FROM'+CR_LF+
    '     RUBRICAINDIV RI, RUBRICAXPESS RP'+CR_LF+
    '   WHERE'+CR_LF+
    '     (RP.IDPESSOA      = ' +IntToStr(IdEmpresa)+ ') AND'+CR_LF+
    '     (RI.IDFAVORECIDO IS NOT NULL) AND'+CR_LF+
    '     (RI.FLGTPRUBMANUT = ''2'') AND'+CR_LF+
    '     (RP.IDPESSOA      = RI.IDEMPRESA) AND'+CR_LF+
    '     (RP.IDRUBRICA     = RI.IDRUBRICA)) HIST'+CR_LF+
    'WHERE'+CR_LF+
    '  (HIST.IDFAVORECIDO = P.IDPESSOA) AND'+CR_LF+
    '  (P.NOME           IS NOT NULL)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  UPPER(NOME)');
end;

function TCtrlParamReciboTerceiros.AbrirQueryPrincipal: boolean;
var
  _SQL: TStringList;
begin
  _SQL := TStringList.Create;
  with (_SQL) do
  begin
    Clear;
    Add('SELECT');
    Add('  HIST.IDEMPRESA, F.CODCENTROCUSTO,');
    Add('  PFAV.NOME AS FAVORECIDO, PFAV.IDPESSOA AS IDFAVORECIDO,');
    Add('  HIST.IDRUBRICA, HIST.VALOR');
    Add('FROM');
    Add('  PESSOA PFAV, FUNCIONARIO F,');
    // ------------------------------------------------------------------ //
    // Histórico de Rubricas
    Add('  (SELECT');
    Add('     RI.IDEMPRESA, RI.IDFAVORECIDO, H.IDRUBRICA, H.IDPESSOA,');
    Add('     SUM(H.VALORPROVENTO) AS VALOR');
    Add('   FROM');
    Add('     ' +FNomeTabela+ ' H, RUBRICAINDIV RI');
    Add('   WHERE');

    if (Pos(',',FListaIdFavorecido) > 0) then
      Add('     (RI.IDFAVORECIDO   IN (' +FListaIdFavorecido+ ')) AND')
    else
      Add('     (RI.IDFAVORECIDO    = ' +FListaIdFavorecido+ ') AND');

    Add('     (RI.FLGTPRUBMANUT   = ''2'') AND');
    Add('     (((RI.FLGPERMANENTE = 0) AND');
    Add('       (RI.ANOMESINICIO  = ' +FAnoMes+ ')) OR');
    Add('      (RI.FLGPERMANENTE  = 1)) AND');
    Add('     (H.MES              = ' +FAnoMes+ ') AND');

    if (FListaIdTipoFolha <> '') then
    begin
      if (Pos(',',FListaIdTipoFolha) > 0) then
        Add('     (H.IDMOTIVO        IN (' +FListaIdTipoFolha+ ')) AND')
      else
        Add('     (H.IDMOTIVO         = ' +FListaIdTipoFolha+ ') AND');
    end;

    Add('     (RI.IDEMPRESA       = ' +IntToStr(FIdEmpresa)+ ') AND');
    Add('     (RI.IDRUBRICA       = H.IDRUBRICA) AND');
    Add('     (RI.IDPESSOA        = H.IDPESSOA)');
    Add('   GROUP BY RI.IDEMPRESA, RI.IDFAVORECIDO, H.IDRUBRICA, H.IDPESSOA) HIST');
    // ------------------------------------------------------------------ //
    Add('WHERE');

    if (Pos(',',FListaIdFavorecido) > 0) then
      Add('  (PFAV.IDPESSOA IN (' +FListaIdFavorecido+ ')) AND')
    else
      Add('  (PFAV.IDPESSOA  = ' +FListaIdFavorecido+ ') AND');

    Add('  (PFAV.IDPESSOA  = HIST.IDFAVORECIDO) AND');
    Add('  (HIST.IDPESSOA  = F.IDPESSOA)');
    Add('ORDER BY');
    Add('  PFAV.IDPESSOA, HIST.IDRUBRICA');
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  DoProgresso([MSG_SEL_DADOS_PESSOAS, 0, false, '']);
  FCdsPrincipal.Data := GetDataPacket(_SQL);
  DoProgresso(['', FCdsPrincipal.RecordCount, false, '']);

  Result := not(FCdsPrincipal.IsEmpty);
  if not(Result) then
    MessageInfo := MSG_ERRO_SEL_DADOS_PESSOAS;
end;

procedure TCtrlParamReciboTerceiros.ExecMensagem(MsgErro: boolean; MensagemErro: string);
begin
  if (MsgErro) then
    DoProgresso(['', 0, false,
      '[Erro] Geração dos dados para o Contas a Pagar'+CR_LF+
      'Favorecido.......: ' +FCdsPrincipal.FieldByName('FAVORECIDO').asString+CR_LF+
      IFF(FRateioCC, 'Centro de Custo: ' +
        FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString+CR_LF, '')+
      'Rubrica............: ' +FloatToStr(FIdRubrica)+CR_LF+
      MensagemErro+CR_LF+
      Replicate('-',92)])
  else
    DoProgresso(['', 0, false,
      '[Ok] Geração dos dados para o Contas a Pagar'+CR_LF+
      'Favorecido.......: ' +FCdsPrincipal.FieldByName('FAVORECIDO').asString+CR_LF+
      IFF(FRateioCC, 'Centro de Custo: ' +
        FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString+CR_LF, '')+
      'Rubrica............: ' +FloatToStr(FIdRubrica)+CR_LF+
      Replicate('-',92)]);
end;

function TCtrlParamReciboTerceiros.GerarIntegracaoCAP(DataRef, DataEmissao, DataPagamento: TDate;
  IdEmpresa, IdModulo, IdUsuario: integer; ListaIdTipoFolha, ListaIdFavorecido: string;
  Previa, RateioCC, ObrigaAbc, ObrigaCRespon: boolean; PlanoPrevGlobal, PatroGlobal,
  CodTipDoc: integer; UsaPlanoPatro: boolean): boolean;
var
  iPlano: integer;
  bTransacaoAberta: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GerarIntegracaoCAP(DataRef, DataEmissao, DataPagamento,
      IdEmpresa, IdModulo, IdUsuario, ListaIdTipoFolha, ListaIdFavorecido, Previa, RateioCC,
      ObrigaAbc, ObrigaCRespon, PlanoPrevGlobal, PatroGlobal, CodTipDoc, UsaPlanoPatro,
      FCdsPrincipal.Data, FCdsDocumentos.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := false;
    bTransacaoAberta := false;
    try
      FCdsPrincipal := TCMClientDataSet.Create(nil);
      FCdsDocumentos := TCMClientDataSet.Create(nil);

      if (Previa) then
        FNomeTabela := 'PREVIAFOLPAG'
      else
        FNomeTabela := 'HISTRUBSAL';

      FIdEmpresa := IdEmpresa;
      FAnoMes := QuotedStr(IntToStr(ExtraiAno(DataRef)) +'/'+ PoeZero(ExtraiMes(DataRef)));
      FListaIdTipoFolha := ListaIdTipoFolha;
      FListaIdFavorecido := ListaIdFavorecido;
      FRateioCC := RateioCC;

      FCtrlIntegraRH.CdsDocumentos := FCdsDocumentos;
      FCtrlIntegraRH.ObrigaAbc := ObrigaAbc;
      FCtrlIntegraRH.ObrigaCRespon := ObrigaCRespon;
      FCtrlIntegraRH.IdEmpresa := IdEmpresa;
      FCtrlIntegraRH.IdModulo := IdModulo;
      FCtrlIntegraRH.IdUsuario := IdUsuario;
      FCtrlIntegraRH.CodTipDoc := CodTipDoc;

      try
        // Portador Forma Padrão
        FPortadorFormaPadrao := FCtrlBancoPortFolha.GetCodPortFormaPadrao;
        // Banco que a Empresa possui conta
        FIdBanco := FCtrlBancoPortFolha.GetBancoEmpresa(FPortadorFormaPadrao);
        // Plano de Contas da Empresa
        iPlano := FCtrlListTerceirosRH.GetPlano(FIdEmpresa);

        // Montar Querys
        if not(AbrirQueryPrincipal) or not(FCtrlIntegraRH.AbrirQueryDocumentos) then
          raise Exception.Create(MessageInfo);

        DoProgresso([MSG_PROCESSANDO, 0, false, '']);

        // Início da Transação
        StartTransaction;
        bTransacaoAberta := true;

        FCdsPrincipal.First;
        // LOOP para a geração da Linhas de Integração
        while not(FCdsPrincipal.EOF) do
        begin
          FIdRubrica := FCdsPrincipal.FieldByName('IDRUBRICA').asFloat;
          _Cds.Data := FCtrlCtFolha.ListContabFolhaXEmpresa(FIdRubrica, FIdEmpresa,
            FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString);

          if (_Cds.IsEmpty) then
            _Cds.Data := FCtrlCtFolha.ListContabFolhaXEmpresa(FIdRubrica, FIdEmpresa, '');

          // Criar Documento
          if not(_Cds.IsEmpty) then
          begin
            if (_Cds.FieldByName('CODTIPRECDES').asString <> '') then
            begin
              if not(FCtrlIntegraRH.SetDadosDocumento(-1, -1, iPlano,
                IFF(_Cds.FieldByName('UNIDNEGOC').asInteger<>0,
                  _Cds.FieldByName('UNIDNEGOC').asInteger, -1), FPortadorFormaPadrao,
                FCdsPrincipal.FieldByName('IDFAVORECIDO').asInteger, '',
                _Cds.FieldByName('CODCENTRORESPON').asString,
                _Cds.FieldByName('CODTIPRECDES').asString,
                'P', IFF(_Cds.FieldByName('FLGDESCONTO').asInteger=0, 'D', 'C'),
                FCdsPrincipal.FieldByName('VALOR').asFloat, 0,
                IFF(FRateioCC, FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString, ''),
                FIdBanco)) then
                raise Exception.Create(FCtrlIntegraRH.MessageInfo);
            end;
          end
          else
            raise Exception.Create(MSG_ERRO_SEL_DADOS_RUBRICA + FloatToStr(FIdRubrica));

          // Gravo no Banco os Documentos
          if (FCtrlIntegraRH.GravarDocumentos(false, 0, FPortadorFormaPadrao,
            DataEmissao, DataPagamento, RateioCC, UsaPlanoPatro, PlanoPrevGlobal,
            PatroGlobal,0,'')) then
          begin
            ExecMensagem(false, '');
            MessageInfo := MSG_GERACAO_CAP_OK + FCtrlIntegraRH.NumDocGerados;
          end
          else
            raise Exception.Create(FCtrlIntegraRH.MessageInfo);

          FCdsDocumentos.EmptyDataSet;
          FCdsPrincipal.Next;
          DoProgresso(['', 0, true, '']);
        end;
        Commit;

        Result := true;
      except
        on E: Exception do
        begin
          if (bTransacaoAberta) then
            Rollback;

          ExecMensagem(true, E.Message);
          MessageInfo := MSG_ERRO_GERACAO_CAP;
        end;
      end;
    finally
      FreeAndNil(FCdsPrincipal);
      FreeAndNil(FCdsDocumentos);
    end;
  end;
end;

end.
