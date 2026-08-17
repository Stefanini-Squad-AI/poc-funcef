unit mPropostaNegocio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolPropostaNegocio = class(TFrame)
    Label5: TLabel;
    edtProposta: TEdit;
    btnBuscaProposta: TBitBtn;
    btnLimpaProposta: TBitBtn;

    procedure btnBuscaPropostaClick(Sender: TObject);
    procedure btnLimpaPropostaClick(Sender: TObject);


  private { Private declarations }

  public { Public declarations }
   iProposta      : int64;
   sNumero, sNome : string;

  end;



implementation
{$R *.DFM}
uses
   dMS;



procedure TmolPropostaNegocio.btnBuscaPropostaClick(Sender: TObject);
begin
   dtmMS.MS_Proposta.Executar;

   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Proposta.RetornouValor then begin

      iProposta  := StrToInt(dtmMS.MS_Proposta.ValoresChave[0]);
      sNumero    := dtmMS.MS_Proposta.ValoresChave[1];
      sNome      := dtmMS.MS_Proposta.ValoresChave[2];

      edtProposta.Text := sNumero + ' - ' + sNome;
   end;

   btnBuscaProposta.SetFocus;
end;



procedure TmolPropostaNegocio.btnLimpaPropostaClick(Sender: TObject);
begin
   iProposta := -1;
   sNumero   := '';
   sNome     := '';

   edtProposta.Clear;
end;


end.
