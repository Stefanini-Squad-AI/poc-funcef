unit mLocalizacao;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolLocalizacao = class(TFrame)
    label1: TLabel;
    edtLocalizacao: TEdit;
    btnBuscaLocalizacao: TBitBtn;
    btnLimpaLocalizacao: TBitBtn;
    procedure btnLimpaLocalizacaoClick(Sender: TObject);
    procedure btnBuscaLocalizacaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iLocalizacao, iPessoaLoc, iResponsavel: integer;
    sCodCentroCusto: string;
  end;

implementation

{$R *.DFM}

uses dMS;

procedure TmolLocalizacao.btnLimpaLocalizacaoClick(Sender: TObject);
begin
   iLocalizacao := -1;
   iPessoaLoc   := -1;
   edtLocalizacao.Clear;
   iResponsavel := -1;
   sCodCentroCusto := '';
end;

procedure TmolLocalizacao.btnBuscaLocalizacaoClick(Sender: TObject);
begin
   dtmMS.MS_Localizacao.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Localizacao.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iLocalizacao         := StrToInt(dtmMS.MS_Localizacao.ValoresChave[0]);
      iPessoaLoc           := StrToInt(dtmMS.MS_Localizacao.ValoresChave[1]);
      edtLocalizacao.Text  := dtmMS.MS_Localizacao.ValoresChave[2];
      iResponsavel         := StrToInt(dtmMS.MS_Localizacao.ValoresChave[4]);
      sCodCentroCusto      := dtmMS.MS_Localizacao.ValoresChave[5];

      Screen.Cursor := crDefault;
   end;

   btnBuscaLocalizacao.SetFocus;
end;

end.
