unit uCtrlSegregacao;

interface

{------------------------------------------------------------------------------
  Desenvolvedor: Marcus Oliveira
  Data         : 16/10/2006
  Pendência    : 23500 - Remover os campos Historico Padrão e Ordem de Calculo
------------------------------------------------------------------------------ }

{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 19/12/05
  Pendência    : 18689 - modificação
  Solução      : Novo Método: RetornaPlanoSegregar
                 este método estava na CtrlLancamento interno a lancacontab
                 passado para cá para utilização em outros sistemas, ex: contratos e projetos
                 sem contabilização para testar conta passivo x plano previdenciário x programa
                 se der erro retorna -1
------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 11/05/05
  Pendência    : 18689 - Se o programa da conta for Administrativo utilizar o
                         plano de operações administrativas para segregar o lançamento.
  Solução      : Novos Métodos:
                 RetornaPrograma
                 ConflitoPrograma
------------------------------------------------------------------------------ }
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 06-18/10/04
  Pendência    : 17193 - Segregação do Fluxo Financeiro na origem
  Solução      : Novas Propriedades:
                 PlanoPrevAdm    => Plano Administrativo
                 SegregaOrComum  => Segrega o plano O.C. ( PlanoPrevComum ) na origem
                 SegregaOrAdm    => Segrega o plano O.A. ( PlanoPrevAdm   ) na origem

  Data         : 09/09/04
  Novo Método  : ContaContabilDeSegregacao  ==> retorna true se a conta passada é de segregação

  Data         : 30/09/04
  Novo Método  : RateiaValor
  Parâmetros   : fValor           = valor a ser rateado
                 iIdSegregaCriter = Critério de rateio
                 dData            = Data de cotação do critério
  Result       : idPlanOPrev      = Plano previdenciário contábil resultante
                 idPatro          = Patrocinadora contábil resultante
                 Valor            = Valor resultante
  Objetivo     : carregar a propriedade cdsrateio a ser utilizada pelo objeto chamador
     false = não existe o critério para segregação
             qq erro de banco
     true  = rateio com sucesso
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 09/01/04
  Pendência    : 14451 - Nova segregação de recursos
  Solução      : RetornaSegregaCriter
                 ConflitoSegregaCriter

                 Trocando a passagem de parâmetros e o retorno da função

  Data         : 20/01/04
  Solução      : Retirado o IdEmpresa do método create
                 Criado o método GetParams. (sempre deve ser chamado)
                 Para criar este objeto dentro de outro CtrlObject.

                 Novas Propriedades (read): PlanoPrevComum PatroComum
                 Novo Método: ContaContabilSegregacao
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 07/01/04
  Pendência    : 14451 - Nova segregação de recursos
  Solução      : Nova Propriedade:
                 SegregaVirtual
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 26-27/12/03
  Pendência    : 14451 - Nova segregação de recursos
  Solução      : Novos Métodos:
                 ContaPai
                 MascaraPlano
                 RetornaSegregaCriter
                 ConflitoSegregaCriter
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 09/12/03
  Pendência    : 14451 - Nova segregação de recursos
  Solução      : Criação do Objeto de Segregação.
------------------------------------------------------------------------------}

uses SysUtils, uCMControlObject, uCMDbObject, uCMClientDataSet,
     uCMTypes, uDbSegregaCriter, uDbSegregaCotacao, uDbSegregaData,
     uCmFileUtils, DB, DbClient, uString, uCtrlParamIntegra, uCmMath;

type TCtrlSegregacao = class(TCMControlObject)

  private
    FCdsSegregaCriter: TCMClientDataSet;
    FDbSegregaCriter: TDbSegregaCriter;
    FCdsSegregaCotacao: TCMClientDataSet;
    FDbSegregaCotacao: TDbSegregaCotacao;
    FDbSegregaData: TDbSegregaData;
    FCdsSegregaData: TCMClientDataSet;

    _CdsLocal: TCMClientDataSet;  // utilizado em divs metodos
    FSegregaVirtual: Boolean;
    FPlanoPrevComum: Integer;
    FPatroComum: Integer;
    FActive: Boolean;
    FCdsRateio: TCMClientDataSet;
    FSegregaOrComum: Boolean;
    FSegregaOrAdm: Boolean;
    FPlanoPrevAdm: Integer;
    FFlgSegOrAdmFin: boolean;
    FFlgSegOrComFin: boolean;

    procedure SetCdsSegregaCriter(const Value: TCMClientDataSet);
    procedure SetDbSegregaCriter(const Value: TDbSegregaCriter);
    procedure SetCdsSegregaCotacao(const Value: TCMClientDataSet);
    procedure SetDbSegregaCotacao(const Value: TDbSegregaCotacao);
    procedure SetDbSegregaData(const Value: TDbSegregaData);
    procedure SetCdsSegregaData(const Value: TCMClientDataSet);
    procedure SetCdsRateio(const Value: TCMClientDataSet);
    procedure SetFlgSegOrAdmFin(const Value: boolean);
    procedure SetFlgSegOrComFin(const Value: boolean);

  protected
    // esta propriedade tem visibilidade nas classes filhas uCtrlSegregaaoProc
    iIdEmpresa: integer;
    CtrlParamIntegra : TCtrlParamIntegra;

    procedure AfterInitialize; Override;
    procedure OnCreateAppServer; Override;

  public
    constructor Create;  override;
    destructor  Destroy; override;

    // tabela SEGREGACRITER
    property DbSegregaCriter : TDbSegregaCriter read FDbSegregaCriter write SetDbSegregaCriter;
    property CdsSegregaCriter : TCMClientDataSet read FCdsSegregaCriter write SetCdsSegregaCriter;

    // tabela SEGREGADATA
    property DbSegregaData : TDbSegregaData read FDbSegregaData write SetDbSegregaData;
    property CdsSegregaData : TCMClientDataSet read FCdsSegregaData write SetCdsSegregaData;

    // tabela SEGREGACOTACAO
    property DbSegregaCotacao : TDbSegregaCotacao read FDbSegregaCotacao write SetDbSegregaCotacao;
    property CdsSegregaCotacao : TCMClientDataSet read FCdsSegregaCotacao write SetCdsSegregaCotacao;

    // Alex 17193 - 30/09/04 - retornará o resultado do rateio de um critério
    property CdsRateio: TCMClientDataSet read FCdsRateio write SetCdsRateio;

    // determina se a segregação está ativada no parâmetro global
    property SegregaVirtual: Boolean read FSegregaVirtual;
    // 20/01/04 Alex 14451 determina plano e patro comum
    property PlanoPrevComum: Integer read FPlanoPrevComum;
    property PatroComum: Integer read FPatroComum;

    // 10/10/04 Alex 17193 Plano Administrativo / Segregação na origem
    property PlanoPrevAdm: Integer read FPlanoPrevAdm;
    property SegregaOrComum: Boolean read FSegregaOrComum;
    property SegregaOrAdm: Boolean read FSegregaOrAdm;

    //16/01/07 - Pendência 23894 - David Ayrolla
    property FlgSegOrComFin : boolean read FFlgSegOrComFin write SetFlgSegOrComFin;
    property FlgSegOrAdmFin : boolean read FFlgSegOrAdmFin write SetFlgSegOrAdmFin;

    // travar processos com o Active = false;
    property Active: Boolean read FActive;  // esta propriedade true significa que o getparams foi executado

    // 20/01/04 Alex 14451 atribuir as propriedades do global
    procedure GetParams ( const IdEmpresa : integer );

    function ListaSegregaCriter(const iIdSegregaCriter: Integer = -1): OLEVariant;
    function GravaSegregaCriter : Boolean;

    function ListaSegregaData (const iIdSegregaCriter: integer = -1; const iIdSegregaData: integer = - 1): OleVariant;
    function ListaSegregaCotacao(const iIdSegregaData: Integer = -1; const iIdSegregaCotacao: Integer = -1): OLEVariant;
    function ListaSegregaCotacaoXData(const iIdSegregaCriter: Integer = -1; const dData: TDateTime = -1; const iIdSegregaDataNao: Integer = -1): OLEVariant;
    function GravaSegregaCotacao : Boolean;
    function ExcluiSegregaCotacao : Boolean;

    function ContaPai (const iPlano: integer; const sMascara, sPlaconta: string): string;
    function MascaraPlano (const iPlano: integer): string;
    // se não achar critério resulta -1
    function RetornaSegregaCriter(const iPlano, iIdPlanoPrev, iIdPatro: integer; const sPlaconta: string; var sContaSegregaCriter: string): Integer;
    // retornando -1 não existe conflito de parâmetros para segregação, ref conta informada
    function ConflitoSegregaCriter(const iPlano: integer; const sPlaconta: string; var sContaSegregaCriter: string): Integer;

    // Alex 11/05/2005 18689
    // se não achar programa resulta -1
    function RetornaPrograma(const iPlano: integer; const sPlaconta: string; var sContaPrograma: string; var sFlgTipoPrograma: string): Integer;
    // retornando -1 não existe conflito de parâmetros para programa, ref conta informada
    function ConflitoPrograma(const iPlano: integer; const sPlaconta: string; var sContaPrograma: string): Integer;

    // Alex 19/12/2005 -- este método estava na CtrlLancamento interno a lancacontab
    // passado para cá para utilização em outros sistemas, ex: contratos e projetos
    // sem contabilização para testar conta passivo x plano previdenciário x programa
    // se der erro retorna -1
    function RetornaPlanoSegregar (const iPlano: integer; const sConta: string; const iPlanoPrev: integer): integer;

    function  ContaContabilSegregacao ( const sPlaConta: string ): string;
    function  ContaContabilDeSegregacao ( const sPlaConta: string ): boolean;

    function RateiaValor (const fValor: Extended; const iIdSegregaCriter: Integer; const dData: TDateTime): Boolean;
    //****** início - andre tavares - pendência 22278 - 19/08/2006
    function GetSegregaCtrl: int64;
    //****** fim - andre tavares - pendência 22278 - 19/08/2006
  published

end;

implementation

{ TCtrlSegregacao }

procedure TCtrlSegregacao.AfterInitialize;
begin
  inherited;
  FDbSegregaCriter.DataBaseName := DataBaseName;
  FDbSegregaData.DataBaseName := DataBaseName;
  FDbSegregaCotacao.DataBaseName := DataBaseName;

  CtrlParamIntegra.InitializeAs (self);
end;


constructor TCtrlSegregacao.Create;
begin
  inherited;
  FDbSegregaCriter := TDbSegregaCriter.Create( Self );
  FDbSegregaData := TDbSegregadata.Create ( Self );
  FDbSegregaCotacao := TDbSegregaCotacao.Create ( Self );

  // como estes clientdataset não estarão associados a nenhum cds de form
  // eles devem ser criados aqui, senão ninguém vai criá-los.
  FCdsRateio := TCMClientDataSet.Create (nil);
  _CdsLocal := TCMClientDataSet.Create (nil);


  CtrlParamIntegra := TCtrlParamIntegra.Create;

  // inicializar as variáveis do método, caso em algum processo o fActive = false
  // abortar o mesmo
  iIdEmpresa      := 0;
  FSegregaVirtual := False;
  FPatroComum     := 0;
  FPlanoPrevComum := 0;
  FSegregaOrAdm   := False;
  FSegregaOrComum := False;
  FlgSegOrComFin  := False;
  FlgSegOrAdmFin  := False;
  FPlanoPrevAdm   := 0;
  FActive         := False

end;

destructor TCtrlSegregacao.Destroy;
begin
  FreeAndNil (FDbSegregaCriter);
  FreeAndNil (FDbSegregaData);
  FreeAndNil (FDbSegregaCotacao);

  FreeAndNil (CtrlParamIntegra);
  
  FreeAndNil (FCdsRateio);
  FreeAndNil (_CdsLocal);

  // Destrói os Cds criados somente se os mesmos foram criados pelo CtrlObject
  if isAppServer then begin
    FreeAndNil (FCdsSegregaCriter);
    FreeAndNil (FCdsSegregaData);
    FreeAndNil (FCdsSegregaCotacao);
  end;
  inherited;

end;

function TCtrlSegregacao.ExcluiSegregaCotacao: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.ExcluiSegregaCotacao( CdsSegregaData.Data, CdsSegregaCotacao.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Marca todos as cotações para exclusão
      CdsSegregaCotacao.First;
      while not CdsSegregaCotacao.Eof   do CdsSegregaCotacao.Delete;

      // Exclui as cotações
      Result := ApplyCds( CdsSegregaCotacao, DbSegregaCotacao, [], [] );
      if not Result then raise Exception.Create( DbSegregaCotacao.MessageInfo );

      // Exclui a Vigência de datas  ( Pai )
      Result := ApplyCds( CdsSegregaData, DbSegregaData, [], [] );
      if not Result then raise Exception.Create( DbSegregaData.MessageInfo );

      Commit;
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlSegregacao.GravaSegregaCotacao: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaSegregaCotacao( CdsSegregaData.Data, CdsSegregaCotacao.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject - Pai
      Result := ApplyCds( CdsSegregaData, DbSegregaData, [], [] );
      if not Result then raise Exception.Create( DbSegregaData.MessageInfo );

      // Aplica as alterações do Cds através do DbObject - Filho
      Result := ApplyCds( CdsSegregaCotacao, DbSegregaCotacao, [DbSegregaData.Idsegregadata], [DbSegregaCotacao.Idsegregadata] );
      if not Result then raise Exception.Create( DbSegregaCotacao.MessageInfo );

      Commit;
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlSegregacao.GravaSegregaCriter: Boolean;
begin
  // verifica o tipo de conexão, caso seja cliente, o método deverá ser chamado
  // através da aplicação servidora
  if ConnectionSide = cnsClient then begin
    Result := Connection.AppServer.GravaSegregaCriter( CdsSegregaCriter.Data );
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end else begin
    try
      StartTransaction;

      // Aplica as alterações do Cds através do DbObject
      Result := ApplyCds( CdsSegregaCriter, DbSegregaCriter, [], [] );
      if not Result then raise Exception.Create( DbSegregaCriter.MessageInfo );

      Commit;
    except
      on E : Exception do begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlSegregacao.ListaSegregaCotacao(const iIdSegregaData, iIdSegregaCotacao: Integer): OLEVariant;
var
  sSql, sParam: string;
begin

  sParam := '';
  if iIdSegregaData    <> -1 then sParam := sParam + '   AND ( CT.IDSEGREGADATA   = ' + IntToStr(iIdSegregaData) + ' ) ' + #13;
  if iIdSegregaCotacao <> -1 then sParam := sParam + '   AND ( CT.IDSEGREGACOTACAO = ' + IntToStr (iIdSegregaCotacao) + ' ) ' + #13;

  sSql := 'SELECT ' + #13 +
          '   CT.IDSEGREGADATA, CT.IDSEGREGACOTACAO, ' + #13 +
          '   CT.IDPLANOPREV, CT.IDPATRO, CT.COTACAO, ' + #13 +
          '   P.NOME AS PATRO, PC.NOME AS PLANPREVCONTABIL ' + #13 +
          'FROM ' + #13 +
          '   PESSOA P, PATRO PA, PLANPREVCONTABIL PC, ' + #13 +
          '   SEGREGACOTACAO CT ' + #13 +
          'WHERE ' + #13 +
          '   ( P.IDPESSOA = PA.IDPESSOA ) ' + #13 +
          '   AND ( PA.IDPESSOA = CT.IDPATRO ) ' + #13 +
          '   AND ( CT.IDPLANOPREV = PC.IDPLANOPREV ) ' + #13 +
          sParam +
          'ORDER BY PATRO, PLANPREVCONTABIL ';

  Result := GetDataPacket (sSql);
end;

function TCtrlSegregacao.ListaSegregaCotacaoXData(const iIdSegregaCriter: Integer; const dData: TDateTime; const iIdSegregaDataNao: integer): OLEVariant;
var
  sSql, sParam, sData: string;
begin

  sParam := '';
  sData := FormatDateTime ('dd/mm/yyyy', dData);

  if iIdSegregaCriter  <> -1 then sParam := sParam + '   AND ( DT.IDSEGREGACRITER = ' + IntToStr(iIdSegregaCriter) + ' ) ' + #13;
  if iIdSegregaDataNao <> -1 then sParam := sParam + '   AND ( DT.IDSEGREGADATA  <> ' + IntToStr(iIdSegregaDataNao) + ' ) ' + #13;


  if dData <> -1 then sParam := sParam + '   AND ( TO_DATE (' + QuotedStr(sData) + ', ''DD/MM/YYYY'') BETWEEN DT.DATAINI AND DT.DATAFIM ) ' + #13;

  sSql := 'SELECT ' + #13 +
          '   DT.IDSEGREGACRITER, DT.IDSEGREGADATA, CT.IDSEGREGACOTACAO, ' + #13 +
          '   DT.DATAINI, DT.DATAFIM, CT.IDPLANOPREV, CT.IDPATRO, CT.COTACAO, ' + #13 +
          '   CR.DESCRICAO, CR.FLGTIPOCOTACAO, ' + #13 +
          '   TOT.TOT_COTACAO ' + #13 +
          'FROM ' + #13 +
          '   SEGREGADATA DT, SEGREGACOTACAO CT, SEGREGACRITER CR, ' + #13 +
          // 05/02/04 ALEX TOTAL DO CRITÉRIO, PODE SER POR COTA E NECESSITAR - PROCESSAMENTO DA SEGREGAÇÃO
          '   ( SELECT IDSEGREGADATA, SUM(COTACAO) AS TOT_COTACAO FROM SEGREGACOTACAO GROUP BY IDSEGREGADATA) TOT ' + #13 +
          'WHERE ' + #13 +
          '   ( DT.IDSEGREGADATA = CT.IDSEGREGADATA ) ' + #13 +
          '   AND ( DT.IDSEGREGACRITER = CR.IDSEGREGACRITER ) ' + #13 +
          // 05/02/04 ALEX TOTAL DO CRITÉRIO, PODE SER POR COTA E NECESSITAR - PROCESSAMENTO DA SEGREGAÇÃO
          '   AND ( DT.IDSEGREGADATA = TOT.IDSEGREGADATA ) ' + #13 +

          sParam;

  Result := GetDataPacket (sSql);
end;

function TCtrlSegregacao.ListaSegregaCriter(const iIdSegregaCriter: Integer): OLEVariant;
var
  sSql, sParam : string;
begin
  sParam := '';
  if iIdSegregaCriter <> -1 then sParam := sParam + '   AND C.IDSEGREGACRITER = ' + IntToStr(iIdSegregaCriter)  + #13;

//Marcus P. 23500 16/10/2006
  sSql:= 'SELECT                                                       '+
         '  C.IDSEGREGACRITER, C.DESCRICAO, C.ORDEM, C.FLGTIPOSEGREGA, '+
         '  C.FLGTIPOCOTACAO, C.HITCODHIST, C.IDPESSOA, C.TIPCODIGO,   '+
         '  T.TIPCODIGO, T.TIPDESCRICAO                                '+
         'FROM                                                         '+
         '  SEGREGACRITER C, TIPOPER T                                 '+
         'WHERE                                                        '+
         '  1=1 AND                                                    '+
         '  C.TIPCODIGO = T.TIPCODIGO                                  ';

  sSql := sSql + sParam;

  sSql := sSql + 'ORDER BY C.DESCRICAO ' + #13;

  Result := GetDataPacket (sSql);

end;

function TCtrlSegregacao.ListaSegregaData(const iIdSegregaCriter,
  iIdSegregaData: integer): OleVariant;
var
  sSql, sParam: string;
begin
  sParam := '';
  if iIdSegregaCriter <> -1 then sParam := sParam + '   AND (CR.IDSEGREGACRITER = ' + IntToStr(iIdSegregaCriter) + ') ' + #13;
  if iIdSegregaData   <> -1 then sParam := sParam + '   AND (DT.IDSEGREGADATA = ' + IntToStr(iIdSegregaData) + ') ' + #13;


  sSql := 'SELECT ' + #13 +
          '   CR.IDSEGREGACRITER, CR.DESCRICAO, CR.ORDEM, CR.FLGTIPOSEGREGA, ' + #13 +
          '   CR.FLGTIPOCOTACAO, DT.IDSEGREGADATA, DT.DATAINI, DT.DATAFIM ' + #13 +
          'FROM ' + #13 +
          '   SEGREGACRITER CR, SEGREGADATA DT ' + #13 +
          'WHERE ' + #13 +
          '   (CR.IDSEGREGACRITER = DT.IDSEGREGACRITER) ' + #13 +
          sParam +
          'ORDER BY CR.DESCRICAO, DT.DATAINI ';
  Result := GetDataPacket (sSql);
end;


procedure TCtrlSegregacao.OnCreateAppServer;
begin
  inherited;
  FCdsSegregaCriter := TCMClientDataSet.Create (nil);
  FCdsSegregaData := TCMClientDataSet.Create (nil);
  FCdsSegregaCotacao := TCMClientDataSet.Create (nil);
end;

function TCtrlSegregacao.ContaPai(const iPlano: integer; const sMascara,
  sPlaconta: string): string;
var
  i, iTam: integer;
  bAchouPai: boolean;
  sMascaraAux: string;
begin
  // igualar a máscara a conta passada, ignorando as contas pra frente.
  iTam := 0;
  for i:= 1 to Length (sPlaconta) do begin
    if sMascara[i+iTam] = '.' then
      Inc (iTam);
  end;
  sMascaraAux := copy(sMascara, 1, i -1 + iTam);

  bAchouPai:= false;
  // procurar a conta com gráu imediatamente anterior (pai)
  for i:=length(sMascaraAux) downto 1 do begin
    if sMascara[i] = '.' then begin
      sMascaraAux := copy(sMascaraAux, 1, i-1);
      bAchouPai := true;
      break;
    end;
  end;

  // A máscara não possui mais pai estamos no primeiro nível
  if not bAchouPai then begin
    Result := '';
  end else begin
    // contar o tamanho dos números
    iTam := Length(RemoveChar ('.', sMascaraAux));
    Result := copy(sPlaconta, 1, iTam);
  end;

end;


function TCtrlSegregacao.MascaraPlano(const iPlano: integer): string;
begin
  _CdsLocal.Data := GetDataPacket ('SELECT MASCARA FROM PLANO WHERE PLANO = ' + IntToStr (iPlano));
  Result := _CdsLocal.FieldByName('MASCARA').AsString;
end;


function TCtrlSegregacao.RetornaSegregaCriter(const iPlano, iIdPlanoPrev, iIdPatro: integer; const sPlaconta: string; var sContaSegregaCriter: string): Integer;
var
  sSql, sPlaContaAux, sMascara: string;
begin

  Result := -1;
  sContaSegregaCriter := '';

  if not FSegregaVirtual then exit;

  // para verificar contas (apenas no cadasto de plano de contas)
  // o plano e a patro devem vir -1
  if (iIdPlanoPrev <> -1) and (iIdPatro <> -1) then begin
    if (not ((iIdPlanoPrev = FPlanoPrevComum) or
             (iIdPlanoPrev = FPlanoPrevAdm))) or
       (iIdPatro     <> FPatroComum) then
      // o dinheiro aqui é carimbado
      exit;
  end;

  sMascara := MascaraPlano(iPlano);

  sPlaContaAux := sPlaconta;
  // carregar o result sem achar ocorrencias
  while sPlaContaAux <> '' do begin

    sSql := 'SELECT IDSEGREGACRITER FROM PLANOCONTA ' + #13 +
            'WHERE PLANO = ' + IntToStr(iPlano) + #13 +
            '  AND PLACONTA = ' + QuotedStr(sPlaContaAux);
    _CdsLocal.Data := GetDataPacket (sSql);

    if  not _CdsLocal.FieldByName ('IDSEGREGACRITER').IsNull then begin
      Result := _CdsLocal.FieldByName ('IDSEGREGACRITER').AsInteger;
      sContaSegregaCriter := sPlaContaAux;
      sPlaContaAux := '';

    end else begin

      sPlaContaAux := ContaPai (iPlano, sMascara, sPlaContaAux);

    end;
  end;

end;


function TCtrlSegregacao.RetornaPrograma(const iPlano: integer; const sPlaconta: string;
                                         var sContaPrograma: string;
                                         var  sFlgTipoPrograma: string): Integer;
var
  sSql, sPlaContaAux, sMascara: string;
begin

  Result := -1;
  sContaPrograma := '';
  sFlgTipoPrograma := '';

  sMascara := MascaraPlano(iPlano);

  sPlaContaAux := sPlaconta;
  // carregar o result sem achar ocorrencias
  while sPlaContaAux <> '' do begin

    sSql := 'SELECT PL.IDPROGRAMA, PR.FLGTIPOPROGRAMA ' + #13 +
            'FROM PLANOCONTA PL, PROGRAMA PR ' + #13 +
            'WHERE PL.IDPROGRAMA = PR.IDPROGRAMA(+) ' + #13 +
            '  AND PLANO = ' + IntToStr(iPlano) + #13 +
            '  AND PLACONTA = ' + QuotedStr(sPlaContaAux);
    _CdsLocal.Data := GetDataPacket (sSql);

    if  not _CdsLocal.FieldByName ('IDPROGRAMA').IsNull then begin
      Result := _CdsLocal.FieldByName ('IDPROGRAMA').AsInteger;
      sContaPrograma := sPlaContaAux;
      sFlgTipoPrograma := _CdsLocal.FieldByName ('FLGTIPOPROGRAMA').AsString;
      sPlaContaAux := '';

    end else begin

      sPlaContaAux := ContaPai (iPlano, sMascara, sPlaContaAux);

    end;
  end;
end;


// retornando -1 não existe conflito de parâmetros para segregação,
// somente utilizado no cadastro de contas contábeis
function TCtrlSegregacao.ConflitoSegregaCriter(const iPlano: integer; const sPlaconta: string; var sContaSegregaCriter: string): Integer;
var
  sSql, sMascara, sPlaContaAux : String;

begin
  sContaSegregaCriter := '';

  sSql := 'SELECT PLACONTA, IDSEGREGACRITER ' + #13 +
          'FROM PLANOCONTA ' + #13 +
          'WHERE PLANO = ' + IntToStr(iPlano) + #13 +
          '  AND IDSEGREGACRITER IS NOT NULL ' + #13 +
          '  AND PLACONTA LIKE( ' + QuotedStr(sPlaconta+ '%') + ' ) ' + #13 +
          '  AND PLACONTA <> ' + QuotedStr(sPlaconta);

  _CdsLocal.Data := GetDataPacket (sSql);
  // verifica as contas filhas
  if not _CdsLocal.IsEmpty then begin
    sContaSegregaCriter := _CdsLocal.FieldByName('PLACONTA').AsString;
    Result := _CdsLocal.FieldByName('IDSEGREGACRITER').AsInteger;

  // verifica as contas pai
  end else begin

    sMascara := MascaraPlano(iPlano);
    sPlaContaAux := ContaPai(iPlano, sMascara, sPlaconta);
    Result := RetornaSegregaCriter (iPlano, -1, -1, sPlaContaAux, sContaSegregaCriter);

  end;
end;


// retornando -1 não existe conflito de parâmetros para segregação,
// somente utilizado no cadastro de contas contábeis
function TCtrlSegregacao.ConflitoPrograma(const iPlano: integer;
  const sPlaconta: string; var sContaPrograma: string): Integer;
var
  sSql, sMascara, sPlaContaAux, sFlgTipoPrograma : String;

begin
  sContaPrograma := '';

  sSql := 'SELECT PLACONTA, IDPROGRAMA ' + #13 +
          'FROM PLANOCONTA ' + #13 +
          'WHERE PLANO = ' + IntToStr(iPlano) + #13 +
          '  AND IDPROGRAMA IS NOT NULL ' + #13 +
          '  AND PLACONTA LIKE( ' + QuotedStr(sPlaconta+ '%') + ' ) ' + #13 +
          '  AND PLACONTA <> ' + QuotedStr(sPlaconta);

  _CdsLocal.Data := GetDataPacket (sSql);
  // verifica as contas filhas
  if not _CdsLocal.IsEmpty then begin
    sContaPrograma := _CdsLocal.FieldByName('PLACONTA').AsString;
    Result := _CdsLocal.FieldByName('IDPROGRAMA').AsInteger;

  // verifica as contas pai
  end else begin

    sMascara := MascaraPlano(iPlano);
    sPlaContaAux := ContaPai(iPlano, sMascara, sPlaconta);
    Result := RetornaPrograma (iPlano, sPlaContaAux, sContaPrograma, sFlgTipoPrograma);

  end;
end;


procedure TCtrlSegregacao.SetCdsSegregaCotacao(
  const Value: TCMClientDataSet);
begin
  FCdsSegregaCotacao := Value;
end;

procedure TCtrlSegregacao.SetCdsSegregaCriter(const Value: TCMClientDataSet);
begin
  FCdsSegregaCriter := Value;
end;

procedure TCtrlSegregacao.SetCdsSegregaData(const Value: TCMClientDataSet);
begin
  FCdsSegregaData := Value;
end;

procedure TCtrlSegregacao.SetDbSegregaCotacao(
  const Value: TDbSegregaCotacao);
begin
  FDbSegregaCotacao := Value;
end;

procedure TCtrlSegregacao.SetDbSegregaCriter(const Value: TDbSegregaCriter);
begin
  FDbSegregaCriter := Value;
end;

procedure TCtrlSegregacao.SetDbSegregaData(const Value: TDbSegregaData);
begin
  FDbSegregaData := Value;
end;


// 20/01/04 Alex 14451
procedure TCtrlSegregacao.GetParams (const IdEmpresa: integer);
begin

  CtrlParamIntegra.GetParams (IdEmpresa, 0, '', '', tiSistema);
  iIdEmpresa := IdEmpresa;
  // verificar parâmetro global, se segregação está ativada
  FSegregaVirtual := CtrlParamIntegra.SegregaVirtual;
  // 20/01/04 Alex 14451
  FPatroComum     := CtrlParamIntegra.PatroGlobal;
  FPlanoPrevComum := CtrlParamIntegra.PlanoPrevGlobal;
  // 10/10/04 Alex 17193
  FSegregaOrAdm   := CtrlParamIntegra.SegregaOrAdm;
  FSegregaOrComum := CtrlParamIntegra.SegregaOrComum;
  FPlanoPrevAdm   := CtrlParamIntegra.PlanoPrevAdm;

  //16/01/07 - Pendência 23894 - David Ayrolla
  FFlgSegOrComFin := CtrlParamIntegra.FlgSegOrComFin;
  FFlgSegOrAdmFin := CtrlParamIntegra.FlgSegOrAdmFin;

  FActive := True;
end;


// 20/01/04 Alex 14451
function TCtrlSegregacao.ContaContabilSegregacao(const sPlaConta: string): string;
var
  sPlaContaAux: string;
begin
  Result := '';
  sPlaContaAux := sPlaConta;
  while sPlaContaAux <> '' do begin
    _CdsLocal.Data := GetDataPacket ('SELECT PLACONTASEGREG FROM PLANOCONTA WHERE PLACONTA = ' + QuotedStr (sPlaContaAux) + ' AND PLANO = ' + inttostr (CtrlParamIntegra.Plano));
    if not _CdsLocal.FieldByName('PLACONTASEGREG').IsNull then begin
      Result := _CdsLocal.FieldByName('PLACONTASEGREG').AsString;
      exit;
    end;
    sPlaContaAux := ContaPai (CtrlParamIntegra.Plano, CtrlParamIntegra.MascaraPlano, sPlaContaAux);
  end;
end;

// 09/09/04 verifica se a conta contábil passada é uma conta para segregação de recursos
function TCtrlSegregacao.ContaContabilDeSegregacao( const sPlaConta: string): boolean;
begin
  Result := false;
  _CdsLocal.Data := GetDataPacket ('SELECT PLACONTA, PLACONTASEGREG FROM PLANOCONTA WHERE PLACONTASEGREG = ' + QuotedStr (sPlaConta) + ' AND PLANO = ' + inttostr(CtrlParamIntegra.Plano));
  if not _cdsLocal.IsEmpty then
    Result := true;
end;

// 30/09/2004 Alex 17193
function TCtrlSegregacao.RateiaValor(const fValor: Extended;
  const iIdSegregaCriter: Integer; const dData: TDateTime): boolean;
var
  fValorLanc, fTotalLanc, fFator: Extended;
begin
  result := true;
  try
    if FCdsRateio.Active then FCdsRateio.Close;

    FCdsRateio.Data := GetDataPacket('SELECT 0 AS IDPLANOPREV, 0 AS IDPATRO, 0 AS VALOR FROM DUAL WHERE 1=2');
    _CdsLocal.Data := ListaSegregaCotacaoXData (iIdSegregaCriter, dData);
    if _CdsLocal.IsEmpty then begin
      _CdsLocal.Data := ListaSegregaCriter(iIdSegregaCriter);
      raise exception.Create ('Segregação de Recursos. ' + #13 +
                              'Cotação não encontrada para o critério selecionado! ' + #13 +
                              'Critério: ' + _CdsLocal.FieldByName('DESCRICAO').AsString + #13 +
                              'Data: ' + DateToStr (dData));
    end;

    fTotalLanc := 0;
    while not _CdsLocal.Eof do begin
      if _CdsLocal.FieldByName('FLGTIPOCOTACAO').AsString = 'P' then
        fFator := _CdsLocal.FieldByName('COTACAO').AsFloat / 100
      else
        fFator := _CdsLocal.FieldByName('COTACAO').AsFloat / _CdsLocal.FieldByName('TOT_COTACAO').AsFloat;

      fValorLanc := RoundCM( (fValor*fFator), 2);

      if _CdsLocal.RecNo = _CdsLocal.RecordCount then // último registro descarregar a diferença
        fValorLanc := fValor - fTotalLanc;

      fTotalLanc := fTotalLanc + fValorLanc;
      FCdsRateio.Append;
      FCdsRateio.FieldByName('IDPLANOPREV').AsInteger := _CdsLocal.FieldByName('IDPLANOPREV').AsInteger;
      FCdsRateio.FieldByName('IDPATRO').AsInteger := _CdsLocal.FieldByName('IDPATRO').AsInteger;
      FCdsRateio.FieldByName('VALOR').AsFloat := fValorLanc;
      FCdsRateio.Post;

      _CdsLocal.Next;
    end;
  except
    on E : Exception do begin
      Result := False;
      MessageInfo := E.Message;
    end;
  end;
end;

procedure TCtrlSegregacao.SetCdsRateio(const Value: TCMClientDataSet);
begin
  FCdsRateio := Value;
end;

function TCtrlSegregacao.RetornaPlanoSegregar(const iPlano: integer; const sConta: string; const iPlanoPrev: integer): integer;
var
 iIdPrograma: integer;
 sContaPrograma, sFlgTipoPrograma: string;
begin
  // Alex 11/05/05 - utilizar o Plano adm se a conta é do prg ADM
  try
     Result := 0;  // não houve erro, porém o programa não foi parametrizado
     iIdPrograma := RetornaPrograma( iPlano, sConta, sContaPrograma, sFlgTipoPrograma);
     if iIdPrograma > 0 then begin
        // verificar se o programa está invertido
        if (sFlgTipoPrograma = 'PREV') then begin
           if (fPlanoPrevComum = iPlanoPrev) then
              raise Exception.Create ('Você tentou lançar o plano de Operações Comuns em uma conta do programa previdenciário! ' + #13 +
                                      'Estas contas aceitam apenas planos "carimbados".'+ #13 +
                                      'Conta Lançada: ' + sConta + #13 +
                                      'Programa Parametrizado: '+ sFlgTipoPrograma + ', na conta: ' + sContaPrograma);
           if (fPlanoPrevAdm = iPlanoPrev) then
              raise Exception.Create ('Você tentou lançar o plano de Operações Administrativas em uma conta do programa previdenciário! ' + #13 +
                                      'Estas contas aceitam apenas planos "carimbados".' + #13 +
                                      'Conta Lançada: ' + sConta + #13 +
                                      'Programa Parametrizado: '+ sFlgTipoPrograma + ', na conta: ' + sContaPrograma);
        end else begin
           if fPlanoPrevAdm <> 0 then begin // plano Adm parametrizado
              if (sFlgTipoPrograma = 'INV') and (fPlanoPrevAdm = iPlanoPrev) then
                 raise Exception.Create ('Você tentou lançar o plano de Operações Administrativas em uma conta do programa de Investimentos! ' + #13 +
                                         'Estas contas aceitam apenas o plano de Operações Comuns ou planos "carimbados".' + #13 +
                                         'Conta Lançada: ' + sConta + #13 +
                                         'Programa Parametrizado: '+ sFlgTipoPrograma + ', na conta: ' + sContaPrograma);

              if (sFlgTipoPrograma = 'ADM') and (fPlanoPrevComum = iPlanoPrev) then
                 raise Exception.Create ('Você tentou lançar o plano de Operações Comuns em uma conta do programa de Administrativo! ' + #13 +
                                         'Estas contas aceitam apenas o Plano de Operações Administrativas ou planos "carimbados".' + #13 +
                                         'Conta Lançada: ' + sConta + #13 +
                                         'Programa Parametrizado: '+ sFlgTipoPrograma + ', na conta: ' + sContaPrograma);
           end;
        end;

        if (sFlgTipoPrograma = 'INV') then
           Result := fPlanoPrevComum
        else if (sFlgTipoPrograma = 'ADM') then begin
           if (fPlanoPrevAdm <> 0) then // plano administrativo parametrizado
              Result := fPlanoPrevAdm;
        end;
     end;
  except
      on E : Exception do begin
        Result := -1;
        MessageInfo := E.Message;
      end;
  end;
end;

//****** início - andre tavares - pendência 22278 - 19/08/2006
function TCtrlSegregacao.GetSegregaCtrl: int64;
begin
  result := GetSequence('IDCONTRSEGREGA');
end;
//****** fim - andre tavares - pendência 22278 - 19/08/2006

procedure TCtrlSegregacao.SetFlgSegOrAdmFin(const Value: boolean);
begin
  FFlgSegOrAdmFin := Value;
end;

procedure TCtrlSegregacao.SetFlgSegOrComFin(const Value: boolean);
begin
  FFlgSegOrComFin := Value;
end;

end.
