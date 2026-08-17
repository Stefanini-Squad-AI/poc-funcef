// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit uCtrlParamReciboAdvogados;

interface

uses SysUtils, Controls, classes, uCmControlObject, uCmDbObject, uCmClientDataSet, uCMTypes,
  uCtrlCustomRH, uCtrlFuncoesRH, uCtrlIntegraRH, uCtrlBancoPortFolha,
  uCtrlHonorAdvog, USistema;

const
  // Mensagens de PROCESSAMENTO
  MSG_SEL_DADOS_PESSOAS = 'Selecionando dados dos Escritórios e Advogados...';
  MSG_PROCESSANDO = 'Processando informações...';
  MSG_GERACAO_CAP_OK = 'Contas a Pagar efetuada com sucesso.' +CR_LF+ 'Documento(s) Nº.: ';
  // Mensagens de AVISO
  // Mensagens de ERRO
  MSG_ERRO_SEL_DADOS_PESSOAS = 'Não há dados a serem processados para esta data ou' +CR_LF+
    'Dados Cadastrais incompletos.';
  MSG_ERRO_GERACAO_CAP = 'Ocorreu um erro durante o processamento da integração.' +CR_LF+
    'Consulte Resultado da geração para maiores detalhes.';

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
    FCtrlIntegraRH: TCtrlIntegraRH;
    FCtrlHonorAdvog: TCtrlHonorAdvog;

    FCdsPrincipal: TCMClientDataSet;
    FCdsDocumentos: TCMClientDataSet;
    FCdsHonoAdvog: TCMClientDataSet;

    FPortadorFormaPadrao: integer;
    FIdEmpresa: integer;

    FListaIdFavorecido: string;

    function  AbrirQueryPrincipal(DataRef: TDate): boolean;
    procedure ExecMensagem(MsgErro: boolean; MensagemErro: string);
  public
    constructor Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string); reintroduce;
    destructor  Destroy; override;

    function ListFavorecidos(DataRef: TDate): OleVariant;
    function  GerarIntegracao(FazCAP, FazContab: boolean; DataEmissao, DataPagamento: TDate;
      IdPlanoPrev, IdPatro: integer; PlaConta: string; Plano: integer; PlaContaCredito,
      TipoOperacao, CodTipRecDes: string; CodTipDoc: integer;
      ListaIdFavorecido: string): boolean;
    function GerarIntegracaoCAP(Valor: double): boolean;
    function GerarCAP(Valor: double): boolean;

    // Inicializa variáveis usadas na integração
    procedure IniciarIntegracao(IdEmpresa, IdModulo, IdUsuario, IdEspAcesso: integer;
      UsaPlanoPatro, ObrigaAbc, ObrigaCRespon: boolean; PlanoPrevGlobal, PatroGlobal: integer);
  end;

implementation

{ TCtrlParamReciboTerceiros }

constructor TCtrlParamReciboAdvogados.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral: string);
begin
  inherited Create;
  SetAutorizacoes(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
  FCtrlHonorAdvog := TCtrlHonorAdvog.Create;
  FCtrlBancoPortFolha := TCtrlBancoPortFolha.Create;
  FCtrlIntegraRH := TCtrlIntegraRH.Create(UsuXFilial, UsuXCCusto, IdUsuarioGeral);
end;

destructor TCtrlParamReciboAdvogados.Destroy;
begin
  FCtrlBancoPortFolha.Free;
  FCtrlIntegraRH.Free;
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
  FCtrlIntegraRH.InitializeAs(Self);
  FCtrlHonorAdvog.InitializeAs(Self);
end;

procedure TCtrlParamReciboAdvogados.DoChangeDataBase;
begin
  inherited;
  FCtrlBancoPortFolha.DataBase := DataBase;
  FCtrlIntegraRH.DataBase := DataBase;
  FCtrlHonorAdvog.DataBase := DataBase;
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
    //SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
  end;

  DoProgresso([MSG_SEL_DADOS_PESSOAS, 0, false, '']);
  FCdsPrincipal.Data := GetDataPacket(_SQL);
  FCdsHonoAdvog.Data := FCtrlHonorAdvog.ListHonorAdvog(0);
  DoProgresso(['', FCdsPrincipal.RecordCount, false, '']);

  Result := not(FCdsPrincipal.IsEmpty);
  if not(Result) then
    MessageInfo := MSG_ERRO_SEL_DADOS_PESSOAS;
end;

procedure TCtrlParamReciboAdvogados.ExecMensagem(MsgErro: boolean; MensagemErro: string);
begin
  if (MsgErro) then
    DoProgresso(['', 0, false,
      '[Erro] Geração dos dados para o Contas a Pagar'+CR_LF+
      'Favorecido.......: ' +FCdsPrincipal.FieldByName('NOME').asString+CR_LF+
      MensagemErro+CR_LF+
      Replicate('-',92)])
  else
    DoProgresso(['', 0, false,
      '[Ok] Geração dos dados para o Contas a Pagar'+CR_LF+
      'Favorecido.......: ' +FCdsPrincipal.FieldByName('NOME').asString+CR_LF+
      Replicate('-',92)]);
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
      if (FCtrlIntegraRH.GravarDocumentos(
          false, 0, FPortadorFormaPadrao, FDataEmissao,
          FDataPagamento, false,
          FUsaPlanoPatro, FPlanoPrevGlobal, FPatroGlobal,0,'')) then
      begin
        ExecMensagem(false, '');
        MessageInfo := MSG_GERACAO_CAP_OK + FCtrlIntegraRH.NumDocGerados;
      end
      else
        raise Exception.Create(FCtrlIntegraRH.MessageInfo);

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
    MessageInfo := 'Contas a Pagar Não Efetuada.' +CR_LF+CR_LF+ MessageInfo
  else
  begin
    if (FListaNumDocCAP = '') then
      FListaNumDocCAP := FCtrlIntegraRH.NumDocGerados
    else
      FListaNumDocCAP := FListaNumDocCAP +','+ FCtrlIntegraRH.NumDocGerados;
  end;

  Result := not(bErro);
end;

function TCtrlParamReciboAdvogados.GerarCAP(Valor: double): boolean;
begin
  try
    // Guardo o valor da Rubrica
    if not(FCtrlIntegraRH.SetDadosDocumento(
      -1, -1, FIdPlano, -1, FPortadorFormaPadrao, FIdFavorecido,
      '', CODCENTRORESPON_PADRAO, FCodTipRecDes, 'P', 'D', Valor, 0, '', 0)) then
    begin
      raise Exception.Create(FCtrlIntegraRH.MessageInfo);
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
    Result := Connection.AppServer.GerarIntegracao(FazCAP, FazContab, DataEmissao,
      DataPagamento, IdPlanoPrev, IdPatro, PlaConta, Plano, PlaContaCredito, TipoOperacao,
      CodTipRecDes, CodTipDoc, ListaIdFavorecido);
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
        FCdsDocumentos := TCMClientDataSet.Create(nil);
        FCdsPrincipal  := TCMClientDataSet.Create(nil);
        FCdsHonoAdvog  := TCMClientDataSet.Create(nil);
        FListaIdFavorecido := ListaIdFavorecido;

        FDataEmissao := DataEmissao;
        FDataPagamento := DataPagamento;

        FCtrlIntegraRH.CdsDocumentos := FCdsDocumentos;
        FCtrlIntegraRH.ObrigaAbc := FObrigaAbc;
        FCtrlIntegraRH.ObrigaCRespon := FObrigaCRespon;
        FCtrlIntegraRH.IdEmpresa := FIdEmpresa;
        FCtrlIntegraRH.IdModulo := FIdModulo;
        FCtrlIntegraRH.IdUsuario := FIdUsuario;
        FCtrlIntegraRH.CodTipDoc := CodTipDoc;

        if not(FCtrlIntegraRH.AbrirQueryDocumentos) then
          raise Exception.Create(FCtrlIntegraRH.MessageInfo);
      end;

      try
        StartTransaction;
        AbrirQueryPrincipal(DataPagamento);
        DoProgresso([MSG_PROCESSANDO, 0, false, '']);
        FCdsPrincipal.DisableControls;
        FCdsPrincipal.First;
        while not(FCdsPrincipal.EOF) do
        begin
          // Calcular o Valor a integrar
          dValor := 0;
          iMinMaior := 0;
          FCdsHonoAdvog.First;
          while not FCdsHonoAdvog.Eof do
          begin
            if (FCdsHonoAdvog.FieldByName('DATAVIGENCIA').AsDatetime > DataPagamento) then
              break;
            if (FCdsHonoAdvog.FieldByName('LIMITEQTDE').AsInteger >=
                FCdsPrincipal.FieldByName('CONTA').AsInteger) then
            begin
                iMinMaior := FCdsHonoAdvog.FieldByName('LIMITEQTDE').AsInteger;
                break;
            end;
            FCdsHonoAdvog.Next;
          end;

          FCdsHonoAdvog.First;
          while not FCdsHonoAdvog.Eof do
          begin
            if (FCdsHonoAdvog.FieldByName('DATAVIGENCIA').AsDatetime > DataPagamento) then
              break;
            if (FCdsHonoAdvog.FieldByName('LIMITEQTDE').AsInteger = iMinMaior) then
               dValor := FCdsHonoAdvog.FieldByName('VALOR').AsFloat;
            FCdsHonoAdvog.Next;
          end;
          dValor := dValor * FCdsPrincipal.FieldByName('FATORHONORADVOG').AsFloat;

          if (FazCAP) and (dValor > 0) then
            if not(GerarIntegracaoCAP(dValor)) then
              raise Exception.Create(MessageInfo);

          FCdsPrincipal.Next;
          DoProgresso(['', 0, true, '']);
        end;

        Commit;

        // Criação das mensagens de término do processo de integração
        if (FazCAP) then
        begin
          if (FListaNumDocCAP <> '') then
            MessageInfo :=
              'Contas a Pagar gerada com sucesso.'+CR_LF+
              'Documento(s) Nº.: ' +FListaNumDocCAP
          else
            MessageInfo :=
              'Contas a Pagar não foi feita.';
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

procedure TCtrlParamReciboAdvogados.IniciarIntegracao(IdEmpresa, IdModulo, IdUsuario,
  IdEspAcesso: integer; UsaPlanoPatro, ObrigaAbc, ObrigaCRespon: boolean; PlanoPrevGlobal,
  PatroGlobal: integer);
begin
  FIdEmpresa := IdEmpresa;
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
