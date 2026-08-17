{-------------------------------------------------------------------------------
------------------------ HIST”RICO DE ALTERA«’ES -------------------------------
--------------------------------------------------------------------------------
 N∫ SIG......: 127396
 Data........: 20/07/2022
 Respons·vel.: Everson Cunha
 DescriÁ„o...: Desenvolvimento da Ctrl
--------------------------------------------------------------------------------}

unit uCtrlOperacao;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uCMClientDataSet, Wwquery, uDbOperacao;

Type
  TCtrlOperacao = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    _DbOperacao: TDbOperacao;
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

  Public
    Property cds: TClientDataSet read Fcds write Setcds;

    constructor Create;  Override;
    destructor  Destroy; Override;

    //------------------------------------//
    // Metodos da Regra de NegÛcio
    //------------------------------------//
    function ListaOperacao(idOperacao: Double = 0): OleVariant;
    function GetSequenceOperacao: Cardinal;
    function VerificaDuplicado(idOperacao, NomeOperacao: String): OleVariant;
    function Gravar: Boolean;

  End;

implementation

Uses uCmTypes;

constructor TCtrlOperacao.Create;
begin
  inherited;
  _DbOperacao := TDbOperacao.Create(Self);
  FCds        := TClientDataSet.Create(nil);
end;

destructor TCtrlOperacao.Destroy;
begin
  If Fcds.Active Then
    Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbOperacao.Free;

  inherited;
end;

procedure TCtrlOperacao.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlOperacao.DoChangeDataBase;
begin
  inherited;
  _DbOperacao.DataBaseName := DatabaseName;
end;

function TCtrlOperacao.ListaOperacao(idOperacao: Double): OleVariant;
var
  Sql: String;
begin
  Sql := 'SELECT * ' +
         '  FROM CM.OPERACAO ';

  if idOperacao <> 0 then
    Sql := Sql + ' WHERE IDOPERACAO = ' + FloatToStr(idOperacao);

  Sql := Sql + ' ORDER BY NOMEOPERACAO ';

  Result := GetDataPacket(Sql);
end;

function TCtrlOperacao.GetSequenceOperacao: Cardinal;
var oCds : TCMClientDataSet;
begin
  oCds := TCMClientDataSet.Create(nil);

  try
    oCds.Data := GetDataPacket('Select Max(IdOperacao) + 1 as Id From operacao');
    Result := oCds.FieldByName('ID').AsInteger;
  finally
    FreeAndNil(oCds);
  end;
end;

function TCtrlOperacao.VerificaDuplicado(idOperacao, NomeOperacao: String): OleVariant;
var
  Sql  : String;
  oCds : TCMClientDataSet;
begin
  oCds := TCMClientDataSet.Create(nil);

  With oCds do
  try
    Sql := 'SELECT 1 ' +
           '  FROM CM.OPERACAO ' +
           ' WHERE UPPER(TRANSLATE(TRIM(NOMEOPERACAO) ,''¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸'', ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')) = ' + QuotedStr(UpperCase(NomeOperacao));

    if idOperacao <> '' then
      Sql := Sql + ' AND IDOPERACAO <> ' + (idOperacao);

    Data := GetDataPacket(Sql);
    Result := not(IsEmpty);
  finally
    FreeAndNil(oCds);
  end;
end;

function TCtrlOperacao.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarOperacao(Fcds.Data);

    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      Result := ApplyCds(fcds, _DbOperacao, [], []);
      Msg    := _DbOperacao.MessageInfo;

      If Not Result Then
        Raise Exception.Create(Msg);

      Commit;
    Except
      On E:Exception Do
      Begin
        Rollback;
        Result := False;
        MessageInfo := E.Message;
      End;
    End;
  End;
end;

end.

