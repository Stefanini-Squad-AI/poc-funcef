 unit mParticipante;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   StdCtrls, Buttons;

type
   TmolParticipante = class(TFrame)
      btnBuscaPart: TBitBtn;
      btnLimpaPart: TBitBtn;
    edtMatricula: TEdit;
    edtInscricao: TEdit;
    edtNome: TEdit;
      Label5: TLabel;
      Label1: TLabel;
      Label2: TLabel;

      procedure btnBuscaPartClick(Sender: TObject);
      procedure btnLimpaPartClick(Sender: TObject);


   private { Private declarations }

   public { Public declarations }

      iParticipante : Int64;

   end;



implementation
{$R *.DFM}
uses
   dMS;



procedure TmolParticipante.btnBuscaPartClick(Sender: TObject);
begin
   dtmMS.MS_Titular.Executar;

   Repaint;

   if dtmMS.MS_Titular.RetornouValor then begin

      iParticipante     := StrToInt(dtmMS.MS_Titular.ValoresChave[0]);

      edtMatricula.Text := dtmMS.MS_Titular.ValoresChave[5];
      edtInscricao.Text := dtmMS.MS_Titular.ValoresChave[4];
      edtNome.Text      := dtmMS.MS_Titular.ValoresChave[3];
   end;

   if btnBuscaPart.CanFocus then btnBuscaPart.SetFocus;
end;



procedure TmolParticipante.btnLimpaPartClick(Sender: TObject);
begin
   iParticipante := -1;

   edtMatricula.Clear;
   edtInscricao.Clear;
   edtNome.Clear;
end;



end.
