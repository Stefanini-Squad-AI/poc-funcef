unit Nova_Tela;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, Wwdbigrd, Wwdbgrid, StdCtrls, Mask, wwdbedit, ExtCtrls, ComCtrls,
  TB97Ctls, TB97, TB97Tlwn;

type
  TForm1 = class(TForm)
    ToolWindow971: TToolWindow97;
    ToolbarButton971: TToolbarButton97;
    ToolbarButton972: TToolbarButton97;
    ToolbarButton973: TToolbarButton97;
    ToolbarButton974: TToolbarButton97;
    ToolbarButton975: TToolbarButton97;
    ToolbarButton976: TToolbarButton97;
    ToolbarButton977: TToolbarButton97;
    ToolbarButton978: TToolbarButton97;
    ToolbarButton979: TToolbarButton97;
    ToolbarButton9710: TToolbarButton97;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    ScrollBox1: TScrollBox;
    lblNomePai: TLabel;
    lblNomeMae: TLabel;
    lblsexo: TLabel;
    lbldataFalecimento: TLabel;
    lbldataNascimento: TLabel;
    lblEstadoCivil: TLabel;
    lblEMail: TLabel;
    dbednomepai: TwwDBEdit;
    dbednomemae: TwwDBEdit;
    dbeddatafalecimento: TwwDBEdit;
    dbeddatanasc: TwwDBEdit;
    dbedSexo: TwwDBEdit;
    dbedEstadoCivil: TwwDBEdit;
    dbedEMail: TwwDBEdit;
    Panel12: TPanel;
    dbgridenderecos: TwwDBGrid;
    pnlEnderecos: TPanel;
    Panel4: TPanel;
    dbgriddepen: TwwDBGrid;
    pnlDependentes: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

end.
