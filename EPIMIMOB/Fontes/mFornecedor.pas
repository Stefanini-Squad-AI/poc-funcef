unit mFornecedor;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolFornecedor = class(TFrame)
    btnBuscaForn: TBitBtn;
    btnLimpaForn: TBitBtn;
    edtNomeFantasia: TEdit;
    Label5: TLabel;
    edtRazaoSocial: TEdit;

    procedure btnBuscaFornClick(Sender: TObject);
    procedure btnLimpaFornClick(Sender: TObject);

  private { Private declarations }
    
  public { Public declarations }
   iFornecedor : int64;

  end;



implementation
{$R *.DFM}
uses
   dMS;



procedure TmolFornecedor.btnBuscaFornClick(Sender: TObject);
begin
   dtmMS.MS_Forn.Executar;

   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Forn.RetornouValor then begin

      // Imóvel
      iFornecedor := StrToInt(dtmMS.MS_Forn.ValoresChave[0]);

      edtNomeFantasia.Text := dtmMS.MS_Forn.ValoresChave[1];
      edtRazaoSocial.Text  := dtmMS.MS_Forn.ValoresChave[2];
   end;

   if btnBuscaForn.CanFocus then btnBuscaForn.SetFocus;
end;



procedure TmolFornecedor.btnLimpaFornClick(Sender: TObject);
begin
   iFornecedor := -1;

   edtNomeFantasia.Clear;
   edtRazaoSocial.Clear;
end;



end.
