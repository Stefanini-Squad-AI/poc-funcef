unit mComprador;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolComprador = class(TFrame)
    edtRazaoSocial: TEdit;
    Label1: TLabel;
    btnBuscaForn: TBitBtn;
    btnLimpaForn: TBitBtn;
    procedure btnBuscaFornClick(Sender: TObject);
    procedure btnLimpaFornClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iComprador : Int64;
  end;

implementation

uses Dms;

{$R *.DFM}

procedure TmolComprador.btnBuscaFornClick(Sender: TObject);
begin
   dtmMS.MS_Locatario.Executar;
   Repaint;
   if dtmMS.MS_Locatario.RetornouValor then begin
      iComprador           := StrToInt(dtmMS.MS_Locatario.ValoresChave[0]);
      edtRazaoSocial.Text  := dtmMS.MS_Locatario.ValoresChave[2];
   end;
   if btnBuscaForn.CanFocus then btnBuscaForn.SetFocus;
end;

procedure TmolComprador.btnLimpaFornClick(Sender: TObject);
begin
   iComprador := -1;
   edtRazaoSocial.Clear;
end;

end.
