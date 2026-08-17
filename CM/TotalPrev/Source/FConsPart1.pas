unit FConsPart1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit,
  ComCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    GroupBox2: TGroupBox;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    pgDadosGerais: TPageControl;
    TbShtPes: TTabSheet;
    pnlParticipante: TPanel;
    scbDadosPessoaisParticip: TScrollBox;
    lblNomePai: TLabel;
    lblNomeMae: TLabel;
    lblsexo: TLabel;
    lbldataFalecimento: TLabel;
    lbldataNascimento: TLabel;
    lblEstadoCivil: TLabel;
    lblEMail: TLabel;
    Label62: TLabel;
    dbednomepai: TwwDBEdit;
    dbednomemae: TwwDBEdit;
    dbeddatafalecimento: TwwDBEdit;
    dbeddatanasc: TwwDBEdit;
    dbedSexo: TwwDBEdit;
    dbedEstadoCivil: TwwDBEdit;
    dbedEMail: TwwDBEdit;
    wwDBEdit15: TwwDBEdit;
    Panel12: TPanel;
    pnlEnderecos: TPanel;
    dbgridenderecos: TwwDBGrid;
    Panel4: TPanel;
    dbgriddepen: TwwDBGrid;
    pnlDependentes: TPanel;
    lblnome: TLabel;
    lblpatro: TLabel;
    tbContaCorrente: TTabSheet;
    dbgrContaBancaria: TwwDBGrid;
    pgDadosFuncionais: TPageControl;
    TabSheet1: TTabSheet;
    lblNomeFilial: TLabel;
    dbedFilial: TwwDBEdit;
    lblValor1: TLabel;
    dbeValor1: TwwDBEdit;
    dbeValor2: TwwDBEdit;
    lblValor2: TLabel;
    dbedsitfunc: TwwDBEdit;
    lblSitFunc: TLabel;
    dbedcargo: TwwDBEdit;
    lblNomeCargo: TLabel;
    Label1: TLabel;
    dbednivel: TwwDBEdit;
    lblDataAdmissao: TLabel;
    dbeddataadmissao: TwwDBEdit;
    lblValor3: TLabel;
    dbeValor3: TwwDBEdit;
    dbedsaltotal: TwwDBEdit;
    lblSalarioTotal: TLabel;
    Label59: TLabel;
    wwDBEdit12: TwwDBEdit;
    edTempoTotal: TEdit;
    wwDBEdit13: TwwDBEdit;
    Label60: TLabel;
    edTempoEspecial: TEdit;
    pnlHstFuncional: TPanel;
    dbgridhistfunc: TwwDBGrid;
    TabSheet2: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    wwDBEdit1: TwwDBEdit;
    Label2: TLabel;
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
