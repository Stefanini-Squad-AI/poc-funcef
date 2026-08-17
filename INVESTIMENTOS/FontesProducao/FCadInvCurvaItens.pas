unit FCadInvCurvaItens;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, Wwdatsrc, StdCtrls, fcButton, fcImgBtn, fcShapeBtn,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  TB97Ctls;

type
  TfrmCadInvCurvaItens = class(TfrmOkCancelar)
    Panel1: TPanel;
    IvExtendedTranslator1: TIvExtendedTranslator;
    dsItens: TwwDataSource;
    dstipooper: TwwDataSource;
    Label2: TLabel;
    ComboBox3: TComboBox;
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    fcShapeBtn1: TfcShapeBtn;
    ListBox2: TListBox;
    fcShapeBtn2: TfcShapeBtn;
    GroupBox2: TGroupBox;
    ComboBox2: TComboBox;
    ListBox1: TListBox;
    ComboBox5: TComboBox;
    Label1: TLabel;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnInserir: TToolbarButton97;
    sbtnAlterar: TToolbarButton97;
    sbtnProcurar: TToolbarButton97;
    sbtnApagar: TToolbarButton97;
    fcShapeBtn3: TfcShapeBtn;
    fcShapeBtn4: TfcShapeBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadInvCurvaItens: TfrmCadInvCurvaItens;

implementation

{$R *.DFM}

end.
