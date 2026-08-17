{-------------------------------------------------------------------------------
------------------------ HIST”RICO DE ALTERA«’ES -------------------------------
--------------------------------------------------------------------------------
 N∫ SIG......: 127396
 Data........: 20/07/2022
 Respons·vel.: Everson Cunha
 DescriÁ„o...: Desenvolvimento da Ctrl
--------------------------------------------------------------------------------}

unit uCtrlForm;

interface

Uses DB, sysUtils, dbclient, Provider, uDataBase, uCmDbObject, uCmControlObject,
     uCMClientDataSet, Wwquery, uDbForm;

Type
  TCtrlForm = class(TCmControlObject)
  Protected
    procedure DoChangeDataBase; Override;
  private
    _DbForm: TDbForm;
    Fcds: TClientDataSet;
    procedure Setcds(const Value: TClientDataSet);

  Public
    Property cds: TClientDataSet read Fcds write Setcds;

    constructor Create;  Override;
    destructor  Destroy; Override;

    //------------------------------------//
    // Metodos da Regra de NegÛcio
    //------------------------------------//
    function ListaForm(idForm: Double = 0; idModulo: Double = 0): OleVariant;
    function GetSequenceForm: Cardinal;
    function VerificaDuplicado(idForm, NomeForm, idModulo: String): OleVariant;
    function Gravar: Boolean;

  End;

implementation

{$IFNDEF VERSAO0505}
Uses uCmTypes;
{$ENDIF}

constructor TCtrlForm.Create;
begin
  inherited;
  _DbForm := TDbForm.Create(Self);
  FCds    := TClientDataSet.Create(nil);
end;

destructor TCtrlForm.Destroy;
begin
  If Fcds.Active Then
    Fcds.Close;

  Fcds := nil;
  Fcds.Free;

  _DbForm.Free;

  inherited;
end;

procedure TCtrlForm.Setcds(const Value: TClientDataSet);
begin
  Fcds := Value;
end;

procedure TCtrlForm.DoChangeDataBase;
begin
  inherited;
  _DbForm.DataBaseName := DatabaseName;
end;

function TCtrlForm.ListaForm(idForm, idModulo: Double): OleVariant;
var
  Sql: String;
begin
  Sql := 'SELECT * ' +
         '  FROM CM.FORM ' +
         ' WHERE 1 = 1 ';

  if idForm <> 0 then
     Sql := Sql + ' AND IDFORM = ' + FloatToStr(idForm);

  if idModulo <> 0 then
    Sql := Sql + ' AND IDMODULO = ' + FloatToStr(idModulo);

  Sql := Sql + ' ORDER BY NOMEFORM ';

  Result := GetDataPacket(Sql);
end;

function TCtrlForm.GetSequenceForm: Cardinal;
var oCds : TCMClientDataSet;
begin
  oCds := TCMClientDataSet.Create(nil);

  try
    oCds.Data := GetDataPacket('Select Max(IdForm) + 1 as Id From form');
    Result := oCds.FieldByName('ID').AsInteger;
  finally
    FreeAndNil(oCds);
  end;
end;

function TCtrlForm.VerificaDuplicado(idForm, NomeForm, idModulo: String): OleVariant;
var
  Sql  : String;
  oCds : TCMClientDataSet;
begin
  oCds := TCMClientDataSet.Create(nil);

  With oCds do
  try
    Sql := 'SELECT 1 ' +
           '  FROM CM.FORM ' +
           ' WHERE UPPER(TRANSLATE(TRIM(NOMEFORM) ,''¡«…Õ”⁄¿»Ã“Ÿ¬ Œ‘€√’À‹·ÁÈÌÛ˙‡ËÏÚ˘‚ÍÓÙ˚„ıÎ¸'', ''ACEIOUAEIOUAEIOUAOEUaceiouaeiouaeiouaoeu'')) = ' + QuotedStr(UpperCase(NomeForm)) +
           '   AND IDMODULO = ' + (idModulo);

    if idForm <> '' then
      Sql := Sql + ' AND IDFORM <> ' + (idForm);

    Data := GetDataPacket(Sql);
    Result := not(IsEmpty);
  finally
    FreeAndNil(oCds);
  end;
end;

function TCtrlForm.Gravar: Boolean;
Var
  Msg: String;
begin
  If ConnectionSide = cnsClient Then
  Begin
    Result := Connection.AppServer.GravarForm(Fcds.Data);

    If Not Result Then
      MessageInfo := Connection.AppServer.MessageInfo;
  End
  Else
  Begin
    Try
      StartTransaction;
      Result := ApplyCds(fcds, _DbForm, [], []);
      Msg    := _DbForm.MessageInfo;

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

