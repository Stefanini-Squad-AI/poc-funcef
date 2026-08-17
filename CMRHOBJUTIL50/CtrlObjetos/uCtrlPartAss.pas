{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Eugenio Frioli                  }
{ Criado Em: 29/03/2004                                 }
{                                                       }
{*******************************************************}

unit uCtrlPartAss;

interface

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMTranslate, uCMClientDataSet,
  uCtrlCustomRH, uDbPartAss, uDbBenefAss;

type
  TCtrlPartAss = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDbPartAss: TDbPartAss;
    FCdsPartAss: TCMClientDataSet;
    FDbBenefAss: TDbBenefAss;
    FCdsBenefAss: TCMClientDataSet;
  public
    constructor Create; override;
    destructor  Destroy; override;

    function ListPartAss(IdPessoa: double = 0): OleVariant;
    function ListBenefAss(IdTitular: double = 0; IdDependente: double = 0;
      IdPlanAss: double = 0): OleVariant;
    function ListDependentesPessoa(const IdPessoa, IdPlanAss: double;
      const ListaTipo: string = ''): OleVariant;
    function ListIdPlanoPrev(IdPessoa: double = 0): integer;

    function GravarPartAss: boolean;
    function ExcluirPartAss: boolean;

    property CdsPartAss: TCMClientDataSet read FCdsPartAss write FCdsPartAss;
    property CdsBenefAss: TCMClientDataSet read FCdsBenefAss write FCdsBenefAss;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlPartAss }

constructor TCtrlPartAss.Create;
begin
  inherited;
  FDbPartAss := TDbPartAss.Create(Self);
  FDbBenefAss := TDbBenefAss.Create(Self);
end;

destructor TCtrlPartAss.Destroy;
begin
  FDbPartAss.Free;
  FDbBenefAss.Free;
  if (IsAppServer) then
  begin
    FCdsPartAss.Free;
    FCdsBenefAss.Free;
  end;
  inherited;
end;

procedure TCtrlPartAss.OnCreateAppServer;
begin
  inherited;
  FCdsPartAss := TCMClientDataSet.Create(nil);
  FCdsBenefAss := TCMClientDataSet.Create(nil);
end;

procedure TCtrlPartAss.DoChangeDataBase;
begin
  inherited;
  FDbPartAss.DataBaseName := DataBaseName;
  FDbBenefAss.DataBaseName := DataBaseName;
end;

function TCtrlPartAss.ListPartAss(IdPessoa: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdPessoa=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  P.*, PL.NOME AS PLANO, PR.NOME AS PRODUTO'+CR_LF+
    'FROM'+CR_LF+
    '  PARTASS P, FUNCIONARIO F, PLANASS PL, PRODASS PR'+CR_LF+
    'WHERE'+CR_LF+
    IFF(IdPessoa=0,'','  (P.IDPESSOA   = '+FloatToStr(IdPessoa)+') AND'+CR_LF)+
    '  (P.IDPLANASS  = PL.IDPLANASS) AND'+CR_LF+
    '  (P.IDPESSOA   = F.IDPESSOA) AND'+CR_LF+
    '  (PL.IDPRODASS = PR.IDPRODASS)'+CR_LF+
    'ORDER BY P.IDPESSOA, UPPER(PL.NOME)');
end;

function TCtrlPartAss.ListBenefAss(IdTitular: double = 0;
          IdDependente: double = 0; IdPlanAss: double = 0): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdTitular=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  B.*, PL.NOME AS PLANO, PR.NOME AS PRODUTO, P2.NOME AS DEPENDENTE,'+CR_LF+
    '  P1.NOME AS TITULAR'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOA P1, PESSOA P2, BENEFASS B, FUNCIONARIO F, PLANASS PL, PRODASS PR'+CR_LF+
    'WHERE'+CR_LF+
    IFF(IdTitular=0,'','  (B.IDTITULAR   = '+FloatToStr(IdTitular)+') AND'+CR_LF)+
    IFF(IdDependente=0,'','  (B.IDDEPENDENTE   = '+FloatToStr(IdDependente)+') AND'+CR_LF)+
    IFF(IdPlanAss=0,'','  (B.IDPLANASS   = '+FloatToStr(IdPlanAss)+') AND'+CR_LF)+
    '  (B.IDPLANASS    = PL.IDPLANASS) AND'+CR_LF+
    '  (B.IDTITULAR    = F.IDPESSOA) AND'+CR_LF+
    '  (B.IDTITULAR    = P1.IDPESSOA) AND'+CR_LF+
    '  (B.IDDEPENDENTE = P2.IDPESSOA) AND'+CR_LF+
    '  (PL.IDPRODASS   = PR.IDPRODASS)'+CR_LF+
    'ORDER BY B.IDTITULAR, UPPER(PL.NOME), UPPER(P2.NOME)');
end;

function TCtrlPartAss.ListDependentesPessoa(const IdPessoa, IdPlanAss: double;
  const ListaTipo: string): OleVariant;
var
  sSQL: string;
begin
  if (ListaTipo = '') then
    sSQL := '  (DPT.IDDEPENDENCIA <> ''PRP'') AND'
  else
  begin
    if (Pos(',',ListaTipo) > 0) then
      sSQL := '  (DPT.IDDEPENDENCIA IN (' +QuotedListaString(ListaTipo, ',', true)+ ')) AND'
    else
      sSQL := '  (DPT.IDDEPENDENCIA  = ' +QuotedStr(ListaTipo)+ ') AND';
  end;

  Result := GetDataPacket(
    'SELECT' +CR_LF+
    '  P.NOME, DP.DESCRICAO, PF.DATANASC, DPT.IDPESSOA' +CR_LF+
    'FROM' +CR_LF+
    '  PESSOA P, DEPEN DP, DEPENTIT DPT, PESSOAFISICA PF' +CR_LF+
    'WHERE' +CR_LF+
    '  (DPT.IDTITULAR     = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    sSQL +CR_LF+
    '  (DPT.IDPESSOA      = PF.IDPESSOA) AND' +CR_LF+
    '  (DPT.IDDEPENDENCIA = DP.IDDEPENDENCIA) AND' +CR_LF+
    '  (DPT.IDPESSOA      = P.IDPESSOA) AND' +CR_LF+
    '  (DPT.IDPESSOA NOT IN (SELECT IDDEPENDENTE' +CR_LF+
    '                        FROM   BENEFASS' +CR_LF+
    '                        WHERE  (IDTITULAR = ' +FloatToStr(IdPessoa)+ ') AND' +CR_LF+
    '                               (IDPLANASS = ' +FloatToStr(IdPlanAss)+ ')))' +CR_LF+
    'ORDER BY' +CR_LF+
    '  NUMSEQUENCIA');
end;

function TCtrlPartAss.ListIdPlanoPrev(IdPessoa: double = 0): integer;
var
  _CdsAux: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);

  _CdsAux.Close;
  _CdsAux.Data := GetDataPacket(
    'SELECT'+CR_LF+
    '  IDPLANOPREV'+CR_LF+
    'FROM'+CR_LF+
    '  PARTPREVPLAN'+CR_LF+
    'WHERE'+CR_LF+
    '  (IDPESSOA = ' +FloatToStr(IdPessoa)+')');

  Result := _CdsAux.FieldByName('IDPLANOPREV').asInteger;

  _CdsAux.Free;
end;

function TCtrlPartAss.GravarPartAss: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarPartAss(FCdsPartAss.Data, FCdsBenefAss.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsPartAss, FDbPartAss, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCdsBenefAss, FDbBenefAss, [], []);
        if not(Result) then
          raise Exception.Create(FDbBenefAss.MessageInfo);
      end
      else
        raise Exception.Create(FDbPartAss.MessageInfo);

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

function TCtrlPartAss.ExcluirPartAss: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.ExcluirPlanAss(FCdsPartAss.Data, FCdsBenefAss.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      FCdsBenefAss.First;
      while not(FCdsBenefAss.EOF) do
        FCdsBenefAss.Delete;

      StartTransaction;

      Result := ApplyCds(FCdsBenefAss, FDbBenefAss, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCdsPartAss, FDbPartAss, [], []);
        if not(Result) then
          MessageInfo := FDbPartAss.MessageInfo;
      end
      else
        MessageInfo := FDbBenefAss.MessageInfo;

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
