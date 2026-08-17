unit FOkCancelarImob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls;

type
  TFrmOkCancelarImob = class(TfrmOkCancelar)
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    ToolbarSep974: TToolbarSep97;


  protected { Protected declarations }
   bHabilitaOk : boolean;

   procedure DesabilitaBotoes; virtual;
   procedure HabilitaBotoes; virtual;

  private { Private declarations }

  public { Public declarations }

  end;



var
  FrmOkCancelarImob: TFrmOkCancelarImob;



implementation
{$R *.DFM}

procedure TfrmOkCancelarImob.DesabilitaBotoes;
begin
   Screen.Cursor  := crHourGlass;

   bHabilitaOk    := bbtnConfirmar.Enabled;

   bbtnConfirmar.Enabled   := False;
   bbtnCancelar.Enabled    := False;
   bbtnSair.Enabled        := False;
end;



procedure TfrmOkCancelarImob.HabilitaBotoes; 
begin
   bbtnConfirmar.Enabled   := bHabilitaOk;
   bbtnCancelar.Enabled    := False;
   bbtnSair.Enabled        := False;

   Screen.Cursor := crDefault;
end;



end.
