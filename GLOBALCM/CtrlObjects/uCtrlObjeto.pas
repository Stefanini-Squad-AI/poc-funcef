{-------------------------------------------------------------------------------
------------------------ HIST”RICO DE ALTERA«’ES -------------------------------
--------------------------------------------------------------------------------
 N∫ SIG......: 127396
 Data........: 20/07/2022
 Respons·vel.: Everson Cunha
 DescriÁ„o...: Desenvolvimento da Ctrl
--------------------------------------------------------------------------------}

unit uCtrlObjeto;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uCMClientDataSet, Wwquery, uDbObjeto;

Type
  TCtrlObjeto = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    _DbObjeto: TDbObjeto;
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

  Public
    Property cds: TClientDataSet read Fcds write Setcds;

    constructor Create;  Override;
    destructor  Destroy; Override;

    //------------------------------------//
    // Metodos da Regra de NegÛcio
    //------------------------------------//
    function ListaObjeto(idObjeto: Double = 0): OleVariant;
    function GetSequenceObjeto: Cardinal;
    function VerificaDuplicado(idObjeto, NomeObjeto: String): OleVariant;
    function Gravar: Boolean;

  End;

implementation

Uses uCmTypes;

constructor TCtrlObjeto.Create;
begin
  inherited;
  _DbObjeto := TDbObjeto.Create(Self);
  FCds        := TClientDataSet.Create(nil);
end;

destructor TCtrlObjeto.Destroy;
begin
  If Fcds.Active Then
    Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbObjeto.Free;

  inherited;
end;

procedure TCtrlObjeto.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlObjeto.DoChangeDataBase;
begin
  inherited;
  _DbObjeto.DataBaseName := DatabaseName;
end;

function TCtrlObjeto.ListaObjeto(idObjeto: Double): OleVariant;
var
  Sql: String;
begin
  Sql := 'SELECT * ' +
         '  FROM CM.OBJETO ';

  if idObjeto <> 0 then
    Sql := Sql + ' WHERE IDOBJETO = ' + FloatToStr(idObjeto);

  Sql := Sql + ' ORDER BY NOMEOBJETO';

  Result := GetDataPacket(Sql);
end;

function TCtrlObjeto.GetSequenceObjeto: Cardinal;
var oCds : TCMClientDataSet;
begin
  oCds := TCMClientDataSet.Create(nil);

  try
    oCds.Data := GetDataPacket('Select Max(IdObjeto) + 1 as Id From objeto');
    Result := oCds.FieldByName('ID').AsInteger;
  finally
    FreeAndNil(oCds);
  end;
end;

function TCtrlObjeto.VerificaDuplicado(idObjeto, NomeObjeto: String): OleVariant;
var
  Sql  : String;
  oCds : TCMClientDataSet;
begin
  oCds := TCMClientDataSet.Create(nil);

  With oCds do
  try
    Sql := 'SELECT 1 ' +
           '  FROM CM.OBJETO ' +
           ' WHERE UPPER(TRANSLATE(TRIM(NOMEOBJETO) ,''¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸'', ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')) = ' + QuotedStr(UpperCase(NomeObjeto));

    if idObjeto <> '' then
      Sql := Sql + ' AND IDOBJETO <> ' + (idObjeto);

    Data := GetDataPacket(Sql);
    Result := not(IsEmpty);
  finally
    FreeAndNil(oCds);
  end;
end;

function TCtrlObjeto.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarObjeto(Fcds.Data);

    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      Result := ApplyCds(fcds, _DbObjeto, [], []);
      Msg    := _DbObjeto.MessageInfo;

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

