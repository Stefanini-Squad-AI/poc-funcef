unit uCtrlCadRegra;

interface

uses SysUtils, uCmControlObject, uCmDbObject, uCmClientDataSet, uCMTypes, IvDictio, 
     uCtrlCustomRH, uDbRegra;

type
  TCtrlCadRegra = class(TCtrlCustomRH)
  private
    FCdsRegra: TCMClientDataSet;
    FDbRegra: TDbRegra;
  protected
    procedure DoChangeDataBase; override;
    procedure OnCreateAppServer; override; 
  public
    constructor Create;  override;
    destructor  Destroy; override;

    property DbRegra: TDbRegra read FDbRegra write FDbRegra;
    property CdsRegra: TCMClientDataSet read FCdsRegra write FCdsRegra;

    function ListRegra(IdRegra: double): OleVariant;
    function ListaRegra(IdGrpRegra: double = -1): OleVariant;
    function ListFormaCalc: OleVariant;
    function ListFormaCalcExpressao(Expressao: string): OleVariant;
    function ListFormaCalcAssocTabGener(CodTabela: string): OleVariant;
    function ListRubricasAssocTabGener(CodTabela: string): OleVariant;

    function ExisteRegra(IdRegra:double): boolean;

    function GravarRegra: boolean;
  end;

implementation

uses uCtrlFuncoesRH;

{ TCtrlCadRegra }

constructor TCtrlCadRegra.Create;
begin
  inherited;
  FDbRegra := TDbRegra.Create(Self);
end;

destructor TCtrlCadRegra.Destroy;
begin
  FDbRegra.Free;
  if (IsAppServer) then
    FCdsRegra.Free;
  inherited;
end;

procedure TCtrlCadRegra.OnCreateAppServer;
begin
  inherited;
  FCdsRegra := TCMClientDataSet.Create(nil);
end;

procedure TCtrlCadRegra.DoChangeDataBase;
begin
  inherited;
  FDbRegra.DataBaseName := Self.DataBaseName;
end;

function TCtrlCadRegra.ListRegra(IdRegra: double): OleVariant;
begin
  FDbRegra.IdRegra.asFloat := IdRegra;
  Result := GetDataPacket(FDbRegra.sSqlSelect);
end;

function TCtrlCadRegra.ExisteRegra(IdRegra: double): Boolean;
begin
  FDbRegra.IdRegra.asFloat := IdRegra;
  CdsRegra.Data := GetDataPacket(FDbRegra.sSqlSelect);
  Result := not(CdsRegra.IsEmpty);
end;

function TCtrlCadRegra.ListaRegra(IdGrpRegra: double): OleVariant;
begin
  Result := GetDataPacket(
    'SELECT'+CR_LF+
    '  R.IDREGRA, R.NOMEREGRA'+CR_LF+
    'FROM'+CR_LF+
    '  REGRA R, TIPOREGRA TR, GRUPOREGRA GR'+CR_LF+
    'WHERE'+CR_LF+
    IFF(IdGrpRegra>0,'  (GR.IDGRUPOREGRA = ' +FloatToStr(IdGrpRegra)+ ') AND'+CR_LF,'')+
    '  (R.IDTIPOREGRA   = TR.IDTIPOREGRA) AND'+CR_LF+
    '  (TR.IDGRUPOREGRA = GR.IDGRUPOREGRA)'+CR_LF+
    'ORDER BY'+CR_LF+
    '  NOMEREGRA');
end;

function TCtrlCadRegra.ListFormaCalc: OleVariant;
var
  c: byte;
  _CdsAux, _CdsPrincipal: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  _CdsPrincipal := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  IDREGRA, NOMEREGRA, DESCRICAOREGRA, PUBLICADA, IDTIPOREGRA'+CR_LF+
      'FROM'+CR_LF+
      '  REGRA R'+CR_LF+
      'WHERE'+CR_LF+
      '  NOT EXISTS (SELECT DISTINCT IDREGRA'+CR_LF+
      '              FROM   ALGREGRA A'+CR_LF+
      '              WHERE  (A.IDREGRA = R.IDREGRA))'+CR_LF+
      'ORDER BY'+CR_LF+
      '  NOMEREGRA');

    _CdsPrincipal.Data := _CdsAux.Data;
    _CdsPrincipal.EmptyDataSet;
    repeat
      if (Trim(_CdsAux.FieldByName('DESCRICAOREGRA').asString) <> '') then
      begin
        _CdsPrincipal.Append;
        for c:=0 to _CdsAux.FieldCount-1 do
          _CdsPrincipal.Fields[c].Value := _CdsAux.Fields[c].Value;
        _CdsPrincipal.Post;
      end;
      _CdsAux.Next;
    until (_CdsAux.EOF);

    Result := _CdsPrincipal.Data;
  finally
    _CdsAux.Free;
    _CdsPrincipal.Free;
  end;
end;

function TCtrlCadRegra.ListFormaCalcExpressao(Expressao: string): OleVariant;
var
  c: byte;
  _CdsAux, _CdsPrincipal: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  _CdsPrincipal := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT'+CR_LF+
      '  IDREGRA, NOMEREGRA, DESCRICAOREGRA'+CR_LF+
      'FROM'+CR_LF+
      '  REGRA'+CR_LF+
      'ORDER BY'+CR_LF+
      '  NOMEREGRA');

    _CdsPrincipal.Data := _CdsAux.Data;
    if (Expressao <> '') and not(_CdsAux.IsEmpty) then
    begin
      _CdsPrincipal.EmptyDataSet;
      repeat
        if (Pos(Expressao,_CdsAux.FieldByName('DESCRICAOREGRA').asString) > 0) then
        begin
          _CdsPrincipal.Append;
          for c:=0 to _CdsAux.FieldCount-1 do
            _CdsPrincipal.Fields[c].Value := _CdsAux.Fields[c].Value;
          _CdsPrincipal.Post;
        end;
        _CdsAux.Next;
      until (_CdsAux.EOF);
    end;

    Result := _CdsPrincipal.Data;
  finally
    _CdsAux.Free;
    _CdsPrincipal.Free;
  end;
end;

function TCtrlCadRegra.ListFormaCalcAssocTabGener(CodTabela: string): OleVariant;
var
  c: byte;
  _CdsAux, _CdsPrincipal: TCMClientDataSet;
begin
  _CdsAux := TCMClientDataSet.Create(nil);
  _CdsPrincipal := TCMClientDataSet.Create(nil);
  try
    _CdsAux.Data := GetDataPacket(
      'SELECT' +IFF(CodTabela='-1',' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
      '  IDREGRA, NOMEREGRA, DESCRICAOREGRA'+CR_LF+
      'FROM'+CR_LF+
      '  REGRA'+
      IFF(CodTabela='-1',CR_LF+ 'WHERE' +CR_LF+ '  (1 = 2)',''));

    _CdsPrincipal.Data := _CdsAux.Data;
    if (CodTabela <> '-1') and (CodTabela <> '') and not(_CdsAux.IsEmpty) then
    begin
      _CdsPrincipal.EmptyDataSet;
      repeat
        if (Pos('F%TABGENERICA('+CodTabela,_CdsAux.FieldByName('DESCRICAOREGRA').asString) > 0) then
        begin
          _CdsPrincipal.Append;
          for c:=0 to _CdsAux.FieldCount-1 do
            _CdsPrincipal.Fields[c].Value := _CdsAux.Fields[c].Value;
          _CdsPrincipal.Post;
        end;
        _CdsAux.Next;
      until (_CdsAux.EOF);
    end;

    Result := _CdsPrincipal.Data;
  finally
    _CdsAux.Free;
    _CdsPrincipal.Free;
  end;
end;

function TCtrlCadRegra.ListRubricasAssocTabGener(CodTabela: string): OleVariant;
var
  sListaFormaCalc: string;
  _CdsFormaCalc: TCMClientDataSet;
begin
  _CdsFormaCalc := TCMClientDataSet.Create(nil);
  try
    sListaFormaCalc := '';
    if (CodTabela <> '-1') and (CodTabela <> '') then
    begin
      _CdsFormaCalc.Data := ListFormaCalcAssocTabGener(CodTabela);
      while not(_CdsFormaCalc.EOF) do
      begin
        if (sListaFormaCalc = '') then
          sListaFormaCalc := _CdsFormaCalc.FieldByName('IDREGRA').asString
        else
          sListaFormaCalc := sListaFormaCalc +','+ _CdsFormaCalc.FieldByName('IDREGRA').asString;
        _CdsFormaCalc.Next;
      end;
      
      if (sListaFormaCalc <> '') then
      begin
        if (Pos(',',sListaFormaCalc) = 0) then
          sListaFormaCalc := '  = '+ sListaFormaCalc
        else
          sListaFormaCalc := ' IN ('+ sListaFormaCalc +')';
      end;
    end;

    Result := GetDataPacket(
      'SELECT' +IFF((CodTabela='-1') or (sListaFormaCalc=''),' /*+ OPTIMIZER_MODE RULE */','')+CR_LF+
      '  IDPROVENTO, DESCRICAO'+CR_LF+
      'FROM'+CR_LF+
      '  PROVDESC'+CR_LF+
      'WHERE'+CR_LF+
      IFF((CodTabela='-1') or (sListaFormaCalc=''),
        '  (1 = 2)',
        '  (FLGTPRUBRICA  LIKE ''%F%'') AND'+CR_LF+
        '  ((IDREGRA        ' +sListaFormaCalc+ ') OR'+CR_LF+
        '   (IDREGRA13      ' +sListaFormaCalc+ ') OR'+CR_LF+
        '   (IDREGRAFERIAS  ' +sListaFormaCalc+ ') OR'+CR_LF+
        '   (IDREGRARESCISAO' +sListaFormaCalc+ '))'));
  finally
    _CdsFormaCalc.Free;
  end;
end;

function TCtrlCadRegra.GravarRegra: boolean;
begin
  if (ConnectionSide = cnsClient) then
  begin
    Result := Connection.AppServer.GravarFormaCalc(FCdsRegra.Data);
    if not(Result) then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;

      Result := ApplyCds(FCdsRegra, FDbRegra, [], []);  
      if not(Result) then
        raise Exception.Create(FDbRegra.MessageInfo);

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
