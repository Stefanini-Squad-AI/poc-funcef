unit mTipoOperacao;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolTipoOperacao = class(TFrame)
    Label5: TLabel;
    edtTipoOperacao: TEdit;
    btnBuscaTipoOper: TBitBtn;
    btnLimpaTipoOper: TBitBtn;
    procedure btnLimpaTipoOperClick(Sender: TObject);
    procedure btnBuscaTipoOperClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    iTipoOper  : int64;
    sNomeOper  : string;
    sTipoOper  : string;
  end;

implementation

uses dMS;

{$R *.DFM}



procedure TmolTipoOperacao.btnLimpaTipoOperClick(Sender: TObject);
begin
   iTipoOper  := -1;
   sNomeOper  := '';
   sTipoOper  := '';
   edtTipoOperacao.Clear;
end;



procedure TmolTipoOperacao.btnBuscaTipoOperClick(Sender: TObject);
begin
   dtmMS.MS_TipoOperacao.Executar;
   Repaint;
   // se houve busca, abre a query com o registro buscado
   if dtmMS.MS_TipoOperacao.RetornouValor then begin
      iTipoOper            := StrToInt(dtmMS.MS_TipoOperacao.ValoresChave[0]);
      sNomeOper            := dtmMS.MS_TipoOperacao.ValoresChave[1];
      sTipoOper            := dtmMS.MS_TipoOperacao.ValoresChave[2];
      edtTipoOperacao.Text := dtmMS.MS_TipoOperacao.ValoresChave[1];
   end;
   btnBuscaTipoOper.SetFocus;
end;

end.
