unit uCtrlParamReciboTerceiros;

interface

uses SysUtils, Controls, Classes, Forms, uCmControlObject, uCmDbObject, IvDictio,
   uCmClientDataSet, uCMTypes, uCtrlCustomRH, uCtrlFuncoesRH,
  uCtrlIntegraCAPCAR_RH, uCtrlCtFolha, uCtrlBancoPortFolha;

type
  TCtrlParamReciboTerceiros = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  private
    FCtrlCtFolha: TCtrlCtFolha;
    FCtrlBancoPortFolha: TCtrlBancoPortFolha;
    FCtrlIntegraCAPCAR_RH: TCtrlIntegraCAPCAR_RH;

    FCdsPrincipal: TCMClientDataSet;
    FCdsDocumentos: TCMClientDataSet;

    FPortadorFormaPadrao: integer;
    FIdEmpresa: integer;

    FIdRubrica: double;
    FIdHotel: double;

    FRateioCC: boolean;

    FNomeTabela: string;
    FAnoMes: string;
    FListaIdFavorecido: string;
    FListaIdTipoFolha: string;

    FIAppCliente: OleVariant;

    function  AbrirQueryPrincipal: boolean;
    procedure ExecMensagem(MsgErro: boolean; MensagemErro: string);
    procedure EnviarMensagemCliente(const Progresso: WideString; NumRegistros: integer = 0;
      ProxRegistro: WordBool = false; const Msg: WideString = '');
  public
    constructor Create(IdEmpresa: integer; IdHotel: double;
      UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce; 
    destructor  Destroy; override;

    function ListFavorecidos: OleVariant;

    function GerarIntegracaoCAP(const IAppCliente: OleVariant; DataRef, DataEmissao,
      DataPagamento: TDate; IdModulo, IdUsuario: integer; ListaIdTipoFolha,
      ListaIdFavorecido: string; Previa, RateioCC, ObrigaAbc, ObrigaCRespon: boolean;
      PlanoPrevGlobal, PatroGlobal, CodTipDoc: integer; UsaPlanoPatro: boolean): boolean;
  end;

implementation

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_SEM_DADOS =
    'Não há dados a serem processados para esta competência ou :1'+
    'Dados Cadastrais incompletos.';
  MSG_ERRO_GERACAO =
   'Ocorreu um erro durante o processamento da integração. :1'+
   'Consulte Resultado da geração para maiores detalhes.';

{ TCtrlParamReciboTerceiros }

constructor TCtrlParamReciboTerceiros.Create(IdEmpresa: integer; IdHotel: double;
  UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); 
begin
  inherited Create;
  SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FCtrlCtFolha := TCtrlCtFolha.Create;
  FCtrlBancoPortFolha := TCtrlBancoPortFolha.Create(IdEmpresa);
  FCtrlIntegraCAPCAR_RH := TCtrlIntegraCAPCAR_RH.Create(IdHotel, UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FIdEmpresa := IdEmpresa;
  FIdHotel := IdHotel;

  if not(IsAppServer) then
    GetTempDir;
end;

destructor TCtrlParamReciboTerceiros.Destroy;
begin
  FCtrlCtFolha.Free;
  FCtrlBancoPortFolha.Free;
  FCtrlIntegraCAPCAR_RH.Free;
  inherited;
end;

procedure TCtrlParamReciboTerceiros.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlParamReciboTerceiros.AfterInitialize;
begin
  inherited;
  FCtrlCtFolha.InitializeAs(Self);
  FCtrlBancoPortFolha.InitializeAs(Self);
  FCtrlIntegraCAPCAR_RH.InitializeAs(Self);
end;

procedure TCtrlParamReciboTerceiros.DoChangeDataBase;
begin
  inherited;
  //*FCtrlCtFolha.DataBaseName := DataBaseName;
 //* FCtrlBancoPortFolha.DataBaseName := DataBaseName;
 //* FCtrlIntegraCAPCAR_RH.DataBaseName := DataBaseName;
end;

procedure TCtrlParamReciboTerceiros.EnviarMensagemCliente(const Progresso: WideString;
  NumRegistros: integer; ProxRegistro: WordBool; const Msg: WideString);
begin
  // Enviar mensagem ao cliente
  try
    FIAppCliente.ProcessarGerarIntegracaoCAP_CB(Progresso, NumRegistros, ProxRegistro, Msg);
  except
  end;
end;

function TCtrlParamReciboTerceiros.ListFavorecidos: OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  P.IDPESSOA,'+CR_LF+
    '  UPPER(TO_CHAR(DECODE(P.TIPO,'+CR_LF+
    '          ''F'',P.NOME,'+CR_LF+
    '          P.RAZAOSOCIAL'+CR_LF+
    '       ))) AS NOME'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P,'+CR_LF+
    '  (SELECT DISTINCT'+CR_LF+
    '     RI.IDFAVORECIDO'+CR_LF+
    '   FROM'+CR_LF+
    '     RUBRICAINDIV RI, RUBRICAXPESS RP'+CR_LF+
    '   WHERE'+CR_LF+
    '     (RP.IDPESSOA      = ' +IntToStr(FIdEmpresa)+ ') AND'+CR_LF+
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
    Add(MontaLinhaSelSQL('     (RI.IDFAVORECIDO',FListaIdFavorecido,3));
    Add('     (RI.FLGTPRUBMANUT   = ''2'') AND');
    Add('     (((RI.FLGPERMANENTE = 0) AND');
    Add('       (RI.ANOMESINICIO  = ' +FAnoMes+ ')) OR');
    Add('      (RI.FLGPERMANENTE  = 1)) AND');
    Add('     (H.MES              = ' +FAnoMes+ ') AND');

    if (FListaIdTipoFolha <> '') then
      Add(MontaLinhaSelSQL('     (H.IDMOTIVO',FListaIdTipoFolha,8));

    Add('     (RI.IDEMPRESA       = ' +IntToStr(FIdEmpresa)+ ') AND');
    Add('     (RI.IDRUBRICA       = H.IDRUBRICA) AND');
    Add('     (RI.IDPESSOA        = H.IDPESSOA)');
    Add('   GROUP BY RI.IDEMPRESA, RI.IDFAVORECIDO, H.IDRUBRICA, H.IDPESSOA) HIST');
    // ------------------------------------------------------------------ //
    Add('WHERE');
    Add(MontaLinhaSelSQL('  (PFAV.IDPESSOA',FListaIdFavorecido,1));
    Add('  (PFAV.IDPESSOA  = HIST.IDFAVORECIDO) AND');
    Add('  (HIST.IDPESSOA  = F.IDPESSOA)');
    Add('ORDER BY');
    Add('  PFAV.IDPESSOA, HIST.IDRUBRICA');
    if not(IsAppServer) then
      SaveToFile(DirTempLog + '\qry.txt');
  end;

  EnviarMensagemCliente(('Selecionando dados das Pessoas...'));
  FCdsPrincipal.Data := GetDataPacket(_SQL);
  EnviarMensagemCliente('', FCdsPrincipal.RecordCount);

  Result := not(FCdsPrincipal.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslateMsg(MSG_SEM_DADOS, [CR_LF]);
end;

procedure TCtrlParamReciboTerceiros.ExecMensagem(MsgErro: boolean; MensagemErro: string);
begin
  if (MsgErro) then
    EnviarMensagemCliente('', 0, false,
      ('[Erro] Geração dos dados para o Contas a Pagar') +CR_LF+
      ('Favorecido.......: ') +FCdsPrincipal.FieldByName('FAVORECIDO').asString+CR_LF+
     //* IFF(FRateioCC, CMTranslate('Centro de Custo: ') +
    //*   FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString+CR_LF, '')+
      ('Rubrica............: ') +FloatToStr(FIdRubrica)+CR_LF+
      MensagemErro+CR_LF+
      Replicate('-',92))
  else
    EnviarMensagemCliente('', 0, false,
      ('[Ok] Geração dos dados para o Contas a Pagar') +CR_LF+
      ('Favorecido.......: ') +FCdsPrincipal.FieldByName('FAVORECIDO').asString+CR_LF+
     //* IFF(FRateioCC, CMTranslate('Centro de Custo: ') +
     //*   FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString+CR_LF, '')+
      ('Rubrica............: ') +FloatToStr(FIdRubrica)+CR_LF+
      Replicate('-',92));
end;

function TCtrlParamReciboTerceiros.GerarIntegracaoCAP(const IAppCliente: OleVariant;
  DataRef, DataEmissao, DataPagamento: TDate; IdModulo, IdUsuario: integer;
  ListaIdTipoFolha, ListaIdFavorecido: string; Previa, RateioCC, ObrigaAbc,
  ObrigaCRespon: boolean; PlanoPrevGlobal, PatroGlobal, CodTipDoc: integer;
  UsaPlanoPatro: boolean): boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GerarIntegracaoCAP(IAppCliente, FUsuXFilial, FUsuXCCusto,
      FIdUsuarioGeral, DataRef, DataEmissao, DataPagamento, FIdEmpresa, IdModulo, IdUsuario,
      FIdHotel, ListaIdTipoFolha, ListaIdFavorecido, Previa, RateioCC, ObrigaAbc,
      ObrigaCRespon, PlanoPrevGlobal, PatroGlobal, CodTipDoc, UsaPlanoPatro);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := true;
    try
      FCdsPrincipal := TCMClientDataSet.Create(nil);
      FCdsDocumentos := TCMClientDataSet.Create(nil);

      if (Previa) then
        FNomeTabela := 'PREVIAFOLPAG'
      else
        FNomeTabela := 'HISTRUBSAL';

      FIAppCliente := IAppCliente;
      FAnoMes := QuotedStr(IntToStr(ExtraiAno(DataRef)) +'/'+ PoeZero(ExtraiMes(DataRef)));
      FListaIdTipoFolha := ListaIdTipoFolha;
      FListaIdFavorecido := ListaIdFavorecido;
      FRateioCC := RateioCC;

      FCtrlIntegraCAPCAR_RH.CdsDocumentos := FCdsDocumentos;
      FCtrlIntegraCAPCAR_RH.ObrigaAbc := ObrigaAbc;
      FCtrlIntegraCAPCAR_RH.ObrigaCRespon := ObrigaCRespon;
      FCtrlIntegraCAPCAR_RH.IdEmpresa := FIdEmpresa;
      FCtrlIntegraCAPCAR_RH.IdModulo := IdModulo;
      FCtrlIntegraCAPCAR_RH.IdUsuario := IdUsuario;
      FCtrlIntegraCAPCAR_RH.CodTipDoc := CodTipDoc;

      try
        // Portador Forma Padrão
        FPortadorFormaPadrao := FCtrlBancoPortFolha.GetCodPortFormaPadrao;

        // Montar Querys
        if not(AbrirQueryPrincipal) or not(FCtrlIntegraCAPCAR_RH.AbrirQueryDocumentos) then
          raise Exception.Create(MessageInfo);

        EnviarMensagemCliente(('Processando informações...'));

        try
          StartTransaction;

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
               //* if not(FCtrlIntegraCAPCAR_RH.SetDadosDocumento(
               //*        FCdsPrincipal.FieldByName('IDFAVORECIDO').asInteger,
               //*        FPortadorFormaPadrao, 'P', _Cds.FieldByName('CODTIPRECDES').asString;
                       //*IFF(_Cds.FieldByName('UNIDNEGOC').asInteger<>0,
                       //*  _Cds.FieldByName('UNIDNEGOC').asInteger, UNIDNEGOC_PADRAO),
                      //* IFF(FRateioCC, FCdsPrincipal.FieldByName('CODCENTROCUSTO').asString, ''),
                      //* _Cds.FieldByName('CODCENTRORESPON').asString,
                     //*  FCdsPrincipal.FieldByName('VALOR').asFloat)) then
                 //* raise Exception.Create(FCtrlIntegraCAPCAR_RH.MessageInfo);
              end;
            end
            else
              raise Exception.Create(('Parametrização incorreta para a Rubrica Nº ')+
                FloatToStr(FIdRubrica));

            // Gravar no Banco os Documentos
            if (FCtrlIntegraCAPCAR_RH.GravarDocumentos(
                DataEmissao, DataPagamento, RateioCC,
                UsaPlanoPatro, PlanoPrevGlobal, PatroGlobal)) then
            begin
              ExecMensagem(false, '');
              MessageInfo := ('Contas a Pagar efetuada com sucesso.') +CR_LF+
                ('Documento(s) Nº.: ')+ FCtrlIntegraCAPCAR_RH.NumDocGerados;
            end
            else
              raise Exception.Create(FCtrlIntegraCAPCAR_RH.MessageInfo);

            FCdsDocumentos.EmptyDataSet;
            FCdsPrincipal.Next;
            EnviarMensagemCliente('', 0, true);
          end;
          Commit;
          MessageInfo := ('Contas a Pagar executado com sucesso.');
        except
          Rollback;
          raise;
        end;
      except
        on E: Exception do
        begin
          Result := false;
          ExecMensagem(true, E.Message);
          MessageInfo := CMTranslateMsg(MSG_ERRO_GERACAO, [CR_LF]);
        end;
      end;
    finally
      FreeAndNil(FCdsPrincipal);
      FreeAndNil(FCdsDocumentos);
    end;
  end;
end;

end.
