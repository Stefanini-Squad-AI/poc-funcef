unit FWizard;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjudaImob, ExtCtrls, fcLabel, ComCtrls, StdCtrls, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97;

type
  TfrmWizard = class(TfrmSairAjudaImob)
    lblTitulo: TfcLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWizard: TfrmWizard;

implementation

{$R *.DFM}

end.
