unit FAguarde;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls;

type
  TfrmAguarde = class(TForm)
    lblMensagem: TLabel;
    pbAguarde: TProgressBar;
    Animate1: TAnimate;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FMax, FMin, FPos : integer;
    procedure SetMax(iMax:integer);
    procedure SetMin(iMin:integer);
    procedure SetPos(iPos:integer);
  published
     Property Max : integer read FMax write SetMax;
     Property Min : integer read FMin write SetMin;
     Property Pos : integer read FPos write SetPos;
  public
    { Public declarations }
    procedure Mostra(msg:string);
    procedure Apaga;
  end;

var
  frmAguarde: TfrmAguarde;

implementation

{$R *.DFM}

procedure TfrmAguarde.Mostra(msg:string);
begin
     Screen.Cursor := crHourGlass;
     Visible := true;
     if msg='' then
        lblMensagem.caption := 'Aguarde'
     else
         lblMensagem.caption := msg;
     Invalidate;
     lblMensagem.Repaint;
end;

procedure TfrmAguarde.Apaga;
begin
     Visible := false;
     Screen.Cursor := crDefault;
end;

procedure TfrmAguarde.FormCreate(Sender: TObject);
begin
     Cursor := crHourGlass;

end;

procedure TfrmAguarde.SetMax(iMax:integer);
begin
     if iMax <= 0 then
     begin
          pbAguarde.Visible := false;
          FMax := 0;
     end
     else
     begin
          pbAguarde.Visible := true;
          FMax := iMax;
     end;
     pbAguarde.Max := FMax;
end;

procedure TfrmAguarde.SetMin(iMin:integer);
begin
     pbAguarde.Min := iMin;
     FMin := iMin;
end;

procedure TfrmAguarde.SetPos(iPos:integer);
begin
     if (iPos >= FMin) and (iPos <= FMax) then
     begin
          pbAguarde.Position := iPos;
          FPos := iPos;
     end;
     Application.ProcessMessages;
end;
procedure TfrmAguarde.FormShow(Sender: TObject);
begin
     Animate1.Active := true;
end;

procedure TfrmAguarde.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     Animate1.Active := false;

end;

end.
