{-------------------------------------------------------------------------------
------------------------ HIST”RICO DE ALTERA«’ES -------------------------------
--------------------------------------------------------------------------------
 N∫ SIG......: 127396
 Data........: 20/07/2022
 Respons·vel.: Everson Cunha
 DescriÁ„o...: Desenvolvimento da Ctrl
--------------------------------------------------------------------------------}

unit uCtrlFuncaoOperacao;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uCMClientDataSet, Wwquery, uDbFuncao, uDbFrobfnop, uDbOperfunc;

Type
  TCtrlFuncaoOperacao = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    _DbFuncao: TDbFuncao;
    _DbOperfunc: TDbOperfunc;
    _DbFrobfnop: TDbFrobfnop;
    Fcds: TClientDataSet;
    FcdsDet: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);
    procedure SetcdsDet(const Value: TClientDataSet);

  Public
    Property cds: TClientDataSet read Fcds write Setcds;
    Property cdsDet: TClientDataSet read FcdsDet write SetcdsDet;

    constructor Create;  Override;
    destructor  Destroy; Override;

    //------------------------------------//
    // Metodos da Regra de NegÛcio
    //------------------------------------//
    function ListaFuncao(idModulo: Double = 0; idFuncaoPai: Double = 0): OleVariant;
    function ListaOperFuncObjeto(idModulo: Double = 0; idFuncao: Double = 0): OleVariant;
    function GetSequenceFuncao: Cardinal;
    function VerificaDuplicado(idFuncaoPai, idFuncao, NomeFuncao, idModulo: String): OleVariant;
    function VerificaDuplicadoDet(idModulo, idFuncao, idForm, idOperacao, idObjeto : String): OleVariant;
    function VerificaAutorizacaoVinculada(idOperfunc : String): OleVariant;
    function Gravar: Boolean;
    function Apagar: Boolean;
    function ApagarDet: Boolean;

  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

constructor TCtrlFuncaoOperacao.Create;
begin
  inherited;
  _DbFuncao   := TDbFuncao.Create(Self);
  _DbOperfunc := TDbOperfunc.Create(Self);
  _DbFrobfnop := TDbFrobfnop.Create(Self);

  FCds    := TClientDataSet.Create(nil);
  FCdsDet := TClientDataSet.Create(nil);
end;

destructor TCtrlFuncaoOperacao.Destroy;
begin
  with Fcds do
  begin
    if Active then
      Close;

    Fcds := nil;
    Free;
  end;

  with FcdsDet do
  begin
    if Active then
      Close;

    FcdsDet := nil;
    Free;
  end;

  _DbFuncao.Free;
  _DbOperfunc.Free;
  _DbFrobfnop.Free;

  inherited;
end;

procedure TCtrlFuncaoOperacao.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlFuncaoOperacao.SetcdsDet(const Value: TClientDataSet);
begin
  FcdsDet := Value;
end;

procedure TCtrlFuncaoOperacao.DoChangeDataBase;
begin
  inherited;

  _DbFuncao.DataBaseName   := DatabaseName;
  _DbOperfunc.DataBaseName := DatabaseName;
  _DbFrobfnop.DataBaseName := DatabaseName;
end;

function TCtrlFuncaoOperacao.ListaFuncao(idModulo, idFuncaoPai: Double): OleVariant;
var
  Sql: String;
begin
  Sql := 'SELECT * ' +
         '  FROM CM.FUNCAO ' +
         ' WHERE 1 = 1 ';

  if idModulo <> 0 then
    Sql := Sql + ' AND IDMODULO = ' + FloatToStr(idModulo);

  if idFuncaoPai <> 0 then
    Sql := Sql + ' AND IDFUNCAOPAI = ' + FloatToStr(idFuncaoPai);

  Sql := Sql + ' ORDER BY IDFUNCAOPAI, IDFUNCAO ';

  Result := GetDataPacket(Sql);
end;

function TCtrlFuncaoOperacao.ListaOperFuncObjeto(idModulo,
  idFuncao: Double): OleVariant;
var
  Sql: String;
begin
  Sql := ' SELECT OPERFUNC.IDOPERFUNC, ' +
         '        OPERFUNC.IDMODULO, ' +
         '        OPERFUNC.IDOPERACAO, ' +
         '        OPERFUNC.IDFUNCAO, ' +
         '        FROBFNOP.IDOBJETO, ' +
         '        FROBFNOP.IDFORM, ' +
         '        FORM.NOMEFORM, ' +
         '        OBJETO.NOMEOBJETO, ' +
         '        OPERACAO.NOMEOPERACAO ' +
         '   FROM CM.OPERFUNC ' +
         '   JOIN CM.FROBFNOP ON FROBFNOP.IDOPERFUNC = OPERFUNC.IDOPERFUNC ' +
         '   JOIN CM.FORM ON FORM.IDFORM = FROBFNOP.IDFORM ' +
         '   JOIN CM.OBJETO ON OBJETO.IDOBJETO = FROBFNOP.IDOBJETO ' +
         '   JOIN CM.OPERACAO ON OPERACAO.IDOPERACAO = OPERFUNC.IDOPERACAO ';

  if idModulo <> 0 then
    Sql := Sql + ' AND OPERFUNC.IDMODULO =  ' + FloatToStr(idModulo);

  if idFuncao <> 0 then
    Sql := Sql + ' AND OPERFUNC.IDFUNCAO = ' + FloatToStr(idFuncao);

  Sql := Sql + ' ORDER BY OPERACAO.IDOPERACAO ';

  Result := GetDataPacket(Sql);
end;

function TCtrlFuncaoOperacao.GetSequenceFuncao: Cardinal;
var oCds : TCMClientDataSet;
begin
  oCds := TCMClientDataSet.Create(nil);

  try
    oCds.Data := GetDataPacket('Select Max(IdFuncao) + 1 as Id From funcao');
    Result := oCds.FieldByName('ID').AsInteger;
  finally
    FreeAndNil(oCds);
  end;
end;

function TCtrlFuncaoOperacao.VerificaDuplicado(idFuncaoPai, idFuncao, NomeFuncao, idModulo: String): OleVariant;
var
  Sql  : String;
  oCds : TCMClientDataSet;
begin
  oCds := TCMClientDataSet.Create(nil);

  With oCds do
  try
    Sql := 'SELECT 1 ' +
           '  FROM CM.FUNCAO ' +
           ' WHERE UPPER(TRANSLATE(TRIM(NOMEFUNCAO) ,''¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸'', ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')) = ' + QuotedStr(UpperCase(NomeFuncao)) +
           '   AND IDMODULO = ' + (idModulo) +
           '   AND IDFUNCAOPAI = ' + (idFuncaoPai);

    if idFuncao <> '' then
      Sql := Sql + ' AND IDFUNCAO <> ' + (idFuncao);

    Data := GetDataPacket(Sql);
    Result := not(IsEmpty);
  finally
    FreeAndNil(oCds);
  end;
end;

function TCtrlFuncaoOperacao.VerificaDuplicadoDet(idModulo, idFuncao,
  idForm, idOperacao, idObjeto: String): OleVariant;
var
  Sql  : String;
  oCds : TCMClientDataSet;
begin
  oCds := TCMClientDataSet.Create(nil);

  With oCds do
  try
    Sql := ' SELECT 1 ' +
           '   FROM CM.FUNCAO F ' +
           '   JOIN CM.OPERFUNC OP ON OP.IDFUNCAO = F.IDFUNCAO ' +
           '   JOIN CM.FROBFNOP FF ON FF.IDOPERFUNC = OP.IDOPERFUNC ' +
           '  WHERE F.IDMODULO = ' + (idModulo) +
           '    AND F.IDFUNCAO = ' + (idFuncao) +
           '    AND FF.IDFORM = ' + (idForm) +
           '    AND OP.IDOPERACAO = ' + (idOperacao) +
           '    AND FF.IDOBJETO = ' + (idObjeto);

    Data := GetDataPacket(Sql);
    Result := not(IsEmpty);
  finally
    FreeAndNil(oCds);
  end;
end;

function TCtrlFuncaoOperacao.VerificaAutorizacaoVinculada(idOperfunc: String): OleVariant;
var
  Sql  : String;
  oCds : TCMClientDataSet;
begin
  oCds := TCMClientDataSet.Create(nil);

  With oCds do
  try
    Sql := ' SELECT 1 ' +
           '   FROM CM.AUTORIZA A ' +
           '  WHERE A.IDOPERFUNC = ' + (idOperfunc);

    Data := GetDataPacket(Sql);
    Result := not(IsEmpty);
  finally
    FreeAndNil(oCds);
  end;
end;

function TCtrlFuncaoOperacao.Gravar: Boolean;
var
  Msg: String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarFuncao(Fcds.Data, FcdsDet.Data);

    if Not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      if not InTransaction then
        StartTransaction;
        
      Result := ApplyCds(fcds, _DbFuncao, [], []);
      Msg    := _DbFuncao.MessageInfo;

      if Not Result then
        Raise Exception.Create(Msg);

      Result := ApplyCds(fcdsDet, _DbOperfunc, [], []);
      Msg    := _DbOperfunc.MessageInfo;

      if Not Result then
        Raise Exception.Create(Msg);

      Result := ApplyCds(fcdsDet, _DbFrobfnop, [], []);
      Msg    := _DbFrobfnop.MessageInfo;

      if Not Result then
        Raise Exception.Create(Msg);

      Commit;
    except
      on E:Exception do
      begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlFuncaoOperacao.Apagar: Boolean;
var
  Msg: String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarFuncao(FcdsDet.Data, Fcds.Data);

    if Not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      if not InTransaction then
        StartTransaction;

      Result := ApplyCds(fcdsDet, _DbFrobfnop, [], []);
      Msg    := _DbFrobfnop.MessageInfo;

      if Not Result then
        Raise Exception.Create(Msg);

      Result := ApplyCds(fcdsDet, _DbOperfunc, [], []);
      Msg    := _DbOperfunc.MessageInfo;

      if Not Result then
        Raise Exception.Create(Msg);

      Result := ApplyCds(fcds, _DbFuncao, [], []);
      Msg    := _DbFuncao.MessageInfo;

      if Not Result then
        Raise Exception.Create(Msg);

      Commit;
    except
      on E:Exception do
      begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

function TCtrlFuncaoOperacao.ApagarDet: Boolean;
var
  Msg: String;
begin
  if ConnectionSide = cnsClient then
  begin
    Result := Connection.AppServer.GravarFuncao(FcdsDet.Data);

    if Not Result then
      MessageInfo := Connection.AppServer.MessageInfo;
  end
  else
  begin
    try
      if not InTransaction then
        StartTransaction;

      Result := ApplyCds(fcdsDet, _DbFrobfnop, [], []);
      Msg    := _DbFrobfnop.MessageInfo;

      if Not Result then
        Raise Exception.Create(Msg);

      Result := ApplyCds(fcdsDet, _DbOperfunc, [], []);
      Msg    := _DbOperfunc.MessageInfo;

      if Not Result then
        Raise Exception.Create(Msg);

      //Commit; Vai dar commit no Gravar
    except
      on E:Exception do
      begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
      end;
    end;
  end;
end;

end.

