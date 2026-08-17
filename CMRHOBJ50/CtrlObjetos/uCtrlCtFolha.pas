{ --------------------------------------------------------------------------------------------------
Rotina......: ListCentCustIns, ListCentCustContab
Nº SOL......: 158234
Nº KINTANA..: 1284480
Data........: 30/05/2011
Responsável.: Thaise Amaral Martins
Descrição...: Ordenar consulta por CODCENTROCUSTO
-------------------------------------------------------------------------------------------------- }

{ --------------------------------------------------------------------------------------------------
Rotina......: ListContabFolhaDet
Nº SOL......: 158317
Nº KINTANA..: 1279424
Data........: 19/05/2011
Responsável.: Thaise Amaral Martins
Descrição...: Corrigir Inner Join
-------------------------------------------------------------------------------------------------- }

{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 136200
Nº KINTANA..: 813279
Data........: 04/04/2010
Responsável.: Thaise Amaral Martins
Descrição...: Fazer buscas por conta e idprovento para trazer os centro de custo relacionados.
-------------------------------------------------------------------------------------------------- }

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 11/07/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlCtFolha;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbContabFolha;

type
  TCtrlCtFolha = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbContabFolha: TDbContabFolha;
    FCdsContabFolha: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListContabFolha(IdProvento: double): OleVariant;
    function ListContabFolhaDet(IdProvento: double): OleVariant;
    function ListCentCustContab(IdProvento: double; ContDebito, ContCredito: String): OleVariant;
    function ListCentCustIns(IdProvento: Double; ContDebito, ContCredito: String): OleVariant;
    function ListCentCustContabCodExt(IdProvento: double; ContDebito, ContCredito: String): OleVariant;
    function ListCentCustInsCodExt(IdProvento: Double; ContDebito, ContCredito: String): OleVariant;

    function ListContabFolhaXEmpresa(IdProvento: double; IdEmpresa: integer;
      CodCentroCusto: string): OleVariant;

    function GravarContabFolha: boolean;

    property CdsContabFolha: TCMClientDataSet read FCdsContabFolha write FCdsContabFolha;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlCtFolha }

constructor TCtrlCtFolha.Create;
begin
  inherited;
  FDbContabFolha := TDbContabFolha.Create(Self);
end;

destructor TCtrlCtFolha.Destroy;
begin
  FDbContabFolha.Free;
  if (IsAppServer) then
    FCdsContabFolha.Free;
  inherited;
end;

procedure TCtrlCtFolha.OnCreateAppServer;
begin
  inherited;
  FCdsContabFolha := TCMClientDataSet.Create(nil);
end;

procedure TCtrlCtFolha.DoChangeDataBase;
begin
  inherited;
  FDbContabFolha.DataBaseName := DataBaseName;
end;

function TCtrlCtFolha.ListContabFolha(IdProvento: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  CODTIPRECDES, CODCENTRORESPON, TO_CHAR(UNIDNEGOC) AS UNIDNEGOC, IDFAVORECIDO, IDCONTABFOLHA,'+CR_LF+
    '  CONTACREDITO, IDPESSDEBITO, CODSUBCREDITO, IDPLANO1, CONTADEBITO,'+CR_LF+
    '  IDPESSCREDITO, IDEMPRESA, CODCENTROCUSTO, IDPROVENTO, IDPLANO2,'+CR_LF+
    '  CODSUBDEBITO, IDEMPRESAPROP, RECPAG, HITCODHISTDEBITO'+CR_LF+
    'FROM'+CR_LF+
    '  CONTABFOLHA'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPROVENTO = ' +FloatToStr(IdProvento)+ ')');
end;

function TCtrlCtFolha.ListContabFolhaXEmpresa(IdProvento: double; IdEmpresa: integer;
  CodCentroCusto: string): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  C.IDPLANO1, C.IDPLANO2, C.CONTADEBITO, C.IDPESSDEBITO,'+CR_LF+
    '  C.CONTACREDITO, C.IDPESSCREDITO, C.CODSUBDEBITO, C.HITCODHISTDEBITO,'+CR_LF+
    '  C.CODSUBCREDITO, C.RECPAG, C.CODTIPRECDES, C.CODCENTRORESPON,'+CR_LF+
    '  C.UNIDNEGOC, C.IDFAVORECIDO, PD.DESCRICAO, PD.FLGDESCONTO, PD.CODRUBCLT'+CR_LF+
    'FROM'+CR_LF+
    '  CONTABFOLHA C, PROVDESC PD'+CR_LF+
    'WHERE'+CR_LF+
    '  (C.IDPROVENTO      = ' +FloatToStr(IdProvento)+ ') AND'+CR_LF+
    '  ((C.IDPESSDEBITO  IS NULL) OR'+CR_LF+
    '   (C.IDPESSDEBITO   = ' +IntToStr(IdEmpresa)+ ')) AND'+CR_LF+
    '  ((C.IDPESSCREDITO IS NULL) OR'+CR_LF+
    '   (C.IDPESSCREDITO  = ' +IntToStr(IdEmpresa)+ ')) AND'+CR_LF+
    IFF(CodCentroCusto<>'',
      '  (C.CODCENTROCUSTO  = ' +QuotedStr(CodCentroCusto)+ ') AND'+CR_LF+
      '  (C.IDEMPRESA       = ' +IntToStr(IdEmpresa)+ ') AND',
      '  (C.CODCENTROCUSTO IS NULL) AND')+CR_LF+
    '  (C.IDPROVENTO      = PD.IDPROVENTO)');
end;

function TCtrlCtFolha.GravarContabFolha: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarContabFolha(FCdsContabFolha.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCdsContabFolha, FDbContabFolha, [], []);
      if (Result) then
        Commit
      else
        raise Exception.Create(FDbContabFolha.MessageInfo);
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

function TCtrlCtFolha.ListContabFolhaDet(IdProvento: double): OleVariant;
begin
  //Thaise SOL 136200 - Carregar também o nome do centro de custo
  Result := GetDataPacket(
  'SELECT'+CR_LF+
  'CF.CODCENTROCUSTO, CF.CODTIPRECDES, CF.CODCENTRORESPON, CR.NOME NOME_CODCENTRORESPON, '+CR_LF+
  'U.NOME NOME_UNIDNEGOC, TO_CHAR(CF.UNIDNEGOC) AS UNIDNEGOC,'+CR_LF+
  'CF.IDFAVORECIDO, CF.IDCONTABFOLHA,'+CR_LF+
  'CF.CONTACREDITO, CF.IDPESSDEBITO, CF.CODSUBCREDITO, CF.IDPLANO1, CF.CONTADEBITO,'+CR_LF+
  'CF.IDPESSCREDITO, CF.IDEMPRESA, CF.CODCENTROCUSTO, CF.IDPROVENTO, CF.IDPLANO2,'+CR_LF+
  'CF.CODSUBDEBITO, CF.IDEMPRESAPROP, CF.RECPAG, CF.HITCODHISTDEBITO, C.NOME'+CR_LF+
  'FROM'+CR_LF+
  'CONTABFOLHA CF, CENTCUST C, CENTRESPON CR, UNIDNEGOCIO U'+CR_LF+
  'WHERE CF.CODCENTROCUSTO = C.CODCENTROCUSTO(+)'+CR_LF+
  'AND CR.CODCENTRORESPON(+) = CF.CODCENTRORESPON'+CR_LF+
  'AND U.UNIDNEGOC(+) = CF.UNIDNEGOC'+CR_LF+
  'AND'+CR_LF+
  '(CF.IDPROVENTO = ' + FloatToStr(IdProvento) + ')');
end;

function TCtrlCtFolha.ListCentCustContab(IdProvento: Double; ContDebito, ContCredito: String): OleVariant;
begin
  //Thaise SOL 136200 - Carregar contas e seus respectivoc centro de custo
  Result := GetDataPacket(
            'SELECT IDCONTABFOLHA,'                                   +CR_LF+
            'RTRIM(C.CODCENTROCUSTO) AS CODCENTROCUSTO,'              +CR_LF+
            'C.NOME, C.STATUSGRUPOCDC '                               +CR_LF+
            'FROM CONTABFOLHA CF, CENTCUST C'                         +CR_LF+
            'WHERE CF.CODCENTROCUSTO(+) = C.CODCENTROCUSTO'           +CR_LF+
            'AND (CF.IDPROVENTO    = ' + FloatToStr(IdProvento) + ')' +CR_LF+
            'AND (CF.CONTADEBITO   = ' + QuotedStr(ContDebito)  + ')' +CR_LF+
            'AND (CF.CONTACREDITO  = ' + QuotedStr(ContCredito) + ')' +CR_LF+
            'AND C.ATIVO = ''S'' '                                    +CR_LF+
            'ORDER BY C.CODCENTROCUSTO'
            );
end;

function TCtrlCtFolha.ListCentCustIns(IdProvento: Double; ContDebito, ContCredito: String): OleVariant;
begin
  //Thaise SOL 136200 - Carregar centro de custos que não estão relacionados à conta
  Result := GetDataPacket(
            'SELECT RTRIM(CODCENTROCUSTO) AS CODCENTROCUSTO,'                    +CR_LF+
            '       STATUSGRUPOCDC,'                                             +CR_LF+
            '       NOME '                                                       +CR_LF+
            '  FROM CENTCUST'                                                    +CR_LF+
            ' WHERE (IDEMPRESA = 1)'                                             +CR_LF+
            '   AND CODCENTROCUSTO NOT IN'                                       +CR_LF+
            '       (SELECT CF.CODCENTROCUSTO'                                   +CR_LF+
            '          FROM CONTABFOLHA CF, CENTCUST C'                          +CR_LF+
            '         WHERE CF.CODCENTROCUSTO(+) = C.CODCENTROCUSTO'             +CR_LF+
            '           AND (CF.IDPROVENTO =   ' + FloatToStr(IdProvento) + ')'  +CR_LF+
            '           AND (CF.CONTADEBITO =  ' + QuotedStr(ContDebito)  + ')'  +CR_LF+
            '           AND (CF.CONTACREDITO = ' + QuotedStr(ContCredito) + '))' +CR_LF+
            ' AND ATIVO = ''S'' '                                                +CR_LF+
            ' ORDER BY CODCENTROCUSTO'
            );
end;

function TCtrlCtFolha.ListCentCustContabCodExt(IdProvento: Double; ContDebito, ContCredito: String): OleVariant;
begin
  //Thaise SOL 136200 - Carregar contas e seus respectivoc centro de custo
  Result := GetDataPacket(
            'SELECT IDCONTABFOLHA,'                                   +CR_LF+
            'RTRIM(C.CODEXTERNO) AS CODCENTROCUSTO,'                  +CR_LF+
            'RTRIM(C.CODCENTROCUSTO) AS CODCENTROCUSTO_CORRETO,'      +CR_LF+
            'C.NOME, C.STATUSGRUPOCDC '                               +CR_LF+
            'FROM CONTABFOLHA CF, CENTCUST C'                         +CR_LF+
            'WHERE CF.CODCENTROCUSTO(+) = C.CODCENTROCUSTO'           +CR_LF+
            'AND (CF.IDPROVENTO    = ' + FloatToStr(IdProvento) + ')' +CR_LF+
            'AND (CF.CONTADEBITO   = ' + QuotedStr(ContDebito)  + ')' +CR_LF+
            'AND (CF.CONTACREDITO  = ' + QuotedStr(ContCredito) + ')' +CR_LF+
            'AND C.ATIVO = ''S'' '                                    +CR_LF+
            'ORDER BY C.CODEXTERNO'
            );
end;

function TCtrlCtFolha.ListCentCustInsCodExt(IdProvento: Double; ContDebito, ContCredito: String): OleVariant;
begin
  //Thaise SOL 136200 - Carregar centro de custos que não estão relacionados à conta
  Result := GetDataPacket(
            'SELECT RTRIM(CODEXTERNO) AS CODCENTROCUSTO,'                        +CR_LF+
            '       RTRIM(CODCENTROCUSTO) AS CODCENTROCUSTO_CORRETO,'            +CR_LF+
            '       STATUSGRUPOCDC,'                                             +CR_LF+
            '       NOME '                                                       +CR_LF+
            '  FROM CENTCUST'                                                    +CR_LF+
            ' WHERE (IDEMPRESA = 1)'                                             +CR_LF+
            '   AND CODCENTROCUSTO NOT IN'                                       +CR_LF+
            '       (SELECT CF.CODCENTROCUSTO'                                   +CR_LF+
            '          FROM CONTABFOLHA CF, CENTCUST C'                          +CR_LF+
            '         WHERE CF.CODCENTROCUSTO(+) = C.CODCENTROCUSTO'             +CR_LF+
            '           AND (CF.IDPROVENTO =   ' + FloatToStr(IdProvento) + ')'  +CR_LF+
            '           AND (CF.CONTADEBITO =  ' + QuotedStr(ContDebito)  + ')'  +CR_LF+
            '           AND (CF.CONTACREDITO = ' + QuotedStr(ContCredito) + '))' +CR_LF+
            ' AND ATIVO = ''S'' '                                                +CR_LF+
            ' ORDER BY CODEXTERNO'
            );
end;





end.

