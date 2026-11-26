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
unit TREdit;

interface

uses
   StdCtrls, Classes, SysUtils, Controls, DB, dbctrls, Forms, Graphics, Menus,
   Messages;

type
   TRealFormat = (fNumber ,fMoney, fFixed, iNumber, iFixed);

   TRealEdit = class(TMemo)
   private
          { Private declarations }
          FValue : Double;
          procedure SetValue(valor: Double);
          function  GetValue: Double;
          procedure CMChanged(var Message: TCMChanged); message CM_CHANGED;
          procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
          procedure SetFormat(Value: TRealFormat);
          procedure CMExit(var Message: TWMNoParams); message CM_EXIT;

   protected
             FTipo: TRealFormat;
             FSignal: Boolean;
             FIntDigits: Integer;
             FDecDigits: Integer;
             procedure KeyPress(var Key: Char); override;

    { Public declarations }
   public
          constructor Create( AOwner: TComponent ); override;
          property Value: Double read GetValue write SetValue;

   published
             property IntDigits: Integer read FIntDigits write FIntDigits;
             property DecDigits: Integer read FDecDigits write FDecDigits;
             property NumberFormat: TRealFormat	read FTipo	write SetFormat;
             property Signal    : Boolean	read FSignal	write FSignal;
   end;

   TDBRealEdit = class(TRealEdit)
   private
          { Private declarations }
          FDataLink : TFieldDataLink;
          procedure CMEnter(var Message: TCMEnter); message CM_ENTER;
          procedure SetDataField(Value : string);
          function GetDataField: string;
          procedure DataChange(Sender: TObject);
          function GetDataSource: TDataSource;
          procedure SetDataSource(Value: TDataSource);
          procedure EditingChange(Sender: TObject);
          procedure UpdateData(Sender: TObject);
          procedure CMChanged(var Message: TCMChanged); message CM_CHANGED;

   protected
    { Public declarations }
          procedure KeyPress(var Key: Char); override;
   public
          constructor Create( AOwner: TComponent ); override;
          destructor Destroy; override;

   published
             property DataField: string read GetDataField write SetDataField;
             property DataSource: TDataSource read GetDataSource write SetDataSource;
   end;

   function FormatTexto(Valor: Double; FTipo : TRealFormat; FIntDigits, FDecDigits : integer): string;
   function TrimAll(s : String): String;

implementation

// Funções Comuns
// =============================
function FormatTexto(Valor: Double; FTipo : TRealFormat; FIntDigits, FDecDigits : integer) : string;
var ff,fsize : String;
    TextoAux : string;
begin
     case FTipo of
     fNumber ,fMoney, fFixed :
     begin
          FSize := IntToStr(FIntDigits) + '.' + IntToStr(FDecDigits);
	  if FTipo = fNumber then ff := '%'+ FSize + 'n';
	  if FTipo = fMoney  then ff := '%'+ FSize + 'm';
	  if FTipo = fFixed  then ff := '%'+ FSize + 'f';
          TextoAux := format(ff,[valor]);
     end;

     iNumber,iFixed:
     begin
     	  if FTipo = iNumber then
   	  begin
	       FSize := IntToStr(FIntDigits);
   	       ff := '%'+ FSize + 'd';
	       TextoAux := format(ff,[Trunc(valor)]);
          end;

	  if FTipo = iFixed  then
	  begin
	       FSize := IntToStr(FIntDigits) + '.' + IntToStr(FIntDigits);
   	       ff := '%'+ FSize + 'd';
	       TextoAux := format(ff,[Trunc(valor)]);
          end;
     end;
     end;
     
     Result := Trim(TextoAux);
end;

function TrimAll(s : String): String;
var i : Integer;
begin
     s := Trim(s);

     while Pos(' ', S) > 0 do
           Delete (s, Pos(' ', S), 1);

     while Pos(ThousandSeparator, S) > 0 do
           Delete (s, Pos(ThousandSeparator, S), 1);

     i := Pos(CurrencyString, S);

     if i > 0 then
   	Delete(S, I, Length(CurrencyString));

     if s = '' then
        s := '0';

     Result := s;
end;


// TRealEdit
// ================================================
constructor TRealEdit.Create( AOwner: TComponent );
begin
  inherited Create( AOwner );
  Height	:= 21;
  Width		:= 121;
  WordWrap	:= False;
  Alignment	:= taRightJustify;
  FValue	:= 0;
  NumberFormat	:= fNumber;
  FIntDigits	:= 10;
  FDecDigits	:= 2;

  Text := FormatTexto(FValue,FTipo,FIntDigits,FDecDigits);
end;

procedure TRealEdit.SetFormat(Value: TRealFormat);
begin
     if Value <> FTipo then
     begin
          FTipo := Value;
          if (FTipo = iNumber) OR (FTipo = iFixed) then
             FDecDigits	:= 0;

          Text := FormatTexto(FValue, FTipo, FIntDigits, FDecDigits);
     end;
end;

procedure TRealEdit.SetValue(valor: Double);
begin
   if Valor <> FValue then
      FValue := Valor;

   if not focused then
   Begin
      Text := FormatTexto(FValue, FTipo, FIntDigits, FDecDigits);
   End;
end;

function  TRealEdit.GetValue: Double;
begin
     Result := FValue;
end;

procedure TRealEdit.CMEnter(var Message: TCMEnter);
begin
     Text := FloatToStr(FValue);
     SelectAll;
     inherited;
end;

procedure TRealEdit.CMExit(var Message: TWMNoParams);
begin
     if FValue <> StrToFloat(TrimAll(Text)) then
        Value := StrToFloat(TrimAll(Text))
     else
     Begin
         Text := FormatTexto(FValue,FTipo,FIntDigits,FDecDigits);
     End;

     inherited;
end;

procedure TRealEdit.KeyPress(var Key: Char);
begin
   if key = ThousandSeparator then
      key := DecimalSeparator;

   if ((fTipo = iNumber) or (fTipo = iFixed)) and (key = DecimalSeparator)
      then Key := #0;

   if Not (Key in ['0'..'9',DecimalSeparator,'-',chr(8)]) Then
   begin
        Key := #0;
        inherited KeyPress(Key);
        exit;
   end;

   // Verifica digitação do Decimal Separator
   if key = DecimalSeparator then
   begin
        if Pos(DecimalSeparator,Text) <> 0 then
           Key := #0;
   end;

   // Verifica digitação do sinal
   if (key = '-') then
   if FSignal then
   begin
        if (Length(Text) > 1) And (Text[1] = '-') then
           Key := #0;
   end
   else
       Key := #0;

   // Verifica Tamanho
   if (key <> chr(8)) and (Key <> DecimalSeparator) then
      if (Pos(DecimalSeparator,Text) = 0) then
      begin // na parte inteira
            if (Length(Text) >= FIntDigits) and (SelLength = 0) then
               Key := #0;
      end
      else
      begin
           if ((Length(Text)- Pos(DecimalSeparator,Text)) >= FDecDigits) and (SelLength = 0) then Key := #0;
      end;

   inherited KeyPress(Key);
end;

procedure TRealEdit.CMChanged;
begin
  inherited;
  if not (csDesigning in ComponentState) Then
     Try
        Value := StrToFloat(TrimAll(Text));
     Except

     End;
end;


// TDBRealEdit
// ========================================
constructor TDBRealEdit.Create( AOwner: TComponent );
begin
  inherited Create( AOwner );
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnEditingChange := EditingChange;
  FDataLink.OnUpdateData := UpdateData;
end;

destructor TDBRealEdit.Destroy;
begin
  FDataLink.Free;
  FDataLink := nil;
  inherited;
end;

procedure TDBRealEdit.SetDataField(Value : string);
begin
     FDataLink.FieldName := Value;
end;

function TDBRealEdit.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TDBRealEdit.DataChange(Sender: TObject);
begin
     if (FDataLink.Field <> nil) then
     begin
          if not (csDesigning in ComponentState) then
          begin
               if (FDataLink.Field.DataType = ftString) and (MaxLength = 0) then
                  MaxLength := FDataLink.Field.Size;
          end;

          if (FDataLink.Field.Value = null) then
          begin
               if (FDataLink.DataSet.State in [dsInsert,dsEdit]) then
                  FDataLink.Field.Value := 0;
               Value := 0;
          end
          else
              Value := FDataLink.Field.Value;
     end;
    Modified := True;
end;

function TDBRealEdit.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TDBRealEdit.SetDataSource(Value: TDataSource);
begin
  FDataLink.DataSource := Value;
  if Value <> nil then Value.FreeNotification(Self);
end;

procedure TDBRealEdit.EditingChange(Sender: TObject);
begin
  inherited ReadOnly := not FDataLink.Editing;
end;

procedure TDBRealEdit.UpdateData(Sender: TObject);
begin
  if FDataLink.CanModify then
     FDataLink.Field.Text := Text;
end;

procedure TDBRealEdit.CMChanged(var Message: TCMChanged);
begin
     inherited;

     if (FDataLink <> nil) and
        (FDataLink.Field <> nil) then
     begin
        if (FDataLink.Editing) and
           (FDataLink.CanModify) and
           (FDataLink.Field.AsFloat <> FValue ) then
        begin
             FDataLink.Field.Value := Value;
        end;

        if (not FDataLink.CanModify) then
        begin
             if FDataLink.Field.Value <> null then
                Value := FDataLink.Field.Value;

             Text := FormatTexto(FValue,FTipo,FIntDigits,FDecDigits);
        end;
     end;
end;

procedure TDBRealEdit.CMEnter(var Message: TCMEnter);
begin
     if ( DataSource <> nil ) And
        ( DataSource.AutoEdit ) and
        ( FDataLink.CanModify ) then
        FDataLink.Edit;
     inherited;
end;

procedure TDBRealEdit.KeyPress(var Key: Char);
begin
     inherited;

end;

end.
