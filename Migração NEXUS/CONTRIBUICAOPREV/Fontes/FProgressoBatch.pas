unit FProgressoBatch;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TfrmProgressoBatch = class(TForm)
    lblMsg1: TLabel;
    lblMsg2: TLabel;
    imgAguarde1: TImage;
    timeProcessando: TTimer;
    imgAguarde2: TImage;
    procedure timeProcessandoTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Mostra(msg1,msg2:string);
    procedure Apaga;
  end;

var
  frmProgressoBatch: TfrmProgressoBatch;

implementation

{$R *.DFM}

procedure TfrmProgressoBatch.Mostra(msg1,msg2:string);
begin
     timeProcessando.Enabled := True;
     Screen.Cursor := crHourGlass;
     Visible := true;
     if msg1 = ''
     then lblMsg1.Caption := 'Aguarde'
     else lblMsg1.caption := msg1;

     lblMsg2.caption := msg2;

     Invalidate;
     imgAguarde1.Repaint;
     imgAguarde1.Visible := True;
     imgAguarde2.Repaint;
     imgAguarde2.Visible := False;
     lblMsg1.Repaint;
     lblMsg2.Repaint;
end;

procedure TfrmProgressoBatch.Apaga;
begin
     Visible := false;
     Screen.Cursor := crDefault;
     timeProcessando.Enabled := False;
end;

procedure TfrmProgressoBatch.timeProcessandoTimer(Sender: TObject);
begin
   if imgAguarde1.Visible
   then begin
      imgAguarde1.Visible := False;
      imgAguarde2.Visible := True;
   end
   else begin
      imgAguarde1.Visible := True;
      imgAguarde2.Visible := False;
   end;
end;



end.