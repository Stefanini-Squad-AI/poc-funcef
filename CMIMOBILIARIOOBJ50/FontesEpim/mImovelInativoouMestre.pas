unit mImovelInativoouMestre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolImovelInativoouMestre = class(TFrame)
    Label5: TLabel;
    edtImovel: TEdit;
    btnBuscaImovel: TBitBtn;
    btnLimpaImovel: TBitBtn;
    lblImovelouMestre: TLabel;
    procedure btnBuscaImovelClick(Sender: TObject);
    procedure btnLimpaImovelClick(Sender: TObject);

  private { Private declarations }

    procedure ImovelExtenso;
    procedure ImovelouMestre;

  public { Public declarations }

   iImovel, iMestre  : int64;
   sImovel, sMestre  : string;
   sImovelExtenso    : string;

  end;

implementation

{$R *.DFM}
uses
   dMS;

{ TmolImovelInativoouMestre }

procedure TmolImovelInativoouMestre.ImovelExtenso;
begin
   sImovelExtenso := '';

   if iMestre > 0 then begin
      sImovelExtenso := sMestre + ' - ' + sImovel;
   end else begin
      if iImovel > 0 then sImovelExtenso := sImovel;
   end;

   edtImovel.Clear;
   if sImovelExtenso <> '' then edtImovel.Text := sImovelExtenso;
end;

procedure TmolImovelInativoouMestre.ImovelouMestre;
begin
   lblImovelouMestre.Visible  := True;
   lblImovelouMestre.Caption  := '';

   if iMestre > 0 then begin
      lblImovelouMestre.Caption  := 'Imóvel';
   end else begin
      if iImovel > 0 then lblImovelouMestre.Caption  := 'Imóvel Mestre';
   end;
end;

procedure TmolImovelInativoouMestre.btnBuscaImovelClick(Sender: TObject);
begin
   dtmMS.MS_ImovelInativoouMestre.Executar;

   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_ImovelInativoouMestre.RetornouValor then begin

      // define se é um Imóvel ou Imóvel Mestre
      if dtmMS.MS_ImovelInativoouMestre.ValoresChave[1] <> '' then begin
         iMestre  := StrToInt(dtmMS.MS_ImovelInativoouMestre.ValoresChave[1]);
      end else begin
         iMestre  := -1;
      end;

      iImovel        := StrToInt(dtmMS.MS_ImovelInativoouMestre.ValoresChave[0]);
      sMestre        := dtmMS.MS_ImovelInativoouMestre.ValoresChave[2];
      sImovel        := dtmMS.MS_ImovelInativoouMestre.ValoresChave[3];

      // define e preenche o nome do Imóvel
      ImovelExtenso;

      // preenche o label que indica se é um Imóvel ou Imóvel Mestre
      ImovelouMestre;
   end;

   btnBuscaImovel.SetFocus;
end;

procedure TmolImovelInativoouMestre.btnLimpaImovelClick(Sender: TObject);
begin
   iImovel        := -1;
   iMestre        := -1;
   sImovel        := '';
   sMestre        := '';

   // define e preenche o nome do Imóvel
   ImovelExtenso;

   // preenche o label que indica se é um Imóvel ou Imóvel Mestre
   ImovelouMestre;
end;

end.
