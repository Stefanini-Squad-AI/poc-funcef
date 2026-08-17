unit FExecApuraOrcMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ComCtrls, StdCtrls, Mask, wwdbedit, Wwdbspin, ExtCtrls,
  wwdblook, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97;

type
  TFrmExecApuraOrcMT = class(TfrmOkCancelar)
    lblExercicio: TLabel;
    dblkExercicio: TwwDBLookupCombo;
    dblkPeriodo: TwwDBLookupCombo;
    lblPeriodo: TLabel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel2: TBevel;
    Label3: TLabel;
    wwDBLookupCombo1: TwwDBLookupCombo;
    Label4: TLabel;
    sePosIni1: TwwDBSpinEdit;
    sePosFim1: TwwDBSpinEdit;
    edConteudo1: TEdit;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    pbAguarde: TProgressBar;
    edtStatus: TEdit;
    wwDBLookupCombo2: TwwDBLookupCombo;
    Label13: TLabel;
    wwDBLookupCombo3: TwwDBLookupCombo;
    Label14: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmExecApuraOrcMT: TFrmExecApuraOrcMT;

implementation

{$R *.DFM}

end.
