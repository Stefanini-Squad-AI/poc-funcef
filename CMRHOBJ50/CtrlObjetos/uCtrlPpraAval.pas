{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 31/01/2002                                 }
{                                                       }
{*******************************************************}

unit uCtrlPpraAval;

interface

uses SysUtils, uSistema, uCmDbObject, uCmControlObject, uCMClientDataSet,
  uCtrlCustomRH, uDbPpraAval, uDbPpraAgenteAval, uDbPpraMedidas;

type
  TCtrlPpraAval = class(TCtrlCustomRH)
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override;
  private
    FDb: TDbPpraAval;
    FDbDet: TDbPpraAgenteAval;
    FDbDet2: TDbPpraMedidas;
    FCds: TCMClientDataSet;
    FCdsDet: TCMClientDataSet;
    FCdsDet2: TCMClientDataSet;
  public
    constructor Create;  override;
    destructor  Destroy; override;

    function ListGeral(IdAval: double = 0): OleVariant;
    function ListDetalhe(IdAval: double): OleVariant;
    function ListDetalhe2(IdAval: double): OleVariant;
    function Gravar: boolean;
    function Excluir: boolean;
    function ContaEmpregados(IdEmpre, IdEstab, IdLocal, IdCargo, IdHorario: integer): OleVariant;

    property Cds: TCMClientDataSet read FCds write FCds;
    property CdsDet: TCMClientDataSet read FCdsDet write FCdsDet;
    property CdsDet2: TCMClientDataSet read FCdsDet2 write FCdsDet2;
  end;

implementation

uses uCMTypes, uCtrlFuncoesRH;

{ TCtrlPpraAval }

constructor TCtrlPpraAval.Create;
begin
  inherited;
  FDb := TDbPpraAval.Create(Self);
  FDbDet := TDbPpraAgenteAval.Create(Self);
  FDbDet2:= TDbPpraMedidas.Create(Self);
end;

destructor TCtrlPpraAval.Destroy;
begin
  FDbDet.Free;
  FDbDet2.Free;
  FDb.Free;
  if isAppServer then
  begin
    FCds.Free;
    FCdsDet.Free;
    FCdsDet2.Free;
  end;
  inherited;
end;

procedure TCtrlPpraAval.OnCreateAppServer;
begin
  inherited;
  FCds := TCMClientDataSet.Create(nil);
  FCdsDet := TCMClientDataSet.Create(nil);
  FCdsDet2:= TCMClientDataSet.Create(nil);
end;

procedure TCtrlPpraAval.DoChangeDataBase;
begin
  inherited;
  FDb.DataBaseName := DataBaseName;
  FDbDet.DataBaseName := DataBaseName;
  FDbDet2.DataBaseName := DataBaseName;
end;

function TCtrlPpraAval.ListGeral(IdAval: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+IFF(IdAval=-1,' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
    '  IDAVAL, IDHORARIO, IDCARGO, IDLOCALIZACAO, IDPESSOA,'+CR_LF+
    '  IDEMPRESA, IDESTAB, IDCONTATO, IDRESPONSAVEL, INDTIPOAVAL,'+CR_LF+
    '  DESCRICAO, TEXTOCOMPL, INDABRANGENCIA, DATAAVAL '+CR_LF+
    'FROM'+CR_LF+
    '  PpraAval'+CR_LF+
    IFF(IdAval=-1, 'WHERE (1 = 2)',
      IFF(IdAval=0, '', 'WHERE'+CR_LF+
        '  (IdAval = ' +FloatToStr(IdAval)+ ')')));
end;

function TCtrlPpraAval.ListDetalhe(IdAval: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT' +CR_LF+
    'PA.IDAGENTERISCO, PA.IDAVAL, PA.IDPPRAMEIOCONT, PA.IDPPRAMEIOPROP,'+CR_LF+
    'PA.INDPERIODO, PA.GRADUACAO, PA.OBSERVACAO, PR.DESCRICAO' +CR_LF+
    'FROM' +CR_LF+
    '  PPRAAGENTEAVAL PA, PPRAAGENTERISCO PR ' +CR_LF+
    'WHERE' +CR_LF+
    '  (PA.IDAVAL        = ' +FloatToStr(IdAval)+ ') AND' +CR_LF+
    '  (PA.IDAGENTERISCO = PR.IDAGENTERISCO)' +CR_LF+
    'ORDER BY' +CR_LF+
    '  UPPER(PR.DESCRICAO)');
end;

function TCtrlPpraAval.ListDetalhe2(IdAval: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    'PM.IDACOES, PM.IDAVAL, PM.DATAPLAN, PM.DATAREAL,'+CR_LF+
    'PA.DESCRICAO, PM.IDCLASSEBEM, CB.DESCRICAO AS CLASSEBEM'+CR_LF+
    'FROM'+CR_LF+
    '  PPRAACOES PA, PPRAMEDIDAS PM, CLASSEDEBEM CB'+CR_LF+
    'WHERE'+CR_LF+
    '  (PM.IDAVAL      = '+FloatToStr(IdAval)+') AND'+CR_LF+
    '  (PM.IDACOES     = PA.IDACOES) AND'+CR_LF+
    '  (PM.IDCLASSEBEM = CB.IDCLASSEBEM(+))'+CR_LF+
    'ORDER BY'+CR_LF+
    '  UPPER(PA.DESCRICAO)');
end;

function TCtrlPpraAval.ContaEmpregados(IdEmpre, IdEstab, IdLocal, IdCargo, IdHorario: integer): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT /*+ RULE */'+CR_LF+
    '  COUNT(*) AS CONTA'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOAFISICA P, FUNCIONARIO F, SITFUNC S'+CR_LF+
    iff(IdLocal <= 0, '', '  , LOCALIZACAO L')+CR_LF+
    'WHERE'+CR_LF+
    iff(IdHorario <= 0, '', '  (F.IDHORARIO     = '+ IntToStr(IdHorario) + ') AND')+CR_LF+
    iff(IdEstab <= 0, '', '  (F.IDESTAB     = '+ IntToStr(IdEstab) + ') AND')+CR_LF+
    iff(IdEmpre <= 0, '', '  (F.IDEMPRESA   = '+ IntToStr(IdEmpre) + ') AND')+CR_LF+
    iff(IdCargo <= 0, '', '  (F.IDCARGO     = '+ IntToStr(IdCargo) + ') AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.IDLOCALIZACAO = '+ IntToStr(IdLocal) + ') AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.IDEMPRESA   = F.IDEMPRESA) AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.CODCENTROCUSTO = F.CODCENTROCUSTO) AND')+CR_LF+
    '  (P.SEXO         = ''M'') AND'+CR_LF+
    '  (S.TIPOSIT      = ''A'') AND'+CR_LF+
    '  (TRUNC((SYSDATE - 1 - P.DATANASC)/365.25) >= 18) AND'+CR_LF+
    '  (NVL(P.FLGDEFICIENTE,2) = 2)  AND'+CR_LF+
    '  (S.IDSITFUNC    = F.IDSITFUNC) AND'+CR_LF+
    '  (F.IDPESSOA     = P.IDPESSOA)'+CR_LF+
    'UNION ALL'+CR_LF+
    'SELECT /*+ RULE */'+CR_LF+
    '  COUNT(*) AS CONTA'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOAFISICA P, FUNCIONARIO F, SITFUNC S'+CR_LF+
    iff(IdLocal <= 0, '', '  , LOCALIZACAO L')+CR_LF+
    'WHERE'+CR_LF+
    iff(IdHorario <= 0, '', '  (F.IDHORARIO     = '+ IntToStr(IdHorario) + ') AND')+CR_LF+
    iff(IdEstab <= 0, '', '  (F.IDESTAB     = '+ IntToStr(IdEstab) + ') AND')+CR_LF+
    iff(IdEmpre <= 0, '', '  (F.IDEMPRESA   = '+ IntToStr(IdEmpre) + ') AND')+CR_LF+
    iff(IdCargo <= 0, '', '  (F.IDCARGO     = '+ IntToStr(IdCargo) + ') AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.IDLOCALIZACAO = '+ IntToStr(IdLocal) + ') AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.IDEMPRESA   = F.IDEMPRESA) AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.CODCENTROCUSTO = F.CODCENTROCUSTO) AND')+CR_LF+
    '  (P.SEXO         = ''F'') AND'+CR_LF+
    '  (S.TIPOSIT      = ''A'') AND'+CR_LF+
    '  (TRUNC((SYSDATE - 1 - P.DATANASC)/365.25) >= 18) AND'+CR_LF+
    '  (NVL(P.FLGDEFICIENTE,2) = 2)  AND'+CR_LF+
    '  (S.IDSITFUNC    = F.IDSITFUNC) AND'+CR_LF+
    '  (F.IDPESSOA     = P.IDPESSOA)'+CR_LF+
    'UNION ALL'+CR_LF+
    'SELECT /*+ RULE */'+CR_LF+
    '  COUNT(*) AS CONTA'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOAFISICA P, FUNCIONARIO F, SITFUNC S'+CR_LF+
    iff(IdLocal <= 0, '', '  , LOCALIZACAO L')+CR_LF+
    'WHERE'+CR_LF+
    iff(IdHorario <= 0, '', '  (F.IDHORARIO     = '+ IntToStr(IdHorario) + ') AND')+CR_LF+
    iff(IdEstab <= 0, '', '  (F.IDESTAB     = '+ IntToStr(IdEstab) + ') AND')+CR_LF+
    iff(IdEmpre <= 0, '', '  (F.IDEMPRESA   = '+ IntToStr(IdEmpre) + ') AND')+CR_LF+
    iff(IdCargo <= 0, '', '  (F.IDCARGO     = '+ IntToStr(IdCargo) + ') AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.IDLOCALIZACAO = '+ IntToStr(IdLocal) + ') AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.IDEMPRESA   = F.IDEMPRESA) AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.CODCENTROCUSTO = F.CODCENTROCUSTO) AND')+CR_LF+
    '  (P.SEXO         = ''M'') AND'+CR_LF+
    '  (S.TIPOSIT      = ''A'') AND'+CR_LF+
    '  (TRUNC((SYSDATE - 1 - P.DATANASC)/365.25) >= 18) AND'+CR_LF+
    '  (NVL(P.FLGDEFICIENTE,2) <> 2)  AND'+CR_LF+
    '  (S.IDSITFUNC    = F.IDSITFUNC) AND'+CR_LF+
    '  (F.IDPESSOA     = P.IDPESSOA)'+CR_LF+
    'UNION ALL'+CR_LF+
    'SELECT /*+ RULE */'+CR_LF+
    '  COUNT(*) AS CONTA'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOAFISICA P, FUNCIONARIO F, SITFUNC S'+CR_LF+
    iff(IdLocal <= 0, '', '  , LOCALIZACAO L')+CR_LF+
    'WHERE'+CR_LF+
    iff(IdHorario <= 0, '', '  (F.IDHORARIO     = '+ IntToStr(IdHorario) + ') AND')+CR_LF+
    iff(IdEstab <= 0, '', '  (F.IDESTAB     = '+ IntToStr(IdEstab) + ') AND')+CR_LF+
    iff(IdEmpre <= 0, '', '  (F.IDEMPRESA   = '+ IntToStr(IdEmpre) + ') AND')+CR_LF+
    iff(IdCargo <= 0, '', '  (F.IDCARGO     = '+ IntToStr(IdCargo) + ') AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.IDLOCALIZACAO = '+ IntToStr(IdLocal) + ') AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.IDEMPRESA   = F.IDEMPRESA) AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.CODCENTROCUSTO = F.CODCENTROCUSTO) AND')+CR_LF+
    '  (P.SEXO         = ''F'') AND'+CR_LF+
    '  (S.TIPOSIT      = ''A'') AND'+CR_LF+
    '  (TRUNC((SYSDATE - 1 - P.DATANASC)/365.25) >= 18) AND'+CR_LF+
    '  (NVL(P.FLGDEFICIENTE,2) <> 2)  AND'+CR_LF+
    '  (S.IDSITFUNC    = F.IDSITFUNC) AND'+CR_LF+
    '  (F.IDPESSOA     = P.IDPESSOA)'+CR_LF+
    'UNION ALL'+CR_LF+
    'SELECT /*+ RULE */'+CR_LF+
    '  COUNT(*) AS CONTA'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOAFISICA P, FUNCIONARIO F, SITFUNC S'+CR_LF+
    iff(IdLocal <= 0, '', '  , LOCALIZACAO L')+CR_LF+
    'WHERE'+CR_LF+
    iff(IdHorario <= 0, '', '  (F.IDHORARIO     = '+ IntToStr(IdHorario) + ') AND')+CR_LF+
    iff(IdEstab <= 0, '', '  (F.IDESTAB     = '+ IntToStr(IdEstab) + ') AND')+CR_LF+
    iff(IdEmpre <= 0, '', '  (F.IDEMPRESA   = '+ IntToStr(IdEmpre) + ') AND')+CR_LF+
    iff(IdCargo <= 0, '', '  (F.IDCARGO     = '+ IntToStr(IdCargo) + ') AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.IDLOCALIZACAO = '+ IntToStr(IdLocal) + ') AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.IDEMPRESA   = F.IDEMPRESA) AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.CODCENTROCUSTO = F.CODCENTROCUSTO) AND')+CR_LF+
    '  (P.SEXO         = ''M'') AND'+CR_LF+
    '  (S.TIPOSIT      = ''A'') AND'+CR_LF+
    '  (TRUNC((SYSDATE - 1 - P.DATANASC)/365.25) < 18) AND'+CR_LF+
    '  (NVL(P.FLGDEFICIENTE,2) = 2)  AND'+CR_LF+
    '  (S.IDSITFUNC    = F.IDSITFUNC) AND'+CR_LF+
    '  (F.IDPESSOA     = P.IDPESSOA)'+CR_LF+
    'UNION ALL'+CR_LF+
    'SELECT /*+ RULE */'+CR_LF+
    '  COUNT(*) AS CONTA'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOAFISICA P, FUNCIONARIO F, SITFUNC S'+CR_LF+
    iff(IdLocal <= 0, '', '  , LOCALIZACAO L')+CR_LF+
    'WHERE'+CR_LF+
    iff(IdHorario <= 0, '', '  (F.IDHORARIO     = '+ IntToStr(IdHorario) + ') AND')+CR_LF+
    iff(IdEstab <= 0, '', '  (F.IDESTAB     = '+ IntToStr(IdEstab) + ') AND')+CR_LF+
    iff(IdEmpre <= 0, '', '  (F.IDEMPRESA   = '+ IntToStr(IdEmpre) + ') AND')+CR_LF+
    iff(IdCargo <= 0, '', '  (F.IDCARGO     = '+ IntToStr(IdCargo) + ') AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.IDLOCALIZACAO = '+ IntToStr(IdLocal) + ') AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.IDEMPRESA   = F.IDEMPRESA) AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.CODCENTROCUSTO = F.CODCENTROCUSTO) AND')+CR_LF+
    '  (P.SEXO         = ''F'') AND'+CR_LF+
    '  (S.TIPOSIT      = ''A'') AND'+CR_LF+
    '  (TRUNC((SYSDATE - 1 - P.DATANASC)/365.25) < 18) AND'+CR_LF+
    '  (NVL(P.FLGDEFICIENTE,2) = 2)  AND'+CR_LF+
    '  (S.IDSITFUNC    = F.IDSITFUNC) AND'+CR_LF+
    '  (F.IDPESSOA     = P.IDPESSOA)'+CR_LF+
    'UNION ALL'+CR_LF+
    'SELECT /*+ RULE */'+CR_LF+
    '  COUNT(*) AS CONTA'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOAFISICA P, FUNCIONARIO F, SITFUNC S'+CR_LF+
    iff(IdLocal <= 0, '', '  , LOCALIZACAO L')+CR_LF+
    'WHERE'+CR_LF+
    iff(IdHorario <= 0, '', '  (F.IDHORARIO     = '+ IntToStr(IdHorario) + ') AND')+CR_LF+
    iff(IdEstab <= 0, '', '  (F.IDESTAB     = '+ IntToStr(IdEstab) + ') AND')+CR_LF+
    iff(IdEmpre <= 0, '', '  (F.IDEMPRESA   = '+ IntToStr(IdEmpre) + ') AND')+CR_LF+
    iff(IdCargo <= 0, '', '  (F.IDCARGO     = '+ IntToStr(IdCargo) + ') AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.IDLOCALIZACAO = '+ IntToStr(IdLocal) + ') AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.IDEMPRESA   = F.IDEMPRESA) AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.CODCENTROCUSTO = F.CODCENTROCUSTO) AND')+CR_LF+
    '  (P.SEXO         = ''M'') AND'+CR_LF+
    '  (S.TIPOSIT      = ''A'') AND'+CR_LF+
    '  (TRUNC((SYSDATE - 1 - P.DATANASC)/365.25) < 18) AND'+CR_LF+
    '  (NVL(P.FLGDEFICIENTE,2) <> 2)  AND'+CR_LF+
    '  (S.IDSITFUNC    = F.IDSITFUNC) AND'+CR_LF+
    '  (F.IDPESSOA     = P.IDPESSOA)'+CR_LF+
    'UNION ALL'+CR_LF+
    'SELECT /*+ RULE */'+CR_LF+
    '  COUNT(*) AS CONTA'+CR_LF+
    'FROM'+CR_LF+
    '  PESSOAFISICA P, FUNCIONARIO F, SITFUNC S'+CR_LF+
    iff(IdLocal <= 0, '', '  , LOCALIZACAO L')+CR_LF+
    'WHERE'+CR_LF+
    iff(IdHorario <= 0, '', '  (F.IDHORARIO     = '+ IntToStr(IdHorario) + ') AND')+CR_LF+
    iff(IdEstab <= 0, '', '  (F.IDESTAB     = '+ IntToStr(IdEstab) + ') AND')+CR_LF+
    iff(IdEmpre <= 0, '', '  (F.IDEMPRESA   = '+ IntToStr(IdEmpre) + ') AND')+CR_LF+
    iff(IdCargo <= 0, '', '  (F.IDCARGO     = '+ IntToStr(IdCargo) + ') AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.IDLOCALIZACAO = '+ IntToStr(IdLocal) + ') AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.IDEMPRESA   = F.IDEMPRESA) AND')+CR_LF+
    iff(IdLocal <= 0, '', '  (L.CODCENTROCUSTO = F.CODCENTROCUSTO) AND')+CR_LF+
    '  (P.SEXO         = ''F'') AND'+CR_LF+
    '  (S.TIPOSIT      = ''A'') AND'+CR_LF+
    '  (TRUNC((SYSDATE - 1 - P.DATANASC)/365.25) < 18) AND'+CR_LF+
    '  (NVL(P.FLGDEFICIENTE,2) <> 2)  AND'+CR_LF+
    '  (S.IDSITFUNC    = F.IDSITFUNC) AND'+CR_LF+
    '  (F.IDPESSOA     = P.IDPESSOA)');
end;

function TCtrlPpraAval.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Gravar(FCds.Data, FCdsDet.Data, FCdsDet2.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(FCds, FDb, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCdsDet, FDbDet, [FDb.Idaval], [FDbDet.Idaval]);
        if (Result) then
        begin
          Result := ApplyCds(FCdsDet2, FDbDet2, [FDb.Idaval], [FDbDet2.Idaval]);
          if not(Result) then
            raise Exception.Create(FDbDet2.MessageInfo);
        end
        else
           raise Exception.Create(FDbDet.MessageInfo);
      end
      else
        raise Exception.Create(FDb.MessageInfo);

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

function TCtrlPpraAval.Excluir: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.Excluir(FCds.Data, FCdsDet.Data, FCdsDet2.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      FCdsDet.First;
      while not(FCdsDet.EOF) do
        FCdsDet.Delete;

      FCdsDet2.First;
      while not(FCdsDet2.EOF) do
        FCdsDet2.Delete;

      StartTransaction;
      Result := ApplyCds(FCdsDet2, FDbDet2, [], []);
      if (Result) then
      begin
        Result := ApplyCds(FCdsDet, FDbDet, [], []);
        if (Result) then
        begin
          Result := ApplyCds(FCds, FDb, [], []);
          if not(Result) then
            raise Exception.Create(FDb.MessageInfo);
        end
        else
          raise Exception.Create(FDbDet.MessageInfo);
      end
      else
        raise Exception.Create(FDbDet2.MessageInfo);

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
