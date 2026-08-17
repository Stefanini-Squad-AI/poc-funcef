unit faMensagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, fcLabel;

type
  TfraMensagem = class(TFrame)
    pnlProgresso: TPanel;
    pnlProgressoMensagem: TPanel;
    pnlProgressoBarra: TPanel;
    pgbProcesso: TProgressBar;
    lblProgressoMensagem: TfcLabel;
  private
    { Private declarations }
    FMax, FMin, FPos : Integer;
    FMes: String;
    procedure SetMax(iMax:Integer);
    procedure SetMin(iMin:Integer);
    procedure SetPos(iPos:Integer);
    procedure SetMes(sMes:String);
  published
    Property Max : Integer read FMax write SetMax;
    Property Min : Integer read FMin write SetMin;
    Property Pos : Integer read FPos write SetPos;
    Property Mes : String  read FMes write SetMes;
  public
    { Public declarations }
    procedure Incrementa(iPasso: Integer = 1);
    procedure Mostra;
    procedure Apaga(bZera: Boolean = True);
  end;

implementation

{$R *.DFM}

{ TfraMensagem }

procedure TfraMensagem.Incrementa(iPasso: Integer);
begin
   Pos := Pos + 1;
   pgbProcesso.Invalidate;
   Application.ProcessMessages;
end;

procedure TfraMensagem.SetMax(iMax: integer);
begin
   if iMax <= 0 then
   begin
      pgbProcesso.Visible := false;
      FMax := 0;
   end
   else
   begin
      pgbProcesso.Visible := true;
      FMax := iMax;
   end;
   pgbProcesso.Max := FMax;
end;

procedure TfraMensagem.SetMin(iMin: integer);
begin
   pgbProcesso.Min := iMin;
   FMin := iMin;
end;

procedure TfraMensagem.SetPos(iPos: integer);
begin
   if (iPos >= FMin) and (iPos <= FMax) then
   begin
      pgbProcesso.Position := iPos;
      FPos := iPos;
   end;
   pgbProcesso.Invalidate;
   Application.ProcessMessages;
end;

procedure TfraMensagem.SetMes(sMes: String);
begin
   lblProgressoMensagem.Caption := sMes;
   lblProgressoMensagem.Invalidate;
   Application.ProcessMessages;
   FMes := sMes;
end;

procedure TfraMensagem.Mostra;
begin
   Pos := 0;
   Max := 100;
   Mes := '';
   Visible := True;
end;

procedure TfraMensagem.Apaga(bZera: Boolean = True);
begin
   if bZera then
   begin
      Pos := 0;
      Max := 100;
      Mes := '';
   end;
   Visible := False;
end;

end.
