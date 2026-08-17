unit uCtrlParamCap;

interface

Uses sysutils, uCmControlObject, uCmDbObject, uDbFormaRecPag, uSistema, DB, uDataBase,
     DbClient, Classes, uCmTypes, uDBParamCap, uDBParamRelats;

type

  TCtrlParamCap = class(TCmControlObject)
  Protected

  private
    _DbParamCAP    : TDbParamCAP;
    _DbParamRelats : TDbParamRelats;
  Public
    _Cds           : TClientDataSet;
    _CdsRel        : TClientDataSet;
    constructor Create; Override;
    destructor  Destroy; Override;
    function ListParamCAP(pRecPag : String; pIDPessoa : Integer) : Olevariant;
    function ListParamREL(pIDModulo : Integer; pIDPessoa : Integer) : Olevariant;

    function GravaRelatorio : Boolean;
    function GravaParamCap : Boolean;
end;


implementation

{ TCtrlParacamCap }

function TCtrlParamCap.GravaRelatorio : Boolean;
var Msg : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaRelatorio(_CdsRel.Data);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      StartTransaction;
      Result := ApplyCds(_CdsRel,_DbParamRelats,[],[]);
      Msg    := _DbParamRelats.MessageInfo;
      if not Result then raise Exception.create(Msg);
      Commit;
    except
      on E:Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

constructor TCtrlParamCap.Create;
begin
  inherited;
  _Cds           := TClientDataSet.Create(nil);
  _CdsRel        := TClientDataSet.Create(nil);
  _DbParamCAP    := TDbParamCAP.Create(self);
  _DbParamRelats := TDbParamRelats.Create(self);
end;

destructor TCtrlParamCap.Destroy;
begin
  inherited;
  if isAppServer then _Cds.Free;
  if isAppServer then _CdsRel.Free;
  _DbParamCAP.Free;
  _DbParamRelats.Free;
end;

function TCtrlParamCap.ListParamCAP(pRecPag: String;
  pIDPessoa: Integer): Olevariant;
var sListSQL : TStrings;
begin
  sListSQL := TStringList.Create;
  with sListSQL do
  begin
    Append('SELECT');
    Append('  P.RECPAG, P.IDPESSOA, P.MASCARADESEMB, P.CODALTERADORJUROS,');
    Append('  P.CODADFORNE, P.HISTPADFINAN, P.DD30, P.DD60, P.DD90, P.DD120,');
    Append('  P.DD150, P.DD180, P.LOCALEMISCHEQUE, P.LANCAFINANC, P.INTEGRACONTAB,');
    Append('  P.IDUSUARIOINCLUSAO, P.CODALTERADORABAT, P.CODALTERADORDESC,');
    Append('  P.CODALTERADORTARIF, P.IMPGENERICA, P.IDTIPOCLIADIANTO, P.NUMDIASVENCTO, P.IDIMPRESSORA, P.FLGESTEXCFINANC, P.FLGEMITELANCBAIX, P.FLGOBRIGFORMAPGTO,');
    Append('  P.FLGCORRIGEDOCAUTO, P.CODAltJurosSimples, P.CODAltJurosComposto, P.CODAltCorrecao, P.CODAltMulta, P.FLGEXCLUICONTAB,');
    Append('  P.IDRAMOFORNECEDOR, P.FLGCONTROLACHEQUE, P.FLGEXCLUIPLANIL, P.MASCARANODOCUM, P.FLGCOMPLTIPOFAT, P.FLGLANCAFLOAT,');
    Append('  P.IDREPORTS, P.ORIGEMCM, R.NAME, P.FLGTRDXCCXCONTA, P.FLGTRDXIMPOSTOS, P.FLGSTATUSFINANC, P.CODTIPDOCCPMF,');
    Append('  P.CODPORTFORMA, P.FLGMODADDOCPG, P.FLGSLIPAUTO, P.FLGBAIXACHQ, P.FLGOPAUTO, P.FLGRADLOTE, ');
    Append('  P.FLGACESSLANCDOC ');//Bruno Bastos - Pend. 14399 e 14400 - 13/08/2003
    Append('FROM');
    Append('  PARAMCAP P, REPORTS R');
    Append('WHERE');
    Append('  P.IDPESSOA = ' + IntToStr(pIDPessoa) + ' AND');
    Append('  P.RECPAG = ' + QuotedStr(pRecPag) + ' AND');
    Append('  P.IDREPORTS = R.IDREPORTS(+) AND');
    Append('  P.ORIGEMCM = R.ORIGEMCM(+)');
  end;
  Result := GetDataPacket(sListSQL);
  sListSQL.Free;
end;

function TCtrlParamCap.GravaParamCap: Boolean;
var Msg : string;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravaParamCap(_Cds.Data);
    if not Result then MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      Msg := 'Inclusão/Alteração Não Efetuada. ';
      StartTransaction;
      Result := ApplyCds(_Cds, _DbParamCAP,[],[]);
      Msg    := Msg + _DbParamCAP.MessageInfo;
      if not Result then raise Exception.Create(Msg);
      Commit;
    except
      on E:Exception do
      begin
        Result := False;
        Rollback;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;
function TCtrlParamCap.ListParamREL(pIDModulo,
  pIDPessoa: Integer): Olevariant;
var sListSQL : TStrings;
begin
  sListSQL := TStringList.Create;
  with sListSQL do
  begin
    Append('SELECT');
    Append('  IDPARAMRELATS,');
    Append('  IDMODULO,');
    Append('  IDPESSOA,');
    Append('  NOMECOMPO,');
    Append('  DESCRICAO,');
    Append('  VALOR,');
    Append('  NOMERELATORIO');
    Append('FROM');
    Append('  PARAMRELATS');
    Append('WHERE');
    Append(' (IDMODULO = ' + IntToStr(pIDModulo) + ') AND');
    Append(' (IDPESSOA = ' + IntToStr(pIDPessoa) + ')');
    Append('ORDER BY NOMERELATORIO, DESCRICAO, VALOR');
  end;
  Result := GetDataPacket(sListSQL);
  sListSQL.Free;
end;

end.
