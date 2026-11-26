unit uCMDialogs;

interface

Uses Forms, stdCtrls, Windows, graphics, Dialogs, Controls, SysUtils,
     CMDateTimePicker, TREdit, Classes;

function InputMemo(const ACaption, APrompt: string; var Value: string): Boolean;
function InputDate(const ACaption, APrompt: string; var Value: TDateTime): Boolean;
function InputValue(const ACaption, APrompt: string; var Value: Double): Boolean; Overload;
function InputValue(const ACaption, APrompt: string; var Value: Integer): Boolean; Overload;

function MsgDlg(const Msg: String; const Caption: String; AType: TMsgDlgType;
                Buttons: TMsgDlgButtons; HelpCtx: Longint): TModalResult;

{Exibe Caixa de diálogo padrão de aviso}
Procedure MsgAviso(s:string;T:String);                             

implementation

function GetAveCharSize(Canvas: TCanvas): TPoint;
var
  I: Integer;
  Buffer: array[0..51] of Char;
begin
  for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
  for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
  GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
  Result.X := Result.X div 52;
end;


function InputMemo(const ACaption, APrompt: string;
  var Value: string): Boolean;
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TMemo;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
  Result := False;
  Form := TForm.Create(Application);
  with Form do
    try
      Canvas.Font := Font;
      DialogUnits := GetAveCharSize(Canvas);
      BorderStyle := bsDialog;
      Caption := ACaption;
      Font.Style := [fsBold];
      ClientWidth := MulDiv(250, DialogUnits.X, 4);
      ClientHeight := MulDiv(95, DialogUnits.Y, 8);
      Position := poScreenCenter;
      Prompt := TLabel.Create(Form);
      with Prompt do
      begin
        Parent := Form;
        AutoSize := True;
        Left := MulDiv(8, DialogUnits.X, 4);
        Top := MulDiv(6, DialogUnits.Y, 8);
        Caption := APrompt;
      end;
      Edit := TMemo.Create(Form);
      with Edit do
      begin
        Parent := Form;
        Left := Prompt.Left;
        Top := MulDiv(17, DialogUnits.Y, 8);
        Width := MulDiv(234, DialogUnits.X, 4);
        MaxLength := 1000;
        Text := Value;
        SelectAll;
      end;
      ButtonTop := MulDiv(77, DialogUnits.Y, 8);
      ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := 'OK';
        ModalResult := idOK;
        Default := True;
        SetBounds(MulDiv(68, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := 'Cancelar';
        ModalResult := idCancel;
        Cancel := True;
        SetBounds(MulDiv(122, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      if ShowModal = idOK then
      begin
        Value := Edit.Text;
        Result := True;
      end;
    finally
      Form.Free;
    end;
end;

function InputDate(const ACaption, APrompt: string; var Value: TDateTime): Boolean;
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TCMDateTimePicker;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
  Result := False;
  Form := TForm.Create(Application);
  with Form do
    try
      Font.Style := [fsBold];
      Canvas.Font := Font;
      DialogUnits := GetAveCharSize(Canvas);
      BorderStyle := bsDialog;
      Caption := ACaption;
      ClientWidth := MulDiv(180, DialogUnits.X, 4);
      ClientHeight := MulDiv(63, DialogUnits.Y, 8);
      Position := poScreenCenter;
      Prompt := TLabel.Create(Form);
      with Prompt do
      begin
        Parent := Form;

        AutoSize := False;
        Left := 0;
        width := Form.Width;        
        Top := MulDiv(8, DialogUnits.Y, 8);
        Caption := APrompt;
        Alignment := taCenter;
      end;
      Edit := TCMDateTimePicker.Create(Form);
      with Edit do
      begin
        Parent := Form;

        Left := 100;        
        Top := MulDiv(19, DialogUnits.Y, 8);
        Width := 120;
        Date := Value;
        SelectAll;
      end;
      ButtonTop := MulDiv(41, DialogUnits.Y, 8);
      ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := 'Ok';
        ModalResult := mrOk;
        Default := True;
        SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := 'Cancelar';
        ModalResult := mrCancel;
        Cancel := True;
        SetBounds(MulDiv(92, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      if ShowModal = mrOk then
      begin
        Value := Edit.Date;
        Result := True;
      end;
    finally
      Form.Free;
    end;
End;

function InputValue(const ACaption, APrompt: string; var Value: Double): Boolean;
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TRealEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
  Result := False;
  Form := TForm.Create(Application);
  with Form do
    try
      Font.Style := [fsBold];
      Canvas.Font := Font;
      DialogUnits := GetAveCharSize(Canvas);
      BorderStyle := bsDialog;
      Caption := ACaption;
      ClientWidth := MulDiv(180, DialogUnits.X, 4);
      ClientHeight := MulDiv(63, DialogUnits.Y, 8);
      Position := poScreenCenter;
      Prompt := TLabel.Create(Form);
      with Prompt do
      begin
        Parent := Form;
        AutoSize := True;
        Left := MulDiv(8, DialogUnits.X, 4);
        Top := MulDiv(8, DialogUnits.Y, 8);
        Caption := APrompt;
      end;
      Edit := TRealEdit.Create(Form);
      with Edit do
      begin
        Signal := True;
        Parent := Form;
        Left := Prompt.Left;
        Top := MulDiv(19, DialogUnits.Y, 8);
        Width := MulDiv(161, DialogUnits.X, 4);
        SelectAll;
      end;
      Edit.Value := Value;
      
      ButtonTop := MulDiv(41, DialogUnits.Y, 8);
      ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := 'Ok';
        ModalResult := mrOk;
        Default := True;
        SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := 'Cancelar';
        ModalResult := mrCancel;
        Cancel := True;
        SetBounds(MulDiv(92, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      if ShowModal = mrOk then
      begin
        Value := Edit.Value;
        Result := True;
      end;
    finally
      Form.Free;
    end;
End;

function InputValue(const ACaption, APrompt: string; var Value: Integer): Boolean;
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TRealEdit;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
begin
  Result := False;
  Form := TForm.Create(Application);
  with Form do
    try
      Font.Style := [fsBold];
      Canvas.Font := Font;
      DialogUnits := GetAveCharSize(Canvas);
      BorderStyle := bsDialog;
      Caption := ACaption;
      ClientWidth := MulDiv(180, DialogUnits.X, 4);
      ClientHeight := MulDiv(63, DialogUnits.Y, 8);
      Position := poScreenCenter;
      Prompt := TLabel.Create(Form);
      with Prompt do
      begin
        Parent := Form;
        AutoSize := True;
        Left := MulDiv(8, DialogUnits.X, 4);
        Top := MulDiv(8, DialogUnits.Y, 8);
        Caption := APrompt;
      end;
      Edit := TRealEdit.Create(Form);
      with Edit do
      begin
        Signal := True;
        DecDigits := 0;
        NumberFormat := iNumber;
        Parent := Form;
        Left := Prompt.Left;
        Top := MulDiv(19, DialogUnits.Y, 8);
        Width := MulDiv(161, DialogUnits.X, 4);
        SelectAll;
      end;
      Edit.Value := Value;
      
      ButtonTop := MulDiv(41, DialogUnits.Y, 8);
      ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := 'Ok';
        ModalResult := mrOk;
        Default := True;
        SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := 'Cancelar';
        ModalResult := mrCancel;
        Cancel := True;
        SetBounds(MulDiv(92, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      if ShowModal = mrOk then
      begin
        Value := Trunc(Edit.Value);
        Result := True;
      end;
    finally
      Form.Free;
    end;
End;

function MsgDlg(const Msg: String; const Caption: String; AType: TMsgDlgType;
                Buttons: TMsgDlgButtons; HelpCtx: Longint): TModalResult;

   function CreateMsgDlg(const Msg: String; const Caption: String; AType: TMsgDlgType;
                      Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer): TForm;
   var ControlCtr : integer;
   begin
     Result := CreateMessageDialog(Msg, TMsgDlgType(AType), TMsgDlgButtons(Buttons));

     if Trim(Caption) <> '' then
     begin
       TForm(Result).Caption := Caption;
     end;

     {Ajusta a posição do dialogo.}
     if X > -1 then
     begin
       Result.Left := X;
     end;

     if Y > -1 then
     begin
       Result.Top := Y;
     end;

     {Seta o help context e ajusta a escala de video correta .}
     Result.HelpContext := HelpCtx;
     Result.ScaleBy(Screen.PixelsPerInch, 96);

     for ControlCtr := 0 to (Result.ControlCount - 1) do
     begin
       if (Result.Controls[ControlCtr] is TButton) then
       begin
         with TButton(Result.Controls[ControlCtr]) do
            if Name = 'Yes'
            then Caption := '&Sim'
            else if Name = 'No'
            then Caption := '&Não'
            else if Name = 'Ok'
            then Caption := '&Ok'
            else if Name = 'Cancel'
            then Caption := '&Cancelar'
            else if Name = 'Abort'
            then Caption := '&Abortar'
            else if Name = 'Retry'
            then Caption := '&Repetir'
            else if Name = 'Ignore'
            then Caption := '&Ignorar'
            else if Name = 'All'
            then Caption := '&Todos'
            else if Name = 'Help'
            then Caption := 'Aj&uda'

            else if Name = 'YesToAll'
            then Caption := 'Sim p/T&odos'  // se colocar sim para todos estoura o tamanho do botão
            else if Name = 'NoToAll'
            then Caption := 'Não p/To&dos'; // se colocar nãom para todos estoura o tamanho do botão
            
       end;
     end;
   end;

   function MsgDlgPos(const Msg: String; const Caption: String; AType: TMsgDlgType;
                      Buttons: TMsgDlgButtons; HelpCtx: Longint; X, Y: Integer): TModalResult;
   var
     Dlg    : TForm;  {Handle do dialogbox.}
   begin
     {Cria e mostra o dialog, retorna o modalresult.}
     Dlg := CreateMsgDlg(Msg, Caption, AType, Buttons, HelpCtx, X, Y);
     try
        dlg.Cursor := crDefault;
        Dlg.FormStyle := fsStayOnTop;
        Result := Dlg.ShowModal;
     {Garante a liberação de memória do dialogo.}
     finally
       Dlg.Free;
     end;
   end;

begin
  {Chama MsgDlgPos com a posição default.}
  Application.ProcessMessages;  
  Result := MsgDlgPos(Msg, Caption, AType, Buttons, HelpCtx, -1, -1);
end;

Procedure MsgAviso(s:string;T:String);
begin
   Application.MessageBox(PChar(s),PChar(T),mb_IconInformation);
end;


end.
