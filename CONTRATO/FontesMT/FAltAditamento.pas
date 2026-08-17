unit FAltAditamento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, wwdbedit, StdCtrls, wwdblook, MAHlpBtn, Buttons, TB97Tlbr, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, ImgList, TB97Ctls, TB97, Db, DBClient,
  uCMClientDataSet, CmEventosCadastro;

type
  TfrmAltAditamentoMT = class(TForm)
    Dock972: TDock97;
    lblStatus: TLabel;
    Toolbar971: TToolbar97;
    sbtnInserir: TToolbarButton97;
    sbtnAlterar: TToolbarButton97;
    sbtnProcurar: TToolbarButton97;
    sbtnApagar: TToolbarButton97;
    ImlPadrao: TImageList;
    Panel1: TPanel;
    Label5: TLabel;
    Label1: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dbgAltAditamento: TwwDBGrid;
    Dock971: TDock97;
    tb97Fundo: TToolbar97;
    sep1: TToolbarSep97;
    sep3: TToolbarSep97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    TB97oKCancelar: TToolbar97;
    ToolbarSep971: TToolbarSep97;
    bbtnConfirmar: TBitBtn;
    bbtnCancelar: TBitBtn;
    dblcContrato: TwwDBLookupCombo;
    dblcServicoProduto: TwwDBLookupCombo;
    dblcItem: TwwDBLookupCombo;
    dbeNumeroProcesso: TwwDBEdit;
    CmeCadastro: TCmEventosCadastro;
    cdsContratos: TCMClientDataSet;
    procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAltAditamentoMT: TfrmAltAditamentoMT;

implementation

{$R *.DFM}

procedure TfrmAltAditamentoMT.CmeCadastroFind(Sender: TObject);
begin
//   inherited;
//   if MontaSelect.RetornouValor then begin
//     SelecionaMestreDetalhe( StrToFloat(MontaSelect.ValoresChave[0]),
//                             StrToFloat(MontaSelect.ValoresChave[1]),
//                             StrToFloat(MontaSelect.ValoresChave[2]) );
//
//     lblStatus.Caption := MontaSelect.ValoresChave[3];
//     lblStatus.Visible := True;
//   end;
//
//   cdsContratos.Data      := CtrlContratos.ListContratos(0);
end;

end.
