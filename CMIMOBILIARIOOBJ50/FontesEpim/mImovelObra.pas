unit mImovelObra;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TmolImovelObra = class(TFrame)
    Label5: TLabel;
    edtImovel: TEdit;
    btnBuscaImovel: TBitBtn;
    btnLimpaImovel: TBitBtn;
    procedure btnBuscaImovelClick(Sender: TObject; const iStatusObra:Integer);
    procedure btnLimpaImovelClick(Sender: TObject);
  private
    procedure ImovelExtenso;
    { Private declarations }
  public
    { Public declarations }
    iImovel,iMestre,iObra,iGrupo,iTipoCusto : int64;
    sImovel,sMestre          : string;
    sImovelExtenso,sDescObra : string;
  end;

implementation

uses dMS;

{$R *.DFM}

procedure TmolImovelObra.btnBuscaImovelClick(Sender: TObject; const iStatusObra:Integer);
var sFiltro : String;
begin
   // iStatusObra - 0 - Exibe todas as obras
   //               1 - Exibe somente as obras em aberto
   //               2 - Exibe somente as obras encerradas

   sFiltro := dtmMs.MS_ImovelObra.Filtro.Text;
   case iStatusObra of
      1 : dtmMs.MS_ImovelObra.Filtro.Add('O.DTAENCERRAOBRA IS NULL ');
      2 : dtmMs.MS_ImovelObra.Filtro.Add('O.DTAENCERRAOBRA IS NOT NULL ');
   end;

   dtmMS.MS_ImovelObra.Executar;
   Repaint;

   // se houve busca, abre a query com apenas o registro buscado
   if dtmMS.MS_ImovelObra.RetornouValor then begin

      iMestre     := StrToInt(dtmMS.MS_ImovelObra.ValoresChave[0]);
      iImovel     := StrToInt(dtmMS.MS_ImovelObra.ValoresChave[1]);
      sMestre     := dtmMS.MS_ImovelObra.ValoresChave[2];
      sImovel     := dtmMS.MS_ImovelObra.ValoresChave[3];
      iObra       := StrToInt(dtmMS.MS_ImovelObra.ValoresChave[4]);
      sDescObra   := dtmMS.MS_ImovelObra.ValoresChave[5];

      if dtmMS.MS_ImovelObra.ValoresChave[7] <> '' then
           iTipoCusto := StrToInt(dtmMS.MS_ImovelObra.ValoresChave[7])
      else iTipoCusto := -1;

      if dtmMS.MS_ImovelObra.ValoresChave[6] <> '' then
           iGrupo := StrToInt(dtmMS.MS_ImovelObra.ValoresChave[6])
      else iGrupo := -1;

      // define e preenche o nome do Imóvel
      ImovelExtenso;
   end;
   dtmMs.MS_ImovelObra.Filtro.Text := sFiltro;
   btnBuscaImovel.SetFocus;
end;

// define e preenche o nome do Imóvel
procedure TmolImovelObra.ImovelExtenso;
begin
   sImovelExtenso := '';
   if ( (sMestre <> '') and (sImovel <> '') ) then sImovelExtenso := sMestre + ' - ' + sImovel;

   edtImovel.Clear;
   if sImovelExtenso <> '' then edtImovel.Text := sImovelExtenso;
end;



procedure TmolImovelObra.btnLimpaImovelClick(Sender: TObject);
begin
   iImovel     := -1;
   iMestre     := -1;
   iObra       := -1;
   iGrupo      := -1;
   iTipoCusto  := -1;
   sImovel     := '';
   sMestre     := '';
   sDescObra   := '';

   // define e preenche o nome do Imóvel
   ImovelExtenso;
end;

end.
