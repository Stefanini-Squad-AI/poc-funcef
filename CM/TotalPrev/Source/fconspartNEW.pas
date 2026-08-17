unit fconspartNEW;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fcOutlookList, fcButton, fcImgBtn, fcShapeBtn, ExtCtrls, fcClearPanel,
  fcButtonGroup, fcOutlookBar, dConsPart, Grids, Wwdbigrd, Wwdbgrid,
  StdCtrls, Mask, wwdbedit, MAHlpBtn, Buttons, TB97Tlbr, TB97, Db,
  DBTables, Wwquery, MontaSelect;

type
  TFconspartNew = class(TForm)
    fcOutlookBar1: TfcOutlookBar;
    fcOutlookBar1OutlookList1: TfcOutlookList;
    fcOutlookBar1fcShapeBtn1: TfcShapeBtn;
    fcOutlookBar1OutlookList2: TfcOutlookList;
    fcOutlookBar1fcShapeBtn2: TfcShapeBtn;
    DadosPessoais: TNotebook;
    ScrollBox1: TScrollBox;
    lblNomePai: TLabel;
    lblNomeMae: TLabel;
    lblsexo: TLabel;
    lbldataFalecimento: TLabel;
    lbldataNascimento: TLabel;
    lblEstadoCivil: TLabel;
    lblEMail: TLabel;
    Label63: TLabel;
    dbednomepai: TwwDBEdit;
    dbednomemae: TwwDBEdit;
    dbeddatafalecimento: TwwDBEdit;
    dbeddatanasc: TwwDBEdit;
    dbedSexo: TwwDBEdit;
    dbedEstadoCivil: TwwDBEdit;
    dbedEMail: TwwDBEdit;
    wwwEdtCPF: TwwDBEdit;
    dbgriddepen: TwwDBGrid;
    pnlDependentes: TPanel;
    pnlEnderecos: TPanel;
    dbgridenderecos: TwwDBGrid;
    Dock971: TDock97;
    lblBloqueio: TLabel;
    tb97Fundo: TToolbar97;
    sep1: TToolbarSep97;
    sep3: TToolbarSep97;
    bbtnSair: TBitBtn;
    bbtnAjuda: TmaHelpBitBtn;
    bbtnProcurar: TBitBtn;
    MSConsPart: TMontaSelect;
    qryAux: TwwQuery;
    procedure DadosPessoaisEnter(Sender: TObject);
    procedure fcOutlookBar1OutlookList1Items0Click(
      OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FconspartNew: TFconspartNew;

implementation

{$R *.DFM}

procedure TFconspartNew.DadosPessoaisEnter(Sender: TObject);
begin
  with DtmConsPart do
  begin
    if not qryPartGeral.Active then
      qryPartGeral.Open;
  end;
end;

procedure TFconspartNew.fcOutlookBar1OutlookList1Items0Click(
  OutlookList: TfcCustomOutlookList; Item: TfcOutlookListItem);
begin
  DadosPessoaisEnter(Sender);
end;

end.
