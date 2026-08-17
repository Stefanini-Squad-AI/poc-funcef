{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Parâmetros do arquivo de remessa Folha Pag Real     }
{   BANCO REAL FOLHA DE PAGAMENTO                       }
{   IDMODELOSCNAB = 2/P                                 }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 27/06/2001                             }
{                                                       }
{*******************************************************}

unit FParamFolhaPagrealMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, FSairAjuda;

type
  TFrmParamFolhaPagrealMT = class(TForm)
    pnlFundo2: TPanel;
    RgCategoria: TRadioGroup;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    procedure bbtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParamFolhaPagrealMT: TFrmParamFolhaPagrealMT;

implementation

Uses uString, uIntBancoManager, uCMDialogs;

{$R *.DFM}

procedure TFrmParamFolhaPagrealMT.bbtnSairClick(Sender: TObject);
begin
   Close;
end;

procedure TFrmParamFolhaPagrealMT.FormCreate(Sender: TObject);
begin
  RgCategoria.ItemIndex := RgCategoria.Items.IndexOf(IntBancoManager.BuscaParamIntBanco('CATEGORIALANC','S'));
  If RgCategoria.ItemIndex = -1 Then  RgCategoria.ItemIndex := 0;
end;

procedure TFrmParamFolhaPagrealMT.bbtnConfirmarClick(Sender: TObject);
begin
  IntBancoManager.GravaParamIntBanco(['CATEGORIALANC'],[RgCategoria.Items[RgCategoria.ItemIndex]]);
  ModalResult:=mrOk;
end;

end.
