unit FOkCancelar;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FTelaAut, ExtCtrls, MAHlpBtn, StdCtrls, Buttons, ComCtrls,
   ToolWin, FSairAjuda, TB97, uMensErro, TB97Tlbr, IvDictio, IvMulti,
   IvEMulti, ZipDir, Gauges, fcLabel;

type
   TfrmOkCancelar = class(TfrmSairAjuda)
      TB97oKCancelar: TToolbar97;
      bbtnConfirmar: TBitBtn;
      bbtnCancelar: TBitBtn;
      ToolbarSep973: TToolbarSep97;
      ToolbarSep974: TToolbarSep97;
      ToolbarSep975: TToolbarSep97;

      procedure FormResize(Sender: TObject);


   private  // Private declarations


   public   // Public declarations

      procedure DrawFundo; override;


   end;



var
  frmOkCancelar: TfrmOkCancelar;



implementation
{$R *.DFM}



procedure TfrmOkCancelar.DrawFundo;
begin
   inherited;
   if tb97OkCancelar <> nil then tb97OkCancelar.DockPos := Width - tb97Fundo.Width - 10;
end;



procedure TfrmOkCancelar.FormResize(Sender: TObject);
begin
   inherited;
   DrawFundo;
end;



end.
