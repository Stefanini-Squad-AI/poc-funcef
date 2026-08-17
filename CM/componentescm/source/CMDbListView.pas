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
unit CMDbListView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, db;

{$I CM.INC}

type
  {$IFNDEF CM5}
      TFields = Class(TList)

      End;
  {$ENDIF}

  TOnCalcListItemAtributes = Procedure (Sender :TObject; Var LItem :TListItem) of Object;
  TBeforeCreateColumn = Procedure (Sender :TObject; Const Field :TField;  Var AddColumn :Boolean) of Object;
  TBeforeAddRecord = Procedure (Sender :TObject; Const Fields :TFields; Var addRecord :Boolean) of Object;

  TListDataLink = class(TDataLink)
  private
    _Owner :TComponent;
  protected
    procedure ActiveChanged; Override;
  public
    {$IFNDEF CM5}
      constructor Create(Aowner :TComponent);
    {$ELSE}
      constructor Create(Aowner :TComponent); Overload;
    {$ENDIF}
    property Active;
  End;  

  TCMDbListView = class(TListView)
  private
    {$IFNDEF CM5}
        FFields :TFields;
    {$ENDIF}
    FAutoCreateColumns: Boolean;
    FCloseDataSet: Boolean;
    FAddFieldsAsSubItems: Boolean;
    FOnCalcListItemAtributes: TOnCalcListItemAtributes;
    FBeforeCreateColumn: TBeforeCreateColumn;
    FBeforeAddRecord: TBeforeAddRecord;
    _ListDataLink :TListDataLink;
    procedure SeTDataSource(const Value: TDataSource);
    function GetDataSource:TdataSource;
    procedure SetAutoCreateColumns(const Value: Boolean);
    procedure SetCloseDataSet(const Value: Boolean);
    procedure SetAddFieldsAsSubItems(const Value: Boolean);
    procedure SetOnCalcListItemAtributes(
      const Value: TOnCalcListItemAtributes);
    procedure SetBeforeCreateColumn(const Value: TBeforeCreateColumn);
    procedure SetBeforeAddRecord(const Value: TBeforeAddRecord);
    function GetRecordCount: Integer;
    function GetBof: Boolean;
    function GetEof: Boolean;
    procedure MontaLista;
  protected
    { Protected declarations }
    procedure CalcListItemAtributes(Sender :TObject; Var LItem :TListItem);
    procedure DoBeforeCreateColumn(Sender :TObject; Const Field :TField;  Var AddColumn :Boolean);
    procedure DoBeforeAddRecord(Sender :TObject; Const Fields :TFields; Var addRecord :Boolean);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; Override;
    procedure MoveUp;
    procedure MoveDown;
    procedure MoveToFirst;
    procedure MoveToLast;
    procedure Clear;
    property RecordCount :Integer read GetRecordCount;
    property Bof :Boolean read GetBof;
    property Eof :Boolean read GetEof;
  published
    { Published declarations }
    property OnCalcListItemAtributes :TOnCalcListItemAtributes read FOnCalcListItemAtributes write SetOnCalcListItemAtributes;
    property BeforeCreateColumn :TBeforeCreateColumn read FBeforeCreateColumn write SetBeforeCreateColumn;
    property BeforeAddRecord :TBeforeAddRecord read FBeforeAddRecord write SetBeforeAddRecord;
    property DataSource :TDataSource read GetDataSource write SeTDataSource;
    property AutoCreateColumns :Boolean read FAutoCreateColumns write SetAutoCreateColumns;
    property AddFieldsAsSubItems :Boolean read FAddFieldsAsSubItems write SetAddFieldsAsSubItems;
    property CloseDataSet :Boolean read FCloseDataSet write SetCloseDataSet;
  end;

  {$IFNDEF CM5}
  procedure Register;
  {$ENDIF}

implementation


{$IFNDEF CM5}
procedure Register;
begin
  RegisterComponents('CM Standard', [TCMDbListView]);
end;
{$ENDIF}

{ TCMDbListView }

constructor TCMDbListView.Create(AOwner: TComponent);
begin
  inherited;
  FAutoCreateColumns := False;
  FCloseDataSet := False;
  AddFieldsAsSubItems := False;
  ViewStyle := vsReport;
  ReadOnly := True;

  {$IFNDEF CM5}
  FFields := TFields.Create;
  {$ELSE}
  RowSelect := True;
  {$ENDIF}

  _ListDataLink := TListDataLink.Create(Self);
end;

destructor TCMDbListView.Destroy;
begin
  Items.Clear;
  Columns.Clear;
  {$IFNDEF CM5}
  FFields.Free;
  {$ENDIF}
  _ListDataLink.Free;
  inherited;  
end;

procedure TCMDbListView.MontaLista;

Function FormatMaskField(Field :TField):String;
Begin
    If (Field Is TFloatField) And
       (TFloatField(Field).DisplayFormat <> '') Then
       Result := FormatFloat(TFloatField(Field).DisplayFormat,Field.AsFloat)
    Else
       Result := Field.AsString;
End;

Procedure SetColumnsText(iIndice :Integer; ListItem :TListItem; Fields :TFields);
Var
  sValue :String;
Begin
    If FAutoCreateColumns And (iIndice <= (Self.Columns.Count - 1)) Then
    Begin
    {$IFNDEF CM5}
          sValue := FormatMaskField(TField(Fields[StrToIntDef(Self.Columns.Items[iIndice].DisplayName,iIndice)]))
    {$ELSE}
          sValue := FormatMaskField(Fields[Self.Columns.Items[iIndice].Tag])
    {$ENDIF}
    End
    Else
    Begin
      {$IFNDEF CM5}
            sValue := FormatMaskField(TField(Fields[iIndice]));
      {$ELSE}
            sValue := FormatMaskField(Fields[iIndice]);
      {$ENDIF}
    End;

    If iIndice = 0 Then
       ListItem.Caption := sValue
    Else
       ListItem.SubItems.Add(sValue);
End;

Var
  X :Integer;
  ListItem :TListItem;
  ListColum :TListColumn;
  bAddColumn, bAddRecord :Boolean;
  {$IFDEF CM5}
  FFields :TFields;
  {$ENDIF}
begin
  If _ListDataLink.DataSource = nil Then
     ShowMessage('O DataSet não foi Indicado, não é possível montar a lista')
  Else
  Begin
     With _ListDataLink.DataSource.DataSet Do
     Begin
        If Not Active Then Open;
        {$IFDEF CM5}
        FFields := Fields;
        {$ELSE}
        FFields.Clear;
        For X:= 0 To FieldCount - 1 Do
            FFields.Add(Fields[X]);
        {$ENDIF}

        Self.Items.Clear;

        If FAutoCreateColumns Then
        Begin
           Self.Columns.Clear;

           For X:=0 To FFields.Count - 1 Do
           Begin
              bAddColumn := True;

              DoBeforeCreateColumn(self,Fields[X], bAddColumn);

              If bAddColumn Then
              Begin
                 ListColum := Self.Columns.Add;
                 ListColum.Caption := Fields[X].DisplayName;
                 {$IFNDEF CM5}
                 ListColum.DisplayName := IntToStr(X);
                 {$ELSE}
                 ListColum.Tag := X;
                 {$ENDIF}
                 ListColum.Alignment := Fields[X].Alignment;
                 ListColum.width := Fields[X].DisplayWidth;
              End;
           End;
        End;

        If (FFields.Count < Self.Columns.Count) Then
           ShowMessage('O Número de Colunas da lista é superiror ao número de Colunas do DataSet Indicado')
        Else
        Begin
           First;

           While Not Eof Do
           Begin
             bAddRecord := True;

             DoBeforeAddRecord(Self, FFields, bAddRecord);

             If bAddRecord Then
             Begin
                ListItem := Self.Items.Add;

                SetColumnsText(0,ListItem,FFields);

                If AddFieldsAsSubItems Then
                Begin
                   SetColumnsText(0,ListItem,FFields);

                   For X:=1 To FFields.Count - 1 Do
                       SetColumnsText(X,ListItem,FFields);
                End
                Else
                   For X:=1 To Self.Columns.Count - 1 Do
                       SetColumnsText(X,ListItem,FFields);

                CalcListItemAtributes(Self, ListItem);
             End;

             Next;
           End;

           If (Not (csDesigning in self.ComponentState)) And
              FCloseDataSet Then Close;
        End;
     End;
  End;
end;

function TCMDbListView.GetDataSource: TdataSource;
begin
  Result := _ListDataLink.DataSource;
end;

procedure TCMDbListView.SeTDataSource(const Value: TDataSource);
begin
  _ListDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TCMDbListView.SetAutoCreateColumns(const Value: Boolean);
begin
  FAutoCreateColumns := Value;
end;

procedure TCMDbListView.SetCloseDataSet(const Value: Boolean);
begin
  FCloseDataSet := Value;
end;

procedure TCMDbListView.SetAddFieldsAsSubItems(const Value: Boolean);
begin
  FAddFieldsAsSubItems := Value;
end;

procedure TCMDbListView.CalcListItemAtributes(Sender :TObject; var LItem: TListItem);
begin
  If Assigned(FOnCalcListItemAtributes) Then FOnCalcListItemAtributes(Sender, LItem);
end;

procedure TCMDbListView.SetOnCalcListItemAtributes(
  const Value: TOnCalcListItemAtributes);
begin
  FOnCalcListItemAtributes := Value;
end;

procedure TCMDbListView.DoBeforeCreateColumn(Sender: TObject;
  const Field :TField; Var AddColumn: Boolean);
begin
  If Assigned(FBeforeCreateColumn) Then FBeforeCreateColumn(Sender, Field, AddColumn);
end;

procedure TCMDbListView.SetBeforeCreateColumn(
  const Value: TBeforeCreateColumn);
begin
  FBeforeCreateColumn := Value;
end;

procedure TCMDbListView.DoBeforeAddRecord(Sender: TObject;
  const Fields: TFields; var addRecord: Boolean);
begin
  If Assigned(fBeforeAddRecord) Then fBeforeAddRecord(Sender, Fields, addRecord);
end;

procedure TCMDbListView.SetBeforeAddRecord(const Value: TBeforeAddRecord);
begin
  FBeforeAddRecord := Value;
end;

function TCMDbListView.GetRecordCount: Integer;
begin
  Result := Self.Items.Count;
end;

procedure TCMDbListView.MoveDown;
begin

end;

procedure TCMDbListView.MoveToFirst;
begin

end;

procedure TCMDbListView.MoveToLast;
begin

end;

procedure TCMDbListView.MoveUp;
begin

end;

function TCMDbListView.GetBof: Boolean;
begin
  If Self.Selected = nil Then
    Result := False
  Else
    Result := (Self.Selected.Index = 0);
end;

function TCMDbListView.GetEof: Boolean;
begin
  If Self.Selected = nil Then
    Result := False
  Else
    Result := (Self.Selected.Index = (Self.Items.Count - 1));
end;

procedure TCMDbListView.Clear;
begin
  Self.Items.Clear;
end;

{ TListDataLink }

constructor TListDataLink.Create(Aowner: TComponent);
begin
  Inherited Create;
  _Owner := Aowner;
end;

procedure TListDataLink.ActiveChanged;
begin
  inherited;
  If Active Then
     TCMDbListView(_Owner).MontaLista
  Else
     If csDesigning in TCMDbListView(_Owner).ComponentState Then
        TCMDbListView(_Owner).Clear;
end;

end.
