unit CMBussinesObject;

interface
{$I CM.inc}
uses
  Classes, db, dbTables, SysUtils, wwQuery;

type

  TCommitKind = (ckComponent, ckDeveloper);

  EBussinesError = class(Exception)
  private
  public
  end;

  TBussinesComponent = class;

  (** Classe abstrata que encapsula uma lista de objetos de negócio.

    Um BizObjList não existe sozinho, ele tem que ter um owner que será
    descendente de TBussinesComponent.

    Cada classe de negócio que é detalhe de uma outra deve ser implementada
    como descendente de TBizObjList. *)
  TBizObjList = class(TPersistent)
  private
    FOwner: TBussinesComponent;
    FqryDetail: TwwQuery;
    FusqlDetail: TUpdateSQL;
  protected
    property qryDetail: TwwQuery read FqryDetail;
    property usqlDetail: TUpdateSQL read FusqlDetail;
    property Owner: TBussinesComponent read FOwner;
  public
    constructor Create(AOwner: TBussinesComponent);
    destructor Destroy; override;
    (** Posiciona o cursor no primeiro objeto de negócio da lista. *)
    procedure First;
    (** Posiciona o cursor no objeto de negócio anterior ao atual. *)
    procedure Prior;
    (** Posiciona o cursor no próximo objeto de negócio da lista.  *)
    procedure Next;
    (** Posiciona o cursor no último objeto de negócio da lista.   *)
    procedure Last;
    (** Indica se o cursor está ou não posicionado no último objeto de negócio da lista.

      Abreviação de End Of List. *)
    function EOL: Boolean;
    (** Indica se o cursor está ou não posicionado no primeiro objeto de negócio da lista.

      Abreviação de Begin Of List. *)
    function BOL: Boolean;
    function Locate(const KeyFields: string; const KeyValues: Variant;
       Options: TLocateOptions): Boolean;
    procedure Insert; virtual;
    procedure Edit; virtual;
    procedure Delete; virtual;
    procedure Post; virtual;
    procedure Cancel; virtual;
    function CanModify: Boolean; virtual;
  end;

  TBussinesComponent = class(TComponent)
  private
    FqryMaster: TwwQuery;
    FusqlMaster: TUpdateSQL;
    FDatabaseName: string;
    FCommitKind: TCommitKind;
    procedure SetDatabaseName(const Value: string);
    procedure SetCommitKind(const Value: TCommitKind);
    function GetDatabase: TDatabase;
  protected
    property qryMaster: TwwQuery read FqryMaster;
    property usqlMaster: TUpdateSQL read FusqlMaster;
    property Database: TDatabase read GetDatabase;
    function GetState : TDataSetState; virtual;
    procedure ApplyUpdates; virtual;
    procedure CancelUpdates; virtual;
    procedure UpdateDatabaseName; virtual;
    {$IFDEF CM4}
    procedure GetFieldValue(const FieldName: string; var Value: string); overload;
    procedure GetFieldValue(const FieldName: string; var Value: Integer); overload;
    procedure GetFieldValue(const FieldName: string; var Value: Double); overload;
    procedure GetFieldValue(const FieldName: string; var Value: TDateTime); overload;
    {$ELSE}
    procedure GetFieldValueAsString(const FieldName: string; var Value: string);
    procedure GetFieldValueAsInteger(const FieldName: string; var Value: Integer);
    procedure GetFieldValueAsFloat(const FieldName: string; var Value: Double);
    procedure GetFieldValueAsDateTime(const FieldName: string; var Value: TDateTime);
    {$ENDIF}
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function LoadFromDB(ID: Double): Boolean; virtual; abstract;
    procedure Insert; virtual;
    procedure Edit; virtual;
    procedure Delete; virtual;
    procedure Post; virtual;
    procedure Cancel; virtual;
    procedure Refresh; virtual;
    function CanModify: Boolean; virtual;
  published
    property State : TDataSetState read GetState;
    property DatabaseName: string read FDatabaseName write SetDatabaseName;
    property CommitKind: TCommitKind read FCommitKind write SetCommitKind  default ckComponent;
  end;

implementation

{ TBizObjList }

function TBizObjList.BOL: Boolean;
begin
  Result := FqryDetail.Bof;
end;

procedure TBizObjList.Cancel;
begin
  FqryDetail.Cancel;
end;

function TBizObjList.CanModify: Boolean;
begin
  Result := FqryDetail.CanModify;
end;

constructor TBizObjList.Create(AOwner: TBussinesComponent);
begin
  inherited Create;
  FOwner := AOwner;
  FqryDetail := TwwQuery.Create(nil);
  FusqlDetail := TUpdateSQL.Create(nil);
  with FqryDetail do
  begin
    CachedUpdates := True;
    UpdateObject := FusqlDetail;
    DatabaseName := AOwner.DatabaseName;
  end;
end;

procedure TBizObjList.Delete;
begin
  FqryDetail.Delete;
  FOwner.ApplyUpdates;
end;

destructor TBizObjList.Destroy;
begin
  FqryDetail.Close;
  FqryDetail.Free;
  FusqlDetail.Free;
  inherited Destroy;
end;

procedure TBizObjList.Edit;
begin
 if FOwner.State in dsEditModes then
   FqryDetail.Edit
 else
   raise EBussinesError.Create('Não é possível inserir um detalhe se o mestre não está em edição!');
end;

function TBizObjList.EOL: Boolean;
begin
  Result := FqryDetail.Eof;
end;

procedure TBizObjList.First;
begin
  FqryDetail.First;
end;

procedure TBizObjList.Insert;
begin
 if FOwner.State in dsEditModes then
   FqryDetail.Insert
 else
   raise EBussinesError.Create('Não é possível inserir um detalhe se o mestre não está em edição!');
end;

procedure TBizObjList.Last;
begin
  FqryDetail.Last;
end;

function TBizObjList.Locate(const KeyFields: string;
  const KeyValues: Variant; Options: TLocateOptions): Boolean;
begin
  Result := FqryDetail.Locate(KeyFields, KeyValues, Options);
end;

procedure TBizObjList.Next;
begin
  FqryDetail.Next;
end;

procedure TBizObjList.Post;
begin
  FqryDetail.Post;
end;

procedure TBizObjList.Prior;
begin
  FqryDetail.Prior;
end;

{ TBussinesComponent }

procedure TBussinesComponent.ApplyUpdates;
begin
  if FCommitKind = ckComponent then
  begin
    Database.ApplyUpdates([qryMaster]);
    Refresh;
  end else
    qryMaster.ApplyUpdates;
end;

procedure TBussinesComponent.Cancel;
begin
  qryMaster.Cancel;
end;

procedure TBussinesComponent.CancelUpdates;
begin
  qryMaster.CancelUpdates;
end;

function TBussinesComponent.CanModify: Boolean;
begin
  Result := qryMaster.CanModify;
end;

constructor TBussinesComponent.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FCommitKind := ckComponent;
  FqryMaster := TwwQuery.Create(nil);
  FusqlMaster := TUpdateSQL.Create(nil);
  with FqryMaster do
  begin
    CachedUpdates := True;
    UpdateObject := FusqlMaster;
    DatabaseName := FDatabaseName;
  end;
end;

procedure TBussinesComponent.Delete;
begin
  FqryMaster.Delete;
  Self.ApplyUpdates;
end;

destructor TBussinesComponent.Destroy;
begin
  FqryMaster.Close;
  FqryMaster.Free;
  FusqlMaster.Free;
  inherited Destroy;
end;

procedure TBussinesComponent.Edit;
begin
  FqryMaster.Edit;
end;

function TBussinesComponent.GetDatabase: TDatabase;
begin
  Result := Session.FindDatabase(FDatabaseName);
  if Result = nil then
    raise EBussinesError.Create('Não foi encontrado o Database ' + FDatabaseName);
end;
{$IFDEF CM4}
procedure TBussinesComponent.GetFieldValue(const FieldName: string; var Value: Integer);
begin
  if FqryMaster.Active and (FqryMaster.FindField(FieldName) <> nil) then
    Value := FqryMaster.FieldByName(FieldName).AsInteger
  else
    Value := 0;
end;

procedure TBussinesComponent.GetFieldValue(const FieldName: string; var Value: string);
begin
  if FqryMaster.Active and (FqryMaster.FindField(FieldName) <> nil) then
    Value := FqryMaster.FieldByName(FieldName).AsString
  else
    Value := '';
end;

procedure TBussinesComponent.GetFieldValue(const FieldName: string; var Value: TDateTime);
begin
  if FqryMaster.Active and (FqryMaster.FindField(FieldName) <> nil) then
    Value := FqryMaster.FieldByName(FieldName).AsDateTime
  else
    Value := 0.0;
end;

procedure TBussinesComponent.GetFieldValue(const FieldName: string; var Value: Double);
begin
  if FqryMaster.Active and (FqryMaster.FindField(FieldName) <> nil) then
    Value := FqryMaster.FieldByName(FieldName).AsFloat
  else
    Value := 0.0;
end;
{$ELSE}
procedure TBussinesComponent.GetFieldValueAsDateTime(
  const FieldName: string; var Value: TDateTime);
begin
  if FqryMaster.Active and (FqryMaster.FindField(FieldName) <> nil) then
    Value := FqryMaster.FieldByName(FieldName).AsDateTime
  else
    Value := 0.0;
end;

procedure TBussinesComponent.GetFieldValueAsFloat(const FieldName: string;
  var Value: Double);
begin
  if FqryMaster.Active and (FqryMaster.FindField(FieldName) <> nil) then
    Value := FqryMaster.FieldByName(FieldName).AsFloat
  else
    Value := 0.0;
end;

procedure TBussinesComponent.GetFieldValueAsInteger(
  const FieldName: string; var Value: Integer);
begin
  if FqryMaster.Active and (FqryMaster.FindField(FieldName) <> nil) then
    Value := FqryMaster.FieldByName(FieldName).AsInteger
  else
    Value := 0;
end;

procedure TBussinesComponent.GetFieldValueAsString(const FieldName: string;
  var Value: string);
begin
  if FqryMaster.Active and (FqryMaster.FindField(FieldName) <> nil) then
    Value := FqryMaster.FieldByName(FieldName).AsString
  else
    Value := '';
end;
{$ENDIF}
function TBussinesComponent.GetState: TDataSetState;
begin
  Result := FqryMaster.State;
end;

procedure TBussinesComponent.Insert;
begin
  FqryMaster.Insert;
end;

procedure TBussinesComponent.Post;
begin
  qryMaster.Post;
  Self.ApplyUpdates;
end;

procedure TBussinesComponent.Refresh;
begin
  FqryMaster.Close;
  FqryMaster.Open;
end;

procedure TBussinesComponent.SetCommitKind(const Value: TCommitKind);
begin
  FCommitKind := Value;
end;

procedure TBussinesComponent.SetDatabaseName(const Value: string);
begin
  if Value <> FDatabaseName then
  begin
    FDatabaseName := Value;
    UpdateDatabaseName;
  end;
end;

procedure TBussinesComponent.UpdateDatabaseName;
begin
  FqryMaster.Close;
  FqryMaster.DatabaseName := FDatabaseName;
end;

end.



