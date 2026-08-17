unit mResponsavel;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolResponsavel = class(TFrame)
    Label1: TLabel;
    edtNomResponsavel: TEdit;
    btnBuscaResp: TBitBtn;
    btnLimpaResp: TBitBtn;
    procedure btnBuscaRespClick(Sender: TObject);
    procedure btnLimpaRespClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iResponsavel : Int64;
  end;

implementation

uses DmsFinanc;

{$R *.DFM}

procedure TmolResponsavel.btnBuscaRespClick(Sender: TObject);
begin
   dtmMS.MS_Responsavel.Executar;
   Repaint;
   if dtmMS.MS_Responsavel.RetornouValor then begin
      iResponsavel           := StrToInt(dtmMS.MS_Responsavel.ValoresChave[0]);
      edtNomResponsavel.Text := dtmMS.MS_Responsavel.ValoresChave[1];
   end;
   if btnBuscaResp.CanFocus then btnBuscaResp.SetFocus;

end;

procedure TmolResponsavel.btnLimpaRespClick(Sender: TObject);
begin
   iResponsavel := -1;
   edtNomResponsavel.Clear;
end;

end.
