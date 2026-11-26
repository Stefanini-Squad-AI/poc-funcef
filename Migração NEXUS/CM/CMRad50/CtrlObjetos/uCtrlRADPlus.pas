{------------------------------------------------------------------------------
  Autor     : Antonio Marcos (amf)
  Data      : 17.10.2007
  Pendência : 26538
  Descrição : Permite que o valor do processo seja exibido como zero, caso seja nulo.
------------------------------------------------------------------------------
  Autor     : Antonio Marcos (amf)
  Data      : 11.10.2007
  Pendência : 26285
  Descrição : Corrige o bug gerado após a inclusão do centro de responsabilidade na interface
              do frame de condições para o tipo de processo - Solicitação de Destacamento de Viagem.
------------------------------------------------------------------------------
  Autor     : Antonio Marcos (amf)
  Data      : 30.08.2007
  Pendência : 26255
  Descrição : Alterado para evitar erro de Union. Faltou adicionar duas colunas no
              select da 2ª Union da function ConsultaProcessos.
------------------------------------------------------------------------------
  Autor     : Antonio Marcos (amf)
  Data      : 23.05.2007
  Pendência : 25420 - VALIA
  Descrição : Implementada a referência para o Sistema de Cotas Patrimoniais
------------------------------------------------------------------------------
  Autor     : Antonio Marcos (amf)
  Data      : 22.05.2007
  Pendência : 25280 - VALIA
  Descrição : Implementada verificação da situação atual do processo para evitar
              que o usuário opere um processo cuja realidade foi modificada por
              outro usuário.
-------------------------------------------------------------------------------}

unit uCtrlRADPlus;

interface

uses Classes, SysUtils, uCmControlObject, uCmTypes, uCMClientDataset,
     uRADDataHora, JCLStrings, uFuncaoGeral, uCtrlRadTipoProc,
     JCLSysUtils, JclMapi, uCtrlMensagemCM, DBClient, IdSMTP, IdMessage,
     uDiasUteis;

//amf 18.05.2007
const
   PROCESSOMODIFICADO          = 'Ação cancelada. Este processo RAD foi modificado por outro usuário.';
   ERROCONSULTAETAPAMAISATUAL  = 'Não foi possível definir a última etapa mais atual do processo';

type

  //Filtros de consulta ao RAD
  TFiltroProcesso = (fpComecaCom, fpIgual, fpPossuiTexto, fpMaiorQue, fpMaiorIgualQue, fpMenorQue,
                     fpMenorIgualQue, fpDiferente, fpSemFiltro);

  //Tipos dos filtros da consulta ao RAD
  TTipoFiltro = (tfNumero, tfData, tfTexto);

  //Filtro de etapa
  TFiltroEtapa = (tfeUltima, tfeQualquer, tfeSemFiltro);

  //Situção da etapa
  TSituacaoEtapa = (stAtraso, stEmDia, stSubstituto, stTerceiros);

  //Estrutura de mensagem a ser enviada
  TRADMensagem = record
    iDestinatarioCM    : integer;
    sDestinatarioEMail : string;
    sAssunto           : string;
    sMensagem          : string;
  end;

  TCtrlRADPlus = class( TCmControlObject )
  private

    //Parâmetros do RAD
    sSMTPSERVER      : string;
    sNOMEEXIBICAO    : string;
    sUSERNAME        : string;
    sPASSWORD        : string;
    bFLGAUTENTIC     : boolean;
    iPORTA           : integer;
    bFLGENVIAEMAIL   : boolean;
    bFLGENVIACM      : boolean;
    iIDREMETENTE     : integer;
    sNOMEREMETENTE   : string;
    bFLG24H          : boolean;
    sHORAINIEXP      : string;
    sHORAFIMEXP      : string;

    //Componente de envio de e-mail
    IdSMTP           : TIdSMTP;

    //Array de mensagens a ser enviadas na operação atual
    aRADMensagens : array of TRADMensagem;

    _DiasUteis : TDiasUteis;

    _CtrlMensagemCM : TCtrlMensagemCM;
    cdsMensagem : TClientDataset;

    FIdEventoGerador: Integer;
    FTipoProcesso: Integer;
    FIdEmpresa: Integer;
    FIdUsuario: Integer;
    FObs: String;
    FVlrProc: extended;
    FCodTipDoc: integer;
    FUnidNegoc: integer;
    FCodCentroCusto: String;
    FCodCentroRespon: String;
    FCodGrupoProd: String;
    FProcessoModificado: boolean;
    procedure SetIdEmpresa(const Value: Integer);
    procedure SetIdUsuario(const Value: Integer);
    procedure SetObs(const Value: String);
    procedure SetTipoProcesso(const Value: Integer);
    procedure SetIdEventoGerador(const Value: Integer);
    procedure SetCodCentroCusto(const Value: String);
    procedure SetCodCentroRespon(const Value: String);
    procedure SetCodGrupoProd(const Value: String);
    procedure SetCodTipDoc(const Value: integer);
    procedure SetUnidNegoc(const Value: integer);
    procedure SetVlrProc(const Value: extended);

    //Grava log de debug
    procedure RADDebug( _str : string );

    //Converte um número em uma tsring compatível com o Oracle
    function RadOraNumero(rNumero : Double ):string;

    //Verifica qual é a próxima etapa a ser criada
    function VerificaProximaEtapa( iIdRadTipoProc, iIdProcesso, iNumEtapa : integer; var sMsgErro : string ) : integer;

    //Aprova o processo
    function AprovaProcesso( iIdProcesso : integer ) : boolean;

    //Recusa o processo
    function RecusaProcesso( iIdProcesso : integer ) : boolean;

    {Avança uma etapa.
    Obs.1: Verifica se deve criar outra etapa, retornando o ID desta nova
           etapa, ou finaliza o processo, retornando -1.
    Obs.2: Se não houver etapa para avançar, gera um erro.}
    function AvancaEtapa( iIdRadTipoProc, iIdProcesso, iNumEtapa : integer ) : boolean;

    //Insere uma nova etapa
    function InsereEtapa( iIdRadEtapa, iIdProcesso : integer ) : boolean;

    //Envia uma mensagem via e-mail e/ou CorreioCM
    function EnviaMensagemCM( iIdUsuarioRemetente, iIdUsuarioDestinatario : integer;
                              sNomeDestinatario, sAssunto, sMensagem : string ) : boolean;

    //Envia mensagens pendentes
    procedure EnviaMensagens;

    //Envia um e-mail para um destinatário
    procedure EnviaEMail( sDestinatario, sAssunto, sMensagem : string );

    //Recupera configurações do RAD
    procedure RecuperaConfigRAD;

    //Limpa todas as mensagens pendentes de envio
    procedure LimpaMensagensRAD;

    //Inclui uma mensagem na lista de pendentes
    procedure IncluiMensagemRAD( iDestinatarioCM    : integer;
                                 sDestinatarioEMail : string;
                                 sAssunto            : string;
                                 sMensagem           : string );

    //Recupera o endereço de e-mail de uma pessoa
    function RecuperaEnderecoEMail( iIdPessoa : integer ) : string;

    //Substitui as tags passadas como parâmetro por seus conteúdos
    function SubstituiTags( strTxt : string; aTags, aConteudos : array of string ) : string;

    //Traduz o tipo do filtro para um operador relacional
    function TraduzFiltro( FiltroProcesso : TFiltroProcesso; sTexto : string;
             TipoFiltro : TTipoFiltro; FiltroEtapa: TFiltroEtapa = tfeSemFiltro) : string;
  protected

    procedure AfterInitialize; Override;

  public

    //Tipo de Processo
    property TipoProcesso    : Integer read FTipoProcesso write SetTipoProcesso;

    //Evento Gerador
    property IdEventoGerador : Integer read FIdEventoGerador write SetIdEventoGerador;

    //Empresa
    property IdEmpresa       : Integer read FIdEmpresa write SetIdEmpresa;

    //Usuário
    property IdUsuario       : Integer read FIdUsuario write SetIdUsuario;

    //Observação
    property Obs             : String read FObs write SetObs;

    //Centro de Custo
    property CodCentroCusto  : String read FCodCentroCusto write SetCodCentroCusto;

    //Centro de Responsabilidade
    property CodCentroRespon : String read FCodCentroRespon write SetCodCentroRespon;

    //Grupo de Produtos
    property CodGrupoProd    : String read FCodGrupoProd write SetCodGrupoProd;

    //Atividade / Projeto
    property UnidNegoc       : integer read FUnidNegoc write SetUnidNegoc;

    //Tipo de Documento
    property CodTipDoc       : integer read FCodTipDoc write SetCodTipDoc;

    //Valor
    property VlrProc         : extended read FVlrProc write SetVlrProc;

    //Construtor
    constructor Create; override;


    //Destrutor
    destructor Destroy; override;


    //Inicializa o RAD
    procedure InicializaPropriedades;


    //Recupera o ID de um tipo de processo pelo evento gerador
    Function RecuperaTipoProcesso( iIdEventoGerador : Integer;
                                   iIdEmpresa       : Integer ) : Integer;


    //Recupera o evento gerador de um tipo de processo
    Function RecuperaEventoGerador( iIdRadTipoProc  : Integer;
                                    iIdEmpresa      : Integer ) : Integer;


    //Exclui um processo
    function ExcluirProcesso( iIdProcesso: integer; bInTransaction : boolean = False ) : Boolean;


    //Indica se já existe uma etapa aprovada ou excluída para um determinado processo
    function ExisteAprovacaoNoProcesso( iIdProcesso : integer ) : boolean;

    //Gera um novo processo RAD
    //O parâmetro indica se já há uma transação em andamento
    function IniciarProcesso( bInTransaction : boolean = False ) : integer;

    //Indica se o o processo já esta concluído (FLGOK = 'S')
    function ProcessoConcluido( iIdProcesso : integer ) : Boolean;

    //Retorna a situação do processo
    function SituacaoProcesso( iIdProcesso : integer ) : string;

    //Retorna a versão do RAD (nulo = não utiliza RAD)
    function RecuperaVersaoRAD( iIdEmpresa : integer = 0 ) : string;

    {Aprova etapa e, caso a quantidade de aprovações necessárias seja atingida,
     gera uma nova etapa.}
    function AprovaEtapa( iIdProcesso, iIdRadEtapaProc, iIdUsuario : integer;
     sObs : string; bFlgRessalva : boolean; bInTransaction : boolean = False ) : boolean;

    {Recusa etapa e, consequentemente, o processo.}
    function RecusaEtapa( iIdProcesso, iIdRadEtapaProc, iIdUsuario : integer;
     sObs : string; bInTransaction : boolean = False ) : boolean;

    //Retorna as etapas válidas de um processo
    function EtapasValidasDeProcessos( aIdProcesso : array of Integer ) : OLEVariant;

    //Volta etapa.
    function VoltaEtapa( iIdProcesso, iIdRadEtapaProc, iIdUsuario : integer;
     sObs : string; bInTransaction : boolean = False ) : boolean;

    { Consulta geral do RAD.
      Parâmetros de consulta: ft - Filtro; u - valor de entrada }
    function ConsultaProcessos( const iIdUsuario   : integer;
                                var iQtde          : integer;
                                var iQtdeTerceiros : integer;
                                bEmAtraso          : boolean = True  ;
                                bEmDia             : boolean = True  ;
                                bTerceiros         : boolean = True  ;
                                bSubstituicao      : boolean = False ;
                                ftProcesso         : TFiltroProcesso = fpSemFiltro;
                                uProcesso          : string = '0';
                                ftTipoProcesso     : TFiltroProcesso = fpSemFiltro;
                                uTipoProcesso      : string = '';
                                ftUsuarioSolic     : TFiltroProcesso = fpSemFiltro;
                                uUsuarioSolic      : string = '';
                                ftUsuarioAprov     : TFiltroProcesso = fpIgual;
                                uUsuarioAprov      : string = '';
                                fteUsuarioAprov    : TFiltroEtapa    = tfeSemFiltro;
                                ftDataIniProcesso  : TFiltroProcesso = fpSemFiltro;
                                uDataIniProcesso   : string = '';
                                ftDataFimProcesso  : TFiltroProcesso = fpSemFiltro;
                                uDataFimProcesso   : string = '';
                                ftSituProcesso     : TFiltroProcesso = fpIgual;
                                uSituProcesso      : string = 'N'; //valor default => pendente = EmAberto
                                ftValor            : TFiltroProcesso = fpSemFiltro;
                                uValor             : string = '0';
                                ftCentroCusto      : TFiltroProcesso = fpSemFiltro;
                                uCentroCusto       : string = '';
                                ftCentroRespon     : TFiltroProcesso = fpSemFiltro;
                                uCentroRespon      : string = '';
                                ftGrupoProduto     : TFiltroProcesso = fpSemFiltro;
                                uGrupoProduto      : string = '';
                                ftAtividadeProjeto : TFiltroProcesso = fpSemFiltro;
                                uAtividadeProjeto  : string = '';
                                ftTipoDoc          : TFiltroProcesso = fpSemFiltro;
                                uTipoDoc           : string = '';
                                ftGrupoAprov       : TFiltroProcesso = fpSemFiltro;
                                uGrupoAprov        : string = '';
                                fteGrupoAprov      : TFiltroEtapa    = tfeSemFiltro;
                                uRessalva          : string = '0';
                                fteRessalva        : TFiltroEtapa    = tfeSemFiltro;
                                bModoConsulta      : boolean = False ) : OLEVariant;

    //amf 18.05.2007 25280 - Retorna True se houve alguma mudança no contexto do processo.
    function ProcessoRADModificado(olvprocrad: OleVariant): boolean;
    function BuscaDadosDaEtapaAtual(iidradetapaproc, iidprocesso: integer): OleVariant;



  end;

implementation

{ TCtrlRADPlus }



constructor TCtrlRADPlus.Create;
begin
  inherited;
  InicializaPropriedades;

  _CtrlMensagemCM := TCtrlMensagemCM.Create;

  _DiasUteis := TDiasUteis.Create;

  IdSMTP := TIdSMTP.Create( nil );

end;

function TCtrlRADPlus.AprovaProcesso( iIdProcesso : integer ) : boolean;
begin
  Result := ExecSQL( ' update RADINSTPROCESSO                               ' +
                     ' set    FLGOK           = ''S''   ,                   ' +
                     '        DATAFIMPROCESSO = sysdate                     ' +
                     ' where  IDPROCESSO      = ' + IntToStr( iIdProcesso ) ) ;
end;

procedure TCtrlRADPlus.InicializaPropriedades;
begin
  FIdEventoGerador := 0;
  FTipoProcesso    := 0;
  FIdEmpresa       := 0;
  FIdUsuario       := 0;
  FObs             := '';
  FCodCentroCusto  := '';
  FCodCentroRespon := '';
  FCodGrupoProd    := '';
  FUnidNegoc       := 0;
  FCodTipDoc       := 0;
  FVlrProc         := 0;
end;


function TCtrlRADPlus.IniciarProcesso( bInTransaction : boolean ) : integer;
var
  cdsRADTipoProcesso : TCMClientDataset;
  i, iIdProcesso : integer;
  sDataFimPrev,
  sPrazoEstimado : string;
  sSQL1, sSQL2 : string;
  dNow, dDataCont, dUltData, dDataFim : TDateTime;
  iQtdeMinutos : integer;
  sAux : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.IniciarProcesso( bInTransaction );
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin

    RADDebug( '==========> Iníciou processo.' );

    Result := 0;

    dNow := Now;

    cdsRADTipoProcesso := TCMClientDataset.Create( nil );
    try

      try

        //Inicia a transação
        if not bInTransaction then
          StartTransaction;

        RADDebug( 'Verificando tipo de processo...' );

        if FIdEventoGerador > 0 then
        begin
          cdsRADTipoProcesso.Data := GetDataPacket(
           ' select * from RADTIPOPROC where FLGATIVO = 1 and IDREFERENCIA = ' + IntToStr( FIdEventoGerador ) );

          if cdsRADTipoProcesso.IsEmpty then
            raise Exception.Create( 'Não há tipo de processo cadastrado para este evento.' );

          FTipoProcesso := cdsRADTipoProcesso.FieldByName('IDRADTIPOPROC').AsInteger;
        end
        else
        begin
          cdsRADTipoProcesso.Data := GetDataPacket(
           ' select * from RADTIPOPROC where FLGATIVO = 1 and IDRADTIPOPROC = ' + IntToStr( FTipoProcesso ) );

          if cdsRADTipoProcesso.IsEmpty then
            raise Exception.Create( 'Tipo de processo não identificado.' );

          FIdEventoGerador := cdsRADTipoProcesso.FieldByName('IDREFERENCIA').AsInteger;
        end;

        RADDebug( 'Calculando prazo estimado do processo' );

        //Cálculo do prazo estimado
        sPrazoEstimado := trim( cdsRADTipoProcesso.FieldByName('PRAZOESTIMADO').AsString );
        if ( sPrazoEstimado <> '' ) and ( sPrazoEstimado <> ':' ) then
        begin
          iQtdeMinutos := HoraParaMinutos( sPrazoEstimado );

          if bFLG24H then     //Se for dia de 24h, 7 dias por semana...
            dDataFim := SomaMinutos( dNow, iQtdeMinutos )
          else
          begin               //Senão, conta dia a dia

            dDataCont := dNow;
            dUltData := 0;
            for i := 1 to iQtdeMinutos do
            begin
              //Acrescenta 1 minuto à hora
              dDataCont := dDataCont + cMinuto;

              sAux := FormatDateTime( 'dd/mm/yyyy hh:nn', dDataCont );

              //Se é antes do horário de expediente...
              if  FormatDateTime( 'hhnn', dDataCont ) < StringReplace( sHORAINIEXP, ':', '', [] ) then
              begin
                //Posiciona no início do expediente
                dDataCont := StrToDateTime( FormatDateTime( 'dd/mm/yyyy', dDataCont ) + ' ' + sHORAINIEXP ) + cMinuto;
              end
              else
              begin
                //Se é depois do horário de expediente
                if FormatDateTime( 'hhnn', dDataCont ) > StringReplace( sHORAFIMEXP, ':', '', [] ) then
                begin
                  dDataCont := dDataCont + 1;
                  dDataCont := StrToDateTime( FormatDateTime( 'dd/mm/yyyy', dDataCont ) + ' ' + sHORAINIEXP ) + cMinuto;

                  sAux := FormatDateTime( 'dd/mm/yyyy hh:nn', dDataCont );

                  //Se mudou a data...
                  if trunc( dDataCont ) <> trunc( dUltData ) then
                    //Enquanto não for dia útil, adia o fim
                    while not _DiasUteis.DiaUtil( IdEmpresa, dDataCont, False, True, False ) do
                      dDataCont := dDataCont + 1;

                  sAux := FormatDateTime( 'dd/mm/yyyy hh:nn', dDataCont );

                end;
              end;

              dUltData := dDataCont;

            end;

            dDataFim := dDataCont;
          end;

          sDataFimPrev := 'to_date( ' + QuotedStr( FormatDateTime(
           'dd/mm/yyyy hh:nn', dDataFim  ) ) + ', ''dd/mm/yyyy hh24:mi'' ) ';
        end
        else
          sDataFimPrev := 'null';

        //Recupera o próximo IDPROCESSO
        iIdProcesso := GetSequence( 'RADINSTPROCESSO' );

        sSQL1 := '';
        sSQL2 := '';

        //----- Início do preenchimento dos campos "estrangeiros"

        RADDebug( 'Preenchimento dos campos "estrangeiros"' );

        if RADReferencia( FIdEventoGerador, rrSolicCompra ) or
           RADReferencia( FIdEventoGerador, rrReqMaterial ) or
           RADReferencia( FIdEventoGerador, rrDestacaViagem ) or
           ( FIdEventoGerador = 0                         ) then
        begin
          if trim( FCodCentroCusto ) <> '' then
          begin
            sSQL1 := sSQL1 + ' CODCENTROCUSTO, ';
            sSQL2 := sSQL2 + QuotedStr( FCodCentroCusto ) + ', ';
          end;
        end;


        if RADReferencia( FIdEventoGerador, rrSolicCompra ) or
           RADReferencia( FIdEventoGerador, rrDoc         ) or
           RADReferencia( FIdEventoGerador, rrDestacaViagem ) or           
           ( FIdEventoGerador = 0                         ) then
        begin
          if trim( FCodCentroRespon ) <> '' then
          begin
            sSQL1 := sSQL1 + ' CODCENTRORESPON, ';
            sSQL2 := sSQL2 + QuotedStr( FCodCentroRespon ) + ', ';
          end;
        end;


        if RADReferencia( FIdEventoGerador, rrSolicCompra ) or
           RADReferencia( FIdEventoGerador, rrOrdemCompra ) or
           RADReferencia( FIdEventoGerador, rrCotacao     ) or
           RADReferencia( FIdEventoGerador, rrReqMaterial ) or
           ( FIdEventoGerador = 0                         ) then
        begin
          if trim( FCodGrupoProd ) <> '' then
          begin
            sSQL1 := sSQL1 + ' CODGRUPOPROD, ';
            sSQL2 := sSQL2 + QuotedStr( FCodGrupoProd ) + ', ';
          end;
        end;


        if RADReferencia( FIdEventoGerador, rrSolicCompra ) or
           RADReferencia( FIdEventoGerador, rrReqMaterial ) or
           ( FIdEventoGerador = 0                         ) then
        begin
          if FUnidNegoc > 0 then
          begin
            sSQL1 := sSQL1 + ' UNIDNEGOC, ';
            sSQL2 := sSQL2 + RadOraNumero( FUnidNegoc ) + ', ';
          end;
        end;


        if RADReferencia( FIdEventoGerador, rrDoc         ) or
           ( FIdEventoGerador = 0                         ) then
        begin
          if FCodTipDoc > 0 then
          begin
            sSQL1 := sSQL1 + ' CODTIPDOC, ';
            sSQL2 := sSQL2 + RadOraNumero( FCodTipDoc ) + ', ';
          end;
        end;


        if RADReferencia( FIdEventoGerador, rrSolicCompra ) or
           RADReferencia( FIdEventoGerador, rrDoc         ) or
           RADReferencia( FIdEventoGerador, rrOrdemCompra ) or
           RADReferencia( FIdEventoGerador, rrPagtoLote   ) or
           RADReferencia( FIdEventoGerador, rrReqMaterial ) or
           RADReferencia( FIdEventoGerador, rrDestacaViagem ) or
           RADReferencia( FIdEventoGerador, rrCotasPatrim ) or //amf 23.05.2007 25420
           ( FIdEventoGerador = 0                         ) then
        begin
          if FVlrProc <> 0 then
          begin
            sSQL1 := sSQL1 + ' VLRPROC, ';
            sSQL2 := sSQL2 + RadOraNumero( FVlrProc ) + ', ';
          end;
        end;

        //----- Fim do preenchimento dos campos "estrangeiros"

        RADDebug( 'Inserindo processo' );

        //Cria o processo
        if ExecSQL( ' insert into RADINSTPROCESSO   ( ' +
                    '             IDPROCESSO        , ' +
                    '             IDRADTIPOPROC     , ' +
                    '             IDEMPRESA         , ' +
                    '             IDUSUARIO         , ' +
                    '             FLGOK             , ' +
                    '             DATAINIPROCESSO   , ' +
                    '             DATAFIMPREV       , ' +
                    '             OBS               , ' +
                    sSQL1                               +
                    '             FLGVERSAORAD      ) ' +
                    ' values                        ( ' +
                    IntToStr( iIdProcesso   )   + ' , ' +
                    IntToStr( FTipoProcesso )   + ' , ' +
                    IntToStr( FIdEmpresa    )   + ' , ' +
                    IntToStr( FIdusuario    )   + ' , ' +
                    '''N''                          , ' +
                    'to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy hh:nn', dNow ) ) + ', ''dd/mm/yyyy hh24:mi'' ), ' +
                    sDataFimPrev                + ' , ' +
                    QuotedStr( FObs )           + ' , ' +
                    sSQL2                               +
                    '''+''                          ) ' ) then
        begin

          RADDebug( 'Avançando etapa...' );

          if AvancaEtapa( FTipoProcesso, iIdProcesso, 0 ) then
          begin

            //Commita a transação
            if not bInTransaction then
              Commit;

            RADDebug( 'Enviando mensagens...' );

            EnviaMensagens;

            Result := iIdProcesso;

            RADDebug( 'IdProcesso = ' + IntToStr( iIdProcesso ) );

          end;

        end;

        if MessageInfo <> '' then raise Exception.Create( MessageInfo );

      except
        On E : Exception Do
        begin
          Result := 0;
          if InTransaction then Rollback;
          exit;
        end;
      end;

    finally
      cdsRADTipoProcesso.Free;
    end

  end;
end;


function TCtrlRADPlus.RadOraNumero(rNumero: Double): string;
var
  sNumero : string;
  AuxDec      : char;
begin
  AuxDec           := DecimalSeparator;
  DecimalSeparator := '.';
  sNumero:= FloatToStr(rNumero);
  Result:=sNumero;
  DecimalSeparator:=AuxDec;
end;


procedure TCtrlRADPlus.SetCodCentroCusto(const Value: String);
begin
  FCodCentroCusto := Value;
end;

procedure TCtrlRADPlus.SetCodCentroRespon(const Value: String);
begin
  FCodCentroRespon := Value;
end;

procedure TCtrlRADPlus.SetCodGrupoProd(const Value: String);
begin
  FCodGrupoProd := Value;
end;

procedure TCtrlRADPlus.SetCodTipDoc(const Value: integer);
begin
  FCodTipDoc := Value;
end;

procedure TCtrlRADPlus.SetIdEmpresa(const Value: Integer);
begin
  FIdEmpresa := Value;
end;

procedure TCtrlRADPlus.SetIdEventoGerador(const Value: Integer);
begin
  FIdEventoGerador := Value;
end;

procedure TCtrlRADPlus.SetIdUsuario(const Value: Integer);
begin
  FIdUsuario := Value;
end;

procedure TCtrlRADPlus.SetObs(const Value: String);
begin
  //Garante que não será gerada observação com mais de 200 caracteres
  FObs := Copy( Value, 1, 200 );
end;

procedure TCtrlRADPlus.SetTipoProcesso(const Value: Integer);
begin
  FTipoProcesso := Value;
end;

procedure TCtrlRADPlus.SetUnidNegoc(const Value: integer);
begin
  FUnidNegoc := Value;
end;

procedure TCtrlRADPlus.SetVlrProc(const Value: extended);
begin
  FVlrProc := Value;
end;


function TCtrlRADPlus.AvancaEtapa( iIdRadTipoProc, iIdProcesso, iNumEtapa : integer ) : boolean;
var
  cdsEtapa     ,
  cdsEtapaProc : TCMClientDataset;
  iProxIdRadEtapa : integer;
  sMsgErro : string;
begin

  try
  
    cdsEtapa     := TCMClientDataset.Create( nil );
    cdsEtapaProc := TCMClientDataset.Create( nil );
    try
      Result := False;

      sMsgErro := '';

      //Verifica qual é a etapa a ser criada
      iProxIdRadEtapa := VerificaProximaEtapa( iIdRadTipoProc, iIdProcesso, iNumEtapa, sMsgErro );

      
      //Se houver mensagem de erro
      if sMsgErro <> '' then
      begin
        MessageInfo := sMsgErro;
        raise Exception.Create( sMsgErro );
      end;


      //Se é para finalizar o processo...
      if iProxIdRadEtapa = -1 then
      begin
        Result := AprovaProcesso( iIdProcesso );
        exit;
      end;


      //Criação da próxima etapa
      InsereEtapa( iProxIdRadEtapa, iIdProcesso );

      Result := True;

    finally
      cdsEtapa.Free;
      cdsEtapaProc.Free;
    end;

  except
    On E : Exception Do
    begin
      Result := False;
      if InTransaction then Rollback;
      exit;
    end;
  end;

end;


function TCtrlRADPlus.VerificaProximaEtapa(iIdRadTipoProc, iIdProcesso, iNumEtapa: integer; var sMsgErro : string ): integer;
var
  cdsEtapa,
  cdsEtapaCond : TCMClientDataset;
  bAtende : boolean;
  iEtapa, iElse : integer;
begin
  cdsEtapa     := TCMClientDataset.Create( nil );
  cdsEtapaCond := TCMClientDataset.Create( nil );
  try

    RADDebug( '==========> Início de definição da próxima etapa. <==========' );

    sMsgErro := '';

    cdsEtapa.Data := GetDataPacket(
     ' select   *                                            ' +
     ' from     RADETAPA                                     ' +
     ' where    IDRADTIPOPROC = ' + IntToStr( iIdRadTipoProc ) +
     ' order by NUMERO                                       ' );

    //Variável que armazenará o valor da etapa a ser executada
    Result := -1;

    //Garante que as etapas estão cadastradas
    if cdsEtapa.IsEmpty then
    begin
      sMsgErro := 'Não foi possível recuperar as etapas do processo.';
      exit;
    end;

    //Localiza a etapa atual
    if not cdsEtapa.Locate( 'NUMERO', iNumetapa, [] ) then
    begin
      sMsgErro := 'Não foi possível identificar a atual etapa de aprovação. ' +
       'Favor contactar o responsável pelo sistema.';
      exit;
    end;


    //Verificação da ação na aprovação

    RADDebug( 'Etapa atual: ' + cdsEtapa.FieldByName('NUMERO').AsString );

    //Se é para ir para a próxima etapa...
    if cdsEtapa.FieldByName('FLGACAOAPROVA').AsInteger = 1 then
    begin

      RADDebug( 'Ação: vai para a próxima etapa' );

      cdsEtapa.Next;

      if cdsEtapa.Eof then
        exit;

      Result := cdsEtapa.FieldByName('IDRADETAPA').AsInteger;
      exit;
    end;


    //Se é para ir para a etapa "n"...
    if cdsEtapa.FieldByName('FLGACAOAPROVA').AsInteger = 2 then
    begin

      RADDebug( 'Ação: vai para a etapa ' + cdsEtapa.FieldByName('NUMETAPADEST').AsString );

      iEtapa := cdsEtapa.FieldByName('NUMETAPADEST').AsInteger; 

      cdsEtapa.First;
      
      if not cdsEtapa.Locate( 'NUMERO', iEtapa, [] ) then
      begin
        sMsgErro := 'Não foi possível encontrar a próxima etapa de aprovação. ' +
         'Favor contactar o responsável pelo sistema.';
        exit;
      end;

      Result := cdsEtapa.FieldByName('IDRADETAPA').AsInteger;
      exit;
    end;


    //Se é para finalizar o processo
    if cdsEtapa.FieldByName('FLGACAOAPROVA').AsInteger = 3 then
    begin
      RADDebug( 'Ação: finaliza o processo' );
      exit;
    end;


    //Se é para avançar etapa ou aprovar processo conforme condições
    if cdsEtapa.FieldByName('FLGACAOAPROVA').AsInteger = 4 then
    begin

      RADDebug( 'Ação: avança conforme condições' );
      RADDebug( ' - Dados do processo: ' );
      RADDebug( '   Centro de Custo            = ' + FCodCentroCusto          );
      RADDebug( '   Centro de responsabilidade = ' + FCodCentroRespon         );
      RADDebug( '   Grupo de produtos          = ' + FCodGrupoProd            );
      RADDebug( '   Unidade de negócios        = ' + FloatToStr( FUnidNegoc ) );
      RADDebug( '   Tipo de documento          = ' + FloatToStr( FCodTipDoc ) );
      RADDebug( '   Valor                      = ' + FloatToStr( FVlrProc   ) );

      //Recupera todas as condições
      cdsEtapaCond.Data := GetDataPacket(
       ' select   *            ' +
       ' from     RADETAPACOND ' +
       ' where    IDRADETAPA = ' + cdsEtapa.FieldByName('IDRADETAPA').AsString +
       ' order by ORDEM        ' );


      //Testa cada condição, e pára quando uma for atendida (o "case")
      cdsEtapaCond.First;
      while not cdsEtapaCond.Eof do
      begin

        RADDebug( ' - Dados da ' + IntToStr( cdsEtapaCond.RecNo ) + 'a. condição' );
        RADDebug( '   Centro de Custo            = ' + cdsEtapaCond.FieldByName('CODCENTROCUSTO').AsString  );
        RADDebug( '   Centro de responsabilidade = ' + cdsEtapaCond.FieldByName('CODCENTRORESPON').AsString );
        RADDebug( '   Grupo de produtos          = ' + cdsEtapaCond.FieldByName('CODGRUPOPROD').AsString    );
        RADDebug( '   Unidade de negócios        = ' + cdsEtapaCond.FieldByName('UNIDNEGOC').AsString       );
        RADDebug( '   Tipo de documento          = ' + cdsEtapaCond.FieldByName('CODTIPDOC').AsString       );
        RADDebug( '   Valor inicial              = ' + cdsEtapaCond.FieldByName('VLRINICIAL').AsString      );
        RADDebug( '   Valor final                = ' + cdsEtapaCond.FieldByName('VLRFINAL').AsString        );

        //Testa os eventos geradores que não possuem condição
        bAtende := True;

        if bAtende then
        begin

          //Testa o centro de custo
          if RADReferencia( FIdEventoGerador, rrSolicCompra ) or
           RADReferencia( FIdEventoGerador, rrDestacaViagem ) or
             ( FIdEventoGerador = 0                         ) then
          begin
            bAtende := cdsEtapaCond.FieldByName('CODCENTROCUSTO').IsNull or
                       ( trim( FCodCentroCusto ) = trim( cdsEtapaCond.FieldByName('CODCENTROCUSTO').AsString ) );
          end;

          if bAtende then
          begin

            //Testa o centro de responsabilidade
            if RADReferencia( FIdEventoGerador, rrSolicCompra ) or
               RADReferencia( FIdEventoGerador, rrDoc         ) or
               //amf 26285 11.10.2007 - Corrige a falha de condição que ocorreu após a inclusão do centro de responsabilidade no frame de destacamento de viagem.
               RADReferencia( FIdEventoGerador, rrDestacaViagem) or
               ( FIdEventoGerador = 0                         ) then
            begin
              bAtende := cdsEtapaCond.FieldByName('CODCENTRORESPON').IsNull or
                         ( trim( FCodCentroRespon ) = trim( cdsEtapaCond.FieldByName('CODCENTRORESPON').AsString ) );
            end;


            if bAtende then
            begin

              //Testa o grupo de produtos
              if RADReferencia( FIdEventoGerador, rrSolicCompra ) or
                 RADReferencia( FIdEventoGerador, rrOrdemCompra ) or
                 RADReferencia( FIdEventoGerador, rrCotacao     ) or
                 ( FIdEventoGerador = 0                         ) then
              begin
                bAtende := cdsEtapaCond.FieldByName('CODGRUPOPROD').IsNull or
                           ( trim( FCodGrupoProd ) = trim( cdsEtapaCond.FieldByName('CODGRUPOPROD').AsString ) );
              end;


              if bAtende then
              begin

                //Testa a Atividade x Projeto
                if RADReferencia( FIdEventoGerador, rrSolicCompra ) or
                   ( FIdEventoGerador = 0                         ) then
                begin
                  bAtende := cdsEtapaCond.FieldByName('UNIDNEGOC').IsNull or
                             ( FUnidNegoc = cdsEtapaCond.FieldByName('UNIDNEGOC').AsInteger );
                end;


                if bAtende then
                begin

                  //Testa o tipo de documento
                  if RADReferencia( FIdEventoGerador, rrDoc         ) or
                     ( FIdEventoGerador = 0                         ) then
                  begin
                    bAtende := cdsEtapaCond.FieldByName('CODTIPDOC').IsNull or
                               ( FCodTipDoc = cdsEtapaCond.FieldByName('CODTIPDOC').AsInteger );
                  end;


                  if bAtende then
                  begin

                    //Testa o valor inicial
                    if RADReferencia( FIdEventoGerador, rrSolicCompra   ) or
                       RADReferencia( FIdEventoGerador, rrDoc           ) or
                       RADReferencia( FIdEventoGerador, rrOrdemCompra   ) or
                       RADReferencia( FIdEventoGerador, rrPagtoLote     ) or
                       RADReferencia( FIdEventoGerador, rrDestacaViagem ) or
                       RADReferencia( FIdEventoGerador, rrCotasPatrim ) or //amf 23.05.2007 25420
                       ( FIdEventoGerador = 0                           ) then
                    begin
                      bAtende := cdsEtapaCond.FieldByName('VLRINICIAL').IsNull or
                               ( FVlrProc >= cdsEtapaCond.FieldByName('VLRINICIAL').AsInteger );
                    end;


                    if bAtende then
                    begin

                      //Testa o valor final
                      if RADReferencia( FIdEventoGerador, rrSolicCompra   ) or
                         RADReferencia( FIdEventoGerador, rrDoc           ) or
                         RADReferencia( FIdEventoGerador, rrOrdemCompra   ) or
                         RADReferencia( FIdEventoGerador, rrPagtoLote     ) or
                         RADReferencia( FIdEventoGerador, rrDestacaViagem ) or
                         RADReferencia( FIdEventoGerador, rrCotasPatrim ) or //amf 23.05.2007 25420
                         ( FIdEventoGerador = 0                           ) then
                      begin
                        bAtende := cdsEtapaCond.FieldByName('VLRFINAL').IsNull or
                                   ( FVlrProc <= cdsEtapaCond.FieldByName('VLRFINAL').AsInteger );
                      end;

                    end;

                  end;
                
                end;

              end;

            end;

          end;

        end;

        if bAtende then
        begin
          cdsEtapa.First;

          RADDebug( 'Etapa destino: ' + cdsEtapaCond.FieldByName('NUMETAPADEST').AsString );

          if not cdsEtapa.Locate( 'NUMERO', cdsEtapaCond.FieldByName('NUMETAPADEST').AsInteger, [] ) then
          begin
            sMsgErro := 'Não foi possível encontrar a etapa de aprovação definida pelas condições deste processo. ' +
             'Favor contactar o responsável pelo sistema.';
            exit;
          end;

          Result := cdsEtapa.FieldByName('IDRADETAPA').AsInteger;

          RADDebug( '--> Término dos testes de condições' );

          exit;
        end;

        cdsEtapaCond.Next;
      end;

      //Se nenhuma das condições foi atendida... (o "else")

      RADDebug( '--> Nenhuma condição foi atendida' );

      //Finaliza o processo
      if cdsEtapa.FieldByName('FLGELSE').AsInteger = 1 then
      begin
        RADDebug( 'Finaliza processo' );
        exit;
      end
      else
      begin

        RADDebug( 'Vai para a etapa ' + cdsEtapa.FieldByName('NUMETAPAELSE').AsString );

        iElse := cdsEtapa.FieldByName('NUMETAPAELSE').AsInteger;

        //Vai para a etapa definida
        cdsEtapa.First;

        if not cdsEtapa.Locate( 'NUMERO', iElse, [] ) then
        begin
          sMsgErro := 'Não foi possível encontrar a etapa de aprovação por falta de condições deste processo. ' +
           'Favor contactar o responsável pelo sistema.';
          exit;
        end;

        Result := cdsEtapa.FieldByName('IDRADETAPA').AsInteger;
        exit;
        
      end;

    end;


  finally
    cdsEtapa.Free;
    cdsEtapaCond.Free;
  end;

end;

function TCtrlRADPlus.AprovaEtapa( iIdProcesso, iIdRadEtapaProc, iIdUsuario : integer;
 sObs : string; bFlgRessalva : boolean; bInTransaction : boolean = False ): boolean;
var
  cdsRadInstProcesso,
  cdsRadEtapa,
  cdsAux,
  cdsDestinatarios,
  cdsRadEtapaProc : TCMClientDataset;
  bOk : boolean;
  iQtdeAprovadas, iQtdeNecessaria : integer;
  iCMUsuario : integer;
  sTxtAux, sDestEmail : string;
begin

  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.AprovaEtapa( iIdProcesso, iIdRadEtapaProc,
     iIdUsuario, sObs, bFlgRessalva, bInTransaction );
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin

    try

      cdsRadInstProcesso := TCMClientDataset.Create( nil );
      cdsRadEtapa        := TCMClientDataset.Create( nil );
      cdsRadEtapaProc    := TCMClientDataset.Create( nil );
      cdsDestinatarios   := TCMClientDataset.Create( nil );
      cdsAux             := TCMClientDataset.Create( nil );
      try
        Result := False;

        //Inicia a transação
        if not bInTransaction then
          StartTransaction;

        //Limpa as mensagens do RAD
        LimpaMensagensRAD;

        //Insere a aprovação
        if ExecSQL( ' insert into RADETAPAPROCUSU     ' +
                    ' (           IDRADETAPAPROC     , ' +
                    '             IDUSUARIO          , ' +
                    '             DATAHORA           , ' +
                    '             FLGOK              , ' +
                    '             OBS                , ' +
                    '             FLGRESSALVA        ) ' +
                    ' values                         ( ' +
                    IntToStr( iIdRadEtapaProc )   + ', ' +
                    IntToStr( iIdUsuario )        + ', ' +
                    '             sysdate            , ' +
                    '             ''S''              , ' +
                    QuotedStr( sObs )             + ', ' +
                    iff( bFlgRessalva, '1', '0' ) + ') ' ) then
        begin
          bOk := True;

          //Conta quantas aprovações foram feitas para esta etapa
          cdsAux.Data := GetDataPacket( ' select count(*) as QTDE ' +
                                        ' from   RADETAPAPROCUSU  ' +
                                        ' where  IDRADETAPAPROC = ' + IntToStr( iIdRadEtapaProc ) );

          iQtdeAprovadas := cdsAux.FieldByName('QTDE').AsInteger;


          //Busca os dados da etapa aprovada
          cdsRadEtapaProc.Data := GetDataPacket(
           ' select *                ' +
           ' from   RADETAPAPROC     ' +
           ' where  IDRADETAPAPROC = ' + IntToStr( iIdRadEtapaProc ) );

          //Busca os dados do tipo da etapa aprovada
          cdsRadEtapa.Data := GetDataPacket(
           ' select *                ' +
           ' from   RADETAPA         ' +
           ' where  IDRADETAPA     = ' + cdsRadEtapaProc.FieldByName('IDRADETAPA').AsString );

          //Busca os destinatários da etapa aprovada
          cdsDestinatarios.Data := GetDataPacket(
           ' select r.IDPESSOA,             ' +
           '        p.NOME,                 ' +
           '        p.EMAIL                 ' +
           ' from   RADETAPADEST r,         ' +
           '        PESSOA       p          ' +
           ' where  r.IDPESSOA = p.IDPESSOA ' +
           '   and  r.IDRADETAPA = ' + cdsRadEtapa.FieldByName('IDRADETAPA').AsString );

          //Recupera a quantidade necessária de aprovações da etapa aprovada
          if cdsRadEtapa.FieldByName('FLGQTDEAUTORIZA').AsInteger = 1 then
            iQtdeNecessaria := cdsRadEtapa.FieldByName('QTDEAUTORIZA').AsInteger
          else
          begin
            cdsAux.Data := GetDataPacket(
             ' select count(*) as QTDE ' +
             ' from   RADRESPONXGRP    ' +
             ' where  IDGRPRESPON    = ' + cdsRadEtapa.FieldByName('IDGRPRESPON').AsString +
             '   and  nvl( FLGSUBSTITUTO, 0 ) = 0 ' );
            iQtdeNecessaria := cdsAux.FieldByName('QTDE').AsInteger;
          end;

          //Se atingiu a quantidade necessária de aprovações...
          if iQtdeAprovadas >= iQtdeNecessaria then
          begin

            //..recupera dados do processo,...
            cdsRadInstProcesso.Data := GetDataPacket(
             ' select r.IDPROCESSO                   ,            ' +
             '        r.IDEMPRESA                    ,            ' +
             '        r.FLGOK                        ,            ' +
             '        r.IDUSUARIO                    ,            ' +
             '        r.DATAINIPROCESSO              ,            ' +
             '        r.DATAFIMPROCESSO              ,            ' +
             '        r.DATAFIMPREV                  ,            ' +
             '        r.OBS                          ,            ' +
             '        r.IDRADTIPOPROC                ,            ' +
             '        r.CODCENTROCUSTO               ,            ' +
             '        r.FLGVERSAORAD                 ,            ' +
             '        r.CODCENTRORESPON              ,            ' +
             '        r.CODGRUPOPROD                 ,            ' +
             '        r.UNIDNEGOC                    ,            ' +
             '        r.CODTIPDOC                    ,            ' +
             '        r.VLRPROC                      ,            ' +
             '        rtp.NOME as NOMERAD            ,            ' +
             '        rtp.TXTAPROVAETAPA             ,            ' +
             '        rtp.TXTAPROVARADRES            ,            ' +
             '        p.NOME as NOMESOLIC            ,            ' +
             '        cr.NOME as NOMECENTRESPON      ,            ' +
             '        t.DESCRICAO as DESCRICAOTIPDOC ,            ' +
             '        cc.NOME as NOMECENTCUST        ,            ' +
             '        g.DESCGRUPOPROD                ,            ' +
             '        u.NOME as NOMEUNIDNEGOC                     ' +
             ' from   RADINSTPROCESSO r              ,            ' +
             '        RADTIPOPROC     rtp            ,            ' +
             '        PESSOA          p              ,            ' +
             '        CENTRESPON      cr             ,            ' +
             '        TIPODOCRECPAG   t              ,            ' +
             '        CENTCUST        cc             ,            ' +
             '        GRUPPROD        g              ,            ' +
             '        UNIDNEGOCIO     u                           ' +
             ' where  r.IDRADTIPOPROC   = rtp.IDRADTIPOPROC       ' +
             '   and  r.IDUSUARIO       = p.IDPESSOA              ' +
             '   and  r.CODCENTRORESPON = cr.CODCENTRORESPON (+)  ' +
             '   and  r.IDEMPRESA       = cr.IDPESSOA        (+)  ' +
             '   and  r.CODTIPDOC       = t.CODTIPDOC        (+)  ' +
             '   and  r.CODCENTROCUSTO  = cc.CODCENTROCUSTO  (+)  ' +
             '   and  r.IDEMPRESA       = cc.IDEMPRESA       (+)  ' +
             '   and  r.CODGRUPOPROD    = g.CODGRUPOPROD     (+)  ' +
             '   and  r.UNIDNEGOC       = u.UNIDNEGOC        (+)  ' +
             '   and  r.IDEMPRESA       = u.IDPESSOA         (+)  ' +
             '   and  r.IDPROCESSO    = ' + IntToStr( iIdProcesso ) );

            //..prepara as variáveis de avaliação do RAD,...
            FCodCentroCusto  := cdsRadInstProcesso.FieldByName('CODCENTROCUSTO').AsString;
            FCodCentroRespon := cdsRadInstProcesso.FieldByName('CODCENTRORESPON').AsString;
            FCodGrupoProd    := cdsRadInstProcesso.FieldByName('CODGRUPOPROD').AsString;
            FUnidNegoc       := cdsRadInstProcesso.FieldByName('UNIDNEGOC').AsInteger;
            FCodTipDoc       := cdsRadInstProcesso.FieldByName('CODTIPDOC').AsInteger;
            FVlrProc         := cdsRadInstProcesso.FieldByName('VLRPROC').AsFloat;

            //...marca a etapa como aprovada,...
            bOk := ExecSQL( ' update RADETAPAPROC                                   ' +
                            ' set    DATAFIMETAPA   = sysdate,                      ' +
                            '        FLGOK          = ''S''                         ' +
                            ' where  IDRADETAPAPROC = ' + IntToStr( iIdRadEtapaProc ) );

            if bOk then
              //...inclui a mensagem de aprovação para ser enviada...

              //------ Envio de mensagem de aprovação (INÍCIO) ------//

              //Se é para enviar aviso...
              if ( bFLGENVIAEMAIL or bFLGENVIACM ) and ( cdsRadEtapa.FieldByName('FLGAVISOS').AsInteger > 1 ) then
              begin

                //Verifica se há alguma ressalva nas aprovações da etepa
                cdsAux.Close;
                cdsAux.Data := GetDataPacket( ' select IDUSUARIO        ' +
                                              ' from   RADETAPAPROCUSU  ' +
                                              ' where  FLGRESSALVA = 1  ' +
                                              '   and  IDRADETAPAPROC = ' + IntToStr( iIdRadEtapaProc ) +
                                              IntToStr( iIdUsuario ) );

                //Define o texto da mensagem de aprovação, de acordo com a existência ou não de ressalvas
                if ( not cdsAux.IsEmpty ) or bFlgRessalva then
                  sTxtAux := cdsRadInstProcesso.FieldByName('TXTAPROVARADRES').AsString
                else
                  sTxtAux := cdsRadInstProcesso.FieldByName('TXTAPROVAETAPA').AsString;

                //Monta a mensagem para o solicitante e demais destinatários
                sTxtAux := SubstituiTags( sTxtAux              ,
                                          [ 'DESCRAD'          ,
                                            'DESCETAPA'        ,
                                            'NUMRAD'           ,
                                            'DATAHORAINIRAD'   ,
                                            'DATAHORAINIETAPA' ,
                                            'DATAHORAFIMRAD'   ,
                                            'DATAHORAFIMETAPA' ,
                                            'OBSRAD'           ,
                                            'VALOR'            ,
                                            'CODCENTROCUSTO'   ,
                                            'DESCCENTROCUSTO'  ,
                                            'CODCENTRORESPON'  ,
                                            'DESCCENTRORESPON' ,
                                            'GRUPOPROD'        ,
                                            'ATIVXPROJ'        ,
                                            'TIPODOC'          ],

                                          [ cdsRadInstProcesso.FieldByName('NOMERAD').AsString                                                 ,
                                            cdsRadEtapa.FieldByName('DESCRICAO').AsString                                                      ,
                                            cdsRadInstProcesso.FieldByName('IDPROCESSO').AsString                                              ,
                                            FormatDateTime( 'dd/mm/yyyy hh:nn', cdsRadInstProcesso.FieldByName('DATAINIPROCESSO').AsDateTime ) ,
                                            FormatDateTime( 'dd/mm/yyyy hh:nn', cdsRadEtapaProc.FieldByName('DATAINIETAPA').AsDateTime )       ,
                                            FormatDateTime( 'dd/mm/yyyy hh:nn', cdsRadInstProcesso.FieldByName('DATAFIMPROCESSO').AsDateTime ) ,
                                            FormatDateTime( 'dd/mm/yyyy hh:nn', Now )                                                          ,
                                            cdsRadInstProcesso.FieldByName('OBS').AsString                                                     ,
                                            FormatFloat( '#,##0.00', cdsRadInstProcesso.FieldByName('VLRPROC').AsFloat )                       ,
                                            cdsRadInstProcesso.FieldByName('CODCENTROCUSTO').AsString                                          ,
                                            cdsRadInstProcesso.FieldByName('NOMECENTCUST').AsString                                            ,
                                            cdsRadInstProcesso.FieldByName('CODCENTRORESPON').AsString                                         ,
                                            cdsRadInstProcesso.FieldByName('NOMECENTRESPON').AsString                                          ,
                                            cdsRadInstProcesso.FieldByName('DESCGRUPOPROD').AsString                                           ,
                                            cdsRadInstProcesso.FieldByName('NOMEUNIDNEGOC').AsString                                           ,
                                            cdsRadInstProcesso.FieldByName('DESCRICAOTIPDOC').AsString
                                          ] );

                //Se é para enviar aviso para o solicitante...
                if cdsRadEtapa.FieldByName('FLGAVISOSOLIC').AsInteger <> 0 then
                begin

                  sDestEmail := '';
                  iCMUsuario := -1;

                  //Se é para enviar e-mail
                  if bFLGENVIAEMAIL and ( cdsRadEtapa.FieldByName('FLGAVISOS').AsInteger in [ 2, 4 ] ) then
                    sDestEmail := RecuperaEnderecoEMail( cdsRadInstProcesso.FieldByName('IDUSUARIO').AsInteger );

                  //Se é para enviar pelo CMMail e há remetente cadastrado
                  if bFLGENVIACM and ( iIDREMETENTE > 0 ) and ( cdsRadEtapa.FieldByName('FLGAVISOS').AsInteger in [ 3, 4 ] ) then
                    iCMUsuario := cdsRadInstProcesso.FieldByName('IDUSUARIO').AsInteger;

                  if ( sDestEmail <> '' ) or ( iCMUsuario > 0 ) then
                    IncluiMensagemRAD( iCMUsuario, sDestEMail,
                     'Aviso de aprovação de etapa do processo RAD ' + IntToStr( iIdProcesso ),
                     SubstituiTags( sTxtAux, ['NOMEDEST'], [cdsRadInstProcesso.FieldByName('NOMESOLIC').AsString] ) );

                end;


                //Se houver outros destinatários de e-mail, envia-lhes e-mails
                cdsDestinatarios.First;
                while not cdsDestinatarios.Eof do
                begin
                  sDestEmail := '';
                  iCMUsuario := -1;

                  if bFLGENVIAEMAIL and ( cdsRadEtapa.FieldByName('FLGAVISOS').AsInteger in [ 2, 4 ] ) then
                    sDestEmail := trim( cdsDestinatarios.FieldByName('EMAIL').AsString );

                  if bFLGENVIACM and ( iIDREMETENTE > 0 ) and ( cdsRadEtapa.FieldByName('FLGAVISOS').AsInteger in [ 3, 4 ] ) then
                    iCMUsuario := cdsDestinatarios.FieldByname('IDPESSOA').AsInteger;

                  IncluiMensagemRAD( iCMUsuario,
                                     sDestEMail,
                                     'Aviso de aprovação de etapa do processo RAD ' + IntToStr( iIdProcesso ),
                                     SubstituiTags( sTxtAux, ['NOMEDEST'], [cdsDestinatarios.FieldByName('NOME').AsString] ) );

                  cdsDestinatarios.Next;
                end;

              end;


              //------ Envio de mensagem de aprovação (FIM) ------//


              //...e avança a etapa!
              bOk := AvancaEtapa( cdsRadEtapa.FieldByName('IDRADTIPOPROC').AsInteger,
                                  iIdProcesso, cdsRadEtapa.FieldByName('NUMERO').AsInteger );

          end;

          if bOk then
          begin
            //Commita a transação
            if not bInTransaction then
              Commit;

            EnviaMensagens;

            Result := True;
          end;             

        end;

        if MessageInfo <> '' then raise Exception.Create( MessageInfo );

      finally
        cdsRadInstProcesso.Free;
        cdsRadEtapa.Free;
        cdsRadEtapaProc.Free;
        cdsDestinatarios.Free;
        cdsAux.Free;
      end;

    except
      On E : Exception Do
      begin
        Result := False;
        if InTransaction then Rollback;
        exit;
      end;
    end;

  end;

end;


function TCtrlRADPlus.RecuperaTipoProcesso( iIdEventoGerador : Integer; iIdEmpresa : Integer ) : Integer;
var
  sSQL: String;
  sVersaoRAD : string;
  CdsLocal :TCMClientDataset;
begin
  CdsLocal := TCMClientDataset.Create( nil );
  try
    Result := 0;
    try
      RADDebug( 'Verificando versão do RAD...' );

      sVersaoRAD := trim( RecuperaVersaoRAD( iIdEmpresa ) );

      RADDebug( 'Versão do RAD: ' + sVersaoRAD );

      if sVersaoRAD <> '' then
      begin
        sSQL := ' SELECT IDRADTIPOPROC    ' +
                ' FROM   RADTIPOPROC      ' +
                ' WHERE  FLGATIVO     = 1 ' +
                '   AND  IDREFERENCIA =   ' + IntToStr( iIdEventoGerador );

        RADDebug( 'Query do tipo do processo: ' + sSQL );

        CdsLocal.Data := GetDataPacket( sSQL );

        RADDebug( 'Query do tipo do processo executada.' + sSQL );

        if not CdsLocal.IsEmpty then
        begin
          RADDebug( 'Query do tipo do processo retornou ' + CdsLocal.FieldByName( 'IDRADTIPOPROC' ).AsString );
          Result := CdsLocal.FieldByName( 'IDRADTIPOPROC' ).AsInteger;
        end;

      end;

    except
      On e : Exception Do
      begin
        RADDebug( 'Erro na recuperação do tipo do processo.' );
        Result := 0;
        MessageInfo := e.Message;
      end;
    end;
  finally
    CdsLocal.Free;
  end;
end;


function TCtrlRADPlus.ExcluirProcesso(iIdProcesso: integer; bInTransaction: boolean): Boolean;
begin
  if ConnectionSide = cnsClient then
  begin
     Result := Connection.AppServer.ExcluirProcesso( iIdProcesso, bInTransaction );
     if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      if not bInTransaction then
        StartTransaction;

      Result := ExecSQL( ' UPDATE RADINSTPROCESSO        ' +
                         ' SET FLGOK = ''E''   ,         ' +
                         '     DATAFIMPROCESSO = sysdate ' +
                         ' WHERE IDPROCESSO    =         ' + FloatToStr( iIdProcesso ) );

      if not Result then
        raise Exception.Create( 'Não foi possível excluir o processo.' );

      if not bInTransaction then
        Commit;

    except
      On E:Exception Do Begin
        if InTransaction then Rollback;
        Result := False;
        MessageInfo := E.Message;
      End;
    End;
  End;
end;

function TCtrlRADPlus.RecusaProcesso( iIdProcesso : integer ) : boolean;
begin
  Result := ExecSQL( ' update RADINSTPROCESSO                               ' +
                     ' set    FLGOK           = ''R''   ,                   ' +
                     '        DATAFIMPROCESSO = sysdate                     ' +
                     ' where  IDPROCESSO      = ' + IntToStr( iIdProcesso ) ) ;
end;


function TCtrlRADPlus.RecusaEtapa(iIdProcesso, iIdRadEtapaProc,
  iIdUsuario: integer; sObs: string; bInTransaction: boolean): boolean;
var
  cdsRadEtapa,
  cdsRadInstProcesso,
  cdsResponsavel : TCMClientDataset;
  sTxtAux, sDestEmail : string;
  iCMUsuario : integer;
begin

  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.RecusaEtapa( iIdProcesso, iIdRadEtapaProc,
     iIdUsuario, sObs, bInTransaction );
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin

    cdsRadEtapa        := TCMClientDataset.Create( nil );
    cdsRadInstProcesso := TCMClientDataset.Create( nil );
    cdsResponsavel     := TCMClientDataset.Create( nil );
    try

      try
    
        Result := False;

        //Inicia a transação
        if not bInTransaction then
          StartTransaction;

        //Inclui a recusa
        if ExecSQL( ' insert into RADETAPAPROCUSU     ' +
                   ' (           IDRADETAPAPROC     , ' +
                   '             IDUSUARIO          , ' +
                   '             DATAHORA           , ' +
                   '             FLGOK              , ' +
                   '             OBS                , ' +
                   '             FLGRESSALVA        ) ' +
                   ' values                         ( ' +
                   IntToStr( iIdRadEtapaProc )   + ', ' +
                   IntToStr( iIdUsuario )        + ', ' +
                   '             sysdate            , ' +
                   '             ''R''              , ' +
                   QuotedStr( sObs )             + ', ' +
                   '             0                  ) ' ) then
        begin

          //Marca a etapa como recusada
          if ExecSQL( ' update RADETAPAPROC              ' +
                      ' set    DATAFIMETAPA   = sysdate, ' +
                      '        FLGOK = ''R''             ' +
                      ' where  IDRADETAPAPROC = ' + IntToStr( iIdRadEtapaProc ) ) then
          begin

            //Recusa o processo
            if RecusaProcesso( iIdProcesso ) then
            begin

              cdsRadEtapa.Data := GetDataPacket(
               ' select *                              ' +
               ' from   RADETAPAPROC rep,              ' +
               '        RADETAPA     re                ' +
               ' where  rep.IDRADETAPA = re.IDRADETAPA ' +
               '   and  rep.IDRADETAPAPROC = ' + IntToStr( iIdRadEtapaProc ) );


              //Se é para enviar aviso...
              if ( bFLGENVIAEMAIL or bFLGENVIACM ) and ( cdsRadEtapa.FieldByName('FLGAVISOS').AsInteger > 1 ) then
              begin

                //Se é para enviar aviso para o solicitante...
                if cdsRadEtapa.FieldByName('FLGAVISOSOLIC').AsInteger <> 0 then
                begin

                  //..recupera dados do processo,...
                  cdsRadInstProcesso.Data := GetDataPacket(
                   ' select r.IDPROCESSO                   ,            ' +
                   '        r.IDEMPRESA                    ,            ' +
                   '        r.FLGOK                        ,            ' +
                   '        r.IDUSUARIO                    ,            ' +
                   '        r.DATAINIPROCESSO              ,            ' +
                   '        r.DATAFIMPROCESSO              ,            ' +
                   '        r.DATAFIMPREV                  ,            ' +
                   '        r.OBS                          ,            ' +
                   '        r.IDRADTIPOPROC                ,            ' +
                   '        r.CODCENTROCUSTO               ,            ' +
                   '        r.FLGVERSAORAD                 ,            ' +
                   '        r.CODCENTRORESPON              ,            ' +
                   '        r.CODGRUPOPROD                 ,            ' +
                   '        r.UNIDNEGOC                    ,            ' +
                   '        r.CODTIPDOC                    ,            ' +
                   '        r.VLRPROC                      ,            ' +
                   '        rtp.NOME as NOMERAD            ,            ' +
                   '        rtp.TXTRECUSARAD               ,            ' +
                   '        p.NOME as NOMESOLIC            ,            ' +
                   '        cr.NOME as NOMECENTRESPON      ,            ' +
                   '        t.DESCRICAO as DESCRICAOTIPDOC ,            ' +
                   '        cc.NOME as NOMECENTCUST        ,            ' +
                   '        g.DESCGRUPOPROD                ,            ' +
                   '        u.NOME as NOMEUNIDNEGOC                     ' +
                   ' from   RADINSTPROCESSO r              ,            ' +
                   '        RADTIPOPROC     rtp            ,            ' +
                   '        PESSOA          p              ,            ' +
                   '        CENTRESPON      cr             ,            ' +
                   '        TIPODOCRECPAG   t              ,            ' +
                   '        CENTCUST        cc             ,            ' +
                   '        GRUPPROD        g              ,            ' +
                   '        UNIDNEGOCIO     u                           ' +
                   ' where  r.IDRADTIPOPROC   = rtp.IDRADTIPOPROC       ' +
                   '   and  r.IDUSUARIO       = p.IDPESSOA              ' +
                   '   and  r.CODCENTRORESPON = cr.CODCENTRORESPON (+)  ' +
                   '   and  r.IDEMPRESA       = cr.IDPESSOA        (+)  ' +
                   '   and  r.CODTIPDOC       = t.CODTIPDOC        (+)  ' +
                   '   and  r.CODCENTROCUSTO  = cc.CODCENTROCUSTO  (+)  ' +
                   '   and  r.IDEMPRESA       = cc.IDEMPRESA       (+)  ' +
                   '   and  r.CODGRUPOPROD    = g.CODGRUPOPROD     (+)  ' +
                   '   and  r.UNIDNEGOC       = u.UNIDNEGOC        (+)  ' +
                   '   and  r.IDEMPRESA       = u.IDPESSOA         (+)  ' +
                   '   and  r.IDPROCESSO    = ' + IntToStr( iIdProcesso ) );

                  cdsResponsavel.Data := GetDataPacket( ' select NOME from PESSOA where IDPESSOA = ' + IntToStr( iIdUsuario ) );                    

                  sTxtAux := cdsRadInstProcesso.FieldByName('TXTRECUSARAD').AsString;

                  //Monta a mensagem para o solicitante e demais destinatários
                  sTxtAux := SubstituiTags( sTxtAux                ,
                                            [ 'NOMEDEST'           ,
                                              'DESCRAD'            ,
                                              'DESCETAPA'          ,
                                              'NUMRAD'             ,
                                              'RESPONSAVELRECUSA'  ,
                                              'DATAHORAINIRAD'     ,
                                              'DATAHORAINIETAPA'   ,
                                              'DATAHORAFIMRAD'     ,
                                              'DATAHORAFIMETAPA'   ,
                                              'OBSRAD'             ,
                                              'OBSRECUSA'          ,
                                              'VALOR'              ,
                                              'CODCENTROCUSTO'     ,
                                              'DESCCENTROCUSTO'    ,
                                              'CODCENTRORESPON'    ,
                                              'DESCCENTRORESPON'   ,
                                              'GRUPOPROD'          ,
                                              'ATIVXPROJ'          ,
                                              'TIPODOC'            ],

                                            [ cdsRadInstProcesso.FieldByName('NOMESOLIC').AsString,
                                              cdsRadInstProcesso.FieldByName('NOMERAD').AsString                                                 ,
                                              cdsRadEtapa.FieldByName('DESCRICAO').AsString                                                      ,
                                              cdsRadInstProcesso.FieldByName('IDPROCESSO').AsString                                              ,
                                              cdsResponsavel.FieldByName('NOME').AsString                                                        ,                                              
                                              FormatDateTime( 'dd/mm/yyyy hh:nn', cdsRadInstProcesso.FieldByName('DATAINIPROCESSO').AsDateTime ) ,
                                              FormatDateTime( 'dd/mm/yyyy hh:nn', cdsRadEtapa.FieldByName('DATAINIETAPA').AsDateTime )           ,
                                              FormatDateTime( 'dd/mm/yyyy hh:nn', cdsRadInstProcesso.FieldByName('DATAFIMPROCESSO').AsDateTime ) ,
                                              FormatDateTime( 'dd/mm/yyyy hh:nn', Now )                                                          ,
                                              cdsRadInstProcesso.FieldByName('OBS').AsString                                                     ,
                                              sObs                                                                                               ,
                                              FormatFloat( '#,##0.00', cdsRadInstProcesso.FieldByName('VLRPROC').AsFloat )                       ,
                                              cdsRadInstProcesso.FieldByName('CODCENTROCUSTO').AsString                                          ,
                                              cdsRadInstProcesso.FieldByName('NOMECENTCUST').AsString                                            ,
                                              cdsRadInstProcesso.FieldByName('CODCENTRORESPON').AsString                                         ,
                                              cdsRadInstProcesso.FieldByName('NOMECENTRESPON').AsString                                          ,
                                              cdsRadInstProcesso.FieldByName('DESCGRUPOPROD').AsString                                           ,
                                              cdsRadInstProcesso.FieldByName('NOMEUNIDNEGOC').AsString                                           ,
                                              cdsRadInstProcesso.FieldByName('DESCRICAOTIPDOC').AsString
                                            ] );

                  sDestEmail := '';
                  iCMUsuario := -1;

                  //Se é para enviar e-mail
                  if bFLGENVIAEMAIL and ( cdsRadEtapa.FieldByName('FLGAVISOS').AsInteger in [ 2, 4 ] ) then
                    sDestEmail := RecuperaEnderecoEMail( cdsRadInstProcesso.FieldByName('IDUSUARIO').AsInteger );

                  //Se é para enviar pelo CMMail e há remetente cadastrado
                  if bFLGENVIACM and ( iIDREMETENTE > 0 ) and ( cdsRadEtapa.FieldByName('FLGAVISOS').AsInteger in [ 3, 4 ] ) then
                    iCMUsuario := cdsRadInstProcesso.FieldByName('IDUSUARIO').AsInteger;

                  if ( sDestEmail <> '' ) or ( iCMUsuario > 0 ) then
                    IncluiMensagemRAD( iCMUsuario, sDestEMail,
                     'Aviso de recusa do processo RAD ' + IntToStr( iIdProcesso ), sTxtAux );

                end;

              end;

              //Commita a transação
              if not bInTransaction then
                Commit;

              EnviaMensagens;

              Result := True;

            end;

          end;

        end;

        if MessageInfo <> '' then raise Exception.Create( MessageInfo );

      except
        On E : Exception Do
        begin
          Result := False;
          if InTransaction then Rollback;
          exit;
        end;
      end;

    finally
      cdsRadEtapa.Free;
      cdsRadInstProcesso.Free;
      cdsResponsavel.Free;
    end;

  end;

end;

function TCtrlRADPlus.VoltaEtapa(iIdProcesso, iIdRadEtapaProc,
  iIdUsuario: integer; sObs: string; bInTransaction: boolean): boolean;
var
  cdsRadEtapa,
  cdsRadInstProcesso,
  cdsResponsavel,
  cdsAux : TCMClientDataset;
  sTxtAux, sDestEmail : string;
  iCMUsuario, iNumEtapa : integer;
begin

  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.VoltaEtapa( iIdProcesso, iIdRadEtapaProc,
     iIdUsuario, sObs, bInTransaction );
    MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin

    try

      cdsRadEtapa        := TCMClientDataset.Create( nil );
      cdsRadInstProcesso := TCMClientDataset.Create( nil );
      cdsResponsavel     := TCMClientDataset.Create( nil );
      cdsAux             := TCMClientDataset.Create( nil );

      try
        Result := False;

        //Inicia a transação
        if not bInTransaction then
          StartTransaction;

        //Inclui a recusa
        if ExecSQL( ' insert into RADETAPAPROCUSU     ' +
                    ' (           IDRADETAPAPROC     , ' +
                    '             IDUSUARIO          , ' +
                    '             DATAHORA           , ' +
                    '             FLGOK              , ' +
                    '             OBS                , ' +
                    '             FLGRESSALVA        ) ' +
                    ' values                         ( ' +
                    IntToStr( iIdRadEtapaProc )   + ', ' +
                    IntToStr( iIdUsuario )        + ', ' +
                    '             sysdate            , ' +
                    '             ''R''              , ' +
                    QuotedStr( sObs )             + ', ' +
                    '             0                  ) ' ) then
        begin

          //Busca os dados da etapa
          cdsRadEtapa.Data := GetDataPacket(
           ' select *                              ' +
           ' from   RADETAPAPROC rep,              ' +
           '        RADETAPA     re                ' +
           ' where  rep.IDRADETAPA = re.IDRADETAPA ' +
           '   and  rep.IDRADETAPAPROC = ' + IntToStr( iIdRadEtapaProc ) );


          //Se é para voltar para a etapa imediatamente anterior...
          if cdsRadEtapa.FieldByName('FLGETAPARETORNO').AsInteger = 1 then
          begin
            //Verifica qual foi a etapa anterior
            cdsAux.Data := GetDataPacket(
             ' select r.IDRADETAPA                                                                                               ' +
             ' from   RADETAPAPROC r                                                                                             ' +
             ' where  r.IDPROCESSO = ' + IntToStr( iIdProcesso ) + '                                                             ' +
             '   and  r.SEQETAPA   = ( select max( r2.SEQETAPA )                                                                 ' +
             '                         from   RADETAPAPROC r2 ,                                                                  ' +
             '                                RADETAPA     r3                                                                    ' +
             '                         where  r2.IDPROCESSO = r.IDPROCESSO                                                       ' +
             '                           and  r2.IDRADETAPA = r3.IDRADETAPA                                                      ' +
             '                           and  r3.NUMERO     < ' + cdsRadEtapa.FieldByName('NUMERO').AsString                       +
             '                           and  r2.SEQETAPA < ( select r4.SEQETAPA                                                 ' +
             '                                                from   RADETAPAPROC r4                                             ' +
             '                                                where  r4.IDRADETAPAPROC = ' + IntToStr( iIdRadEtapaProc ) + ' ) ) ' );
          end
          else
          begin
            //Verifica o ID da etapa destino
            cdsAux.Data := GetDataPacket(
            ' select IDRADETAPA      ' +
            ' from   RADETAPA        ' +
            ' where  IDRADTIPOPROC = ' + cdsRadEtapa.FieldByName('IDRADTIPOPROC').AsString +
            '   and  NUMERO        = ' + cdsRadEtapa.FieldByName('NUMETAPARET').AsString ) ;
          end;

          iNumEtapa := cdsAux.FieldByName('IDRADETAPA').AsInteger;
            
          if InsereEtapa( iNumEtapa, iIdProcesso ) then
          begin

            if ExecSQL( ' update RADETAPAPROC              ' +
                        ' set    DATAFIMETAPA   = sysdate, ' +
                        '        FLGOK = ''R''             ' +
                        ' where  IDRADETAPAPROC = ' + IntToStr( iIdRadEtapaProc ) ) then
            begin

              //Se é para enviar aviso...
              if ( bFLGENVIAEMAIL or bFLGENVIACM ) and ( cdsRadEtapa.FieldByName('FLGAVISOS').AsInteger > 1 ) then
              begin

                //Se é para enviar aviso para o solicitante...
                if cdsRadEtapa.FieldByName('FLGAVISOSOLIC').AsInteger <> 0 then
                begin

                  //..recupera dados do processo,...
                  cdsRadInstProcesso.Data := GetDataPacket(
                   ' select r.IDPROCESSO                   ,            ' +
                   '        r.IDEMPRESA                    ,            ' +
                   '        r.FLGOK                        ,            ' +
                   '        r.IDUSUARIO                    ,            ' +
                   '        r.DATAINIPROCESSO              ,            ' +
                   '        r.DATAFIMPROCESSO              ,            ' +
                   '        r.DATAFIMPREV                  ,            ' +
                   '        r.OBS                          ,            ' +
                   '        r.IDRADTIPOPROC                ,            ' +
                   '        r.CODCENTROCUSTO               ,            ' +
                   '        r.FLGVERSAORAD                 ,            ' +
                   '        r.CODCENTRORESPON              ,            ' +
                   '        r.CODGRUPOPROD                 ,            ' +
                   '        r.UNIDNEGOC                    ,            ' +
                   '        r.CODTIPDOC                    ,            ' +
                   '        r.VLRPROC                      ,            ' +
                   '        rtp.NOME as NOMERAD            ,            ' +
                   '        rtp.TXTRECUSAETAPA             ,            ' +
                   '        p.NOME as NOMESOLIC            ,            ' +
                   '        cr.NOME as NOMECENTRESPON      ,            ' +
                   '        t.DESCRICAO as DESCRICAOTIPDOC ,            ' +
                   '        cc.NOME as NOMECENTCUST        ,            ' +
                   '        g.DESCGRUPOPROD                ,            ' +
                   '        u.NOME as NOMEUNIDNEGOC                     ' +
                   ' from   RADINSTPROCESSO r              ,            ' +
                   '        RADTIPOPROC     rtp            ,            ' +
                   '        PESSOA          p              ,            ' +
                   '        CENTRESPON      cr             ,            ' +
                   '        TIPODOCRECPAG   t              ,            ' +
                   '        CENTCUST        cc             ,            ' +
                   '        GRUPPROD        g              ,            ' +
                   '        UNIDNEGOCIO     u                           ' +
                   ' where  r.IDRADTIPOPROC   = rtp.IDRADTIPOPROC       ' +
                   '   and  r.IDUSUARIO       = p.IDPESSOA              ' +
                   '   and  r.CODCENTRORESPON = cr.CODCENTRORESPON (+)  ' +
                   '   and  r.IDEMPRESA       = cr.IDPESSOA        (+)  ' +
                   '   and  r.CODTIPDOC       = t.CODTIPDOC        (+)  ' +
                   '   and  r.CODCENTROCUSTO  = cc.CODCENTROCUSTO  (+)  ' +
                   '   and  r.IDEMPRESA       = cc.IDEMPRESA       (+)  ' +
                   '   and  r.CODGRUPOPROD    = g.CODGRUPOPROD     (+)  ' +
                   '   and  r.UNIDNEGOC       = u.UNIDNEGOC        (+)  ' +
                   '   and  r.IDEMPRESA       = u.IDPESSOA         (+)  ' +
                   '   and  r.IDPROCESSO    = ' + IntToStr( iIdProcesso ) );

                  cdsResponsavel.Data := GetDataPacket( ' select NOME from PESSOA where IDPESSOA = ' + IntToStr( iIdUsuario ) );

                  sTxtAux := cdsRadInstProcesso.FieldByName('TXTRECUSAETAPA').AsString;

                  //Monta a mensagem para o solicitante e demais destinatários
                  sTxtAux := SubstituiTags( sTxtAux                ,
                                            [ 'NOMEDEST'           ,
                                              'DESCRAD'            ,
                                              'DESCETAPA'          ,
                                              'NUMRAD'             ,
                                              'RESPONSAVELRECUSA'  ,
                                              'DATAHORAINIRAD'     ,
                                              'DATAHORAINIETAPA'   ,
                                              'DATAHORAFIMRAD'     ,
                                              'DATAHORAFIMETAPA'   ,
                                              'OBSRAD'             ,
                                              'OBSRECUSA'          ,
                                              'VALOR'              ,
                                              'CODCENTROCUSTO'     ,
                                              'DESCCENTROCUSTO'    ,
                                              'CODCENTRORESPON'    ,
                                              'DESCCENTRORESPON'   ,
                                              'GRUPOPROD'          ,
                                              'ATIVXPROJ'          ,
                                              'TIPODOC'            ],

                                            [ cdsRadInstProcesso.FieldByName('NOMESOLIC').AsString,
                                              cdsRadInstProcesso.FieldByName('NOMERAD').AsString                                                 ,
                                              cdsRadEtapa.FieldByName('DESCRICAO').AsString                                                      ,
                                              cdsRadInstProcesso.FieldByName('IDPROCESSO').AsString                                              ,
                                              cdsResponsavel.FieldByName('NOME').AsString                                                        ,                                              
                                              FormatDateTime( 'dd/mm/yyyy hh:nn', cdsRadInstProcesso.FieldByName('DATAINIPROCESSO').AsDateTime ) ,
                                              FormatDateTime( 'dd/mm/yyyy hh:nn', cdsRadEtapa.FieldByName('DATAINIETAPA').AsDateTime )           ,
                                              FormatDateTime( 'dd/mm/yyyy hh:nn', cdsRadInstProcesso.FieldByName('DATAFIMPROCESSO').AsDateTime ) ,
                                              FormatDateTime( 'dd/mm/yyyy hh:nn', Now )                                                          ,
                                              cdsRadInstProcesso.FieldByName('OBS').AsString                                                     ,
                                              sObs                                                                                               ,
                                              FormatFloat( '#,##0.00', cdsRadInstProcesso.FieldByName('VLRPROC').AsFloat )                       ,
                                              cdsRadInstProcesso.FieldByName('CODCENTROCUSTO').AsString                                          ,
                                              cdsRadInstProcesso.FieldByName('NOMECENTCUST').AsString                                            ,
                                              cdsRadInstProcesso.FieldByName('CODCENTRORESPON').AsString                                         ,
                                              cdsRadInstProcesso.FieldByName('NOMECENTRESPON').AsString                                          ,
                                              cdsRadInstProcesso.FieldByName('DESCGRUPOPROD').AsString                                           ,
                                              cdsRadInstProcesso.FieldByName('NOMEUNIDNEGOC').AsString                                           ,
                                              cdsRadInstProcesso.FieldByName('DESCRICAOTIPDOC').AsString
                                            ] );

                  sDestEmail := '';
                  iCMUsuario := -1;

                  //Se é para enviar e-mail
                  if bFLGENVIAEMAIL and ( cdsRadEtapa.FieldByName('FLGAVISOS').AsInteger in [ 2, 4 ] ) then
                    sDestEmail := RecuperaEnderecoEMail( cdsRadInstProcesso.FieldByName('IDUSUARIO').AsInteger );

                  //Se é para enviar pelo CMMail e há remetente cadastrado
                  if bFLGENVIACM and ( iIDREMETENTE > 0 ) and ( cdsRadEtapa.FieldByName('FLGAVISOS').AsInteger in [ 3, 4 ] ) then
                    iCMUsuario := cdsRadInstProcesso.FieldByName('IDUSUARIO').AsInteger;

                  if ( sDestEmail <> '' ) or ( iCMUsuario > 0 ) then
                    IncluiMensagemRAD( iCMUsuario, sDestEMail,
                     'Aviso de recusa de etapa do processo RAD ' + IntToStr( iIdProcesso ), sTxtAux );

                end;

              end;

              //Commita a transação
              if not bInTransaction then
                Commit;

              EnviaMensagens;

              Result := True;
            end;

          end;

        end;

        if MessageInfo <> '' then raise Exception.Create( MessageInfo );

      finally
        cdsAux.Free;
        cdsRadEtapa.Free;
        cdsRadInstProcesso.Free;
        cdsResponsavel.Free;
      end;

    except
      On E : Exception Do
      begin
        Result := False;
        if InTransaction then Rollback;
        exit;
      end;
    end;

  end;

end;

function TCtrlRADPlus.InsereEtapa( iIdRadEtapa, iIdProcesso : integer ) : boolean;
var
  cdsRadInstProcesso,
  cdsRadEtapa,
  cdsRadEtapaProc,
  cdsAprovadores : TCMClientDataset;
  i, iQtdeMinutos, iSeqEtapa,
  iCMUsuario, iProxIdRadEtapaProc : integer;
  sPrazoEstimado, sDataFimPrev, sTxtAux, sDestEmail : string;
  dNow, dDataCont, dUltData, dDataFim : TDateTime;
  dDataHoraPrev : TDateTime;
begin
  cdsRadEtapa        := TCmClientDataset.Create( nil );
  cdsRadEtapaProc    := TCmClientDataset.Create( nil );
  cdsRadInstProcesso := TCmClientDataset.Create( nil );
  cdsAprovadores     := TCmClientDataset.Create( nil );
  try

    Result := False;

    dNow := Now;

    //Pega os dados da próxima etapa
    cdsRadEtapa.Data := GetDataPacket(
     ' select   *                                      ' +
     ' from     RADETAPA                               ' +
     ' where    IDRADETAPA = ' + IntToStr( iIdRadEtapa ) +
     ' order by NUMERO                                 ' );


    //Verifica o SEQETAPA a ser utilizado e calcula o próximo
    cdsRadEtapaProc.Data := GetDataPacket(
     ' select nvl( max( SEQETAPA ), 0 ) as SEQETAPA    ' +
     ' from   RADETAPAPROC                             ' +
     ' where  IDPROCESSO = ' + IntToStr( iIdProcesso ) ) ;


    iSeqEtapa := cdsRadEtapaProc.FieldByName('SEQETAPA').AsInteger + 1;


    //Recupera o próximo IDRADETAPAPROC
    iProxIdRadEtapaProc := GetSequence( 'RADETAPAPROC' );

    //Cálculo do prazo estimado
    sPrazoEstimado := trim( cdsRadEtapa.FieldByName('PRAZOESTIMADO').AsString );
    if ( sPrazoEstimado <> '' ) and ( sPrazoEstimado <> ':' ) then
    begin
      iQtdeMinutos := HoraParaMinutos( sPrazoEstimado );

      if bFLG24H then     //Se for dia de 24h, 7 dias por semana...
        dDataFim := SomaMinutos( dNow, iQtdeMinutos )
      else
      begin               //Senão, conta dia a dia

        dDataCont := dNow;
        dUltData := 0;
        for i := 1 to iQtdeMinutos do
        begin
          //Acrescenta 1 minuto à hora
          dDataCont := dDataCont + cMinuto;

          //Se é antes do horário de expediente...
          if  FormatDateTime( 'hhnn', dDataCont ) < StringReplace( sHORAINIEXP, ':', '', [] ) then
          begin
            //Posiciona no início do expediente
            dDataCont := StrToDateTime( FormatDateTime( 'dd/mm/yyyy', dDataCont ) + ' ' + sHORAINIEXP ) + cMinuto;
          end
          else
          begin
            //Se é depois do horário de expediente
            if FormatDateTime( 'hhnn', dDataCont ) > StringReplace( sHORAFIMEXP, ':', '', [] ) then
            begin
              dDataCont := dDataCont + 1;
              dDataCont := StrToDateTime( FormatDateTime( 'dd/mm/yyyy', dDataCont ) + ' ' + sHORAINIEXP ) + cMinuto;
            end;
          end;
        end;

        //Enquanto não fo dia útil, adia o fim
        //Se mudou a data...
        if trunc( dDataCont ) <> trunc( dUltData ) then
          while not _DiasUteis.DiaUtil( IdEmpresa, dDataCont, False, True, False ) do
            dDataCont := dDataCont + 1;

        dUltData := dDataCont;

        dDataFim := dUltData;
      end;

      dDataHoraPrev := dDataFim;
      sDataFimPrev := 'to_date( ' + QuotedStr( FormatDateTime(
       'dd/mm/yyyy hh:nn', dDataFim  ) ) + ', ''dd/mm/yyyy hh24:mi'' ) ';
    end
    else
    begin
      dDataHoraPrev := 0;
      sDataFimPrev := 'null';
    end;

    
    //Insere a nova etapa do processo
    if ExecSQL( ' insert into RADETAPAPROC            ' +
                ' (           IDRADETAPAPROC        , ' +
                '             IDRADETAPA            , ' +
                '             IDPROCESSO            , ' +
                '             SEQETAPA              , ' +
                '             DATAINIETAPA          , ' +
                '             DATAFIMPREV           , ' +
                '             FLGOK                 ) ' +
                ' values                            ( ' +
                IntToStr( iProxIdRadEtapaProc ) + ' , ' +
                IntToStr( iIdRadEtapa         ) + ' , ' +
                IntToStr( iIdProcesso         ) + ' , ' +
                IntToStr( iSeqEtapa           ) + ' , ' +
                'to_date( ' + QuotedStr( FormatDateTime( 'dd/mm/yyyy hh:nn', dNow ) ) + ', ''dd/mm/yyyy hh24:mi'' ), ' +
                sDataFimPrev                    + ' , ' +
                '''N''                              ) ' ) then
    begin

      //Se é para enviar aviso...
      if ( bFLGENVIAEMAIL or bFLGENVIACM ) and ( cdsRadEtapa.FieldByName('FLGAVISOS').AsInteger > 1 ) then
      begin

        //Se é para enviar aviso para o aprovador...
        if cdsRadEtapa.FieldByName('FLGAVISOGRUPO').AsInteger <> 0 then
        begin

          //Recupera dados do processo
          cdsRadInstProcesso.Data := GetDataPacket(
           ' select r.IDPROCESSO                   ,            ' +
           '        r.IDEMPRESA                    ,            ' +
           '        r.FLGOK                        ,            ' +
           '        r.IDUSUARIO                    ,            ' +
           '        r.DATAINIPROCESSO              ,            ' +
           '        r.DATAFIMPROCESSO              ,            ' +
           '        r.DATAFIMPREV                  ,            ' +
           '        r.OBS                          ,            ' +
           '        r.IDRADTIPOPROC                ,            ' +
           '        r.CODCENTROCUSTO               ,            ' +
           '        r.FLGVERSAORAD                 ,            ' +
           '        r.CODCENTRORESPON              ,            ' +
           '        r.CODGRUPOPROD                 ,            ' +
           '        r.UNIDNEGOC                    ,            ' +
           '        r.CODTIPDOC                    ,            ' +
           '        r.VLRPROC                      ,            ' +
           '        rtp.NOME as NOMERAD            ,            ' +
           '        rtp.TXTSOLICAPROV              ,            ' +
           '        p.NOME as NOMESOLIC            ,            ' +
           '        cr.NOME as NOMECENTRESPON      ,            ' +
           '        t.DESCRICAO as DESCRICAOTIPDOC ,            ' +
           '        cc.NOME as NOMECENTCUST        ,            ' +
           '        g.DESCGRUPOPROD                ,            ' +
           '        u.NOME as NOMEUNIDNEGOC                     ' +
           ' from   RADINSTPROCESSO r              ,            ' +
           '        RADTIPOPROC     rtp            ,            ' +
           '        PESSOA          p              ,            ' +
           '        CENTRESPON      cr             ,            ' +
           '        TIPODOCRECPAG   t              ,            ' +
           '        CENTCUST        cc             ,            ' +
           '        GRUPPROD        g              ,            ' +
           '        UNIDNEGOCIO     u                           ' +
           ' where  r.IDRADTIPOPROC   = rtp.IDRADTIPOPROC       ' +
           '   and  r.IDUSUARIO       = p.IDPESSOA              ' +
           '   and  r.CODCENTRORESPON = cr.CODCENTRORESPON (+)  ' +
           '   and  r.IDEMPRESA       = cr.IDPESSOA        (+)  ' +
           '   and  r.CODTIPDOC       = t.CODTIPDOC        (+)  ' +
           '   and  r.CODCENTROCUSTO  = cc.CODCENTROCUSTO  (+)  ' +
           '   and  r.IDEMPRESA       = cc.IDEMPRESA       (+)  ' +
           '   and  r.CODGRUPOPROD    = g.CODGRUPOPROD     (+)  ' +
           '   and  r.UNIDNEGOC       = u.UNIDNEGOC        (+)  ' +
           '   and  r.IDEMPRESA       = u.IDPESSOA         (+)  ' +
           '   and  r.IDPROCESSO    = ' + IntToStr( iIdProcesso ) );

          sTxtAux := cdsRadInstProcesso.FieldByName('TXTSOLICAPROV').AsString;

          if dDataHoraPrev <> 0 then
            sDataFimPrev := FormatDateTime( 'dd/mm/yyyy hh:nn', dDataHoraPrev )
          else
            sDataFimPrev := '';

          //Monta a mensagem para os aprovadores
          sTxtAux := SubstituiTags( sTxtAux                  ,
                                    [ 'DESCRAD'              ,
                                      'DESCETAPA'            ,
                                      'NUMRAD'               ,
                                      'DATAHORAINIRAD'       ,
                                      'DATAHORAINIETAPA'     ,
                                      'DATAHORAPREVFIMETAPA' ,
                                      'OBSRAD'               ,
                                      'VALOR'                ,
                                      'CODCENTROCUSTO'       ,
                                      'DESCCENTROCUSTO'      ,
                                      'CODCENTRORESPON'      ,
                                      'DESCCENTRORESPON'     ,
                                      'GRUPOPROD'            ,
                                      'ATIVXPROJ'            ,
                                      'TIPODOC'              ],

                                    [ cdsRadInstProcesso.FieldByName('NOMERAD').AsString                                                 ,
                                      cdsRadEtapa.FieldByName('DESCRICAO').AsString                                                      ,
                                      cdsRadInstProcesso.FieldByName('IDPROCESSO').AsString                                              ,
                                      FormatDateTime( 'dd/mm/yyyy hh:nn', cdsRadInstProcesso.FieldByName('DATAINIPROCESSO').AsDateTime ) ,
                                      FormatDateTime( 'dd/mm/yyyy hh:nn', dNow )                                                          ,
                                      sDataFimPrev                                                                                       ,
                                      cdsRadInstProcesso.FieldByName('OBS').AsString                                                     ,
                                      FormatFloat( '#,##0.00', cdsRadInstProcesso.FieldByName('VLRPROC').AsFloat )                       ,
                                      cdsRadInstProcesso.FieldByName('CODCENTROCUSTO').AsString                                          ,
                                      cdsRadInstProcesso.FieldByName('NOMECENTCUST').AsString                                            ,
                                      cdsRadInstProcesso.FieldByName('CODCENTRORESPON').AsString                                         ,
                                      cdsRadInstProcesso.FieldByName('NOMECENTRESPON').AsString                                          ,
                                      cdsRadInstProcesso.FieldByName('DESCGRUPOPROD').AsString                                           ,
                                      cdsRadInstProcesso.FieldByName('NOMEUNIDNEGOC').AsString                                           ,
                                      cdsRadInstProcesso.FieldByName('DESCRICAOTIPDOC').AsString
                                    ] );

          //Envia mensagem para cada aprovador do grupo que deve receber e-mail
          cdsAprovadores.Data := GetDataPacket(
           ' select rrg.IDUSUARIO,                    ' +
           '        p.NOME,                           ' +
           '        p.EMAIL,                          ' +
           '        rrg.IDUSUARIO                     ' +
           ' from   RADRESPONXGRP rrg,                ' +
           '        PESSOA        p                   ' +
           ' where  p.IDPESSOA        = rrg.IDUSUARIO ' +
           '   and  rrg.FLGAVISORAD   = 1             ' +
           '   and  rrg.IDGRPRESPON   = ' + cdsRadEtapa.FieldByName('IDGRPRESPON').AsString );

          cdsAprovadores.First;
          while not cdsAprovadores.Eof do
          begin
            sDestEmail := '';
            iCMUsuario := -1;

            if bFLGENVIAEMAIL and ( cdsRadEtapa.FieldByName('FLGAVISOS').AsInteger in [ 2, 4 ] ) then
              sDestEmail := trim( cdsAprovadores.FieldByName('EMAIL').AsString );

            if bFLGENVIACM and ( iIDREMETENTE > 0 ) and ( cdsRadEtapa.FieldByName('FLGAVISOS').AsInteger in [ 3, 4 ] ) then
              iCMUsuario := cdsAprovadores.FieldByname('IDUSUARIO').AsInteger;

            IncluiMensagemRAD( iCMUsuario,
                               sDestEMail,
                               'Solicitação de aprovação de etapa do processo RAD ' + IntToStr( iIdProcesso ),
                               SubstituiTags( sTxtAux, ['NOMEDEST'], [cdsAprovadores.FieldByName('NOME').AsString] ) );

            cdsAprovadores.Next;
          end;

        end;

      end;

    end;

    if MessageInfo = '' then
      Result := True;

  finally
    cdsRadEtapa.Free;
    cdsRadEtapaProc.Free;
    cdsRadInstProcesso.Free;
    cdsAprovadores.Free;
  end;

end;

function TCtrlRADPlus.RecuperaEventoGerador(iIdRadTipoProc, iIdEmpresa: Integer): Integer;
var
  SQL: String;
  CdsLocal : TCMClientDataset;
begin
  CdsLocal := TCMClientDataset.Create( nil );
  try
    Result := 0;
    try
       If RecuperaVersaoRAD( iIdEmpresa ) <> '' then
          Begin
             SQL := ' SELECT IDRADTIPOPROC     ' +
                    ' FROM   RADTIPOPROC       ' +
                    ' WHERE  FLGATIVO      = 1 ' +
                    '   AND  IDRADTIPOPROC = ' + IntToStr( iIdRadTipoProc );

             CdsLocal.Data := GetDataPacket( SQL );

             If Not CdsLocal.IsEmpty Then
                Result := CdsLocal.FieldByName( 'IDREFERENCIA' ).AsInteger;
          End;
    except
      On e : Exception Do
      begin
        Result := 0;
        MessageInfo := e.Message;
      end;
    end;
  finally
    CdsLocal.Free;
  end;
end;

function TCtrlRADPlus.ExisteAprovacaoNoProcesso( iIdProcesso : integer ) : boolean;
var
  cdsAux : TCMClientDataset;
begin
  cdsAux := TCMClientDataset.Create( nil );
  try
    cdsAux.Data := GetDataPacket(
     ' select FLGOK           ' +
     ' from   RADINSTPROCESSO ' +
     ' where  IDPROCESSO    = ' + IntToStr( iIdProcesso ) );

    //Se o processo está aprovado
    if cdsAux.FieldByName('FLGOK').AsString = 'S' then
    begin
      Result := True;
      exit;
    end;

    //Se o processo foi recusado
    if cdsAux.FieldByName('FLGOK').AsString = 'R' then
    begin
      Result := False;
      exit;
    end;

    //Se o processo foi exclcuído
    if cdsAux.FieldByName('FLGOK').AsString = 'E' then
    begin
      Result := False;
      exit;
    end;

    //Verifica se há algum processo com aprovação válida
    cdsAux.Close;
    cdsAux.data := GetDataPacket(
     ' select rep.SEQETAPA                                                ' +
     ' from   RADETAPAPROC    rep,                                        ' +
     '        RADETAPAPROCUSU repu                                        ' +
     ' where  rep.IDRADETAPAPROC = repu.IDRADETAPAPROC                    ' +
     '   and  repu.FLGOK = ''S''                                          ' +
     '   and  rep.SEQETAPA <= ( select rep2.SEQETAPA                      ' +
     '                          from   RADETAPAPROC rep2                  ' +
     '                          where  rep2.FLGOK = ''N''                 ' +
     '                            and  rep2.IDPROCESSO = rep.IDPROCESSO ) ' +
     '   and  rep.IDPROCESSO    = ' + IntToStr( iIdProcesso )             ) ;

    Result := not cdsAux.IsEmpty;

  finally
    cdsAux.Free;
  end;
end;


function TCtrlRADPlus.EnviaMensagemCM( iIdUsuarioRemetente, iIdUsuarioDestinatario : integer;
                                       sNomeDestinatario, sAssunto, sMensagem : string ) : boolean;
begin

  cdsMensagem.Data := GetDataPacket(
   ' select IDMENSAGEM       , ' +
   '        IDREMETENTE      , ' +
   '        IDDESTINATARIO   , ' +
   '        ASSUNTO          , ' +
   '        MENSAGEM         , ' +
   '        LIDA             , ' +
   '        DATAENVIO        , ' +
   '        DATAPROGRAMA     , ' +
   '        TIPODESTINATARIO , ' +
   '        IDMSGPRE           ' +
   ' from   MENSAGEMCM         ' +
   ' where  1 = 2              ' );

  cdsMensagem.Append;
  cdsMensagem.FieldByName('IDREMETENTE').AsFloat       := iIdUsuarioRemetente;
  cdsMensagem.FieldByName('IDDESTINATARIO').AsFloat    := iIdUsuarioDestinatario;
  cdsMensagem.FieldByName('ASSUNTO').AsString          := sAssunto;
  cdsMensagem.FieldByName('MENSAGEM').AsString         := Copy( sMensagem, 1, 4000 );
  cdsMensagem.FieldByName('LIDA').AsInteger            := 0;
  cdsMensagem.FieldByName('DATAENVIO').AsDateTime      := Now;
  cdsMensagem.FieldByName('DATAPROGRAMA').AsDateTime   := Now;
  cdsMensagem.FieldByName('TIPODESTINATARIO').AsString := 'US';
  cdsMensagem.Post;

  Result := _CtrlMensagemCM.ProcessaMensagem( omEnviar, 0, False, True );
end;


destructor TCtrlRADPlus.Destroy;
begin
  _CtrlMensagemCM.Free;
  _DiasUteis.Free;
  IdSMTP.Free;
  inherited;
end;


procedure TCtrlRADPlus.AfterInitialize;
begin
  inherited;
  _CtrlMensagemCM.InitializeAs( Self );
  _DiasUteis.InitializeAs( Self );
  
  cdsMensagem := _CtrlMensagemCM.CdsMensagem;

  RecuperaConfigRAD;
end;


procedure TCtrlRADPlus.RecuperaConfigRAD;
var
  cdsAux : TCMClientDataset;
begin
  cdsAux := TCMClientDataset.Create( nil );
  try

    sSMTPSERVER    := '';
    sNOMEEXIBICAO  := '';
    sUSERNAME      := '';
    sPASSWORD      := '';
    bFLGAUTENTIC   := False;
    iPORTA         := 0;
    bFLGENVIAEMAIL := False;
    bFLGENVIACM    := False;
    iIDREMETENTE   := 0;
    sNOMEREMETENTE := '';
    bFLG24H        := True;
    sHORAINIEXP    := '';
    sHORAFIMEXP    := '';


    //Instruções dentro de um try..except para evitar erros na inicialização
    //dos sistemas
    try
      cdsAux.Data := GetDataPacket(
       ' select e.SMTPSERVER,                           ' +
       '        e.NOMEEXIBICAO,                         ' +
       '        e.USERNAME,                             ' +
       '        e.PASSWORD,                             ' +
       '        e.FLGAUTENTIC,                          ' +
       '        e.PORTA,                                ' +
       '        r.FLGENVIAEMAIL,                        ' +
       '        r.FLGENVIACM,                           ' +
       '        r.IDREMETENTE,                          ' +
       '        r.FLG24H,                               ' +
       '        r.HORAINIEXP,                           ' +
       '        r.HORAFIMEXP,                           ' +
       '        p.NOME as NOMEREMETENTE                 ' +
       ' from   RADPARAM     r,                         ' +
       '        EMAILCONEXAO e,                         ' +
       '        PESSOA       p                          ' +
       ' where  r.IDEMAILCONEXAO = e.IDEMAILCONEXAO (+) ' +
       '   and  r.IDREMETENTE    = p.IDPESSOA       (+) ' );

      if not cdsAux.IsEmpty then
      begin
        sSMTPSERVER    := cdsAux.FieldByName('SMTPSERVER').AsString;
        sNOMEEXIBICAO  := cdsAux.FieldByName('NOMEEXIBICAO').AsString;
        sUSERNAME      := cdsAux.FieldByName('USERNAME').AsString;
        sPASSWORD      := cdsAux.FieldByName('PASSWORD').AsString;
        bFLGAUTENTIC   := ( cdsAux.FieldByName('FLGAUTENTIC').AsInteger = 1 );
        iPORTA         := cdsAux.FieldByName('PORTA').AsInteger;
        bFLGENVIAEMAIL := ( cdsAux.FieldByName('FLGENVIAEMAIL').AsInteger = 1 );
        bFLGENVIACM    := ( cdsAux.FieldByName('FLGENVIACM').AsInteger = 1 );
        iIDREMETENTE   := cdsAux.FieldByName('IDREMETENTE').AsInteger;
        sNOMEREMETENTE := cdsAux.FieldByName('NOMEREMETENTE').AsString;
        bFLG24H        := ( cdsAux.FieldByName('FLG24H').AsInteger = 1 );
        sHORAINIEXP    := cdsAux.FieldByName('HORAINIEXP').AsString;
        sHORAFIMEXP    := cdsAux.FieldByName('HORAFIMEXP').AsString;
      end;

    except
    end;

    IdSMTP.Host     := sSMTPSERVER;
    IdSMTP.UserId   := sUSERNAME;
    IdSMTP.Password := sPASSWORD;
    IdSMTP.Port     := iPORTA;
    if bFLGAUTENTIC then
      IdSMTP.AuthenticationType := atLogin
    else
      IdSMTP.AuthenticationType := atNone;

  finally
    cdsAux.Free;
  end;
end;


procedure TCtrlRADPlus.LimpaMensagensRAD;
begin
  SetLength( aRADMensagens, 0 );
end;

procedure TCtrlRADPlus.IncluiMensagemRAD( iDestinatarioCM    : integer;
                                          sDestinatarioEMail : string;
                                          sAssunto            : string;
                                          sMensagem           : string );
begin
  SetLength( aRADMensagens, length( aRADMensagens ) + 1 );
  aRADMensagens[ High( aRADMensagens ) ].iDestinatarioCM    := iDestinatarioCM;
  aRADMensagens[ High( aRADMensagens ) ].sDestinatarioEMail := sDestinatarioEMail;
  aRADMensagens[ High( aRADMensagens ) ].sAssunto            := sAssunto;
  aRADMensagens[ High( aRADMensagens ) ].sMensagem           := sMensagem;
end;


function TCtrlRADPlus.RecuperaEnderecoEMail(iIdPessoa: integer): string;
var
  cdsAux : TCMClientDataset;
begin
  cdsAux := TCMClientDataset.Create( nil );
  try
    cdsAux.Data := GetDataPacket(
     ' select EMAIL      ' +
     ' from   PESSOA     ' +
     ' where  IDPESSOA = ' + IntToStr( iIdPessoa ) );      
    Result := trim( cdsAux.FieldByName('EMAIL').AsString );
  finally
    cdsAux.Free;
  end;
end;

procedure TCtrlRADPlus.EnviaMensagens;
var
  i : integer;
begin
  //O envio fica dentro de um try..except porquê o não envio de uma mensagem
  //não pode ocasionar um erro
  try

    //Varre o array de mensagens pendentes
    for i := 0 to High( aRADMensagens ) do
    begin

      //Se houver endereço de email, envia-o
      if aRADMensagens[i].sDestinatarioEMail <> '' then
        EnviaEMail( aRADMensagens[i].sDestinatarioEMail,
                    aRADMensagens[i].sAssunto,
                    aRADMensagens[i].sMensagem );

      //Se houver ID de destinatário, envia mensagem CM
      if aRADMensagens[i].iDestinatarioCM > 0 then
        EnviaMensagemCM( iIDREMETENTE, aRADMensagens[i].iDestinatarioCM,
         sNOMEREMETENTE, aRADMensagens[i].sAssunto, aRADMensagens[i].sMensagem );

    end;

  except
  end;

  //Limpar todas mensagens pendentes
  LimpaMensagensRAD;
end;


procedure TCtrlRADPlus.EnviaEMail(sDestinatario, sAssunto, sMensagem: string);
var
  Mensagem: TIdMessage;
begin
  Mensagem := TIdMessage.Create( nil );
  try
    if IdSMTP.Connected then IdSMTP.Disconnect;

    Mensagem.Clear;
    Mensagem.Recipients.Add.Address := sDestinatario;
    Mensagem.From.Address := '"' + sNOMEEXIBICAO + '"';
    Mensagem.Subject      := sAssunto;
    Mensagem.Body.Text    := sMensagem;

    IdSMTP.Connect;

    IdSMTP.Send( Mensagem );

    IdSMTP.Disconnect;
    
  finally
    Mensagem.Free;
    if IdSMTP.Connected then IdSMTP.Disconnect;
  end;
end;

function TCtrlRADPlus.SubstituiTags(strTxt: string; aTags, aConteudos: array of string): string;
var
  i : integer;
begin
  if length( aTags ) <> length( aConteudos ) then exit;
  Result := strTxt;
  for i := 0 to high( aTags ) do
    Result := StringReplace( Result, '<#' + aTags[i] + '>', aConteudos[i], [rfReplaceAll, rfIgnoreCase] );
end;


function TCtrlRADPlus.TraduzFiltro(FiltroProcesso: TFiltroProcesso; sTexto: string;
TipoFiltro: TTipoFiltro; FiltroEtapa: TFiltroEtapa = tfeSemFiltro): string;
begin
  case FiltroProcesso of
     fpComecaCom    : Result := ' LIKE '  + QuotedStr(sTexto + '%');

     fpPossuiTexto  : Result := ' LIKE '  +  QuotedStr('%' + sTexto + '%');

     fpIgual        : begin
                        case TipoFiltro of
                           tfNumero:        Result := ' = '     + sTexto;
                           tfTexto, tfData: Result := ' = ' + QuotedStr(sTexto);
                        end;
                      end;

     fpMaiorQue     : begin
                        case TipoFiltro of
                          tfNumero : Result := ' > '     + sTexto;
                          tfData   : Result := ' > '     + QuotedStr(sTexto)
                        end;
                      end;

     fpMaiorIgualQue : begin
                        case TipoFiltro of
                          tfNumero : Result := ' >= '     + sTexto;
                          tfData   : Result := ' >= '     + QuotedStr(sTexto)
                        end;
                      end;

     fpMenorQue     : begin
                        case TipoFiltro of
                          tfNumero : Result := ' < '     + sTexto;
                          tfData   : Result := ' < '     + QuotedStr(sTexto)
                        end;
                      end;

     fpMenorIgualQue : begin
                        case TipoFiltro of
                          tfNumero : Result := ' <= '     + sTexto;
                          tfData   : Result := ' <= '     + QuotedStr(sTexto)
                        end;
                      end;

     fpDiferente    : begin
                        case TipoFiltro of
                          tfNumero : Result := ' <> '     + sTexto;
                          tfData   : Result := ' <> '     + QuotedStr(sTexto)
                        end;
                      end; //Estão sendo considerados números
  end;


  //Para tratar as etapas
  case FiltroEtapa of
     tfeUltima:    Result :=  ' ';
     tfeQualquer:  Result :=  ' ';
  end;

end;


function TCtrlRADPlus.EtapasValidasDeProcessos( aIdProcesso: array of Integer): OLEVariant;
var
  i : integer;
  sAux, sIn : string;
begin

  for i := 0 to High( aIdProcesso ) do
  begin
    sAux := IntToStr( aIdProcesso[i] );
    if Pos( ' ' + sAux + ', ', sIn ) <= 0 then
      sIn := sIn + ' ' + sAux + ', ';
  end;

  sIn := Copy( sIn, 1, length( sIn ) - 2 ); 

  Result := GetDataPacket(
   ' select rep.IDPROCESSO,                                                                                 ' +
   '        rep.SEQETAPA,                                                                                   ' +
   '        re.DESCRICAO,                                                                                   ' +
   '        decode( rep.FLGOK, ''S'', ''Aprovado'', ''R'', ''Recusado'', ''N'', ''Pendente'' ) as SITETAPA, ' +
   '        p.NOME as APROVADOR,                                                                            ' +
   '        decode( repu.FLGOK, ''S'', ''Aprovação'', ''R'', ''Recusa'' ) as SITAPROVACAO,                  ' +
   '        repu.DATAHORA                                                                                   ' +
   ' from   RADETAPA        re   ,                                                                          ' +
   '        RADETAPAPROC    rep  ,                                                                          ' +
   '        RADETAPAPROCUSU repu ,                                                                          ' +
   '        PESSOA          p                                                                               ' +
   ' where  re.IDRADETAPA      = rep.IDRADETAPA                                                             ' +
   '   and  rep.IDRADETAPAPROC = repu.IDRADETAPAPROC (+)                                                    ' +
   '   and  repu.IDUSUARIO     = p.IDPESSOA (+)                                                             ' +
   '   and  rep.IDPROCESSO     in ( ' + sIn + ' )                                                           ' +
   '   and  rep.SEQETAPA       = ( select max( rep2.SEQETAPA )                                              ' +
   '                               from   RADETAPAPROC rep2                                                 ' +
   '                               where  rep2.IDRADETAPA = rep.IDRADETAPA                                  ' +
   '                                 and  rep2.IDPROCESSO = rep.IDPROCESSO )                                ' +
   ' order by rep.IDPROCESSO,                                                                               ' +
   '          rep.SEQETAPA ,                                                                                ' +
   '          repu.DATAHORA                                                                                 ' );
end;


function TCtrlRADPlus.ConsultaProcessos( const iIdUsuario   : integer;
                                         var iQtde          : integer;
                                         var iQtdeTerceiros : integer;
                                         bEmAtraso          : boolean = True  ;
                                         bEmDia             : boolean = True  ;
                                         bTerceiros         : boolean = True  ;
                                         bSubstituicao      : boolean = False ;
                                         ftProcesso         : TFiltroProcesso = fpSemFiltro;
                                         uProcesso          : string = '0';
                                         ftTipoProcesso     : TFiltroProcesso = fpSemFiltro;
                                         uTipoProcesso      : string = '';
                                         ftUsuarioSolic     : TFiltroProcesso = fpSemFiltro;
                                         uUsuarioSolic      : string = '';
                                         ftUsuarioAprov     : TFiltroProcesso = fpIgual;
                                         uUsuarioAprov      : string = '';
                                         fteUsuarioAprov    : TFiltroEtapa    = tfeSemFiltro;
                                         ftDataIniProcesso  : TFiltroProcesso = fpSemFiltro;
                                         uDataIniProcesso   : string = '';
                                         ftDataFimProcesso  : TFiltroProcesso = fpSemFiltro;
                                         uDataFimProcesso   : string = '';
                                         ftSituProcesso     : TFiltroProcesso = fpIgual;
                                         uSituProcesso      : string = 'N'; //valor default => pendente = EmAberto
                                         ftValor            : TFiltroProcesso = fpSemFiltro;
                                         uValor             : string = '0';
                                         ftCentroCusto      : TFiltroProcesso = fpSemFiltro;
                                         uCentroCusto       : string = '';
                                         ftCentroRespon     : TFiltroProcesso = fpSemFiltro;
                                         uCentroRespon      : string = '';
                                         ftGrupoProduto     : TFiltroProcesso = fpSemFiltro;
                                         uGrupoProduto      : string = '';
                                         ftAtividadeProjeto : TFiltroProcesso = fpSemFiltro;
                                         uAtividadeProjeto  : string = '';
                                         ftTipoDoc          : TFiltroProcesso = fpSemFiltro;
                                         uTipoDoc           : string = '';
                                         ftGrupoAprov       : TFiltroProcesso = fpSemFiltro;
                                         uGrupoAprov        : string = '';
                                         fteGrupoAprov      : TFiltroEtapa    = tfeSemFiltro;
                                         uRessalva          : string = '0';
                                         fteRessalva        : TFiltroEtapa    = tfeSemFiltro;
                                         bModoConsulta      : boolean = False ) : OLEVariant;
var
  sSQLFiltro : TStringList;
  cdsUsuGrupo,
  cdsDados,
  cdsEtapa,
  cdsAtrasados    : TCMClientDataset;
  iProxIdRadEtapa, iNumEtapa : integer;
  sMsgErro, sSQL, sSQLAux, sListaTerc : string;

      function EstaEmAtraso: boolean;
      begin
         Result := False;

         //Quando ambos os prazos foram definidos
         if (not cdsDados.FieldByName('DATAFIMPREVPROC').IsNull) and
            (not cdsDados.FieldByName('DATAFIMPREVETAPA').IsNull) then
         begin
           if (cdsDados.FieldByName('DATAFIMPREVPROC').AsDateTime < Now ) or
              (cdsDados.FieldByName('DATAFIMPREVETAPA').AsDateTime < Now) then
              Result := True;
         end;

         //Quando o fim previsto do prazo para o processo não foi definido
         if (cdsDados.FieldByName('DATAFIMPREVPROC').IsNull) then
         begin
            if (cdsDados.FieldByName('DATAFIMPREVETAPA').IsNull) then
                Result := False
            else
            begin
                if (cdsDados.FieldByName('DATAFIMPREVETAPA').AsDateTime < Now) then
                     Result := True
                else
                     Result := False;
            end
         end
         else
         begin
            //Quando o fim previsto do prazo para a etapa não foi definido.
            if (cdsDados.FieldByName('DATAFIMPREVETAPA').IsNull) then
            begin
               if (cdsDados.FieldByName('DATAFIMPREVPROC').AsDateTime < Now) then
                  Result := True
               else
                  Result := False;
            end;
         end;
      end;

  function MontaFiltroConsulta: string;
  begin

     try
       sSQLFiltro := TStringList.Create;

       //Filtro do processo
       if ( StrToIntDef( uProcesso, 0 ) > -1 ) then
          sSQLFiltro.Add(' AND RIP.IDPROCESSO ' + (TraduzFiltro(ftProcesso, uProcesso, tfNumero)));

       //Tipo de Processo
       if (uTipoProcesso <> '') then
          sSQLFiltro.Add(' AND UPPER(RTP.NOME) ' + (TraduzFiltro(ftTipoProcesso, uTipoProcesso, tfTexto)));

       //Usuário Solicitante
       if (uUsuarioSolic <> '') then
          sSQLFiltro.Add(' AND UPPER(ususolic.NOMEUSUARIO) ' + (TraduzFiltro(ftUsuarioSolic, uUsuarioSolic, tfTexto)));

       //Início do processo
       if (uDataIniProcesso <> '') then
          sSQLFiltro.Add(' AND TRUNC(RIP.DATAINIPROCESSO) ' + (TraduzFiltro(ftDataIniProcesso, uDataIniProcesso, tfData)));

       //Término do processo
       if (uDataFimProcesso <> '') then
          sSQLFiltro.Add(' AND TRUNC(RIP.DATAFIMPROCESSO) ' + (TraduzFiltro(ftDataFimProcesso, uDataFimProcesso, tfData)));

       //Situação do processo
       if (uSituProcesso <> '') then
       begin
          uSituProcesso := uSituProcesso[1]; //R - recusado ou E - excluído
          case uSituProcesso[1] of
             'A': uSituProcesso := 'S';
             'P': uSituProcesso := 'N';
             'R': uSituProcesso := 'R'; //não varia
             'E': uSituProcesso := 'E'; //não varia
          else
             uSituProcesso := '0'; // situação inválida (zero)
          end;

          sSQLFiltro.Add(' AND UPPER(RIP.FLGOK) ' + (TraduzFiltro(ftSituProcesso, uSituProcesso, tfTexto)));
       end;

       //Valor
       if ( StrToIntDef( uValor, -1 ) > -1 ) then
          sSQLFiltro.Add(' AND RIP.VLRPROC ' + (TraduzFiltro(ftValor, uValor, tfNumero)));

       //Centro de Custo
       if (uCentroCusto <> '') then
          sSQLFiltro.Add(' AND UPPER(CC.NOME) ' + (TraduzFiltro(ftCentroCusto, uCentroCusto, tfTexto)));

       //Centro de Responsabilidade
       if (uCentroRespon <> '') then
          sSQLFiltro.Add(' AND UPPER(CR.NOME) ' + (TraduzFiltro(ftCentroRespon, uCentroRespon, tfTexto)));

       //Grupo de Produtos
       if (uGrupoProduto <> '') then
          sSQLFiltro.Add(' AND UPPER(GRP.DESCGRUPOPROD) ' + (TraduzFiltro(ftGrupoProduto, uGrupoProduto, tfTexto)));

       //Atividade de Projeto
       if (uAtividadeProjeto <> '') then
          sSQLFiltro.Add(' AND UPPER(UN.NOME) ' + (TraduzFiltro(ftAtividadeProjeto, uAtividadeProjeto, tfTexto)));

       //Tipo de documento
       if (uTipoDoc <> '') then
          sSQLFiltro.Add(' AND UPPER(TPRP.DESCRICAO) ' + (TraduzFiltro(ftTipoDoc, uTipoDoc, tfTexto)));

       //Usuário Aprovador
       if (uUsuarioAprov <> '') then
       begin
          sSQLFiltro.Add( ' AND  ( exists ( SELECT repu3.idradetapaproc                       ' +
                          '                 FROM   radetapaprocusu repu3 ,                    ' +
                          '                        radetapaproc    rep3  ,                    ' +
                          '                        usuariosistema  usu3                       ' +   
                          '                 WHERE  repu3.idradetapaproc = rep3.idradetapaproc ' +
                          '                   AND  repu3.idusuario      = usu3.idusuario      ' +
                          '                   AND  rep3.idprocesso      = rip.idprocesso      ' +
                          '                   AND  upper( usu3.nomeusuario ) ' + ( TraduzFiltro( ftUsuarioAprov, uUsuarioAprov, tfTexto ) ) );

          if fteUsuarioAprov = tfeUltima then
            sSQLFiltro.Add( '                 AND  rep3.seqetapa = ( select max( rep4.seqetapa )                ' +
                            '                                        from   radetapaproc rep4                   ' +
                            '                                        where  rep4.idprocesso = rep3.idprocesso ) ' );

          sSQLFiltro.Add( ' ) ) ' );
       end;

       //Usuário Aprovador
       if (uGrupoAprov <> '') then
       begin
          sSQLFiltro.Add( ' AND  ( exists ( SELECT rep5.idradetapaproc                 ' +
                          '                 FROM   radetapaproc    rep5  ,             ' +
                          '                        radetapa        re5   ,             ' +
                          '                        radgrprespon    rgr5                ' +
                          '                 WHERE  rep5.idradetapa  = re5.idradetapa   ' +
                          '                   AND  re5.idgrprespon  = rgr5.idgrprespon ' +
                          '                   AND  rep5.idprocesso  = rip.idprocesso   ' +
                          '                   AND  upper( rgr5.nome ) ' + ( TraduzFiltro( ftGrupoAprov, uGrupoAprov, tfTexto ) ) );

          if fteGrupoAprov = tfeUltima then
            sSQLFiltro.Add( '                 AND  rep5.seqetapa = ( select max( rep6.seqetapa )                ' +
                            '                                        from   radetapaproc rep6                   ' +
                            '                                        where  rep6.idprocesso = rep5.idprocesso ) ' );

          sSQLFiltro.Add( ' ) ) ' );
       end;

       //Ressalva em aprovações
       if ( uRessalva <> '0' ) then
       begin
          sSQLFiltro.Add( ' AND  ( exists ( SELECT repu7.idradetapaproc                       ' +
                          '                 FROM   radetapaprocusu repu7 ,                    ' +
                          '                        radetapaproc    rep7                       ' +
                          '                 WHERE  repu7.flgressalva = 1                      ' +
                          '                   AND  repu7.idradetapaproc = rep7.idradetapaproc ' +
                          '                   AND  rep7.idprocesso = rip.idprocesso           ' );

          if fteRessalva = tfeUltima then
            sSQLFiltro.Add( '                 AND  rep7.seqetapa = ( select max( rep8.seqetapa )                ' +
                            '                                        from   radetapaproc rep8                   ' +
                            '                                        where  rep8.idprocesso = rep7.idprocesso ) ' );

          sSQLFiltro.Add( ' ) ) ' );
       end;

       Result := sSQLFiltro.Text;

     finally
       FreeAndNil(sSQLFiltro);
     end;
  end;

begin

  cdsUsuGrupo  := TCMClientDataset.Create( nil );
  cdsDados     := TCMClientDataset.Create( nil );
  cdsAtrasados := TCMClientDataset.Create( nil );
  cdsEtapa     := TCMClientDataset.Create( nil );
  try

    //Recupera todos processos que encontram-se pendentes de autorização do usuário
    sSQL :=
     ' select   rip.IDPROCESSO,                                                                      ' +
     '          rtp.IDRADTIPOPROC,                                                                   ' +
     '          rep.IDRADETAPAPROC,                                                                  ' +
     '          rip.DATAINIPROCESSO,                                                                 ' +
     '          rip.DATAFIMPROCESSO,                                                                 ' +
     '          rip.DATAFIMPREV as DATAFIMPREVPROC,                                                  ' +
     '          rtp.NOME,                                                                            ' +
     '          rip.OBS,                                                                             ' +
     '          decode( rip.FLGOK, ''S'', ''Aprovado'', ''R'', ''Recusado'', ''E'', ''Excluído'',    ' +
     '                  ''N'', ''Pendente'' ) as SITUACAO,                                           ' +
     '          re.DESCRICAO AS NOMEETAPA,                                                           ' +
     '          rep.DATAINIETAPA,                                                                    ' +
     '          rep.DATAFIMETAPA,                                                                    ' +
     '          rep.DATAFIMPREV AS DATAFIMPREVETAPA,                                                 ' +
     '          ususolic.NOMEUSUARIO,                                                                ' +
     '          decode( rtp.IDREFERENCIA, null, '''', ''['' || to_char( rr.IDREFERENCIA, ''00'' ) || ' +
     '            ''] '' ||  rr.DESCREFERENCIA ) as DESCREFERENCIA,                                  ' +
     '          rr.IDREFERENCIA,                                                                     ' ;

    if not bModoConsulta then
      sSQL := sSQL +
       '          rrg.FLGSUBSTITUTO,                                                                   ' +
       '          DECODE( rrg.FLGSUBSTITUTO, 1, 4, 0 ) as CLASSIFICACAO,                            ' +
       '          DECODE( rrg.FLGSUBSTITUTO, 1, ''Substituição'', ''123456789012345'') as CLASSIFEXIBICAO, '
    else
      sSQL := sSQL +
       '          0 as FLGSUBSTITUTO,                                                                  ' +
       '          0 as CLASSIFICACAO,                                                                   ' +
       '          ''               ''  as CLASSIFEXIBICAO,                                               ' ;

    sSQL := sSQL +
     '          re.IDRADETAPA,                                                                       ' +
     '          re.NUMERO,                                                                           ' +
     '          re.FLGPODERETORNAR,                                                                  ' +
     '          re.FLGPODERECUSAR,                                                                   ' +
     '          cr.NOME AS CRESPON,                                                                  ' +
     '          tprp.DESCRICAO AS TIPODOC,                                                           ' +
     '          cc.NOME AS CCUSTO,                                                                   ' +
     '          grp.DESCGRUPOPROD,                                                                   ' +
     '          un.NOME AS UNIDNEGOC,                                                                ' +
     '          NVL(rip.VLRPROC, 0) AS VALOR,                                                                ' +
     '          re.FLGACAOAPROVA,                                                                    ' +
     '          rep.SEQETAPA,                                                                        ' +
     '          rgr.NOME as NOMEGRUPO,                                                               ' +
     '          0 as TERCEIROS                                                                       ' +

     //amf 18.05.2007 25280 - status da etapa
     '         ,rep.FLGOK as EtapaStatus,                                                            ' +
     '          rip.FLGOK                                                                            ' +

     ' FROM     RADGRPRESPON    rgr         ,                                                        ' +
     '          RADETAPA        re          ,                                                        ' +
     '          RADETAPAPROC    rep         ,                                                        ' +
     '          RADINSTPROCESSO rip         ,                                                        ' +
     '          RADTIPOPROC     rtp         ,                                                        ' +
     '          RADREFERENCIA   rr          ,                                                        ' ;

    if not bModoConsulta then
      sSQL := sSQL +
       '          USUARIOSISTEMA  usuaprov  ,                                                        ' +
       '          RADRESPONXGRP   rrg       ,                                                        ' ;

    sSQL := sSQL +
     '          USUARIOSISTEMA  ususolic    ,                                                        ' +
     '          CENTRESPON      cr          ,                                                        ' +
     '          TIPODOCRECPAG   tprp        ,                                                        ' +
     '          CENTCUST        cc          ,                                                        ' +
     '          GRUPPROD        grp         ,                                                        ' +
     '          UNIDNEGOCIO     un                                                                   ' +
     ' WHERE    ( rgr.IDGRPRESPON     = re.IDGRPRESPON                   )                           ' +
     '   AND    ( rep.IDRADETAPA      = re.IDRADETAPA                    )                           ' +
     '   AND    ( rip.IDPROCESSO      = rep.IDPROCESSO                   )                           ' +
     '   AND    ( re.IDRADTIPOPROC    = rtp.IDRADTIPOPROC                )                           ' +
     '   AND    ( rip.IDRADTIPOPROC   = rtp.IDRADTIPOPROC                )                           ' +
     '   AND    ( rtp.IDREFERENCIA    = rr.IDREFERENCIA (+)              )                           ' +
     '   AND    ( re.IDGRPRESPON      = rgr.IDGRPRESPON                  )                           ' +
     '   AND    ( rip.FLGVERSAORAD    = ''+''                            )                           ' +
     '   AND    ( rip.IDUSUARIO       = ususolic.IDUSUARIO               )                           ' +
     '   AND    ( rip.CODCENTROCUSTO  = cc.CODCENTROCUSTO  (+)           )                           ' +
     '   AND    ( rip.CODCENTRORESPON = cr.CODCENTRORESPON (+)           )                           ' +
     '   AND    ( rip.CODGRUPOPROD    = grp.CODGRUPOPROD   (+)           )                           ' +
     '   AND    ( rip.UNIDNEGOC       = un.UNIDNEGOC       (+)           )                           ' +
     '   AND    ( rip.CODTIPDOC       = tprp.CODTIPDOC     (+)           )                           ' +
     ' AND ( rep.seqetapa = ( select max( rep2.SEQETAPA )                                            ' +
     '                        from RADETAPAPROC rep2                                                 ' +
     '                        where rep2.IDPROCESSO = rep.IDPROCESSO )   )                           ' ;

    if not bModoConsulta then
      sSQL := sSQL +
       '   AND   ( rrg.IDGRPRESPON     = rgr.IDGRPRESPON                  )                          ' +
       '   AND   ( rrg.IDUSUARIO       = usuaprov.IDUSUARIO               )                          ' ;

    if not bModoConsulta then
    begin
      sSQL := sSQL +
       '   AND ( rep.FLGOK  = ''N''                            )                                      ' +
       '   AND ( rip.FLGOK  = ''N''                            )                                      ' +
       '   AND ( usuaprov.IDUSUARIO       = ' + IntToStr( iIdUsuario ) +  '  )                        ' +
       '   AND ( usuaprov.IDUSUARIO not in ( select REPU2.IDUSUARIO                                   ' +
       '                                     from   RADETAPAPROCUSU repu2                             ' +
       '                                     where  repu2.IDRADETAPAPROC = rep.IDRADETAPAPROC ) )     ' ;

      if not bSubstituicao then
        sSQL := sSQL + ' AND nvl( RRG.FLGSUBSTITUTO, 0 ) = 0 ';
    end;

    if bEmAtraso and ( not bEmDia ) then
    begin
      if bModoConsulta then
        sSQL := sSQL +
         ' and RIP.DATAFIMPREV is not null                                                          ' +
         ' and RIP.DATAFIMPREV <= decode( RIP.DATAFIMPROCESSO, null, sysdate, RIP.DATAFIMPROCESSO ) '
      else
        sSQL := sSQL +
         '  AND  ( ( RIP.DATAFIMPREV IS NOT NULL ) AND ' +
         '         ( ( RIP.DATAFIMPREV <= SYSDATE ) OR ( REP.DATAFIMPREV <= SYSDATE ) ) ) ';
    end;


    if bEmDia and ( not bEmAtraso ) then
    begin
      if bModoConsulta then
        sSQL := sSQL +
         ' and ( ( RIP.DATAFIMPREV is null )                                                                                         ' +
         '  or ( ( RIP.DATAFIMPREV is not null ) and ( RIP.DATAFIMPREV > decode( DATAFIMPROCESSO, null, sysdate, DATAFIMPROCESSO ) ) ) ) '
      else
        sSQL := sSQL +
         ' AND ( ( RIP.DATAFIMPREV IS NULL ) OR ' +
         '       ( ( RIP.DATAFIMPREV > SYSDATE ) AND ( REP.DATAFIMPREV > SYSDATE ) ) ) ';
    end;


    if ( not bEmDia ) and ( not bEmAtraso ) then
      sSQL := sSQL + ' AND 1 = 2 ';


    if not bModoConsulta then
    begin

      sListaTerc := '';

      //Recupera os processos pendentes de autorizações de terceiros que encontram-se atrasados
      if bTerceiros and ( bEmDia or bEmAtraso ) then
      begin

        sSQLAux :=
         ' select rip.IDPROCESSO                 ,                                                    ' +
         '        rip.CODCENTROCUSTO             ,                                                    ' +
         '        rip.CODCENTRORESPON            ,                                                    ' +
         '        rip.CODGRUPOPROD               ,                                                    ' +
         '        rip.UNIDNEGOC                  ,                                                    ' +
         '        rip.CODTIPDOC                  ,                                                    ' +
         '        rip.VLRPROC                    ,                                                    ' +
         '        re.IDRADTIPOPROC               ,                                                    ' +
         '        re.IDRADETAPA                  ,                                                    ' +
         '        rgr.NOME                       ,                                                    ' +
         '        re.NUMERO                      ,                                                    ' +
         '        atr.IDGRPRESPON                ,                                                    ' +
         '        atr.NUMERO as NUMEROETAPAATUAL ,                                                    ' +
         '        atr.DATAFIMPREVETAPA           ,                                                    ' +
         '        atr.DATAFIMPREVPROC                                                                 ' +
         ' from   RADETAPA        re  ,                                                               ' +
         '        RADGRPRESPON    rgr ,                                                               ' +
         '        RADRESPONXGRP   rrg ,                                                               ' +
         '        RADTIPOPROC     rtp ,                                                               ' +
         '        RADINSTPROCESSO rip ,                                                               ' +
         '        ( select rip2.IDPROCESSO,                                                           ' +
         '                 re2.NUMERO,                                                                ' +
         '                 re2.IDGRPRESPON,                                                           ' +
         '                 rep2.DATAFIMPREV as DATAFIMPREVETAPA,                                      ' +
         '                 rip2.DATAFIMPREV as  DATAFIMPREVPROC                                       ' +
         '          from   RADETAPAPROC    rep2  ,                                                    ' +
         '                 RADETAPA        re2   ,                                                    ' +
         '                 RADINSTPROCESSO rip2                                                       ' +
         '          where  rip2.FLGOK = ''N''                                                         ' +
         '            and  rep2.FLGOK = ''N''                                                         ' +
         '            and  rep2.IDRADETAPA  = re2.IDRADETAPA                                          ' +
         '            and  rep2.IDPROCESSO  = rip2.IDPROCESSO                                         ' +
         '            and  rip2.DATAFIMPREV is not null                                               ' ;

        if bEmAtraso and ( not bEmDia ) then
          sSQLAux := sSQLAux +
           ' and ( ( rep2.DATAFIMPREV < sysdate ) or ( rip2.DATAFIMPREV < sysdate ) ) ';

        if bEmDia and ( not bEmAtraso ) then
          sSQLAux := sSQLAux +
           ' and ( ( rip2.DATAFIMPREV is null ) or ( ( rep2.DATAFIMPREV >= sysdate ) and ( rip2.DATAFIMPREV >= sysdate ) ) )';

        sSQLAux := sSQLAux +
         '        ) atr                                                                               ' +
         ' where  re.IDGRPRESPON              = rgr.IDGRPRESPON                                       ' +
         '   and  rgr.IDGRPRESPON             = rrg.IDGRPRESPON                                       ' +
         '   and  re.IDRADTIPOPROC            = rtp.IDRADTIPOPROC                                     ' +
         '   and  rtp.IDRADTIPOPROC           = rip.IDRADTIPOPROC                                     ' +
         '   and  nvl( rrg.FLGSUBSTITUTO, 0 ) = 0                                                     ' +
         '   and  rrg.IDUSUARIO               = ' + IntToStr( iIdUsuario )                              +
         '   and  rip.IDPROCESSO              = atr.IDPROCESSO                                        ' +
         '   and  re.NUMERO                   > atr.NUMERO                                            ' ;

        //Busca todos os processos em que o grupo do usuário se encontra e que estão com etapas anteriores à sua atrasadas
        cdsAtrasados.Data := GetDataPacket( sSQLAux );

        //Para cada processo, executa simulação para verificar se as condições permitem ao processo chegar ao usuário
        cdsAtrasados.First;
        while not cdsAtrasados.Eof do
        begin
          //Seta as propriedades do processo
          InicializaPropriedades;
          FCodCentroCusto  := cdsAtrasados.FieldByName('CODCENTROCUSTO').AsString;
          FCodCentroRespon := cdsAtrasados.FieldByName('CODCENTRORESPON').AsString;
          FCodGrupoProd    := cdsAtrasados.FieldByName('CODGRUPOPROD').AsString;
          FUnidNegoc       := cdsAtrasados.FieldByName('UNIDNEGOC').AsInteger;
          FCodTipDoc       := cdsAtrasados.FieldByName('CODTIPDOC').AsInteger;
          FVlrProc         := cdsAtrasados.FieldByName('VLRPROC').AsFloat;

          //Verifica se o usuário está no grupo atrasado. Se estiver, não incui o registro, pois ele aparecerecia duplicado
          cdsUsuGrupo.Data := GetDataPacket( ' select *             ' +
                                             ' from   RADRESPONXGRP ' +
                                             ' where  IDUSUARIO   = ' + IntToStr( iIdUsuario ) +
                                             '   and  IDGRPRESPON = ' + cdsAtrasados.FieldByName('IDGRPRESPON').AsString );
          if cdsUsuGrupo.RecordCount > 0 then
          begin
            cdsAtrasados.Next;
            Continue;
          end;

          iNumEtapa := cdsAtrasados.FieldByName('NUMEROETAPAATUAL').AsInteger;

          while iNumEtapa > 0 do
          begin
            //Verifica qual é a próxima etapa
            iProxIdRadEtapa := VerificaProximaEtapa( cdsAtrasados.FieldByName('IDRADTIPOPROC').AsInteger,
                                                     cdsAtrasados.FieldByName('IDPROCESSO').AsInteger,
                                                     iNumEtapa, sMsgErro );

            //Se houve erro, não inclui o registro
            if sMsgerro <> '' then break;

            //Se concluiu o processo, não inclui o registro
            if iProxIdRadEtapa = -1 then
              iNumEtapa := -1
            else
            begin
              //Pega o número da próxima etapa
              cdsEtapa.Data := GetDataPacket(
               ' select   NUMERO                                       ' +
               ' from     RADETAPA                                     ' +
               ' where    IDRADETAPA = ' + IntToStr( iProxIdRadEtapa ) ) ;

              //Atualiza o número da etapa
              iNumEtapa := cdsEtapa.FieldByName('NUMERO').AsInteger;

              //Se o número da etapa for aquele em que o usuário atual irá aprovar...
              if iNumEtapa = cdsAtrasados.FieldByName('NUMERO').AsInteger then
              begin
                if sListaTerc <> '' then
                  sListaTerc := sListaTerc + ', ';
                sListaTerc := sListaTerc + cdsAtrasados.FieldByName('IDPROCESSO').AsString;
                break;
              end;

            end;

          end;

          cdsAtrasados.Next;
        end;

      end;

      if sListaTerc <> '' then
      begin
        sSQL := sSQL +
         ' union                                                                                         ' +
         ' select   rip.IDPROCESSO,                                                                      ' +
         '          rtp.IDRADTIPOPROC,                                                                   ' +
         '          rep.IDRADETAPAPROC,                                                                  ' +
         '          rip.DATAINIPROCESSO,                                                                 ' +
         '          rip.DATAFIMPROCESSO,                                                                 ' +
         '          rip.DATAFIMPREV as DATAFIMPREVPROC,                                                  ' +
         '          rtp.NOME,                                                                            ' +
         '          rip.OBS,                                                                             ' +
         '          decode( rip.FLGOK, ''S'', ''Aprovado'', ''R'', ''Recusado'', ''E'', ''Excluído'',    ' +
         '                  ''N'', ''Pendente'' ) as SITUACAO,                                           ' +
         '          re.DESCRICAO AS NOMEETAPA,                                                           ' +
         '          rep.DATAINIETAPA,                                                                    ' +
         '          rep.DATAFIMETAPA,                                                                    ' +
         '          rep.DATAFIMPREV AS DATAFIMPREVETAPA,                                                 ' +
         '          ususolic.NOMEUSUARIO,                                                                    ' +
         '          decode( rtp.IDREFERENCIA, null, '''', ''['' || to_char( rr.IDREFERENCIA, ''00'' ) || ' +
         '            ''] '' ||  rr.DESCREFERENCIA ) as DESCREFERENCIA,                                  ' +
         '          rr.IDREFERENCIA,                                                                     ' +
         '          0 as FLGSUBSTITUTO,                                                                  ' +
         '          3 as CLASSIFICACAO,                                                                   ' +
         '          ''Terceiros'' as CLASSIFEXIBICAO,                                                      ' +
         '          re.IDRADETAPA,                                                                       ' +
         '          re.NUMERO,                                                                           ' +
         '          re.FLGPODERETORNAR,                                                                  ' +
         '          re.FLGPODERECUSAR,                                                                   ' +
         '          cr.NOME AS CRESPON,                                                                  ' +
         '          tprp.DESCRICAO AS TIPODOC,                                                           ' +
         '          cc.NOME AS CCUSTO,                                                                   ' +
         '          grp.DESCGRUPOPROD,                                                                   ' +
         '          un.NOME AS UNIDNEGOC,                                                                ' +
         '          NVL(rip.VLRPROC, 0) AS VALOR,                                                                ' +
         '          re.FLGACAOAPROVA,                                                                    ' +
         '          rep.SEQETAPA,                                                                        ' +
         '          rgr.NOME as NOMEGRUPO,                                                               ' +
         '          1 as TERCEIROS                                                                       ' +

         //amf 30.08.2007 26255
         '         ,rep.FLGOK as EtapaStatus,                                                            ' +
         '          rip.FLGOK                                                                            ' +

         ' FROM     RADGRPRESPON    rgr  ,                                                               ' +
         '          RADETAPA        re   ,                                                               ' +
         '          RADETAPAPROC    rep  ,                                                               ' +
         '          RADINSTPROCESSO rip  ,                                                               ' +
         '          RADTIPOPROC     rtp  ,                                                               ' +
         '          RADREFERENCIA   rr   ,                                                               ' +
         '          USUARIOSISTEMA  ususolic ,                                                           ' +
         '          CENTRESPON      cr   ,                                                               ' +
         '          TIPODOCRECPAG   tprp ,                                                               ' +
         '          CENTCUST        cc   ,                                                               ' +
         '          GRUPPROD        grp  ,                                                               ' +
         '          UNIDNEGOCIO     un                                                                   ' +
         ' WHERE    ( rgr.IDGRPRESPON     = re.IDGRPRESPON                   ) AND                       ' +
         '          ( rep.IDRADETAPA      = re.IDRADETAPA                    ) AND                       ' +
         '          ( rip.IDPROCESSO      = rep.IDPROCESSO                   ) AND                       ' +
         '          ( re.IDRADTIPOPROC    = rtp.IDRADTIPOPROC                ) AND                       ' +
         '          ( rip.IDRADTIPOPROC   = rtp.IDRADTIPOPROC                ) AND                       ' +
         '          ( rtp.IDREFERENCIA    = rr.IDREFERENCIA (+)              ) AND                       ' +
         '          ( re.IDGRPRESPON      = rgr.IDGRPRESPON                  ) AND                       ' +
         '          ( rip.FLGOK           = ''N''                            ) AND                       ' +
         '          ( rep.FLGOK           = ''N''                            ) AND                       ' +
         '          ( rip.FLGVERSAORAD    = ''+''                            ) AND                       ' +
         '          ( rip.IDUSUARIO       = ususolic.IDUSUARIO               ) AND                       ' +
         '          ( rip.CODCENTROCUSTO  = cc.CODCENTROCUSTO  (+)           ) AND                       ' +
         '          ( rip.CODCENTRORESPON = cr.CODCENTRORESPON (+)           ) AND                       ' +
         '          ( rip.CODGRUPOPROD    = grp.CODGRUPOPROD   (+)           ) AND                       ' +
         '          ( rip.UNIDNEGOC       = un.UNIDNEGOC       (+)           ) AND                       ' +
         '          ( rip.CODTIPDOC       = tprp.CODTIPDOC     (+)           ) AND                       ' +
         '          ( rip.IDPROCESSO      in ( ' + sListaTerc + ' )          )                           ' ;

      end;
    end;

    if bModoConsulta then
      sSQL := sSQL + ( MontaFiltroConsulta );

    sSQL := sSQL + ' order by 1 asc ';

    cdsDados.Data := GetDataPacket( sSQL );

    //Quantidade de processos pendentes de autorização
    iQtde := cdsDados.RecordCount;

    //Quantidade de processos pendentes de autorização de terceiros e atrasados
    iQtdeTerceiros := 0;

    cdsDados.First;
    while not cdsDados.Eof do
    begin

      if cdsDados.FieldByName('TERCEIROS').AsInteger = 1 then
        inc( iQtdeTerceiros )
      else
      begin

        if cdsDados.FieldByName('FLGSUBSTITUTO').AsInteger = 0 then
        begin
             cdsDados.Edit;
             if (EstaEmAtraso) then
             begin
               cdsDados.FieldByName('CLASSIFICACAO').AsString  := '1';
               cdsDados.FieldByName('CLASSIFEXIBICAO').AsString := 'Em atraso';
             end
             else
             begin
               cdsDados.FieldByName('CLASSIFICACAO').AsString  := '2';
               cdsDados.FieldByName('CLASSIFEXIBICAO').AsString := 'Em dia';
             end;

             cdsDados.Post;
        end;
      end;

      cdsDados.Next;
    end;

    Result := cdsDados.Data;
  finally
    cdsUsuGrupo.Free;
    cdsDados.Free;
    cdsAtrasados.Free;
    cdsEtapa.Free;
  end;

end;


function TCtrlRADPlus.ProcessoConcluido(iIdProcesso: integer): Boolean;
var
  sSQL: String;
begin
  sSQL := ' SELECT FLGOK FROM RADINSTPROCESSO ' +
          ' WHERE IDPROCESSO = ' + FloatToStr( iIdProcesso );

  _Cds.Data := GetDataPacket( sSQL );

  Result := ( _Cds.FieldByName( 'FLGOK' ).asString = 'S' );
end;


function TCtrlRADPlus.SituacaoProcesso(iIdProcesso: integer): string;
var
  sSQL: String;
begin
  sSQL := ' SELECT FLGOK FROM RADINSTPROCESSO ' +
          ' WHERE IDPROCESSO = ' + FloatToStr( iIdProcesso );

  _Cds.Data := GetDataPacket( sSQL );

  Result := trim( UpperCase( _Cds.FieldByName( 'FLGOK' ).asString ) );
end;


function TCtrlRADPlus.RecuperaVersaoRAD( iIdEmpresa : integer = 0 ): string;
var
  sSQL : string;
begin
  sSQL := ' SELECT FLGRAD FROM EMPRESAPROP ';
  if iIdEmpresa > 0 then sSQL := sSQL + ' WHERE IDPESSOA = ' + IntToStr( iIdEmpresa );
  _Cds.Data := GetDataPacket( sSQL );
  Result := trim( UpperCase( _Cds.FieldByName( 'FLGRAD' ).asString ) );
  if Result = 'N' then Result := '';
end;


procedure TCtrlRADPlus.RADDebug(_str: string);
begin
end;

function TCtrlRADPlus.ProcessoRADModificado(olvprocrad: OleVariant): boolean;
var
  _cdsEtapaAtual: TClientDataSet;
  _cdsProcRADTela: TClientDataSet;

  //amf 21.05.2007 25280 - indica que o(s) processo(s) RAD que usuário selecionou sofreram modificações no banco.
  bIgualAoDb: boolean;
begin
  try
     bIgualAoDb  := False;
     Result      := False;

     _cdsEtapaAtual      := TClientDataSet.Create(nil);

     _cdsProcRadTela      := TClientDataSet.Create(nil);
     _cdsProcRadTela.Data := olvprocRAD;

     //amf 18.05.2007 25280 - Para buscar os dados da etapa...
     while (not _cdsProcRadTela.Eof) do
     begin

        //amf 21.05.2007 25280 para cada proceso RAD selecionado, verificar dados da etapa
        _cdsEtapaAtual.Data := BuscaDadosDaEtapaAtual(_cdsProcRadTela.FieldByName('IDRADETAPAPROC').AsInteger,
                                                      _cdsProcRADTela.FieldByName('IDPROCESSO').AsInteger);
        //amf 21.05.2007 - obtém a etapa atual (a que tem maior SEQETAPA)
        _cdsEtapaAtual.Last;

        //Verifica se o status do processo RAD que o usuário está visualizando(na tela) é o atual no banco
        bIgualAoDb :=
          (_cdsProcRadTela.FieldByName('FLGOK').AsString = SituacaoProcesso(_cdsProcRadTela.FieldByName('IDPROCESSO').AsInteger));

        //Verifica se a etapa atual que o usuário está visualizando(na tela) é a atual no banco
        bIgualAoDb := ( bIgualAoDb and (_cdsProcRADTela.FieldByName('IDRADETAPAPROC').AsInteger =  _cdsEtapaAtual.FieldByName('IDRADETAPAPROC').AsInteger) );

        //Verifica se o status da etapa que o usuário está visualizando(na tela) é a atual no banco
        bIgualAoDb := ( bIgualAoDb and (_cdsProcRADTela.FieldByName('ETAPASTATUS').AsString = _cdsEtapaAtual.FieldByName('ETAPASTATUS').AsString) );

        if (not bIgualAoDb) then
        begin
           Result := True; //amf 21.05.2007 22580 - Houve mudança
           MessageInfo := PROCESSOMODIFICADO;
           break;
        end;

        _cdsProcRADTela.Next;
     end;
  finally
     FreeAndNil(_cdsEtapaAtual);
  end;

end;

function TCtrlRADPlus.BuscaDadosDaEtapaAtual(iidradetapaproc, iidprocesso: integer): OleVariant;
var
  _sql: string;
begin
    try
      _sql :=
          'SELECT REP.IDPROCESSO, REP.IDRADETAPAPROC, REP.SEQETAPA, REP.FLGOK AS ETAPASTATUS         ' +
          'FROM   RADETAPAPROC REP,                                                    ' +
          '       RADETAPA     RE                                                      ' +
          'WHERE  REP.IDRADETAPA = RE.IDRADETAPA                                       ' +
          '  AND  REP.IDRADETAPAPROC = ' + IntToStr( iIdRadEtapaProc )                   +
          '  AND  REP.IDPROCESSO     = ' + IntToStr(iidprocesso)                         +
          ' ORDER BY REP.IDPROCESSO, REP.IDRADETAPAPROC, REP.SEQETAPA                  ';

      Result := GetDataPacket(_SQL);
    except
      on e:exception do
      begin
         MessageInfo := ERROCONSULTAETAPAMAISATUAL;
         raise Exception.Create(MessageInfo + ': ' + e.Message);
      end;
    end;
end;

end.
