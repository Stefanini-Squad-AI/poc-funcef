unit uCtrlParamReciboAdvogados;

interface

uses SysUtils, Controls, Classes, DBClient, Forms, uCmControlObject, uCmDbObject, IvDictio,
  uCMTranslate, uCMTypes, uCmClientDataSet, uCtrlCustomRH, uCtrlFuncoesRH, uCtrlIntegraCAPCAR_RH,
  uCtrlBancoPortFolha, uCtrlListTerceirosRH, uCtrlHonorAdvog;

type
  TCtrlParamReciboAdvogados = class(TCtrlCustomRH)
  protected
    FCodTipRecDes: string;
    FListaNumDocCAP: string;
    FObrigaAbc: boolean;
    FObrigaCRespon: boolean;
    FUsaPlanoPatro: boolean;
    FPlanoPrevGlobal: integer;
    FPatroGlobal: integer;
    FIdFavorecido: integer;
    FDataEmissao, FDataPagamento: TDate;
    FIdPlano: integer;
    FIdModulo: integer;
    FIdUsuario: integer;
    FIdEspAcesso: integer;

    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
    procedure AfterInitialize; override;
  private
    FCtrlBancoPortFolha: TCtrlBancoPortFolha;
    FCtrlIntegraCAPCAR_RH: TCtrlIntegraCAPCAR_RH;
    FCtrlHonorAdvog: TCtrlHonorAdvog;

    FCdsPrincipal: TClientDataSet;
    FCdsDocumentos: TClientDataSet;
    FCdsHonoAdvog: TClientDataSet;

    FPortadorFormaPadrao: integer;
    FIdEmpresa: integer;

    FListaIdFavorecido: string;

    procedure IncProgresso(const MsgProgresso: string; const NumReg: integer;
      const IncrProgresso: boolean; const MsgErro: string);

    function  AbrirQueryPrincipal(DataRef: TDate): boolean;
    procedure ExecMensagem(MsgErro: boolean; MensagemErro: string);
  public
    constructor Create(IdEmpresa: integer; IdHotel: double;
      UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce;
    destructor  Destroy; override;

    function ListFavorecidos(DataRef: TDate): OleVariant;
    function  GerarIntegracao(FazCAP, FazContab: boolean; DataEmissao, DataPagamento: TDate;
      IdPlanoPrev, IdPatro: integer; PlaConta: string; Plano: integer; PlaContaCredito,
      TipoOperacao, CodTipRecDes: string; CodTipDoc: integer;
      ListaIdFavorecido: string): boolean;
    function GerarIntegracaoCAP(Valor: double): boolean;
    function GerarCAP(Valor: double): boolean;

    // Inicializa variáveis usadas na integração
    procedure IniciarIntegracao(IdModulo, IdUsuario, IdEspAcesso: integer;
      UsaPlanoPatro, ObrigaAbc, ObrigaCRespon: boolean; PlanoPrevGlobal, PatroGlobal: integer);
  end;

implementation

const
  // Constantes que são concatenadas durante o processamento de uma função. Usadas desta
  // forma para a melhor tradução pelo padrão.
  MSG_SEM_DADOS =
    'Não há dados a serem processados para esta data ou :1'+
    'Dados Cadastrais incompletos.';

{ TCtrlParamReciboTerceiros }

constructor TCtrlParamReciboAdvogados.Create(IdEmpresa: integer; IdHotel: double;
  UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlHonorAdvog := TCtrlHonorAdvog.Create;
  FCtrlBancoPortFolha := TCtrlBancoPortFolha.Create(IdEmpresa);
  FCtrlIntegraCAPCAR_RH := TCtrlIntegraCAPCAR_RH.Create(IdHotel, UsuXFilial, UsuXCCusto, IdUsuarioGeral);

  FIdEmpresa := IdEmpresa;

  if not(IsAppServer) then
    GetTempDir;
end;

destructor TCtrlParamReciboAdvogados.Destroy;
begin
  FCtrlBancoPortFolha.Free;
  FCtrlIntegraCAPCAR_RH.Free;
  FCtrlHonorAdvog.Free;
  inherited;
end;

procedure TCtrlParamReciboAdvogados.OnCreateAppServer;
begin
  inherited;
end;

procedure TCtrlParamReciboAdvogados.AfterInitialize;
begin
  inherited;
  FCtrlBancoPortFolha.InitializeAs(Self);
  FCtrlIntegraCAPCAR_RH.InitializeAs(Self);
  FCtrlHonorAdvog.InitializeAs(Self);
end;

procedure TCtrlParamReciboAdvogados.DoChangeDataBase;
begin
  inherited;
  FCtrlBancoPortFolha.DataBaseName := DataBaseName;
  FCtrlIntegraCAPCAR_RH.DataBaseName := DataBaseName;
  FCtrlHonorAdvog.DataBaseName := DataBaseName;
end;

function TCtrlParamReciboAdvogados.ListFavorecidos(DataRef: TDate): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT DISTINCT'+CR_LF+
    '      A.IDPESSOA, P.NOME, P.RAZAOSOCIAL, P.TIPO, P.NUMDOCUMENTO,'+CR_LF+
    '      A.FATORHONORADVOG, PR.CONTA'+CR_LF+
    'FROM PESSOA P, ADVOGADO A,'+CR_LF+
    '     (SELECT IDADVOGRECDA, COUNT(*) AS CONTA'+CR_LF+
    '      FROM PROCESSOTRAB'+CR_LF+
    '      WHERE ((FLGSITPROC = 0) OR'+CR_LF+
    '             (FLGSITPROC = 1 AND DATAEFETENC > TO_DATE('''+DateToStr(DataRef)+''',''DD/MM/YYYY'')))'+CR_LF+
    '      AND   (TRGDTINCLUSAO <= TO_DATE('''+DateToStr(DataRef)+''',''DD/MM/YYYY''))'+CR_LF+
    '      GROUP BY IDADVOGRECDA) PR'+CR_LF+
    'WHERE (A.IDPESSOA = P.IDPESSOA)'+CR_LF+
    'AND   (A.IDPESSOA = PR.IDADVOGRECDA)'+CR_LF+
    'AND   (NVL(PR.CONTA,0) > 0)'+CR_LF+
    'AND   (NVL(A.FATORHONORADVOG,0) > 0)'+CR_LF+
    'ORDER BY UPPER(P.NOME)');
end;

procedure TCtrlParamReciboAdvogados.IncProgresso(const MsgProgresso: string;
  const NumReg: integer; const IncrProgresso: boolean; const MsgErro: string);
begin
//  if Assigned(OnProgresso) then
//    OnProgresso(MsgProgresso, NumReg, IncrProgresso, MsgErro);
end;

function TCtrlParamReciboAdvogados.AbrirQueryPrincipal(DataRef: TDate): boolean;
var
  _SQL: TStringList;
begin
  _SQL := TStringList.Create;
  with (_SQL) do
  begin
    Clear;
    Add('SELECT DISTINCT');
    Add('      A.IDPESSOA, P.NOME, P.RAZAOSOCIAL, P.TIPO, P.NUMDOCUMENTO,');
    Add('      A.FATORHONORADVOG, PR.CONTA');
    Add('FROM PESSOA P, ADVOGADO A,');
    Add('     (SELECT IDADVOGRECDA, COUNT(*) AS CONTA');
    Add('      FROM PROCESSOTRAB');
    Add('      WHERE ((FLGSITPROC = 0) OR');
    Add('             (FLGSITPROC = 1 AND DATAEFETENC > TO_DATE('''+DateToStr(DataRef)+''',''DD/MM/YYYY'')))');
    Add('      AND   (TRGDTINCLUSAO <= TO_DATE('''+DateToStr(DataRef)+''',''DD/MM/YYYY''))');
    if (Pos(',',FListaIdFavorecido) > 0) then
      Add('   AND (IDADVOGRECDA   IN (' +FListaIdFavorecido+ '))')
    else
      Add('   AND (IDADVOGRECDA    = ' +FListaIdFavorecido+ ')');
    Add('      GROUP BY IDADVOGRECDA) PR');
    Add('WHERE (A.IDPESSOA = P.IDPESSOA)');
    Add('AND   (A.IDPESSOA = PR.IDADVOGRECDA)');
    if (Pos(',',FListaIdFavorecido) > 0) then
      Add('   AND (A.IDPESSOA   IN (' +FListaIdFavorecido+ '))')
    else
      Add('   AND (A.IDPESSOA    = ' +FListaIdFavorecido+ ')');
    Add('AND   (NVL(PR.CONTA,0) > 0)');
    Add('AND   (NVL(A.FATORHONORADVOG,0) > 0)');
    Add('ORDER BY UPPER(P.NOME)');
    if not(IsAppServer) then
      SaveToFile(DirTempLog + '\qry.txt');
  end;

  IncProgresso(CMTranslate('Selecionando dados dos Escritórios e Advogados...'), 0, false, '');
  FCdsPrincipal.Data := GetDataPacket(_SQL);
  FCdsHonoAdvog.Data := FCtrlHonorAdvog.ListHonorAdvog(0);
  IncProgresso('', FCdsPrincipal.RecordCount, false, '');

  Result := not(FCdsPrincipal.IsEmpty);
  if not(Result) then
    MessageInfo := CMTranslateMsg(MSG_SEM_DADOS, [CR_LF]);
end;

procedure TCtrlParamReciboAdvogados.ExecMensagem(MsgErro: boolean; MensagemErro: string);
begin
  if (MsgErro) then
    IncProgresso('', 0, false,
      CMTranslate('[Erro] Geração dos dados para o Contas a Pagar') +CR_LF+
      CMTranslate('Favorecido.......: ') +FCdsPrincipal.FieldByName('NOME').asString+CR_LF+
      MensagemErro+CR_LF+
      Replicate('-',92))
  else
    IncProgresso('', 0, false,
      CMTranslate('[Ok] Geração dos dados para o Contas a Pagar') +CR_LF+
      CMTranslate('Favorecido.......: ') +FCdsPrincipal.FieldByName('NOME').asString+CR_LF+
      Replicate('-',92));
end;

function TCtrlParamReciboAdvogados.GerarIntegracaoCAP(Valor: double): boolean;
var
  bErro: boolean;
begin
  try
    FIdFavorecido := FCdsPrincipal.FieldByName('IDPESSOA').asInteger;
    bErro := not(GerarCAP(Valor));
    if not(bErro) then
    begin
      // Gravar no Banco os Documentos
      if (FCtrlIntegraCAPCAR_RH.GravarDocumentos(
          FDataEmissao, FDataPagamento, false,
          FUsaPlanoPatro, FPlanoPrevGlobal, FPatroGlobal)) then
      begin
        ExecMensagem(false, '');
        MessageInfo := CMTranslate('Contas a Pagar efetuada com sucesso.') +CR_LF+
          CMTranslate('Documento(s) Nº.: ')+ FCtrlIntegraCAPCAR_RH.NumDocGerados;
      end
      else
        raise Exception.Create(FCtrlIntegraCAPCAR_RH.MessageInfo);

      FCdsDocumentos.EmptyDataSet;
    end;
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      bErro := true;
    end;
  end;

  if (bErro) then
    MessageInfo := CMTranslate('Contas a Pagar Não Efetuada.') +CR_LF+CR_LF+ MessageInfo
  else
  begin
    if (FListaNumDocCAP = '') then
      FListaNumDocCAP := FCtrlIntegraCAPCAR_RH.NumDocGerados
    else
      FListaNumDocCAP := FListaNumDocCAP +','+ FCtrlIntegraCAPCAR_RH.NumDocGerados;
  end;

  Result := not(bErro);
end;

function TCtrlParamReciboAdvogados.GerarCAP(Valor: double): boolean;
begin
  try
    // Calcular o valor da Rubrica
    if not(FCtrlIntegraCAPCAR_RH.SetDadosDocumento(
           FIdFavorecido, FPortadorFormaPadrao, 'P', FCodTipRecDes,
           UNIDNEGOC_PADRAO, '', CODCENTRORESPON_PADRAO, Valor)) then
    begin
      raise Exception.Create(FCtrlIntegraCAPCAR_RH.MessageInfo);
    end;

    Result := true;
  except
    on E: Exception do
    begin
      MessageInfo := E.Message;
      Result := false;
    end;
  end;
end;

function TCtrlParamReciboAdvogados.GerarIntegracao(FazCAP, FazContab: boolean; DataEmissao,
  DataPagamento: TDate; IdPlanoPrev, IdPatro: integer; PlaConta: string; Plano: integer;
  PlaContaCredito, TipoOperacao, CodTipRecDes: string; CodTipDoc: integer;
  ListaIdFavorecido: string): boolean;
var
  dValor: double;
  iMinMaior: integer;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GerarIntegracaoReciboAdvogados(
      FazCAP, FazContab, DataEmissao, DataPagamento, FIdEmpresa, IdPlanoPrev, IdPatro,
      PlaConta, Plano, PlaContaCredito, TipoOperacao, CodTipRecDes, CodTipDoc,
      ListaIdFavorecido);
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    Result := true;
    FCodTipRecDes := CodTipRecDes;
    FIdPlano := Plano;
    FListaNumDocCAP := '';

    try
      if (FazCAP) then
      begin
        FCdsDocumentos := TClientDataSet.Create(nil);
        FCdsPrincipal  := TClientDataSet.Create(nil);
        FCdsHonoAdvog  := TClientDataSet.Create(nil);
        FListaIdFavorecido := ListaIdFavorecido;

        FDataEmissao := DataEmissao;
        FDataPagamento := DataPagamento;

        FCtrlIntegraCAPCAR_RH.CdsDocumentos := TCmClientDataSet(FCdsDocumentos);
        FCtrlIntegraCAPCAR_RH.ObrigaAbc := FObrigaAbc;
        FCtrlIntegraCAPCAR_RH.ObrigaCRespon := FObrigaCRespon;
        FCtrlIntegraCAPCAR_RH.IdEmpresa := FIdEmpresa;
        FCtrlIntegraCAPCAR_RH.IdModulo := FIdModulo;
        FCtrlIntegraCAPCAR_RH.IdUsuario := FIdUsuario;
        FCtrlIntegraCAPCAR_RH.CodTipDoc := CodTipDoc;

        if not(FCtrlIntegraCAPCAR_RH.AbrirQueryDocumentos) then
          raise Exception.Create(FCtrlIntegraCAPCAR_RH.MessageInfo);
      end;

      try
        StartTransaction;

        AbrirQueryPrincipal(DataPagamento);
        IncProgresso(CMTranslate('Processando informações...'), 0, false, '');
        FCdsPrincipal.DisableControls;
        FCdsPrincipal.First;
        while not(FCdsPrincipal.EOF) do
        begin
          // Calcular o Valor a integrar
          dValor := 0;
          iMinMaior := 0;
          FCdsHonoAdvog.First;
          while not(FCdsHonoAdvog.EOF) do
          begin
            if (FCdsHonoAdvog.FieldByName('DATAVIGENCIA').asDatetime > DataPagamento) then
              break;

            if (FCdsHonoAdvog.FieldByName('LIMITEQTDE').asInteger >=
                FCdsPrincipal.FieldByName('CONTA').asInteger) then
            begin
              iMinMaior := FCdsHonoAdvog.FieldByName('LIMITEQTDE').asInteger;
              break;
            end;

            FCdsHonoAdvog.Next;
          end;

          FCdsHonoAdvog.First;
          while not(FCdsHonoAdvog.EOF) do
          begin
            if (FCdsHonoAdvog.FieldByName('DATAVIGENCIA').asDatetime > DataPagamento) then
              break;

            if (FCdsHonoAdvog.FieldByName('LIMITEQTDE').asInteger = iMinMaior) then
              dValor := FCdsHonoAdvog.FieldByName('VALOR').asFloat;

            FCdsHonoAdvog.Next;
          end;
          dValor := dValor * FCdsPrincipal.FieldByName('FATORHONORADVOG').asFloat;

          if (FazCAP) and (dValor > 0) then
            if not(GerarIntegracaoCAP(dValor)) then
              raise Exception.Create(MessageInfo);

          FCdsPrincipal.Next;
          IncProgresso('', 0, true, '');
        end;

        Commit;

        // Criação das mensagens de término do processo de integração
        if (FazCAP) then
        begin
          if (FListaNumDocCAP <> '') then
            MessageInfo :=
              CMTranslate('Contas a Pagar gerada com sucesso.') +CR_LF+
              CMTranslate('Documento(s) Nº.: ') +FListaNumDocCAP
          else
            MessageInfo := CMTranslate('Contas a Pagar não foi feita.');
        end;
      except
        on E: Exception do
        begin
          Rollback;
          Result := false;
          MessageInfo := E.Message;
        end;
      end;

      FCdsPrincipal.First;
      FCdsPrincipal.EnableControls;

      if (FazCAP) then
      begin
        FCdsDocumentos.Free;
        FCdsPrincipal.Free;
        FCdsHonoAdvog.Free;
      end;
    except
      on E: Exception do
      begin
        Result := false;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

procedure TCtrlParamReciboAdvogados.IniciarIntegracao(IdModulo, IdUsuario,
  IdEspAcesso: integer; UsaPlanoPatro, ObrigaAbc, ObrigaCRespon: boolean; PlanoPrevGlobal,
  PatroGlobal: integer);
begin
  FIdModulo := IdModulo;
  FIdUsuario := IdUsuario;
  FIdEspAcesso := IdEspAcesso;
  FPortadorFormaPadrao := FCtrlBancoPortFolha.GetCodPortFormaPadrao;
  FUsaPlanoPatro := UsaPlanoPatro;
  FObrigaAbc := ObrigaAbc;
  FObrigaCRespon := ObrigaCRespon;
  FPlanoPrevGlobal := PlanoPrevGlobal;
  FPatroGlobal := PatroGlobal;
end;

end.
