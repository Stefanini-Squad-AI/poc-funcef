unit uDialogsCapCar;
//***************************************************************************************
//Rotina             : MsgOpLanctoCPRB
//N. SIG..........   : 23656.57673
//Data da Alteração: : 26/12/2017
//Alteração Form:    : uDialogsCapCar
//Responsável:       : Cássio Florêncio Rovaroto
//Descrição.......   : Criação de diálogo para tratamento do lançamento de alteradores de INSS.
//***************************************************************************************
//--------------------------------------------------------------------------------------------------
//Rotina.......: criação das funções 
//SOL..........: 222006-17039
//Kintana......: 712379
//Data.........: 13/04/2015     '
//Responsável..: Edilaine Ferraresi
//Descrição....: Criação do campo nosso numero na funcionalidade de lançamento de documentos e alteração
//               de dados bancários.
//--------------------------------------------------------------------------------------------------


interface

Uses Forms, stdCtrls, Windows, graphics, Dialogs, Controls, SysUtils,
     CMDateTimePicker, TREdit, Classes, TB97Tlbr, TB97Ctls, extctrls,
     Buttons;

type
   TRetornoOpNossoNumero = (trLanca, trNaoLanca, trApaga);
   TRetornoOpLanctoCPRB = (trLancaAlt, trNaoLancaAlt, trIgnoraLanca);

var
  IconIDs: array[TMsgDlgType] of PChar = (IDI_EXCLAMATION, IDI_HAND,
    IDI_ASTERISK, IDI_QUESTION, nil);


{Exibe opções para lançamento do Nosso Numero}
function MsgOperacaoNossoNumero(const ACaption, AMsg: string; lstImagens : TImageList; var Value: TRetornoOpNossoNumero): TModalResult;

{Emite um aviso personalizado}
function AvisoDlg(const ACaption, AMsg: string; AMsgAlignment : TAlignment): TModalResult;

{Cria uma mensagem personalizada}
function MsgDlg2(const Msg: String; const Caption: String; AType: TMsgDlgType; Buttons: TMsgDlgButtons; HelpCtx: Longint): TModalResult;

{Exibe Caixa de diálogo padrão de aviso}
Procedure MsgAviso(s:string;T:String);

//Cássio Rovaroto - SIG nº 23656.57673
{Exibe opções para lançamento de alteradores de INSS para a CPRB}
function MsgOpLanctoCPRB(const ACaption, AMsg: string; lstImagens: TImageList; var Value: TRetornoOpLanctoCPRB): TModalResult;


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


Procedure MsgAviso(s:string;T:String);
begin
   Application.MessageBox(PChar(s),PChar(T),mb_IconInformation);
end;


function MsgOperacaoNossoNumero(const ACaption, AMsg: string; lstImagens : TImageList; var Value: TRetornoOpNossoNumero): TModalResult;
const
  mcHorzMargin = 15;
  mcVertMargin = 15;
var
  Form: TForm;
  Prompt: TLabel;
  Icone : TImage;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
  IconID: PChar;
  HorzMargin, VertMargin : integer;
begin
  Form := TForm.Create(Application);
  with Form do
    try
      Font.Style   := [fsBold];
      Canvas.Font  := Font;
      DialogUnits  := GetAveCharSize(Canvas);
      BorderStyle  := bsDialog;
      Caption      := ACaption;
      ClientWidth  := MulDiv(250, DialogUnits.X, 4);
      ClientHeight := MulDiv(63, DialogUnits.Y, 8);
      Position := poScreenCenter;
      Prompt := TLabel.Create(Form);
      with Prompt do
      begin
        Parent    := Form;
        AutoSize  := false;
        Alignment := taCenter;
        Left      := MulDiv(8, DialogUnits.X, 4);
        Width     := Form.Width-(Left*2);
        Top       := MulDiv(8, DialogUnits.Y, 8);
        Caption   := AMsg;
      end;

      HorzMargin := MulDiv(mcHorzMargin, DialogUnits.X, 4);
      VertMargin := MulDiv(mcVertMargin, DialogUnits.Y, 8);
      IconID := IconIDs[mtConfirmation];
      if IconID <> nil then
         with TImage.Create(Form) do
         begin
           Name := 'Image';
           Parent := Form;
           Picture.Icon.Handle := LoadIcon(0, IconID);
           SetBounds(HorzMargin, VertMargin, 32, 32);
         end;

      ButtonTop := MulDiv(23, DialogUnits.Y, 8);
      ButtonWidth := MulDiv(54, DialogUnits.X, 4);
      ButtonHeight := MulDiv(17, DialogUnits.Y, 8);

      with TToolbarButton97.Create(Form) do
      //with TBitBtn.Create(Form) do
      begin
        Parent := Form;
        Caption := 'Lançar';
        ModalResult := mrOk;
        Default := True;
        Flat := false;
        Images := lstImagens;
        ImageIndex := 0;
        SetBounds(MulDiv(68, DialogUnits.X, 4), ButtonTop, ButtonWidth, ButtonHeight);
      end;
      with TToolbarButton97.Create(Form) do
      //with TBitBtn.Create(Form) do
      begin
        Parent := Form;
        Caption := 'Não lançar';
        ModalResult := mrCancel;
        Cancel := True;
        Flat := false;
        Images := lstImagens;
        ImageIndex := 1;
        SetBounds(MulDiv(130, DialogUnits.X, 4), ButtonTop, ButtonWidth, ButtonHeight);
      end;
      with TToolbarButton97.Create(Form) do
      //with TBitBtn.Create(Form) do
      begin
        Parent := Form;
        Caption := 'Apagar Nosso Número e lançar';
        ModalResult := mrIgnore;
        Default := True;
        Flat := false;
        Images := lstImagens;
        ImageIndex := 2;
        SetBounds(MulDiv(60, DialogUnits.X, 4), ButtonTop+30, ButtonWidth+132, ButtonHeight);
      end;
      Result := ShowModal;

      if Result = mrOk then
         Value := trLanca 
      else if Result = mrCancel then
         Value := trNaoLanca
      else
         Value := trApaga;

    finally
      Form.Free;
    end;
End;


function AvisoDlg(const ACaption, AMsg: string; AMsgAlignment : TAlignment): TModalResult;
const
  mcHorzMargin = 15;
  mcVertMargin = 15;
var
  Form: TForm;
  Prompt: TLabel;
  Icone : TImage;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight, ButtonLeft: Integer;
  IconID: PChar;
  HorzMargin, VertMargin : integer;
begin
  Form := TForm.Create(Application);
  with Form do
    try
      Font.Style   := [fsBold];
      Canvas.Font  := Font;
      DialogUnits  := GetAveCharSize(Canvas);
      BorderStyle  := bsDialog;
      Caption      := ACaption;
      ClientWidth  := MulDiv(250, DialogUnits.X, 4);
      ClientHeight := MulDiv(63, DialogUnits.Y, 8);
      Position := poScreenCenter;
      Prompt := TLabel.Create(Form);
      with Prompt do
      begin
        Parent    := Form;
        AutoSize  := false;
        WordWrap  := true;
        Alignment := AMsgAlignment;
        Left      := MulDiv(8, DialogUnits.X, 4);
        Width     := Form.Width-(Left*2);
        Top       := MulDiv(8, DialogUnits.Y, 8);
        Height    := Form.Height-(Top*2);
        Caption   := AMsg;
      end;

      HorzMargin := MulDiv(mcHorzMargin, DialogUnits.X, 4);
      VertMargin := MulDiv(mcVertMargin, DialogUnits.Y, 8);
      IconID := IconIDs[mtWarning];
      if IconID <> nil then
         with TImage.Create(Form) do
         begin
           Name := 'Image';
           Parent := Form;
           Picture.Icon.Handle := LoadIcon(0, IconID);
           SetBounds(HorzMargin, VertMargin, 32, 32);
         end;

      ButtonTop := MulDiv(41, DialogUnits.Y, 8);
      ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(17, DialogUnits.Y, 8);
      ButtonLeft := (Form.Width - ButtonWidth) div 2;
      with TBitBtn.Create(Form) do
      begin
        Parent := Form;
        Caption := 'Ok';
        ModalResult := mrOk;
        Default := True;
        //SetBounds(MulDiv(ButtonLeft, DialogUnits.X, 4), ButtonTop, ButtonWidth, ButtonHeight);
        SetBounds(ButtonLeft, ButtonTop, ButtonWidth, ButtonHeight);
      end;

      Result := ShowModal;

    finally
      Form.Free;
    end;
End;


function MsgDlg2(const Msg: String; const Caption: String; AType: TMsgDlgType;
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


function MsgOpLanctoCPRB(const ACaption, AMsg: string; lstImagens: TImageList; var Value: TRetornoOpLanctoCPRB): TModalResult;
const
  mcHorzMargin = 15;
  mcVertMargin = 15;
var
  Form: TForm;
  Prompt: TLabel;
  Icone : TImage;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;
  IconID: PChar;
  HorzMargin, VertMargin : integer;
begin
  Form := TForm.Create(Application);
  with Form do
    try
      Font.Style   := [fsBold];
      Canvas.Font  := Font;
      DialogUnits  := GetAveCharSize(Canvas);
      BorderStyle  := bsDialog;
      Caption      := ACaption;
      ClientWidth  := MulDiv(250, DialogUnits.X, 4);
      ClientHeight := MulDiv(63, DialogUnits.Y, 8);
      Position := poScreenCenter;
      Prompt := TLabel.Create(Form);
      with Prompt do
      begin
        Parent    := Form;
        AutoSize  := false;
        Alignment := taCenter;
        Left      := MulDiv(8, DialogUnits.X, 4);
        Width     := Form.Width-(Left*2);
        Top       := MulDiv(8, DialogUnits.Y, 8);
        Caption   := AMsg;
      end;

      HorzMargin := MulDiv(mcHorzMargin, DialogUnits.X, 4);
      VertMargin := MulDiv(mcVertMargin, DialogUnits.Y, 8);
      IconID := IconIDs[mtConfirmation];
      if IconID <> nil then
         with TImage.Create(Form) do
         begin
           Name := 'Image';
           Parent := Form;
           Picture.Icon.Handle := LoadIcon(0, IconID);
           SetBounds(HorzMargin, VertMargin, 32, 32);
         end;

      ButtonTop := MulDiv(23, DialogUnits.Y, 8);
      ButtonWidth := MulDiv(54, DialogUnits.X, 4);
      ButtonHeight := MulDiv(17, DialogUnits.Y, 8);

      with TToolbarButton97.Create(Form) do
      //with TBitBtn.Create(Form) do
      begin
        Parent := Form;
        Caption := 'Lançar';
        ModalResult := mrOk;
        Default := True;
        Flat := false;
        Images := lstImagens;
        ImageIndex := 0;
        SetBounds(MulDiv(68, DialogUnits.X, 4), ButtonTop, ButtonWidth, ButtonHeight);
      end;
      with TToolbarButton97.Create(Form) do
      //with TBitBtn.Create(Form) do
      begin
        Parent := Form;
        Caption := 'Não lançar';
        ModalResult := mrCancel;
        Cancel := True;
        Flat := false;
        Images := lstImagens;
        ImageIndex := 1;
        SetBounds(MulDiv(130, DialogUnits.X, 4), ButtonTop, ButtonWidth, ButtonHeight);
      end;
      with TToolbarButton97.Create(Form) do
      //with TBitBtn.Create(Form) do
      begin
        Parent := Form;
        Caption := 'Lançamento realizado';
        ModalResult := mrIgnore;
        Default := True;
        Flat := false;
        Images := lstImagens;
        ImageIndex := 2;
        SetBounds(MulDiv(60, DialogUnits.X, 4), ButtonTop+30, ButtonWidth+132, ButtonHeight);
      end;
      Result := ShowModal;

      if Result = mrOk then
         Value := trLancaAlt
      else if Result = mrCancel then
         Value := trNaoLancaAlt
      else
         Value := trIgnoraLanca;
    finally
      Form.Free;
    end;
end;

end.
