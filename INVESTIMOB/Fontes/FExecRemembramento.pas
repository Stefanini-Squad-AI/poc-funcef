unit FExecRemembramento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, Grids, Wwdbigrd, Wwdbgrid, fcButton,
  fcImgBtn, fcShapeBtn, wwdbdatetimepicker, CMDateTimePicker, Mask,
  wwdbedit, Wwdbspin, wwdblook, fcLabel;

type
  TfrmExecRemembramento = class(TFrmSairAjudaImob)
    lblTitulo: TfcLabel;
    ntbPrincipal: TNotebook;
    btnContinuaSelecao: TfcShapeBtn;
    Panel3: TPanel;
    lblProgress: TLabel;
    ProgressBar: TProgressBar;
    lblContador: TLabel;
    Panel1: TPanel;
    wwDBGrid1: TwwDBGrid;
    Panel2: TPanel;
    wwDBGrid3: TwwDBGrid;
    btnCancelaLanc: TfcShapeBtn;
    btnContinuaLanc: TfcShapeBtn;
    btnInsert: TfcShapeBtn;
    btnExclui: TfcShapeBtn;
    btnTrazer: TfcShapeBtn;
    btnTotaliza: TfcShapeBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExecRemembramento: TfrmExecRemembramento;

implementation

{$R *.DFM}

end.
