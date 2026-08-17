{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit uParamsLib;

interface

uses 
  Classes, SysUtils, db, dbTables, controls, DbClient;
  
type
  
  TCustomParams = class;

  TCMParam = class(TObject)
  private
    FName : string;
    FDataType : char;
    FValue : string;
    FStatus: TUpdateStatus;
    FOwner : TCustomParams;
    function GetAsInteger : Integer;
    function GetAsBoolean : Boolean;
    function GetAsFloat   : Double;
    function GetAsDateTime: TDateTime;
    function GetAsString  : string;
    function GetValue  : string;
    procedure SetAsInteger (const Valor: Integer);
    procedure SetAsBoolean (const Valor: Boolean);
    procedure SetAsFloat   (const Valor: Double);
    procedure SetAsDateTime(const Valor: TDateTime);
    procedure SetAsString  (const Valor: string);
    procedure SetValue(const Valor: string);
    function GetDataType: TFieldType;
    function GetAsTime: TTime;
    procedure SetAsTime(const Value: TTime);
  protected
  public
    property Name : string read FName;
    property AsInteger : Integer   read GetAsInteger  write SetAsInteger ;
    property AsBoolean : Boolean   read GetAsBoolean  write SetAsBoolean ;
    property AsFloat   : Double    read GetAsFloat    write SetAsFloat   ;
    property AsDateTime: TDateTime read GetAsDateTime write SetAsDateTime;
    property AsTime    : TTime     read GetAsTime     write SetAsTime;
    property AsString  : string    read GetAsString   write SetAsString  ;
    property DataType  : TFieldType read GetDataType;
    property Value : string read GetValue write SetValue;
    property Status : TUpdateStatus read FStatus;
    constructor Create(AOwner : TCustomParams; const ParamName, ParamValue, ParamType : string);
    procedure Delete;
  end;

  TParamUpdateMode = (umOnClose, umOnChange, umManual, umOnFree);

  TCustomParams = class(TComponent)
  private
    FItems : TList;
    FDatabaseName : string;
    FParamTable : string;
    FParamUpdateMode: TParamUpdateMode;
    function GetActive: Boolean;
    procedure SetActive(const Value : Boolean);
    procedure SetDatabaseName(const Value : string);
    procedure SetParamTable(const Value : string);
    procedure DoApplyUpdates(CMParam : TCMParam);
    procedure setParamUpdateMode(const Value : TParamUpdateMode);
  protected
    function GetSqlSelect: string; virtual;
    function GetItem(const Nome : string): TCMParam;
    procedure CheckActive; virtual;
    procedure CheckInactive; virtual;
    property ParamTable   : string read FParamTable write SetParamTable;
  public
    property Items[const Nome : string]: TCMParam read GetItem; default;
    constructor Create(AOwner : TComponent); override;
    destructor Destroy; override;
    function ParamByName(const NomeParametro : string): TCMParam;
    procedure Open; virtual;
    procedure Close; virtual;
    procedure ApplyUpdates; virtual;
    procedure Add(const ParamName : string; const ParamType : TFieldType; const ParamValue : string);
  published
    property Active : Boolean read GetActive write SetActive;
    property DatabaseName : string read FDatabaseName write SetDatabaseName;
    property ParamUpdateMode : TParamUpdateMode read FParamUpdateMode write setParamUpdateMode default umOnClose;
  end;

  TCMParams = class(TCustomParams)
  private

  protected

  public

  published
    property ParamTable;
  end;

  TCMParametros = class(TCustomParams)
  private
    FIgnoraEmpresa: Boolean;
    procedure SetIgnoraEmpresa(const Value: Boolean);
  protected
    function GetSqlSelect: string; override;
  public
    constructor Create(AOwner : TComponent); override;
  published
    property IgnoraEmpresa: Boolean read FIgnoraEmpresa write SetIgnoraEmpresa;
  end;

implementation

uses
  bdeConst, FSM_FxLib, uSistema, uCtrlPadroes;

  { TCMParam }
constructor TCMParam.Create(AOwner : TCustomParams; const ParamName, ParamValue, ParamType : string);
begin
  inherited Create;
  FName := ParamName;
  StrPCopy(@FDataType, Copy(ParamType, 1, 1));
  FValue := ParamValue;
  FOwner := AOwner;
  FStatus := usUnmodified;
end;

function TCMParam.GetValue : string;
begin
  Result := FValue;
end;

function TCMParam.GetAsInteger : Integer;
begin
  Result := 0;
  case GetDataType of
    ftString, ftInteger : Result := StrToInt(FValue);
    ftFloat : Result := Trunc(StrToFloatS(FValue));
  end;
end;

function TCMParam.GetAsBoolean : Boolean;
begin
  if UpperCase(GetValue) = 'S' then
    Result := True
  else
    Result := False;
end;

function TCMParam.GetAsFloat   : Double;
begin
  Result := 0.0;
  case GetDataType of
    ftString, ftInteger, ftFloat : Result := StrToFloatS(FValue);
  end;
end;

function TCMParam.GetAsDateTime: TDateTime;
begin
  Result := 0.0;
  case GetDataType of
    ftString, ftDateTime : Result := StrToDateTimeS(FValue);
  end;
end;

function TCMParam.GetAsString : string;
begin
  Result := FValue;
end;

procedure TCMParam.SetValue(const Valor: string);
begin
  FValue := Valor;
  if FStatus = usUnmodified then
    FStatus := usModified;
  if FOwner.ParamUpdateMode = umOnChange then
    FOwner.DoApplyUpdates(Self);
end;

procedure TCMParam.SetAsInteger (const Valor: Integer);   
begin
  SetValue(IntToStr(Valor));
end;

procedure TCMParam.SetAsBoolean (const Valor: Boolean);  
begin
  if Valor then
    SetValue('S')
  else
    SetValue('N');
end;

procedure TCMParam.SetAsFloat(const Valor: Double);
begin
  SetValue(FloatToStrF(Valor, ffNumber, 18, 2));
end;

procedure TCMParam.SetAsDateTime(const Valor: TDateTime);
begin
  SetValue(DateTimeToStr(Valor));
end;

procedure TCMParam.SetAsString(const Valor: string);
begin
  SetValue(Valor);
end;

function TCMParam.GetDataType: TFieldType;
begin
  case FDataType of
    'S', 's': Result := ftString;
    'D', 'd': Result := ftDateTime;
    'B', 'b': Result := ftBoolean;
    'N', 'n': Result := ftFloat;
    'I', 'i': Result := ftInteger;
    'T', 't': Result := ftTime;
    else Result := ftUnknown;
  end;
end;

procedure TCMParam.Delete;
begin
  FStatus := usDeleted;
  if FOwner.ParamUpdateMode = umOnChange then
    FOwner.DoApplyUpdates(Self);
end;

function TCMParam.GetAsTime: TTime;
begin
  Result := 0.0;
  case GetDataType of
    ftString, ftDateTime, ftTime : Result := StrToTimeS(FValue);
  end;                                             
end;

procedure TCMParam.SetAsTime(const Value: TTime);
begin
  SetValue(FormatDateTime('HH:NN', Value));
end;

{ TCustomParams }
constructor TCustomParams.Create(AOwner : TComponent); 
begin
  inherited Create(AOWner);
  FParamUpdateMode := umOnClose;
end;

destructor TCustomParams.Destroy; 
begin
  Close;
  inherited Destroy;
end;

function TCustomParams.ParamByName(const NomeParametro : string): TCMParam;
begin
  Result := Items[NomeParametro];
end;

function TCustomParams.GetItem(const Nome : string): TCMParam;
var
  i : Integer;
begin
  Result := nil;  
  CheckActive;
  for i := 0 to Pred(FItems.Count) do
  begin
    if TCMParam(FItems[i]).Name = Nome then
    begin
      Result := TCMParam(FItems[i]);
      break;
    end;
  end;
end;

function TCustomParams.GetActive: Boolean;
begin
  Result := FItems <> nil;
end;

procedure TCustomParams.SetActive(const Value : Boolean);
begin
  if Value then
    Open
  else
    Close;
end;

procedure TCustomParams.SetDatabaseName(const Value : string);
begin
  CheckInactive;
  FDatabaseName := Value;
end;

procedure TCustomParams.SetParamTable(const Value : string); 
begin
  CheckInactive;
  FParamTable := Value;
end;

procedure TCustomParams.Open; 
var
  NovoParam : TCMParam;
  Cds : TClientDataSet;
begin
  if (Trim(FDatabaseName) <> '') and (Trim(FParamTable) <> '') and (FItems = nil) then
  begin
    FItems := TList.Create;
    Cds := TClientDataSet.Create(nil);
    try
      try
        Cds.Data := Padroes.GetDataPacket(GetSqlSelect);
        Cds.First;

        while not Cds.EOF do
        begin
          NovoParam := TCMParam.Create(Self, Cds.FieldByName('DESCPARAM').AsString, Cds.FieldByName(
                  'VALPARAM').AsString, Cds.FieldByName('TIPOPARAM').AsString);
          FItems.Add(NovoParam);
          Cds.Next;
        end;
        Cds.Close;
      except
        FItems.Free;
        FItems := nil;
        raise;
      end;
    finally
      Cds.Free;
    end;
  end;
end;

procedure TCustomParams.Close;
begin
  if FItems <> nil then
  begin
    FItems.Clear;
    FItems.Free;
    FItems := nil;
  end;
end;

procedure TCustomParams.CheckActive;
begin                                             
  if not Active then DatabaseError('A tabela de parâmetros tem que estar aberta para se realizar esta operação!');
end;

procedure TCustomParams.CheckInactive;
begin
  if Active then DatabaseError('A tabela de parâmetros tem que estar fechada para se realizar esta operação!');
end;

procedure TCustomParams.ApplyUpdates;
begin
  DoApplyUpdates(nil);
end;

procedure TCustomParams.DoApplyUpdates(CMParam : TCMParam);
var
  i : Integer;

  procedure ApplyToDB(AParam : TCMParam);
  begin
    case AParam.Status of
      usInserted : 
        begin
          with AParam do
          begin
            Padroes.ExecSqlAndCommit(
                          'INSERT INTO ' + FParamTable
                          + ' (DESCPARAM, VALPARAM, TIPOPARAM) VALUES ('
                          + QuotedStr(FName) + ',' + QuotedStr(FValue) + ','
                          + QuotedStr(FDataType) + ')');
            FStatus := usUnmodified;
          end; 
        end;
      usModified : 
        begin
          with AParam do
          begin
            Padroes.ExecSqlAndCommit('UPDATE ' + FParamTable + ' SET VALPARAM = '
                                     + QuotedStr(FValue) + ' WHERE DESCPARAM = '
                                     + QuotedStr(FName));
            FStatus := usUnmodified;
          end;
        end;
      usDeleted  :
        begin
          with AParam do
          begin
            Padroes.ExecSqlAndCommit('DELETE ' + FParamTable
                                     + ' WHERE DESCPARAM = ' + QuotedStr(FName));
            Free;
          end;
          FItems[i] := nil;
        end;
    end;
  end;
  
begin
  if CMParam = nil then
    for i := Pred(FItems.Count) downto 0 do
      ApplyToDB(TCMParam(FItems[i]))
  else
    ApplyToDB(CMParam);
  FItems.Pack;
  FItems.Capacity := FItems.Count;
end;

procedure TCustomParams.setParamUpdateMode(const Value : TParamUpdateMode);
begin
  FParamUpdateMode := Value;
end;

procedure TCustomParams.Add(const ParamName : string; const ParamType : TFieldType; const ParamValue : string);
var
  NewParam : TCMParam;
  ParamDataType : string;
begin
  case ParamType of
    ftString   : ParamDataType := 'S';
    ftDate, ftDateTime : ParamDataType := 'D';
    ftTime     : ParamDataType := 'T';
    ftBoolean  : ParamDataType := 'B';
    ftFloat    : ParamDataType := 'N';
    ftInteger  : ParamDataType := 'I';
    else ParamDataType := 'U';
  end;
  NewParam := TCMParam.Create(Self, ParamName, ParamValue, ParamDataType);
  NewParam.FStatus := usInserted;
  FItems.Add(NewParam);
  if ParamUpdateMode = umOnChange then
    DoApplyUpdates(NewParam);
end;

function TCustomParams.GetSqlSelect: string;
begin
  Result := 'SELECT DESCPARAM, VALPARAM, TIPOPARAM FROM ' + FParamTable;
end;

{ TCMParametros }

constructor TCMParametros.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FParamTable := 'CMPARAM';
  FIgnoraEmpresa := False;
end;

function TCMParametros.GetSqlSelect: string;
begin
  Result := 'SELECT DESCPARAM, VALPARAM, TIPOPARAM FROM ' + FParamTable
          + ' WHERE ((IDMODULO IS NULL) OR (IDMODULO = ' + IntToStr(Sistema.IdModulo) + ')) ';
  if not IgnoraEmpresa then
    Result := Result + ' AND (IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa) + ')';
end;

procedure TCMParametros.SetIgnoraEmpresa(const Value: Boolean);
begin
  FIgnoraEmpresa := Value;
end;


end.
