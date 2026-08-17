unit CRel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, wwdblook, ExtCtrls, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, Buttons, TB97Tlbr, MontaSelect, DB, Wwquery,
  DBTables, Mask, wwdbedit, Wwdbspin, Wwdatsrc, TB97Ctls, TB97,
  FOkCancelarImob;

type
   TcfgRel = class(TFrmOkCancelarImob)

      procedure bbtnConfirmarClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure FormShow(Sender: TObject);

   private     // Private declarations


   protected   // Protected Declarations

      procedure DesabilitaBotoes; virtual;
      procedure HabilitaBotoes; virtual;
      procedure MontaQuery; virtual;
      procedure FechaQueries; virtual;
      procedure Fecha; virtual;


   public      // Public declarations


   end;



var
  cfgRel: TcfgRel;



implementation
{$R *.DFM}



procedure TcfgRel.DesabilitaBotoes;
begin
   Screen.Cursor           := crHourGlass;

   pnlFundo.Enabled        := False;

   bbtnConfirmar.Enabled   := False;
   bbtnCancelar.Enabled    := False;
   bbtnSair.Enabled        := False;
end;



procedure TcfgRel.HabilitaBotoes;
begin
   bbtnConfirmar.Enabled   := True;
   bbtnCancelar.Enabled    := True;
   bbtnSair.Enabled        := True;

   pnlFundo.Enabled        := True;

   Screen.Cursor           := crDefault;
end;



procedure TcfgRel.MontaQuery;
begin
   // implementação nos filhos
end;



procedure TcfgRel.FechaQueries;
var
   i : integer;
begin
   i := 0;
   while i <= ComponentCount - 1 do begin
      if ( (TObject(Components[i]).ClassType = TwwQuery) and (TwwQuery(Components[i]).Active) ) then begin
         TwwQuery(Components[i]).Close;
      end;
      inc(i);
   end;
end;



procedure TcfgRel.Fecha;
begin
   ModalResult := mrOk;
end;



procedure TcfgRel.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   DesabilitaBotoes;
   try
      try
         MontaQuery;
         Fecha;
      except
         Screen.Cursor := crDefault;
         Raise;
         Repaint;
         HabilitaBotoes;
      end;
   finally
      HabilitaBotoes;
   end;
end;



procedure TcfgRel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FechaQueries;
   inherited;
end;



procedure TcfgRel.FormShow(Sender: TObject);
begin
   inherited;
   Screen.Cursor := crDefault;
end;



end.
