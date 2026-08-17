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

uses SysUtils, uCmDbObject, uCmControlObject, IvDictio, uCMTranslate, uCMClientDataSet,
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
    constructor Create; override;
    destructor  Destroy; override;

    function ListGeral(IdAval: double = 0): OleVariant;
    function ListDetalhe(IdAval: double): OleVariant;
    function ListDetalhe2(IdAval: double): OleVariant;
    function Gravar: boolean;
    function Excluir: boolean;
    function ContaEmpregados(IdEmpre, IdEstab, IdLocal, IdCargo, IdHorario: double): OleVariant;

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
    '  PPRAAVAL'+CR_LF+
    IFF(IdAval=-1, 'WHERE (1 = 2)',
      IFF(IdAval=0, '', 'WHERE'+CR_LF+
        '  (IDAVAL = ' +FloatToStr(IdAval)+ ')')));
end;

function TCtrlPpraAval.ListDetalhe(IdAval: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    'PA.IDAGENTERISCO, PA.IDAVAL, PA.IDPPRAMEIOCONT, PA.IDPPRAMEIOPROP,'+CR_LF+
    'PA.INDPERIODO, PA.GRADUACAO, PA.OBSERVACAO, PR.DESCRICAO'+CR_LF+
    'FROM'+CR_LF+
    '  PPRAAGENTEAVAL PA, PPRAAGENTERISCO PR'+CR_LF+
    'WHERE'+CR_LF+
    '  (PA.IDAVAL        = ' +FloatToStr(IdAval)+ ') AND'+CR_LF+
    '  (PA.IDAGENTERISCO = PR.IDAGENTERISCO)'+CR_LF+
    'ORDER BY'+CR_LF+
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

function TCtrlPpraAval.ContaEmpregados(IdEmpre, IdEstab, IdLocal, IdCargo,
  IdHorario: double): OleVariant;
var
  c: byte;
  sSQL, sSexo, sDeficiente, sMaior: string;
  _CdsAux, _CdsResult: TCMClientDataSet;
begin
  _CdsResult := TCMClientDataSet.Create(nil);
  _CdsAux := TCMClientDataSet.Create(nil);
  try
    _CdsResult.Data := GetDataPacket('SELECT 0 AS CONTA FROM DUAL WHERE (1 = 2)');
    for c:=1 to 8 do
    begin
      case (c) of // Opção Sexo
        1,3,5,7 : sSexo := 'M'; // Masculino
        2,4,6,8 : sSexo := 'F'; // Feminino
      end;

      case (c) of // Opção Deficiente Físico
        1,2,5,6 : sDeficiente := '<> 1'; // Não
        3,4,7,8 : sDeficiente := ' = 1'; // Sim
      end;

      case (c) of // Maior de Idade
        1..4 : sMaior := '>= 18'; // Sim
        5..8 : sMaior := '<  18'; // Não
      end;

      sSQL :=
        'SELECT /*+ RULE */'+CR_LF+
        '  COUNT(*) AS CONTA'+CR_LF+
        'FROM'+CR_LF+
        '  PESSOAFISICA P, FUNCIONARIO F, SITFUNC S';

      if (IdLocal > 0) then
        sSQL := sSQL + ', LOCALIZACAO L';

      sSQL := sSQL +CR_LF+ 'WHERE'+CR_LF;

      if (IdHorario > 0) then
        sSQL := sSQL + '  (F.IDHORARIO      = ' +FloatToStr(IdHorario)+ ') AND'+CR_LF;

      if (IdEstab > 0) then
        sSQL := sSQL + '  (F.IDESTAB        = ' +FloatToStr(IdEstab)+   ') AND'+CR_LF;

      if (IdEmpre > 0) then
        sSQL := sSQL + '  (F.IDEMPRESA      = ' +FloatToStr(IdEmpre)+   ') AND'+CR_LF;

      if (IdCargo > 0) then
        sSQL := sSQL + '  (F.IDCARGO        = ' +FloatToStr(IdCargo)+   ') AND'+CR_LF;

      if (IdLocal > 0) then
        sSQL := sSQL + '  (L.IDLOCALIZACAO  = ' +FloatToStr(IdLocal)+   ') AND'+CR_LF;

      sSQL := sSQL +
        '  (P.SEXO         = ' +QuotedStr(sSexo)+ ') AND'+CR_LF+
        '  (S.TIPOSIT      = ''A'') AND'+CR_LF+
        '  (TRUNC(TO_NUMBER(SYSDATE - 1 - P.DATANASC)/365.25,0) ' +sMaior+ ') AND'+CR_LF+
        '  (NVL(P.FLGDEFICIENTE,0) ' +sDeficiente+ ')  AND'+CR_LF;

      if (IdLocal > 0) then
        sSQL := sSQL + '  (L.IDEMPRESA      = F.IDEMPRESA) AND'+CR_LF;

      if (IdLocal > 0) then
        sSQL := sSQL + '  (L.CODCENTROCUSTO = F.CODCENTROCUSTO) AND'+CR_LF;

      sSQL := sSQL +
        '  (S.IDSITFUNC    = F.IDSITFUNC) AND'+CR_LF+
        '  (F.IDPESSOA     = P.IDPESSOA)';

      _CdsAux.Data := GetDataPacket(sSQL);

      _CdsResult.Append;
      _CdsResult.FieldByName('CONTA').asInteger := _CdsAux.FieldByName('CONTA').asInteger;
      _CdsResult.Post;
    end;

    Result := _CdsResult.Data;
  finally
    _CdsAux.Free;
    _CdsResult.Free;
  end;
end;

function TCtrlPpraAval.Gravar: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarPpraAval(FCds.Data, FCdsDet.Data, FCdsDet2.Data);
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
    Result := Connection.AppServer.ExcluirPpraAval(FCds.Data, FCdsDet.Data, FCdsDet2.Data);
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
