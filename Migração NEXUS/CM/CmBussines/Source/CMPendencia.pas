unit CMPendencia;

interface
{$I cm.inc}

uses
  classes, db, dbTables, CMBussinesObject, SysUtils, wwQuery, uParamsLib,
  Controls, uMensErro;

type
  (** Tipo enumerado com as Situações possíveis de Pendências

   @see TCMPendencia
   @see THistPendencia*)
  TSituacaoPendencia = (spAnalise, spDesenvolvimento, spHomologacao,
                        spHomologada, spLiberada, spRecusada, spAdiamento, spSugestao);

  (** Tipo enumerado com os tipos de alterações que podem ocorrer com a Pendência.

  @see AlterarPendencia *)
  TTipoAlteracaoPendencia = (taRecusar, taEncerrar, taSugestao);
  (** EPendenciaError é a classe de exceção para erros referentes ao objeto de Negócio TCMPendencia.
    EPendenciaError pode ocorrer quando se tenta excluir uma pendência
     que possui histórico.
    @see EBussinesError *)
  EPendenciaError = class(EBussinesError)
  private
  public
  end;

  TCMPendencia = class;

  (** Classe de Negócio do Histórico da Pendência.
    É uma lista com os detalhes daquela Pendência.
    @see TCMPendencia*)
  THistPendencia = class(TBizObjList)
  private
    function GetDataHistPendencia: TDateTime;
    function GetDescHistPendencia: string;
    function GetIdHistPendencia: Double;
    function GetSituacaoPendencia: TSituacaoPendencia;
    function GetVersaoModulo: string;
    procedure SetDataHistPendencia(const Value: TDateTime);
    procedure SetDescHistPendencia(const Value: string);
    procedure SetSituacaoPendencia(const Value: TSituacaoPendencia);
    procedure SetVersaoModulo(const Value: string);
    function GetDataInicioEfet: TDateTime;
    function GetDataInicioPrev: TDateTime;
    function GetDataTerminoEfet: TDateTime;
    function GetDataTerminoPrev: TDateTime;
    procedure SetDataInicioEfet(const Value: TDateTime);
    procedure SetDataTerminoEfet(const Value: TDateTime);
    function GetIdusuario: double;
    procedure SetIdusuario(const Value: double);
  protected
  public
    (** Contrutor do Histórico da Pendência.*)
    constructor Create(AOwner: TCMPendencia);
    (** Identificador do Histórico. É utilizado internamente e, geralmente,
     não é mostrado para o usuário *)
    property IdHistPendencia: Double read GetIdHistPendencia;
    (** Data da ocorrência do Histórico. *)
    property DataHistPendencia: TDateTime read GetDataHistPendencia write SetDataHistPendencia;
    (** Descrição da ocorrência do Histórico. *)
    property DescHistPendencia: string read GetDescHistPendencia write SetDescHistPendencia;
    (** Situação do Histórico da Pendência. *)
    property SituacaoPendencia: TSituacaoPendencia read GetSituacaoPendencia write SetSituacaoPendencia;
    (** Versão do Módulo em que foi detectada a ocorrência.
     Serve para o Desenvolvedor checar seu Módulo e também para controle de
     histórico das Versões. *)
    property VersaoModulo: string read GetVersaoModulo write SetVersaoModulo;
    (** Data Prevista para o início do desenvolvimento da Pendência *)
    property DataInicioPrev: TDateTime read GetDataInicioPrev;
    (** Data Efetiva do início do desenvolvimento da Pendência *)
    property DataInicioEfet: TDateTime read GetDataInicioEfet write SetDataInicioEfet;
    (** Data Prevista para o Término do desenvolvimento da Pendência *)
    property DataTerminoPrev: TDateTime read GetDataTerminoPrev;

    (** Data Efetiva do Término do desenvolvimento da Pendência *)
    property DataTerminoEfet: TDateTime read GetDataTerminoEfet write SetDataTerminoEfet;
    property Idusuario: double read GetIdusuario write SetIdusuario;
    property qryDetail;
  end;

  (** {bmc C:\ProjetosCM5\CM\Help\Imagens\CMPendencia.bmp}

    Classe de Negócio de uma Pendência

    @see THistPendencia*)
  TCMPendencia = class(TBussinesComponent)
  private
    qHistPendenciaInicial: TwwQuery;
    usqlHistPendenciaInicial: TUpdateSQL;
    FHistPendencia: THistPendencia;
    FSituacaoPendencia : TSituacaoPendencia;
    FIdPendencia: Double;
    FCidade: Integer;
    FPais: Integer;
    FNumDiasHomologacao: Integer;
    FDiaDaSemanaLiberacao: Integer;
    ParamPendencia: TCMParams;
    FInicioExpediente: TTime;
    FFimExpediente: TTime;
    FTempoExpediente: Integer;
    function GetDataNecessidade: TDateTime;
    function GetDataPrevistaInfo: TDateTime;
    function GetDataSolicitacao: TDateTime;
    function GetDescHistPendencia: string;
    function GetIdCliente: Double;
    function GetIdModulo: Double;
    function GetIdPendencia: Double;
    function GetIdResponsavel: Double;
    function GetIdTipoPendencia: Double;
    function GetIdUsuario: Double;
    function GetOrdemExecucao: Integer;
    function GetPrazoHoras: Cardinal;
    function GetPrioridade: Integer;
    function GetSituacaoPendencia: TSituacaoPendencia;
    function GetTelaModulo: string;
    function GetUsuSolicitante: string;
    function GetVersaoModulo: string;
    function GetDTLIMDESENV: TDateTime;
    function GetDTLIMLIB: TDateTime;
    function GetDESCRPROJETO: string;

    procedure SetDataNecessidade(const Value: TDateTime);
    procedure SetDataPrevistaInfo(const Value: TDateTime);
    procedure SetDataSolicitacao(const Value: TDateTime);
    procedure SetDescHistPendencia(const Value: string);
    procedure SetIdCliente(const Value: Double);
    procedure SetIdModulo(const Value: Double);
    procedure SetIdResponsavel(const Value: Double);
    procedure SetIdTipoPendencia(const Value: Double);
    procedure SetIdUsuario(const Value: Double);
    procedure SetOrdemExecucao(const Value: Integer);
    procedure SetPrazoHoras(const Value: Cardinal);
    procedure SetPrioridade(const Value: Integer);
    procedure SetSituacaoPendencia(const Value: TSituacaoPendencia);
    procedure SetTelaModulo(const Value: string);
    procedure SetUsuSolicitante(const Value: string);
    procedure SetVersaoModulo(const Value: string);
    function GetDescSituacaoPendencia: string;
    procedure SetCidade(const Value: Integer);
    procedure SetDiaDaSemanaLiberacao(const Value: Integer);
    procedure SetNumDiasHomologacao(const Value: Integer);
    procedure SetPais(const Value: Integer);
    procedure SetFimExpediente(const Value: TTime);
    procedure SetInicioExpediente(const Value: TTime);
    procedure SetTempoExpediente(const Value: Integer);
    procedure SetDTLIMDESENV(const Value: TDateTime);
    procedure SetDTLIMLIB(const Value: TDateTime);
    procedure SetDESCRPROJETO(const Value: string);

  protected
    procedure qryMasterAfterInsert(DataSet: TDataSet);
    procedure qryMasterBeforeDelete(DataSet: TDataSet);
    procedure ApplyUpdates; override;
    procedure CancelUpdates; override;
    procedure UpdateDatabaseName; override;
    function UltimaPrioridade: Integer;
    function UltimaOrdemExecucao: Integer;
    procedure LoadParamsPendencia;
    procedure Loaded; override;
  public
    (** Construtor da Classe *)
    constructor Create(AOwner: TComponent); override;
    (** Destrutor da Classe *)
    destructor Destroy; override;
    (** Carrega uma Pendência que está armazenada no Banco de Dados.
         É preciso atribuir primeiro a propriedade SituacaoPendencia que
     também será utilizada no filtro enviado para o Banco de Dados.
        Isto é utilizado também para manter a segurança em relação a permissão
     de um usuário. *)
    function LoadFromDB(ID: Double): Boolean; override;
    (** Retorna a última versão do módulo registrada pelo objeto pendência *)
    function GetLastVersaoModulo: string;
    (** Efetua a movimentação da pendência, de acordo com os parâmetros recebidos:
    TipoAlteracao: Se a pendência será recusada ou encerrada. Veja TTipoAlteracaoPendencia.
    DescHistorico: Descrição dado pelo responsável pela alteração para o evento.
    NovaVersaoModulo: Se tiver havido alteração na versão do módulo a nova versão é passada aqui.
    TituloEmail: Titulo que será posto no e-mail que será enviado para avisar da alteração da pendência.
    DestEmails: Endereços de e-mail para os quais serão enviados a comunicação de alteração da pendência.
    DtHrInicio e DtHrFim: São as datas de início e fim efetivos da alteração (utilizado somente quando o status atual da pendência é Desenvolvimento). *)
    procedure AlterarPendencia(TipoAlteracao: TTipoAlteracaoPendencia; const DescHistorico,
              NovaVersaoModulo, TituloEmail, DestEmails, Prazo: string; DtHrInicio, DtHrFim: TDateTime);
    (** Efetua a conversão de uma SituacaoPendencia para sua descrição em texto. *)
    class function SituacaoPendenciaToStr(SituacaoPendencia: TSituacaoPendencia): string;
    procedure Edit; override;
    procedure Post; override;
    procedure Insert; override;
    procedure Cancel; override;
    procedure Refresh; override;
    (** Esta função retorna o total de horas, dentro do período indicado, em que o
      Desenvolvedor ficou impossibilitado de exercer suas funções normais *)
    function TotalDeHorasDeAdiamentos(const Desenvolvedor: Double; const DtHrInicio, DtHrFim: TDateTime): Integer;
    (** Recalcula as datas previstas para o término das pendências do desenvolvedor *)
    procedure UpdateDataTerminoPrev(Desenvolvedor: Double; DataInicial : TDateTime);
    (** Detalhes do Histórico da Pendência. *)
    property HistPendencia: THistPendencia read FHistPendencia;
    property qryHistPendenciaInicial: TwwQuery read qHistPendenciaInicial;
    property qryMaster;
    (** Identificador da Pendência. É utilizado internamente e, geralmente,
     não é mostrado para o usuário *)
    property IdPendencia: Double read GetIdPendencia;
    (** Identificador do Cliente que solicitou a Pendência.
      É chave estrangeira da tabela EmpresaCliente*)
    property IdCliente: Double read GetIdCliente write SetIdCliente;
    (** Identificador do Usuário que cadastrou a Pendência.
      É chave estrangeira da tabela UsuarioSistema*)
    property IdUsuario: Double read GetIdUsuario write SetIdUsuario;
    (** Identificador do Módulo da Pendência.
      É chave estrangeira da tabela Modulo*)
    property IdModulo: Double read GetIdModulo write SetIdModulo;
    (** Identificador do Analista Responsável pela Pendência.
      É chave estrangeira da tabela UsuarioSistema*)
    property IdResponsavel: Double read GetIdResponsavel write SetIdResponsavel;
    (** Identificador do Tipo de Pendência.
      É chave estrangeira da tabela TipoPendencia*)
    property IdTipoPendencia: Double read GetIdTipoPendencia write SetIdTipoPendencia;
    property DataSolicitacao: TDateTime read GetDataSolicitacao write SetDataSolicitacao;
    property DataNecessidade: TDateTime read GetDataNecessidade write SetDataNecessidade;
    property DataPrevistaInfo: TDateTime read GetDataPrevistaInfo write SetDataPrevistaInfo;
    property TelaModulo: string read GetTelaModulo write SetTelaModulo;
    property DTLIMDESENV: TDateTime read GetDTLIMDESENV;
    property DTLIMLIB: TDateTime read GetDTLIMLIB;
    property DESCRPROJETO: string read GetDESCRPROJETO;

    property UsuSolicitante: string read GetUsuSolicitante write SetUsuSolicitante;
    (** Prazo estabelecido pelo Desenvolvedor Responsável (propriedade IdResponsavel)
      para o desenvolvimento da Pendência*)
    property PrazoHoras: Cardinal read GetPrazoHoras write SetPrazoHoras;
    (** É o Grau de Prioridade da Pendência. Quanto menor o Número maior a prioridade.

    Se refere sempre a Prioridade em relação às Pendências do mesmo Módulo (IdModulo).

      Geralmente é determinado pelo Gerente Responsável.*)
    property Prioridade: Integer read GetPrioridade write SetPrioridade;
    (** É a Situacao atual da Pendência.

      Está diretamente ligada a SituacaoPendencia do último histórico da Pendência.

      @see HistPendencia
      @see DescSituacaoPendencia*)
    property SituacaoPendencia: TSituacaoPendencia read GetSituacaoPendencia write SetSituacaoPendencia stored false default spAnalise;
    (** É uma string com a descrição da Situacao atual da Pendência.

      Está diretamente ligada a SituacaoPendencia.

      Quando se quer a descrição de uma situação que não a atual pode se usar
      a função SituacaoPendenciaToStr.

      @see HistPendencia
      @see SituacaoPendencia
      @see SituacaoPendenciaToStr*)
    property DescSituacaoPendencia: string read GetDescSituacaoPendencia;
    (** Determina a ordem real em que devem ser resolvidas as Pendências
      pelos desenvolvedores.

    Se refere sempre a Ordem de Execução que deve ser feita por um determinado
     Desenvolvedor (IdResponsavel).

      Geralmente é determinado pelo Gerente Responsável.*)
    property OrdemExecucao: Integer read GetOrdemExecucao write SetOrdemExecucao;
    {HistPendenciaInicial : }
    (** Versão do Módulo quando foi incluída a Pendência ou Versão do Módulo
    que o Cliente (IdCliente) que solicitou a Pendência estava usando.

     Serve para o Desenvolvedor checar seu Módulo e também para controle de
     histórico das Versões. *)
    property VersaoModulo: string read GetVersaoModulo write SetVersaoModulo;
    (** Descrição da Pendência. *)
    property DescHistPendencia: string read GetDescHistPendencia write SetDescHistPendencia;

    property DiaDaSemanaLiberacao: Integer read FDiaDaSemanaLiberacao write SetDiaDaSemanaLiberacao;
    property NumDiasHomologacao: Integer read FNumDiasHomologacao write SetNumDiasHomologacao;
    property Cidade: Integer read FCidade write SetCidade;
    property Pais: Integer read FPais write SetPais;
    property InicioExpediente: TTime read FInicioExpediente write SetInicioExpediente;
    property FimExpediente: TTime read FFimExpediente write SetFimExpediente;
    property TempoExpediente: Integer read FTempoExpediente write SetTempoExpediente;
  end;


implementation

uses
  uDatabase, uSistema, FSM_DbFxLib, uDiasUteis, JclMapi, FSM_FxLib,
   {$IFDEF CM4} IdSMTP {$ELSE} dateutil, SmtpWinshoe {$ENDIF};


{ TCMPendencia }
procedure TCMPendencia.AlterarPendencia(
  TipoAlteracao: TTipoAlteracaoPendencia; const DescHistorico,
  NovaVersaoModulo, TituloEmail, DestEmails, Prazo: string; DtHrInicio, DtHrFim: TDateTime);
var
  SitPendencia, LastPos: Integer;
  sTo, corpoemail: string;
  localidpendencia : double;
begin
  if TipoAlteracao = taRecusar then
  begin
    if Integer(FSituacaoPendencia) = 0 then
      SitPendencia := 5
    else
      if (Integer(FSituacaoPendencia) = 4) or (Integer(FSituacaoPendencia) = 5) then
         SitPendencia := 0
      else
         SitPendencia := Pred(Integer(FSituacaoPendencia));
  end
  else
    SitPendencia := Succ(Integer(FSituacaoPendencia));
  Self.qryMaster.Edit;

  if (FSituacaoPendencia = spAnalise) and (TipoAlteracao = taEncerrar) then PrazoHoras := StrToInt(trim(Prazo));

  if (FSituacaoPendencia = spDesenvolvimento) and (TipoAlteracao = taEncerrar) then
  begin
    if FHistPendencia.qryDetail.IsEmpty then
    begin
      qHistPendenciaInicial.Edit;
      qHistPendenciaInicial.FieldByName('DATAINICIOEFET').AsDateTime := DtHrInicio;
      qHistPendenciaInicial.FieldByName('DATATERMINOEFET').AsDateTime := DtHrFim;
      qHistPendenciaInicial.Post;
    end
    else
    with FHistPendencia do
    begin
      Last;
      if (DtHrFim < DtHrInicio) then
         raise EPendenciaError.Create('Ocorreu um erro enquanto tentava encerrar a Pendencia ' + FloatToStr(Self.IDPendencia)
               + #13#10 + 'A data de fim não pode ser menor que a de início !' );
      if (DtHrInicio < (Date - 365)) then //Só permite datas de até um ano
          raise EPendenciaError.Create('Ocorreu um erro enquanto tentava encerrar a Pendencia ' + FloatToStr(Self.IDPendencia)
               + #13#10 + 'É necessário informar a data de início efetivo da pendência ! !' );
      Edit;
      qryDetail.FieldByName('DATAINICIOEFET').AsDateTime := DtHrInicio;
      qryDetail.FieldByName('DATATERMINOEFET').AsDateTime := DtHrFim;
      Post;
    end;
  end;

  with FHistPendencia do
  begin
    Insert;
    qryDetail.FieldByName('IdHistPendencia').AsInteger := LeUltRegistro(nil, 'HISTPENDENCIA');
    qryDetail.FieldByName('IdPendencia').AsFloat       := FIdPendencia;
    qryDetail.FieldByName('IdUsuario').asfloat       := sistema.idusuario;
    DescHistPendencia := DescHistorico;
    DataHistPendencia := GetServerDate(DatabaseName, ssOracle);
    SituacaoPendencia := TSituacaoPendencia(SitPendencia);
    VersaoModulo := NovaVersaoModulo;
    Post;
  end;
  localidpendencia := FIdPendencia;
  self.ApplyUpdates;
  sTo := Trim(DestEmails);
  if sTo <> '' then
  begin
     corpoemail := 'Prezado Cliente, '+#13+#13+
                   'Informamos que sua pendência nº '+ floattostr(localidpendencia)+'.'+#13;
     case SitPendencia of
        1 : corpoemail := corpoemail + 'Foi aceita com prazo a ser informado pelo nosso departamento de serviço.';
        2 : corpoemail := corpoemail + 'Esta em Homologação Versão : '+NovaVersaoModulo;
        3 : corpoemail := corpoemail + 'Esta em Homologada Versão : '+NovaVersaoModulo;
        4 : corpoemail := corpoemail + 'Esta em Liberada Versão : '+NovaVersaoModulo;
        5 : corpoemail := corpoemail + 'Foi recusada pelo seguinte motivo:'+#13+DescHistorico;
     end;
  end;
  while sTo <> '' do
  begin
    LastPos := Pos(';', sTo);
    if LastPos > 0 then
    begin
      try
         JclSimpleSendMail(Copy(sTo, 1, Pred(LastPos)), Copy(sTo, 1, Pred(LastPos)),
                           ' Pendencia '+floattostr(localidpendencia)+ ' '+TituloEmail, corpoemail ,'',true);
      except
      end;
      System.Delete(sTo, 1, LastPos);
    end
    else
    begin
      try
         JclSimpleSendMail(sTo, sTo,'Pendencia '+floattostr(localidpendencia)+ ' '+TituloEmail, corpoemail ,'',true);
      except
      end;
      sTo := '';
    end;
  end;
  LoadFromDb(-1);
end;


procedure TCMPendencia.ApplyUpdates;
begin
  if CommitKind = ckComponent then
  begin
    if qryMaster.State in dsEditModes then
    begin
      qryMaster.Post;
      Database.ApplyUpdates([qryMaster, qHistPendenciaInicial, FHistPendencia.qryDetail])
    end else
      Database.ApplyUpdates([FHistPendencia.qryDetail, qHistPendenciaInicial, qryMaster]);
    Refresh;
  end else
    if qryMaster.State in dsEditModes then
    begin
      inherited ApplyUpdates;
      qHistPendenciaInicial.ApplyUpdates;
      FHistPendencia.qryDetail.ApplyUpdates;
    end else
    begin
      FHistPendencia.qryDetail.ApplyUpdates;
      qHistPendenciaInicial.ApplyUpdates;
      inherited ApplyUpdates;
    end;
end;

procedure TCMPendencia.Cancel;
begin
  inherited Cancel;
  qHistPendenciaInicial.Cancel;
end;

procedure TCMPendencia.CancelUpdates;
begin
  inherited;
  qHistPendenciaInicial.CancelUpdates;
  FHistPendencia.qryDetail.CancelUpdates;
end;

constructor TCMPendencia.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ParamPendencia := TCMParams.Create(Self);
  with ParamPendencia do
  begin
    ParamTable := 'PARAMPENDENCIA';
    ParamUpdateMode := umOnChange;
  end;
  FIdPendencia := -1;
  FHistPendencia := THistPendencia.Create(Self);
  with qryMaster do
  begin
    SQL.Text := 'SELECT P.IDPENDENCIA, P.IDCLIENTE, P.IDTIPOPENDENCIA, P.IDUSUARIO, '
         + 'P.IDMODULO, P.IDRESPONSAVEL, P.DATASOLICITACAO, P.DATANECESSIDADE, '
         + 'P.DATAPREVISTAINFO, P.TELAMODULO, P.PRAZOHORAS, P.PRIORIDADE, '
         + 'H.DATAINICIOPREV, H.DATATERMINOPREV,  '
         + 'PC.DTLIMDESENV, PC.DTLIMLIB, PC.DESCRPROJETO, '
         + 'H.SITUACAOPENDENCIA, P.ORDEMEXECUCAO,  P.USUSOLICITANTE '
         + 'FROM PENDENCIA P, HISTPENDENCIA H, PROJETOCMM PC '
         + ' WHERE P.IDPENDENCIA = H.IDPENDENCIA AND ( P.IDPENDENCIA =:pIDPENDENCIA )'
         + ' AND ((H.IDHISTPENDENCIA = (SELECT MAX(IDHISTPENDENCIA) FROM HISTPENDENCIA'
         + ' WHERE IDPENDENCIA = :pIDPENDENCIA)) AND (H.SITUACAOPENDENCIA = :pSITUACAOPENDENCIA))'
         + ' AND P.IDPROJETOCMM = PC.IDPROJETOCMM(+) ';
    AfterInsert := qryMasterAfterInsert;
    BeforeDelete := qryMasterBeforeDelete;
  end;
  with usqlMaster do
  begin
    ModifySQL.Text := 'update PENDENCIA set IDPENDENCIA = :IDPENDENCIA, ' + #13 + #10
                    + ' IDCLIENTE = :IDCLIENTE, IDTIPOPENDENCIA = :IDTIPOPENDENCIA, ' + #13 + #10
                    + ' IDUSUARIO = :IDUSUARIO, IDMODULO = :IDMODULO, ' + #13 + #10
                    + ' IDRESPONSAVEL = :IDRESPONSAVEL, DATASOLICITACAO = :DATASOLICITACAO,' + #13 + #10
                    + ' DATANECESSIDADE = :DATANECESSIDADE, DATAPREVISTAINFO = :DATAPREVISTAINFO,' + #13 + #10
                    + ' TELAMODULO = :TELAMODULO, PRAZOHORAS = :PRAZOHORAS, ' + #13 + #10
                    + ' PRIORIDADE = :PRIORIDADE, ORDEMEXECUCAO = :ORDEMEXECUCAO, USUSOLICITANTE = :USUSOLICITANTE' + #13 + #10
                    + ' where IDPENDENCIA = :OLD_IDPENDENCIA ';

    InsertSQL.Text := 'insert into PENDENCIA  ' + #13 + #10
                    + '   (IDPENDENCIA, IDCLIENTE, IDTIPOPENDENCIA, IDUSUARIO, IDMODULO, IDRESPONSAVEL,' + #13 + #10
                    + '    DATASOLICITACAO, DATANECESSIDADE, DATAPREVISTAINFO, TELAMODULO, PRAZOHORAS, ' + #13 + #10
                    + '    PRIORIDADE, ORDEMEXECUCAO, USUSOLICITANTE) values ' + #13 + #10
                    + '   (:IDPENDENCIA, :IDCLIENTE, :IDTIPOPENDENCIA, :IDUSUARIO, :IDMODULO, ' + #13 + #10
                    + '    :IDRESPONSAVEL, :DATASOLICITACAO, :DATANECESSIDADE, :DATAPREVISTAINFO, ' + #13 + #10
                    + '    :TELAMODULO, :PRAZOHORAS, :PRIORIDADE, :ORDEMEXECUCAO, :USUSOLICITANTE)';
    DeleteSQL.Text := 'delete from PENDENCIA where IDPENDENCIA = :OLD_IDPENDENCIA';
  end;
  usqlHistPendenciaInicial := TUpdateSQL.Create(nil);
  qHistPendenciaInicial := TwwQuery.Create(nil);
  with qHistPendenciaInicial do
  begin
    CachedUpdates := True;
    DatabaseName := Self.DatabaseName;
    SQL.Text := 'SELECT IDHISTPENDENCIA, IDPENDENCIA, DATAHISTPENDENCIA, DESCHISTPENDENCIA, '
         + 'SITUACAOPENDENCIA, VERSAOMODULO, DATAINICIOPREV, DATAINICIOEFET, DATATERMINOPREV, '
         + 'DATATERMINOEFET FROM HISTPENDENCIA H '
         + 'WHERE ( IDPENDENCIA =:pIDPENDENCIA ) AND '
         + '( IDHISTPENDENCIA = (SELECT MIN(IDHISTPENDENCIA) FROM HISTPENDENCIA '
         + ' WHERE IDPENDENCIA = :pIDPENDENCIA) )';
    UpdateObject := usqlHistPendenciaInicial;
  end;
  with usqlHistPendenciaInicial do
  begin
    InsertSQL.Text := 'insert into HISTPENDENCIA (IDHISTPENDENCIA, IDPENDENCIA, '
                    + 'DATAHISTPENDENCIA, DESCHISTPENDENCIA, SITUACAOPENDENCIA, '
                    + 'VERSAOMODULO, DATAINICIOPREV, DATAINICIOEFET, DATATERMINOPREV, '
                    + 'DATATERMINOEFET) values (:IDHISTPENDENCIA, :IDPENDENCIA, '
                    + ':DATAHISTPENDENCIA, :DESCHISTPENDENCIA, :SITUACAOPENDENCIA, '
                    + ':VERSAOMODULO, :DATAINICIOPREV, :DATAINICIOEFET, '
                    + ':DATATERMINOPREV, :DATATERMINOEFET)';
    ModifySQL.Text := 'update HISTPENDENCIA set IDHISTPENDENCIA = :IDHISTPENDENCIA, ' + #13 + #10
                    + '  IDPENDENCIA = :IDPENDENCIA, DATAHISTPENDENCIA = :DATAHISTPENDENCIA,' + #13 + #10
                    + '  DESCHISTPENDENCIA = :DESCHISTPENDENCIA, SITUACAOPENDENCIA = :SITUACAOPENDENCIA,' + #13 + #10
                    + '  VERSAOMODULO = :VERSAOMODULO, DATAINICIOPREV = :DATAINICIOPREV, ' + #13 + #10
                    + '  DATAINICIOEFET = :DATAINICIOEFET, DATATERMINOPREV = :DATATERMINOPREV, ' + #13 + #10
                    + '  DATATERMINOEFET = :DATATERMINOEFET where IDHISTPENDENCIA = :OLD_IDHISTPENDENCIA';
    DeleteSQL.Text := 'delete from HISTPENDENCIA where IDHISTPENDENCIA = :OLD_IDHISTPENDENCIA';
  end;
end;

destructor TCMPendencia.Destroy;
begin
  ParamPendencia.Free;
  FHistPendencia.Free;
  qHistPendenciaInicial.Close;
  qHistPendenciaInicial.Free;
  usqlHistPendenciaInicial.Free;
  inherited Destroy;
end;

procedure TCMPendencia.Edit;
begin
  if FSituacaoPendencia in [spLiberada, spRecusada] then
    raise EPendenciaError.Create('Esta Pendência já está encerrada e não pode mais ser alterada ')
  else
  begin
    inherited Edit;
    qHistPendenciaInicial.Edit;
  end;
end;

procedure TCMPendencia.Insert;
begin
  if FSituacaoPendencia in [spAnalise, spDesenvolvimento, spAdiamento] then
    inherited Insert
  else
    raise EPendenciaError.Create('Não é possível inserir uma pendência com situação '
      + GetDescHistPendencia + #13 + #10 + 'Para inserir uma nova pendência certifique-se de que '
      + 'a situação dela seja ' + SituacaoPendenciaToStr(spAnalise) + ', '
      + SituacaoPendenciaToStr(spDesenvolvimento) + ' ou '
      + SituacaoPendenciaToStr(spAdiamento));
end;

function TCMPendencia.GetDataNecessidade: TDateTime;
begin
  {$IFDEF CM4}
  GetFieldValue('DATANECESSIDADE', Result);
  {$ELSE}
  GetFieldValueAsDateTime('DATANECESSIDADE', Result);
  {$ENDIF}
end;

function TCMPendencia.GetDataPrevistaInfo: TDateTime;
begin
  {$IFDEF CM4}
  GetFieldValue('DATAPREVISTAINFO', Result);
  {$ELSE}
  GetFieldValueAsDateTime('DATAPREVISTAINFO', Result);
  {$ENDIF}
end;

function TCMPendencia.GetDataSolicitacao: TDateTime;
begin
  {$IFDEF CM4}
  GetFieldValue('DATASOLICITACAO', Result);
  {$ELSE}
  GetFieldValueAsDateTime('DATASOLICITACAO', Result);
  {$ENDIF}
end;

function TCMPendencia.GetDescHistPendencia: string;
begin
  Result := qryHistPendenciaInicial.FieldByName('DESCHISTPENDENCIA').AsString;
end;

function TCMPendencia.GetDescSituacaoPendencia: string;
begin
  Result := SituacaoPendenciaToStr(FSituacaoPendencia);
end;

function TCMPendencia.GetIdCliente: Double;
begin
  {$IFDEF CM4}
  GetFieldValue('IDCLIENTE', Result);
  {$ELSE}
  GetFieldValueAsFloat('IDCLIENTE', Result);
  {$ENDIF}
end;

function TCMPendencia.GetIdModulo: Double;
begin
  {$IFDEF CM4}
  GetFieldValue('IDMODULO', Result);
  {$ELSE}
  GetFieldValueAsFloat('IDMODULO', Result);
  {$ENDIF}
end;

function TCMPendencia.GetIdPendencia: Double;
begin
  {$IFDEF CM4}
  GetFieldValue('IDPENDENCIA', Result);
  {$ELSE}
  GetFieldValueAsFloat('IDPENDENCIA', Result);
  {$ENDIF}
end;

function TCMPendencia.GetIdResponsavel: Double;
begin
  {$IFDEF CM4}
  GetFieldValue('IDRESPONSAVEL', Result);
  {$ELSE}
  GetFieldValueAsFloat('IDRESPONSAVEL', Result);
  {$ENDIF}
end;

function TCMPendencia.GetIdTipoPendencia: Double;
begin
  {$IFDEF CM4}
  GetFieldValue('IDTIPOPENDENCIA', Result);
  {$ELSE}
  GetFieldValueAsFloat('IDTIPOPENDENCIA', Result);
  {$ENDIF}
end;

function TCMPendencia.GetIdUsuario: Double;
begin
  {$IFDEF CM4}
  GetFieldValue('IDUSUARIO', Result);
  {$ELSE}
  GetFieldValueAsFloat('IDUSUARIO', Result);
  {$ENDIF}
end;

function TCMPendencia.GetLastVersaoModulo: string;
var
  CurrHist: TBookmark;
begin
  Result := '';
  if FHistPendencia.qryDetail.IsEmpty then
    Result := VersaoModulo
  else
  begin
    with FHistPendencia.qryDetail do
    begin
      CurrHist := GetBookmark;
      DisableControls;
      try
        Last;
        Result := FHistPendencia.VersaoModulo;
        if BookmarkValid(CurrHist) then
          GotoBookmark(CurrHist);
        FreeBookmark(CurrHist);
      finally
        EnableControls;
      end;
    end;
  end;
end;

function TCMPendencia.GetOrdemExecucao: Integer;
begin
  {$IFDEF CM4}
  GetFieldValue('ORDEMEXECUCAO', Result);
  {$ELSE}
  GetFieldValueAsInteger('ORDEMEXECUCAO', Result);
  {$ENDIF}
end;

function TCMPendencia.GetPrazoHoras: Cardinal;
begin
  {$IFDEF CM4}
  GetFieldValue('PRAZOHORAS', Integer(Result));
  {$ELSE}
  GetFieldValueAsInteger('PRAZOHORAS', Integer(Result));
  {$ENDIF}
end;

function TCMPendencia.GetPrioridade: Integer;
begin
  {$IFDEF CM4}
  GetFieldValue('PRIORIDADE', Result);
  {$ELSE}
  GetFieldValueAsInteger('PRIORIDADE', Result);
  {$ENDIF}
end;

function TCMPendencia.GetSituacaoPendencia: TSituacaoPendencia;
begin
  Result := FSituacaoPendencia;
end;

function TCMPendencia.GetTelaModulo: string;
begin
  {$IFDEF CM4}
  GetFieldValue('TELAMODULO', Result);
  {$ELSE}
  GetFieldValueAsString('TELAMODULO', Result);
  {$ENDIF}
end;

function TCMPendencia.GetDTLIMDESENV: TDateTime;
begin
  {$IFDEF CM4}
  GetFieldValue('DTLIMDESENV', Result);
  {$ELSE}
  GetFieldValueAsDateTime('DTLIMDESENV', Result);
  {$ENDIF}end;

function TCMPendencia.GetDTLIMLIB: TDateTime;
begin
  {$IFDEF CM4}
  GetFieldValue('DTLIMLIB', Result);
  {$ELSE}
  GetFieldValueAsDateTime('DTLIMLIB', Result);
  {$ENDIF}end;

function TCMPendencia.GetDESCRPROJETO: string;
begin
  {$IFDEF CM4}
  GetFieldValue('DESCRPROJETO', Result);
  {$ELSE}
  GetFieldValueAsString('DESCRPROJETO', Result);
  {$ENDIF}
end;

function TCMPendencia.GetUsuSolicitante: string;
begin
  {$IFDEF CM4}
  GetFieldValue('USUSOLICITANTE', Result);
  {$ELSE}
  GetFieldValueAsString('USUSOLICITANTE', Result);
  {$ENDIF}
end;

function TCMPendencia.GetVersaoModulo: string;
begin
  Result := qryHistPendenciaInicial.FieldByName('VERSAOMODULO').AsString;
end;

function TCMPendencia.LoadFromDB(ID: Double): Boolean;
begin
  FIdPendencia := ID;
  with qryMaster do
  begin
    Close;
    ParamByName('pIDPENDENCIA').AsFloat := ID;
    ParamByName('pSITUACAOPENDENCIA').AsFloat := Integer(Self.FSituacaoPendencia);
    Open;
    Result := not IsEmpty;
  end;
  with qHistPendenciaInicial do
  begin
    Close;
    ParamByName('pIDPENDENCIA').AsFloat := ID;
    Open;
  end;
  with FHistPendencia.qryDetail do
  begin
    Close;
    ParamByName('pIDPENDENCIA').AsFloat := ID;
    ParamByName('pIDHISTPENDENCIA').AsFloat := qHistPendenciaInicial.FieldByName('IDHISTPENDENCIA').AsFloat;
    Open;
  end;
  if not Result then
     FIdPendencia := -1;
end;

procedure TCMPendencia.Post;
begin
  if qryMaster.State = dsInsert then
    if FSituacaoPendencia = spAdiamento then
    begin
      if IdResponsavel <= 0 then
        raise EPendenciaError.Create('É obrigatória a informação do Analista Responsável');
      if qHistPendenciaInicial.FieldByName('DATAHISTPENDENCIA').IsNull then
        raise EPendenciaError.Create('É obrigatória a informação da data de início');
      if PrazoHoras <= 0 then
        raise EPendenciaError.Create('É obrigatória a informação do prazo' );
      if Trim(DescHistPendencia) = '' then
        raise EPendenciaError.Create('É obrigatória a informação da descrição');
    end else
    begin
      if (FSituacaoPendencia = spDesenvolvimento) and (IdResponsavel <= 0) then
        raise EPendenciaError.Create('É obrigatória a informação do Analista Responsável');
      if (FSituacaoPendencia > spHomologacao) then
        raise EPendenciaError.Create('Não é permitido inserir uma pendência com status maior que em homologação');
      if DataSolicitacao <= 1 then
        raise EPendenciaError.Create('É obrigatória a informação da data de solicitação');
      if (FSituacaoPendencia = spDesenvolvimento) and (PrazoHoras <= 0) then
        raise EPendenciaError.Create('É obrigatória a informação do prazo');
      if Trim(DescHistPendencia) = '' then
        raise EPendenciaError.Create('É obrigatória a informação da descrição');
      qHistPendenciaInicial.FieldByName('DATAHISTPENDENCIA').AsDateTime := DataSolicitacao;
    end;
  qHistPendenciaInicial.Post;
  Self.ApplyUpdates;
end;

procedure TCMPendencia.qryMasterAfterInsert(DataSet: TDataSet);
begin
  qHistPendenciaInicial.Insert;
  qHistPendenciaInicial.FieldByName('SITUACAOPENDENCIA').AsInteger := Integer(SituacaoPendencia);
  qHistPendenciaInicial.FieldByName('IDHISTPENDENCIA').AsInteger := LeUltRegistro(nil, 'HISTPENDENCIA');
  with FHistPendencia.qryDetail do
  begin
    Close;
    ParamByName('pIDPENDENCIA').AsFloat := -1;
    ParamByName('pIDHISTPENDENCIA').AsFloat := -1;
    Open;
  end;
  // incrementa o identificador de Pendências se for inserção
  FIdPendencia := LeUltRegistro(nil, 'PENDENCIA');
  // grava o id
  qryMaster.FieldByName('IDPENDENCIA').AsFloat := FIdPendencia;
  qHistPendenciaInicial.FieldByName('IDPENDENCIA').AsFloat := FIdPendencia;
  qryMaster.FieldByName('PRIORIDADE').AsInteger := UltimaPrioridade;
  qryMaster.FieldByName('ORDEMEXECUCAO').AsInteger := UltimaOrdemExecucao;
  qryMaster.FieldByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
end;

procedure TCMPendencia.qryMasterBeforeDelete(DataSet: TDataSet);
begin
  if FHistPendencia.qryDetail.IsEmpty then
    qHistPendenciaInicial.Delete
  else
    raise EPendenciaError.Create('Não é possível excluir uma pendência que possui histórico.');
end;

procedure TCMPendencia.Refresh;
begin
  LoadFromDB(FIdPendencia);
end;

procedure TCMPendencia.SetDataNecessidade(const Value: TDateTime);
begin
  qryMaster.FieldByName('DATANECESSIDADE').AsDateTime := Value;
end;

procedure TCMPendencia.SetDataPrevistaInfo(const Value: TDateTime);
begin
  qryMaster.FieldByName('DATAPREVISTAINFO').AsDateTime := Value;
end;

procedure TCMPendencia.SetDTLIMDESENV(const Value: TDateTime);
begin
  if (TCMPendencia(Owner).SituacaoPendencia in [spDesenvolvimento, spHomologacao]) then
    qryMaster.FieldByName('DTLIMDESENV').AsDateTime := Value;
end;

procedure TCMPendencia.SetDTLIMLIB(const Value: TDateTime);
begin
  if (TCMPendencia(Owner).SituacaoPendencia in [spDesenvolvimento, spHomologacao]) then
    qryMaster.FieldByName('DTLIMLIB').AsDateTime := Value;
end;

procedure TCMPendencia.SetDESCRPROJETO(const Value: string);
begin
  qryMaster.FieldByName('DESCRPROJETO').AsString := Value;
end;


procedure TCMPendencia.SetDataSolicitacao(const Value: TDateTime);
begin
  qryMaster.FieldByName('DATASOLICITACAO').AsDateTime := Value;
end;

procedure TCMPendencia.SetDescHistPendencia(const Value: string);
begin
  qHistPendenciaInicial.FieldByName('DESCHISTPENDENICA').AsString := Value;
end;

procedure TCMPendencia.SetIdCliente(const Value: Double);
begin
  qryMaster.FieldByName('IDCLIENTE').AsFloat := Value;
end;

procedure TCMPendencia.SetIdModulo(const Value: Double);
begin
  qryMaster.FieldByName('IDMODULO').AsFloat := Value;
end;

procedure TCMPendencia.SetIdResponsavel(const Value: Double);
begin
  qryMaster.FieldByName('IDRESPONSAVEL').AsFloat := Value;
end;

procedure TCMPendencia.SetIdTipoPendencia(const Value: Double);
begin
  qryMaster.FieldByName('IDTIPOPENDENCIA').AsFloat := Value;
end;

procedure TCMPendencia.SetIdUsuario(const Value: Double);
begin
  qryMaster.FieldByName('IDUSUARIO').AsFloat := Value;
end;

procedure TCMPendencia.SetOrdemExecucao(const Value: Integer);
begin
  qryMaster.FieldByName('ORDEMEXECUCAO').AsInteger := Value;
end;

procedure TCMPendencia.SetPrazoHoras(const Value: Cardinal);
begin
  qryMaster.FieldByName('PRAZOHORAS').AsInteger := Value;
end;

procedure TCMPendencia.SetPrioridade(const Value: Integer);
begin
  qryMaster.FieldByName('PRIORIDADE').AsInteger := Value;
end;

procedure TCMPendencia.SetSituacaoPendencia( const Value: TSituacaoPendencia);
begin
  FSituacaoPendencia := Value;
  LoadFromDb(-1);
end;

procedure TCMPendencia.SetTelaModulo(const Value: string);
begin
  qryMaster.FieldByName('TELAMODULO').AsString := Value;
end;

procedure TCMPendencia.SetUsuSolicitante(const Value: string);
begin
  qryMaster.FieldByName('USUSOLICITANTE').AsString := Value;
end;

procedure TCMPendencia.SetVersaoModulo(const Value: string);
begin
  qryMaster.FieldByName('VERSAOMODULO').AsString := Value;
end;

class function TCMPendencia.SituacaoPendenciaToStr(
  SituacaoPendencia: TSituacaoPendencia): string;
begin
  case SituacaoPendencia of
    spAnalise: Result         := 'Em Análise';
    spDesenvolvimento: Result := 'Em Desenvolvimento';
    spHomologacao: Result     := 'Em Homologação';
    spHomologada: Result      := 'Homologada';
    spLiberada: Result        := 'Liberada';
    spRecusada: Result        := 'Recusada';
    spSugestao: Result        := 'Sugestão';
  else Result := 'Situação não Cadastrada';
  end;
end;

procedure TCMPendencia.UpdateDatabaseName;
begin
  inherited;
  qHistPendenciaInicial.Close;
  qHistPendenciaInicial.DatabaseName := Self.DatabaseName;
  FHistPendencia.qryDetail.Close;
  FHistPendencia.qryDetail.DatabaseName := Self.DatabaseName;
  ParamPendencia.DatabaseName := Self.DatabaseName;
  LoadParamsPendencia;
end;

function TCMPendencia.UltimaOrdemExecucao: Integer;
var
  Q: TwwQuery;
begin
  Q := TwwQuery.Create(Self);
    try
      Q.DatabaseName := Self.DatabaseName;
      Q.SQL.Text := 'SELECT MAX(ORDEMEXECUCAO) as ORDEMEXECUCAO FROM PENDENCIA';
      Q.open;
      if not Q.IsEmpty then
        Result := Q.Fields[0].AsInteger + 1
      else
        Result := 1;
      Q.Close;
    finally
      Q.Free;
    end;
end;

function TCMPendencia.UltimaPrioridade: Integer;
var
  Q: TwwQuery;
begin
  Q := TwwQuery.Create(Self);
    try
      Q.DatabaseName := Self.DatabaseName;
      Q.SQL.Add('SELECT MAX(PRIORIDADE) AS PRIORIDADE FROM PENDENCIA');
      Q.Open;
      if not Q.IsEmpty then
        Result := Q.Fields[0].AsInteger + 1
      else
        Result := 1;
      Q.Close;
    finally

      Q.Free;
    end;
end;

procedure TCMPendencia.UpdateDataTerminoPrev(Desenvolvedor: Double; DataInicial : TDateTime);
var
  UltDataTermino, UltDataTerminoTemp, ldataprevistainfo : TDateTime;
  Q, QP : TQuery;
  uSql, uSqlP : TUpdateSQL;
  NumDiasNaoUteisNoPeriodo, NumHorasAdiamentos, HrExtra, MinExtra: Integer;
begin
  Q := TQuery.Create(Self);
  uSQL := TUpdateSQL.Create(Self);
  QP := TQuery.Create(Self);
  uSQLP := TUpdateSQL.Create(Self);
  try
    QP.DatabaseName := DatabaseName;
    QP.SQL.Text  := 'SELECT p.DATAPREVISTAINFO, P.IDPENDENCIA '
                  + 'FROM HISTPENDENCIA H, PENDENCIA P '
                  + 'WHERE (P.IDRESPONSAVEL = ' + FloatToStr(Desenvolvedor)
                  + ') and (H.SITUACAOPENDENCIA = 1) AND '
                  + '   (H.IDHISTPENDENCIA = (SELECT MAX(H3.IDHISTPENDENCIA) '
                  + '                         FROM HISTPENDENCIA H3 '
                  + '                         WHERE (H3.IDPENDENCIA = H.IDPENDENCIA))) '
                  + '   AND IDRESPONSAVEL IS NOT NULL '
                  + '   AND P.IDPENDENCIA = H.IDPENDENCIA '
                  + 'ORDER BY P.IDPENDENCIA';
    QP.UpdateObject := uSqlP;
    uSqlP.ModifySQL.Text := 'UPDATE PENDENCIA SET DATAPREVISTAINFO = :DATAPREVISTAINFO WHERE IDPENDENCIA = :IDPENDENCIA ';

    Q.DatabaseName := DatabaseName;
    Q.SQL.Text := 'SELECT P.IDRESPONSAVEL, MIN(DATAINICIOPREV) AS DATAINICIO '
                + 'FROM PENDENCIA P, HISTPENDENCIA H '
                + 'WHERE (P.IDRESPONSAVEL = ' + FloatToStr(Desenvolvedor)
                + ') AND (H.SITUACAOPENDENCIA = 1) '
                + ' AND (P.IDPENDENCIA = H.IDPENDENCIA) '
                + ' GROUP BY P.IDRESPONSAVEL ';
    Q.Open;
      if DataInicial <> 0 then
         UltDataTerminoTemp := DataInicial
      else
         if Q.Fields[1].AsDateTime < Date then
            UltDataTerminoTemp := Q.Fields[1].AsDateTime
         else
            UltDataTerminoTemp := Date;

      Q.Close;
      Q.CachedUpdates := True;
      QP.CachedUpdates := True;
      Q.UpdateObject := uSql;
      uSql.ModifySQL.Text := 'UPDATE HISTPENDENCIA SET DATATERMINOPREV = :DATATERMINOPREV, DATAINICIOPREV = :DATAINICIOPREV  WHERE IDHISTPENDENCIA = :IDHISTPENDENCIA ';

      Q.SQL.Text := 'SELECT H.IDPENDENCIA, IDHISTPENDENCIA, P.IDRESPONSAVEL, P.ORDEMEXECUCAO, DATAINICIOPREV, DATATERMINOPREV, P.PRAZOHORAS, '
                  + '  p.DATAPREVISTAINFO '
                  + 'FROM HISTPENDENCIA H, PENDENCIA P '
                  + 'WHERE (P.IDRESPONSAVEL = ' + FloatToStr(Desenvolvedor)
                  + ') and (H.SITUACAOPENDENCIA = 1) AND '
                  + '   (H.IDHISTPENDENCIA = (SELECT MAX(H3.IDHISTPENDENCIA) '
                  + '                         FROM HISTPENDENCIA H3 '
                  + '                         WHERE (H3.IDPENDENCIA = H.IDPENDENCIA))) '
                  + '   AND IDRESPONSAVEL IS NOT NULL '
                  + '   AND P.IDPENDENCIA = H.IDPENDENCIA '
                  + 'ORDER BY P.IDRESPONSAVEL, P.ORDEMEXECUCAO';
      Q.Open;
      QP.open;
      //DataInicio = Campo 4 //DataTermino = Campo 5  //PrazoHoras = Campo 6  //DataPrevistaInfo = Campo 7
      while not Q.EOF do
      begin
        Q.Edit;
        //  A data de início prevista da primeira pendência recebe
        //  a última data de término efetiva do desenvolvedor.
        //  --------------------------------------------------------------------------------------
        Q.Fields[4].AsDateTime := UltDataTerminoTemp;
        //  --------------------------------------------------------------------------------------

        //  Incrementa-se UltDataTermino pelo número de dias e de horas referentes
        //  a pendência.
        UltDataTermino := IncHour(IncDay(UltDataTerminoTemp,
          (Q.Fields[6].AsInteger div FTempoExpediente)), (Q.Fields[6].AsInteger mod FTempoExpediente) );
        //  Neste looping é verificado se não coincidiu nenhum feriado e/ou adiamento
        //  no período que foi cálculado acima.
        repeat
          //Testa se o término da pendência ficou fora do horário do expediente
          if (ExtractHour(UltDataTermino) > ExtractHour(FFimExpediente)) or
              ((ExtractHour(UltDataTermino) = ExtractHour(FFimExpediente))
              and (ExtractMinute(UltDataTermino) > ExtractMinute(FFimExpediente))) then
          begin
            //HrExtra recebe o número de horas que ultrapassou o horário do expediente
            HrExtra := ExtractHour(UltDataTermino) - ExtractHour(FFimExpediente);
            if (ExtractMinute(UltDataTermino) >= ExtractMinute(FFimExpediente)) then
              MinExtra := ExtractMinute(UltDataTermino) - ExtractMinute(FFimExpediente)
            else
            begin
              Dec(HrExtra);
              MinExtra := 60 - (ExtractMinute(FFimExpediente) - ExtractMinute(UltDataTermino));
            end;
            UltDataTermino := IncMinute(IncHour(Trunc(UltDataTermino) + 1, ExtractHour(FInicioExpediente) + HrExtra), ExtractMinute(FInicioExpediente) + MinExtra);
          end else
            if (ExtractHour(UltDataTermino) < ExtractHour(FInicioExpediente)) then
            begin
              HrExtra := (24 - ExtractHour(FFimExpediente)) + ExtractHour(UltDataTermino);
              if (ExtractMinute(UltDataTermino) >= ExtractMinute(FFimExpediente)) then
                MinExtra := ExtractMinute(UltDataTermino) - ExtractMinute(FFimExpediente)
              else
              begin
                Dec(HrExtra);
                MinExtra := 60 - (ExtractMinute(FFimExpediente) - ExtractMinute(UltDataTermino));
              end;
              UltDataTermino := IncMinute(IncHour(Trunc(UltDataTermino), ExtractHour(FInicioExpediente) + HrExtra), ExtractMinute(FInicioExpediente) + MinExtra);
            end;
          NumDiasNaoUteisNoPeriodo := DiasUteis.ContaDiasNaoUteis(Trunc(UltDataTerminoTemp), Trunc(UltDataTermino),
            FCidade, FPais, '', False,  False, False);
          NumHorasAdiamentos := TotalDeHorasDeAdiamentos(Desenvolvedor, Trunc(UltDataTerminoTemp), Trunc(UltDataTermino));
          UltDataTerminoTemp := UltDataTermino + 1;
          //Incrementa a data de fim pelo numero de dias não utéis do período
          UltDataTermino := UltDataTermino + NumDiasNaoUteisNoPeriodo;
          //Incrementa a data de fim pelo numero de dias/horas de adiamentos do desenvolvedor
          UltDataTermino := IncHour(IncDay(UltDataTermino, (NumHorasAdiamentos div FTempoExpediente)), (NumHorasAdiamentos mod FTempoExpediente) );
        until (NumDiasNaoUteisNoPeriodo = 0) and (NumHorasAdiamentos = 0);

        UltDataTerminoTemp := UltDataTermino;
        Q.Fields[5].AsDateTime := UltDataTermino;
        // Icluir a DataPrevistainfo se acaso for vazio
        if Q.Fields[7].isnull then
        begin
           if QP.Locate('IDPENDENCIA',Q.fieldbyname('IDPENDENCIA').value ,[]) then
           begin
              ldataprevistainfo := Q.Fields[5].AsDateTime + fNumDiasHomologacao;
              if dayofweek(ldataprevistainfo) < fDiadaSemanaLiberacao then
                 ldataprevistainfo := ldataprevistainfo + (fDiadaSemanaLiberacao - dayofweek(ldataprevistainfo))
              else
                if dayofweek(ldataprevistainfo) > fDiadaSemanaLiberacao then
                   ldataprevistainfo := ldataprevistainfo + ((7 - dayofweek(ldataprevistainfo))+ fDiadaSemanaLiberacao);
              QP.edit;
              QP.Fieldbyname('DATAPREVISTAINFO').asdatetime := ldataprevistainfo;
              QP.Post;
           end;
        end;
        Q.Post;
        Q.Next;
      end;
      Database.ApplyUpdates([Q,QP]);
    Q.Close;
  finally
    Q.Free;
  end;
end;

procedure TCMPendencia.SetCidade(const Value: Integer);
begin
  FCidade := Value;
  if (ParamPendencia <> nil) and (ParamPendencia.DatabaseName <> '') then
    with ParamPendencia do
    begin
      Open;
      if Items['Cidade'] = nil then
        Add('Cidade', ftInteger, IntToStr(Value))
      else
        Items['Cidade'].AsInteger := Value;
      Close;
    end;
end;

procedure TCMPendencia.SetDiaDaSemanaLiberacao(const Value: Integer);
begin
  FDiaDaSemanaLiberacao := Value;
  if (ParamPendencia <> nil) and (ParamPendencia.DatabaseName <> '') then
    with ParamPendencia do
    begin
      Open;
      if Items['DiaSemanaLiberacao'] = nil then
        Add('DiaSemanaLiberacao', ftInteger, IntToStr(Value))
      else
        Items['DiaSemanaLiberacao'].AsInteger := Value;
      Close;
    end;
end;

procedure TCMPendencia.SetNumDiasHomologacao(const Value: Integer);
begin
  FNumDiasHomologacao := Value;
  if (ParamPendencia <> nil) and (ParamPendencia.DatabaseName <> '') then
    with ParamPendencia do
    begin
      Open;
      if Items['NumDiasHomologa'] = nil then
        Add('NumDiasHomologa', ftInteger, IntToStr(Value))
      else
        Items['NumDiasHomologa'].AsInteger := Value;
      Close;
    end;
end;

procedure TCMPendencia.SetPais(const Value: Integer);
begin
  FPais := Value;
  if (ParamPendencia <> nil) and (ParamPendencia.DatabaseName <> '') then
    with ParamPendencia do
    begin
      Open;
      if Items['Pais'] = nil then
        Add('Pais', ftInteger, IntToStr(Value))
      else
        Items['Pais'].AsInteger := Value;
      Close;
    end;
end;

procedure TCMPendencia.Loaded;
begin
  inherited Loaded;
  LoadParamsPendencia;
end;

procedure TCMPendencia.LoadParamsPendencia;
begin
  with ParamPendencia do
  begin
    try
      Open;
      if Items['DiaSemanaLiberacao'] = nil then
        FDiaDaSemanaLiberacao := 2
      else
        FDiaDaSemanaLiberacao := Items['DiaSemanaLiberacao'].AsInteger;
      if Items['NumDiasHomologa'] = nil then
        FNumDiasHomologacao := 7
      else
        FNumDiasHomologacao := Items['NumDiasHomologa'].AsInteger;
      if Items['Cidade'] <> nil then
        FCidade := Items['Cidade'].AsInteger
      else
        FCidade := -1;
      if Items['Pais'] <> nil then
        FPais := Items['Pais'].AsInteger
      else
        FPais := -1;
      if Items['IniExp'] <> nil then
        FInicioExpediente := Items['IniExp'].AsTime
      else
        FInicioExpediente := -1;
      if Items['FimExp'] <> nil then
        FFimExpediente := Items['FimExp'].AsTime
      else
        FFimExpediente := -1;
      if Items['TempoExpediente'] <> nil then
        FTempoExpediente := Items['TempoExpediente'].AsInteger
      else
        FTempoExpediente := 8;
      Close;
    except
    end;
  end;
end;

procedure TCMPendencia.SetFimExpediente(const Value: TTime);
begin
  FFimExpediente := Value;
  if (ParamPendencia <> nil) and (ParamPendencia.DatabaseName <> '') then
    with ParamPendencia do
    begin
      Open;
      if Items['FimExp'] = nil then
        Add('FimExp', ftTime, FormatDateTime('HH:NN', Value))
      else
        Items['FimExp'].AsTime := Value;
      Close;
    end;
end;

procedure TCMPendencia.SetInicioExpediente(const Value: TTime);
begin
  FInicioExpediente := Value;
  if (ParamPendencia <> nil) and (ParamPendencia.DatabaseName <> '') then
    with ParamPendencia do
    begin
      Open;
      if Items['IniExp'] = nil then
        Add('IniExp', ftTime, FormatDateTime('HH:NN', Value))
      else
        Items['IniExp'].AsTime := Value;
      Close;
    end;
end;

function TCMPendencia.TotalDeHorasDeAdiamentos(const Desenvolvedor: Double;
  const DtHrInicio, DtHrFim: TDateTime): Integer;
var
  qAdiamentos : TQuery;
begin
  Result := 0;
  qAdiamentos := TQuery.Create(Self);
  try
    qAdiamentos.DatabaseName := DatabaseName;
    qAdiamentos.SQL.Text := 'SELECT SUM(P.PRAZOHORAS) AS TOTALHORAS '
                          + 'FROM PENDENCIA P, HISTPENDENCIA H '
                          + 'WHERE P.IDPENDENCIA = H.IDPENDENCIA '
                          + 'AND IDRESPONSAVEL = ' + FloatToStr(Desenvolvedor)
                          + ' AND H.SITUACAOPENDENCIA = 6 '
                          + 'AND DATAHISTPENDENCIA BETWEEN '
                          + 'TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', DtHrInicio)) + ', ''DD/MM/YYYY'') '
                          + 'AND TO_DATE(' + QuotedStr(FormatDateTime('DD/MM/YYYY', DtHrFim)) + ', ''DD/MM/YYYY'') ';
    try
      qAdiamentos.Open;
      Result := qAdiamentos.Fields[0].AsInteger;
      qAdiamentos.Close;
    except
    end;
  finally
    qAdiamentos.Free;
  end;
end;

procedure TCMPendencia.SetTempoExpediente(const Value: Integer);
begin
  FTempoExpediente := Value;
  if (ParamPendencia <> nil) and (ParamPendencia.DatabaseName <> '') then
    with ParamPendencia do
    begin
      Open;
      if Items['TempoExpediente'] = nil then
        Add('TempoExpediente', ftInteger, FloatToStr(Value))
      else
        Items['TempoExpediente'].AsInteger := Value;
      Close;
    end;
end;

{ THistPendencia }

constructor THistPendencia.Create(AOwner: TCMPendencia);
begin
  inherited Create(AOwner);
  qryDetail.SQL.Text := 'SELECT IDHISTPENDENCIA, IDPENDENCIA, DATAHISTPENDENCIA, '
              + '       DESCHISTPENDENCIA, SITUACAOPENDENCIA, VERSAOMODULO, '
              + ' DATAINICIOPREV, DATAINICIOEFET, DATATERMINOPREV, DATATERMINOEFET, '
              + ' H.IDUSUARIO, U.NOMEUSUARIO, '
              + '  DECODE(SITUACAOPENDENCIA,0,''Em Analise'', '
              + '        DECODE(SITUACAOPENDENCIA,1,''Em Desenvolvimento'', '
              + '        DECODE(SITUACAOPENDENCIA,2,''Em Homologação'',      '
              + '        DECODE(SITUACAOPENDENCIA,3,''Homologada'',          '
              + '        DECODE(SITUACAOPENDENCIA,4,''Liberada'',            '
              + '        DECODE(SITUACAOPENDENCIA,5,''Recusada'','''')))))) as NOMESITUACAOPENDENCIA'
              + ' FROM HISTPENDENCIA H, USUARIOSISTEMA U '
              + ' WHERE (IDPENDENCIA = :pIDPENDENCIA) AND (IDHISTPENDENCIA > :pIDHISTPENDENCIA) '
              + ' AND (H.IDUSUARIO = U.IDUSUARIO(+))'
              + ' ORDER BY IDHISTPENDENCIA';
  with usqlDetail do
  begin
    ModifySQL.Text := 'update HISTPENDENCIA set IDHISTPENDENCIA = :IDHISTPENDENCIA, ' + #13 + #10
                    + ' IDPENDENCIA = :IDPENDENCIA, DATAHISTPENDENCIA = :DATAHISTPENDENCIA, ' + #13 + #10
                    + ' DESCHISTPENDENCIA = :DESCHISTPENDENCIA, SITUACAOPENDENCIA = :SITUACAOPENDENCIA, ' + #13 + #10
                    + ' VERSAOMODULO = :VERSAOMODULO, DATAINICIOPREV = :DATAINICIOPREV, ' + #13 + #10
                    + ' DATAINICIOEFET = :DATAINICIOEFET, DATATERMINOPREV = :DATATERMINOPREV, ' + #13 + #10
                    + ' DATATERMINOEFET = :DATATERMINOEFET, IDUSUARIO = :IDUSUARIO ' + #13 + #10
                    + ' where IDHISTPENDENCIA = :OLD_IDHISTPENDENCIA ';
    InsertSQL.Text := 'insert into HISTPENDENCIA ' + #13 + #10
                    + '  (IDHISTPENDENCIA, IDPENDENCIA, DATAHISTPENDENCIA, ' + #13 + #10
                    + ' DESCHISTPENDENCIA, SITUACAOPENDENCIA, VERSAOMODULO, DATAINICIOPREV,  '
                    + ' DATAINICIOEFET, DATATERMINOPREV, DATATERMINOEFET, IDUSUARIO) ' + #13 + #10
                    + ' values (:IDHISTPENDENCIA, :IDPENDENCIA, :DATAHISTPENDENCIA,  ' + #13 + #10
                    + ' :DESCHISTPENDENCIA, :SITUACAOPENDENCIA, :VERSAOMODULO, '
                    + ' :DATAINICIOPREV, :DATAINICIOEFET, :DATATERMINOPREV, :DATATERMINOEFET, :IDUSUARIO)';
    DeleteSQL.Text := 'delete from HISTPENDENCIA where IDHISTPENDENCIA = :OLD_IDHISTPENDENCIA';
  end;
end;

function THistPendencia.GetDataHistPendencia: TDateTime;
begin
  Result := qryDetail.FieldByName('DATAHISTPENDENCIA').AsDateTime;
end;

function THistPendencia.GetDataInicioEfet: TDateTime;
begin
  Result := qryDetail.FieldByName('DATAINICIOEFET').AsDateTime;
end;

function THistPendencia.GetDataInicioPrev: TDateTime;
begin
  Result := qryDetail.FieldByName('DATAINICIOPREV').AsDateTime;
end;

function THistPendencia.GetDataTerminoEfet: TDateTime;
begin
  Result := qryDetail.FieldByName('DATATERMINOEFET').AsDateTime;
end;

function THistPendencia.GetDataTerminoPrev: TDateTime;
begin
  Result := qryDetail.FieldByName('DATATERMINOPREV').AsDateTime;
end;

function THistPendencia.GetDescHistPendencia: string;
begin
  Result := qryDetail.FieldByName('DESCHISTPENDENCIA').AsString;
end;

function THistPendencia.GetIdHistPendencia: Double;
begin
  Result := qryDetail.FieldByName('IDHISTPENDENCIA').AsFloat;
end;

function THistPendencia.GetIdusuario: double;
begin
  Result := qryDetail.FieldByName('IDUSUARIO').asfloat;
end;

function THistPendencia.GetSituacaoPendencia: TSituacaoPendencia;
begin
  Result := TSituacaoPendencia(qryDetail.FieldByName('SITUACAOPENDENCIA').AsInteger);
end;

function THistPendencia.GetVersaoModulo: string;
begin
  Result := qryDetail.FieldByName('VERSAOMODULO').AsString;
end;

procedure THistPendencia.SetDataHistPendencia(const Value: TDateTime);
begin
  qryDetail.FieldByName('DATAHISTPENDENCIA').AsDateTime := Value;
end;

procedure THistPendencia.SetDataInicioEfet(const Value: TDateTime);
begin
  if (TCMPendencia(Owner).SituacaoPendencia in [spDesenvolvimento, spHomologacao]) then
    qryDetail.FieldByName('DATAINICIOEFET').AsDateTime := Value;
end;

procedure THistPendencia.SetDataTerminoEfet(const Value: TDateTime);
begin
  if (TCMPendencia(Owner).SituacaoPendencia in [spDesenvolvimento, spHomologacao]) then
    qryDetail.FieldByName('DATATERMINOEFET').AsDateTime := Value;
end;

procedure THistPendencia.SetDescHistPendencia(const Value: string);
begin
  qryDetail.FieldByName('DESCHISTPENDENCIA').AsString := Value;
end;

procedure THistPendencia.SetIdusuario(const Value: double);
begin
  qryDetail.FieldByName('IDUSUARIO').asfloat := Value;
end;

procedure THistPendencia.SetSituacaoPendencia(
  const Value: TSituacaoPendencia);
begin
  qryDetail.FieldByName('SITUACAOPENDENCIA').AsInteger := Integer(Value);
end;

procedure THistPendencia.SetVersaoModulo(const Value: string);
begin
  qryDetail.FieldByName('VERSAOMODULO').AsString := Value;
end;

end.
