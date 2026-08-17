Unit
  FCadContasOrcEmLoteMT;

Interface

Uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, StdCtrls, ComCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97, ExtCtrls, Mask, wwdbedit, Wwdbspin,
  CMProcuraMask, wwdblook, Wwdotdot, Wwdbcomb;

Type
  TfrmCadContasOrcEmLoteMT = class(TfrmSairAjuda)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    edtCodigoConta: TEdit;
    lblCodigoConta: TLabel;
    bbtnBuscaConta: TBitBtn;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    sePosIni1: TwwDBSpinEdit;
    sePosIni2: TwwDBSpinEdit;
    sePosIni3: TwwDBSpinEdit;
    sePosIni4: TwwDBSpinEdit;
    Label7: TLabel;
    sePosFim1: TwwDBSpinEdit;
    sePosFim2: TwwDBSpinEdit;
    sePosFim3: TwwDBSpinEdit;
    sePosFim4: TwwDBSpinEdit;
    Label8: TLabel;
    Label9: TLabel;
    edConteudo1: TEdit;
    edConteudo2: TEdit;
    edConteudo3: TEdit;
    edConteudo4: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    dbcboTipoCalcReal: TwwDBComboBox;
    wwDBComboBox1: TwwDBComboBox;
    wwDBComboBox2: TwwDBComboBox;
    wwDBComboBox3: TwwDBComboBox;
    wwDBComboBox4: TwwDBComboBox;
    Label2: TLabel;
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Label6: TLabel;
    Label13: TLabel;
    lblPlanoPrevDes: TLabel;
    lblPatroDes: TLabel;
    dbeGrupo: TCMProcuraMask;
    dblkCCusto: TwwDBLookupCombo;
    dblkAtivProj: TwwDBLookupCombo;
    dblkPlanoPrev: TwwDBLookupCombo;
    dblkPatro: TwwDBLookupCombo;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    CMProcuraMask1: TCMProcuraMask;
    wwDBLookupCombo1: TwwDBLookupCombo;
    wwDBLookupCombo2: TwwDBLookupCombo;
    wwDBLookupCombo3: TwwDBLookupCombo;
    wwDBLookupCombo4: TwwDBLookupCombo;
    Label12: TLabel;
    Label14: TLabel;
  Private
    { Private declarations }
  Public
    { Public declarations }
  End;

Var
  frmCadContasOrcEmLoteMT: TfrmCadContasOrcEmLoteMT;

Implementation

{$R *.DFM}

End.
