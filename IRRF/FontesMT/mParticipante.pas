unit mParticipante;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MontaSelect, StdCtrls, Buttons;

type
  TmolParticipante = class(TFrame)
    Label5: TLabel;
    edtMatricula: TEdit;
    edtInscricao: TEdit;
    Label2: TLabel;
    edtNome: TEdit;
    Label1: TLabel;
    btnBuscaPart: TBitBtn;
    btnLimpaPart: TBitBtn;
    MS_Titular: TMontaSelect;
    procedure btnBuscaPartClick(Sender: TObject);
    procedure btnLimpaPartClick(Sender: TObject);
  private
    { Private declarations }
  public
      iParticipante : Int64;
  end;

implementation

{$R *.DFM}



procedure TmolParticipante.btnBuscaPartClick(Sender: TObject);
begin
   MS_Titular.Executar;

   Repaint;

   if MS_Titular.RetornouValor then begin

      iParticipante     := StrToInt(MS_Titular.ValoresChave[0]);

      edtMatricula.Text := MS_Titular.ValoresChave[5];
      edtInscricao.Text := MS_Titular.ValoresChave[4];
      edtNome.Text      := MS_Titular.ValoresChave[3];
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
