unit mOrcamento;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TREdit, Buttons;

type
  TmolOrcamento = class(TFrame)
    edtCompOrc: TDBRealEdit;
    Label17: TLabel;
    btnBuscaCompromisso: TBitBtn;
    procedure btnBuscaOrcamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iNumCompromisso : Integer;
    iIdCompromisso  : Integer;

    procedure Clear;
  end;

implementation

{$R *.DFM}

uses dMS;

procedure TmolOrcamento.Clear;
begin
   iNumCompromisso :=  0;
   iIdCompromisso  := -1;
   edtCompOrc.Clear;
   edtCompOrc.Value := 0;
end;

procedure TmolOrcamento.btnBuscaOrcamentoClick(Sender: TObject);
begin
   dtmMS.MS_CompOrcamto.Executar;
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_CompOrcamto.RetornouValor then begin
      iIdCompromisso   := StrToInt(dtmMS.MS_CompOrcamto.ValoresChave[0]);
      iNumCompromisso  := StrToInt(dtmMS.MS_CompOrcamto.ValoresChave[1]);
      edtCompOrc.Value := iNumCompromisso;
   end;

   btnBuscaCompromisso.SetFocus;
end;

end.
