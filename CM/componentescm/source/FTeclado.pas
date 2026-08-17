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
unit FTeclado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

Const
   Vogais = 'aeioucAEIOUC';
   VetAcento: array[1..52,1..3]of String =
  ((#39,'a','á'),(#39,'e','é'),(#39,'i','í'),(#39,'o','ó'),(#39,'u','ú'),
  (#96,'a','à'),(#96,'e','è'),(#96,'i','ì'),(#96,'o','ò'),(#96,'u','ù'),
  (#126,'a','ã'),(#126,'e',#39+'e'),(#126,'i',#39+'i'),(#126,'o','õ'),(#126,'u',#39+'u'),
  (#94,'a','â'),(#94,'e','ê'),(#94,'i','î'),(#94,'o','ô'),(#94,'u','û'),
  (#34,'a','ä'),(#34,'e','ë'),(#34,'i','ï'),(#34,'o','ö'),(#34,'u','ü'),
  (#39,'A','Á'),(#39,'E','É'),(#39,'I','Í'),(#39,'O','Ó'),(#39,'U','Ú'),
  (#96,'A','À'),(#96,'E','È'),(#96,'I','Ì'),(#96,'O','Ò'),(#96,'U','Ù'),
  (#126,'A','Ã'),(#126,'E',#126+'E'),(#126,'I',#126+'I'),(#126,'O','Õ'),(#126,'U',#126+'U'),
  (#94,'A','Â'),(#94,'E','Ê'),(#94,'I','Î'),(#94,'O','Ô'),(#94,'U','Û'),
  (#34,'A','Ä'),(#34,'E','Ë'),(#34,'I','Ï'),(#34,'O','Ö'),(#34,'U','Ü'),
  (#39,'c','ç'),(#39,'C','Ç'));
  
type
  TfrmTeclado = class(TForm)
    pnlEntrada: TPanel;
    edValor: TEdit;
    pnlBotoes: TPanel;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button15: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button32: TButton;
    Button33: TButton;
    Button34: TButton;
    Button35: TButton;
    Button36: TButton;
    Button37: TButton;
    Button38: TButton;
    Button39: TButton;
    Button40: TButton;
    Button41: TButton;
    Button42: TButton;
    Button43: TButton;
    Button44: TButton;
    Button45: TButton;
    Button48: TButton;
    Button49: TButton;
    Button50: TButton;
    Button51: TButton;
    Button52: TButton;
    Button53: TButton;
    Button54: TButton;
    Button55: TButton;
    Button56: TButton;
    Button57: TButton;
    Button58: TButton;
    Button16: TButton;
    Button29: TButton;
    Button30: TButton;
    Button46: TButton;
    Button47: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    spdCaps: TSpeedButton;
    spdShift: TSpeedButton;
    spdRShift: TSpeedButton;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button32Click(Sender: TObject);
    procedure Button45Click(Sender: TObject);
    procedure Button46Click(Sender: TObject);
    procedure Button30Click(Sender: TObject);
    procedure Button47Click(Sender: TObject);
    procedure Button29Click(Sender: TObject);
    procedure spdCapsClick(Sender: TObject);
    procedure spdShiftClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Acento: Char;
    procedure TrocaCaption;
    function TrataCharEsp(sAnt,sDep:Char):String;
  public
    { Public declarations }
  end;


var
  frmTeclado: TfrmTeclado;
  Resultado: String;

function Teclado(AOwner: TComponent;var Saida: String): boolean;

implementation

Uses uTeclado;

{$R *.DFM}

function Teclado(AOwner: TComponent;var Saida: String): boolean;
begin
  If (AOwner Is TTeclado) Then
  Begin
    frmTeclado := TfrmTeclado.Create(TTeclado(AOwner).Owner);
    frmTeclado.Caption := TTeclado(AOwner).Caption;
    frmTeclado.edValor.PasswordChar := TTeclado(AOwner).PassWordChar;

    If Assigned(TTeclado(AOwner).EditControl) Then
       frmTeclado.edValor.Text := TTeclado(AOwner).EditControl.Text;
  End
  Else
    frmTeclado := TfrmTeclado.Create(AOwner);

  if frmTeclado.ShowModal = mrOk then
  begin
    result := True;
    Saida := resultado
  end
  else
    begin
      Saida := '';
      result := false;
    end;
end;
procedure TfrmTeclado.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  resultado := edValor.Text;
  Action := cafree;
end;

procedure TfrmTeclado.Button32Click(Sender: TObject);
var s: String;
    i,SelLength: Byte;
    c: String;
begin
 SelLength := edValor.SelLength;
 if TButton(Sender).Tag = 1 then
 begin
   if Acento <> '' then
   begin
     c := Acento;
     Acento := #0;
   end
   else c := ' ';
 end
 else
   begin
     c := TButton(Sender).Caption;
     if (ord(c[1]) >= 65) and (ord(Char(c[1])) <= 90) and ((not spdCaps.Down and not spdShift.Down)
     or (spdCaps.Down and spdShift.Down)) then
        c := chr(ord(c[1])+32);
        if (Acento <> '') and (pos(c,Vogais) > 0) then
        begin
          c := TrataCharEsp(Acento,c[1]);
          Acento := #0;
        end
        else
          if (Acento <> '') then
          begin
            c := Acento + c;
            Acento := #0;
          end
          else
           Case ord(c[1]) of
             39,96,94,126,34:begin
                               Acento := c[1];
                               if spdShift.Down then
                                 TrocaCaption;
                               spdShift.Down := False;
                               spdShift.GroupIndex := 0;
                               spdRShift.Down := False;
                               spdRShift.GroupIndex := 0;
                               exit;
                             end;
             end;
   end;
 if spdShift.Down then
   TrocaCaption;
 spdShift.Down := False;
 spdShift.GroupIndex := 0;
 spdRShift.Down := False;
 spdRShift.GroupIndex := 0;
 s := edValor.Text;
 i := edValor.SelStart;
 if SelLength > 0 then
 Delete(s,i+1,SelLength);

 if i = 0 then
   s := c+s
 else
   if i > length(s) then
     s := s + c
   else
     begin
       s := copy(s,1,i)+c+copy(s,i+1,length(s));
     end;
 edValor.SetFocus;
 edValor.Text := s;
 edValor.SelStart := i + 1;
end;

procedure TfrmTeclado.Button45Click(Sender: TObject);
var s: String;
    i,sellength: Byte;
begin
  Acento := #0;
  s := edValor.Text;
  i := edValor.SelStart;
  SelLength := edValor.SelLength;
  if SelLength = 0 then
    Delete(s,i,1)
  else Delete(s,i+1,SelLength);
  edValor.Text := s;
  edValor.SetFocus;
  if i = 0 then edValor.SelStart := 0
  else
  if SelLength > 0 then
    edValor.SelStart := i
  else edValor.SelStart := i - 1;
end;

procedure TfrmTeclado.Button46Click(Sender: TObject);
var i: byte;
begin
  i := edValor.SelStart;
  edValor.SetFocus;
  if i > 0 then
    edValor.SelStart := i - 1
  else edValor.SelStart := 0;
end;

procedure TfrmTeclado.Button30Click(Sender: TObject);
var i: byte;
begin
  i := edValor.SelStart;
  edValor.SetFocus;
  if i < Length(edValor.Text) then
    edValor.SelStart := i + 1
  else edValor.SelStart := Length(edValor.Text);
end;

procedure TfrmTeclado.Button47Click(Sender: TObject);
var SelStart: Byte;
begin
  SelStart := edValor.SelStart;
  edValor.SetFocus;
  edValor.SelStart := 0;
  if spdShift.Down then
  begin
    edValor.SelLength := SelStart;
    spdShiftClick(self);
  end;
end;

procedure TfrmTeclado.Button29Click(Sender: TObject);
var SelStart: Byte;
begin
  SelStart := edValor.SelStart;
  edValor.SetFocus;
  if spdShift.Down then
  begin
    edValor.SelStart := SelStart;
    edValor.SelLength := Length(edValor.Text)+1;
    spdShiftClick(self);
  end
  else edValor.SelStart := Length(edValor.Text)+1;

end;

procedure TfrmTeclado.spdCapsClick(Sender: TObject);
begin
   if spdCaps.GroupIndex > 0 then
     spdCaps.GroupIndex := 0
   else
     begin
       spdCaps.GroupIndex := 1;
       spdCaps.Down := True;
     end;
end;

procedure TfrmTeclado.spdShiftClick(Sender: TObject);
begin
   if (spdShift.GroupIndex > 0) and (spdRShift.GroupIndex > 0) then
   begin

     spdShift.GroupIndex := 0;
     spdRShift.GroupIndex := 0;
     spdShift.Down := False;
     spdRShift.Down := False;
   end
   else
     begin
       spdShift.GroupIndex := 2;
       spdRShift.GroupIndex := 3;
       spdRShift.Down := True;
       spdShift.Down := True;
     end;
   TrocaCaption;
end;

procedure TfrmTeclado.TrocaCaption;
var i: Byte;
    NovoTag: Integer;
    NovoCap: String;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if Components[i] is TButton then
      if TButton(Components[i]).Tag > 4 then
      begin
        NovoCap := Chr(TButton(Components[i]).Tag);
        NovoTag := ord(TButton(Components[i]).Caption[1]);
        if NovoCap = '&' then
          NovoCap := '&&';
        TButton(Components[i]).Caption := NovoCap;
        TButton(Components[i]).Tag := NovoTag;

      end;
  end;
end;

function TfrmTeclado.TrataCharEsp(sAnt,sDep:Char):String;
var lin: Byte;
    Achou: Boolean;
begin
  result := sDep;
  case ord(sAnt) of
   39,96,94,126,34:begin
                     if pos(sDep,Vogais) > 0 then
                     begin
                       lin := 1;
                       Achou := False;
                       while (lin <= 52) and not (Achou) do
                         if (VetAcento[lin,1] = sAnt) and (VetAcento[lin,2] = sDep) then
                         begin
                           result := VetAcento[lin,3];
                           Achou := True;
                         end
                         else inc(lin);
                     end;
                   end;
   end;
end;
procedure TfrmTeclado.BitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TfrmTeclado.BitBtn2Click(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmTeclado.Button2Click(Sender: TObject);
var s: String;
    i,sellength: Byte;
begin
  s := edValor.Text;
  i := edValor.SelStart;
  if i < Length(edValor.Text) then
  begin
    SelLength := edValor.SelLength;
    if SelLength = 0 then
      Delete(s,i+1,1)
    else Delete(s,i+1,SelLength);
    edValor.Text := s;
    edValor.SetFocus;
    if i = 0 then edValor.SelStart := 0
    else
    edValor.SelStart := i;
  end
  else
    begin
      edValor.SetFocus;
      edValor.SelStart := i;
    end;
end;

procedure TfrmTeclado.Button1Click(Sender: TObject);
begin
  edValor.SetFocus;
end;

end.
