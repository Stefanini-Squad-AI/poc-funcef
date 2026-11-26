{*******************************************************}
{                                                       }
{ CM Soluções Informática  - CMIntBanco50               }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Parâmetros do arquivo de remessa Unibanco           }
{   UNIBANCO CRÉDITO EM CONTA                           }
{   IDMODELOSCNAB = 6/P                                 }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 27/06/2001                             }
{                                                       }
{*******************************************************}

unit FParamUnibancoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, MAHlpBtn, Buttons, TB97Tlbr, TB97;

type
  TFrmParamUnibancoMT = class(TForm)
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    ToolbarSep972: TToolbarSep97;
    ToolbarSep973: TToolbarSep97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    pnlFundo: TPanel;
    RgTipoServ: TRadioGroup;
    RgCodSoli: TRadioGroup;
    RgOct: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParamUnibancoMT: TFrmParamUnibancoMT;

implementation

uses uIntBancoManager;

{$R *.DFM}

procedure TFrmParamUnibancoMT.FormCreate(Sender: TObject);
begin
  Case IntBancoManager.DtmIntBanco.SQLParamIntBanco.ParamByName('IDMODELOSCNAB').AsInteger of
    1:
    Begin
      RgTipoServ.Items.Clear;
      RgTipoServ.Columns := 3;
      RgTipoServ.Items.Add('2 - Clientes');
      RgTipoServ.Items.Add('3 - Terceiros');
      RgTipoServ.Items.Add('4 - Serviços');
    End;
    8: Height := 260;
    9: RgOct.Visible := True;
    10:
    Begin
      RgTipoServ.Items.Clear;
      RgTipoServ.Columns := 2;
      RgTipoServ.Items.Add('7 - Ordem de Pagamento');
      RgTipoServ.Items.Add('8 - Cheque Adm.');
    End;
  End;

  RgOct.ItemIndex      := RgOct.Items.IndexOf(IntBancoManager.BuscaParamIntBanco('CODTRANSACAOCVT','S'));
  RgCodSoli.ItemIndex  := RgCodSoli.Items.IndexOf(IntBancoManager.BuscaParamIntBanco('CODIGOSOLICITACAO','S'));
  RgTipoServ.ItemIndex := RgTipoServ.Items.IndexOf(IntBancoManager.BuscaParamIntBanco('CATEGLANC','S'));

  If RgOct.ItemIndex      = -1 Then RgOct.ItemIndex      := 0;
  If RgCodSoli.ItemIndex  = -1 Then RgCodSoli.ItemIndex  := 0;
  If RgTipoServ.ItemIndex = -1 Then RgTipoServ.ItemIndex := 0; 
end;

procedure TFrmParamUnibancoMT.bbtnConfirmarClick(Sender: TObject);
begin
  IntBancoManager.GravaParamIntBanco(['CODTRANSACAOCVT',
                                 'CODIGOSOLICITACAO',
                                 'CATEGLANC'],
                                 [RgOct.Items[RgOct.ItemIndex],
                                 RgCodSoli.Items[RgCodSoli.ItemIndex],
                                 RgTipoServ.Items[RgTipoServ.ItemIndex]]);
  ModalResult := MrOk;
end;

end.
