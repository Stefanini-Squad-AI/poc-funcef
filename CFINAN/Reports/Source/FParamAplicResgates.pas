unit FParamAplicResgates;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamReports_Padrao, CmParamReport, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, dxCntner,
  dxEditor, dxExEdtr, dxEdLib, wwdblook, ComCtrls;

type
  TFrmParamaplicResgates = class(TfrmParamReports_Padrao)
    tpPerini: TDateTimePicker;
    tpprefim: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    lkPortador: TwwDBLookupCombo;
    Label3: TLabel;
    rgFiltro: TRadioGroup;
    lkBanco: TwwDBLookupCombo;
    lkAgencia: TwwDBLookupCombo;
    lkContacorr: TwwDBLookupCombo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmParamaplicResgates: TFrmParamaplicResgates;

implementation

{$R *.DFM}

end.
